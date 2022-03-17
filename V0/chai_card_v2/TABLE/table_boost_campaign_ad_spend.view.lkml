view: table_boost_campaign_ad_spend {
  derived_table: {
    sql: select *
      from chai_card_chai_prod_public.boost_campaign_ad_spend
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: created_at {
    type: time
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: updated_at {
    type: time
    sql: ${TABLE}.updated_at ;;
  }

  dimension_group: start_at {
    type: time
    sql: ${TABLE}.start_at ;;
  }

  dimension_group: end_at {
    type: time
    sql: ${TABLE}.end_at ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: billing_type {
    type: string
    sql: ${TABLE}.billing_type ;;
  }

  dimension: unit_price {
    type: number
    sql: ${TABLE}.unit_price ;;
  }

  dimension: ratio {
    type: number
    sql: ${TABLE}.ratio ;;
  }

  dimension: data {
    type: string
    sql: ${TABLE}.data ;;
  }

  dimension: boost_campaign_id {
    type: number
    primary_key: yes
    sql: ${TABLE}.boost_campaign_id ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }

  dimension: month {
    type: number
    sql: ${TABLE}.month ;;
  }

  set: detail {
    fields: [
      id,
      created_at_time,
      updated_at_time,
      start_at_time,
      end_at_time,
      type,
      billing_type,
      unit_price,
      ratio,
      data,
      boost_campaign_id,
      year,
      month
    ]
  }
}
