view: chai_mission_reward_boost_campaign {
  sql_table_name: chai_card_chai_prod_public.mission_reward_boost_campaign ;;
  drill_fields: [id]


  measure: count {
    type: count
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

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension_group: visible_to {
    type: time
    sql: ${TABLE}.visible_to ;;
  }

  dimension_group: usable_to {
    type: time
    sql: ${TABLE}.usable_to ;;
  }

  dimension_group: buyable_to {
    type: time
    sql: ${TABLE}.buyable_to ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: boost_campaign_id {
    type: number
    sql: ${TABLE}.boost_campaign_id ;;
  }

  dimension: boost_mission_policy_id {
    type: number
    sql: ${TABLE}.boost_mission_policy_id ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }

  dimension: month {
    type: number
    sql: ${TABLE}.month ;;
  }
  }
