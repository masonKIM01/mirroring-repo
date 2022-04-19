view: table_redshift_bolt_history {
  derived_table: {
    sql: select *
        from chai_card_chai_prod_public.bolt_history bh
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

  measure: count_bolt {
    type: sum
    sql: ${TABLE}.count ;;
  }

  dimension_group: created_at {
    type: time
    sql: ${TABLE}.created_at ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: count_ {
    type: number
    sql: ${TABLE}.count ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: action {
    type: string
    sql: ${TABLE}.action ;;
  }

  dimension: subtitle {
    type: string
    sql: ${TABLE}.subtitle ;;
  }

  dimension: available_bolt {
    type: number
    sql: ${TABLE}.available_bolt ;;
  }

  dimension: from_id {
    type: string
    sql: ${TABLE}.from_id ;;
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
      created_at_time,
      type,
      count_,
      user_id,
      id,
      action,
      subtitle,
      available_bolt,
      from_id,
      year,
      month
    ]
  }
}
