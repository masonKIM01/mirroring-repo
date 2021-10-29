view: card_accident {
  derived_table: {
    sql: select
      date(date), count(user_id)
      from
      (select
      user_id, max(accident_enrollment_date) as date
      from raw_rds_production.card_accident_receipt_history
      group by 1)a
      group by 1
      order by 1 desc
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: date {
    type: date
    primary_key: yes
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
