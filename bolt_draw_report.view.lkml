view: bolt_draw_report {
  derived_table: {
    sql: select
      bd.bolt_draw_promotion_id,
      bd.created_at,
      bd.user_id
      , c.birthday
      , trunc(2022-c.birthday::numeric,-1) as age_group
      , c.gender
      , bd.bolt_count
      from chai_card_chai_prod_public.bolt_draw bd
      inner join chai_card_chai_prod_public.user c on bd.user_id = c.id
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: sum_bolt_count {
    type: sum
    sql: ${TABLE}.bolt_count ;;
  }

  dimension: bolt_draw_promotion_id {
    type: number
    sql: ${TABLE}.bolt_draw_promotion_id ;;
  }

  dimension_group: created_at {
    type: time
    sql: ${TABLE}.created_at ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: birthday {
    type: string
    sql: ${TABLE}.birthday ;;
  }

  dimension: age_group {
    type: number
    sql: ${TABLE}.age_group ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: bolt_count {
    type: number
    sql: ${TABLE}.bolt_count ;;
  }

  set: detail {
    fields: [
      bolt_draw_promotion_id,
      created_at_time,
      user_id,
      birthday,
      age_group,
      gender,
      bolt_count
    ]
  }
}
