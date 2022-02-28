view: table_boost_campaign_target_type {
  derived_table: {
    sql: select *
      from chai_card_chai_prod_public.boost_campaign_target_type
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

  dimension: boost_campaign_id {
    type: number
    sql: ${TABLE}.boost_campaign_id ;;
  }

  dimension: target_type {
    type: string
    sql: ${TABLE}.target_type ;;
  }

  set: detail {
    fields: [id, boost_campaign_id, target_type]
  }
}
