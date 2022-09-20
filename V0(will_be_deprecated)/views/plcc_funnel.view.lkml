view: plcc_funnel {
  derived_table: {
    sql: select
        a.users as apply_user,
        case when a.status = 'confirmed' then a.users end as confirmed_user,
        case when a.status = 'confirmed' then a.payment_user end as payment_user
      from
      (select
            ca.status,
            count(distinct case when ca.status <> 'prepare' then ca.user_id end) as users,
            count(distinct case when p.status = 'confirmed' and m.name ='차이 신용카드' then p.user_id end) as payment_user
            from chai_card_chai_public.korea_spec ks
            left join chai_card_chai_public.card_user cu on cu.ci = ks.ci
            left join chai_card_plcc_public.card_application ca on ca.user_id = cu.id
            left join chai_card_chai_public.payment p on p.user_id = ks.user_id
            left join chai_card_chai_public.merchant m on m.id = p.merchant_id
            group by 1)a
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: early_birds {
    type: sum
    sql: ${TABLE}.early_bird ;;
  }

  measure: apply {
    type: sum
    sql: ${TABLE}.apply_user ;;
  }

  measure: confirmed {
    type: sum
    sql: ${TABLE}.confirmed_user ;;
  }

  measure: payment {
    type: sum
    sql: ${TABLE}.payment_user ;;
  }

  dimension: early_bird {
    type: number
    sql: ${TABLE}.early_bird ;;
  }

  dimension: apply_user {
    type: number
    sql: ${TABLE}.apply_user ;;
  }

  dimension: confirmed_user {
    type: number
    sql: ${TABLE}.confirmed_user ;;
  }

  dimension: payment_user {
    type: number
    sql: ${TABLE}.payment_user ;;
  }

  set: detail {
    fields: [early_bird, apply_user, confirmed_user, payment_user]
  }
}
