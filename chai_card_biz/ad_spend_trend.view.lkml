view: ad_spend_trend {
  derived_table: {
    sql: select
      *, b.cashback_amount-b."new_ad_spend" as "new_chai_credit"
      from (select
      a.date, a.name, a.id, a.checkout_amount, a.cashback_amount, cast(a.merchant_ratio as numeric(10,4)), a.ad_spend, a.chai_credit,
      case when a.name in ('현대백화점투홈') then '5000'
      when a.name in ('설로인') then '5000'
      else cast(a.merchant_ratio as numeric(10,4)) * a.cashback_amount
      end as "New_ad_spend"
      from
      (
      select
        date(p.created_at),
        b2.name,
        case when b2.name ='현대백화점투홈' then '5000'
      when b2.name ='설로인' then '5000'
      when b2.name ='뮬라웨어' then '1'
      when b2.name ='인더웨어' then '1'
      when b2.name ='인테이크' then '1'
      when b2.name ='아몬즈' then '1'
      when b2.name ='크로켓' then '1'
      when b2.name ='바잇미' then '0.7'
      when b2.name ='얌테이블' then '0.7'
      when b2.name ='디코드' then '0.7'
      when b2.name ='술담화' then '0.7'
      when b2.name ='다노샵' then '0.7'
      when b2.name ='위메프오' then '0.6'
      when b2.name ='아워홈' then '0.6'
      when b2.name ='그린카' then '0.5'
      when b2.name ='젝시믹스' then '0.5'
      when b2.name ='펫프렌즈' then '0.5'
      when b2.name ='어바웃펫' then '0.5'
      when b2.name ='쿠쿠몰' then '0.5'
      when b2.name ='아모레몰' then '0.5'
      when b2.name ='에이블리' then '0.5'
      when b2.name ='해피머니' then '0.5'
      when b2.name ='프립' then '0.5'
      when b2.name ='카모아' then '0.5'
      when b2.name ='무신사' then '0.3'
        end as "merchant_ratio",
        p.id,
        p.user_id,
        p.checkout_amount,
        p.cashback_amount,
        bh.chai_credit,
        bh.ad_spend
      from raw_rds_production.payment p
      left join raw_rds_production.merchant m on p.merchant_id = m.id
      left join raw_rds_production.boost_budget_usage_history bh on bh.payment_id = p.id
      left join raw_rds_production.boost b on b.payment_id = p.id
      left join raw_rds_production.boost_promotion_policy bpp on bpp.id = b.boost_promotion_id
      left join raw_rds_production.brand b2 on b2.id = bpp.brand_id
      where p.created_at between '2021-11-01' and '2021-11-07 23:59:59.999'
      and bh.ad_spend > 0
      and p.status = 'confirmed'
      )a
      )b
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }


  measure: users {
    type: count_distinct
    sql: ${TABLE}.user_id ;;
  }

  measure: transactions {
    type: count_distinct
    sql: ${TABLE}.id ;;
  }

  measure: total_checkout_amount {
    type: sum
    sql: ${TABLE}."checkout_amount" ;;
  }

  measure: total_cashback_amount {
    type: sum
    sql: ${TABLE}."cashback_amount" ;;
  }

  measure: total_new_ad_spend {
    type: sum
    sql: ${TABLE}."total_new_ad_spend" ;;
  }

  measure: total_new_chai_credit {
    type: sum
    sql: ${TABLE}."total_new_chai_credit" ;;
  }

  dimension: date {
    type: date
    sql: ${TABLE}.date ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: checkout_amount {
    type: number
    sql: ${TABLE}.checkout_amount ;;
  }

  dimension: cashback_amount {
    type: number
    sql: ${TABLE}.cashback_amount ;;
  }

  dimension: merchant_ratio {
    type: number
    sql: ${TABLE}.merchant_ratio ;;
  }

  dimension: ad_spend {
    type: number
    sql: ${TABLE}.ad_spend ;;
  }

  dimension: chai_credit {
    type: number
    sql: ${TABLE}.chai_credit ;;
  }

  dimension: new_ad_spend {
    type: number
    sql: ${TABLE}.new_ad_spend ;;
  }

  dimension: new_chai_credit {
    type: number
    sql: ${TABLE}.new_chai_credit ;;
  }

  set: detail {
    fields: [
      date,
      name,
      id,
      user_id,
      checkout_amount,
      cashback_amount,
      merchant_ratio,
      ad_spend,
      chai_credit,
      new_ad_spend,
      new_chai_credit
    ]
  }
}
