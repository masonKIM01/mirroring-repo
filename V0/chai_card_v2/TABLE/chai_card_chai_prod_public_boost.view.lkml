view: chai_card_chai_prod_public_boost {
  derived_table: {
    sql: select *
      from chai_card_chai_prod_public.boost b
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

  dimension_group: usable_from {
    type: time
    sql: ${TABLE}.usable_from ;;
  }

  dimension_group: usable_to {
    type: time
    sql: ${TABLE}.usable_to ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: payment_id {
    type: string
    sql: ${TABLE}.payment_id ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: boost_promotion_id {
    type: number
    sql: ${TABLE}.boost_promotion_id ;;
  }

  dimension: usage_id {
    type: string
    sql: ${TABLE}.usage_id ;;
  }

  dimension: usage_type {
    type: string
    sql: ${TABLE}.usage_type ;;
  }

  dimension: boost_campaign_id {
    type: number
    sql: ${TABLE}.boost_campaign_id ;;
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
      usable_from_time,
      usable_to_time,
      status,
      payment_id,
      user_id,
      boost_promotion_id,
      usage_id,
      usage_type,
      boost_campaign_id,
      year,
      month
    ]
  }
}
