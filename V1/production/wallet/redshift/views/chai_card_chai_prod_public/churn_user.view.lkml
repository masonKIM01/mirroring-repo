view: chai_churn_user {
  derived_table: {
    sql: select
            user_id,
            case when sum(distinct method) in (1,11) then 'credit'
            when sum(distinct method) in (2,12) then 'check'
            when sum(distinct method) in (3,13) then 'all'
            when sum(distinct method) = 10 then 'ewallet'
            end as type,
            last_created_at,
            churn_date,
            transactions
          from
            (select
              p.user_id,
              case when m.name = '차이 신용카드' then 1
              when m.name = '차이 체크카드' then 2
              else 10 end as method,
              max(p.created_at) as last_created_at,
              max(p.created_at) + 30 as churn_date,
              count(case when p.created_at between current_date -30 and current_date then p.id end) as transactions
            from chai_card_chai_prod_public.payment p
            inner join chai_card_chai_prod_public.merchant m on m.id = p.merchant_id
            where p.status = 'confirmed'
            group by 1,2
            order by 1)x
        group by 1,3,4,5
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

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension_group: last_created_at {
    type: time
    sql: ${TABLE}.last_created_at ;;
  }

  dimension_group: churn_date {
    type: time
    sql: ${TABLE}.churn_date ;;
  }

  set: detail {
    fields: [user_id, type, last_created_at_time, churn_date_time]
  }
}
