view: card_accident {
  derived_table: {
    sql: select
      max(accident_enrollment_date) as date, user_id
      from raw_rds_production.card_accident_receipt_history
      group by 2
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
    primary_key: yes
    sql: ${TABLE}.user_id ;;
  }

  dimension: date {
    type: date
    sql: ${TABLE}.date ;;
  }

  dimension: count_ {
    type: number
    sql: ${TABLE}.count ;;
  }

  set: detail {
    fields: [date, count_]
  }
}
