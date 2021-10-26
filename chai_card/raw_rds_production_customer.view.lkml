view: raw_rds_production_customer {
  derived_table: {
    sql: select
        created_at,
        data,
        deleted_at,
        id,
        last_login_at,
        required_actions,
        status,
        updated_at
      from raw_rds_production.customer
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension_group: created_at {
    type: time
    sql: ${TABLE}.created_at ;;
  }

  dimension: data {
    type: string
    sql: ${TABLE}.data ;;
  }

  dimension_group: deleted_at {
    type: time
    sql: ${TABLE}.deleted_at ;;
  }

  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension_group: last_login_at {
    type: time
    sql: ${TABLE}.last_login_at ;;
  }

  dimension: required_actions {
    type: string
    sql: ${TABLE}.required_actions ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension_group: updated_at {
    type: time
    sql: ${TABLE}.updated_at ;;
  }

  set: detail {
    fields: [
      created_at_time,
      data,
      deleted_at_time,
      id,
      last_login_at_time,
      required_actions,
      status,
      updated_at_time
    ]
  }
}
