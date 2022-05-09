view: user_pricing {
  sql_table_name: hmscatalog.importdb.user_pricing ;;


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

  dimension: pg_provider {
    type: string
    sql: ${TABLE}.pg_provider ;;
  }

  dimension: pg_id {
    type: string
    sql: ${TABLE}.pg_id ;;
  }

  dimension: business_number {
    type: string
    sql: ${TABLE}.business_number ;;
  }

  dimension: company_name {
    type: string
    sql: ${TABLE}.company_name ;;
  }

  dimension: pay_method {
    type: string
    sql: ${TABLE}.pay_method ;;
  }

  dimension: chosen_rate {
    type: number
    sql: ${TABLE}.chosen_rate ;;
  }

  dimension: import_take_rate {
    type: number
    sql: ${TABLE}.import_take_rate ;;
  }

  dimension: category {
    type: string
    sql: ${TABLE}.category ;;
  }

  dimension_group: contract_date {
    type: time
    sql: ${TABLE}.contract_date ;;
  }

  dimension: import_transfer_fixed_amount {
    type: number
    sql: ${TABLE}.import_transfer_fixed_amount ;;
  }

  dimension: billing {
    type: number
    sql: ${TABLE}.billing ;;
  }

  dimension: frequency {
    type: number
    sql: ${TABLE}.frequency ;;
  }

  dimension: exceptions {
    type: number
    sql: ${TABLE}.exceptions ;;
  }

  dimension: exceptions_monthly_pay {
    type: number
    sql: ${TABLE}.exceptions_monthly_pay ;;
  }

  dimension: insurance_amount {
    type: number
    sql: ${TABLE}.insurance_amount ;;
  }

  dimension: insurance_rate {
    type: number
    sql: ${TABLE}.insurance_rate ;;
  }

  dimension: pay_method_agg {
    type: string
    sql: ${TABLE}.pay_method_agg ;;
  }

  dimension: dominant {
    type: number
    sql: ${TABLE}.dominant ;;
  }

  dimension: dominant_bus {
    type: number
    sql: ${TABLE}.dominant_bus ;;
  }

  dimension: contract_year_month {
    type: string
    sql: ${TABLE}.contract_year_month ;;
  }

  dimension: service_domain {
    type: string
    sql: ${TABLE}.service_domain ;;
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
      pg_provider,
      pg_id,
      business_number,
      company_name,
      pay_method,
      chosen_rate,
      import_take_rate,
      category,
      contract_date_time,
      import_transfer_fixed_amount,
      billing,
      frequency,
      exceptions,
      exceptions_monthly_pay,
      insurance_amount,
      insurance_rate,
      pay_method_agg,
      dominant,
      dominant_bus,
      contract_year_month,
      service_domain,
      created_at_time,
      updated_at_time,
      yearmonth
    ]
  }
}
