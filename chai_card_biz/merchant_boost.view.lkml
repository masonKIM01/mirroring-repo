view: merchant_boost {
  derived_table: {
    sql:
      select
      date(p1.created_at),
      bpp.sub_title,
      bpp.title,
      to_char(count(p1.payment_id),'999,999,999') as Transactions,
      to_char(sum(p1.checkout_amount),'999,999,999') as checkout_amount,
      to_char(sum(case when date(p1.created_at) <= '2021-10-14' then p.ad_spend else bh.ad_spend end),'999,999,999') as ad_spend,
      to_char(sum(case when date(p1.created_at) <= '2021-10-14' then p.chai_credit else bh.chai_credit end),'999,999,999') as chai_spend
      from raw_rds_production.payment_data p1
      left join analytics_production.analytics_payment p on p.id = p1.payment_id
      inner join raw_rds_production.boost b on p1.payment_id = b.payment_id
      inner join raw_rds_production.boost_promotion_policy bpp on bpp.id = b.boost_promotion_id
      left join raw_rds_production.brand b2 on b2.id = bpp.brand_id
      left join raw_rds_production.boost_budget_usage_history bh on bh.payment_id = p1.payment_id
      where
      date(p1.created_at) between date_trunc('month', current_date) and current_date-1
      group by 1,2,3
      order by 1 desc
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: date {
    type: date
    primary_key: yes
    sql: ${TABLE}.date ;;
  }

  dimension: sub_title {
    type: string
    sql: ${TABLE}.sub_title ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: Transactions {
    type: string
    sql: ${TABLE}.Transactions ;;
  }

  dimension: checkout_amount {
    type: string
    sql: ${TABLE}.checkout_amount ;;
  }

  dimension: canceled_amount {
    type: string
    sql: ${TABLE}.canceled_amount ;;
  }

  dimension: ad_spend {
    type: string
    sql: ${TABLE}.ad_spend ;;
  }

  dimension: chai_spend {
    type: string
    sql: ${TABLE}.chai_spend ;;
  }

  set: detail {
    fields: [
      date,
      sub_title,
      title,
      checkout_amount,
      canceled_amount,
      ad_spend,
      chai_spend
    ]
  }
}
