view: chai_card_chai_prod_public_payment {
  sql_table_name: chai_card_chai_prod_public.payment ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
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

  dimension: canceled_cash_amount {
    type: number
    sql: ${TABLE}.canceled_cash_amount ;;
  }

  dimension: canceled_cashback_amount {
    type: number
    sql: ${TABLE}.canceled_cashback_amount ;;
  }

  dimension: canceled_discount_amount {
    type: number
    sql: ${TABLE}.canceled_discount_amount ;;
  }

  dimension: canceled_point_amount {
    type: number
    sql: ${TABLE}.canceled_point_amount ;;
  }

  dimension: cash_amount {
    type: number
    sql: ${TABLE}.cash_amount ;;
  }

  dimension: cashback_amount {
    type: number
    sql: ${TABLE}.cashback_amount ;;
  }

  dimension: charging_amount {
    type: number
    sql: ${TABLE}.charging_amount ;;
  }

  dimension: checkout_amount {
    type: number
    sql: ${TABLE}.checkout_amount ;;
  }

  dimension: coupon_id {
    type: string
    sql: ${TABLE}.coupon_id ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension: data {
    type: string
    sql: ${TABLE}.data ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: discount_amount {
    type: number
    sql: ${TABLE}.discount_amount ;;
  }

  dimension: idempotency_key {
    type: string
    sql: ${TABLE}.idempotency_key ;;
  }

  dimension: merchant_cashback_amount {
    type: number
    sql: ${TABLE}.merchant_cashback_amount ;;
  }

  dimension: merchant_discount_amount {
    type: number
    sql: ${TABLE}.merchant_discount_amount ;;
  }

  dimension: merchant_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.merchant_id ;;
  }

  dimension: month {
    type: number
    sql: ${TABLE}.month ;;
  }

  dimension: point_amount {
    type: number
    sql: ${TABLE}.point_amount ;;
  }

  dimension: return_url {
    type: string
    sql: ${TABLE}.return_url ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: sub_merchant_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.sub_merchant_id ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.updated_at ;;
  }

  dimension: user_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  dimension: version {
    type: number
    sql: ${TABLE}.version ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      merchant.id,
      merchant.name,
      merchant.representative_name,
      merchant.display_name,
      merchant.global_name,
      merchant.group_name,
      user.id,
      sub_merchant.id,
      sub_merchant.name,
      boost.count,
      boost_budget_usage_history.count,
      boost_feedback.count,
      boost_gov_support_history.count,
      boost_report.count,
      burning.count,
      card_payment_data.count,
      delayed_cashback_history.count,
      lucky.count,
      network_cancel.count,
      nice.count,
      payment_cashbacks_promotion_policy.count,
      payment_data.count,
      payment_link.count,
      payment_subscription_mapping.count,
      payment_tag_payment_mapping.count,
      promotion_coupon.count,
      settlement_payments_payment.count
    ]
  }
}
