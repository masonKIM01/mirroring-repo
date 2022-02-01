connection: "chai_redshift_production"

include: "/chai_card_prod/*.view.lkml"                # include all views in the views/ folder in this project
include: "/**/*.view.lkml"
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
explore: chai_card_offline_stats {}
explore: table_redshift_user {}
explore: table_redshift_bolt_history {}
explore: table_ad_spend {}
explore: table_adspend_dec {}
explore: table_merchant_adspend {}
explore: table_union_all_payment {}
explore: bd_owner {}
explore: ad_spend_view {}
explore: bolt_draw_report {}
explore: monthly_data {}
explore: monthly_data_wocpa {}
explore: daily_data {}
explore: table_redshift_card {}
explore: active_card {}
explore: settlement_v2 {}
explore: settlement_view {}
explore: cashback_map {}
explore: table_payment_union_analytics {

  join: table_redshift_boost {

    type: left_outer
    sql_on: ${table_payment_union_analytics.id} = ${table_redshift_boost.payment_id} ;;
    relationship: many_to_one
  }

  join: table_redshift_boost_promotion_policy {
    type: left_outer
    sql_on: ${table_redshift_boost.boost_promotion_id} = ${table_redshift_boost_promotion_policy.id} ;;
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
    and (${table_payment_union_analytics.months}) = (${table_merchant_adspend.months})
    ;;
    relationship: many_to_one
  }
}


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
}

explore: table_payment {
  join: table_redshift_boost {
    type: left_outer
    sql_on:  ${table_redshift_boost.payment_id} = ${table_payment.id} ;;
    relationship: many_to_one
  }

  join: table_redshift_merchant {
    type: inner
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

  join: table_ad_spend_v2{
    type: left_outer
    sql_on: ${table_ad_spend_v2.payment_id} = ${table_payment.id} ;;
    relationship: many_to_one
 }
}
