view: cashback_map_vol {
  derived_table: {
    sql: select
      case when cashback < 10000 then round(cashback, -3)
      when cashback between 10000 and 99999 then round(cashback,-4)
      when cashback between 100000 and 999999 then round(cashback, -5)
      when cashback between 1000000 and 9999999 then round(cashback, -6)
      when cashback >= 10000000 then round(cashback, -7)
      end as cashback,
      case when checkout < 10 then checkout
      when checkout between 10 and 99 then round(checkout,-1)
      when checkout between 100 and 999 then round(checkout, -2)
      else round(checkout, -3)
      end as checkout,
      user_id
      from
      (select
      p.user_id, sum(p.cashback_amount) as cashback, count(p.id) as checkout
      from chai_card_chai_prod_public.payment p
      where p.status = 'confirmed'
      and p.year in (2022)
      and p.month = '2'
      and p.created_at between '2022-02-01' and '2022-02-28 23:59:59.999'
      group by 1 )x
      order by 1,2
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

  dimension: cashback {
    type: number
    sql: ${TABLE}.cashback ;;
  }

  dimension: checkout {
    type: number
    sql: ${TABLE}.checkout ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  set: detail {
    fields: [cashback, checkout, user_id]
  }
}
