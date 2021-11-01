view: active_card {
  derived_table: {
    sql: WITH card_accident AS (select
      date(max(accident_enrollment_date)) as date, user_id
      from raw_rds_production.card_accident_receipt_history
      where before_accident_date is not null
      group by 2
       )
SELECT
    (TO_CHAR(DATE_TRUNC('month', card_accident.date ), 'YYYY-MM')) AS "created_at_month",
    COUNT(DISTINCT card_accident.user_id ) AS "count_user"
FROM card_accident
GROUP BY
    (DATE_TRUNC('month', card_accident.date ))
ORDER BY
    1 DESC
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: accumulate {
    type: sum
    sql: COUNT(DISTINCT card_accident.user_id ))over(order by (TO_CHAR(DATE_TRUNC('month', card_accident.date ), 'YYYY-MM') ;;
  }
  dimension: created_at_month {
    type: string
    sql: ${TABLE}.created_at_month ;;
  }

  dimension: count_user {
    type: number
    sql: ${TABLE}.count_user ;;
  }

  dimension: card_issued_cumulative {
    type: number
    sql: ${TABLE}.card_issued_cumulative ;;
  }

  set: detail {
    fields: [created_at_month, count_user, card_issued_cumulative]
  }
}
