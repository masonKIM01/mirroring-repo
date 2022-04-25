view: chai_card_accident_receipt_history {
  sql_table_name: chai_card_chai_card_prod_public.card_accident_receipt_history ;;
  drill_fields: [card_seq]

  measure: cards {
    type: count_distinct
    sql: ${TABLE}.card_seq ;;
  }

  dimension: change_date {
    type: string
    sql: ${TABLE}.change_date ;;
  }

  dimension: change_seq {
    type: number
    sql: ${TABLE}.change_seq ;;
  }

  dimension: trade_uniq_no {
    type: string
    sql: ${TABLE}.trade_uniq_no ;;
  }

  dimension: accident_dscm_no {
    type: string
    sql: ${TABLE}.accident_dscm_no ;;
  }

  dimension: accident_dscm_division_code {
    type: string
    sql: ${TABLE}.accident_dscm_division_code ;;
  }

  dimension: card_accident_code {
    type: string
    sql: ${TABLE}.card_accident_code ;;
  }

  dimension: card_seq {
    primary_key: yes
    type: number
    sql: ${TABLE}.card_seq ;;
  }

  dimension: card_no {
    type: string
    sql: ${TABLE}.card_no ;;
  }

  dimension: accident_status_division_code {
    type: string
    sql: ${TABLE}.accident_status_division_code ;;
  }

  dimension: accident_enrollment_date {
    type: string
    sql: ${TABLE}.accident_enrollment_date ;;
  }

  dimension: accident_enrollment_time {
    type: string
    sql: ${TABLE}.accident_enrollment_time ;;
  }

  dimension: accident_terminate_date {
    type: string
    sql: ${TABLE}.accident_terminate_date ;;
  }

  dimension: accident_terminate_time {
    type: string
    sql: ${TABLE}.accident_terminate_time ;;
  }

  dimension: before_accident_seq {
    type: number
    sql: ${TABLE}.before_accident_seq ;;
  }

  dimension: before_accident_date {
    type: string
    sql: ${TABLE}.before_accident_date ;;
  }

  dimension: before_card_status_code {
    type: string
    sql: ${TABLE}.before_card_status_code ;;
  }

  dimension: validate_term_ym {
    type: string
    sql: ${TABLE}.validate_term_ym ;;
  }

  dimension: reporter_name {
    type: string
    sql: ${TABLE}.reporter_name ;;
  }

  dimension: tel_no {
    type: string
    sql: ${TABLE}.tel_no ;;
  }

  dimension: user_lost_date {
    type: string
    sql: ${TABLE}.user_lost_date ;;
  }

  dimension: lost_area_name {
    type: string
    sql: ${TABLE}.lost_area_name ;;
  }

  dimension: accident_receipt_no {
    type: string
    sql: ${TABLE}.accident_receipt_no ;;
  }

  dimension: accident_receipt_entity_code {
    type: string
    sql: ${TABLE}.accident_receipt_entity_code ;;
  }

  dimension: accident_receipt_division_code {
    type: string
    sql: ${TABLE}.accident_receipt_division_code ;;
  }

  dimension: accident_terminate_division_code {
    type: string
    sql: ${TABLE}.accident_terminate_division_code ;;
  }

  dimension: foreign_lost_yn {
    type: string
    sql: ${TABLE}.foreign_lost_yn ;;
  }

  dimension: card_member_no {
    type: string
    sql: ${TABLE}.card_member_no ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: request_admin_id {
    type: string
    sql: ${TABLE}.request_admin_id ;;
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

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }

  dimension: month {
    type: number
    sql: ${TABLE}.month ;;
  }

}
