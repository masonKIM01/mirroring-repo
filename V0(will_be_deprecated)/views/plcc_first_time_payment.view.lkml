view: plcc_first_time_payment {
  derived_table: {
    sql:
      select distinct
      p.user_id, min(p.created_at)over(partition by p.user_id)
      from chai_card_chai_public.payment p
      inner join chai_card_chai_public.merchant m on p.merchant_id = m.id
      inner join chai_card_chai_public.korea_spec ks on ks.user_id = p.user_id
      inner join chai_card_chai_public.card_user cu on cu.ci = ks.ci
      inner join chai_card_chai_public.card_application ca on ca.user_id = cu.id
      and ca.status = 'confirmed'
      where p.status = 'confirmed'
      and m.name = '차이 신용카드'
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension_group: min {
    type: time
    sql: ${TABLE}.min ;;
  }

  set: detail {
    fields: [user_id, min_time]
  }
}
