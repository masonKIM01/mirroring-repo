view: chai_user_out_for_30days{
  derived_table: {
    sql:
    SELECT
      user_id,
      CASE
        WHEN SUM(DISTINCT method) IN (1, 11) THEN 'credit'
        WHEN SUM(DISTINCT method) IN (2, 12) THEN 'check'
        WHEN SUM(DISTINCT method) IN (3, 13) THEN 'all'
        WHEN SUM(DISTINCT method) = 10 THEN 'ewallet'
      END AS payment_type,
      last_created_at,
      churn_date
    FROM (
      SELECT
        p.user_id,
        CASE
          WHEN m.name = '차이 신용카드' THEN 1
          WHEN m.name = '차이 체크카드' THEN 2
          ELSE 10
        END AS method,
        MAX(p.created_at) AS last_created_at,
        MAX(p.created_at) + 30 AS churn_date
      FROM chai_card_chai_prod_public.payment p
      INNER JOIN chai_card_chai_prod_public.merchant m ON m.id = p.merchant_id
      WHERE p.status = 'confirmed'
      GROUP BY
        1,
        2
      ORDER BY
        1
    )
    GROUP BY
      1,
      3,
      4
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: users {
    type: count_distinct
    sql: ${TABLE}.user_id ;;
  }

  dimension: user_id {
    type: string
    primary_key: yes
    sql: ${TABLE}.user_id ;;
  }

  dimension: payment_type {
    type: string
    sql: ${TABLE}.payment_type ;;
  }

  dimension: transactions {
    type: number
    sql: ${TABLE}.transactions ;;
  }

  dimension_group: last_created_at {
    type: time
    sql: ${TABLE}.last_created_at ;;
  }

  dimension_group: churn_date {
    type: time
    sql: ${TABLE}.churn_date ;;
  }

  set: detail {
    fields: [user_id, payment_type, last_created_at_time, churn_date_time]
  }
}
