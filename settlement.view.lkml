view: settlement {
  derived_table: {
    sql: select
      date(p.created_at) as 결제일시,
      case when m.name like '%카드%' then '카드' else '간편결제' end as 결제수단,
      bpp.sub_title as 부스트명,
      case when sub_title ='네이버페이' or sub_title like ('%어디서나%') or sub_title like '%웰컴%' then '' else bpp.title end as 부스트혜택,
      case when bpp.type = 'standard' then '일반형' else '선착순' end as 부스트종류,
      case when m.name like '%카드%' then '' else p.idempotency_key end as 간편결제승인번호,
      case when m.name like '%카드%' then split_part(split_part(p.data, 'approvalNo":', 2),'"',2) else '' end as 카드승인번호,
      case when p.checkout_amount is not null then 'Y' else '' end as 승인,
      p.checkout_amount as 승인금액,
      case when bpp.sub_title is not null then 'Y' else '' end as 부스트,
      (case when b.payment_id is not null then p.checkout_amount end) as 부스트승인금액,
      case when ad.type = 'ratio' then p.cashback_amount * ad.ratio * 0.01 else ad.unit_price end as 광고단가,
      p.cashback_amount as 캐시백비용,
      case when m.name like '%카드%' then split_part(split_part(p.data, 'cardMerchantName":', 2),'"',2) else m.name end as 가맹점명,
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

  dimension: 결제일시 {
    type: date
    sql: ${TABLE}."결제일시" ;;
  }

  dimension: 결제수단 {
    type: string
    sql: ${TABLE}."결제수단" ;;
  }

  dimension: 부스트명 {
    type: string
    sql: ${TABLE}."부스트명" ;;
  }

  dimension: 부스트혜택 {
    type: string
    sql: ${TABLE}."부스트혜택" ;;
  }

  dimension: 부스트종류 {
    type: string
    sql: ${TABLE}."부스트종류" ;;
  }

  dimension: 간편결제승인번호 {
    type: string
    sql: ${TABLE}."간편결제승인번호" ;;
  }

  dimension: 카드승인번호 {
    type: string
    sql: ${TABLE}."카드승인번호" ;;
  }

  dimension: 승인 {
    type: string
    sql: ${TABLE}."승인" ;;
  }

  dimension: 승인금액 {
    type: number
    sql: ${TABLE}."승인금액" ;;
  }

  dimension: 부스트 {
    type: string
    sql: ${TABLE}."부스트" ;;
  }

  dimension: 부스트승인금액 {
    type: number
    sql: ${TABLE}."부스트승인금액" ;;
  }

  dimension: 광고단가 {
    type: number
    sql: ${TABLE}."광고단가" ;;
  }

  dimension: 캐시백비용 {
    type: number
    sql: ${TABLE}."캐시백비용" ;;
  }

  dimension: 가맹점명 {
    type: string
    sql: ${TABLE}."가맹점명" ;;
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
    fields: [payment_id, 결제일시, 결제수단,  부스트명, 부스트혜택, 부스트종류, 카드승인번호, 간편결제승인번호,
      승인,
      승인금액,
      부스트,
      부스트승인금액,
      광고단가,
      캐시백비용,
      가맹점명,
      merchant_id,
      user_id]
  }
}
