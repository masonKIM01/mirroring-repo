view: chai_boost_up {
  sql_table_name: chai_card_chai_prod_public.boost_up;;

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: total_cashback_amount {
    type: sum
    sql: ${TABLE}.cashback_amount ;;
  }

  measure: users {
    type: count_distinct
    sql: ${TABLE}.user_id ;;
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: result_type {
    type: string
    sql: ${TABLE}.result_type ;;
  }

  dimension: level {
    type: number
    sql: ${TABLE}.level ;;
  }

  dimension: boost_up_moment {
    type: string
    sql: ${TABLE}.boost_up_moment ;;
  }

  dimension: bolt_price {
    type: number
    sql: ${TABLE}.bolt_price ;;
  }

  dimension: cashback_amount {
    type: number
    sql: ${TABLE}.cashback_amount ;;
  }

  dimension: discount_rate {
    type: number
    sql: ${TABLE}.discount_rate ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: boost_campaign_id {
    type: number
    sql: ${TABLE}.boost_campaign_id ;;
  }

  dimension: boost_id {
    type: number
    sql: ${TABLE}.boost_id ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: boost_up_policy_id {
    type: number
    sql: ${TABLE}.boost_up_policy_id ;;
  }

  dimension_group: created_at {
    type: time
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: updated_at {
    type: time
    sql: ${TABLE}.updated_at ;;
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
      result_type,
      level,
      boost_up_moment,
      bolt_price,
      cashback_amount,
      discount_rate,
      status,
      boost_campaign_id,
      boost_id,
      user_id,
      boost_up_policy_id,
      created_at_time,
      updated_at_time,
      year,
      month
    ]
  }
}
