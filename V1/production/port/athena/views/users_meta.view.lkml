view: users_meta {
  sql_table_name:  hmscatalog.importdb.users_meta ;;


  suggestions: no

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: agency_id {
    type: number
    sql: ${TABLE}.agency_id ;;
  }

  dimension: tier_code {
    type: string
    sql: ${TABLE}.tier_code ;;
  }

  dimension: tier_label {
    type: string
    sql: ${TABLE}.tier_label ;;
  }

  dimension: user_code {
    type: string
    sql: ${TABLE}.user_code ;;
  }

  dimension: stage {
    type: number
    sql: ${TABLE}.stage ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
  }

  dimension: fee_category {
    type: string
    sql: ${TABLE}.fee_category ;;
  }

  dimension: company_name {
    type: string
    sql: ${TABLE}.company_name ;;
  }

  dimension: business_serial {
    type: string
    sql: ${TABLE}.business_serial ;;
  }

  dimension_group: deleted_at {
    type: time
    sql: ${TABLE}.deleted_at ;;
  }

  dimension_group: created_at {
    type: time
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: updated_at {
    type: time
    sql: ${TABLE}.updated_at ;;
  }

  dimension: yearmonth {
    type: string
    sql: ${TABLE}.yearmonth ;;
  }

  set: detail {
    fields: [
      id,
      user_id,
      agency_id,
      tier_code,
      tier_label,
      user_code,
      stage,
      source,
      fee_category,
      company_name,
      business_serial,
      deleted_at_time,
      created_at_time,
      updated_at_time,
      yearmonth
    ]
  }
}
