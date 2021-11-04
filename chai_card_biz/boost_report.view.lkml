view: boost_report {
  derived_table: {
    sql: select
      date(p.created_at),
      b2.name,
      bpp.type,
      bpp.promotion_type,
      bpp.title,
      p.id,
      b.payment_id,
      b.user_id,
      p.checkout_amount,
      p.cashback_amount,
      bh.ad_spend,
      bh.chai_credit
      from raw_rds_production.brand b2
      left join raw_rds_production.boost_promotion_policy bpp on b2.id = bpp.brand_id
      left join raw_rds_production.boost b on bpp.id = b.boost_promotion_id
      left join raw_rds_production.payment p on p.id = b.payment_id
      left join raw_rds_production.boost_budget_usage_history bh on bh.payment_id = p.id
      where p.status = 'confirmed'
      order by 2,1,3,4
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: boost_count{
    type: count_distinct
    sql: ${TABLE}.payment_id ;;
  }

  measure: customer_count{
    type: count_distinct
    sql: ${TABLE}.user_id ;;
  }

  measure: boost_tx {
    type: sum
    sql: ${TABLE}.checkout_amount ;;
  }

  measure: total_cashback_amount {
    type: sum
    sql: ${cashback_amount} ;;
  }

  measure: total_ad_spend{
    type: sum
    sql: ${TABLE}.ad_spend ;;
  }

  measure: total_chai_credit{
    type: sum
    sql: ${TABLE}.chai_credit ;;
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

  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: payment_id {
    type: string
    sql: ${TABLE}.payment_id ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
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

  dimension: cashback_amount {
    type: number
    sql: ${TABLE}.cashback_amount ;;
  }

  dimension: checkout_amount {
    type: number
    sql: ${TABLE}.checkout_amount ;;
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
      id,
      payment_id,
      user_id,
      checkout_amount,
      cashback_amount,
      ad_spend,
      chai_credit
    ]
  }
}
