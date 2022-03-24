view: plcc_payment_type {
  derived_table: {
    sql: select
      *,
      case when (credit is null
      and ewallet is null
      and debit is not null)
      then 'only_debit'
      when (credit is not null
      and ewallet is null
      and debit is null)
      then 'only_credit'
      when (credit is null
      and ewallet is not null
      and debit is null)
      then 'only_ewallet'
      when (credit is not null
      and ewallet is not null
      and debit is null)
      then 'credit+ewallet'
      when (credit is not null
      and ewallet is null
      and debit is not null)
      then 'credit+debit'
      when (credit is null
      and ewallet is not null
      and debit is not null)
      then 'ewallet+debit'
      when (credit is not null
      and ewallet is not null
      and debit is not null)
      then 'credit+ewallet+debit'
      end as "type"
      from
      (select
      c.user_id, p.month,
      count(case when m.name = '차이 체크카드' then p.id end) as "debit_txs",
      count(case when m.name = '차이 신용카드' then p.id end) as "credit_txs",
      count(case when m.name not in ('차이 체크카드','차이 신용카드') then p.id end) as "ewallet_txs",
      count(distinct case when m.name = '차이 체크카드' then p.id end) as "debit_users",
      count(distinct case when m.name = '차이 신용카드' then p.id end) as "credit_users",
      count(distinct case when m.name not in ('차이 체크카드','차이 신용카드') then p.id end) as "ewallet_users",
      sum(case when m.name = '차이 체크카드' then p.checkout_amount end) as "debit",
      sum(case when m.name = '차이 신용카드' then p.checkout_amount end) as "credit",
      sum(case when m.name not in ('차이 체크카드','차이 신용카드') then p.checkout_amount end) as "ewallet",
      sum(case when m.name = '차이 체크카드' then p.cashback_amount+coalesce(x.cashback_delta,0) end) as "debit_cashback",
      sum(case when m.name = '차이 신용카드' then p.cashback_amount+coalesce(x.cashback_delta,0) end) as "credit_cashback",
      sum(case when m.name not in ('차이 체크카드','차이 신용카드') then p.cashback_amount+coalesce(x.cashback_delta,0) end) as "ewallet_cashback"
      from chai_card_chai_prod_public.card c
      left join chai_card_chai_prod_public.payment p on p.user_id = c.user_id
      left join (select distinct year, month, created_at, payment_id, sum(cashback_delta) as cashback_delta
              from
              (select
                *, count(action_type)over(partition by payment_id)
              from chai_card_chai_prod_public.delayed_cashback_history dc
              group by 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16
              )x
              where x.count = 1
              group by 1,2,3,4)x on x.payment_id = p.id
      left join chai_card_chai_prod_public.merchant m on m.id = p.merchant_id
      where c.card_product_id = 7
      and p.year = '2022'
      and p.status = 'confirmed'
      group by 1,2 )x
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

  dimension: month {
    type: number
    sql: ${TABLE}.month ;;
  }

  dimension: debit_txs {
    type: number
    sql: ${TABLE}.debit_txs ;;
  }

  dimension: credit_txs {
    type: number
    sql: ${TABLE}.credit_txs ;;
  }

  dimension: ewallet_txs {
    type: number
    sql: ${TABLE}.ewallet_txs ;;
  }

  dimension: debit_users {
    type: number
    sql: ${TABLE}.debit_users ;;
  }

  dimension: credit_users {
    type: number
    sql: ${TABLE}.credit_users ;;
  }

  dimension: ewallet_users {
    type: number
    sql: ${TABLE}.ewallet_users ;;
  }

  dimension: debit {
    type: number
    sql: ${TABLE}.debit ;;
  }

  dimension: credit {
    type: number
    sql: ${TABLE}.credit ;;
  }

  dimension: ewallet {
    type: number
    sql: ${TABLE}.ewallet ;;
  }

  dimension: debit_cashback {
    type: number
    sql: ${TABLE}.debit_cashback ;;
  }

  dimension: credit_cashback {
    type: number
    sql: ${TABLE}.credit_cashback ;;
  }

  dimension: ewallet_cashback {
    type: number
    sql: ${TABLE}.ewallet_cashback ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  set: detail {
    fields: [
      user_id,
      month,
      debit_txs,
      credit_txs,
      ewallet_txs,
      debit_users,
      credit_users,
      ewallet_users,
      debit,
      credit,
      ewallet,
      debit_cashback,
      credit_cashback,
      ewallet_cashback,
      type
    ]
  }
}
