include: "../views/**/*.view.lkml"
explore: prejoined_plcc {
  description: "plcc table joined with multiple tables"
  hidden: yes
  from: plcc_card_application
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
  join: chai_card_user {
    type: inner
    sql_on: ${chai_card_user.id} = ${prejoined_plcc.user_id} ;;
    relationship: one_to_one
  }
  join: chai_korea_spec {
    type: inner
    sql_on: ${chai_korea_spec.ci} = ${chai_card_user.ci} ;;
    relationship: one_to_one
  }
  join: chai_payment {
    type: left_outer
    sql_on: ${chai_payment.user_id} = ${chai_korea_spec.user_id} ;;
    relationship: one_to_many
  }
  join: chai_merchant {
    type: inner
    sql_on: ${chai_merchant.id} = ${chai_payment.merchant_id} ;;
    relationship: one_to_one
  }
}
