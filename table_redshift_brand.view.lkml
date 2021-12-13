view: table_redshift_brand {
  derived_table: {
    sql: select
      *
      from chai_card_chai_prod_public.brand
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

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: logo_image_url {
    type: string
    sql: ${TABLE}.logo_image_url ;;
  }

  dimension: typo_image_url {
    type: string
    sql: ${TABLE}.typo_image_url ;;
  }

  dimension: color {
    type: string
    sql: ${TABLE}.color ;;
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

  set: detail {
    fields: [
      id,
      name,
      logo_image_url,
      typo_image_url,
      color,
      landing_url,
      fallback_url,
      ios_app_id,
      android_package
    ]
  }
}
