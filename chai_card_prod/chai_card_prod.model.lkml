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

explore: table_redshift_payment {
  join: table_redshift_boost {
    type: left_outer
    sql_on:  ${table_redshift_boost.payment_id} = ${table_redshift_payment.id} ;;
    relationship: many_to_one
  }

  join: table_redshift_boost_promotion_policy {
    type: left_outer
    sql_on: ${table_redshift_boost_promotion_policy.id} = ${table_redshift_boost.boost_promotion_id} ;;
    relationship: many_to_one
  }

  join: merchant_ratio_v2 {
    type: left_outer
    sql_on: ${merchant_ratio_v2.month} = ${table_redshift_payment.months}
      and ${merchant_ratio_v2.merchant} = ${table_redshift_boost_promotion_policy.sub_title};;
    relationship: many_to_one
  }
}
