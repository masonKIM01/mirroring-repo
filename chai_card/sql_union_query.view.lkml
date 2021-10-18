view: sql_union_query {
  derived_table: {
    sql: select
      date(p.created_at),
      sum(p.checkout_amount) as checkout_amt,
      count(distinct p.id),
      sum(case when b.id is not null then p.checkout_amount end) as boost_tx,
      count(case when b.id is not null then p.id end) as boost_count,
      sum(bu.ad_spend) as ad_spend
      from raw_rds_production.payment p
      left join raw_rds_staging.boost_budget_usage_history bu on bu.payment_id = p.id
      left join raw_rds_staging.boost b on b.payment_id = p.id
      left join raw_rds_staging.boost_promotion_policy bpp on bpp.id = b.boost_promotion_id
      where p.created_at between '2021-10-15' and current_date
      group by 1
      union all
      select
      date(p.created_at),
      sum(p.checkout_amount) as checkout_amt,
      count(distinct p.id),
      sum(case when b.id is not null then p.checkout_amount end) as boost_tx,
      count(case when b.id is not null then p.id end) as boost_count,
      sum(p.ad_spend) as ad_spend
      from premart_staging.payment p
      left join raw_rds_staging.boost b on b.payment_id = p.id
      left join raw_rds_staging.boost_promotion_policy bpp on bpp.id = b.boost_promotion_id
      where p.created_at <= '2021-10-14 23:59:59.999'
      group by 1
      order by 1
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: date {
    primary_key : yes
    type: date
    sql: ${TABLE}.date ;;
  }

  dimension: checkout_amt {
    type: number
    sql: ${TABLE}.checkout_amt ;;
  }

  dimension: count_ {
    type: number
    sql: ${TABLE}.count ;;
  }

  dimension: boost_tx {
    type: number
    sql: ${TABLE}.boost_tx ;;
  }

  dimension: boost_count {
    type: number
    sql: ${TABLE}.boost_count ;;
  }

  dimension: ad_spend {
    type: number
    sql: ${TABLE}.ad_spend ;;
  }

  set: detail {
    fields: [
      date,
      checkout_amt,
      count_,
      boost_tx,
      boost_count,
      ad_spend
    ]
  }
}
