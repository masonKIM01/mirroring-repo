view: chai_topup {
  sql_table_name: chai_card_chai_prod_public.topup ;;
  drill_fields: [id]

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: amount_sum {
    type: sum
    description: "sum of amount"
    sql: ${TABLE}.amount ;;
  }

  measure: users {
    type: count_distinct
    sql: ${TABLE}.user_id ;;
  }

  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension: is_auto_charge {
    type: string
    sql: ${TABLE}.is_auto_charge ;;
  }

  dimension: data {
    type: string
    sql: ${TABLE}.data ;;
  }

  dimension_group: created_at {
    type: time
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: updated_at {
    type: time
    sql: ${TABLE}.updated_at ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
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
      type,
      status,
      currency,
      amount,
      is_auto_charge,
      data,
      created_at_time,
      updated_at_time,
      user_id,
      year,
      month
    ]
  }
}
