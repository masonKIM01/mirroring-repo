view: port_salesforce_opportunity_history {
  derived_table: {
    sql: SELECT * FROM `port-thirdparty-prod.salesforce.opportunity_history`
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

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension: close_date {
    type: date
    datatype: date
    sql: ${TABLE}.close_date ;;
  }

  dimension: created_by_id {
    type: string
    sql: ${TABLE}.created_by_id ;;
  }

  dimension_group: created_date {
    type: time
    sql: ${TABLE}.created_date ;;
  }

  dimension: expected_revenue {
    type: number
    sql: ${TABLE}.expected_revenue ;;
  }

  dimension: forecast_category {
    type: string
    sql: ${TABLE}.forecast_category ;;
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.is_deleted ;;
  }

  dimension: opportunity_id {
    type: string
    sql: ${TABLE}.opportunity_id ;;
  }

  dimension: prev_amount {
    type: number
    sql: ${TABLE}.prev_amount ;;
  }

  dimension: prev_close_date {
    type: date
    datatype: date
    sql: ${TABLE}.prev_close_date ;;
  }

  dimension: probability {
    type: number
    sql: ${TABLE}.probability ;;
  }

  dimension: stage_name {
    type: string
    sql: ${TABLE}.stage_name ;;
  }

  dimension_group: system_modstamp {
    type: time
    sql: ${TABLE}.system_modstamp ;;
  }

  set: detail {
    fields: [
      id,
      _fivetran_synced_time,
      amount,
      close_date,
      created_by_id,
      created_date_time,
      expected_revenue,
      forecast_category,
      is_deleted,
      opportunity_id,
      prev_amount,
      prev_close_date,
      probability,
      stage_name,
      system_modstamp_time
    ]
  }
}
