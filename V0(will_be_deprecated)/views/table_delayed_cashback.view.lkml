view: table_delayed_cashback {
  derived_table: {
    sql:
      SELECT
        DISTINCT YEAR,
        MONTH,
        created_at,
        payment_id,
        SUM(cashback_delta) AS cashback_delta
      FROM
        (
          SELECT
            id,
            YEAR,
            MONTH,
            created_at,
            cashback_delta,
            payment_id,
            action_type,
            COUNT(action_type) OVER (PARTITION BY payment_id) AS cnt
          FROM
            chai_card_chai_public.delayed_cashback_history
          GROUP BY
            1,
            2,
            3,
            4,
            5,
            6,
            7
        ) AS delayed_cashback_history
      WHERE
        delayed_cashback_history.cnt = 1
      GROUP BY
        1,
        2,
        3,
        4
              ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: cashback {
    type: sum
    sql: coalesce(${TABLE}.cashback_delta,0) ;;
  }

  dimension: id {
    type: number
    sql: ${TABLE}.payment_id ;;
  }

  dimension_group: created_at {
    type: time
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: updated_at {
    type: time
    sql: ${TABLE}.updated_at ;;
  }

  dimension: cashback_delta {
    type: number
    sql: ${TABLE}.cashback_delta ;;
  }
  dimension: payment_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.payment_id ;;
  }
  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }

  dimension: month {
    type: number
    sql: ${TABLE}.month ;;
  }

  set: detail {
    fields: [
      id,
      created_at_time,
      updated_at_time,
      cashback_delta,
      year,
      month
    ]
  }
}
