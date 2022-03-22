view: join_adspend {
  derived_table: {
    sql: select   '2022-01-01'  as month,   '간편결제'  as payment_type,  '83505301.42'  as ad_spend  union all
      select   '2022-01-01'  as month,   '카드'  as payment_type,  '180501771.1'  as ad_spend  union all
      select   '2022-12-01'  as month,   '간편결제'  as payment_type,  '38717982.6'  as ad_spend  union all
      select   '2022-12-01'  as month,   '카드'  as payment_type,  '149858116.7'  as ad_spend  union all
      select   '2022-11-01'  as month,   '간편결제'  as payment_type,  '12094711.5'  as ad_spend  union all
      select   '2022-11-01'  as month,   '카드'  as payment_type,  '134672438.7'  as ad_spend  union all
      select   '2022-10-01'  as month,   '간편결제'  as payment_type,  '10072486.8'  as ad_spend  union all
      select   '2022-10-01'  as month,   '카드'  as payment_type,  '85447498'  as ad_spend  union all
      select
      to_char(p.created_at,'yyyy-mm-01') as month,
      case when m.name = '차이 신용카드' then '신용카드'
      when m.name = '차이 체크카드' then '카드'
      else '간편결제' end as payment_type,
      sum(x.ad_spend) as ad_spend
      from chai_card_chai_prod_public.payment p
      left join chai_card_chai_prod_public.merchant m on m.id = p.merchant_id
      left join chai_card_chai_prod_public.boost b on b.payment_id = p.id
      left join chai_card_chai_prod_public.boost_promotion_policy bpp on bpp.id = b.boost_promotion_id
      left join chai_card_chai_prod_public.brand b2 on b2.id = bpp.brand_id
      left join (select distinct
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
                    ((case when ad.ttype = 1 then b.created_at between start_at and end_at end)
                  or (case when ad.ttype = 2 then b.created_at is not null end)))x on x.payment_id = p.id
      where p.year = '2022'
      and p.created_at >= '2022-02-01'
      group by 1,2
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: adspend {
    type: sum
    sql: ${ad_spend} ;;
  }

  dimension: month {
    type: string
    sql: ${TABLE}.month ;;
  }

  dimension: payment_type {
    type: string
    sql: ${TABLE}.payment_type ;;
  }

  dimension: ad_spend {
    type: number
    sql: ${TABLE}.ad_spend ;;
  }

  set: detail {
    fields: [month, payment_type, ad_spend]
  }
}
