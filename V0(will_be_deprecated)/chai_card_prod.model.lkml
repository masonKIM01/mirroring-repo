connection: "chai_redshift_production"

include: "/**/*.view.lkml"


# views will be deprecated
explore: table_merchant_adspend {}
explore: table_union_all_payment {}
explore: fsr_yogiyo {}
explore: ad_spend_view {}
explore: bolt_draw_report {}
explore: plcc_first_time_payment {}
explore: querylibrary {}
explore: checkout_selectivity {}
explore: plcc_funnel {}
explore: plcc_payment_type {}
explore: join_adspend {}
explore: min_created_at {}
