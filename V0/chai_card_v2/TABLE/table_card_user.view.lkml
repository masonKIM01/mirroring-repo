view: table_card_user {
  derived_table: {
    sql: select *
      from chai_card_chai_prod_public.card_user
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: ci {
    type: string
    sql: ${TABLE}.ci ;;
  }

  set: detail {
    fields: [id, ci]
  }
}
