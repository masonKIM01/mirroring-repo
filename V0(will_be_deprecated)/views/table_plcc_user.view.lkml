view: table_plcc_user {
  derived_table: {
    sql: select
      ks.user_id, ca.created_at, ca.status, ca.user_id as card_user_id, ca.year, ca.month
      from chai_card_chai_public.korea_spec ks
      inner join chai_card_chai_public.card_user cu on cu.ci = ks.ci
      inner join chai_card_plcc_public.card_application ca on ca.user_id = cu.id
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: count_user {
    type: count_distinct
    sql: ${TABLE}.user_id ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension_group: created_at {
    type: time
    sql: ${TABLE}.created_at ;;
  }

  dimension: card_user_id {
    type: string
    sql: ${TABLE}.card_user_id ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
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
    fields: [user_id, created_at_time, card_user_id, status, year, month]
  }
}
