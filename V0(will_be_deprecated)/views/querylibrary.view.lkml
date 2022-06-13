view: querylibrary {
  derived_table: {
    sql:
      SELECT
        CASE WHEN m.NAME = '차이 신용카드' THEN 'credit_card' WHEN m.NAME = '차이 체크카드' THEN 'check_card' ELSE 'ewallet' END AS payment_type,
        p.year,
        p.month,
        p.status,
        p.created_at AS date,
        p.id AS payment_id,
        b.payment_id AS boost_id,
        p.user_id,
        CASE WHEN m.NAME NOT LIKE ('%카드%') THEN m.NAME ELSE SPLIT_PART(
          SPLIT_PART(p.data, 'cardMerchantName":', 2),
          '"',
          2
        ) END AS merchantName,
        SPLIT_PART(
          SPLIT_PART(p.data, 'cardMerchantId":', 2),
          '"',
          2
        ) AS merchantId,
        b2.NAME AS boostName,
        CASE WHEN bpp.type = 'standard' THEN '일반' WHEN bpp.type = 'fcfs' THEN '선착순' ELSE '' END AS boost_type,
        bpp.sub_title,
        bpp.title,
        ad.type,
        p.idempotency_key,
        Split_part(
          Split_part(p.data, 'approvalNo":', 2),
          '"',
          2
        ) AS cardApporovalNo,
        COALESCE(
          CASE WHEN ad.type = 'cps' THEN ad.unit_price WHEN ad.type = 'ratio'
          AND ad.ratio > 1 THEN ad.ratio * 0.01 * (
            p.cashback_amount + COALESCE(ch.cashback_delta, 0) - COALESCE(up.cashback_up, 0)
          ) WHEN ad.type = 'ratio'
          AND ad.ratio < 1 THEN ad.ratio * (
            p.cashback_amount + COALESCE(ch.cashback_delta, 0) - COALESCE(up.cashback_up, 0)
          ) WHEN ad.type = 'cpa' THEN ad.unit_price * 0.5 END,
          0
        ) AS adSpend,
        p.cashback_amount + COALESCE(ch.cashback_delta, 0) AS cashback_amount,
        p.cashback_amount + COALESCE(ch.cashback_delta, 0) - COALESCE(
          CASE WHEN ad.type = 'cps' THEN ad.unit_price WHEN ad.type = 'ratio'
          AND ad.ratio > 1 THEN ad.ratio * 0.01 * (
            p.cashback_amount + COALESCE(ch.cashback_delta, 0) - COALESCE(up.cashback_up, 0)
          ) WHEN ad.type = 'ratio'
          AND ad.ratio < 1 THEN ad.ratio * (
            p.cashback_amount + COALESCE(ch.cashback_delta, 0) - COALESCE(up.cashback_up, 0)
          ) WHEN ad.type = 'cpa' THEN ad.unit_price * 0.5 END,
          0
        ) AS chaiCredit,
        p.checkout_amount AS checkout_amount,
        COALESCE(
          CASE WHEN b.payment_id IS NOT NULL THEN p.checkout_amount END,
          0
        ) AS boostCheckout_amount
      FROM
        chai_card_chai_prod_public.payment p
        LEFT JOIN chai_card_chai_prod_public.merchant m ON m.id = p.merchant_id
        LEFT JOIN chai_card_chai_prod_public.boost b ON b.payment_id = p.id
        LEFT JOIN chai_card_chai_prod_public.boost_promotion_policy bpp ON bpp.id = b.boost_promotion_id
        LEFT JOIN chai_card_chai_prod_public.brand b2 ON b2.id = bpp.brand_id
        LEFT JOIN (
          SELECT
            DISTINCT year,
            month,
            created_at,
            payment_id,
            Sum(cashback_delta) AS cashback_delta
          FROM
            (
              SELECT
                id,
                year,
                month,
                created_at,
                cashback_delta,
                payment_id,
                action_type,
                Count(action_type) OVER (partition BY payment_id) AS cnt
              FROM
                chai_card_chai_prod_public.delayed_cashback_history
              GROUP BY
                1,
                2,
                3,
                4,
                5,
                6,
                7
            ) AS delayed_cashback_history
          WHERE
            delayed_cashback_history.cnt = 1
          GROUP BY
            1,
            2,
            3,
            4
        ) ch ON ch.payment_id = p.id
        LEFT JOIN (
          SELECT
            b.payment_id,
            ad.type,
            unit_price,
            ratio,
            b.year,
            b.month
          FROM
            chai_card_chai_prod_public.boost b
            INNER JOIN chai_card_chai_prod_public.boost_campaign_ad_spend ad ON (
              ad.boost_campaign_id = b.boost_campaign_id
              AND CASE WHEN ad.end_at IS NOT NULL THEN b.created_at BETWEEN ad.start_at
              AND ad.end_at WHEN ad.end_at IS NULL THEN b.created_at >= ad.start_at END
            )
          WHERE
            b.year = '2022'
        ) ad ON ad.payment_id = p.id
        LEFT JOIN (
          SELECT
            up.boost_id,
            SUM(up.cashback_amount) AS cashback_up
          FROM
            chai_card_chai_prod_public.boost_up up
          GROUP BY
            1
        ) up ON up.boost_id = b.id
      WHERE
        p.status = 'confirmed'
        AND p.year IN (2021, 2022)
           ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: total_checkout_amount {
    type: sum
    sql: ${TABLE}.checkout_amount ;;
  }

  measure: total_boost_checkout_amount {
    type: sum
    sql: ${TABLE}.boostCheckout_amount ;;
  }

  measure: total_cashback {
    type: sum
    sql: ${TABLE}.cashback_amount ;;
  }

  measure: total_ad_spend {
    type: sum
    sql: ${TABLE}.adspend ;;
  }

  measure: total_chai_credit {
    type: sum
    sql: ${TABLE}.chaiCredit ;;
  }

  measure: users {
    type: count_distinct
    sql: ${TABLE}.user_id  ;;
  }

  measure: boost {
    type: count_distinct
    sql: ${TABLE}.boost_id ;;
  }

  dimension: payment_type {
    type: string
    sql: ${TABLE}.payment_type ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }

  dimension: month {
    type: number
    sql: ${TABLE}.month ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension_group: date {
    type: time
    sql: ${TABLE}.date ;;
  }

  dimension: payment_id {
    type: string
    sql: ${TABLE}.payment_id ;;
  }

  dimension: boost_id {
    type: string
    sql: ${TABLE}.boost_id ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: merchantname {
    type: string
    sql: ${TABLE}.merchantname ;;
  }

  dimension: merchantId {
    type: string
    sql: ${TABLE}.merchantId ;;
  }

  dimension: boostname {
    type: string
    sql: ${TABLE}.boostname ;;
  }

  dimension: boost_title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: boost_sub_title {
    type: string
    sql: ${TABLE}.sub_title ;;
  }

  dimension: boost_type {
    type: string
    sql: ${TABLE}.boost_type ;;
  }

  dimension: ad_type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: idempotency_key {
    type: string
    sql: ${TABLE}.idempotency_key ;;
  }

  dimension: cardapporovalno {
    type: string
    sql: ${TABLE}.cardapporovalno ;;
  }

  dimension: adspend {
    type: number
    sql: ${TABLE}.adspend ;;
  }

  dimension: cashback_amount {
    type: number
    sql: ${TABLE}.cashback_amount ;;
  }

  dimension: chaicredit {
    type: number
    sql: ${TABLE}.chaicredit ;;
  }

  dimension: checkout_amount {
    type: number
    sql: ${TABLE}.checkout_amount ;;
  }

  dimension: boostcheckout_amount {
    type: number
    sql: ${TABLE}.boostcheckout_amount ;;
  }

  set: detail {
    fields: [
      payment_type,
      year,
      month,
      status,
      date_date,
      payment_id,
      boost_id,
      user_id,
      merchantname,
      merchantId,
      boostname,
      boost_type,
      boost_sub_title,
      boost_title,
      ad_type,
      idempotency_key,
      cardapporovalno,
      adspend,
      cashback_amount,
      chaicredit,
      checkout_amount,
      boostcheckout_amount
    ]
  }
}
