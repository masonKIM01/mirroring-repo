view: chai_settlement {
  sql_table_name: chai_card_chai_prod_public.settlement ;;

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: plus_amount_total {
    type: sum
    sql: ${TABLE}.plus_amount ;;
  }

  measure: minus_amount_total {
    description: "refund_amount"
    type: sum
    sql: ${TABLE}.minus_amount ;;
  }

  measure: checkout_amount_total {
    type: sum
    sql: coalesce(${TABLE}.plus_amount,0) + coalesce(${TABLE}.minus_amount,0) ;;
  }

  measure: fee_amount_total {
    type: sum
    sql: ${TABLE}.fee_amount ;;
  }

  measure: fee_tax_amount_total {
    type: sum
    sql: ${TABLE}.fee_tax_amount ;;
  }

  dimension_group: created_at {
    type: time
    sql: ${TABLE}.created_at ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: merchant_id {
    type: string
    sql: ${TABLE}.merchant_id ;;
  }

  dimension: plus_amount {
    type: number
    sql: ${TABLE}.plus_amount ;;
  }

  dimension: minus_amount {
    type: number
    sql: ${TABLE}.minus_amount ;;
  }

  dimension: fee_amount {
    type: number
    sql: ${TABLE}.fee_amount ;;
  }

  dimension: fee_tax_amount {
    type: number
    sql: ${TABLE}.fee_tax_amount ;;
  }

  dimension_group: settlement_date {
    type: time
    sql: ${TABLE}.settlement_date ;;
  }

  dimension_group: reference_date {
    type: time
    sql: ${TABLE}.reference_date ;;
  }

  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: transaction_count {
    type: number
    sql: ${TABLE}.transaction_count ;;
  }

  dimension: refund_count {
    type: number
    sql: ${TABLE}.refund_count ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }

  dimension: month {
    type: number
    sql: ${TABLE}.month ;;
  }

  set: detail {
    fields: [
      created_at_time,
      status,
      merchant_id,
      plus_amount,
      minus_amount,
      fee_amount,
      fee_tax_amount,
      settlement_date_time,
      reference_date_time,
      id,
      transaction_count,
      refund_count,
      year,
      month
    ]
  }
}
