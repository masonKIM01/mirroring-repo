view: latest_margin_details {
  derived_table: {
    sql: SELECT ROW_NUMBER()OVER(PARTITION BY pg_provider, pg_id, pay_method ORDER BY updated DESC)rn, *
      FROM hmscatalog.importdb.margin_details

       ;;
  }

  suggestions: no

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: rn {
    type: number
    sql: ${TABLE}.rn ;;
  }

  dimension: pg_provider {
    type: string
    sql: ${TABLE}.pg_provider ;;
  }

  dimension: pg_id {
    type: string
    sql: ${TABLE}.pg_id ;;
  }

  dimension: business_number {
    type: number
    sql: ${TABLE}.business_number ;;
  }

  dimension: class {
    type: string
    sql: ${TABLE}.class ;;
  }

  dimension: pay_method {
    type: string
    sql: ${TABLE}.pay_method ;;
  }

  dimension: pg_margin {
    type: number
    sql: ${TABLE}.pg_margin ;;
  }

  dimension: import_cost {
    type: number
    sql: ${TABLE}.import_cost ;;
  }

  dimension: import_margin {
    type: number
    sql: ${TABLE}.import_margin ;;
  }

  dimension: calc_type {
    type: string
    sql: ${TABLE}.calc_type ;;
  }

  dimension: updated {
    type: string
    sql: ${TABLE}.updated ;;
  }

  set: detail {
    fields: [
      rn,
      pg_provider,
      pg_id,
      business_number,
      class,
      pay_method,
      pg_margin,
      import_cost,
      import_margin,
      calc_type,
      updated
    ]
  }
}
