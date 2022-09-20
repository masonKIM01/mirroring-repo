view: chai_boost_up_aggregated_by_boost_id {
  derived_table: {
    sql:
      SELECT
        boost_id,
        SUM(bolt_price) AS bolt_price,
        SUM(cashback_amount) AS cashback_up
      FROM chai_card_chai_public.boost_up
      GROUP BY 1
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: cashback_up_total {
    description: "total cashback_amount from boost_up"
    type: sum
    sql: ${TABLE}.cashback_up ;;
  }

  measure: bolt_up {
    description: "total bolt spent from boost_up"
    type: sum
    sql: ${TABLE}.bolt_price ;;
  }

  dimension: boost_id {
    type: number
    primary_key: yes
    sql: ${TABLE}.boost_id ;;
  }

  dimension: bolt_price {
    type: number
    sql: ${TABLE}.bolt_price ;;
  }

  dimension: cashback_up {
    type: number
    sql: ${TABLE}.cashback_up ;;
  }

  set: detail {
    fields: [boost_id, bolt_price, cashback_up]
  }
}
