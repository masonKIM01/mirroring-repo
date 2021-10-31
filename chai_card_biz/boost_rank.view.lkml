view: boost_rank {
  derived_table: {
    sql: select
      rank()over(partition by b.week order by b."payment_confirmed" desc) as rank
      , b.*
      from
      (select
      a.week, a.name,
      to_char(sum(a."buy boost"),'999,999,999') as "buy_boost",
      to_char(sum(a."payment"),'999,999,999') as "payment_confirmed",
      to_char(sum(a."boost_tx"),'999,999,999') as "boost_tx",
      to_char(sum(a."boost_cashback_amt"),'999,999,999') as "boost_cashback_amt"
      from (select
      date(b.usable_from),
      min(date(b.usable_from))over(partition by datepart(week, date(b.usable_from))) as week,
      bpp.sub_title as name,
      count(b.user_id) as "buy boost",
      count(b.payment_id) as "payment",
      sum(p.checkout_amount) as "boost_tx",
      sum(p.cashback_amount) as "boost_cashback_amt"
      from raw_rds_production.boost b
      inner join raw_rds_production.boost_promotion_policy bpp on bpp.id = b.boost_promotion_id
      inner join raw_rds_production.brand b2 on b2.id = bpp.brand_id
      left join raw_rds_production.payment p on p.id = b.payment_id
      where b.usable_from between '2021-10-18' and '2021-10-31 23:59:59.999'
      group by 1,3)a
      group by 1,2)b
      --order by 1,2,3
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }

  dimension: week {
    type: date
    sql: ${TABLE}.week ;;
  }

  dimension: name {
    type: string
    primary_key: yes
    sql: ${TABLE}.name ;;
  }

  dimension: buy_boost {
    type: string
    sql: ${TABLE}.buy_boost ;;
  }

  dimension: payment_confirmed {
    type: string
    sql: ${TABLE}.payment_confirmed ;;
  }

  dimension: boost_tx {
    type: string
    sql: ${TABLE}.boost_tx ;;
  }

  dimension: boost_cashback_amt {
    type: string
    sql: ${TABLE}.boost_cashback_amt ;;
  }

  set: detail {
    fields: [
      rank,
      week,
      name,
      buy_boost,
      payment_confirmed,
      boost_tx,
      boost_cashback_amt
    ]
  }
}
