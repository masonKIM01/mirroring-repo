view: port_salesforce_fivetran_formula_model {
  derived_table: {
    sql: SELECT *
      FROM `port-thirdparty-prod.salesforce.fivetran_formula_model`
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: object {
    type: string
    sql: ${TABLE}.object ;;
  }

  dimension_group: _fivetran_synced {
    type: time
    sql: ${TABLE}._fivetran_synced ;;
  }

  dimension: model {
    type: string
    sql: ${TABLE}.model ;;
  }

  set: detail {
    fields: [object, _fivetran_synced_time, model]
  }
}
