view: bolt_payment {
  derived_table: {
    sql: select
      p.*,
      bh.created_at as bolt_created_at,
      bh.type as bolt_type,
      bh.count,
      bh.action,
      bh.sub_title,
      bh.available_bolt
      from raw_rds_production.payment p
      left join raw_rds_production.bolt_history bh on bh.user_id = p.user_id
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: total_cashback_amount {
    type: sum
    sql: ${TABLE}.cashback_amount ;;
  }

  measure: bolt_in {
    type: sum
    sql: case when ${action} = 'accumulation' then ${bolt_count} end ;;
  }

  measure: bolt_out {
    type: sum
    sql: case when ${action} = 'deduction' then ${bolt_count} end ;;
  }

  measure: bolt_earned {
    type: sum
    sql: case when ${type} = 'payment_in' then ${bolt_count} end ;;
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

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
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

  dimension_group: bolt_created_at {
    type: time
    sql: ${TABLE}.bolt_created_at ;;
  }

  dimension: bolt_type {
    type: string
    sql: ${TABLE}.bolt_type ;;
  }

  dimension: bolt_count {
    type: number
    sql: ${TABLE}.count ;;
  }

  dimension: action {
    type: string
    sql: ${TABLE}.action ;;
  }

  dimension: sub_title {
    type: string
    sql: ${TABLE}.sub_title ;;
  }

  dimension: available_bolt {
    type: number
    sql: ${TABLE}.available_bolt ;;
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
      user_id,
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
      version,
      bolt_created_at_time,
      bolt_type,
      bolt_count,
      action,
      sub_title,
      available_bolt
    ]
  }
}
