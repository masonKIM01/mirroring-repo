view: merchant_details {
  sql_table_name:  hmscatalog.importdb.merchant_details ;;
  suggestions: no

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: business_number {
    description: "사업자번호"
    type: number
    sql: ${TABLE}.business_number ;;
  }

  dimension: company_name {
    description: "회사이름"
    type: string
    sql: ${TABLE}.company_name ;;
  }

  dimension: company_name_eng {
    description: "회사영문이름"
    type: string
    sql: ${TABLE}.company_name_eng ;;
  }

  dimension: business_number_unknown {
    type: yesno
    sql: ${TABLE}.business_number_unknown ;;
  }

  set: detail {
    fields: [user_id, business_number, company_name, company_name_eng, business_number_unknown]
  }
}
