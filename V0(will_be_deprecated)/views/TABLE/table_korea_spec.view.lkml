view: table_korea_spec {
  derived_table: {
    sql: select *
      from chai_card_chai_prod_public.korea_spec
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: ci {
    type: string
    sql: ${TABLE}.ci ;;
  }

  dimension: di {
    type: string
    sql: ${TABLE}.di ;;
  }

  dimension: cash_receipt_type {
    type: string
    sql: ${TABLE}.cash_receipt_type ;;
  }

  dimension: pg_primary_account {
    type: string
    sql: ${TABLE}.pg_primary_account ;;
  }

  dimension: agreements {
    type: string
    sql: ${TABLE}.agreements ;;
  }

  dimension: registration_number {
    type: string
    sql: ${TABLE}.registration_number ;;
  }

  dimension: open_banking_status {
    type: string
    sql: ${TABLE}.open_banking_status ;;
  }

  dimension_group: open_banking_agreed_date {
    type: time
    sql: ${TABLE}.open_banking_agreed_date ;;
  }

  set: detail {
    fields: [
      id,
      user_id,
      ci,
      di,
      cash_receipt_type,
      pg_primary_account,
      agreements,
      registration_number,
      open_banking_status,
      open_banking_agreed_date_time
    ]
  }
}
