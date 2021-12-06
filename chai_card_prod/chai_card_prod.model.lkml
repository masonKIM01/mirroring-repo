connection: "chai_redshift_production"

include: "/chai_card_prod/*.view.lkml"                # include all views in the views/ folder in this project
include: "/**/*.view.lkml"
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
explore: chai_card_offline_stats {}
explore: table_redshift_payment {}
explore: table_redshift_user {}
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
