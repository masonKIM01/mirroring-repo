view: bolt_card_issued {
  derived_table: {
    sql: select
        xx.type,
        created_at,
        user_id
      from
        (select
          user_id,
          created_at,
          case when bolt_sum = -10 then '재발급(10개소진)'
             when bolt_sum = -25 then '재발급(25개소진)'
             when bolt_sum = -50 then '신규발급'
             end as "type"
        from (select *
      from
        (select
        *, max(created_at)over(partition by user_id)
        from
            (select
              user_id,
              created_at,
              type,
              count,
              sum(count)over(partition by user_id) as bolt_sum
            from chai_card_chai_prod_public.bolt_history
            where
              year = 2022
              and month::numeric >= 7
              and type in ('card_issue_out', 'card_issue_cancel_in')
            group by 1,2,3,4
            order by 1,2 asc)X)x
          where x.created_at = max
          )x
      where x.bolt_sum <> 0
      group by 1,2,3 )xx
      group by 1,2,3
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension_group: created_at {
    type: time
    sql: ${TABLE}.created_at ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  set: detail {
    fields: [type, created_at_time, user_id]
  }
}
