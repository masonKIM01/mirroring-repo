include: "../views/**/*.view.lkml"
explore: prejoined_payment {
  description: "payment table joined with multiple tables"
  hidden: yes
  from: chai_payment
  always_filter: {
    filters: [chai_boost.created_date: "6 months"]
  }
  join: chai_boost {
    type: left_outer
    sql_on: ${prejoined_payment.id} = ${chai_boost.payment_id} ;;
    relationship: many_to_one
  }

  join: chai_merchant {
    type: left_outer
    sql_on: ${prejoined_payment.merchant_id} = ${chai_merchant.id} ;;
    relationship: many_to_one
  }

  join: chai_boost_promotion_policy {
    type: left_outer
    sql_on: ${chai_boost.boost_promotion_id} = ${chai_boost_promotion_policy.id} ;;
    relationship: many_to_one
  }

  join: chai_brand {
    type: left_outer
    sql_on: ${chai_boost_promotion_policy.brand_id} = ${chai_brand.id} ;;
    relationship: many_to_one
  }
}
