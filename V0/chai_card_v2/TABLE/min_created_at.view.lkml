view: min_created_at {
  derived_table: {
    sql: select
        p.user_id, min(p.created_at) as min_created_at
      from chai_card_chai_prod_public.payment p
      group by 1
       ;;
  }

  measure: users {
    type: count_distinct
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension_group: min_created_at {
    type: time
    sql: ${TABLE}.min_created_at ;;
  }

  set: detail {
    fields: [user_id, min_created_at_time]
  }
}
