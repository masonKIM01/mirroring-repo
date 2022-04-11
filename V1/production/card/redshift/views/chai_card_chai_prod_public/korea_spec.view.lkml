view: chai_card_chai_prod_public_korea_spec {
  sql_table_name: chai_card_chai_prod_public.korea_spec ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: agreements {
    type: string
    sql: ${TABLE}.agreements ;;
  }

  dimension: cash_receipt_type {
    type: string
    sql: ${TABLE}.cash_receipt_type ;;
  }

  dimension: ci {
    type: string
    sql: ${TABLE}.ci ;;
  }

  dimension: di {
    type: string
    sql: ${TABLE}.di ;;
  }

  dimension: is_foreigner {
    type: yesno
    sql: ${TABLE}.is_foreigner ;;
  }

  dimension_group: open_banking_agreed {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.open_banking_agreed_date ;;
  }

  dimension: open_banking_status {
    type: string
    sql: ${TABLE}.open_banking_status ;;
  }

  dimension: pg_primary_account {
    type: string
    sql: ${TABLE}.pg_primary_account ;;
  }

  dimension: registration_number {
    type: string
    sql: ${TABLE}.registration_number ;;
  }

  dimension: user_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
  }
}
