view: table_redshift_user {
  derived_table: {
    sql: select *
      from chai_card_chai_prod_public.user u
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: string
    primary_key: yes
    sql: ${TABLE}.id ;;
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
    type: string
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
}
