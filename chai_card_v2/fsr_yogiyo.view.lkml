view: fsr_yogiyo {
  derived_table: {
    sql: select
      m.id,
      m.name,
      split_part(split_part(p.data, 'businessName":',2),'"',2) as businessName,
      date(p.created_at),
      bpp.sub_title,
      bpp.title,
      p.id as payment_id,
      p.checkout_amount,
      p.cashback_amount -
      (case when ad.type = 'cps' then ad.unit_price
      when ad.type = 'ratio' then ad.ratio * p.cashback_amount
      end) as chai_credit,
      case when ad.type = 'cps' then ad.unit_price
      when ad.type = 'ratio' then ad.ratio * p.cashback_amount
      end as ad_spend,
      p.cashback_amount,
      p.user_id,
      0 as isfirst,
      p.idempotency_key,
      split_part(split_part(p.data, 'approvalNo":',2),'"',2) as approvalNo,
      split_part(split_part(p.data, 'cardMerchantId":',2),'"',2) as cardMerchantId
      from chai_card_chai_prod_public.payment p
      inner join chai_card_chai_prod_public.merchant m on m.id = p.merchant_id
      inner join chai_card_chai_prod_public.boost b on b.payment_id = p.id
      inner join chai_card_chai_prod_public.boost_promotion_policy bpp on bpp.id = b.boost_promotion_id
      inner join chai_card_chai_prod_puplic.brand b2 on b2.id = bpp.brand_id
      inner join chai_card_chai_prod_public.boost_campaign_ad_spend ad on ad.boost_campaign_id = b.boost_campaign_id
      where p.year = '2022'
      and b2.name = '요기요'
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: Tx_vol {
    type: sum
    sql: ${TABLE}.checkout_amount ;;
  }

  measure: cashback {
    type: sum
    sql: ${TABLE}.cashback_amount ;;
  }

  measure: transactions {
    type: count_distinct
    sql: ${TABLE}.payment_id ;;
  }

  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: businessname {
    type: string
    sql: ${TABLE}.businessname ;;
  }

  dimension: date {
    type: date
    sql: ${TABLE}.date ;;
  }

  dimension: sub_title {
    type: string
    sql: ${TABLE}.sub_title ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: payment_id {
    type: string
    sql: ${TABLE}.payment_id ;;
  }

  dimension: checkout_amount {
    type: number
    sql: ${TABLE}.checkout_amount ;;
  }

  dimension: chai_credit {
    type: number
    sql: ${TABLE}.chai_credit ;;
  }

  dimension: ad_spend {
    type: number
    sql: ${TABLE}.ad_spend ;;
  }

  dimension: cashback_amount {
    type: number
    sql: ${TABLE}.cashback_amount ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: isfirst {
    type: number
    sql: ${TABLE}.isfirst ;;
  }

  dimension: idempotency_key {
    type: string
    sql: ${TABLE}.idempotency_key ;;
  }

  dimension: approvalno {
    type: string
    sql: ${TABLE}.approvalno ;;
  }

  dimension: cardmerchantid {
    type: string
    sql: ${TABLE}.cardmerchantid ;;
  }

  set: detail {
    fields: [
      id,
      name,
      businessname,
      date,
      sub_title,
      title,
      payment_id,
      checkout_amount,
      cashback_amount,
      chai_credit,
      ad_spend,
      user_id,
      isfirst,
      idempotency_key,
      approvalno,
      cardmerchantid
    ]
  }
}
