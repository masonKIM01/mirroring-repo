view: bolt_usage_monthly_retention {
  derived_table: {
    sql: WITH bolt_history_users AS (
      SELECT
        DISTINCT DATE(created_at) as event_date,
        user_id
      FROM chai_card_chai_prod_public.bolt_history
      WHERE action = 'deduction'
    ),
    first_bolt_usage_month AS (
      SELECT
        user_id,
        MIN(event_date) AS first_usage_date
      FROM bolt_history_users
      GROUP BY 1
    ),
    joined_data AS (
      SELECT
        bhu.user_id,
        MONTHS_BETWEEN(LAST_DAY(bhu.event_date), LAST_DAY(fbum.first_usage_date)) AS months_interval,
        bhu.event_date,
        fbum.first_usage_date
      FROM bolt_history_users bhu
      INNER JOIN first_bolt_usage_month fbum
        ON bhu.user_id = fbum.user_id
    )
    SELECT
       (TO_CHAR(DATE_TRUNC('month', first_usage_date), 'YYYY-MM')) AS event_month,
       COUNT(DISTINCT(CASE WHEN months_interval = 0 THEN user_id ELSE NULL END)) AS m0_retention,
       COUNT(DISTINCT(CASE WHEN months_interval = 1 THEN user_id ELSE NULL END)) AS m1_retention,
       COUNT(DISTINCT(CASE WHEN months_interval = 2 THEN user_id ELSE NULL END)) AS m2_retention,
       COUNT(DISTINCT(CASE WHEN months_interval = 3 THEN user_id ELSE NULL END)) AS m3_retention,
       COUNT(DISTINCT(CASE WHEN months_interval = 4 THEN user_id ELSE NULL END)) AS m4_retention,
       COUNT(DISTINCT(CASE WHEN months_interval = 5 THEN user_id ELSE NULL END)) AS m5_retention,
       COUNT(DISTINCT(CASE WHEN months_interval = 6 THEN user_id ELSE NULL END)) AS m6_retention,
       COUNT(DISTINCT(CASE WHEN months_interval = 7 THEN user_id ELSE NULL END)) AS m7_retention,
       COUNT(DISTINCT(CASE WHEN months_interval = 8 THEN user_id ELSE NULL END)) AS m8_retention,
       COUNT(DISTINCT(CASE WHEN months_interval = 9 THEN user_id ELSE NULL END)) AS m9_retention,
       COUNT(DISTINCT(CASE WHEN months_interval = 10 THEN user_id ELSE NULL END)) AS m10_retention,
       COUNT(DISTINCT(CASE WHEN months_interval = 11 THEN user_id ELSE NULL END)) AS m11_retention,
       COUNT(DISTINCT(CASE WHEN months_interval = 12 THEN user_id ELSE NULL END)) AS m12_retention
    FROM joined_data
    GROUP BY 1
     ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: event_month {
    type: string
    sql: ${TABLE}.event_month ;;
  }

  dimension: m0_retention {
    type: number
    sql: ${TABLE}.m0_retention ;;
  }

  dimension: m1_retention {
    type: number
    sql: ${TABLE}.m1_retention ;;
  }

  dimension: m2_retention {
    type: number
    sql: ${TABLE}.m2_retention ;;
  }

  dimension: m3_retention {
    type: number
    sql: ${TABLE}.m3_retention ;;
  }

  dimension: m4_retention {
    type: number
    sql: ${TABLE}.m4_retention ;;
  }

  dimension: m5_retention {
    type: number
    sql: ${TABLE}.m5_retention ;;
  }

  dimension: m6_retention {
    type: number
    sql: ${TABLE}.m6_retention ;;
  }

  dimension: m7_retention {
    type: number
    sql: ${TABLE}.m7_retention ;;
  }

  dimension: m8_retention {
    type: number
    sql: ${TABLE}.m8_retention ;;
  }

  dimension: m9_retention {
    type: number
    sql: ${TABLE}.m9_retention ;;
  }

  dimension: m10_retention {
    type: number
    sql: ${TABLE}.m10_retention ;;
  }

  dimension: m11_retention {
    type: number
    sql: ${TABLE}.m11_retention ;;
  }

  dimension: m12_retention {
    type: number
    sql: ${TABLE}.m12_retention ;;
  }

  set: detail {
    fields: [
      event_month,
      m0_retention,
      m1_retention,
      m2_retention,
      m3_retention,
      m4_retention,
      m5_retention,
      m6_retention,
      m7_retention,
      m8_retention,
      m9_retention,
      m10_retention,
      m11_retention,
      m12_retention
    ]
  }
}
