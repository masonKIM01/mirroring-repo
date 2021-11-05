view: card_weekly {
  derived_table: {
    sql: select distinct
      date(p.created_at),
      min(date(p.created_at))over(partition by datepart(week, p.created_at))+6 as week,
      p.id,
      p.user_id,
      p.checkout_amount,
      b.payment_id as boost_payment_id,
      b.user_id as boosting_user,
      p.cashback_amount
      from raw_rds_production.payment p
      inner join raw_rds_production.merchant m on m.id = p.merchant_id
      left join raw_rds_production.boost b on b.payment_id = p.id
      where
      p.status = 'confirmed'
      and m.name = '차이카드'
      order by 1
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: Volume {
    type: sum
    sql: ${TABLE}.checkout_amount ;;
  }

  measure: boost_Volume{
    type: sum
    sql: case when ${TABLE}.boost_payment_id is not null then ${TABLE}.checkout_amount end;;
  }

  measure: cashback {
    type: sum
    sql: ${TABLE}.cashback_amount;;
  }

  measure: transactions {
    type: count_distinct
    sql: ${TABLE}.id ;;
  }

  measure: boosts {
    type: count_distinct
    sql: ${TABLE}.boost_payment_id ;;
  }

  measure: transacting_users {
    type: count_distinct
    sql: ${TABLE}.user_id ;;
  }

  measure: boosting_users {
    type: count_distinct
    sql: ${TABLE}.boosting_user ;;
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

  dimension: week {
    type: date
    sql: ${TABLE}.week ;;
  }

  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: checkout_amount {
    type: number
    sql: ${TABLE}.checkout_amount ;;
  }

  dimension: boost_payment_id {
    type: string
    sql: ${TABLE}.boost_payment_id ;;
  }

  dimension: cashback_amount {
    type: number
    sql: ${TABLE}.cashback_amount ;;
  }

  set: detail {
    fields: [
      week,
      id,
      user_id,
      checkout_amount,
      boost_payment_id,
      cashback_amount
    ]
  }
}
