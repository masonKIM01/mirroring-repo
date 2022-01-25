view: settlement_v2 {
  derived_table: {
    sql: select
      date(p.created_at) as date,
      case when m.name like '%카드%' then '카드' else '간편결제' end as type,
      bpp.sub_title as boostName,
      case when sub_title ='네이버페이' or sub_title like ('%어디서나%') or sub_title like '%웰컴%' then '' else bpp.title end as boostScheme,
      case when bpp.type = 'standard' then '일반형' else '선착순' end as boostType,
      case when m.name like '%카드%' then '' else p.idempotency_key end as idempotency_key,
      case when m.name like '%카드%' then split_part(split_part(p.data, 'approvalNo":', 2),'"',2) else '' end as cardApprovalNo,
      case when p.checkout_amount is not null then 'Y' else '' end as confirmedYN,
      p.checkout_amount as TxVolume,
      case when bpp.sub_title is not null then 'Y' else '' end as boostYN,
      (case when b.payment_id is not null then p.checkout_amount end) as boostTxVolume,
      case when ad.type = 'ratio' then p.cashback_amount * ad.ratio * 0.01 else ad.unit_price end as adSpend,
      p.cashback_amount as cashback,
      case when m.name like '%카드%' then split_part(split_part(p.data, 'cardMerchantName":', 2),'"',2) else m.name end as merchantName,
      p.id as payment_id,
      m.id as merchant_id,
      p.user_id
      from chai_card_chai_prod_public.payment p
      inner join chai_card_chai_prod_public.merchant m on m.id = p.merchant_id
      left join chai_card_chai_prod_public.boost b on b.payment_id = p.id
      left join chai_card_chai_prod_public.boost_promotion_policy bpp on b.boost_promotion_id = bpp.id
      left join chai_card_chai_prod_public.brand b2 on b2.id = bpp.brand_id
      left join chai_card_chai_prod_public.boost_campaign_ad_spend ad on ad.boost_campaign_id = b.boost_campaign_id
      where p.year = '2022'
      and p.status = 'confirmed'
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: count_boost {
    type: count_distinct
    sql: ${TABLE}.boostscheme ;;
  }

  measure: sum_checkout_amount {
    type: sum
    sql: ${TABLE}.txvolume ;;
  }

  measure: sum_boostTx {
    type: sum
    sql: ${TABLE}.boosttxvolume ;;
  }

  measure: sum_cashback {
    type: sum
    sql: ${TABLE}.cashback;;
  }

  measure: sum_adspend {
    type: sum
    sql: ${TABLE}.adspend;;
  }

  dimension_group: date {
    type: time
    sql: ${TABLE}.date ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: boostname {
    type: string
    sql: ${TABLE}.boostname ;;
  }

  dimension: boostscheme {
    type: string
    sql: ${TABLE}.boostscheme ;;
  }

  dimension: boosttype {
    type: string
    sql: ${TABLE}.boosttype ;;
  }

  dimension: idempotency_key {
    type: string
    sql: ${TABLE}.idempotency_key ;;
  }

  dimension: cardapprovalno {
    type: string
    sql: ${TABLE}.cardapprovalno ;;
  }

  dimension: confirmedyn {
    type: string
    sql: ${TABLE}.confirmedyn ;;
  }

  dimension: txvolume {
    type: number
    sql: ${TABLE}.txvolume ;;
  }

  dimension: boostyn {
    type: string
    sql: ${TABLE}.boostyn ;;
  }

  dimension: boosttxvolume {
    type: number
    sql: ${TABLE}.boosttxvolume ;;
  }

  dimension: adspend {
    type: number
    sql: ${TABLE}.adspend ;;
  }

  dimension: cashback {
    type: number
    sql: ${TABLE}.cashback ;;
  }

  dimension: merchantname {
    type: string
    sql: ${TABLE}.merchantname ;;
  }

  dimension: payment_id {
    type: string
    sql: ${TABLE}.payment_id ;;
  }

  dimension: merchant_id {
    type: string
    sql: ${TABLE}.merchant_id ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  set: detail {
    fields: [
      date_date,
      type,
      boostname,
      boostscheme,
      boosttype,
      idempotency_key,
      cardapprovalno,
      confirmedyn,
      txvolume,
      boostyn,
      boosttxvolume,
      adspend,
      cashback,
      merchantname,
      payment_id,
      merchant_id,
      user_id
    ]
  }
}
