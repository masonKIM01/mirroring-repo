view: card_payment {
  derived_table: {
    sql: select
      p.*,
      m.name,
      b.id as boost_id,
      bpp.sub_title,
      bpp.title,
      bh.ad_spend,
      bh.chai_credit as chai_spend
      from raw_rds_production.payment p
      left join raw_rds_production.merchant m on m.id = p.merchant_id
      left join raw_rds_production.boost b on b.payment_id = p.id
      left join raw_rds_production.boost_promotion_policy bpp on bpp.id = b.boost_promotion_id
      left join raw_rds_production.boost_budget_usage_history bh on bh.payment_id = p.id
      where m.name = '차이카드'
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: transactions {
    type: count_distinct
    sql: ${id} ;;
  }

  measure: active_user {
    type: count_distinct
    sql: ${user_id} ;;
  }

  measure: boost_transactions {
    type: count_distinct
    sql: ${boost_id} ;;
  }

  measure: total_checkout_amount {
    type: sum
    value_format: "#,##0"
    sql: coalesce(${checkout_amount},0) ;;
  }

  measure: total_canceled_amount {
    type: sum
    value_format: "#,##0"
    sql: coalesce(${canceled_amount},0) ;;
  }

  measure: total_cashback_amount {
    type: sum
    value_format: "#,##0"
    sql: coalesce(${cashback_amount},0) ;;
  }

  measure: total_ad_spend {
    type: sum
    value_format: "#,##0"
    sql: coalesce(${ad_spend},0) ;;
  }

  measure: total_chai_spend {
    type: sum
    value_format: "#,##0"
    sql: coalesce(${chai_spend},0) ;;
  }

  measure: total_boost_tx {
    type: sum
    value_format: "#,##0"
    sql: case when ${TABLE}.boost_id is not null then ${checkout_amount} end ;;
  }

  dimension: id {
    type: string
    primary_key: yes
    sql: ${TABLE}.id ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: checkout_amount {
    type: number
    sql: ${TABLE}.checkout_amount ;;
  }

  dimension: canceled_amount {
    type: number
    sql: ${TABLE}.canceled_amount ;;
  }

  dimension_group: created_at {
    type: time
    sql: ${TABLE}.created_at ;;
  }

  dimension: total_chai_cost {
    type: number
    sql: ${TABLE}.total_chai_cost ;;
  }

  dimension: total_promotion_amount {
    type: number
    sql: ${TABLE}.total_promotion_amount ;;
  }

  dimension: merchant_id {
    type: string
    sql: ${TABLE}.merchant_id ;;
  }

  dimension: idempotency_key {
    type: string
    sql: ${TABLE}.idempotency_key ;;
  }

  dimension: cashback_amount {
    type: number
    sql: ${TABLE}.cashback_amount ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: boost_id {
    type: number
    sql: ${TABLE}.boost_id ;;
  }

  dimension: sub_title {
    type: string
    sql: ${TABLE}.sub_title ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
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
      id,
      status,
      user_id,
      checkout_amount,
      canceled_amount,
      created_at_time,
      total_chai_cost,
      total_promotion_amount,
      merchant_id,
      idempotency_key,
      cashback_amount,
      name,
      boost_id,
      sub_title,
      title,
      ad_spend,
      chai_spend
    ]
  }
}
