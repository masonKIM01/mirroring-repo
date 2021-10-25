view: user_pg_appls {
  sql_table_name: hmscatalog.importdb.user_pg_appls ;;
  suggestions: no

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: company_name {
    type: string
    sql: ${TABLE}.company_name ;;
  }

  dimension: operator_type {
    type: string
    sql: ${TABLE}.operator_type ;;
  }

  dimension: biz_reg_no {
    type: string
    sql: ${TABLE}.biz_reg_no ;;
  }

  dimension: corp_reg_no {
    type: string
    sql: ${TABLE}.corp_reg_no ;;
  }

  dimension: address {
    type: string
    sql: ${TABLE}.address ;;
  }

  dimension: address_detail {
    type: string
    sql: ${TABLE}.address_detail ;;
  }

  dimension: zipcode {
    type: string
    sql: ${TABLE}.zipcode ;;
  }

  dimension: homepage_url {
    type: string
    sql: ${TABLE}.homepage_url ;;
  }

  dimension: main_product {
    type: string
    sql: ${TABLE}.main_product ;;
  }

  dimension: delivery_info {
    type: string
    sql: ${TABLE}.delivery_info ;;
  }

  dimension: type_of_biz {
    type: string
    sql: ${TABLE}.type_of_biz ;;
  }

  dimension: type_of_services {
    type: string
    sql: ${TABLE}.type_of_services ;;
  }

  dimension: agree_marketing {
    type: yesno
    sql: ${TABLE}.agree_marketing ;;
  }

  dimension: monthly_atv {
    type: number
    sql: ${TABLE}.monthly_atv ;;
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
      user_id,
      company_name,
      operator_type,
      biz_reg_no,
      corp_reg_no,
      address,
      address_detail,
      zipcode,
      homepage_url,
      main_product,
      delivery_info,
      type_of_biz,
      type_of_services,
      agree_marketing,
      monthly_atv,
      created_at_time,
      updated_at_time,
      yearmonth
    ]
  }
}

# view: user_pg_appls {
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
