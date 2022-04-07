view: chai_card_chai_prod_public_boost_campaign_target_type {
  sql_table_name: chai_card_chai_prod_public.boost_campaign_target_type ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: boost_campaign_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.boost_campaign_id ;;
  }

  dimension: target_type {
    type: string
    sql: ${TABLE}.target_type ;;
  }

  measure: count {
    type: count
  }
}
