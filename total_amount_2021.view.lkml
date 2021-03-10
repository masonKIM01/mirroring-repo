# view: total_amount_2021 {
#   derived_table: {
#     sql: SELECT
#         payments.yearmonth  AS "payments.yearmonth",
#         COALESCE(SUM(payments.amount_in_krw ), 0) AS "payments.total_amount"
#       FROM hmscatalog.importdb.payments  AS payments
#       WHERE
#         (payments.yearmonth LIKE '%2021%')
#       GROUP BY 1
#       ORDER BY 2 DESC
#       LIMIT 500
#       ;;
#     datagroup_trigger: payment_rebuild
#   }

#   suggestions: no

#   measure: count {
#     type: count
#     drill_fields: [detail*]
#   }

#   dimension: payments_yearmonth {
#     type: string
#     sql: ${TABLE}."payments.yearmonth" ;;
#   }

#   dimension: payments_total_amount {
#     type: number
#     sql: ${TABLE}."payments.total_amount" ;;
#   }

#   set: detail {
#     fields: [payments_yearmonth, payments_total_amount]
#   }
# }
