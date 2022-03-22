view: druid_tbl_iamport_payments {
  sql_table_name: druid.tbl_iamport_payments ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}."id" ;;
  }

  dimension_group: __time {
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
    sql: ${TABLE}."__time" ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}."amount" ;;
  }

  dimension: amount_in_krw {
    type: number
    sql: ${TABLE}."amount_in_krw" ;;
  }

  dimension: app_name {
    type: string
    sql: ${TABLE}."app_name" ;;
  }

  dimension: app_scheme {
    type: string
    sql: ${TABLE}."app_scheme" ;;
  }

  dimension: app_version {
    type: string
    sql: ${TABLE}."app_version" ;;
  }

  dimension: browser {
    type: string
    sql: ${TABLE}."browser" ;;
  }

  dimension: buyer_email_hashed {
    type: string
    sql: ${TABLE}."buyer_email_hashed" ;;
  }

  dimension: buyer_email_name_hashed {
    type: string
    sql: ${TABLE}."buyer_email_name_hashed" ;;
  }

  dimension: buyer_email_name_tel_hashed {
    type: string
    sql: ${TABLE}."buyer_email_name_tel_hashed" ;;
  }

  dimension: buyer_email_tel_hashed {
    type: string
    sql: ${TABLE}."buyer_email_tel_hashed" ;;
  }

  dimension: cancel_amount {
    type: number
    sql: ${TABLE}."cancel_amount" ;;
  }

  dimension: cancel_reason {
    type: string
    sql: ${TABLE}."cancel_reason" ;;
  }

  dimension: cancelled_at {
    type: number
    sql: ${TABLE}."cancelled_at" ;;
  }

  dimension: card_code {
    type: string
    sql: ${TABLE}."card_code" ;;
  }

  dimension: card_code_std {
    type: string
    sql: ${TABLE}."card_code_std" ;;
  }

  dimension: card_installment_type {
    type: string
    sql: ${TABLE}."card_installment_type" ;;
  }

  dimension: card_quota {
    type: number
    sql: ${TABLE}."card_quota" ;;
  }

  dimension: channel {
    type: string
    sql: ${TABLE}."channel" ;;
  }

  dimension: confirm_response {
    type: string
    sql: ${TABLE}."confirm_response" ;;
  }

  dimension: confirm_url {
    type: string
    sql: ${TABLE}."confirm_url" ;;
  }

  dimension: created {
    type: number
    sql: ${TABLE}."created" ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}."currency" ;;
  }

  dimension: custom_data {
    type: string
    sql: ${TABLE}."custom_data" ;;
  }

  dimension: device {
    type: string
    sql: ${TABLE}."device" ;;
  }

  dimension: device_brand {
    type: string
    sql: ${TABLE}."device_brand" ;;
  }

  dimension: device_type {
    type: string
    sql: ${TABLE}."device_type" ;;
  }

  dimension: fail_reason {
    type: string
    sql: ${TABLE}."fail_reason" ;;
  }

  dimension: failed_at {
    type: number
    sql: ${TABLE}."failed_at" ;;
  }

  dimension: is_escrow {
    type: number
    sql: ${TABLE}."is_escrow" ;;
  }

  dimension: m_redirect_url {
    type: string
    sql: ${TABLE}."m_redirect_url" ;;
  }

  dimension: merchant_uid {
    type: string
    sql: ${TABLE}."merchant_uid" ;;
  }

  dimension: modified {
    type: number
    sql: ${TABLE}."modified" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }

  dimension: notification_url {
    type: string
    sql: ${TABLE}."notification_url" ;;
  }

  dimension: origin {
    type: string
    sql: ${TABLE}."origin" ;;
  }

  dimension: os_name {
    type: string
    sql: ${TABLE}."os_name" ;;
  }

  dimension: os_version {
    type: string
    sql: ${TABLE}."os_version" ;;
  }

  dimension: paid_at {
    type: number
    sql: ${TABLE}."paid_at" ;;
  }

  dimension: pay_method {
    type: string
    sql: ${TABLE}."pay_method" ;;
  }

  dimension: pg_ext_key {
    type: string
    sql: ${TABLE}."pg_ext_key" ;;
  }

  dimension: pg_ext_priv {
    type: string
    sql: ${TABLE}."pg_ext_priv" ;;
  }

  dimension: pg_id {
    type: string
    sql: ${TABLE}."pg_id" ;;
  }

  dimension: pg_provider {
    type: string
    sql: ${TABLE}."pg_provider" ;;
  }

  dimension: sandbox {
    type: number
    sql: ${TABLE}."sandbox" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."status" ;;
  }

  dimension: unique_id {
    type: string
    sql: ${TABLE}."unique_id" ;;
  }

  dimension: user_agent {
    type: string
    sql: ${TABLE}."user_agent" ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}."user_id" ;;
  }

  dimension: vat {
    type: number
    sql: ${TABLE}."vat" ;;
  }

  dimension: vbank_code {
    type: string
    sql: ${TABLE}."vbank_code" ;;
  }

  dimension: vbank_code_std {
    type: string
    sql: ${TABLE}."vbank_code_std" ;;
  }

  dimension: vbank_date {
    type: number
    sql: ${TABLE}."vbank_date" ;;
  }

  dimension: vbank_holder {
    type: string
    sql: ${TABLE}."vbank_holder" ;;
  }

  dimension: vbank_num {
    type: string
    sql: ${TABLE}."vbank_num" ;;
  }

  dimension: vbank_status {
    type: string
    sql: ${TABLE}."vbank_status" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, app_name, name, os_name]
  }
}
