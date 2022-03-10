view: table_delayed_cashback {
  derived_table: {
    sql: select distinct year, month, created_at, payment_id, sum(cashback_delta) as cashback_delta
        from
        (select
          *, count(action_type)over(partition by payment_id)
        from chai_card_chai_prod_public.delayed_cashback_history dc
        group by 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16
        )x
        where x.count = 1
        group by 1,2,3,4
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: cashback {
    type: sum
    sql: coalesce(${TABLE}.cashback_delta,0) ;;
  }

  dimension: id {
    type: number
    sql: ${TABLE}.payment_id ;;
  }

  dimension_group: created_at {
    type: time
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: updated_at {
    type: time
    sql: ${TABLE}.updated_at ;;
  }

  dimension: cashback_delta {
    type: number
    sql: ${TABLE}.cashback_delta ;;
  }
dimension: payment_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.payment_id ;;
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
      created_at_time,
      updated_at_time,
      cashback_delta,
      year,
      month
    ]
  }
}
