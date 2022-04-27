connection: "chai_redshift_production"

include: "/**/*.view.lkml"


# views will be deprecated
explore: table_merchant_adspend { group_label: "will be deprecated" }
explore: table_union_all_payment { group_label: "will be deprecated" }
explore: fsr_yogiyo { group_label: "will be deprecated" }
explore: ad_spend_view { group_label: "will be deprecated" }
explore: bolt_draw_report { group_label: "will be deprecated" }
explore: plcc_first_time_payment { group_label: "will be deprecated" }
explore: querylibrary { group_label: "will be deprecated" }
explore: checkout_selectivity { group_label: "will be deprecated" }
explore: plcc_funnel { group_label: "will be deprecated" }
explore: plcc_payment_type { group_label: "will be deprecated" }
explore: join_adspend { group_label: "will be deprecated" }
explore: min_created_at { group_label: "will be deprecated" }
