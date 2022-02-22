view: querylibrary {
  derived_table: {
    sql: select
      case when m.name = '차이 신용카드' then 'credit_card'
      when m.name = '차이 체크카드' then 'check_card'
      else 'ewallet' end as payment_type ,
      p.year,
      p.month,
      p.status,
      to_char(p.created_at,'yyyy-mm-dd HH24:MM:SS')::date as date,
      p.id as payment_id,
      b.payment_id as boost_id,
      p.user_id,
      case when m.name not like ('%카드%') then m.name
      else split_part(split_part(p.data,'cardMerchantName":',2),'"',2) end
      as merchantName,
      b2.name as boostName,
      case when bpp.type = 'standard' then '일반'
      else '선착순' end as boost_type,
      p.idempotency_key,
      split_part(split_part(p.data,'approvalNo":',2),'"',2) as cardApporovalNo,
      coalesce(case when ad.type = 'cps' then ad.unit_price
            when ad.type = 'ratio' then ad.ratio * 0.01 * p.cashback_amount
            when ad.type = 'cpa' then ad.unit_price * 0.5
            end,0) as adSpend,
      p.cashback_amount + coalesce(ch.cashback_delta,0) as cashback_amount,
      p.cashback_amount + coalesce(ch.cashback_delta,0) -
      coalesce(case when ad.type = 'cps' then ad.unit_price
            when ad.type = 'ratio' then ad.ratio * 0.01 * p.cashback_amount
            when ad.type = 'cpa' then ad.unit_price * 0.5
            end,0) as chaiCredit,
      p.checkout_amount as checkout_amount,
      coalesce(case when b.payment_id is not null then p.checkout_amount end,0) as boostCheckout_amount
      from chai_card_chai_prod_public.payment p
      left join chai_card_chai_prod_public.merchant m on m.id = p.merchant_id
      left join chai_card_chai_prod_public.boost b on b.payment_id = p.id
      left join chai_card_chai_prod_public.boost_promotion_policy bpp on bpp.id = b.boost_promotion_id
      left join chai_card_chai_prod_public.brand b2 on b2.id = bpp.brand_id
      left join chai_card_chai_prod_public.delayed_cashback_history ch on ch.payment_id = p.id
      left join chai_card_chai_prod_public.boost_campaign_ad_spend ad on ad.boost_campaign_id = b.boost_campaign_id
        and (case when ad.end_at is not null then b.created_at between ad.start_at and ad.end_at
        when ad.end_at is null then ad.start_at <= b.created_at end)
      where p.status = 'confirmed'
      and p.year = 2022
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
    sql: ${TABLE}.chai_credit ;;
  }

  measure: users {
    type: count_distinct
    sql: ${TABLE}.user_id  ;;
  }

  measure: boost {}
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

  dimension: date {
    type: date
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

  dimension: boostname {
    type: string
    sql: ${TABLE}.boostname ;;
  }

  dimension: boost_type {
    type: string
    sql: ${TABLE}.boost_type ;;
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
      date,
      payment_id,
      boost_id,
      user_id,
      merchantname,
      boostname,
      boost_type,
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
