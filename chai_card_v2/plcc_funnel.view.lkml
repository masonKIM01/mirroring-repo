view: plcc_funnel {
  derived_table: {
    sql: select
        a.users as apply_user,
        case when a.status = 'confirmed' then a.users as confirmed_user,
        case when a.status = 'confirmed' then a.payment_user as payment_user
      from
      (select
            ca.status, count(distinct ca.user_id) as users, count(distinct case when p.status = 'confirmed' and m.name ='차이 신용카드' then p.user_id end) as payment_user
            from chai_card_chai_prod_public.korea_spec ks
            inner join chai_card_chai_prod_public.card_user cu on cu.ci = ks.ci
            inner join chai_card_plcc_public.card_application ca on ca.user_id = cu.id
            left join chai_card_chai_prod_public.payment p on p.user_id = ks.user_id
            left join chai_card_chai_prod_public.merchant m on m.id = p.merchant_id
            where ca.status <> 'prepare'
            group by 1)a
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: apply_users {
    type: sum
    sql: ${TABLE}.apply_user ;;
  }

  measure: confirmed_users {
    type: sum
    sql: (${TABLE}.confirmed_user ;;
  }

  measure: payment_users {
    type: sum
    sql: (${TABLE}.payment_user ;;
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
    fields: [apply_user, confirmed_user, payment_user]
  }
}
