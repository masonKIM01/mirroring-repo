include: "../../explore_for_pdt/**.**.lkml"

view: prejoined_payment_pdt {
  derived_table: {
    # datagroup_trigger: hourly_datagroup
    # distribution_style: all
    explore_source: prejoined_payment {
      column: checkout_amount {}
      column: charging_amount {}
      column: cashback_amount {}
      column: billing_amount {}
      column: canceled_amount {}
      column: created_date { field: prejoined_payment.created_date }
      column: data { field: prejoined_payment.data }
      column: discount_amount {}
      column: merchant_cashback_amount {}
      column: merchant_discount_amount {}
      column: user_id { field: chai_card_chai_prod_public_user.id }
      column: user_birthday { field: chai_card_chai_prod_public_user.birthday }
      column: user_gender { field: chai_card_chai_prod_public_user.gender }
      column: user_data { field: chai_card_chai_prod_public_user.data }
      column: merchant_data { field: chai_card_chai_prod_public_merchant.data }
      column: merchant_name { field: chai_card_chai_prod_public_merchant.name }
      column: merchant_status { field: chai_card_chai_prod_public_merchant.status }
      column: merchant_type { field: chai_card_chai_prod_public_merchant.type }
      column: delayed_cashback_history_is_public_transportation { field: chai_card_chai_prod_public_delayed_cashback_history.is_public_transportation }
      column: delayed_cashback_history_status { field: chai_card_chai_prod_public_delayed_cashback_history.status }
      column: delayed_cashback_history_action_type { field: chai_card_chai_prod_public_delayed_cashback_history.action_type }
      column: brand_name { field: chai_card_chai_prod_public_brand.name }
      column: boost_promotion_policy_description { field: chai_card_chai_prod_public_boost_promotion_policy.description }
      column: boost_promotion_policy_usable_from_date { field: chai_card_chai_prod_public_boost_promotion_policy.usable_from_date }
      column: boost_promotion_policy_usable_to_date { field: chai_card_chai_prod_public_boost_promotion_policy.usable_to_date }
      column: boost_promotion_policy_type { field: chai_card_chai_prod_public_boost_promotion_policy.type }
      column: boost_promotion_policy_status { field: chai_card_chai_prod_public_boost_promotion_policy.status }
      column: boost_promotion_policy_count_cap { field: chai_card_chai_prod_public_boost_promotion_policy.count_cap }
      column: boost_promotion_policy_count_cap_per_user { field: chai_card_chai_prod_public_boost_promotion_policy.count_cap_per_user }
      column: boost_promotion_policy_brand_id { field: chai_card_chai_prod_public_boost_promotion_policy.brand_id }
      column: boost_promotion_policy_promotion_id { field: chai_card_chai_prod_public_boost_promotion_policy.promotion_id }
      column: boost_campaign_id { field: chai_card_chai_prod_public_boost_campaign_target_type.boost_campaign_id }
      column: boost_id { field: chai_card_chai_prod_public_boost.id }
      column: boost_usable_from_date { field: chai_card_chai_prod_public_boost.usable_from_date }
      column: boost_usable_to_date { field: chai_card_chai_prod_public_boost.usable_to_date }
      column: boost_status { field: chai_card_chai_prod_public_boost.status }
    }
  }
  dimension: checkout_amount {
    type: number
  }
  dimension: charging_amount {
    type: number
  }
  dimension: cashback_amount {
    type: number
  }
  dimension: billing_amount {
    type: number
  }
  dimension: canceled_amount {
    type: number
  }
  dimension: payment_created_date {
    type: date
  }
  dimension: payment_data {}
  dimension: discount_amount {
    type: number
  }
  dimension: merchant_cashback_amount {
    type: number
  }
  dimension: merchant_discount_amount {
    type: number
  }
  dimension: user_id {}
  dimension: user_birthday {}
  dimension: user_gender {}
  dimension: user_data {}
  dimension: merchant_data {}
  dimension: merchant_name {}
  dimension: merchant_status {}
  dimension: merchant_type {}
  dimension: delayed_cashback_history_is_public_transportation {
    label: "Chai Card Chai Prod Public Delayed Cashback History Is Public Transportation (Yes / No)"
    type: yesno
  }
  dimension: delayed_cashback_history_status {}
  dimension: delayed_cashback_history_action_type {}
  dimension: brand_name {}
  dimension: boost_promotion_policy_description {}
  dimension: boost_promotion_policy_usable_from_date {
    type: date
  }
  dimension: boost_promotion_policy_usable_to_date {
    type: date
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
  dimension: boost_campaign_id {
    type: number
  }
  dimension: boost_id {
    type: number
  }
  dimension: boost_usable_from_date {
    type: date
  }
  dimension: boost_usable_to_date {
    type: date
  }
  dimension: boost_status {}
  dimension: brand_id {
    type: number
  }
}
