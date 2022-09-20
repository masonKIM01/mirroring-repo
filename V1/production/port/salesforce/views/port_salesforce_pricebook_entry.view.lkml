view: port_salesforce_pricebook_entry {
  derived_table: {
    sql: SELECT *
      FROM `port-thirdparty-prod.salesforce.pricebook_entry`
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

  dimension: pricebook_2_id {
    type: string
    sql: ${TABLE}.pricebook_2_id ;;
  }

  dimension: product_2_id {
    type: string
    sql: ${TABLE}.product_2_id ;;
  }

  dimension: product_code {
    type: string
    sql: ${TABLE}.product_code ;;
  }

  dimension_group: system_modstamp {
    type: time
    sql: ${TABLE}.system_modstamp ;;
  }

  dimension: unit_price {
    type: number
    sql: ${TABLE}.unit_price ;;
  }

  dimension: use_standard_price {
    type: yesno
    sql: ${TABLE}.use_standard_price ;;
  }

  set: detail {
    fields: [
      id,
      _fivetran_synced_time,
      created_by_id,
      created_date_time,
      is_active,
      is_archived,
      is_deleted,
      last_modified_by_id,
      last_modified_date_time,
      name,
      pricebook_2_id,
      product_2_id,
      product_code,
      system_modstamp_time,
      unit_price,
      use_standard_price
    ]
  }
}
