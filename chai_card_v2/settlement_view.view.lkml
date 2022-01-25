view: settlement_view {
  derived_table: {
    sql: select
      event_type,
      event_time,
      b2.name,
      count(distinct am.amplitude_id)
      from amplitude_amplitude.raw_events am
      left join chai_card_chai_prod_public.boost_promotion_policy bpp
      on bpp.sub_title = split_part(split_part(am.event_properties, 'boost_brand_name":',2),'"',2)
      left join chai_card_chai_prod_public.brand b2 on b2.id = bpp.brand_id
      group by 1,2,3
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: count_item {
    type: count_distinct
    sql: case when ${TABLE}.event_type = 'view_boost_item' then ${TABLE}.count end ;;
  }

  measure: count_detail {
    type: count_distinct
    sql: case when ${TABLE}.event_type = 'view_boost_detail' then ${TABLE}.count end ;;
  }

  dimension: event_type {
    type: string
    sql: ${TABLE}.event_type ;;
  }

  dimension_group: event_time {
    type: time
    sql: ${TABLE}.event_time ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: count_ {
    type: number
    sql: ${TABLE}.count ;;
  }

  set: detail {
    fields: [event_type, event_time_date, name, count_]
  }
}
