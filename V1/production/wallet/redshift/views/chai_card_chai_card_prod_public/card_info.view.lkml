view: card_card_info {
  sql_table_name: chai_card_chai_card_prod_public.card_info ;;
  drill_fields: [card_seq]

  measure: cards {
    type: count_distinct
    sql: ${card_seq} ;;
  }

  dimension_group: created {
    type: time
    sql: ${TABLE}.first_operate_detail_date ;;
  }

  dimension: card_seq {
    primary_key: yes
    type: number
    sql: ${TABLE}.card_seq ;;
  }

  dimension: trade_uniq_no {
    type: string
    sql: ${TABLE}.trade_uniq_no ;;
  }

  dimension: card_member_no {
    type: number
    sql: ${TABLE}.card_member_no ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: card_ownr_division_code {
    type: number
    sql: ${TABLE}.card_ownr_division_code ;;
  }

  dimension: card_ownr_name {
    type: string
    sql: ${TABLE}.card_ownr_name ;;
  }

  dimension: validate_term_ym {
    type: number
    sql: ${TABLE}.validate_term_ym ;;
  }

  dimension: last_card_yn {
    type: string
    sql: ${TABLE}.last_card_yn ;;
  }

  dimension: before_card_no {
    type: string
    sql: ${TABLE}.before_card_no ;;
  }

  dimension: before_card_seq {
    type: number
    sql: ${TABLE}.before_card_seq ;;
  }

  dimension: card_product_code {
    type: string
    sql: ${TABLE}.card_product_code ;;
  }

  dimension: payment_date {
    type: string
    sql: ${TABLE}.payment_date ;;
  }

  dimension: request_issue_division_code {
    type: string
    sql: ${TABLE}.request_issue_division_code ;;
  }

  dimension: traffic_function_division_code {
    type: string
    sql: ${TABLE}.traffic_function_division_code ;;
  }

  dimension: cash_function_yn {
    type: string
    sql: ${TABLE}.cash_function_yn ;;
  }

  dimension: card_status_code {
    type: string
    sql: ${TABLE}.card_status_code ;;
  }

  dimension: request_date {
    type: string
    sql: ${TABLE}.request_date ;;
  }

  dimension: issue_date {
    type: string
    sql: ${TABLE}.issue_date ;;
  }

  dimension: issue_time {
    type: string
    sql: ${TABLE}.issue_time ;;
  }

  dimension: sendback_date {
    type: string
    sql: ${TABLE}.sendback_date ;;
  }

  dimension: disposal_date {
    type: string
    sql: ${TABLE}.disposal_date ;;
  }

  dimension: receve_date {
    type: string
    sql: ${TABLE}.receve_date ;;
  }

  dimension: open_date {
    type: string
    sql: ${TABLE}.open_date ;;
  }

  dimension: terminate_date {
    type: string
    sql: ${TABLE}.terminate_date ;;
  }

  dimension: send_date {
    type: string
    sql: ${TABLE}.send_date ;;
  }

  dimension: card_send_address_division_code {
    type: string
    sql: ${TABLE}.card_send_address_division_code ;;
  }

  dimension: send_type_division_code {
    type: string
    sql: ${TABLE}.send_type_division_code ;;
  }

  dimension: terminal_media_division_code {
    type: string
    sql: ${TABLE}.terminal_media_division_code ;;
  }

  dimension: cancel_yn {
    type: string
    sql: ${TABLE}.cancel_yn ;;
  }

  dimension: first_trade_date {
    type: string
    sql: ${TABLE}.first_trade_date ;;
  }

  dimension: card_product_gatrade_yn {
    type: string
    sql: ${TABLE}.card_product_gatrade_yn ;;
  }

  dimension: ancillary_service_gatrade_yn {
    type: string
    sql: ${TABLE}.ancillary_service_gatrade_yn ;;
  }

  dimension: uniq_discrimination_no_collect_yn {
    type: string
    sql: ${TABLE}.uniq_discrimination_no_collect_yn ;;
  }

  dimension: finance_group_offer_yn {
    type: string
    sql: ${TABLE}.finance_group_offer_yn ;;
  }

  dimension: iniquity_use_prevention_offer_yn {
    type: string
    sql: ${TABLE}.iniquity_use_prevention_offer_yn ;;
  }

  dimension: alliance_agency_offer_yn {
    type: string
    sql: ${TABLE}.alliance_agency_offer_yn ;;
  }

  dimension: uniq_discrimination_no_offer_yn {
    type: string
    sql: ${TABLE}.uniq_discrimination_no_offer_yn ;;
  }

  dimension: tel_credit_card_advice_yn {
    type: string
    sql: ${TABLE}.tel_credit_card_advice_yn ;;
  }

  dimension: sms_credit_card_advice_yn {
    type: string
    sql: ${TABLE}.sms_credit_card_advice_yn ;;
  }

  dimension: written_credit_card_advice_yn {
    type: string
    sql: ${TABLE}.written_credit_card_advice_yn ;;
  }

  dimension: email_credit_card_advice_yn {
    type: string
    sql: ${TABLE}.email_credit_card_advice_yn ;;
  }

  dimension: sms_send_yn {
    type: string
    sql: ${TABLE}.sms_send_yn ;;
  }

  dimension: brand_division_code {
    type: string
    sql: ${TABLE}.brand_division_code ;;
  }

  dimension: first_card_seq {
    type: number
    sql: ${TABLE}.first_card_seq ;;
  }

  dimension: first_operate_admin_id {
    type: string
    sql: ${TABLE}.first_operate_admin_id ;;
  }

  dimension_group: first_operate_detail_date {
    type: time
    sql: ${TABLE}.first_operate_detail_date ;;
  }

  dimension: last_operate_admin_id {
    type: string
    sql: ${TABLE}.last_operate_admin_id ;;
  }

  dimension_group: last_operate_detail_date {
    type: time
    sql: ${TABLE}.last_operate_detail_date ;;
  }

  dimension: first_operate_trade_code {
    type: string
    sql: ${TABLE}.first_operate_trade_code ;;
  }

  dimension: last_operate_trade_code {
    type: string
    sql: ${TABLE}.last_operate_trade_code ;;
  }

  dimension: dcc_yn {
    type: string
    sql: ${TABLE}.dcc_yn ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }

  dimension: month {
    type: number
    sql: ${TABLE}.month ;;
  }
 }
