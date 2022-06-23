view: chai_boost_campaign_ad_spend {
  sql_table_name: chai_card_chai_public.boost_campaign_ad_spend ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: billing_type {
    type: string
    sql: ${TABLE}.billing_type ;;
  }

  dimension: boost_campaign_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.boost_campaign_id ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: data {
    type: string
    sql: ${TABLE}.data ;;
  }

  dimension_group: end {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.end_at ;;
  }

  dimension: month {
    type: number
    sql: ${TABLE}.month ;;
  }

  dimension: ratio {
    type: number
    sql: ${TABLE}.ratio ;;
  }

  dimension_group: start {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.start_at ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: unit_price {
    type: number
    sql: ${TABLE}.unit_price ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.updated_at ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }

  measure: count {
    type: count
    drill_fields: [id, boost_campaign.id]
  }
}
