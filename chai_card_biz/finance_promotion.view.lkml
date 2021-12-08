view: finance_promotion {
  derived_table: {
    sql: select
      p.created_at,
      p.cashback_amount,
      case when date(p.created_at) <= '2021-10-14' then ap.ad_spend else bh.ad_spend end as ad_spend,
      case when date(p.created_at) <= '2021-10-14' then ap.ad_spend else bh.ad_spend end as chai_credit
      from chai_card_chai_prod_public.payment p
      left join chai_card_chai_prod_public.boost b on b.payment_id = p.id
      left join analytics_deprecated.analytics_payment ap on ap.id = p.id and ap.status = 'confirmed'
      left join chai_card_chai_prod_public.boost_budget_usage_history bh on bh.payment_id = p.id
      where p.status = 'confirmed'
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: cashback {
    type: sum
    sql: ${TABLE}.cashback_amount;;
  }

  measure: ad_spend_sum {
    type: sum
    sql: ${TABLE}.ad_spend;;
  }

  measure: chai_credit_sum {
    type: sum
    sql: ${TABLE}.chai_credit;;
  }

  dimension_group: created_at {
    type: time
    sql: ${TABLE}.created_at ;;
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
    fields: [created_at_time, cashback_amount, ad_spend, chai_credit]
  }
}
