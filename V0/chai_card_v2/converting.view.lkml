view: converting {
  derived_table: {
    sql: select
        user_id,
        on_off_line_status,
        avg(boostpayment)
      from
        (select
          p.user_id
          ,p.id
          ,bpp.on_off_line_status
          ,cast(p.created_at as timestamp(0)) - cast(b.created_at as timestamp(0)) as "boostpayment"
        from chai_card_chai_prod_public.payment p
        inner join chai_card_chai_prod_public.card c on c.user_id = p.user_id
        inner join chai_card_chai_prod_public.boost b on b.payment_id = p.id
        inner join chai_card_chai_prod_public.boost_promotion_policy bpp on bpp.id = b.boost_promotion_id
        where p.year in (2021,2022)
        and p.status = 'confirmed'
        and p.created_at >= '2021-10-01'
        and p.created_at > b.created_at
        )x
      group by 1,2
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

  dimension: on_off_line_status {
    type: string
    sql: ${TABLE}.on_off_line_status ;;
  }

  dimension: avg {
    type: string
    sql: ${TABLE}.avg ;;
  }

  set: detail {
    fields: [user_id, on_off_line_status, avg]
  }
}
