view: chai_card_chai_prod_public_boost_promotion_policy {
  sql_table_name: chai_card_chai_prod_public.boost_promotion_policy ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: amount_cap {
    type: number
    sql: ${TABLE}.amount_cap ;;
  }

  dimension: android_package {
    type: string
    sql: ${TABLE}.android_package ;;
  }

  dimension: animation_type {
    type: string
    sql: ${TABLE}.animation_type ;;
  }

  dimension: benefit_description {
    type: string
    sql: ${TABLE}.benefit_description ;;
  }

  dimension: bolt_price {
    type: number
    sql: ${TABLE}.bolt_price ;;
  }

  dimension: boost_target_condition_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.boost_target_condition_id ;;
  }

  dimension: brand_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.brand_id ;;
  }

  dimension_group: buyable_from {
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
    sql: ${TABLE}.buyable_from ;;
  }

  dimension_group: buyable_to {
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
    sql: ${TABLE}.buyable_to ;;
  }

  dimension: count_cap {
    type: number
    sql: ${TABLE}.count_cap ;;
  }

  dimension: count_cap_per_user {
    type: number
    sql: ${TABLE}.count_cap_per_user ;;
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

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: discount_amount_max {
    type: string
    sql: ${TABLE}.discount_amount_max ;;
  }

  dimension: discount_amount_min {
    type: string
    sql: ${TABLE}.discount_amount_min ;;
  }

  dimension: fallback_url {
    type: string
    sql: ${TABLE}.fallback_url ;;
  }

  dimension: grade {
    type: string
    sql: ${TABLE}.grade ;;
  }

  dimension: important {
    type: string
    sql: ${TABLE}.important ;;
  }

  dimension: ios_app_id {
    type: string
    sql: ${TABLE}.ios_app_id ;;
  }

  dimension: landing_url {
    type: string
    sql: ${TABLE}.landing_url ;;
  }

  dimension: life_type {
    type: string
    sql: ${TABLE}.life_type ;;
  }

  dimension: logo_image_url {
    type: string
    sql: ${TABLE}.logo_image_url ;;
  }

  dimension: month {
    type: number
    sql: ${TABLE}.month ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: on_off_line_status {
    type: string
    sql: ${TABLE}.on_off_line_status ;;
  }

  dimension: promotion_id {
    type: string
    sql: ${TABLE}.promotion_id ;;
  }

  dimension: promotion_type {
    type: string
    sql: ${TABLE}.promotion_type ;;
  }

  dimension: quota {
    type: number
    sql: ${TABLE}.quota ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: sub_title {
    type: string
    sql: ${TABLE}.sub_title ;;
  }

  dimension: taglines {
    type: string
    sql: ${TABLE}.taglines ;;
  }

  dimension: target_merchant_ids {
    type: string
    sql: ${TABLE}.target_merchant_ids ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: tutorial_type {
    type: string
    sql: ${TABLE}.tutorial_type ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: typo_image_url {
    type: string
    sql: ${TABLE}.typo_image_url ;;
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

  dimension_group: usable_from {
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
    sql: ${TABLE}.usable_from ;;
  }

  dimension: usable_location_description {
    type: string
    sql: ${TABLE}.usable_location_description ;;
  }

  dimension_group: usable_to {
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
    sql: ${TABLE}.usable_to ;;
  }

  dimension_group: visible_from {
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
    sql: ${TABLE}.visible_from ;;
  }

  dimension_group: visible_to {
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
    sql: ${TABLE}.visible_to ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }

  measure: count {
    type: count
  }
}
