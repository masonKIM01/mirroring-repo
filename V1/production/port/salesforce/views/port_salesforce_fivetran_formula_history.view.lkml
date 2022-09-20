view: port_salesforce_fivetran_formula_history {
  derived_table: {
    sql: SELECT *
      FROM `port-thirdparty-prod.salesforce.fivetran_formula_history`
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

  dimension: version {
    type: number
    sql: ${TABLE}.version ;;
  }

  dimension_group: _fivetran_synced {
    type: time
    sql: ${TABLE}._fivetran_synced ;;
  }

  dimension: formula {
    type: string
    sql: ${TABLE}.formula ;;
  }

  dimension: sql {
    type: string
    sql: ${TABLE}.sql ;;
  }

  set: detail {
    fields: [
      field,
      object,
      version,
      _fivetran_synced_time,
      formula,
      sql
    ]
  }
}
