view: boost_usage_monthly_retention {
  derived_table: {
    sql:
    WITH boost_users AS (
      SELECT
          DISTINCT DATE(p.created_at) as event_date,
          case
              when p.merchant_id='0385e3db-4a50-4035-9285-1ced4a3e0209' then 'check'
              when p.merchant_id='8d9a7bd7-c6e1-408e-972a-b59369cb6bb1' then 'credit'
          else 'e-wallet' end as payment_type,
          p.user_id
      FROM chai_card_chai_prod_public.payment p
      INNER JOIN chai_card_chai_prod_public.boost b
        ON b.usage_id = p.id
      WHERE p.status = 'confirmed'
    ),
    first_boost_usage_month AS (
      SELECT
        user_id,
        payment_type,
        MIN(event_date) AS first_usage_date
      FROM boost_users
      GROUP BY 1,2
    ),
    joined_data AS (
      SELECT
        bhu.user_id,
        bhu.payment_type,
        MONTHS_BETWEEN(LAST_DAY(bhu.event_date), LAST_DAY(fbum.first_usage_date)) AS months_interval,
        bhu.event_date,
        fbum.first_usage_date
      FROM boost_users bhu
      INNER JOIN first_boost_usage_month fbum
        ON bhu.user_id = fbum.user_id
        AND bhu.payment_type = fbum.payment_type
    )
    SELECT
        event_month AS event_month,
        payment_type,
        m1_users / m0_users AS m1_retention,
        m2_users / m0_users AS m2_retention,
        m3_users / m0_users AS m3_retention,
        m4_users / m0_users AS m4_retention,
        m5_users / m0_users AS m5_retention,
        m6_users / m0_users AS m6_retention,
        m7_users / m0_users AS m7_retention,
        m8_users / m0_users AS m8_retention,
        m9_users / m0_users AS m9_retention,
        m10_users / m0_users AS m10_retention,
        m11_users / m0_users AS m11_retention,
        m12_users / m0_users AS m12_retention
    FROM (
      SELECT
          DATE_TRUNC('month', first_usage_date) AS event_month,
          payment_type,
          COUNT(DISTINCT(CASE WHEN months_interval = 0 THEN user_id ELSE NULL END))::float AS m0_users,
          COUNT(DISTINCT(CASE WHEN months_interval = 1 THEN user_id ELSE NULL END))::float AS m1_users,
          COUNT(DISTINCT(CASE WHEN months_interval = 2 THEN user_id ELSE NULL END))::float AS m2_users,
          COUNT(DISTINCT(CASE WHEN months_interval = 3 THEN user_id ELSE NULL END))::float AS m3_users,
          COUNT(DISTINCT(CASE WHEN months_interval = 4 THEN user_id ELSE NULL END))::float AS m4_users,
          COUNT(DISTINCT(CASE WHEN months_interval = 5 THEN user_id ELSE NULL END))::float AS m5_users,
          COUNT(DISTINCT(CASE WHEN months_interval = 6 THEN user_id ELSE NULL END))::float AS m6_users,
          COUNT(DISTINCT(CASE WHEN months_interval = 7 THEN user_id ELSE NULL END))::float AS m7_users,
          COUNT(DISTINCT(CASE WHEN months_interval = 8 THEN user_id ELSE NULL END))::float AS m8_users,
          COUNT(DISTINCT(CASE WHEN months_interval = 9 THEN user_id ELSE NULL END))::float AS m9_users,
          COUNT(DISTINCT(CASE WHEN months_interval = 10 THEN user_id ELSE NULL END))::float AS m10_users,
          COUNT(DISTINCT(CASE WHEN months_interval = 11 THEN user_id ELSE NULL END))::float AS m11_users,
          COUNT(DISTINCT(CASE WHEN months_interval = 12 THEN user_id ELSE NULL END))::float AS m12_users
      FROM joined_data
    GROUP BY 1,2
    ) ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }
  dimension_group: event_month {
    type: time
    sql: ${TABLE}.event_month ;;
  }

  dimension: payment_type {
    type: string
    sql: ${TABLE}.payment_type ;;
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
      event_month_time,
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
  measure: m1_retention_debit {
    type: average
    description: "monthly boost usage retention(debit card)"
    filters: [payment_type: "check"]
    sql: ${m1_retention} ;;
  }
  measure: m1_retention_credit {
    type: average
    description: "monthly boost usage retention(credit card)"
    filters: [payment_type: "credit"]
    sql: ${m1_retention} ;;
  }
  measure: m1_retention_ewallet {
    type: average
    description: "monthly boost usage retention(e-wallet)"
    filters: [payment_type: "e-wallet"]
    sql: ${m1_retention} ;;
  }

}
