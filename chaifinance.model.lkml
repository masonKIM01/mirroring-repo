connection: "importdb"

include: "*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
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

# datagroup: payment_rebuild {
#   # sql_trigger: SELECT max(created_at) FROM ecomm.events ;;
#   max_cache_age: "24 hours"
# }

# explore: total_amount_2021 {
#   label: "Payment Information"
# }

explore: payments {
  always_filter: {
    filters: [payments.yearmonth: "2020-01"]
  }
  join: payment_extensions {
    type: inner
    sql_on: ${payment_extensions.unique_payment_id} = ${payments.unique_id} ;;
    relationship: one_to_one
  }
  # sql_always_where: ${status} = 'paid' ;;
}
