view: bd_member_tracking {
  derived_table: {
    sql: select
      p.date as created_at,
      y.*,
      p.checkout_amount,
      p.cashback_amount,
      p.card_checkout,
      p.card_cashback
      from
      (select
      date(p.created_at),
      sum(p.checkout_amount) as checkout_amount,
      sum(p.cashback_amount) as cashback_amount,
      sum(case when m.name = '차이카드' then p.checkout_amount end) as card_checkout,
      sum(case when m.name = '차이카드' then p.cashback_amount end) as card_cashback
      from raw_rds_production.payment p
      left join raw_rds_production.merchant m on m.id = p.merchant_id
      where p.status = 'confirmed'
      group by 1
      )p
      left join
      (select x.*,
            case when x.name in ('뮬라웨어','위메프오','쿠쿠몰','바잇미','여기어때','아모레몰','얌테이블','아워홈','KKday','크로켓','롭스','무신사 ','아몬즈','무신사','캐시비','현대식품관','현대백화점투홈','설로인','네파','위메프','롯데월드','화해','보고플레이','동원몰','데일리호텔','SK스토아','한섬EQL','이삭토스트','캐치패션')
            then 'cloe'
            when x.name in ('에릭 요한슨 사진전','그린카','젝시믹스','펫프렌즈','펫프렌즈 (삭제 필요)','인더웨어','인테이크','어바웃펫','에이블리','디코드','아몬즈','해피머니','티몬 스키시즌 오픈!','술담화','다노샵','프립','브랜디','W컨셉','브랜드닭','이니스프리','모던하우스','텐바이텐')
                 then 'kevin'
            else 'null'
            end as "owner"
      from
      (select
      a.date , a.id, a.name,
      case when a.type = 'ROAS' then a.cashback_amount * cast(a.contract as numeric(10,4))
           else a.p_count * a.contract
      end as ad_spend
      from
      (select distinct
            date(to_char(bh.created_at,'yyyy-mm-dd')),
            b2.id, b2.name,
            case when b2.id in ('120','758','757','467') then 'CPS'
                 when b2.id in ('729') then 'CPA'
                 else 'ROAS'
            end as "type",
            case when b2.id in ('729') then '15000'
                 when b2.id in ('120','758','757') then '5000'
                 when b2.id in ('467') then '3000'
                 when b2.id in ('715','443','717','718','612') then '1'
                 when b2.id in ('284','733','730','319','520') then '0.7'
                 when b2.id in ('734','720') then '0.6'
                 when b2.id in ('251','714','731','322','719','713','324','716','611','721','732','722','224','693') then '0.5'
                 when b2.id in ('228') then '0.4'
                 when b2.id in ('114') then '0.3'
            end as "contract",
            sum(bh.ad_spend) as cashback_amount,
            count(bh.payment_id) as p_count
            from raw_rds_production.boost_budget_usage_history bh
            inner join raw_rds_production.boost b on b.payment_id = bh.payment_id
            inner join raw_rds_production.boost_promotion_policy bpp on bpp.id = b.boost_promotion_id
            inner join raw_rds_production.brand b2 on b2.id = bpp.brand_id
            where bh.ad_spend > 0
            group by 1,2,3,4)a
      union all
        select date(ap.created_at), b2.id, b2.name,
        sum(ap.ad_spend) as ad_spend
        from analytics_production.analytics_payment ap
        inner join raw_rds_production.boost b on b.payment_id = ap.id
        inner join raw_rds_production.boost_promotion_policy bpp on bpp.id = b.boost_promotion_id
        inner join raw_rds_production.brand b2 on b2.id = bpp.brand_id
        where ap.ad_spend > 0
        and ap.created_at between '2021-01-01' and '2021-10-14'
        group by 1,2,3)x
        )y on p.date = y.date
      order by 1,2,3,4
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: total_checkout_amount {
    type: sum
    sql: ${TABLE}.checkout_amount  ;;
  }

  measure: total_cashback_amount {
    type: sum
    sql: ${TABLE}.cashback_amount  ;;
  }

  measure: total_ad_spend {
    type: sum
    sql: ${TABLE}.ad_spend  ;;
  }

  measure: total_card_checkout_amount {
    type: sum
    sql: ${TABLE}.card_checkout  ;;
  }

  measure: total_card_cashback_amount {
    type: sum
    sql: ${TABLE}.card_cashback  ;;
  }

  dimension_group: created_at {
    type: time
    sql: ${TABLE}.created_at ;;
  }

  dimension: date {
    type: date
    sql: ${TABLE}.date ;;
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: ad_spend {
    type: number
    sql: ${TABLE}.ad_spend ;;
  }

  dimension: owner {
    type: string
    sql: ${TABLE}.owner ;;
  }

  dimension: checkout_amount {
    type: number
    sql: ${TABLE}.checkout_amount ;;
  }

  dimension: cashback_amount {
    type: number
    sql: ${TABLE}.cashback_amount ;;
  }

  dimension: card_checkout {
    type: number
    sql: ${TABLE}.card_checkout ;;
  }

  dimension: card_cashback {
    type: number
    sql: ${TABLE}.card_cashback ;;
  }

  set: detail {
    fields: [
      created_at_time,
      date,
      id,
      name,
      ad_spend,
      owner,
      checkout_amount,
      cashback_amount,
      card_checkout,
      card_cashback
    ]
  }
}
