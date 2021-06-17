view: kcb_data {
  sql_table_name: hmscatalog.importdb.merchant_sales_occurred ;;

  suggestions: no


  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: business_number {
    type: number
    sql: ${TABLE}.business_number ;;
  }

  dimension: company_name {
    type: string
    sql: ${TABLE}.company_name ;;
  }

  dimension: foundation_date {
    type: date
    sql: ${TABLE}.foundation_date ;;
  }

  dimension: closure_date {
    type: date
    sql: ${TABLE}.closure_date ;;
  }

  dimension: registration_date {
    type: date
    sql: ${TABLE}.registration_date ;;
  }

  dimension: base_date {
    type: date
    sql: ${TABLE}.base_date ;;
  }

  dimension: is_validate {
    type: yesno
    sql: ${TABLE}.is_validate ;;
  }

  dimension: is_closed {
    type: yesno
    sql: ${TABLE}.is_closed ;;
  }

  dimension: company_age_month {
    type: number
    sql: ${TABLE}.company_age_month ;;
  }

  dimension: company_age_year {
    type: number
    sql: ${TABLE}.company_age_year ;;
  }

  dimension: loc_city {
    type: string
    sql: ${TABLE}.loc_city ;;
  }

  dimension: loc_cnty_gu {
    type: string
    sql: ${TABLE}.loc_cnty_gu ;;
  }

  dimension: loc_dong {
    type: string
    sql: ${TABLE}.loc_dong ;;
  }

  dimension: sic_code {
    type: string
    sql: ${TABLE}.sic_code ;;
  }

  dimension: sic_first_clsfy {
    type: string
    sql: ${TABLE}.sic_first_clsfy ;;
  }

  dimension: sic_second_clsfy {
    type: string
    sql: ${TABLE}.sic_second_clsfy ;;
  }

  dimension: sic_third_clsfy {
    type: string
    sql: ${TABLE}.sic_third_clsfy ;;
  }

  dimension: sic_fourth_clsfy {
    type: string
    sql: ${TABLE}.sic_fourth_clsfy ;;
  }

  dimension: sic_fifth_clsfy {
    type: string
    sql: ${TABLE}.sic_fifth_clsfy ;;
  }

  dimension: estim_revenue_yr {
    type: number
    sql: ${TABLE}.estim_revenue_yr ;;
  }

  dimension: revenue_error_code {
    type: string
    sql: ${TABLE}.revenue_error_code ;;
  }

  set: detail {
    fields: [
      business_number,
      company_name,
      foundation_date,
      closure_date,
      registration_date,
      base_date,
      is_validate,
      is_closed,
      company_age_month,
      company_age_year,
      loc_city,
      loc_cnty_gu,
      loc_dong,
      sic_code,
      sic_first_clsfy,
      sic_second_clsfy,
      sic_third_clsfy,
      sic_fourth_clsfy,
      sic_fifth_clsfy,
      estim_revenue_yr,
      revenue_error_code
    ]
  }
}
