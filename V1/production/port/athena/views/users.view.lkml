view: users {
  sql_table_name: hmscatalog.importdb.users ;;
  suggestions: no

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: unique_id {
    type: string
    sql: ${TABLE}.unique_id ;;
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: agency_id {
    type: number
    sql: ${TABLE}.agency_id ;;
  }

  dimension: supervisor_id {
    type: number
    sql: ${TABLE}.supervisor_id ;;
  }

  dimension: is_agency {
    type: number
    sql: ${TABLE}.is_agency ;;
  }

  dimension: is_supervisor {
    type: number
    sql: ${TABLE}.is_supervisor ;;
  }

  dimension: agency_user_no {
    type: string
    sql: ${TABLE}.agency_user_no ;;
  }

  dimension: agency_user_name {
    type: string
    sql: ${TABLE}.agency_user_name ;;
  }

  dimension: revoke_reason {
    type: string
    sql: ${TABLE}.revoke_reason ;;
  }

  dimension: user_code {
    type: string
    sql: ${TABLE}.user_code ;;
  }

  dimension: pg_alias {
    type: string
    sql: ${TABLE}.pg_alias ;;
  }

  dimension: pg_provider {
    type: string
    sql: ${TABLE}.pg_provider ;;
  }

  dimension: pg_id {
    type: string
    sql: ${TABLE}.pg_id ;;
  }

  dimension: pg_ext_priv {
    type: string
    sql: ${TABLE}.pg_ext_priv ;;
  }

  dimension_group: expired {
    type: time
    sql: ${TABLE}.expired ;;
  }

  dimension_group: granted {
    type: time
    sql: ${TABLE}.granted ;;
  }

  dimension: grant_uid {
    type: string
    sql: ${TABLE}.grant_uid ;;
  }

  dimension: payment_confirm_url {
    type: string
    sql: ${TABLE}.payment_confirm_url ;;
  }

  dimension: payment_notification_url {
    type: string
    sql: ${TABLE}.payment_notification_url ;;
  }

  dimension: payment_mobile_landing_url {
    type: string
    sql: ${TABLE}.payment_mobile_landing_url ;;
  }

  dimension: app_scheme {
    type: string
    sql: ${TABLE}.app_scheme ;;
  }

  dimension: use_siot_payment {
    type: number
    sql: ${TABLE}.use_siot_payment ;;
  }

  dimension: sandbox {
    type: number
    sql: ${TABLE}.sandbox ;;
  }

  dimension: company_name {
    type: string
    sql: ${TABLE}.company_name ;;
  }

  dimension: slack_team_uk {
    type: string
    sql: ${TABLE}.slack_team_uk ;;
  }

  dimension: slack_team_name {
    type: string
    sql: ${TABLE}.slack_team_name ;;
  }

  dimension: slack_bot_uk {
    type: string
    sql: ${TABLE}.slack_bot_uk ;;
  }

  dimension: slack_scope {
    type: string
    sql: ${TABLE}.slack_scope ;;
  }

  dimension: slack_channel {
    type: string
    sql: ${TABLE}.slack_channel ;;
  }

  dimension: max_search_period {
    type: number
    sql: ${TABLE}.max_search_period ;;
  }

  dimension: use_ip_firewall {
    type: number
    sql: ${TABLE}.use_ip_firewall ;;
  }

  dimension: use_sync_webhook {
    type: number
    sql: ${TABLE}.use_sync_webhook ;;
  }

  dimension: use_retry_webhook {
    type: number
    sql: ${TABLE}.use_retry_webhook ;;
  }

  dimension_group: created {
    type: time
    sql: ${TABLE}.created ;;
  }

  dimension_group: modified {
    type: time
    sql: ${TABLE}.modified ;;
  }

  dimension: active {
    type: number
    sql: ${TABLE}.active ;;
  }

  dimension: dms_seq_ut {
    type: number
    sql: ${TABLE}.dms_seq_ut ;;
  }

  dimension: yearmonth {
    type: string
    sql: ${TABLE}.yearmonth ;;
  }

  set: detail {
    fields: [
      unique_id,
      id,
      agency_id,
      supervisor_id,
      is_agency,
      is_supervisor,
      agency_user_no,
      agency_user_name,
      revoke_reason,
      user_code,
      pg_alias,
      pg_provider,
      pg_id,
      pg_ext_priv,
      expired_time,
      granted_time,
      grant_uid,
      payment_confirm_url,
      payment_notification_url,
      payment_mobile_landing_url,
      app_scheme,
      use_siot_payment,
      sandbox,
      company_name,
      slack_team_uk,
      slack_team_name,
      slack_bot_uk,
      slack_scope,
      slack_channel,
      max_search_period,
      use_ip_firewall,
      use_sync_webhook,
      use_retry_webhook,
      created_time,
      modified_time,
      active,
      dms_seq_ut,
      yearmonth
    ]
  }
}
