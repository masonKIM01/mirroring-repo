view: table_ad_spend_v2 {
  derived_table: {
    sql: select distinct
      b.payment_id,
      case when ad.type = 'cps' then ad.unit_price
      when ad.type = 'ratio' then ad.ratio * 0.01 * p.cashback_amount
      when ad.type = 'cpa' then ad.unit_price * 0.5
      end as ad_spend
      from chai_card_chai_prod_public.boost b
      inner join chai_card_chai_prod_public.payment p on p.id = b.payment_id
      inner join chai_card_chai_prod_public.boost_campaign_ad_spend ad on ad.boost_campaign_id = b.boost_campaign_id
      and (
  case when ad.end_at is not null then b.created_at between ad.start_at and ad.end_at
  when ad.end_at is null then ad.start_at <= b.created_at end)
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: sum_ad_spend {
    type: sum
    sql: coalesce(${TABLE}.ad_spend,0) ;;
  }

  dimension: payment_id {
    type: string
    sql: ${TABLE}.payment_id ;;
  }

  dimension: ad_spend {
    type: number
    sql: ${TABLE}.ad_spend ;;
  }

  set: detail {
    fields: [payment_id, ad_spend]
  }
}
