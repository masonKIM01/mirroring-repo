view: premart_staging_payment__add_reward {
  derived_table: {
    sql: SELECT p.* from raw_rds_production.payment p
    inner join raw_rds_production.card_payment_data cp on cp.payment_id = p.id
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: total_checkout_amount {
    type: sum
    value_format: "0"
    sql: COALESCE(${checkout_amount},0) ;;
  }

  measure: total_cashback_amount {
    type: sum
    value_format: "0"
    sql: COALESCE(${cashback_amount},0) ;;
  }

  measure: total_canceled_amount {
    type: sum
    value_format: "0"
    sql: COALESCE(${canceled_amount},0) ;;
  }

  measure: total_ad_spend {
  type: sum
  value_format: "0"
  sql: COALESCE(${ad_spend},0) ;;
}

  measure: total_chai_spend {
    type: sum
    value_format: "0"
    sql: COALESCE(${chai_spend},0) ;;
  }

  dimension: billing_amount {
    type: number
    sql: ${TABLE}.billing_amount ;;
  }

  dimension: canceled_amount {
    type: number
    sql: ${TABLE}.canceled_amount ;;
  }

  dimension: canceled_billing_amount {
    type: number
    sql: ${TABLE}.canceled_billing_amount ;;
  }

  dimension: canceled_cashback_amount {
    type: number
    sql: ${TABLE}.canceled_cashback_amount ;;
  }

  dimension: canceled_cash_amount {
    type: number
    sql: ${TABLE}.canceled_cash_amount ;;
  }

  dimension: canceled_discount_amount {
    type: number
    sql: ${TABLE}.canceled_discount_amount ;;
  }

  dimension: canceled_point_amount {
    type: number
    sql: ${TABLE}.canceled_point_amount ;;
  }

  dimension: cashback_amount {
    type: number
    sql: ${TABLE}.cashback_amount ;;
  }

  dimension: cash_amount {
    type: number
    sql: ${TABLE}.cash_amount ;;
  }

  dimension: charging_amount {
    type: number
    sql: ${TABLE}.charging_amount ;;
  }

  dimension: checkout_amount {
    type: number
    sql: ${TABLE}.checkout_amount ;;
  }

  dimension_group: created_at {
    type: time
    sql: ${TABLE}.created_at ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension: discount_amount {
    type: number
    sql: ${TABLE}.discount_amount ;;
  }

  dimension: idempotency_key {
    type: string
    sql: ${TABLE}.idempotency_key ;;
  }

  dimension: id {
    type: string
    primary_key: yes
    sql: ${TABLE}.id ;;
  }

  dimension: merchant_id {
    type: string
    sql: ${TABLE}.merchant_id ;;
  }

  dimension: merchant_name {
    type: string
    sql: ${TABLE}.merchant_name ;;
  }

  dimension: point_amount {
    type: number
    sql: ${TABLE}.point_amount ;;
  }

  dimension_group: updated_at {
    type: time
    sql: ${TABLE}.updated_at ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: customer_id {
    type: string
    sql: ${TABLE}.customer_id ;;
  }

  dimension: merchant_ratio {
    type: number
    sql: ${TABLE}.merchant_ratio ;;
  }

  dimension: merchant_discount_amount {
    type: number
    sql: ${TABLE}.merchant_discount_amount ;;
  }

  dimension: merchant_cashback_amount {
    type: number
    sql: ${TABLE}.merchant_cashback_amount ;;
  }

  dimension: total_merchant_cashback_amount {
    type: number
    sql: ${TABLE}.total_merchant_cashback_amount ;;
  }

  dimension: bank {
    type: string
    sql: ${TABLE}.bank ;;
  }

  dimension: is_first_transaction {
    type: string
    sql: ${TABLE}.is_first_transaction ;;
  }

  dimension: is_first_transaction_merchant {
    type: string
    sql: ${TABLE}.is_first_transaction_merchant ;;
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
      billing_amount,
      canceled_amount,
      canceled_billing_amount,
      canceled_cashback_amount,
      canceled_cash_amount,
      canceled_discount_amount,
      canceled_point_amount,
      cashback_amount,
      cash_amount,
      charging_amount,
      checkout_amount,
      created_at_time,
      currency,
      discount_amount,
      idempotency_key,
      id,
      merchant_id,
      merchant_name,
      point_amount,
      updated_at_time,
      status,
      customer_id,
      merchant_ratio,
      merchant_discount_amount,
      merchant_cashback_amount,
      total_merchant_cashback_amount,
      bank,
      is_first_transaction,
      is_first_transaction_merchant,
      ad_spend,
      chai_spend
    ]
  }
}
