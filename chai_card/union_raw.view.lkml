view: union_raw {
  derived_table: {
    sql: select
      date(p.created_at),
      p.id,
      p.checkout_amount,
      b.id,
      bu.ad_spend,
      bu.chai_credit as chai_spend
      from raw_rds_production.payment p
      left join raw_rds_staging.boost_budget_usage_history bu on bu.payment_id = p.id
      left join raw_rds_staging.boost b on b.payment_id = p.id
      left join raw_rds_staging.boost_promotion_policy bpp on bpp.id = b.boost_promotion_id
      where p.created_at between '2021-10-15' and current_date
      union all
      select
      date(p.created_at),
      p.id,
      p.checkout_amount,
      b.id,
      p.ad_spend,
      p.chai_spend
      from premart_production.payment p
      left join raw_rds_staging.boost b on b.payment_id = p.id
      left join raw_rds_staging.boost_promotion_policy bpp on bpp.id = b.boost_promotion_id
      where p.created_at <= '2021-10-14 23:59:59.999'
      order by 1
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: transactions {
    type: count
    sql: COALESCE(${id},0) ;;
  }

  measure: boost_transactions {
    type: count
    sql: COALESCE(${id1},0) ;;
  }

  measure: total_checkout_amount {
    type: sum
    value_format: "0"
    sql: COALESCE(${checkout_amount},0) ;;
  }

  measure: total_ad_spend {
    type: sum
    value_format: "0"
    sql: COALESCE(${ad_spend},0) ;;
  }

  measure: total_chai_spend {
    type: sum
    value_format: "0"
    sql: COALESCE(${chai_spend},0) ;;
  }

  measure: total_boost_tx {
    type: sum
    value_format: "0"
    sql: COALESCE(case when ${TABLE}.id1 is not null then ${ad_spend},0) ;;
  }

  dimension: date {
    type: date
    sql: ${TABLE}.date ;;
  }

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: checkout_amount {
    type: number
    sql: ${TABLE}.checkout_amount ;;
  }

  dimension: id1 {
    type: number
    sql: ${TABLE}.id1 ;;
  }

  dimension: ad_spend {
    type: number
    sql: ${TABLE}.ad_spend ;;
  }

  dimension: chai_spend {
    type: number
    sql: ${TABLE}.chai_spend ;;
  }

  set: detail {
    fields: [
      date,
      id,
      checkout_amount,
      id1,
      ad_spend,
      chai_spend
    ]
  }
}
