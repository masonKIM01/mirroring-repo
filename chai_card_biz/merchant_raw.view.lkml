view: merchant_raw {
  derived_table: {
    sql: select
      date(p.created_at), m.name, a.merchant_name, bpp.sub_title, bpp.title, p.idempotency_key, a.card_approval_no,
      p.checkout_amount,
      case when bpp.sub_title is null then 0 else p.checkout_amount end as boost_tx,
      p.cashback_amount,
      case when p.created_at <= '2021-10-14 23:59:59.999' then p2.ad_spend else bh.ad_spend end as ad_spend,
      case when p.created_at <= '2021-10-14 23:59:59.999' then p2.chai_credit else bh.chai_credit end as chai_spend
      from raw_rds_production.payment p
      left join analytics_production.analytics_payment p2 on p.id = p2.id
      left join raw_rds_production.boost_budget_usage_history bh on bh.payment_id = p.id
      left join raw_rds_production.merchant m on p.merchant_id = m.id
      left join raw_rds_production.boost b on b.payment_id = p.id
      left join raw_rds_production.boost_promotion_policy bpp on bpp.id = b.boost_promotion_id
      left join raw_rds_production.approval a on a.payment_id = p.id
      where p.status = 'confirmed'
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: total_checkout_amount {
    type: sum
    sql: ${checkout_amount}  ;;
  }

  measure: total_boost_tx {
    type: sum
    sql: ${boost_tx}  ;;
  }

  measure: total_ad_spend {
    type: sum
    sql: ${ad_spend}  ;;
  }

  measure: total_chai_spend {
    type: sum
    sql: ${chai_spend}  ;;
  }

  measure: total_cashback {
    type: sum
    sql: ${cashback_amount}  ;;
  }

  measure: tx_count {
    type: count
    sql: ${idempotency_key}  ;;
  }

  measure: boost_count {
    type: count
    sql: ${sub_title} ;;
  }

  dimension: date {
    type: date
    sql: ${TABLE}.date ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: merchant_name {
    type: string
    sql: ${TABLE}.merchant_name ;;
  }

  dimension: sub_title {
    type: string
    sql: ${TABLE}.sub_title ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: idempotency_key {
    type: string
    sql: ${TABLE}.idempotency_key ;;
  }

  dimension: card_approval_no {
    type: string
    sql: ${TABLE}.card_approval_no ;;
  }

  dimension: checkout_amount {
    type: number
    sql: ${TABLE}.checkout_amount ;;
  }

  dimension: boost_tx {
    type: number
    sql: ${TABLE}.boost_tx ;;
  }

  dimension: cashback_amount {
    type: number
    sql: ${TABLE}.cashback_amount ;;
  }

  dimension: ad_spend {
    type: number
    sql: ${TABLE}.ad_spend ;;
  }

  dimension: chai_spend {
    type: number
    sql: ${TABLE}.chai_spend ;;
  }

  set: detail {
    fields: [
      date,
      name,
      merchant_name,
      sub_title,
      title,
      idempotency_key,
      card_approval_no,
      checkout_amount,
      boost_tx,
      cashback_amount,
      ad_spend,
      chai_spend
    ]
  }
}
