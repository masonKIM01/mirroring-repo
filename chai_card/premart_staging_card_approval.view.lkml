view: premart_staging_card_approval {
  sql_table_name: premart_staging.card_approval;;

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: approval_date {
    type: string
    sql: ${TABLE}.approval_date ;;
  }

  dimension: approval_process_code {
    type: string
    sql: ${TABLE}.approval_process_code ;;
  }

  dimension: approval_time {
    type: string
    sql: ${TABLE}.approval_time ;;
  }

  dimension: card_approval_amount {
    type: number
    sql: ${TABLE}.card_approval_amount ;;
  }

  dimension: card_approval_no {
    type: string
    sql: ${TABLE}.card_approval_no ;;
  }

  dimension: payment_id {
    type: string
    sql: ${TABLE}.payment_id ;;
  }

  dimension: merchant_business_code {
    type: string
    sql: ${TABLE}.merchant_business_code ;;
  }

  dimension: merchant_name {
    type: string
    sql: ${TABLE}.merchant_name ;;
  }

  dimension: merchant_no {
    type: string
    sql: ${TABLE}.merchant_no ;;
  }

  dimension: sales_amount {
    type: number
    sql: ${TABLE}.sales_amount ;;
  }

  dimension: service_fee {
    type: number
    sql: ${TABLE}.service_fee ;;
  }

  dimension: tax_amount {
    type: number
    sql: ${TABLE}.tax_amount ;;
  }

  dimension: trade_approval_seq {
    type: number
    sql: ${TABLE}.trade_approval_seq ;;
  }

  set: detail {
    fields: [
      approval_date,
      approval_process_code,
      approval_time,
      card_approval_amount,
      card_approval_no,
      payment_id,
      merchant_business_code,
      merchant_name,
      merchant_no,
      sales_amount,
      service_fee,
      tax_amount,
      trade_approval_seq
    ]
  }
}
