view: boost_budget_joined_table {
  derived_table: {
    sql: select
        bbuh.ad_spend bbuh_ad_spend,
        bbuh.boost_budget_id bbuh_boost_budget_id,
        bbuh.boost_campaign_id bbuh_boost_campaign_id,
        bbuh.chai_credit bbuh_chai_credit,
        bbuh.created_at bbuh_created_at,
        bbuh.id bbuh_id,
        bbuh.payment_id bbuh_payment_id,
        bbuh.updated_at bbuh_updated_at,
        bb.id bb_id,
        bb.brand_id bb_brand_id,
        bb.created_at bb_created_at,
        bb.updated_at bb_updated_at,
        bb.title bb_title,
        bb.description bb_description,
        bb.ad_spend bb_ad_spend,
        bb.chai_credit bb_chai_credit,
        bb.daily_cap bb_daily_cap,
        bb.status bb_status,
        b.name b_name
      from raw_rds_production.boost_budget_usage_history bbuh
      join raw_rds_production.boost_budget bb
        on bbuh.boost_budget_id = bb.id
      join raw_rds_production.brand b
        on bb.brand_id = b.id
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: bbuh_ad_spend {
    type: number
    sql: ${TABLE}.bbuh_ad_spend ;;
  }

  dimension: bbuh_boost_budget_id {
    type: number
    sql: ${TABLE}.bbuh_boost_budget_id ;;
  }

  dimension: bbuh_boost_campaign_id {
    type: number
    sql: ${TABLE}.bbuh_boost_campaign_id ;;
  }

  dimension: bbuh_chai_credit {
    type: number
    sql: ${TABLE}.bbuh_chai_credit ;;
  }

  dimension_group: bbuh_created_at {
    type: time
    sql: ${TABLE}.bbuh_created_at ;;
  }

  dimension: bbuh_id {
    type: number
    sql: ${TABLE}.bbuh_id ;;
  }

  dimension: bbuh_payment_id {
    type: string
    sql: ${TABLE}.bbuh_payment_id ;;
  }

  dimension_group: bbuh_updated_at {
    type: time
    sql: ${TABLE}.bbuh_updated_at ;;
  }

  dimension: bb_id {
    type: number
    sql: ${TABLE}.bb_id ;;
  }

  dimension: bb_brand_id {
    type: number
    sql: ${TABLE}.bb_brand_id ;;
  }

  dimension_group: bb_created_at {
    type: time
    sql: ${TABLE}.bb_created_at ;;
  }

  dimension_group: bb_updated_at {
    type: time
    sql: ${TABLE}.bb_updated_at ;;
  }

  dimension: bb_title {
    type: string
    sql: ${TABLE}.bb_title ;;
  }

  dimension: bb_description {
    type: string
    sql: ${TABLE}.bb_description ;;
  }

  dimension: bb_ad_spend {
    type: number
    sql: ${TABLE}.bb_ad_spend ;;
  }

  dimension: bb_chai_credit {
    type: number
    sql: ${TABLE}.bb_chai_credit ;;
  }

  dimension: bb_daily_cap {
    type: number
    sql: ${TABLE}.bb_daily_cap ;;
  }

  dimension: bb_status {
    type: string
    sql: ${TABLE}.bb_status ;;
  }

  dimension: b_name {
    type: string
    sql: ${TABLE}.b_name ;;
  }

  set: detail {
    fields: [
      bbuh_ad_spend,
      bbuh_boost_budget_id,
      bbuh_boost_campaign_id,
      bbuh_chai_credit,
      bbuh_created_at_time,
      bbuh_id,
      bbuh_payment_id,
      bbuh_updated_at_time,
      bb_id,
      bb_brand_id,
      bb_created_at_time,
      bb_updated_at_time,
      bb_title,
      bb_description,
      bb_ad_spend,
      bb_chai_credit,
      bb_daily_cap,
      bb_status,
      b_name
    ]
  }
}
