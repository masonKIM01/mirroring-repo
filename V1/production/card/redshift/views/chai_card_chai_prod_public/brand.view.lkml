view: chai_card_chai_prod_public_brand {
  sql_table_name: chai_card_chai_prod_public.brand ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: android_package {
    type: string
    sql: ${TABLE}.android_package ;;
  }

  dimension: color {
    type: string
    sql: ${TABLE}.color ;;
  }

  dimension: fallback_url {
    type: string
    sql: ${TABLE}.fallback_url ;;
  }

  dimension: ios_app_id {
    type: string
    sql: ${TABLE}.ios_app_id ;;
  }

  dimension: landing_url {
    type: string
    sql: ${TABLE}.landing_url ;;
  }

  dimension: logo_image_url {
    type: string
    sql: ${TABLE}.logo_image_url ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: typo_image_url {
    type: string
    sql: ${TABLE}.typo_image_url ;;
  }

  measure: count {
    type: count
  }
}
