view: chai_boost {
  sql_table_name: chai_card_chai_public.boost ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: boost_campaign_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.boost_campaign_id ;;
  }

  dimension: boost_promotion_id {
    type: number
    sql: ${TABLE}.boost_promotion_id ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: month {
    type: number
    sql: ${TABLE}.month ;;
  }

  dimension: payment_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.payment_id ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.updated_at ;;
  }

  dimension_group: usable_from {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.usable_from ;;
  }

  dimension_group: usable_to {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.usable_to ;;
  }

  dimension: usage_id {
    type: string
    sql: ${TABLE}.usage_id ;;
  }

  dimension: usage_type {
    type: string
    sql: ${TABLE}.usage_type ;;
  }

  dimension: user_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }

  measure: users {
    type: count_distinct
    description: "# of users who buy boost"
    sql: ${TABLE}.user_id ;;
  }

  measure: boost_used_users {
    type: count_distinct
    description: "# of users who used boost correctly"
    sql: ${TABLE}.user_id ;;
    filters: [status: "terminated", usage_id: "-NULL"]
  }

  measure: boost_count {
    type: count
    description: "# of boost that activated at least once regardless of current status"
  }

  measure: unused_boost_count {
    type: count
    description: "# of unused boosts. it means, users bought boost but did not use and expired"
    filters: [status: "activated", usable_to_time: "before 9 hours from now"]
  }
  measure: used_boost_count {
    type: count
    description: "# of boosts that is used correctly"
    filters: [status: "terminated", usage_id: "-NULL"]
  }

  measure: boost_to_payment_mins_avg {
    type: average
    description: "average time to take from boost purchase to usage"
    sql:
      CASE WHEN
        ${status} = 'terminated'
        AND ${usage_id} IS NOT NULL
        AND ${updated_time} > ${created_time}
      THEN DATEDIFF(minute, ${created_raw}, ${updated_raw})
      ELSE NULL
      END ;;
  }

  measure: boost_to_payment_mins_max {
    type: max
    description: "maximum time to take from boost purchase to usage"
    sql:
      CASE WHEN
        ${status} = 'terminated'
        AND ${usage_id} IS NOT NULL
        AND ${updated_time} > ${created_time}
      THEN DATEDIFF(minute, ${created_raw}, ${updated_raw})
      ELSE NULL
      END ;;
  }

  measure: boost_to_payment_mins_min {
    type: min
    description: "minimum time to take from boost purchase to usage"
    sql:
      CASE WHEN
        ${status} = 'terminated'
        AND ${usage_id} IS NOT NULL
        AND ${updated_time} > ${created_time}
      THEN DATEDIFF(minute, ${created_raw}, ${updated_raw})
      ELSE NULL
      END ;;
  }
}
