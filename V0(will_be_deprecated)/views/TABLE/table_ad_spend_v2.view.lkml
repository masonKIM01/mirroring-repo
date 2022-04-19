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
      inner join
        (select distinct
          t.boost_campaign_id,
          case when ttype = 2 then null
          else t.start_at end as start_at,
          case when ttype = 2 then null
          else t.end_at end as end_at,
          t.type,
          t.unit_price,
          t.ratio,
          t.year,
          t.ttype
        from
          (select *,
            case when count >= 2 and avg(unit_price)over(partition by boost_campaign_id) <> unit_price then 1
            else 2
            end as ttype
          from
            (select
              *,
              count(ad.unit_price)over(partition by boost_campaign_id)
            from chai_card_chai_prod_public.boost_campaign_ad_spend ad
            group by 1,2,3,4,5,6,7,8,9,10,11,12,13
            )x
          )t
        )ad on ad.boost_campaign_id = b.boost_campaign_id
            and
              ((case when ad.ttype = 1 then b.created_at between start_at and isnull(end_at, start_at +100) end)
            or (case when ad.ttype = 2 then b.created_at is not null end))
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
