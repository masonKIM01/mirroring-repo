explore: payment_staging{}
view: payment_staging {
  sql_table_name:  mart_staging.payment ;;

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension_group: created_at {
    type: time
    sql: ${TABLE}.created_at ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: customer_id {
    type: string
    sql: ${TABLE}.customer_id ;;
  }

  dimension: idempotency_key {
    type: string
    sql: ${TABLE}.idempotency_key ;;
  }

  dimension: checkout_amount {
    type: number
    sql: ${TABLE}.checkout_amount ;;
  }

  dimension: canceled_amount {
    type: number
    sql: ${TABLE}.canceled_amount ;;
  }

  dimension: boost_promotion_id {
    type: number
    sql: ${TABLE}.boost_promotion_id ;;
  }

  dimension: sub_title {
    type: string
    sql: ${TABLE}.sub_title ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: bolt_price {
    type: number
    sql: ${TABLE}.bolt_price ;;
  }

  dimension: boost_cashback {
    type: number
    sql: ${TABLE}.boost_cashback ;;
  }

  dimension: merchant_name {
    type: string
    sql: ${TABLE}.merchant_name ;;
  }

  dimension: merchant_no {
    type: string
    sql: ${TABLE}.merchant_no ;;
  }

  dimension: card_approval_no {
    type: string
    sql: ${TABLE}.card_approval_no ;;
  }

  dimension: brand_name {
    type: string
    sql: ${TABLE}.brand_name ;;
  }

  set: detail {
    fields: [
      created_at_time,
      status,
      id,
      customer_id,
      idempotency_key,
      checkout_amount,
      canceled_amount,
      boost_promotion_id,
      sub_title,
      title,
      bolt_price,
      boost_cashback,
      merchant_name,
      merchant_no,
      card_approval_no,
      brand_name
    ]
  }
}
