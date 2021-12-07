connection: "chai_redshift_production"

include: "/chai_card/*.view.lkml"                # include all views in the views/ folder in this project
include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
explore: mart_staging_payment {}
explore: premart_staging_payment {}
explore: raw_prod_payment {}
explore: premart_staging_card_approval {}
explore: merchant_boost {}
explore: raw_rds_production {}
explore: brand_merchat_boost {}
explore: card_payment {}
explore: ewallet {}
explore: raw_prod_boost_budget_usage_history {}
explore: raw_rds_prod_boost_budget_joined {}
explore: raw_rds_production_customer {}
explore: raw_rds_prod_boost_joined {}
explore: merchant_raw {}
explore: card_weekly {}
explore: card_accident {}
explore: boost_rank {}
explore: active_card {}
explore: raw_rds_production_bolt_history {}
explore: boost_report {}
explore: ad_spend_trend {}
explore: ewallet_trend {}
explore: table_bolt_history {}
explore: bolt_payment_table {}
explore: budget_used {}
explore: review_cpa {}
explore: finance_active_user {}
explore: finance_promotion {}
explore: card_issue {}
explore: monthly_roas {}
explore: contribution_margin {}
explore: ad_merchant__roas_cpx {}
explore: bd_member_tracking {}
explore: customer_cumulative {}
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }
