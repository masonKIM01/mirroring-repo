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
explore: table_bolt_history {}
explore: table_ad_spend {}
explore: table_adspend_dec {}
explore: table_payment_union_analytics {}
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
    sql_on: ${table_redshift_boost_promotion_policy.id} = ${table_redshift_boost.boost_promotion_id} ;;
    relationship: many_to_one
  }

  join: table_redshift_brand {
    type: left_outer
    sql_on: ${table_redshift_boost.payment_id} = ${table_redshift_payment.id} ;;
    relationship: many_to_one
  }

  join: table_ad_spend {
    type: left_outer
    sql_on: ${table_ad_spend.brand_name} = ${table_redshift_brand.name}
    and ${table_redshift_payment.months} = ${table_ad_spend.month};;
    relationship: many_to_one
  }

  join: table_adspend_dec {
    type: left_outer
    sql_on: ${table_adspend_dec.merchant} = ${table_redshift_brand.name}
    and ${table_redshift_payment.months} = ${table_adspend_dec.month};;
    relationship: many_to_one
  }
}
