view: chai_card_user {
  sql_table_name: chai_card_chai_public.card_user ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: ci {
    type: string
    sql: ${TABLE}.ci ;;
  }

  measure: count {
    type: count
  }
}
