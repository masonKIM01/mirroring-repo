view: plcc_payment_type {
  derived_table: {
    sql: select
        user_id,
        month,
        payment_type,
        txs,
        txv,
        cashback,
        case when count(x.payment_type)over(partition by user_id, month) = 1 then payment_type||'_only'
        when sum(payment_classify)over(partition by user_id, month) = 16 then 'use_all'
        when sum(payment_classify)over(partition by user_id, month) = 15 then 'credit+debit'
        when sum(payment_classify)over(partition by user_id, month) = 6 then 'debit+ewallet'
        when sum(payment_classify)over(partition by user_id, month) = 11 then 'credit+ewallet'
        end as type
       from
        (select
            c.user_id,
            p.month,
            case when m.name ='차이 체크카드' then 'debit_card' when m.name = '차이 신용카드' then 'credit_card' else 'ewallet' end as payment_type,
            case when m.name ='차이 체크카드' then 5 when m.name = '차이 신용카드' then 10 else 1 end as payment_classify,
            count(p.id) as "txs",
            count(distinct p.user_id) as "users",
            sum(p.checkout_amount) as "txv",
            sum(p.cashback_amount+coalesce(x.cashback_delta,0)) as "cashback"
            from chai_card_chai_public.card c
            left join chai_card_chai_public.payment p on p.user_id = c.user_id
            left join (select distinct year, month, created_at, payment_id, sum(cashback_delta) as cashback_delta
                    from
                    (select
                      *, count(action_type)over(partition by payment_id)
                    from chai_card_chai_public.delayed_cashback_history dc
                    group by 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16
                    )x
                    where x.count = 1
                    group by 1,2,3,4)x on x.payment_id = p.id
            left join chai_card_chai_public.merchant m on m.id = p.merchant_id
            where c.card_product_id = 7
            and p.year = '2022'
            and p.status = 'confirmed'
            group by 1,2,3,4
            order by 1,2,3)x
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

  measure: transactions {
    type: sum
    sql: ${TABLE}.txs ;;
  }

  measure: txvol {
    type: sum
    sql: ${TABLE}.txv ;;
  }

  measure: cashback_amount {
    type: sum
    sql: ${TABLE}.cashback ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: month {
    type: number
    sql: ${TABLE}.month ;;
  }

  dimension: payment_type {
    type: string
    sql: ${TABLE}.payment_type ;;
  }

  dimension: txs {
    type: number
    sql: ${TABLE}.txs ;;
  }

  dimension: txv {
    type: number
    sql: ${TABLE}.txv ;;
  }

  dimension: cashback {
    type: number
    sql: ${TABLE}.cashback ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  set: detail {
    fields: [
      user_id,
      month,
      payment_type,
      txs,
      txv,
      cashback,
      type
    ]
  }
}
