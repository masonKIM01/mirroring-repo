view: payments {
  sql_table_name: hmscatalog.importdb.payments ;;

  suggestions: no

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: unique_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.unique_id ;;
  }

  dimension: id {
    hidden: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: channel {
    type: string
    sql: ${TABLE}.channel ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension: amount {
    hidden: yes
    type: number
    sql: ${TABLE}.amount ;;
  }

  measure: total_amount {
    type: sum
    sql: ${amount_in_krw} ;;
    label: "Amount in KRW"
    # value_format_name: usd_0
    value_format: "₩#,##0.00" #krw formatting
  }

  dimension: amount_in_krw {
    type: number
    sql: ${TABLE}.amount_in_krw ;;
  }

  dimension: vat {
    type: number
    sql: ${TABLE}.vat ;;
  }

  dimension: cancel_amount {
    type: number
    sql: ${TABLE}.cancel_amount ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: imp_uid {
    hidden: yes
    type: string
    sql: ${TABLE}.imp_uid ;;
  }

  dimension: merchant_uid {
    type: string
    sql: ${TABLE}.merchant_uid ;;
  }

  dimension: pg_tid {
    hidden: yes
    type: string
    sql: ${TABLE}.pg_tid ;;
  }

  dimension: pg_provider {
    type: string
    sql: ${TABLE}.pg_provider ;;
  }

  dimension: formatted_pg_provider {
    type: string
    sql: ${TABLE}.formatted_pg_provider ;;
  }

  dimension: pg_id {
    type: string
    sql: ${TABLE}.pg_id ;;
  }

  dimension: pg_ext_key {
    type: string
    sql: ${TABLE}.pg_ext_key ;;
  }

  dimension: pg_ext_priv {
    type: string
    sql: ${TABLE}.pg_ext_priv ;;
  }

  dimension: sandbox {
    type: number
    sql: ${TABLE}.sandbox ;;
  }

  dimension: pay_method {
    type: string
    sql: ${TABLE}.pay_method ;;
  }

  dimension: apply_num {
    type: string
    sql: ${TABLE}.apply_num ;;
  }

  dimension: card_code {
    type: string
    sql: ${TABLE}.card_code ;;
  }

  dimension: card_quota {
    type: number
    sql: ${TABLE}.card_quota ;;
  }

  dimension: vbank_num {
    type: string
    sql: ${TABLE}.vbank_num ;;
  }

  dimension_group: vbank_date {
    type: time
    sql: ${TABLE}.vbank_date ;;
  }

  dimension: vbank_holder {
    type: string
    sql: ${TABLE}.vbank_holder ;;
  }

  dimension: vbank_code {
    type: string
    sql: ${TABLE}.vbank_code ;;
  }

  dimension: is_escrow {
    type: number
    sql: ${TABLE}.is_escrow ;;
  }

  dimension: buyer_name {
    type: string
    sql: ${TABLE}.buyer_name ;;
  }

  dimension: buyer_email {
    type: string
    sql: ${TABLE}.buyer_email ;;
  }

  dimension: buyer_tel {
    type: string
    sql: ${TABLE}.buyer_tel ;;
  }

  dimension: rev_buyer_tel {
    type: string
    sql: ${TABLE}.rev_buyer_tel ;;
  }

  dimension: buyer_addr {
    type: string
    sql: ${TABLE}.buyer_addr ;;
  }

  dimension: buyer_postcode {
    type: string
    sql: ${TABLE}.buyer_postcode ;;
  }

  dimension: custom_data {
    type: string
    sql: ${TABLE}.custom_data ;;
  }

  dimension: user_agent {
    type: string
    sql: ${TABLE}.user_agent ;;
  }

  dimension: os_name {
    type: string
    #insert athena specific function to get substring/regex
    # sql:  ;;
  }

  dimension: user_ip {
    type: string
    sql: ${TABLE}.user_ip ;;
  }

  dimension: origin {
    type: string
    sql: ${TABLE}.origin ;;
  }

  dimension: app_scheme {
    type: string
    sql: ${TABLE}.app_scheme ;;
  }

  dimension: m_redirect_url {
    type: string
    sql: ${TABLE}.m_redirect_url ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension_group: paid_at {
    type: time
    sql: ${TABLE}.paid_at ;;
  }

  dimension_group: failed_at {
    type: time
    sql: ${TABLE}.failed_at ;;
  }

  dimension_group: cancelled_at {
    type: time
    sql: ${TABLE}.cancelled_at ;;
  }

  dimension: fail_reason {
    type: string
    sql: ${TABLE}.fail_reason ;;
  }

  dimension: cancel_reason {
    type: string
    sql: ${TABLE}.cancel_reason ;;
  }

  dimension: confirm_url {
    type: string
    sql: ${TABLE}.confirm_url ;;
  }

  dimension: notification_url {
    type: string
    sql: ${TABLE}.notification_url ;;
  }

  dimension: confirm_response {
    type: string
    sql: ${TABLE}.confirm_response ;;
  }

  dimension_group: created {
    type: time
    sql: ${TABLE}.created ;;
  }

  dimension_group: date_field {
    type: time
    timeframes: [year, month, month_num, month_name, date, week_of_year]
    sql: ${TABLE}.created ;;
  }

  dimension_group: modified {
    type: time
    sql: ${TABLE}.modified ;;
  }

  dimension: yearmonth {
    type: string
    sql: ${TABLE}.yearmonth ;;
    suggest_persist_for: "24 hours"
  }

  set: detail {
    fields: [
      unique_id,
      id,
      user_id,
      channel,
      currency,
      amount,
      amount_in_krw,
      vat,
      cancel_amount,
      name,
      imp_uid,
      merchant_uid,
      pg_tid,
      pg_provider,
      formatted_pg_provider,
      pg_id,
      pg_ext_key,
      pg_ext_priv,
      sandbox,
      pay_method,
      apply_num,
      card_code,
      card_quota,
      vbank_num,
      vbank_date_time,
      vbank_holder,
      vbank_code,
      is_escrow,
      buyer_name,
      buyer_email,
      buyer_tel,
      rev_buyer_tel,
      buyer_addr,
      buyer_postcode,
      custom_data,
      user_agent,
      user_ip,
      origin,
      app_scheme,
      m_redirect_url,
      status,
      paid_at_time,
      failed_at_time,
      cancelled_at_time,
      fail_reason,
      cancel_reason,
      confirm_url,
      notification_url,
      confirm_response,
      created_time,
      modified_time,
      yearmonth
    ]
  }
}
