view: chai_user {
  sql_table_name: chai_card_chai_prod_public."user" ;;
  drill_fields: [id]

  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: age_group {
    type: string
    sql:
    case when ${birthday}>= 2003 then '10대'
    when ${birthday} < 2003 AND ${birthday} >= 1993 then '20대'
    when ${birthday}< 1993 AND ${birthday} >= 1983 then '30대'
    when ${birthday}<1983 AND ${birthday}>=1973 then '40대'
    else '50대이상'
    end ;;
  }

  dimension_group: updated_at {
    type: time
    sql: ${TABLE}.updated_at ;;
  }

  dimension_group: created_at {
    type: time
    sql: ${TABLE}.created_at ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension_group: deleted_at {
    type: time
    sql: ${TABLE}.deleted_at ;;
  }

  dimension: required_actions {
    type: string
    sql: ${TABLE}.required_actions ;;
  }

  dimension: data {
    type: string
    sql: ${TABLE}.data ;;
  }

  dimension: purchased_merchants {
    type: string
    sql: ${TABLE}.purchased_merchants ;;
  }

  dimension_group: last_login_at {
    type: time
    sql: ${TABLE}.last_login_at ;;
  }

  dimension: birthday {
    type: number
    sql: ${TABLE}.birthday ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }

  dimension: month {
    type: number
    sql: ${TABLE}.month ;;
  }

  set: detail {
    fields: [
      id,
      updated_at_time,
      created_at_time,
      status,
      gender,
      age_group,
      deleted_at_time,
      required_actions,
      data,
      purchased_merchants,
      last_login_at_time,
      birthday,
      year,
      month
    ]
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: count_user {
    type: count_distinct
    sql: ${TABLE}.id ;;
  }
}
