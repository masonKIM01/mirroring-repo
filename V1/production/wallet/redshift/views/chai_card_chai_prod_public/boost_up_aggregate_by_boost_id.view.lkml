view: chai_boost_up_aggregate_by_boost_id {
  derived_table: {
    sql:
      select
        boost_id,
        sum(bolt_price) as bolt_price,
        sum(cashback_amount) as cashback_up
      from chai_card_chai_prod_public.boost_up
      group by 1
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: cashback_up_total {
    description: "cashback_amount from boost_up"
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
