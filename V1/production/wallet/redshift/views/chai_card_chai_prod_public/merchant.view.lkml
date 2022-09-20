view: chai_merchant {
  derived_table: {
    sql:
      SELECT
        *,
      CASE WHEN name = '차이 체크카드' then 'check_card'
      WHEN name = '차이 신용카드' then 'credit_card'
      ELSE 'ewallet' END AS TYPE
      FROM chai_card_chai_public.merchant ;;
  }

  measure: count {
    type: count
  }

  dimension: id {
    type: string
    primary_key: yes
    sql: ${TABLE}.id ;;
  }

  dimension: public_api_key {
    type: string
    sql: ${TABLE}.public_api_key ;;
  }

  dimension: private_api_key {
    type: string
    sql: ${TABLE}.private_api_key ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension_group: updated_at {
    type: time
    sql: ${TABLE}.updated_at ;;
  }

  dimension_group: created_at {
    type: time
    sql: ${TABLE}.created_at ;;
  }

  dimension: vertical {
    type: string
    sql: ${TABLE}.vertical ;;
  }

  dimension: website {
    type: string
    sql: ${TABLE}.website ;;
  }

  dimension: country_code {
    type: string
    sql: ${TABLE}.country_code ;;
  }

  dimension: business_number {
    type: string
    sql: ${TABLE}.business_number ;;
  }

  dimension: address {
    type: string
    sql: ${TABLE}.address ;;
  }

  dimension: representative_name {
    type: string
    sql: ${TABLE}.representative_name ;;
  }

  dimension: customer_service_phone {
    type: string
    sql: ${TABLE}.customer_service_phone ;;
  }

  dimension: logo_url {
    type: string
    sql: ${TABLE}.logo_url ;;
  }

  dimension: ios_scheme {
    type: string
    sql: ${TABLE}.ios_scheme ;;
  }

  dimension: android_scheme {
    type: string
    sql: ${TABLE}.android_scheme ;;
  }

  dimension: pg_merchant_code {
    type: string
    sql: ${TABLE}.pg_merchant_code ;;
  }

  dimension: link_method {
    type: string
    sql: ${TABLE}.link_method ;;
  }

  dimension: display_name {
    type: string
    sql: ${TABLE}.display_name ;;
  }

  dimension: global_name {
    type: string
    sql: ${TABLE}.global_name ;;
  }

  dimension: restricted_pid {
    type: string
    sql: ${TABLE}.restricted_pid ;;
  }

  dimension: data {
    type: string
    sql: ${TABLE}.data ;;
  }

  dimension: reserve_amount {
    type: number
    sql: ${TABLE}.reserve_amount ;;
  }

  dimension: business_category {
    type: string
    sql: ${TABLE}.business_category ;;
  }

  dimension: business_type {
    type: string
    sql: ${TABLE}.business_type ;;
  }

  dimension: settlement_email {
    type: string
    sql: ${TABLE}.settlement_email ;;
  }

  dimension: settlement_sub_email {
    type: string
    sql: ${TABLE}.settlement_sub_email ;;
  }

  dimension: payment_limits {
    type: string
    sql: ${TABLE}.payment_limits ;;
  }

  dimension: contract_status {
    type: string
    sql: ${TABLE}.contract_status ;;
  }

  dimension: funnel {
    type: string
    sql: ${TABLE}.funnel ;;
  }

  dimension: bank_code {
    type: string
    sql: ${TABLE}.bank_code ;;
  }

  dimension: group_name {
    type: string
    sql: ${TABLE}.group_name ;;
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
