view: brand_merchat_boost {
  derived_table: {
    sql: select
      date(p.created_at),
      bpp.brand_id,
      b2.name,
      bpp.sub_title,
      bpp.title,
      to_char(count(p.id),'999,999,999') as Transactions,
      to_char(sum(p.checkout_amount),'999,999,999') as checkout_amount,
      to_char(sum(case when date(p.created_at) <= '2021-10-14' then p1.ad_spend else bh.ad_spend end),'999,999,999') as ad_spend,
      to_char(sum(case when date(p.created_at) <= '2021-10-14' then p1.chai_credit else bh.chai_credit end),'999,999,999') as chai_spend
      from chai_card_chai_prod_public.payment p
      left join analytics_deprecated.analytics_payment p1 on p.id = p1.id
      inner join chai_card_chai_prod_public.boost b on p.id = b.payment_id
      inner join chai_card_chai_prod_public.boost_promotion_policy bpp on bpp.id = b.boost_promotion_id
      left join chai_card_chai_prod_public.brand b2 on b2.id = bpp.brand_id
      left join chai_card_chai_prod_public.boost_budget_usage_history bh on bh.payment_id = p.id
      where
      date(p.created_at) between date_trunc('month', current_date) and current_date
      group by 1,2,3,4,5
      order by 1 desc
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

  dimension: brand_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.brand_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: transactions {
    type: string
    sql: ${TABLE}.transactions ;;
  }

  dimension: checkout_amount {
    type: string
    sql: ${TABLE}.checkout_amount ;;
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
      brand_id,
      name,
      transactions,
      checkout_amount,
      ad_spend,
      chai_spend
    ]
  }
}
