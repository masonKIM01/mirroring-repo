view: chai_delayed_cashback_history {
  sql_table_name: chai_card_chai_prod_public.delayed_cashback_history ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: action_type {
    type: string
    sql: ${TABLE}.action_type ;;
  }

  dimension: billing_delta {
    type: number
    sql: ${TABLE}.billing_delta ;;
  }

  dimension: boost_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.boost_id ;;
  }

  dimension: cashback_delta {
    type: number
    sql: ${TABLE}.cashback_delta ;;
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

  dimension: is_public_transportation {
    type: yesno
    sql: ${TABLE}.is_public_transportation ;;
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

  dimension: promotion_id {
    type: string
    sql: ${TABLE}.promotion_id ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension_group: target {
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
    sql: ${TABLE}.target_date ;;
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

  dimension: user_ci {
    type: string
    sql: ${TABLE}.user_ci ;;
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
