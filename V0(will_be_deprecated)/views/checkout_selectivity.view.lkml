view: checkout_selectivity {
  derived_table: {
    sql: select
      b.type,
      b.year,
      b.month,
      b.created_at,
      case
      when b.checkout = 0 then '0'
      when b.checkout < 10000 then '10000'
      when b.checkout between 10000 and 29999 then '30000'
      when b.checkout between 30000 and 49999 then '50000'
      when b.checkout between 50000 and 69999 then '70000'
      when b.checkout between 70000 and 99999 then '100000'
      when b.checkout between 100000 and 149999 then '150000'
      when b.checkout between 150000 and 199999 then '200000'
      when b.checkout between 200000 and 249999 then '250000'
      when b.checkout between 250000 and 299999 then '300000'
      when b.checkout between 300000 and 499999 then '500000'
      when b.checkout between 500000 and 699999 then '700000'
      when b.checkout between 700000 and 999999 then '1000000'
      when b.checkout between 1000000 and 1499999 then '1500000'
      when b.checkout between 1500000 and 1999999 then '2000000'
      when b.checkout >= 2000000 then '2000001'
      end as checkout,
      b.id
      from
      (
          select
          p.year,
          p.month,
          p.created_at,
          case when m.name = '차이 체크카드' then 'check-card'
          when m.name = '차이 신용카드' then 'credit-card'
          else 'ewallet'
          end as type,
          p.id,
          p.checkout_amount as checkout
        from chai_card_chai_public.payment p
        inner join chai_card_chai_public.merchant m on m.id = p.merchant_id
        where p.status = 'confirmed'
        group by 1,2,3,4,5,6
      )b
      group by 1,2,3,4,5,6
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: count_id {
    type: count_distinct
    sql: ${TABLE}.id ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }

  dimension: month {
    type: number
    sql: ${TABLE}.month ;;
  }

  dimension_group: created_at {
    type: time
    sql: ${TABLE}.created_at ;;
  }

  dimension: checkout {
    type: string
    sql: ${TABLE}.checkout ;;
  }

  dimension: id {
    type: number
    sql: ${TABLE}.count ;;
  }

  set: detail {
    fields: [
      type,
      year,
      month,
      created_at_time,
      checkout,
      id
    ]
  }
}
