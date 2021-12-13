view: table_adspend_dec {
  derived_table: {
    sql: select '2021-12-01' as month, '이니스프리' as merchant, 'ROAS' as type, '0.4'* 1.0 as merchant_ratio, '0' as CPX_contract union all
      select '2021-12-01' as month, '위메프' as merchant, 'CPS' as type, '0'* 1.0 as merchant_ratio, '1500' as CPX_contract union all
      select '2021-12-01' as month, '인테이크' as merchant, 'ROAS' as type, '1'* 1.0 as merchant_ratio, '0' as CPX_contract union all
      select '2021-12-01' as month, '캐시비' as merchant, 'CPS' as type, '0'* 1.0 as merchant_ratio, '2000' as CPX_contract union all
      select '2021-12-01' as month, '무신사' as merchant, 'CPS' as type, '0'* 1.0 as merchant_ratio, '2400' as CPX_contract union all
      select '2021-12-01' as month, '젝시믹스' as merchant, 'ROAS' as type, '0'* 1.0 as merchant_ratio, '2500' as CPX_contract union all
      select '2021-12-01' as month, '해피머니' as merchant, 'CPS' as type, '0'* 1.0 as merchant_ratio, '2500' as CPX_contract union all
      select '2021-12-01' as month, '에이블리' as merchant, 'CPS' as type, '0'* 1.0 as merchant_ratio, '3000' as CPX_contract union all
      select '2021-12-01' as month, '텐바이텐' as merchant, 'CPS' as type, '0'* 1.0 as merchant_ratio, '3000' as CPX_contract union all
      select '2021-12-01' as month, 'aj전시몰' as merchant, 'CPS' as type, '0'* 1.0 as merchant_ratio, '5000' as CPX_contract union all
      select '2021-12-01' as month, '동원몰' as merchant, 'CPS' as type, '0'* 1.0 as merchant_ratio, '5000' as CPX_contract union all
      select '2021-12-01' as month, '롯데월드' as merchant, 'CPS' as type, '0'* 1.0 as merchant_ratio, '5000' as CPX_contract union all
      select '2021-12-01' as month, '브랜드닭' as merchant, 'CPS' as type, '0'* 1.0 as merchant_ratio, '5000' as CPX_contract union all
      select '2021-12-01' as month, '어바웃펫' as merchant, 'ROAS' as type, '0.7'* 1.0 as merchant_ratio, '0' as CPX_contract union all
      select '2021-12-01' as month, '인더웨어' as merchant, 'ROAS' as type, '0'* 1.0 as merchant_ratio, '5000' as CPX_contract union all
      select '2021-12-01' as month, '현대백화점투홈' as merchant, 'CPS' as type, '0'* 1.0 as merchant_ratio, '5000' as CPX_contract union all
      select '2021-12-01' as month, '바잇미' as merchant, 'CPS' as type, '0.7'* 1.0 as merchant_ratio, '0' as CPX_contract union all
      select '2021-12-01' as month, '보고플레이' as merchant, 'CPS' as type, '0'* 1.0 as merchant_ratio, '7000' as CPX_contract union all
      select '2021-12-01' as month, '아몬즈' as merchant, 'CPS' as type, '0'* 1.0 as merchant_ratio, '7000' as CPX_contract union all
      select '2021-12-01' as month, '크로켓' as merchant, 'CPS' as type, '0'* 1.0 as merchant_ratio, '7000' as CPX_contract union all
      select '2021-12-01' as month, '네파' as merchant, 'CPS' as type, '0'* 1.0 as merchant_ratio, '10000' as CPX_contract union all
      select '2021-12-01' as month, '캐치패션' as merchant, 'CPA' as type, '0'* 1.0 as merchant_ratio, '10000' as CPX_contract union all
      select '2021-12-01' as month, '쿠쿠몰' as merchant, 'CPS' as type, '0'* 1.0 as merchant_ratio, '10000' as CPX_contract union all
      select '2021-12-01' as month, '프립' as merchant, 'ROAS' as type, '0.5'* 1.0 as merchant_ratio, '0' as CPX_contract union all
      select '2021-12-01' as month, '여기어때' as merchant, 'CPA' as type, '0'* 1.0 as merchant_ratio, '15000' as CPX_contract union all
      select '2021-12-01' as month, '데일리호텔' as merchant, 'CPA' as type, '0'* 1.0 as merchant_ratio, '17000' as CPX_contract union all
      select '2021-12-01' as month, '마켓컬리' as merchant, 'CPA' as type, '0'* 1.0 as merchant_ratio, '20000' as CPX_contract union all
      select '2021-12-01' as month, 'SK스토아' as merchant, 'ROAS' as type, '0.5'* 1.0 as merchant_ratio, '0' as CPX_contract union all
      select '2021-12-01' as month, 'W컨셉' as merchant, 'CPS' as type, '0'* 1.0 as merchant_ratio, '0' as CPX_contract union all
      select '2021-12-01' as month, '그린카' as merchant, 'ROAS' as type, '0'* 1.0 as merchant_ratio, '4000' as CPX_contract union all
      select '2021-12-01' as month, '다노샵' as merchant, 'ROAS' as type, '0.5'* 1.0 as merchant_ratio, '0' as CPX_contract union all
      select '2021-12-01' as month, '디코드' as merchant, 'ROAS' as type, '0.7'* 1.0 as merchant_ratio, '0' as CPX_contract union all
      select '2021-12-01' as month, '리틀버드' as merchant, 'ROAS' as type, '1'* 1.0 as merchant_ratio, '0' as CPX_contract union all
      select '2021-12-01' as month, '모던하우스' as merchant, 'CPS' as type, '0'* 1.0 as merchant_ratio, '0' as CPX_contract union all
      select '2021-12-01' as month, '뮬라웨어' as merchant, 'ROAS' as type, '1'* 1.0 as merchant_ratio, '0' as CPX_contract union all
      select '2021-12-01' as month, '설로인' as merchant, 'CPS' as type, '0'* 1.0 as merchant_ratio, '5000' as CPX_contract union all
      select '2021-12-01' as month, '술담화' as merchant, 'ROAS' as type, '0.7'* 1.0 as merchant_ratio, '0' as CPX_contract union all
      select '2021-12-01' as month, '아워홈' as merchant, 'ROAS' as type, '0.6'* 1.0 as merchant_ratio, '0' as CPX_contract union all
      select '2021-12-01' as month, '얌테이블' as merchant, 'CPS' as type, '0'* 1.0 as merchant_ratio, '5000' as CPX_contract union all
      select '2021-12-01' as month, '이삭토스트' as merchant, 'ROAS' as type, '0.5'* 1.0 as merchant_ratio, '0' as CPX_contract union all
      select '2021-12-01' as month, '지니뮤직' as merchant, 'ROAS' as type, '0.5'* 1.0 as merchant_ratio, '0' as CPX_contract union all
      select '2021-12-01' as month, '카모아' as merchant, 'ROAS' as type, '0.5'* 1.0 as merchant_ratio, '0' as CPX_contract union all
      select '2021-12-01' as month, '펫프렌즈' as merchant, 'ROAS' as type, '0'* 1.0 as merchant_ratio, '1500' as CPX_contract union all
      select '2021-12-01' as month, '한섬EQL' as merchant, 'ROAS' as type, '0'* 1.0 as merchant_ratio, '0' as CPX_contract union all
      select '2021-12-01' as month, '화해' as merchant, 'CPS' as type, '0'* 1.0 as merchant_ratio, '3000' as CPX_contract union all
      select '2021-12-01' as month, '리틀버드' as merchant, 'ROAS' as type, '0'* 1.0 as merchant_ratio, '20000' as CPX_contract
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: total_ad_spend_dec {
    type: sum
    sql: ${TABLE}.ad_spend ;;
  }

  dimension: month {
    type: string
    sql: ${TABLE}.month ;;
  }

  dimension: merchant {
    type: string
    primary_key: yes
    sql: ${TABLE}.merchant ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: merchant_ratio {
    type: number
    sql: ${TABLE}.merchant_ratio ;;
  }

  dimension: cpx_contract {
    type: string
    sql: ${TABLE}.cpx_contract ;;
  }

  set: detail {
    fields: [month, merchant, type, merchant_ratio, cpx_contract]
  }
}
