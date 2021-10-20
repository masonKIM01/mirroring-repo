view: boost_budget_usage_history {
  derived_table: {
    sql: select
      date(p.created_at),
      bpp.sub_title,
      sum(p.checkout_amount) as checkout_amount,
      sum(bu.ad_spend) as ad_spend
      from raw_rds_production.payment p
      left join raw_rds_staging.boost_budget_usage_history bu on bu.payment_id = p.id
      left join raw_rds_staging.boost b on b.payment_id = p.id
      left join raw_rds_staging.boost_promotion_policy bpp on bpp.id = b.boost_promotion_id
      where p.created_at between '2021-10-15' and '2021-10-17 23:59:59.999'
      and bu.ad_spend > 0
      group by 1,2
      order by 1 desc
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: date {
    primary_key: yes
    type: date
    sql: ${TABLE}.date ;;
  }

  dimension: sub_title {
    type: string
    sql: ${TABLE}.sub_title ;;
  }

  dimension: checkout_amount {
    type: number
    sql: ${TABLE}.checkout_amount ;;
  }

  dimension: ad_spend {
    type: number
    sql: ${TABLE}.ad_spend ;;
  }

  set: detail {
    fields: [date, sub_title, checkout_amount, ad_spend]
  }
}
