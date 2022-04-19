view: table_redshift_boost_promotion_policy {
  derived_table: {
    sql: select *
      from chai_card_chai_prod_public.boost_promotion_policy bpp
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: number
    primary_key: yes
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

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: sub_title {
    type: string
    sql: ${TABLE}.sub_title ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension_group: visible_from {
    type: time
    sql: ${TABLE}.visible_from ;;
  }

  dimension_group: visible_to {
    type: time
    sql: ${TABLE}.visible_to ;;
  }

  dimension: bolt_price {
    type: number
    sql: ${TABLE}.bolt_price ;;
  }

  dimension: amount_cap {
    type: number
    sql: ${TABLE}.amount_cap ;;
  }

  dimension: count_cap {
    type: number
    sql: ${TABLE}.count_cap ;;
  }

  dimension: target_merchant_ids {
    type: string
    sql: ${TABLE}.target_merchant_ids ;;
  }

  dimension: promotion_id {
    type: string
    sql: ${TABLE}.promotion_id ;;
  }

  dimension_group: usable_from {
    type: time
    sql: ${TABLE}.usable_from ;;
  }

  dimension_group: usable_to {
    type: time
    sql: ${TABLE}.usable_to ;;
  }

  dimension: taglines {
    type: string
    sql: ${TABLE}.taglines ;;
  }

  dimension: brand_id {
    type: number
    sql: ${TABLE}.brand_id ;;
  }

  dimension: important {
    type: string
    sql: ${TABLE}.important ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension_group: buyable_from {
    type: time
    sql: ${TABLE}.buyable_from ;;
  }

  dimension_group: buyable_to {
    type: time
    sql: ${TABLE}.buyable_to ;;
  }

  dimension: promotion_type {
    type: string
    sql: ${TABLE}.promotion_type ;;
  }

  dimension: discount_amount_max {
    type: string
    sql: ${TABLE}.discount_amount_max ;;
  }

  dimension: discount_amount_min {
    type: string
    sql: ${TABLE}.discount_amount_min ;;
  }

  dimension: landing_url {
    type: string
    sql: ${TABLE}.landing_url ;;
  }

  dimension: fallback_url {
    type: string
    sql: ${TABLE}.fallback_url ;;
  }

  dimension: ios_app_id {
    type: string
    sql: ${TABLE}.ios_app_id ;;
  }

  dimension: android_package {
    type: string
    sql: ${TABLE}.android_package ;;
  }

  dimension: count_cap_per_user {
    type: number
    sql: ${TABLE}.count_cap_per_user ;;
  }

  dimension: usable_location_description {
    type: string
    sql: ${TABLE}.usable_location_description ;;
  }

  dimension: life_type {
    type: string
    sql: ${TABLE}.life_type ;;
  }

  dimension: quota {
    type: number
    sql: ${TABLE}.quota ;;
  }

  dimension: benefit_description {
    type: string
    sql: ${TABLE}.benefit_description ;;
  }

  dimension: tutorial_type {
    type: string
    sql: ${TABLE}.tutorial_type ;;
  }

  dimension: boost_target_condition_id {
    type: number
    sql: ${TABLE}.boost_target_condition_id ;;
  }

  dimension: logo_image_url {
    type: string
    sql: ${TABLE}.logo_image_url ;;
  }

  dimension: typo_image_url {
    type: string
    sql: ${TABLE}.typo_image_url ;;
  }

  dimension: on_off_line_status {
    type: string
    sql: ${TABLE}.on_off_line_status ;;
  }

  dimension: grade {
    type: string
    sql: ${TABLE}.grade ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: animation_type {
    type: string
    sql: ${TABLE}.animation_type ;;
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
      title,
      sub_title,
      description,
      status,
      visible_from_time,
      visible_to_time,
      bolt_price,
      amount_cap,
      count_cap,
      target_merchant_ids,
      promotion_id,
      usable_from_time,
      usable_to_time,
      taglines,
      brand_id,
      important,
      type,
      buyable_from_time,
      buyable_to_time,
      promotion_type,
      discount_amount_max,
      discount_amount_min,
      landing_url,
      fallback_url,
      ios_app_id,
      android_package,
      count_cap_per_user,
      usable_location_description,
      life_type,
      quota,
      benefit_description,
      tutorial_type,
      boost_target_condition_id,
      logo_image_url,
      typo_image_url,
      on_off_line_status,
      grade,
      name,
      animation_type,
      year,
      month
    ]
  }
}
