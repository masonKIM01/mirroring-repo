connection: "importdb"

include: "/V1/production/port/athena/views/**/*.view.lkml"

explore: users {}
explore: user_pricing {
  join: merchant_details {
    type: left_outer
    sql_on:  ${user_pricing.user_id} = ${merchant_details.user_id} ;;
    relationship: many_to_one
  }

  join: payments {
    type: left_outer
    sql_on: ${user_pricing.user_id} = ${payments.user_id} and ${user_pricing.pg_id} = ${payments.pg_id}
      and ${user_pricing.pay_method} = ${payments.pay_method};;
    relationship:  one_to_many
  }
}

explore: payments {
  always_filter: {
    filters: [payments.sandbox: "0",payments.status: "paid, cancelled"]
  }
  join: payment_extensions {
    type: inner
    sql_on: ${payment_extensions.unique_payment_id} = ${payments.unique_id} ;;
    relationship: one_to_one
  }



  join: merchant_details {
    type:  left_outer
    sql_on:  ${merchant_details.user_id} = ${payments.user_id};;
    relationship:  many_to_one
  }

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

  join: latest_margin_details {
    type:  left_outer
    sql_on:  ${latest_margin_details.pg_id} = ${payments.pg_id} and ${latest_margin_details.pg_provider}=${payments.formatted_pg_provider}
      and ${latest_margin_details.pay_method}=${payments.pay_method};;
    relationship: many_to_one
  }



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

  join: merchant_details {
    type:  left_outer
    sql_on:  ${merchant_details.user_id} = ${transformed_payments.user_id};;
    relationship:  many_to_one
  }

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

}


explore: derived_monthly_agg {
  join: merchant_details {
    type: left_outer
    sql_on: ${derived_monthly_agg.business_number}=${merchant_details.business_number};;
    relationship: one_to_one
  }
}



explore: certifications {
  join: merchant_details {
    type: left_outer
    sql_on: ${merchant_details.user_id}=${certifications.user_id} ;;
    relationship: one_to_one
  }
}
