view: customer_cumulative {
  derived_table: {
    sql: select
        a.created_month
        , a.count
        , sum(a.count)over(order by a.created_month rows between unbounded preceding and current row ) as  cumulative
      from
          (select
            to_char(u.created_at,'yyyy-mm') as created_month
            ,count(distinct u.id)
          from chai_card_chai_prod_public.user u
          where u.status = 'active'
          group by 1
          )a
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: created_at{
    type: string
    sql: ${TABLE}.created_month  ;;
  }

  dimension: users {
    type: number
    sql: ${TABLE}.count  ;;
  }

  dimension: cumulative {
    type: number
    sql: ${TABLE}.cumulative ;;
  }

  set: detail {
    fields: [
      created_at,
      users,
      cumulative
    ]
  }
}
