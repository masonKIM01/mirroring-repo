view: table_delayed_cashback {
  derived_table: {
    sql: select *
      from chai_card_chai_prod_public.delayed_cashback_history
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
    sql: ${TABLE}.id ;;
  }

  dimension_group: created_at {
    type: time
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: updated_at {
    type: time
    sql: ${TABLE}.updated_at ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: action_type {
    type: string
    sql: ${TABLE}.action_type ;;
  }

  dimension_group: target_date {
    type: time
    sql: ${TABLE}.target_date ;;
  }

  dimension: cashback_delta {
    type: number
    sql: ${TABLE}.cashback_delta ;;
  }

  dimension: is_public_transportation {
    type: string
    sql: ${TABLE}.is_public_transportation ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: user_ci {
    type: string
    sql: ${TABLE}.user_ci ;;
  }

  dimension: boost_id {
    type: number
    sql: ${TABLE}.boost_id ;;
  }

  dimension: payment_id {
    type: string
    primary_key: yes
    sql: ${TABLE}.payment_id ;;
  }

  dimension: promotion_id {
    type: string
    sql: ${TABLE}.promotion_id ;;
  }

  dimension: billing_delta {
    type: number
    sql: ${TABLE}.billing_delta ;;
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
      status,
      action_type,
      target_date_time,
      cashback_delta,
      is_public_transportation,
      user_id,
      user_ci,
      boost_id,
      payment_id,
      promotion_id,
      billing_delta,
      year,
      month
    ]
  }
}
