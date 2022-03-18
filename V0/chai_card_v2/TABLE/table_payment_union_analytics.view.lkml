view: table_payment_union_analytics {
  derived_table: {
    sql: select
      to_char(created_at, 'yyyy-mm-01') as months, id, status, checkout_amount, canceled_amount, created_at, cashback_amount, ad_spend, chai_credit, merchant_id, idempotency_key, customer_id as user_id
      from analytics_deprecated.payment
      where created_at <= '2021-10-14 23:59:59.999'
      union all
      select
      to_char(created_at, 'yyyy-mm-01') as months, id, status, checkout_amount, canceled_amount, created_at, cashback_amount, 0 as ad_spend, 0 as chai_credit, merchant_id, idempotency_key, user_id
      from chai_card_chai_prod_public.payment
      where created_at > '2021-10-15'
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: transactions  {
    type: count_distinct
    sql: ${TABLE}.id ;;
  }

  measure: total_checkout_amount  {
    type: sum
    sql: ${TABLE}.checkout_amount ;;
  }

  measure: total_cashback_amount  {
    type: sum
    sql: ${TABLE}.cashback_amount ;;
  }

  measure: total_ad_spend  {
    type: sum
    sql: ${TABLE}.ad_spend ;;
  }

  measure: total_chai_credit  {
    type: sum
    sql: ${TABLE}.chai_credit ;;
  }

  measure: total_users  {
    type: count_distinct
    sql: ${TABLE}.user_id ;;
  }

  dimension: months {
    type: string
    sql: ${TABLE}.months ;;
  }

  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
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

  dimension: cashback_amount {
    type: number
    sql: ${TABLE}.cashback_amount ;;
  }

  dimension: ad_spend {
    type: number
    sql: ${TABLE}.ad_spend ;;
  }

  dimension: chai_credit {
    type: number
    sql: ${TABLE}.chai_credit ;;
  }

  dimension: merchant_id {
    type: string
    sql: ${TABLE}.merchant_id ;;
  }

  dimension: idempotency_key {
    type: string
    sql: ${TABLE}.idempotency_key ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  set: detail {
    fields: [
      months,
      id,
      status,
      checkout_amount,
      canceled_amount,
      created_at_time,
      cashback_amount,
      ad_spend,
      chai_credit,
      merchant_id,
      idempotency_key,
      user_id
    ]
  }
}
