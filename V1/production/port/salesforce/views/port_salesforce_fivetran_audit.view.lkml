view: port_salesforce_fivetran_audit {
  derived_table: {
    sql: SELECT *
      FROM `port-thirdparty-prod.salesforce.fivetran_audit`
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension_group: _fivetran_synced {
    type: time
    sql: ${TABLE}._fivetran_synced ;;
  }

  dimension_group: done {
    type: time
    sql: ${TABLE}.done ;;
  }

  dimension: message {
    type: string
    sql: ${TABLE}.message ;;
  }

  dimension_group: progress {
    type: time
    sql: ${TABLE}.progress ;;
  }

  dimension: rows_updated_or_inserted {
    type: number
    sql: ${TABLE}.rows_updated_or_inserted ;;
  }

  dimension: schema {
    type: string
    sql: ${TABLE}.schema ;;
  }

  dimension_group: start {
    type: time
    sql: ${TABLE}.start ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: table {
    type: string
    sql: ${TABLE}.table ;;
  }

  dimension: update_id {
    type: string
    sql: ${TABLE}.update_id ;;
  }

  dimension_group: update_started {
    type: time
    sql: ${TABLE}.update_started ;;
  }

  set: detail {
    fields: [
      id,
      _fivetran_synced_time,
      done_time,
      message,
      progress_time,
      rows_updated_or_inserted,
      schema,
      start_time,
      status,
      table,
      update_id,
      update_started_time
    ]
  }
}
