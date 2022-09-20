view: port_salesforce_lead_contact_c {
  derived_table: {
    sql: SELECT *
      FROM `port-thirdparty-prod.salesforce.lead_contact_c`
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

  dimension: description_c {
    type: string
    sql: ${TABLE}.description_c ;;
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.is_deleted ;;
  }

  dimension: last_activity_date {
    type: date
    datatype: date
    sql: ${TABLE}.last_activity_date ;;
  }

  dimension: last_modified_by_id {
    type: string
    sql: ${TABLE}.last_modified_by_id ;;
  }

  dimension_group: last_modified_date {
    type: time
    sql: ${TABLE}.last_modified_date ;;
  }

  dimension_group: last_referenced_date {
    type: time
    sql: ${TABLE}.last_referenced_date ;;
  }

  dimension_group: last_viewed_date {
    type: time
    sql: ${TABLE}.last_viewed_date ;;
  }

  dimension: lead_c {
    type: string
    sql: ${TABLE}.lead_c ;;
  }

  dimension: owner_id {
    type: string
    sql: ${TABLE}.owner_id ;;
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
      description_c,
      is_deleted,
      last_activity_date,
      last_modified_by_id,
      last_modified_date_time,
      last_referenced_date_time,
      last_viewed_date_time,
      lead_c,
      owner_id,
      system_modstamp_time
    ]
  }
}
