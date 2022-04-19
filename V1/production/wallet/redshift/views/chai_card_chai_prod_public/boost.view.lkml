view: chai_boost {
  sql_table_name: chai_card_chai_prod_public.boost ;;
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

  measure: count {
    type: count
  }
}
