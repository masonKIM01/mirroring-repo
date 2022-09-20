view: port_salesforce_pricebook_2 {
  derived_table: {
    sql: SELECT *
      FROM `port-thirdparty-prod.salesforce.pricebook_2`
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

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: is_active {
    type: yesno
    sql: ${TABLE}.is_active ;;
  }

  dimension: is_archived {
    type: yesno
    sql: ${TABLE}.is_archived ;;
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.is_deleted ;;
  }

  dimension: is_standard {
    type: yesno
    sql: ${TABLE}.is_standard ;;
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

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
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
      description,
      is_active,
      is_archived,
      is_deleted,
      is_standard,
      last_modified_by_id,
      last_modified_date_time,
      last_referenced_date_time,
      last_viewed_date_time,
      name,
      system_modstamp_time
    ]
  }
}
