view: port_salesforce_fivetran_query {
  derived_table: {
    sql: SELECT *
      FROM `port-thirdparty-prod.salesforce.fivetran_query`
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

  dimension: merge_mode {
    type: string
    sql: ${TABLE}.merge_mode ;;
  }

  dimension: modified_field {
    type: string
    sql: ${TABLE}.modified_field ;;
  }

  dimension_group: modified_since_inclusive {
    type: time
    sql: ${TABLE}.modified_since_inclusive ;;
  }

  dimension: query {
    type: string
    sql: ${TABLE}.query ;;
  }

  dimension: rows_updated_or_inserted {
    type: number
    sql: ${TABLE}.rows_updated_or_inserted ;;
  }

  dimension: source_api {
    type: string
    sql: ${TABLE}.source_api ;;
  }

  dimension: source_object {
    type: string
    sql: ${TABLE}.source_object ;;
  }

  dimension_group: start {
    type: time
    sql: ${TABLE}.start ;;
  }

  set: detail {
    fields: [
      id,
      _fivetran_synced_time,
      done_time,
      merge_mode,
      modified_field,
      modified_since_inclusive_time,
      query,
      rows_updated_or_inserted,
      source_api,
      source_object,
      start_time
    ]
  }
}
