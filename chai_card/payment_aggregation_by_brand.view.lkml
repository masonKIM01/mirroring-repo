view: payment_aggregation_by_brand {
  derived_table: {
    sql: select
        brand_name,
        sum(checkout_amount) as sum_check,
        sum(canceled_amount) as sum_canceled,
        sum(boost_cashback) as sum_cashback
      from mart_staging.payment

      group by 1
      order by 3 desc
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: brand_name {
    type: string
    sql: ${TABLE}.brand_name ;;
  }

  dimension: sum_check {
    type: number
    sql: ${TABLE}.sum_check ;;
  }

  dimension: sum_canceled {
    type: number
    sql: ${TABLE}.sum_canceled ;;
  }

  dimension: sum_cashback {
    type: number
    sql: ${TABLE}.sum_cashback ;;
  }

  set: detail {
    fields: [brand_name, sum_check, sum_canceled, sum_cashback]
  }
}
