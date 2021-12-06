view: bolt_payment_table {
  derived_table: {
    sql: select
      a.date,
      sum(a.checkout_amount) as checkout_amount,
      sum(a.cashback_amount) as cashback_amount,
      sum(a.bolt_in) as bolt_in,
      sum(a.bolt_out) as bolt_out,
      sum(a.bolt_earned) as bolt_earned,
      sum(a.bolt_boosted) as bolt_boosted
      from (select
      date(p.created_at),
      sum(p.checkout_amount) as checkout_amount,
      sum(p.cashback_amount) as cashback_amount,
      0 as bolt_in,
      0 as bolt_out,
      0 as bolt_earned,
      0 as bolt_boosted
      from raw_rds_production.payment p
      where p.merchant_id = '0385e3db-4a50-4035-9285-1ced4a3e0209'
      group by 1,4,5,6
      union all
      select
      date(bh.created_at),
      0 as checkout_amount,
      0 as cashback_amount,
      sum(case when bh.action = 'accumulation' then bh.count end) as bolt_in,
      sum(case when bh.action = 'deduction' then bh.count end) as bolt_out,
      sum(case when bh.type = 'payment_in' then bh.count end) as bolt_earned,
      sum(case when bh.type = 'boost_out' then bh.count end) as bolt_boosted
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

  measure: total_checkout_amount {
    type: sum
    sql: ${checkout_amount}  ;;
  }

  measure: total_cashback_amount {
    type: sum
    sql: ${cashback_amount}  ;;
  }

  measure: total_bolt_in {
    type: sum
    sql: ${bolt_in}  ;;
  }

  measure: total_bolt_out {
    type: sum
    sql: ${bolt_out}  ;;
  }

  measure: total_bolt_earned {
    type: sum
    sql: ${bolt_earned}  ;;
  }

  measure: total_bolt_boosted {
    type: sum
    sql: ${bolt_boosted}  ;;
  }

  dimension: date {
    type: date_time
    sql: ${TABLE}.date ;;
  }

  dimension_group: date {
    type: time
    timeframes: [year, month, week, month_num, month_name, date, week_of_year]
    sql: ${TABLE}.date ;;
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

  dimension: bolt_boosted {
    type: number
    sql: ${TABLE}.bolt_boosted ;;
  }

  set: detail {
    fields: [
      date,
      checkout_amount,
      cashback_amount,
      bolt_in,
      bolt_out,
      bolt_earned,
      bolt_boosted
    ]
  }
}
