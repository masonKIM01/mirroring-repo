view: active_card {
  derived_table: {
    sql: select
        b.*, SUM(b.count_user)over(order by b.created_at_month rows between unbounded preceding and current row) AS "cumulate"
        from (
        SELECT
        (TO_CHAR(DATE_TRUNC('month', a.date ), 'YYYY-MM')) AS "created_at_month",
        COUNT(DISTINCT a.user_id ) AS "count_user"
        from
      (
      select
      date(accident_enrollment_date) as date, user_id
      from raw_rds_production.card_accident_receipt_history
      where before_accident_date is null
      and card_accident_code = '0061'
        )a
      GROUP BY
      1)b
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: user_count {
    type: sum
    sql: ${count_user} ;;
  }

  measure: acc_user_count {
    type: sum
    sql: ${TABLE}.cumulate ;;
  }

  dimension: created_at_month {
    type: string
    sql: ${TABLE}.created_at_month ;;
  }

  dimension: count_user {
    type: number
    sql: ${TABLE}.count_user ;;
  }

  dimension: cumulative {
    type: number
    sql: ${TABLE}.cumulate ;;
  }

  set: detail {
    fields: [created_at_month, count_user, cumulative]
  }
}
