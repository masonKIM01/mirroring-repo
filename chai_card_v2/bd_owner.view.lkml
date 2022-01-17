view: bd_owner {
  derived_table: {
    sql: select
      x.*,
      case when x.type ='CPS' then x.contract * x.boost
      when x.type ='CPA' then 0.2 * x.contract * x.boost
      when x.type = 'ROAS' then x.merchant_ratio::decimal(2,1) * cashback_amount
      end as ad_spend
      from
      (select
      b2.name, ad.owner, ad.type, ad.merchant_ratio, ad.contract, sum(p.cashback_amount) as cashback_amount , count(b.payment_id) as boost
      from chai_card_chai_prod_public.payment p
      inner join chai_card_chai_prod_public.boost b on b.payment_id = p.id
      inner join chai_card_chai_prod_public.boost_promotion_policy bpp on bpp.id = b.boost_promotion_id
      inner join chai_card_chai_prod_public.brand b2 on b2.id = bpp.brand_id
      inner join
      (
        select '2022-01-01' as months, '한섬EQL' as merchant_name, '20,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '10000' as contract, '0' as CPA_done , 'Cloe' as owner union all
        select '2022-01-01' as months, '프립' as merchant_name, '10,000원 캐시백' as title, 'ROAS' as type, '0.5' as merchant_ratio, '10000' as contract, '0' as CPA_done , 'Kevin' as owner union all
        select '2022-01-01' as months, '펫프렌즈' as merchant_name, '50% 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '1500' as contract, '0' as CPA_done , 'Kevin' as owner union all
        select '2022-01-01' as months, '크로켓' as merchant_name, '7,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '7000' as contract, '0' as CPA_done , 'Cloe' as owner union all
        select '2022-01-01' as months, '쿠쿠몰' as merchant_name, '30% 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '10000' as contract, '0' as CPA_done , 'Cloe' as owner union all
        select '2022-01-01' as months, '캐시비' as merchant_name, '50% 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '2000' as contract, '0' as CPA_done , 'Kevin' as owner union all
        select '2022-01-01' as months, '카모아' as merchant_name, '7,000원 캐시백' as title, 'ROAS' as type, '0.5' as merchant_ratio, '0' as contract, '0' as CPA_done , 'Owen' as owner union all
        select '2022-01-01' as months, '카모아' as merchant_name, '7,000원 캐시백' as title, 'ROAS' as type, '0.5' as merchant_ratio, '0' as contract, '0' as CPA_done , 'Owen' as owner union all
        select '2022-01-01' as months, '지니' as merchant_name, '60% 캐시백' as title, 'ROAS' as type, '0.5' as merchant_ratio, '2200' as contract, '0' as CPA_done , 'Kevin' as owner union all
        select '2022-01-01' as months, '주붕샵' as merchant_name, '10,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '5000' as contract, '0' as CPA_done , 'Groot' as owner union all
        select '2022-01-01' as months, '젝시믹스' as merchant_name, '20% 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '2500' as contract, '0' as CPA_done , 'Kevin' as owner union all
        select '2022-01-01' as months, '인테이크' as merchant_name, '2,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '2000' as contract, '0' as CPA_done , 'Kevin' as owner union all
        select '2022-01-01' as months, '인더웨어' as merchant_name, '5,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '5000' as contract, '0' as CPA_done , 'Kevin' as owner union all
        select '2022-01-01' as months, '위메프' as merchant_name, '30% 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '1200' as contract, '0' as CPA_done , 'Cloe' as owner union all
        select '2022-01-01' as months, '위메프' as merchant_name, '3,500원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '1200' as contract, '0' as CPA_done , 'Cloe' as owner union all
        select '2022-01-01' as months, '원데이즈유' as merchant_name, '8,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '6500' as contract, '0' as CPA_done , 'Cloe' as owner union all
        select '2022-01-01' as months, '원데이즈유' as merchant_name, '20,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '14000' as contract, '0' as CPA_done , 'Cloe' as owner union all
        select '2022-01-01' as months, '여기어때' as merchant_name, '7,000원 캐시백' as title, 'CPA' as type, '0' as merchant_ratio, '15000' as contract, '0' as CPA_done , 'Cloe' as owner union all
        select '2022-01-01' as months, '에이블리' as merchant_name, '6,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '3000' as contract, '0' as CPA_done , 'Kevin' as owner union all
        select '2022-01-01' as months, '어바웃펫' as merchant_name, '10,000원 캐시백' as title, 'ROAS' as type, '0.5' as merchant_ratio, '5000' as contract, '0' as CPA_done , 'Kevin' as owner union all
        select '2022-01-01' as months, '아이니유' as merchant_name, '10,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '5000' as contract, '0' as CPA_done , 'Groot' as owner union all
        select '2022-01-01' as months, '아워홈' as merchant_name, '60% 캐시백' as title, 'ROAS' as type, '0.4' as merchant_ratio, '0' as contract, '0' as CPA_done , 'Cloe' as owner union all
        select '2022-01-01' as months, '아워홈' as merchant_name, '6,000원 캐시백' as title, 'ROAS' as type, '0.4' as merchant_ratio, '0' as contract, '0' as CPA_done , 'Cloe' as owner union all
        select '2022-01-01' as months, '아몬즈' as merchant_name, '8,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '7000' as contract, '0' as CPA_done , 'Cloe' as owner union all
        select '2022-01-01' as months, '아몬즈' as merchant_name, '12,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '7000' as contract, '0' as CPA_done , 'Cloe' as owner union all
        select '2022-01-01' as months, '설로인' as merchant_name, '20,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '10000' as contract, '0' as CPA_done , 'Cloe' as owner union all
        select '2022-01-01' as months, '설로인' as merchant_name, '15,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '10000' as contract, '0' as CPA_done , 'Cloe' as owner union all
        select '2022-01-01' as months, '브랜드닭' as merchant_name, '12,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '5000' as contract, '0' as CPA_done , 'Kevin' as owner union all
        select '2022-01-01' as months, '브랜드닭' as merchant_name, '10,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '5000' as contract, '0' as CPA_done , 'Kevin' as owner union all
        select '2022-01-01' as months, '바잇미' as merchant_name, '7,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '7000' as contract, '0' as CPA_done , 'Cloe' as owner union all
        select '2022-01-01' as months, '뮬라웨어' as merchant_name, '20% 캐시백' as title, 'ROAS' as type, '1' as merchant_ratio, '0' as contract, '0' as CPA_done , 'Cloe' as owner union all
        select '2022-01-01' as months, '디코드' as merchant_name, '5,000원 캐시백' as title, 'ROAS' as type, '0.3' as merchant_ratio, '0' as contract, '0' as CPA_done , 'Kevin' as owner union all
        select '2022-01-01' as months, '그린카' as merchant_name, '80% 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '4000' as contract, '0' as CPA_done , 'Kevin' as owner union all
        select '2022-01-01' as months, 'W컨셉' as merchant_name, '5,000원 캐시백' as title, '' as type, '0' as merchant_ratio, '0' as contract, '0' as CPA_done , 'Gatsby' as owner union all
        select '2022-01-01' as months, '텐바이텐' as merchant_name, '6,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '3000' as contract, '0' as CPA_done, 'Kevin' as owner union all
        select '2022-01-01' as months, '이삭토스트' as merchant_name, '30% 캐시백' as title, 'ROAS' as type, '0.5' as merchant_ratio, '0' as contract, '0' as CPA_done, 'Cloe' as owner union all
        select '2022-01-01' as months, '카카오헤어샵' as merchant_name, '6,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '3000' as contract, '0' as CPA_done , 'MJ' as owner union all
        select '2022-01-01' as months, '카카오헤어샵' as merchant_name, '8,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '3000' as contract, '0' as CPA_done, 'MJ' as owner union all
        select '2022-01-01' as months, '쏘카' as merchant_name, '70% 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '3500' as contract, '0' as CPA_done, 'Kevin' as owner union all
        select '2022-01-01' as months, '윙잇' as merchant_name, '10,000원 캐시백' as title, 'CPA' as type, '0' as merchant_ratio, '10000' as contract, '0' as CPA_done, 'Kevin' as owner union all
        select '2022-01-01' as months, '데일리샷' as merchant_name, '10,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '5000' as contract, '0' as CPA_done, 'Groot' as owner union all
        select '2022-01-01' as months, '마미' as merchant_name, '10,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '5000' as contract, '0' as CPA_done, 'Cloe' as owner union all
        select '2022-01-01' as months, '티몬' as merchant_name, '10% 캐시백' as title, 'ROAS' as type, '0.5' as merchant_ratio, '0' as contract, '0' as CPA_done, 'Groot' as owner
      )ad on ad.merchant_name = b2.name and to_char(p.created_at, 'yyyy-mm-01') = ad.months and ad.title = bpp.title
      where p.year = '2022'
      and p.status = 'confirmed'
      group by 1,2,3,4,5
      order by 1,2,3)X
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: total_ad_spend {
    type: sum
    sql: ${TABLE}.ad_spend ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: owner {
    type: string
    sql: ${TABLE}.owner ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: merchant_ratio {
    type: string
    sql: ${TABLE}.merchant_ratio ;;
  }

  dimension: contract {
    type: string
    sql: ${TABLE}.contract ;;
  }

  dimension: cashback_amount {
    type: number
    sql: ${TABLE}.cashback_amount ;;
  }

  dimension: boost {
    type: number
    sql: ${TABLE}.boost ;;
  }

  dimension: ad_spend {
    type: number
    sql: ${TABLE}.ad_spend ;;
  }

  set: detail {
    fields: [
      name,
      owner,
      type,
      merchant_ratio,
      contract,
      cashback_amount,
      boost,
      ad_spend
    ]
  }
}
