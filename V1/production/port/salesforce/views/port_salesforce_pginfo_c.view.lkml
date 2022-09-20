view: port_salesforce_pginfo_c {
  derived_table: {
    sql: SELECT *
      FROM `port-thirdparty-prod.salesforce.pginfo_c`
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

  dimension: category_c {
    type: string
    sql: ${TABLE}.category_c ;;
  }

  dimension: created_by_id {
    type: string
    sql: ${TABLE}.created_by_id ;;
  }

  dimension_group: created_date {
    type: time
    sql: ${TABLE}.created_date ;;
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

  dimension: note_c {
    type: string
    sql: ${TABLE}.note_c ;;
  }

  dimension: opportunity_c {
    type: string
    sql: ${TABLE}.opportunity_c ;;
  }

  dimension: owner_id {
    type: string
    sql: ${TABLE}.owner_id ;;
  }

  dimension: pg_id_c {
    type: string
    sql: ${TABLE}.pg_id_c ;;
  }

  dimension: pg_provider_c {
    type: string
    sql: ${TABLE}.pg_provider_c ;;
  }

  dimension_group: system_modstamp {
    type: time
    sql: ${TABLE}.system_modstamp ;;
  }

  set: detail {
    fields: [
      id,
      _fivetran_synced_time,
      category_c,
      created_by_id,
      created_date_time,
      is_deleted,
      last_modified_by_id,
      last_modified_date_time,
      last_referenced_date_time,
      last_viewed_date_time,
      name,
      note_c,
      opportunity_c,
      owner_id,
      pg_id_c,
      pg_provider_c,
      system_modstamp_time
    ]
  }
}
