view: raw_prod_payment {
  sql_table_name: raw_rds_production.payment ;;
  drill_fields: [id]

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: total_cashback_amount {
    type: sum
    sql: ${TABLE}.cashback_amount ;;
  }

  measure: total_checkout_amount {
    type: sum
    sql: ${TABLE}.checkout_amount ;;
  }

  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: idempotency_key {
    type: string
    sql: ${TABLE}.idempotency_key ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: return_url {
    type: string
    sql: ${TABLE}.return_url ;;
  }

  dimension_group: created_at {
    type: time
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: updated_at {
    type: time
    sql: ${TABLE}.updated_at ;;
  }

  dimension: merchant_id {
    type: string
    sql: ${TABLE}.merchant_id ;;
  }

  dimension: customer_id {
    type: string
    sql: ${TABLE}.customer_id ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: data {
    type: string
    sql: ${TABLE}.data ;;
  }

  dimension: discount_amount {
    type: number
    sql: ${TABLE}.discount_amount ;;
  }

  dimension: merchant_discount_amount {
    type: number
    sql: ${TABLE}.merchant_discount_amount ;;
  }

  dimension: checkout_amount {
    type: number
    sql: ${TABLE}.checkout_amount ;;
  }

  dimension: billing_amount {
    type: number
    sql: ${TABLE}.billing_amount ;;
  }

  dimension: charging_amount {
    type: number
    sql: ${TABLE}.charging_amount ;;
  }

  dimension: canceled_amount {
    type: number
    sql: ${TABLE}.canceled_amount ;;
  }

  dimension: coupon_id {
    type: string
    sql: ${TABLE}.coupon_id ;;
  }

  dimension: canceled_billing_amount {
    type: number
    sql: ${TABLE}.canceled_billing_amount ;;
  }

  dimension: canceled_discount_amount {
    type: number
    sql: ${TABLE}.canceled_discount_amount ;;
  }

  dimension: cashback_amount {
    type: number
    sql: ${TABLE}.cashback_amount ;;
  }

  dimension: canceled_cashback_amount {
    type: number
    sql: ${TABLE}.canceled_cashback_amount ;;
  }

  dimension: sub_merchant_id {
    type: number
    sql: ${TABLE}.sub_merchant_id ;;
  }

  dimension: point_amount {
    type: number
    sql: ${TABLE}.point_amount ;;
  }

  dimension: cash_amount {
    type: number
    sql: ${TABLE}.cash_amount ;;
  }

  dimension: canceled_point_amount {
    type: number
    sql: ${TABLE}.canceled_point_amount ;;
  }

  dimension: canceled_cash_amount {
    type: number
    sql: ${TABLE}.canceled_cash_amount ;;
  }

  dimension: merchant_cashback_amount {
    type: number
    sql: ${TABLE}.merchant_cashback_amount ;;
  }

  dimension: version {
    type: number
    sql: ${TABLE}.version ;;
  }
  measure: billing_amount_sum {
    type: sum
    value_format: "0"
    sql: COALESCE(${billing_amount},0) ;;
  }
  measure: charging_amount_sum {
    type: sum
    value_format: "0"
    sql: COALESCE(${charging_amount},0) ;;
  }
  measure: customers_cnt_distinct {
    type: count_distinct
    sql: ${customer_id} ;;
  }

  set: detail {
    fields: [
      id,
      status,
      idempotency_key,
      currency,
      description,
      return_url,
      created_at_time,
      updated_at_time,
      merchant_id,
      customer_id,
      type,
      data,
      discount_amount,
      merchant_discount_amount,
      checkout_amount,
      billing_amount,
      charging_amount,
      canceled_amount,
      coupon_id,
      canceled_billing_amount,
      canceled_discount_amount,
      cashback_amount,
      canceled_cashback_amount,
      sub_merchant_id,
      point_amount,
      cash_amount,
      canceled_point_amount,
      canceled_cash_amount,
      merchant_cashback_amount,
      version
    ]
  }
}
