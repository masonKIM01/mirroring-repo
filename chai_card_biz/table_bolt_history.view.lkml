view: table_bolt_history {
  derived_table: {
    sql: select *
      from chai_card_chai_prod_public.bolt_history bh
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: bolt_in {
    type: sum
    sql: case when ${action} = 'accumulation' then ${count_} end ;;
  }

  measure: bolt_out {
    type: sum
    sql: case when ${action} = 'deduction' then ${count_} end ;;
  }

  measure: bolt_earned {
    type: sum
    sql: case when ${type} = 'payment_in' then ${count_} end ;;
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
    primary_key: yes
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

  dimension: sub_title {
    type: string
    sql: ${TABLE}.sub_title ;;
  }

  dimension: available_bolt {
    type: number
    sql: ${TABLE}.available_bolt ;;
  }

  dimension: from_id {
    type: string
    sql: ${TABLE}.from_id ;;
  }

  set: detail {
    fields: [
      created_at_time,
      type,
      count_,
      user_id,
      id,
      action,
      sub_title,
      available_bolt,
      from_id
    ]
  }
}
