view: bolt_payment_table {
  derived_table: {
    sql: select
      a.month,
      sum(a.checkout_amount) as checkout_amount,
      sum(a.cashback_amount) as cashback_amount,
      sum(a.bolt_in) as bolt_in,
      sum(a.bolt_out) as bolt_out,
      sum(a.bolt_earned) as bolt_earned
      from (select
      to_char(p.created_at,'yyyymm') as month,
      sum(p.checkout_amount) as checkout_amount,
      sum(p.cashback_amount) as cashback_amount,
      0 as bolt_in,
      0 as bolt_out,
      0 as bolt_earned
      from raw_rds_production.payment p
      group by 1,4,5,6
      union all
      select
      to_char(bh.created_at,'yyyymm') as month,
      0 as checkout_amount,
      0 as cashback_amount,
      sum(case when bh.action = 'accumulation' then bh.count end) as bolt_in,
      sum(case when bh.action = 'deduction' then bh.count end) as bolt_out,
      sum(case when bh.type = 'payment_in' then bh.count end) as bolt_earned
      from raw_rds_production.bolt_history bh
      group by 1,2,3)a
      group by 1
      order by 1
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: month {
    type: string
    sql: ${TABLE}.month ;;
  }

  dimension: checkout_amount {
    type: number
    sql: ${TABLE}.checkout_amount ;;
  }

  dimension: cashback_amount {
    type: number
    sql: ${TABLE}.cashback_amount ;;
  }

  dimension: bolt_in {
    type: number
    sql: ${TABLE}.bolt_in ;;
  }

  dimension: bolt_out {
    type: number
    sql: ${TABLE}.bolt_out ;;
  }

  dimension: bolt_earned {
    type: number
    sql: ${TABLE}.bolt_earned ;;
  }

  set: detail {
    fields: [
      month,
      checkout_amount,
      cashback_amount,
      bolt_in,
      bolt_out,
      bolt_earned
    ]
  }
}
