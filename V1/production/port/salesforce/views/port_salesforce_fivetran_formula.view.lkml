view: port_salesforce_fivetran_formula {
  derived_table: {
    sql: SELECT *
      FROM `port-thirdparty-prod.salesforce.fivetran_formula`
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: field {
    type: string
    sql: ${TABLE}.field ;;
  }

  dimension: object {
    type: string
    sql: ${TABLE}.object ;;
  }

  dimension_group: _fivetran_synced {
    type: time
    sql: ${TABLE}._fivetran_synced ;;
  }

  dimension: formula {
    type: string
    sql: ${TABLE}.formula ;;
  }

  dimension: reason_null {
    type: string
    sql: ${TABLE}.reason_null ;;
  }

  dimension: sql {
    type: string
    sql: ${TABLE}.sql ;;
  }

  dimension: view_sql {
    type: string
    sql: ${TABLE}.view_sql ;;
  }

  set: detail {
    fields: [
      field,
      object,
      _fivetran_synced_time,
      formula,
      reason_null,
      sql,
      view_sql
    ]
  }
}
