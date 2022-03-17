view: user_pg_appl_details {
  sql_table_name: hmscatalog.importdb.user_pg_appl_details ;;
  suggestions: no

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: user_pg_appl_id {
    type: number
    sql: ${TABLE}.user_pg_appl_id ;;
  }

  dimension: pg_provider {
    type: string
    sql: ${TABLE}.pg_provider ;;
  }

  dimension: main_product {
    type: string
    sql: ${TABLE}.main_product ;;
  }

  dimension: delivery_info {
    type: string
    sql: ${TABLE}.delivery_info ;;
  }

  dimension: pay_method_list {
    type: string
    sql: ${TABLE}.pay_method_list ;;
  }

  dimension: pg_account {
    type: string
    sql: ${TABLE}.pg_account ;;
  }

  dimension: payment_type {
    type: number
    sql: ${TABLE}.payment_type ;;
  }

  dimension: is_direct {
    type: yesno
    sql: ${TABLE}.is_direct ;;
  }

  dimension: how_to_made {
    type: string
    sql: ${TABLE}.how_to_made ;;
  }

  dimension: homepage_name {
    type: string
    sql: ${TABLE}.homepage_name ;;
  }

  dimension_group: created_at {
    type: time
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: updated_at {
    type: time
    sql: ${TABLE}.updated_at ;;
  }

  dimension: yearmonth {
    type: string
    sql: ${TABLE}.yearmonth ;;
  }

  set: detail {
    fields: [
      id,
      user_pg_appl_id,
      pg_provider,
      main_product,
      delivery_info,
      pay_method_list,
      pg_account,
      payment_type,
      is_direct,
      how_to_made,
      homepage_name,
      created_at_time,
      updated_at_time,
      yearmonth
    ]
  }
}

# view: user_pg_appl_details {
#   # Or, you could make this view a derived table, like this:
#   derived_table: {
#     sql: SELECT
#         user_id as user_id
#         , COUNT(*) as lifetime_orders
#         , MAX(orders.created_at) as most_recent_purchase_at
#       FROM orders
#       GROUP BY user_id
#       ;;
#   }
#
#   # Define your dimensions and measures here, like this:
#   dimension: user_id {
#     description: "Unique ID for each user that has ordered"
#     type: number
#     sql: ${TABLE}.user_id ;;
#   }
#
#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
# }
