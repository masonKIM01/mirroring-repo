view: card_issue {
  derived_table: {
    sql: select
      case when a.date >= '2021-11-18 16:04:42.514' then 'master' else 'red' end as card_type,
      case when a.date = a.first_issued_date then 'first_issue'
      else 'reissue'
      end as type
      , a.user_id
      , a.date
      from (select ca.user_id, date(ca.accident_enrollment_date), min(date(ca.accident_enrollment_date))over(partition by ca.user_id) as first_issued_date
      from chai_card_chai_card_prod_public.card_accident_receipt_history ca
      where ca.card_accident_code = '0069'
      group by 1,2)a
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: user_count {
    type: count_distinct
    sql: ${TABLE}.user_id ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: card_type {
    type: string
    sql: ${TABLE}.card_type ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension_group: date_field {
    type: time
    timeframes: [year, month, week, month_num, month_name, date, week_of_year]
    sql: ${TABLE}.date ;;
  }


  set: detail {
    fields: [card_type, type, user_id, date_field_date]
  }
}
