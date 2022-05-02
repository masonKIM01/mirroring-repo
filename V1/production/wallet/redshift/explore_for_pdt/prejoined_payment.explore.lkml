include: "../views/**/*.view.lkml"
explore: prejoined_payment {
  description: "payment table joined with multiple tables"
  hidden: yes
  from: chai_payment
  sql_always_where: (
    ${created_date} >= (CURRENT_DATE - INTERVAL '6 MONTHS')
  ) AND (
    TO_DATE(
      CONCAT(
        CONCAT(${year}, '-'),
            ${month}
        ),
        'YYYY-MM-01'
    ) BETWEEN
      TO_DATE(CURRENT_DATE - INTERVAL '6 MONTHS', 'YYYY-MM-01') AND
      TO_DATE(CURRENT_DATE, 'YYYY-MM-01')
  ) ;;
  join: chai_boost {
    type: left_outer
    sql_on: ${prejoined_payment.id} = ${chai_boost.payment_id} ;;
    relationship: many_to_many
  }

  join: chai_merchant {
    type: left_outer
    sql_on: ${prejoined_payment.merchant_id} = ${chai_merchant.id} ;;
    relationship: one_to_one
  }

  join: chai_boost_promotion_policy {
    type: left_outer
    sql_on: ${chai_boost.boost_promotion_id} = ${chai_boost_promotion_policy.id} ;;
    relationship: one_to_one
  }

  join: chai_brand {
    type: left_outer
    sql_on: ${chai_boost_promotion_policy.brand_id} = ${chai_brand.id} ;;
    relationship: one_to_one
  }

  join: chai_delayed_cashback_history {
    type: left_outer
    sql_on: ${chai_delayed_cashback_history.payment_id} = ${prejoined_payment.id} ;;
    relationship: one_to_one
  }
}
