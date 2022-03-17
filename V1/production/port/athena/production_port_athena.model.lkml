connection: "importdb"

include: "views/*.view.lkml"
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
#   # sql_trigger: SELECT max(created) FROM hmscatalog.importdb.payments ;;
#   max_cache_age: "24 hours"
# }

# explore: total_amount_2021 {
#   label: "Payment Information"
# }

explore: users {}
explore: user_pg_appls {
  join: user_pg_appl_details {
    type: full_outer
    sql_on: ${user_pg_appl_details.id} = ${user_pg_appl_details.user_pg_appl_id} ;;
    relationship: one_to_many
  }
}
explore: user_pg_appl_details {}
#explore: user_pricing {
#  join: merchant_details {
#    type: left_outer
#    sql_on:  ${user_pricing.user_id} = ${merchant_details.user_id} ;;
#    relationship: many_to_one
#  }

#  join: payments {
#    type: left_outer
#    sql_on: ${user_pricing.user_id} = ${payments.user_id} and ${user_pricing.pg_id} = ${payments.pg_id}
#    and ${user_pricing.pay_method} = ${payments.pay_method};;
#    relationship:  one_to_many
#  }
#}

explore: payments {
  always_filter: {
    filters: [payments.sandbox: "0",payments.status: "paid, cancelled"]
  }
  join: payment_extensions {
    type: inner
    sql_on: ${payment_extensions.unique_payment_id} = ${payments.unique_id} ;;
    relationship: one_to_one
  }

  join: users_meta {
    type:  left_outer
    sql_on: ${users_meta.user_id} = ${payments.user_id} ;;
    relationship: many_to_one
  }

#  join: merchant_details {
#    type:  left_outer
#    sql_on:  ${merchant_details.user_id} = ${payments.user_id};;
#    relationship:  many_to_one
#  }

  join: user_pricing {
    type:  left_outer
    sql_on:  ${user_pricing.user_id} = ${payments.user_id} and ${user_pricing.pg_id} = ${payments.pg_id}
    and ${user_pricing.pay_method} = ${payments.pay_method};;
    relationship:  many_to_one
  }

  join: users {
    type:  left_outer
    sql_on:  ${users.id} = ${payments.user_id};;
    relationship: many_to_one
  }

#  join: kcb_data {
#    type:  left_outer
#    sql_on:  ${merchant_details.business_number} = ${kcb_data.business_number};;https://chaifinance.cloud.looker.com/projects/chaifinance/files/chaifinance.model.lkml?line=71
#    relationship: one_to_one
#  }


  # sql_always_where: ${status} = 'paid' ;;
}

explore: transformed_payments {
  always_filter: {
    filters: [transformed_payments.sandbox: "0",transformed_payments.status: "paid, cancelled"]
  }
  join: payment_extensions {
    type: inner
    sql_on: ${payment_extensions.unique_payment_id} = ${transformed_payments.unique_id} ;;
    relationship: one_to_one
  }
  join: users_meta {
    type:  left_outer
    sql_on: ${users_meta.user_id} = ${transformed_payments.user_id} ;;
    relationship: many_to_one
  }

#  join: merchant_details {
#    type:  left_outer
#    sql_on:  ${merchant_details.user_id} = ${transformed_payments.user_id};;
#    relationship:  many_to_one
#  }

  join: user_pricing {
    type:  left_outer
    sql_on:  ${user_pricing.user_id} = ${transformed_payments.user_id};;
    relationship:  many_to_one
  }

  join: users {
    type:  left_outer
    sql_on:  ${users.id} = ${transformed_payments.user_id};;
    relationship: many_to_one
  }

  # sql_always_where: ${status} = 'paid' ;;
}
