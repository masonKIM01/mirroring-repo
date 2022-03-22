connection: "chai_redshift_production"

include: "views/**/*.view.lkml"

datagroup: hourly_datagroup {
  max_cache_age: "2 hours"
  sql_trigger: "SELECT EXTRACT(HOUR FROM NOW())" ;;
  description: "cache data for max 2 hours and refersh it every 1 hour"
}

explore: prejoined_payment {
  description: "payment table joined with multiple tables"
  persist_with: hourly_datagroup
  from: chai_card_chai_prod_public_payment
  join: chai_card_chai_prod_public_boost {
    type: left_outer
    sql_on: ${prejoined_payment.id} = ${chai_card_chai_prod_public_boost.payment_id} ;;
    relationship: many_to_one
  }

  join: chai_card_chai_prod_public_merchant {
    type: left_outer
    sql_on: ${prejoined_payment.merchant_id} = ${chai_card_chai_prod_public_merchant.id} ;;
    relationship: many_to_one
  }

  join: chai_card_chai_prod_public_boost_promotion_policy {
    type: left_outer
    sql_on: ${chai_card_chai_prod_public_boost.boost_promotion_id} = ${chai_card_chai_prod_public_boost_promotion_policy.id} ;;
    relationship: many_to_one
  }

  join: chai_card_chai_prod_public_brand {
    type: left_outer
    sql_on: ${chai_card_chai_prod_public_boost_promotion_policy.brand_id} = ${chai_card_chai_prod_public_brand.id} ;;
    relationship: many_to_one
  }

  join: chai_card_chai_prod_public_user {
    type: left_outer
    sql_on: ${prejoined_payment.user_id} = ${chai_card_chai_prod_public_user.id} ;;
    relationship: many_to_one
  }

  join: chai_card_chai_prod_public_delayed_cashback_history {
    type: left_outer
    sql_on: ${prejoined_payment.id} = ${chai_card_chai_prod_public_delayed_cashback_history.payment_id} ;;
    relationship: one_to_one
  }

  join: chai_card_chai_prod_public_boost_campaign_target_type {
    type: left_outer
    sql_on: ${chai_card_chai_prod_public_boost.boost_campaign_id} = ${chai_card_chai_prod_public_boost_campaign_target_type.boost_campaign_id} ;;
    relationship: one_to_one
  }

}
