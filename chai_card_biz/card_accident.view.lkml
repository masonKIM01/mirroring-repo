view: card_accident {
  derived_table: {
    sql: select
      date(accident_enrollment_date) as date, user_id
      from chai_card_chai_card_prod_public.card_accident_receipt_history
      where card_accident_code = '0061'
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: count_user {
    type: count_distinct
    sql: ${TABLE}.user_id;;
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

  dimension_group: created_at {
    type: time
    sql: ${TABLE}.date ;;
  }

  dimension: count_ {
    type: number
    sql: ${TABLE}.count ;;
  }

  set: detail {
    fields: [date, count_, created_at_time]
  }
}
