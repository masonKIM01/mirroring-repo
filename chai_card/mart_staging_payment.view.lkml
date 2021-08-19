view: mart_staging_payment {
  sql_table_name: mart_staging.payment ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: bolt_price {
    type: number
    sql: ${TABLE}.bolt_price ;;
  }

  dimension: boost_cashback {
    type: number
    sql: ${TABLE}.boost_cashback ;;
  }

  dimension: boost_promotion_id {
    type: number
    sql: ${TABLE}.boost_promotion_id ;;
  }

  dimension: brand_name {
    type: string
    sql: ${TABLE}.brand_name ;;
  }

  dimension: canceled_amount {
    type: number
    sql: ${TABLE}.canceled_amount ;;
  }

  dimension: card_approval_no {
    type: string
    sql: ${TABLE}.card_approval_no ;;
  }

  dimension: checkout_amount {
    type: number
    sql: ${TABLE}.checkout_amount ;;
  }

  dimension_group: created {
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
    sql: ${TABLE}.created_at ;;
  }

  dimension: customer_id {
    type: string
    sql: ${TABLE}.customer_id ;;
  }

  dimension: idempotency_key {
    type: string
    sql: ${TABLE}.idempotency_key ;;
  }

  dimension: merchant_name {
    type: string
    sql: ${TABLE}.merchant_name ;;
  }

  dimension: merchant_no {
    type: string
    sql: ${TABLE}.merchant_no ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: sub_title {
    type: string
    sql: ${TABLE}.sub_title ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  measure: count {
    type: count
    drill_fields: [id, merchant_name, brand_name]
  }

  measure: total_checkout_amount {
    type: sum
    sql: COALESCE(${checkout_amount},0) ;;
  }

  measure: total_cashback_amount {
    type: sum
    sql: COALESCE(${boost_cashback},0) ;;
  }

  measure: checkout_ratio {
    type: number
    sql: ${total_cashback_amount} / ${total_checkout_amount} ;;
  }

}
