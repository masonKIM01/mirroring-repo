view: table_adspend_owner {
  derived_table: {
    sql: select '주붕샵' as merchant_name, 'Groot' as owner union all
      select '아이니유' as merchant_name, 'Groot' as owner union all
      select '그린카' as merchant_name, 'Kevin' as owner union all
      select '위메프오' as merchant_name, 'Cloe' as owner union all
      select '뮬라웨어' as merchant_name, 'Cloe' as owner union all
      select '젝시믹스' as merchant_name, 'Kevin' as owner union all
      select '펫프렌즈' as merchant_name, 'Kevin' as owner union all
      select '인더웨어' as merchant_name, 'Kevin' as owner union all
      select '어바웃펫' as merchant_name, 'Kevin' as owner union all
      select '쿠쿠몰' as merchant_name, 'Cloe' as owner union all
      select '바잇미' as merchant_name, 'Cloe' as owner union all
      select '여기어때' as merchant_name, 'Cloe' as owner union all
      select '얌테이블' as merchant_name, 'Cloe' as owner union all
      select '디코드' as merchant_name, 'Kevin' as owner union all
      select '아워홈' as merchant_name, 'Cloe' as owner union all
      select '아몬즈' as merchant_name, 'Cloe' as owner union all
      select '크로켓' as merchant_name, 'Cloe' as owner union all
      select '무신사' as merchant_name, 'Cloe' as owner union all
      select '캐시비' as merchant_name, 'Kevin' as owner union all
      select '현대식품관' as merchant_name, 'Cloe' as owner union all
      select '설로인' as merchant_name, 'Cloe' as owner union all
      select '화해' as merchant_name, 'Cloe' as owner union all
      select '보고플레이' as merchant_name, 'Cloe' as owner union all
      select '브랜드닭' as merchant_name, 'Kevin' as owner union all
      select '에이블리' as merchant_name, 'Kevin' as owner union all
      select '한섬EQL' as merchant_name, 'Cloe' as owner union all
      select '마켓컬리' as merchant_name, 'Cloe' as owner union all
      select '텐바이텐' as merchant_name, 'Kevin' as owner union all
      select '캐치패션' as merchant_name, 'Cloe' as owner union all
      select '카모아' as merchant_name, 'NULL' as owner union all
      select 'aj전시몰' as merchant_name, 'Cloe' as owner union all
      select '프립' as merchant_name, 'Kevin' as owner union all
      select '지니' as merchant_name, 'Kevin' as owner union all
      select '술담화' as merchant_name, 'Kevin' as owner union all
      select '원데이즈유' as merchant_name, 'Cloe' as owner union all
      select '티몬' as merchant_name, 'Groot' as owner union all
      select '집꾸미기' as merchant_name, 'MJ' as owner union all
      select '카카오헤어샵' as merchant_name, 'MJ' as owner union all
      select 'OCO' as merchant_name, 'Groot' as owner union all
      select '번개장터' as merchant_name, 'Gatsby' as owner union all
      select '하이버' as merchant_name, 'MJ' as owner union all
      select '페스룸' as merchant_name, 'Kevin' as owner union all
      select '아이엠택시' as merchant_name, 'Gatsby' as owner union all
      select 'GS프레시몰' as merchant_name, 'Cloe' as owner union all
      select '먹깨비' as merchant_name, 'Groot' as owner union all
      select '데카트론' as merchant_name, 'Groot' as owner union all
      select '모두의주차장' as merchant_name, 'Groot' as owner union all
      select '오뚜기몰' as merchant_name, 'Groot' as owner union all
      select '애니멀고' as merchant_name, 'Groot' as owner union all
      select 'UT' as merchant_name, 'Gatsby' as owner union all
      select '쏘카' as merchant_name, 'Kevin' as owner union all
      select '데일리샷' as merchant_name, 'Groot' as owner union all
      select '마미' as merchant_name, 'Cloe' as owner union all
      select '롯데슈퍼' as merchant_name, 'MJ' as owner union all
      select '아로마트러플' as merchant_name, 'Cloe' as owner union all
      select '아이디어스' as merchant_name, 'Cloe' as owner union all
      select 'Flow 도곡/위례점' as merchant_name, 'Gatsby' as owner union all
      select '오아' as merchant_name, 'Gatsby' as owner union all
      select '슬림나인' as merchant_name, 'Groot' as owner union all
      select '아로마티카' as merchant_name, 'Groot' as owner union all
      select '핑크테이블' as merchant_name, 'Groot' as owner union all
      select '솔드아웃' as merchant_name, 'Cloe' as owner union all
      select '룩핀' as merchant_name, 'Cloe' as owner union all
      select '크로켓' as merchant_name, 'Cloe' as owner union all
      select '스타일씨' as merchant_name, 'Cloe' as owner union all
      select '라스트오더' as merchant_name, 'Gatsby' as owner union all
      select '요기요' as merchant_name, 'NULL' as owner union all
      select '더반찬' as merchant_name, 'Cloe' as owner union all
      select '하트노트' as merchant_name, 'NULL' as owner union all
      select '그리팅몰' as merchant_name, 'MJ' as owner union all
      select '집꾸미기' as merchant_name, 'MJ' as owner union all
      select '현대백화점투홈' as merchant_name, 'Cloe' as owner;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: merchant_name {
    type: string
    primary_key: yes
    sql: ${TABLE}.merchant_name ;;
  }

  dimension: owner {
    type: string
    sql: ${TABLE}.owner ;;
  }

  set: detail {
    fields: [merchant_name, owner]
  }
}
