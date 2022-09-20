view: port_salesforce_opportunity_stage_c {
  derived_table: {
    sql: SELECT * FROM `port-thirdparty-prod.salesforce.opportunity_stage_c`
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

  dimension: created_by_id {
    type: string
    sql: ${TABLE}.created_by_id ;;
  }

  dimension_group: created_date {
    type: time
    sql: ${TABLE}.created_date ;;
  }

  dimension: date_c {
    type: date
    datatype: date
    sql: ${TABLE}.date_c ;;
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.is_deleted ;;
  }

  dimension: last_modified_by_id {
    type: string
    sql: ${TABLE}.last_modified_by_id ;;
  }

  dimension_group: last_modified_date {
    type: time
    sql: ${TABLE}.last_modified_date ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: opportunity_c {
    type: string
    sql: ${TABLE}.opportunity_c ;;
  }

  dimension: stage_c {
    type: string
    sql: ${TABLE}.stage_c ;;
  }

  dimension_group: system_modstamp {
    type: time
    sql: ${TABLE}.system_modstamp ;;
  }

  set: detail {
    fields: [
      id,
      _fivetran_synced_time,
      created_by_id,
      created_date_time,
      date_c,
      is_deleted,
      last_modified_by_id,
      last_modified_date_time,
      name,
      opportunity_c,
      stage_c,
      system_modstamp_time
    ]
  }
}
