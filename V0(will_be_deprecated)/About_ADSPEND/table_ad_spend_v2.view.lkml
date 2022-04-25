view: table_ad_spend_v2 {
  derived_table: {
    sql: select
      ad.payment_id,
      case when ad.type = 'cps' then ad.unit_price
      when ad.type = 'ratio' and ad.ratio > 1 then ad.ratio * 0.01 * (p.cashback_amount+coalesce(x.cashback_delta,0))
      when ad.type = 'ratio' and ad.ratio < 1 then ad.ratio * (p.cashback_amount+coalesce(x.cashback_delta,0))
      when ad.type = 'cpa' then ad.unit_price * 0.5
      end as ad_spend
from
(select
b.payment_id,
ad.type,
unit_price,
ratio,
b.year,
b.month
from chai_card_chai_prod_public.boost b
inner join chai_card_chai_prod_public.boost_campaign_ad_spend ad
on
(ad.boost_campaign_id = b.boost_campaign_id
and
case when ad.end_at is not null then b.created_at between ad.start_at and ad.end_at
when ad.end_at is null then b.created_at >= ad.start_at end)
where b.year = '2022')ad
left join chai_card_chai_prod_public.payment p on p.id = ad.payment_id and p.year = '2022'
left join
(select distinct year, month, created_at, payment_id, sum(cashback_delta) as cashback_delta
        from
        (select
          *, count(action_type)over(partition by payment_id)
        from chai_card_chai_prod_public.delayed_cashback_history dc
        group by 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16
        )x
        where x.count = 1
        group by 1,2,3,4)x on x.payment_id = ad.payment_id
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
    primary_key: yes
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
