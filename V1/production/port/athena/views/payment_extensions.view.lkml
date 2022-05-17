view: payment_extensions {
  sql_table_name: hmscatalog.importdb.payment_extensions ;;
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

  dimension: unique_payment_id {
    # primary_key: yes
    type: string
    sql: ${TABLE}.unique_payment_id ;;
  }

  dimension: payment_id {
    type: number
    sql: ${TABLE}.payment_id ;;
  }

  dimension: payment_taxfree {
    type: number
    sql: ${TABLE}.payment_taxfree ;;
  }

  dimension: rcpt_tid {
    type: string
    sql: ${TABLE}.rcpt_tid ;;
  }

  dimension: rcpt_apply_num {
    type: string
    sql: ${TABLE}.rcpt_apply_num ;;
  }

  dimension: rcpt_objective {
    type: string
    sql: ${TABLE}.rcpt_objective ;;
  }

  dimension: rcpt_amount {
    type: number
    sql: ${TABLE}.rcpt_amount ;;
  }

  dimension: rcpt_vat {
    type: number
    sql: ${TABLE}.rcpt_vat ;;
  }

  dimension_group: rcpt_applied_at {
    type: time
    sql: ${TABLE}.rcpt_applied_at ;;
  }

  dimension_group: rcpt_cancelled_at {
    type: time
    sql: ${TABLE}.rcpt_cancelled_at ;;
  }

  dimension: escr_tid {
    type: string
    sql: ${TABLE}.escr_tid ;;
  }

  dimension: escr_logis {
    type: string
    sql: ${TABLE}.escr_logis ;;
  }

  dimension: escr_invoice {
    type: string
    sql: ${TABLE}.escr_invoice ;;
  }

  dimension_group: escr_applied_at {
    type: time
    sql: ${TABLE}.escr_applied_at ;;
  }

  dimension: orig_pg_tid {
    type: string
    sql: ${TABLE}.orig_pg_tid ;;
  }

  dimension: card_number {
    type: string
    sql: ${TABLE}.card_number ;;
  }

  dimension: card_type {
    type: number
    sql: ${TABLE}.card_type ;;
  }

  dimension: card_issue_code {
    type: string
    sql: ${TABLE}.card_issue_code ;;
  }

  dimension: is_free_interest {
    type: number
    sql: ${TABLE}.is_free_interest ;;
  }

  dimension: emb_pg_provider {
    type: string
    sql: ${TABLE}.emb_pg_provider ;;
  }

  dimension: enc_buyer_name {
    type: string
    sql: ${TABLE}.enc_buyer_name ;;
  }

  dimension: enc_buyer_email {
    type: string
    sql: ${TABLE}.enc_buyer_email ;;
  }

  dimension: enc_buyer_tel {
    type: string
    sql: ${TABLE}.enc_buyer_tel ;;
  }

  dimension: enc_buyer_addr {
    type: string
    sql: ${TABLE}.enc_buyer_addr ;;
  }

  dimension: enc_vbank_remitter {
    type: string
    sql: ${TABLE}.enc_vbank_remitter ;;
  }

  dimension: confirm_url {
    type: string
    sql: ${TABLE}.confirm_url ;;
  }

  dimension_group: vbank_due {
    type: time
    sql: ${TABLE}.vbank_due ;;
  }

  dimension_group: vbank_issued {
    type: time
    sql: ${TABLE}.vbank_issued ;;
  }

  dimension: int_col_1 {
    type: number
    sql: ${TABLE}.int_col_1 ;;
  }

  dimension: int_col_2 {
    type: number
    sql: ${TABLE}.int_col_2 ;;
  }

  dimension: int_col_3 {
    type: number
    sql: ${TABLE}.int_col_3 ;;
  }

  dimension: int_col_4 {
    type: number
    sql: ${TABLE}.int_col_4 ;;
  }

  dimension: int_col_5 {
    type: number
    sql: ${TABLE}.int_col_5 ;;
  }

  dimension: str_col_1 {
    type: string
    sql: ${TABLE}.str_col_1 ;;
  }

  dimension: str_col_2 {
    type: string
    sql: ${TABLE}.str_col_2 ;;
  }

  dimension: str_col_3 {
    type: string
    sql: ${TABLE}.str_col_3 ;;
  }

  dimension: str_col_4 {
    type: string
    sql: ${TABLE}.str_col_4 ;;
  }

  dimension: str_col_5 {
    type: string
    sql: ${TABLE}.str_col_5 ;;
  }

  dimension_group: created {
    type: time
    sql: ${TABLE}.created ;;
  }

  dimension_group: modified {
    type: time
    sql: ${TABLE}.modified ;;
  }

  dimension: yearmonth {
    type: string
    sql: ${TABLE}.yearmonth ;;
  }

  set: detail {
    fields: [
      unique_id,
      id,
      user_id,
      unique_payment_id,
      payment_id,
      payment_taxfree,
      rcpt_tid,
      rcpt_apply_num,
      rcpt_objective,
      rcpt_amount,
      rcpt_vat,
      rcpt_applied_at_time,
      rcpt_cancelled_at_time,
      escr_tid,
      escr_logis,
      escr_invoice,
      escr_applied_at_time,
      orig_pg_tid,
      card_number,
      card_type,
      card_issue_code,
      is_free_interest,
      emb_pg_provider,
      enc_buyer_name,
      enc_buyer_email,
      enc_buyer_tel,
      enc_buyer_addr,
      enc_vbank_remitter,
      confirm_url,
      vbank_due_time,
      vbank_issued_time,
      int_col_1,
      int_col_2,
      int_col_3,
      int_col_4,
      int_col_5,
      str_col_1,
      str_col_2,
      str_col_3,
      str_col_4,
      str_col_5,
      created_time,
      modified_time,
      yearmonth
    ]
  }
}
