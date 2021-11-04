view: boost_report {
  derived_table: {
    sql: select
      date(p.created_at),
      b2.name,
      bpp.type,
      bpp.promotion_type,
      bpp.title,
      count(distinct b.payment_id) as "boost_count",
      count(distinct case when b.payment_id is not null then p.user_id end) as "customer_count",
      sum(case when b.payment_id is not null then p.checkout_amount end) as "boost_Tx",
      sum(p.cashback_amount) as cashback_amount,
      sum(bh.ad_spend) as ad_spend,
      sum(bh.chai_credit) as chai_credit
      from raw_rds_production.brand b2
      left join raw_rds_production.boost_promotion_policy bpp on b2.id = bpp.brand_id
      left join raw_rds_production.boost b on bpp.id = b.boost_promotion_id
      left join raw_rds_production.payment p on p.id = b.payment_id
      left join raw_rds_production.boost_budget_usage_history bh on bh.payment_id = p.id
      where p.created_at between '2021-11-01' and '2021-11-04 23:59:59.999'
      and p.status = 'confirmed'
      group by 1,2,3,4,5
      order by 2,1,3,4
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: date {
    type: date
    sql: ${TABLE}.date ;;
  }

  dimension_group: date_field {
    type: time
    timeframes: [year, month, month_num, month_name, date, week_of_year]
    sql: ${TABLE}.date ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: promotion_type{
    type: string
    sql: ${TABLE}.promotion_type ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: boost_count {
    type: number
    sql: ${TABLE}.boost_count ;;
  }

  dimension: customer_count {
    type: number
    sql: ${TABLE}.customer_count ;;
  }

  dimension: boost_tx {
    type: number
    sql: ${TABLE}.boost_tx ;;
  }

  dimension: cashback_amount {
    type: number
    sql: ${TABLE}.cashback_amount ;;
  }

  dimension: ad_spend {
    type: number
    sql: ${TABLE}.ad_spend ;;
  }

  dimension: chai_credit {
    type: number
    sql: ${TABLE}.chai_credit ;;
  }

  set: detail {
    fields: [
      date,
      name,
      type,
      title,
      promotion_type,
      boost_count,
      customer_count,
      boost_tx,
      cashback_amount,
      ad_spend,
      chai_credit
    ]
  }
}
