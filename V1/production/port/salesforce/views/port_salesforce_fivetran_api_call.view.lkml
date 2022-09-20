view: port_salesforce_fivetran_api_call {
  derived_table: {
    sql: SELECT *
      FROM `port-thirdparty-prod.salesforce.fivetran_api_call`
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension_group: start {
    type: time
    sql: ${TABLE}.start ;;
  }

  dimension_group: _fivetran_synced {
    type: time
    sql: ${TABLE}._fivetran_synced ;;
  }

  dimension: method {
    type: string
    sql: ${TABLE}.method ;;
  }

  dimension: update_id {
    type: string
    sql: ${TABLE}.update_id ;;
  }

  dimension: uri {
    type: string
    sql: ${TABLE}.uri ;;
  }

  set: detail {
    fields: [start_time, _fivetran_synced_time, method, update_id, uri]
  }
}
