view: chai_card_offline_stats {
  derived_table: {
    sql: SELECT
        p.year,
        p.month,
        p.created_at,
        user_id,
        p.billing_amount,
        p.charging_amount,
        m.name as merchant_name
      from chai_card_chai_prod_public.payment p
      join chai_card_chai_prod_public.merchant m
        on p.merchant_id = m.id
      where p.merchant_id != '0385e3db-4a50-4035-9285-1ced4a3e0209'
      and p.status = 'confirmed'
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }

  dimension: month {
    type: number
    sql: ${TABLE}.month ;;
  }

  dimension_group: created_at {
    type: time
    sql: ${TABLE}.created_at ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: billing_amount {
    type: number
    sql: ${TABLE}.billing_amount ;;
  }

  dimension: charging_amount {
    type: number
    sql: ${TABLE}.charging_amount ;;
  }
  dimension: merchant_name {
    type: string
    sql: ${TABLE}.merchant_name ;;
  }
  measure: charging_amount_sum {
    type:  sum
    sql: ${TABLE}.charging_amount ;;
  }
  measure: billing_amount_sum {
    type:  sum
    sql: ${TABLE}.billing_amount ;;
  }
  measure: user_distinct_num {
    type:  count_distinct
    sql: ${TABLE}.user_id ;;
  }


  set: detail {
    fields: [
      year,
      month,
      created_at_time,
      user_id,
      billing_amount,
      charging_amount
    ]
  }
}
