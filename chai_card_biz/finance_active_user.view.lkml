view: finance_active_user {
  derived_table: {
    sql: select
      p.created_at,
      case when m.name = '차이카드' then 'card'
      when m.name = 'CU' then 'barcode'
      else 'pay' end as type,
      p.user_id
      from raw_rds_production.payment p
      left join raw_rds_production.merchant m on m.id = p.merchant_id
      where p.status = 'confirmed'
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: active_users {
    type: count_distinct
    sql: ${TABLE}.user_id ;;
  }

  dimension_group: created_at {
    type: time
    sql: ${TABLE}.created_at ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  set: detail {
    fields: [created_at_time, type, user_id]
  }
}
