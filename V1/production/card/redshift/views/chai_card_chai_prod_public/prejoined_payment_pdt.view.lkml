include: "../../explore_for_pdt/**.**.lkml"

view: prejoined_payment_pdt {
  derived_table: {
    datagroup_trigger: daily_datagroup
    distribution_style: all
    increment_key: "payment_created_date"
    increment_offset:  7
    explore_source: prejoined_payment {
      column: payment_checkout_amount { field: prejoined_payment.checkout_amount }
      column: payment_charging_amount { field: prejoined_payment.charging_amount }
      column: payment_cashback_amount { field: prejoined_payment.cashback_amount }
      column: payment_billing_amount { field: prejoined_payment.billing_amount }
      column: payment_canceled_amount { field: prejoined_payment.canceled_amount }
      column: payment_created_date { field: prejoined_payment.created_date }
      column: payment_created { field: prejoined_payment.created_raw }
      column: payment_data { field: prejoined_payment.data }
      column: payment_discount_amount { field: prejoined_payment.discount_amount }
      column: merchant_cashback_amount {}
      column: merchant_discount_amount {}
      column: merchant_data { field: chai_card_chai_prod_public_merchant.data }
      column: merchant_name { field: chai_card_chai_prod_public_merchant.name }
      column: merchant_status { field: chai_card_chai_prod_public_merchant.status }
      column: merchant_type { field: chai_card_chai_prod_public_merchant.type }
      column: brand_name { field: chai_card_chai_prod_public_brand.name }
      column: boost_promotion_policy_description { field: chai_card_chai_prod_public_boost_promotion_policy.description }
      column: boost_promotion_policy_usable_from { field: chai_card_chai_prod_public_boost_promotion_policy.usable_from_raw }
      column: boost_promotion_policy_usable_to { field: chai_card_chai_prod_public_boost_promotion_policy.usable_to_raw }
      column: boost_promotion_policy_type { field: chai_card_chai_prod_public_boost_promotion_policy.type }
      column: boost_promotion_policy_status { field: chai_card_chai_prod_public_boost_promotion_policy.status }
      column: boost_promotion_policy_count_cap { field: chai_card_chai_prod_public_boost_promotion_policy.count_cap }
      column: boost_promotion_policy_count_cap_per_user { field: chai_card_chai_prod_public_boost_promotion_policy.count_cap_per_user }
      column: boost_promotion_policy_brand_id { field: chai_card_chai_prod_public_boost_promotion_policy.brand_id }
      column: boost_promotion_policy_promotion_id { field: chai_card_chai_prod_public_boost_promotion_policy.promotion_id }
      column: boost_id { field: chai_card_chai_prod_public_boost.id }
      column: boost_usable_from { field: chai_card_chai_prod_public_boost.usable_from_raw }
      column: boost_usable_to { field: chai_card_chai_prod_public_boost.usable_to_raw }
      column: boost_status { field: chai_card_chai_prod_public_boost.status }
    }
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
      time,
      week,
      month
    ]
  }
  dimension: payment_data {}
  dimension: payment_discount_amount {
    type: number
  }
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
  dimension: brand_name {}
  dimension: boost_promotion_policy_description {}
  dimension_group: boost_promotion_policy_usable_from {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month
    ]
  }
  dimension_group: boost_promotion_policy_usable_to {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month
    ]
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
  dimension: boost_id {
    type: number
  }
  dimension_group: boost_usable_from {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month
    ]
  }
  dimension_group: boost_usable_to {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month
    ]
  }
  dimension: boost_status {}
}
