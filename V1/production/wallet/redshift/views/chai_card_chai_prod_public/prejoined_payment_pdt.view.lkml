include: "../../explore_for_pdt/**.**.lkml"

view: prejoined_payment_pdt {
  derived_table: {
    datagroup_trigger: daily_datagroup
    distribution_style: all
    increment_key: "payment_created_date"
    increment_offset:  7
    explore_source: prejoined_payment {
      column: payment_id { field: prejoined_payment.id }
      column: payment_user_id { field: prejoined_payment.user_id }
      column: payment_checkout_amount { field: prejoined_payment.checkout_amount }
      column: payment_charging_amount { field: prejoined_payment.charging_amount }
      column: payment_cashback_amount { field: prejoined_payment.cashback_amount }
      column: payment_billing_amount { field: prejoined_payment.billing_amount }
      column: payment_canceled_amount { field: prejoined_payment.canceled_amount }
      column: payment_created_date { field: prejoined_payment.created_date }
      column: payment_created { field: prejoined_payment.created_raw }
      column: payment_data { field: prejoined_payment.data }
      column: payment_status { field: prejoined_payment.status }
      column: payment_discount_amount { field: prejoined_payment.discount_amount }
      column: payment_year { field: prejoined_payment.year }
      column: payment_month { field: prejoined_payment.month }
      column: merchant_cashback_amount {}
      column: merchant_discount_amount {}
      column: merchant_data { field: chai_merchant.data }
      column: merchant_name { field: chai_merchant.name }
      column: merchant_status { field: chai_merchant.status }
      column: merchant_type { field: chai_merchant.type }
      column: brand_id { field: chai_brand.id }
      column: brand_name { field: chai_brand.name }
      column: boost_payment_id { field: chai_boost.payment_id }
      column: boost_promotion_policy_description { field: chai_boost_promotion_policy.description }
      column: boost_promotion_policy_usable_from { field: chai_boost_promotion_policy.usable_from_raw }
      column: boost_promotion_policy_usable_to { field: chai_boost_promotion_policy.usable_to_raw }
      column: boost_promotion_policy_type { field: chai_boost_promotion_policy.type }
      column: boost_promotion_policy_status { field: chai_boost_promotion_policy.status }
      column: boost_promotion_policy_count_cap { field: chai_boost_promotion_policy.count_cap }
      column: boost_promotion_policy_count_cap_per_user { field: chai_boost_promotion_policy.count_cap_per_user }
      column: boost_promotion_policy_brand_id { field: chai_boost_promotion_policy.brand_id }
      column: boost_promotion_policy_promotion_id { field: chai_boost_promotion_policy.promotion_id }
      column: boost_promotion_policy_promotion_type { field: chai_boost_promotion_policy.promotion_type }
      column: boost_promotion_policy_title { field: chai_boost_promotion_policy.title }
      column: boost_promotion_policy_sub_title { field: chai_boost_promotion_policy.sub_title }
      column: boost_id { field: chai_boost.id }
      column: boost_created { field: chai_boost.created_raw }
      column: boost_campagin_id { field: chai_boost.boost_campaign_id }
      column: boost_promotion_id { field: chai_boost.boost_promotion_id }
      column: boost_usable_from { field: chai_boost.usable_from_raw }
      column: boost_usable_to { field: chai_boost.usable_to_raw }
      column: boost_status { field: chai_boost.status }
    }
  }
  dimension: payment_id {
    type: string
  }
  dimension: payment_user_id {
    type: string
  }
  dimension: payment_checkout_amount {
    type: number
  }
  dimension: payment_charging_amount {
    type: number
  }
  dimension: payment_cashback_amount {
    type: number
  }
  dimension: payment_billing_amount {
    type: number
  }
  dimension: payment_canceled_amount {
    type: number
  }
  dimension: payment_created_date {
    type: date
  }
  dimension_group: payment_created {
    type: time
    timeframes: [
      raw,
      hour,
      time,
      week,
      month,
      hour_of_day
    ]
  }
  dimension: payment_data {}
  dimension: payment_status {}
  dimension: payment_discount_amount {
    type: number
  }
  dimension: payment_year {}
  dimension: payment_month {}
  dimension: merchant_cashback_amount {
    type: number
  }
  dimension: merchant_discount_amount {
    type: number
  }
  dimension: merchant_data {}
  dimension: merchant_name {}
  dimension: merchant_status {}
  dimension: merchant_type {}
  dimension: brand_id {}
  dimension: brand_name {}
  dimension: boost_payment_id {}
  dimension: boost_promotion_policy_description {}
  dimension_group: boost_promotion_policy_usable_from {
    type: time
  }
  dimension_group: boost_promotion_policy_usable_to {
    type: time
  }
  dimension: boost_promotion_policy_type {}
  dimension: boost_promotion_policy_status {}
  dimension: boost_promotion_policy_count_cap {
    type: number
  }
  dimension: boost_promotion_policy_count_cap_per_user {
    type: number
  }
  dimension: boost_promotion_policy_promotion_id {}
  dimension: boost_promotion_policy_promotion_type {}
  dimension: boost_promotion_policy_title {}
  dimension: boost_promotion_policy_sub_title {}
  dimension: boost_id {
    type: number
  }
  dimension_group: boost_created {
    type: time
  }
  dimension: boost_campaign_id {
    type: number
  }
  dimension: boost_promotion_id {
    type: number
  }
  dimension_group: boost_usable_from {
    type: time
  }
  dimension_group: boost_usable_to {
    type: time
  }
  dimension: boost_status {}

  measure: payment_count {
    description: "# of transactions"
    type: count_distinct
    sql: ${payment_id} ;;
  }

  measure: payment_users {
    description: "# of payment user"
    type: count_distinct
    sql: ${payment_user_id} ;;
  }

  measure: boost_payments_count {
    description: "# of payments that use boost"
    type: count_distinct
    sql: ${boost_payment_id};;
  }

  measure: payments_total_boost_checkout_amount {
    description: "sum of boost payments checkout amount"
    type: sum
    sql: case when ${boost_payment_id} is not null then ${payment_checkout_amount} end ;;
  }

  measure: payment_total_checkout_amount {
    type: sum
    sql: coalesce(${payment_checkout_amount},0) ;;
  }

  measure: payment_total_cashback_amount {
    type: sum
    sql: coalesce(${payment_cashback_amount},0) ;;
  }

  measure: payment_total_billing_amount {
    type: sum
    sql: coalesce(${payment_billing_amount},0) ;;
  }

  measure: payment_total_charging_amount {
    type: sum
    sql: coalesce(${payment_charging_amount},0) ;;
  }
}
