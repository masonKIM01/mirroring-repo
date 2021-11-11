view: budget_used {
  derived_table: {
    sql:       select
      a.*,
      case when a.brand_name in ('현대백화점투홈') then '5000'
      when a.brand_name in ('설로인') then '5000'
      else cast(a.merchant_ratio as numeric(10,4)) * a.ad_spend_used
      end as "New_ad_spend_used"
      from
      (select
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
        end as "merchant_ratio",
        bbuh.ad_spend ad_spend_used,
        bbuh.boost_budget_id boost_budget_id,
        bbuh.boost_campaign_id boost_campaign_id,
        bbuh.chai_credit chai_credit_used,
        bbuh.created_at history_created_at,
        bbuh.id history_id,
        bbuh.payment_id payment_id,
        bbuh.updated_at history_updated_at,
        bb.created_at budget_created_at,
        bb.updated_at budget_updated_at,
        bb.title budget_title,
        bb.description budget_description,
        bb.ad_spend ad_spend_budget,
        bb.chai_credit chai_credit_budget,
        bb.daily_cap budget_daily_cap,
        bb.status budget_status,
        b2.name brand_name
from raw_rds_production.boost_budget_usage_history bbuh
inner join raw_rds_production.boost_budget bb on bbuh.boost_budget_id = bb.id
inner join raw_rds_production.brand b2 on bb.brand_id = b2.id
where bbuh.ad_spend > 0
)a
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: ad_spend_used {
    type: number
    sql: ${TABLE}.new_ad_spend_used ;;
  }

  dimension: boost_budget_id {
    type: number
    sql: ${TABLE}.boost_budget_id ;;
  }

  dimension: boost_campaign_id {
    type: number
    sql: ${TABLE}.boost_campaign_id ;;
  }

  dimension: chai_credit_used {
    type: number
    sql: ${TABLE}.chai_credit_used ;;
  }

  dimension_group: history_created_at {
    type: time
    sql: ${TABLE}.history_created_at ;;
  }

  dimension: history_id {
    type: number
    sql: ${TABLE}.history_id ;;
  }

  dimension: payment_id {
    type: string
    sql: ${TABLE}.payment_id ;;
  }

  dimension_group: history_updated_at {
    type: time
    sql: ${TABLE}.history_updated_at ;;
  }

  dimension_group: budget_created_at {
    type: time
    sql: ${TABLE}.budget_created_at ;;
  }

  dimension_group: budget_updated_at {
    type: time
    sql: ${TABLE}.budget_updated_at ;;
  }

  dimension: budget_title {
    type: string
    sql: ${TABLE}.budget_title ;;
  }

  dimension: budget_description {
    type: string
    sql: ${TABLE}.budget_description ;;
  }

  dimension: ad_spend_budget {
    type: number
    sql: ${TABLE}.ad_spend_budget ;;
  }

  dimension: chai_credit_budget {
    type: number
    sql: ${TABLE}.chai_credit_budget ;;
  }

  dimension: budget_daily_cap {
    type: number
    sql: ${TABLE}.budget_daily_cap ;;
  }

  dimension: budget_status {
    type: string
    sql: ${TABLE}.budget_status ;;
  }

  dimension: brand_name {
    type: string
    sql: ${TABLE}.brand_name ;;
  }
  measure: count_payment {
    type: count_distinct
    value_format: "0"
    sql: ${payment_id} ;;
  }
  measure: chai_credit_used_sum {
    type: sum
    value_format: "0"
    sql: COALESCE(${chai_credit_used},0) ;;
  }
  measure: ad_spend_used_sum {
    type: sum
    value_format: "0"
    sql: COALESCE(${ad_spend_used},0) ;;
  }
  measure: chai_credit_budget_sum {
    type: sum
    value_format: "0"
    sql: COALESCE(${chai_credit_budget},0) ;;
  }
  measure: ad_spend_budget_sum {
    type: sum
    value_format: "0"
    sql: COALESCE(${ad_spend_budget},0) ;;
  }
  measure: daily_cap_budget_sum {
    type: sum
    value_format: "0"
    sql: COALESCE(${budget_daily_cap},0) ;;
  }

  set: detail {
    fields: [
      ad_spend_used,
      boost_budget_id,
      boost_campaign_id,
      chai_credit_used,
      history_created_at_time,
      history_id,
      payment_id,
      history_updated_at_time,
      budget_created_at_time,
      budget_updated_at_time,
      budget_title,
      budget_description,
      ad_spend_budget,
      chai_credit_budget,
      budget_daily_cap,
      budget_status,
      brand_name
    ]
  }
}
