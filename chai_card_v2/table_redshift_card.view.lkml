view: table_redshift_card {
  derived_table: {
    sql: select
          *,
          case when c.created_at >= '2021-11-18 16:04:42.514' then 'master card' else 'red card' end as "card_type",
          case when c.is_reissue = 'false' then 'first_issue' else 're_issue' end as "issue_type"
        from chai_card_chai_prod_public.card
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: users {
    type: count_distinct
    sql: ${TABLE}.user_id ;;
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: card_type {
    type: string
    sql: ${TABLE}.card_type ;;
  }

  dimension: issue_type {
    type: string
    sql: ${TABLE}.issue_type ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: card_product_id {
    type: number
    sql: ${TABLE}.card_product_id ;;
  }

  dimension: is_reissue {
    type: string
    sql: ${TABLE}.is_reissue ;;
  }

  dimension_group: created_at {
    type: time
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: updated_at {
    type: time
    sql: ${TABLE}.updated_at ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }

  dimension: month {
    type: number
    sql: ${TABLE}.month ;;
  }

  set: detail {
    fields: [
      id,
      status,
      card_type,
      issue_type,
      user_id,
      card_product_id,
      is_reissue,
      created_at_time,
      updated_at_time,
      year,
      month
    ]
  }
}
