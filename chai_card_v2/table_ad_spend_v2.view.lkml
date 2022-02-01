view: table_ad_spend_v2 {
  derived_table: {
    sql: select distinct
      p.id,
      case when ad.type = 'cps' then ad.unit_price when ad.type = 'ratio' then ad.ratio * 0.01 * p.cashback_amount end as ad_spend
      from chai_card_chai_prod_public.payment p
      inner join chai_card_chai_prod_public.boost b on b.payment_id = p.id
      inner join chai_card_chai_prod_public.boost_campaign_ad_spend ad on ad.boost_campaign_id = b.boost_campaign_id
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: sum_ad_spend {
    type: sum
    sql: ${TABLE}.ad_spend ;;
  }

  dimension: id {
    type: string
    primary_key: yes
    sql: ${TABLE}.id ;;
  }

  dimension: ad_spend {
    type: number
    sql: ${TABLE}.ad_spend ;;
  }

  set: detail {
    fields: [id, ad_spend]
  }
}
