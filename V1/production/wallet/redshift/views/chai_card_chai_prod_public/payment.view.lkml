view: chai_payment {
  sql_table_name: chai_card_chai_public.payment ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: billing_amount {
    type: number
    sql: ${TABLE}.billing_amount ;;
  }

  dimension: canceled_amount {
    type: number
    sql: ${TABLE}.canceled_amount ;;
  }

  dimension: canceled_billing_amount {
    type: number
    sql: ${TABLE}.canceled_billing_amount ;;
  }

  dimension: canceled_cash_amount {
    type: number
    sql: ${TABLE}.canceled_cash_amount ;;
  }

  dimension: canceled_cashback_amount {
    type: number
    sql: ${TABLE}.canceled_cashback_amount ;;
  }

  dimension: canceled_discount_amount {
    type: number
    sql: ${TABLE}.canceled_discount_amount ;;
  }

  dimension: canceled_point_amount {
    type: number
    sql: ${TABLE}.canceled_point_amount ;;
  }

  dimension: cash_amount {
    type: number
    sql: ${TABLE}.cash_amount ;;
  }

  dimension: cashback_amount {
    type: number
    sql: ${TABLE}.cashback_amount ;;
  }

  dimension: charging_amount {
    type: number
    sql: ${TABLE}.charging_amount ;;
  }

  dimension: checkout_amount {
    type: number
    sql: ${TABLE}.checkout_amount ;;
  }

  dimension: coupon_id {
    type: string
    sql: ${TABLE}.coupon_id ;;
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

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension: data {
    type: string
    sql: ${TABLE}.data ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: discount_amount {
    type: number
    sql: ${TABLE}.discount_amount ;;
  }

  dimension: idempotency_key {
    type: string
    sql: ${TABLE}.idempotency_key ;;
  }

  dimension: merchant_cashback_amount {
    type: number
    sql: ${TABLE}.merchant_cashback_amount ;;
  }

  dimension: merchant_discount_amount {
    type: number
    sql: ${TABLE}.merchant_discount_amount ;;
  }

  dimension: merchant_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.merchant_id ;;
  }

  dimension: month {
    type: number
    sql: ${TABLE}.month ;;
  }

  dimension: point_amount {
    type: number
    sql: ${TABLE}.point_amount ;;
  }

  dimension: return_url {
    type: string
    sql: ${TABLE}.return_url ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: sub_merchant_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.sub_merchant_id ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension_group: updated {
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
    sql: ${TABLE}.updated_at ;;
  }

  dimension: user_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  dimension: version {
    type: number
    sql: ${TABLE}.version ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }

  dimension: payment_method {
    description: "method of payment (PLCC, Debit, E-wallet)"
    sql: case
            when ${TABLE}.merchant_id='0385e3db-4a50-4035-9285-1ced4a3e0209' then '차이 체크카드'
            when ${TABLE}.merchant_id='8d9a7bd7-c6e1-408e-972a-b59369cb6bb1' then '차이 신용카드'
        else '간편결제' end ;;
  }

  measure: count {
    type: count
  }

  measure: unique_user_count {
    type: count_distinct
    description: "# of unique paying user. it means distinct function is used."
    sql: ${TABLE}.user_id ;;
  }

  measure: total_checkout_amount {
    type: sum
    sql: coalesce(${checkout_amount},0) ;;
  }

  measure: total_cashback_amount {
    type: sum
    sql: coalesce(${cashback_amount},0) ;;
  }

  measure: total_billing_amount {
    type: sum
    sql: coalesce(${billing_amount},0) ;;
  }

  measure: total_charging_amount {
    type: sum
    sql: coalesce(${charging_amount},0) ;;
  }

}
