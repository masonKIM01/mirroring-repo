view: sql_runner_query {
  sql_table_name:  druid.tbl_iamport_payments ;;

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension_group: __time {
    type: time
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

  dimension: app_schema {
    type: string
    sql: ${TABLE}."app_schema" ;;
  }

  dimension: app_version {
    type: string
    sql: ${TABLE}."app_version" ;;
  }

  dimension: apply_num {
    type: number
    sql: ${TABLE}."apply_num" ;;
  }

  dimension: browser {
    type: string
    sql: ${TABLE}."browser" ;;
  }

  dimension: cancel_amount {
    type: string
    sql: ${TABLE}."cancel_amount" ;;
  }

  dimension: cancel_reason {
    type: string
    sql: ${TABLE}."cancel_reason" ;;
  }

  dimension: cancelled_at {
    type: string
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
    type: string
    sql: ${TABLE}."failed_at" ;;
  }

  dimension: id {
    type: number
    sql: ${TABLE}."id" ;;
  }

  dimension: imp_uid {
    type: string
    sql: ${TABLE}."imp_uid" ;;
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

  dimension: operation {
    type: string
    sql: ${TABLE}."operation" ;;
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
    type: string
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

  dimension: pg_tid {
    type: string
    sql: ${TABLE}."pg_tid" ;;
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
    type: string
    sql: ${TABLE}."user_id" ;;
  }

  dimension: vat {
    type: string
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
    type: string
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

  set: detail {
    fields: [
      __time_time,
      amount,
      amount_in_krw,
      app_name,
      app_schema,
      app_version,
      apply_num,
      browser,
      cancel_amount,
      cancel_reason,
      cancelled_at,
      card_code,
      card_code_std,
      card_installment_type,
      card_quota,
      channel,
      confirm_response,
      confirm_url,
      currency,
      custom_data,
      device,
      device_brand,
      device_type,
      fail_reason,
      failed_at,
      id,
      imp_uid,
      is_escrow,
      m_redirect_url,
      merchant_uid,
      modified,
      name,
      notification_url,
      operation,
      origin,
      os_name,
      os_version,
      paid_at,
      pay_method,
      pg_ext_key,
      pg_ext_priv,
      pg_id,
      pg_provider,
      pg_tid,
      sandbox,
      status,
      unique_id,
      user_agent,
      user_id,
      vat,
      vbank_code,
      vbank_code_std,
      vbank_date,
      vbank_holder,
      vbank_num,
      vbank_status
    ]
  }
}
