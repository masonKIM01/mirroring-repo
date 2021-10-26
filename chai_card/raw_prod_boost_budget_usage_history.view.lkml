view: raw_prod_boost_budget_usage_history {
  sql_table_name: raw_rds_production.boost_budget_usage_history ;;
  drill_fields: [id]

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: payment_id {
    type: string
    sql: ${TABLE}.payment_id ;;
  }

  dimension_group: created_at {
    type: time
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: updated_at {
    type: time
    sql: ${TABLE}.updated_at ;;
  }

  dimension: ad_spend {
    type: number
    sql: ${TABLE}.ad_spend ;;
  }

  dimension: chai_credit {
    type: number
    sql: ${TABLE}.chai_credit ;;
  }

  dimension: boost_budget_id {
    type: number
    sql: ${TABLE}.boost_budget_id ;;
  }

  dimension: boost_campaign_id {
    type: number
    sql: ${TABLE}.boost_campaign_id ;;
  }

  set: detail {
    fields: [
      id,
      payment_id,
      created_at_time,
      updated_at_time,
      ad_spend,
      chai_credit,
      boost_budget_id,
      boost_campaign_id
    ]
  }
}
