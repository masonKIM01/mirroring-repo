view: ad_spend_months {
  derived_table: {
    sql: select
      *, b.cashback_amount-b."new_ad_spend" as "new_chai_credit"
      from (
      select
      a.*, cast(a.merchant_ratio as numeric(10,4)),
      cast(a.merchant_ratio as numeric(10,4)) * a.cashback_amount
      end as "New_ad_spend"
      from
      (
      select
  date(p.created_at),
  case when p.data like '%cardMerchantName%'
    then split_part(
      split_part(p.data, 'cardMerchantName":', 2),
      '"',2)
    else m.name
  end as merchant_name,
  case when p.data like '%cardMerchantId%'
    then split_part(
      split_part(p.data, 'cardMerchantId":', 2),
      '"',2)
    else 'null'
  end as merchant_no,
  case when m.name = '차이카드' then '카드' else '간편결제' end as "type",
  bpp.sub_title, bpp.title, p.id, p.idempotency_key,
  b.id as boost_id,
    case when (m.name not in ('차이카드','CU') or
 split_part(split_part(p.data, 'businessCode":', 2),'"',2) in ('4076','4077','4078'))
    then '온라인'
    else '오프라인'
 end as business_code,
   case when p.data like '%approvalNo%'
    then split_part(
      split_part(p.data, 'approvalNo":', 2),
      '"',
      2
    )
    else Null
  end as card_approval_no,
      p.checkout_amount,
      case when bpp.sub_title is null then 0 else p.checkout_amount end as boost_tx,
      p.cashback_amount,
      case when
        when b2.name ='뮬라웨어' then '1'
        when b2.name ='인더웨어' then '1'
        when b2.name ='인테이크' then '1'
        when b2.name ='아몬즈' then '1'
        when b2.name ='크로켓' then '1'
        when b2.name ='바잇미' then '0.7'
        when b2.name ='얌테이블' then '0.7'
        when b2.name ='디코드' then '0.7'
        when b2.name ='술담화' then '0.7'
        when b2.name ='다노샵' then '0.7'
        when b2.name ='위메프오' then '0.6'
        when b2.name ='아워홈' then '0.6'
        when b2.name ='그린카' then '0.5'
        when b2.name ='젝시믹스' then '0.5'
        when b2.name ='펫프렌즈' then '0.5'
        when b2.name ='어바웃펫' then '0.5'
        when b2.name ='쿠쿠몰' then '0.5'
        when b2.name ='아모레몰' then '0.5'
        when b2.name ='에이블리' then '0.5'
        when b2.name ='해피머니' then '0.5'
        when b2.name ='프립' then '0.5'
        when b2.name ='카모아' then '0.5'
        when b2.name ='무신사' then '0.3'
        when b2.name ='에릭 요한슨 사진전' then '0.5'
        when b2.name ='티몬 스키시즌 오픈!' then '0.5'
        when b2.name ='KKday' then '0.7'
        when b2.name ='롭스' then '0.5'
        when b2.name ='SK스토아' then '0.5'
        when b2.name like ('%에릭요한슨%') then '0.5'
      end as "merchant_ratio",
      bh.ad_spend,
      bh.chai_credit as chai_spend
      from raw_rds_production.payment p
      left join raw_rds_production.boost_budget_usage_history bh on bh.payment_id = p.id
      left join raw_rds_production.merchant m on p.merchant_id = m.id
      left join raw_rds_production.boost b on b.payment_id = p.id
      left join raw_rds_production.boost_promotion_policy bpp on bpp.id = b.boost_promotion_id
      left join raw_rds_production.brand b2 on b2.id = bpp.brand_id
      where p.status = 'confirmed')a )b
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: total_checkout_amount {
    type: sum
    sql: ${checkout_amount}  ;;
  }

  measure: total_boost_tx {
    type: sum
    sql: ${boost_tx}  ;;
  }

  measure: total_ad_spend {
    type: sum
    sql: ${TABLE}."new_ad_spend" ;;
  }

  measure: total_chai_credit {
    type: sum
    sql: ${TABLE}."new_chai_credit" ;;
  }

  measure: total_cashback {
    type: sum
    sql: ${cashback_amount}  ;;
  }

  measure: tx_count {
    type: count_distinct
    sql: ${id}  ;;
  }

  measure: boost_count {
    type: count_distinct
    sql: ${boost_id} ;;
  }

  dimension_group: date {
    type: time
    sql: ${TABLE}.date ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: merchant_name {
    type: string
    sql: ${TABLE}.merchant_name ;;
  }

  dimension: merchant_no {
    type: string
    sql: ${TABLE}.merchant_no ;;
  }

  dimension: sub_title {
    type: string
    sql: ${TABLE}.sub_title ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: boost_id {
    type: string
    sql: ${TABLE}.boost_id ;;
  }

  dimension: idempotency_key {
    type: string
    sql: ${TABLE}.idempotency_key ;;
  }

  dimension: card_approval_no {
    type: string
    sql: ${TABLE}.card_approval_no ;;
  }

  dimension: business_code{
    type: string
    sql: ${TABLE}.business_code ;;
  }

  dimension: checkout_amount {
    type: number
    sql: ${TABLE}.checkout_amount ;;
  }

  dimension: boost_tx {
    type: number
    sql: ${TABLE}.boost_tx ;;
  }

  dimension: cashback_amount {
    type: number
    sql: ${TABLE}.cashback_amount ;;
  }

  dimension: ad_spend {
    type: number
    sql: ${TABLE}.ad_spend ;;
  }

  dimension: chai_spend {
    type: number
    sql: ${TABLE}.chai_spend ;;
  }

  set: detail {
    fields: [
      date_time,
      type,
      merchant_name,
      merchant_no,
      id,
      boost_id,
      sub_title,
      title,
      idempotency_key,
      card_approval_no,
      business_code,
      checkout_amount,
      boost_tx,
      cashback_amount,
      ad_spend,
      chai_spend
    ]
  }
}
