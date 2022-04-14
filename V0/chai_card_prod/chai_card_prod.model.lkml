connection: "chai_redshift_production"

include: "/**/*.view.lkml"
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
explore: table_redshift_user {}
explore: table_redshift_bolt_history {}
explore: table_merchant_adspend {}
explore: table_redshift_merchant {}
explore: table_union_all_payment {}
explore: table_boost {
  join: table_payment {
    type: left_outer
    sql_on: ${table_boost.payment_id}= ${table_payment.id} ;;
    relationship: many_to_one
  }
}
explore: fsr_yogiyo {}
explore: ad_spend_view {}
explore: bolt_draw_report {}
explore: plcc_first_time_payment {}
explore: table_redshift_card {}
explore: querylibrary {}
explore: checkout_selectivity {}
explore: plcc_funnel {}
explore: plcc_payment_type {}
explore: table_amplitude {}


explore: table_redshift_payment {
  join: table_redshift_boost {
    type: left_outer
    sql_on:  ${table_redshift_boost.payment_id} = ${table_redshift_payment.id} ;;
    relationship: many_to_one
  }

  join: table_redshift_merchant {
    type: inner
    sql_on: ${table_redshift_payment.merchant_id} = ${table_redshift_merchant.id} ;;
    relationship: many_to_one
  }

  join: table_redshift_boost_promotion_policy {
    type: left_outer
    sql_on:  ${table_redshift_boost_promotion_policy.id} = ${table_redshift_boost.boost_promotion_id} ;;
    relationship: many_to_one
  }

  join: table_redshift_brand {
    type: left_outer
    sql_on: ${table_redshift_brand.id} = ${table_redshift_boost_promotion_policy.brand_id} ;;
    relationship: many_to_one
  }

  join: table_merchant_adspend {
    type: left_outer
    sql_on: ${table_redshift_brand.name} = ${table_merchant_adspend.merchant_name}
          and ${table_redshift_boost_promotion_policy.title} = ${table_merchant_adspend.title}
          and (${table_redshift_payment.months}) = (${table_merchant_adspend.months})
          ;;
    relationship: many_to_one
  }

  join: table_delayed_cashback {
    type: left_outer
    sql_on: ${table_redshift_payment.id} = ${table_delayed_cashback.payment_id} ;;
    relationship: many_to_one
  }

  join: table_ad_spend_v2{
    type: left_outer
    sql_on: ${table_ad_spend_v2.payment_id} = ${table_redshift_payment.id} ;;
    relationship: many_to_one
  }
}

explore: table_payment {
  join: table_redshift_boost {
    type: left_outer
    sql_on:  ${table_redshift_boost.payment_id} = ${table_payment.id} ;;
    relationship: many_to_one
  }

  join: table_redshift_merchant {
    type: left_outer
    sql_on: ${table_payment.merchant_id} = ${table_redshift_merchant.id} ;;
    relationship: many_to_one
  }

  join: table_redshift_boost_promotion_policy {
    type: left_outer
    sql_on:  ${table_redshift_boost_promotion_policy.id} = ${table_redshift_boost.boost_promotion_id} ;;
    relationship: many_to_one
  }

  join: table_redshift_brand {
    type: left_outer
    sql_on: ${table_redshift_brand.id} = ${table_redshift_boost_promotion_policy.brand_id} ;;
    relationship: many_to_one
  }

  join: table_user {
    type: left_outer
    sql_on: ${table_user.id} = ${table_payment.user_id} ;;
    relationship: many_to_one
  }

  join: table_redshift_card {
    type: left_outer
    sql_on: ${table_payment.user_id} = ${table_redshift_card.user_id} ;;
    relationship: many_to_one
  }

  join: table_ad_spend_v2{
    type: left_outer
    sql_on: ${table_ad_spend_v2.payment_id} = ${table_payment.id} ;;
    relationship: one_to_one
 }

  join: table_adspend_owner {
    type: left_outer
    sql_on: ${table_redshift_brand.name} = ${table_adspend_owner.merchant_name} ;;
    relationship: many_to_one
  }

  join: table_delayed_cashback {
    type: left_outer
    sql_on: ${table_payment.id} = ${table_delayed_cashback.payment_id} ;;
    relationship: one_to_one
  }

  join: table_plcc_user {
    type: left_outer
    sql_on: ${table_payment.user_id} = ${table_plcc_user.user_id} ;;
    relationship: many_to_one
  }

  join: table_boost_campaign_target_type {
    type: left_outer
    sql_on: ${table_boost_campaign_target_type.boost_campaign_id} = ${table_redshift_boost.boost_campaign_id} ;;
    relationship: one_to_one
  }
}

explore: table_plcc {
  join: table_card_user {
    type: left_outer
    sql_on: ${table_plcc.user_id} = ${table_card_user.id} ;;
    relationship: many_to_one
  }

  join: table_korea_spec {
    type: left_outer
    sql_on: ${table_korea_spec.ci}= ${table_card_user.ci} ;;
    relationship: many_to_one
  }

  join: table_user {
    type: left_outer
    sql_on: ${table_user.id} = ${table_korea_spec.user_id} ;;
    relationship: many_to_one
  }

  join: table_payment {
    type: left_outer
    sql_on: ${table_payment.user_id} = ${table_user.id} ;;
    relationship: many_to_one
  }

  join: table_redshift_merchant {
    type: inner
    sql_on: ${table_payment.merchant_id} = ${table_redshift_merchant.id} ;;
    relationship: many_to_one
  }

  join: table_redshift_boost {
    type: left_outer
    sql_on:  ${table_redshift_boost.payment_id} = ${table_payment.id} ;;
    relationship: many_to_one
  }

  join: table_redshift_boost_promotion_policy {
    type: left_outer
    sql_on:  ${table_redshift_boost_promotion_policy.id} = ${table_redshift_boost.boost_promotion_id} ;;
    relationship: many_to_one
  }

  join: table_redshift_brand {
    type: left_outer
    sql_on: ${table_redshift_brand.id} = ${table_redshift_boost_promotion_policy.brand_id} ;;
    relationship: many_to_one
  }

  join: table_ad_spend_v2{
    type: left_outer
    sql_on: ${table_ad_spend_v2.payment_id} = ${table_payment.id} ;;
    relationship: one_to_one
  }

  join: table_adspend_owner {
    type: left_outer
    sql_on: ${table_redshift_brand.name} = ${table_adspend_owner.merchant_name} ;;
    relationship: one_to_one
  }

  join: table_delayed_cashback {
    type: left_outer
    sql_on: ${table_payment.id} = ${table_delayed_cashback.payment_id} ;;
    relationship: one_to_one
  }

  join: table_plcc_user {
    type: left_outer
    sql_on: ${table_payment.user_id} = ${table_plcc_user.user_id} ;;
    relationship: one_to_one
  }
}
