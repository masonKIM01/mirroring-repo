view: card_payment {
  derived_table: {
    sql: select
a.*, coalesce(a.cashback_amount - a.ad_spend,0) as "chai_spend"
from (
select
      p.*,
      m.name,
      b.id as boost_id,
      bpp.sub_title,
      bpp.title,
      case when b2.name is null then '0' else cast(b2.merchant_ratio as numeric(10,4)) end as merchant_ratio,
      (case when p.created_at <= '2021-10-14' then coalesce(ap.ad_spend,0)
            when b2.name = '현대백화점투홈' then '5000'
            when b2.name = '설로인' then '5000'
            else coalesce(p.cashback_amount * cast(b2.merchant_ratio as numeric(10,4)),0)
      end) as ad_spend
      from raw_rds_production.payment p
      left join analytics_production.analytics_payment ap on ap.id = p.id
      left join raw_rds_production.merchant m on m.id = p.merchant_id
      left join raw_rds_production.boost b on b.payment_id = p.id
      left join raw_rds_production.boost_promotion_policy bpp on bpp.id = b.boost_promotion_id
      left join raw_rds_production.boost_budget_usage_history bh on bh.payment_id = p.id
      left join (  select *
  from (select *
  from (select
        b2.name, b2.id,
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
        when b2.name ='에릭 요한슨 사진전' then '0.5'
        when b2.name ='티몬 스키시즌 오픈!' then '0.5'
        when b2.name ='KKday' then '0.7'
        when b2.name ='롭스' then '0.5'
        else '0'
      end as "merchant_ratio"
      from raw_rds_production.brand b2
      )bb
      where bb.merchant_ratio > 0)b2)b2 on b2.id = bpp.brand_id
)a
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: transactions {
    type: count_distinct
    sql: ${id} ;;
  }

  measure: active_user {
    type: count_distinct
    sql: ${user_id} ;;
  }

  measure: boost_transactions {
    type: count_distinct
    sql: ${boost_id} ;;
  }

  measure: total_checkout_amount {
    type: sum
    value_format: "#,##0"
    sql: coalesce(${checkout_amount},0) ;;
  }

  measure: total_canceled_amount {
    type: sum
    value_format: "#,##0"
    sql: coalesce(${canceled_amount},0) ;;
  }

  measure: total_cashback_amount {
    type: sum
    value_format: "#,##0"
    sql: coalesce(${cashback_amount},0) ;;
  }

  measure: total_ad_spend {
    type: sum
    value_format: "#,##0"
    sql: coalesce(${ad_spend},0) ;;
  }

  measure: total_chai_spend {
    type: sum
    value_format: "#,##0"
    sql: coalesce(${chai_spend},0) ;;
  }

  measure: total_boost_tx {
    type: sum
    value_format: "#,##0"
    sql: case when ${TABLE}.boost_id is not null then ${checkout_amount} end ;;
  }

  dimension: id {
    type: string
    primary_key: yes
    sql: ${TABLE}.id ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: checkout_amount {
    type: number
    sql: ${TABLE}.checkout_amount ;;
  }

  dimension: canceled_amount {
    type: number
    sql: ${TABLE}.canceled_amount ;;
  }

  dimension_group: created_at {
    type: time
    sql: ${TABLE}.created_at ;;
  }

  dimension: total_chai_cost {
    type: number
    sql: ${TABLE}.total_chai_cost ;;
  }

  dimension: total_promotion_amount {
    type: number
    sql: ${TABLE}.total_promotion_amount ;;
  }

  dimension: merchant_id {
    type: string
    sql: ${TABLE}.merchant_id ;;
  }

  dimension: idempotency_key {
    type: string
    sql: ${TABLE}.idempotency_key ;;
  }

  dimension: cashback_amount {
    type: number
    sql: ${TABLE}.cashback_amount ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: boost_id {
    type: number
    sql: ${TABLE}.boost_id ;;
  }

  dimension: sub_title {
    type: string
    sql: ${TABLE}.sub_title ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
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
      id,
      status,
      user_id,
      checkout_amount,
      canceled_amount,
      created_at_time,
      total_chai_cost,
      total_promotion_amount,
      merchant_id,
      idempotency_key,
      cashback_amount,
      name,
      boost_id,
      sub_title,
      title,
      ad_spend,
      chai_spend
    ]
  }
}
