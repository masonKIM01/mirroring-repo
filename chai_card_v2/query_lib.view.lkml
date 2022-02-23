view: query_lib {
  derived_table: {
    sql: select
      * ,
      case
      when a.merchantName like '%다노샵%' or a.boostName = '다노샵' then '다노샵'
      when a.merchantName like '%펫프렌즈%' or a.boostName = '펫프렌즈' then '펫프렌즈'
      when a.merchantName like '%CGV%' or a.boostName = 'CGV' then 'CGV'
      when a.merchantName like '%뮬라웨어%' or a.boostName = '뮬라웨어' then '뮬라웨어'
      when a.merchantName like '%짬뽕지존%' or a.boostName = '짬뽕지존' then '짬뽕지존'
      when a.merchantName like '%노아베이커리%' or a.boostName = '노아베이커리' then '노아베이커리'
      when a.merchantName like '%프립%' or a.boostName = '프렌트립' then '프립'
      when a.merchantName like '%롯데ON%' or a.boostName = '롯데ON' then '롯데ON'
      when a.merchantName like '%쏘카%' or a.boostName = '쏘카' then '쏘카'
      when a.merchantName like '%그립%' or a.boostName = '그립' then '그립'
      when a.merchantName like '%이니스프리%' or a.boostName = '이니스프리' then '이니스프리'
      when a.merchantName like '%그린카%' or a.boostName = '그린카' then '그린카'
      when a.merchantName like '%만랩커피%' or a.boostName = '만랩커피' then '만랩커피'
      when a.merchantName like '%지니뮤직%' or a.boostName = '지니뮤직' then '지니뮤직'
      when a.merchantName like '%젝시믹스%' or a.boostName = '젝시믹스' then '젝시믹스'
      when a.merchantName like '%엔코드%' or a.boostName = '디코드' then '디코드'
      when a.merchantName like '%이랜드크루즈%' or a.boostName = '이랜드크루즈' then '이랜드크루즈'
      when a.merchantName like '%위메프오%' or a.boostName = '위메프오' then '위메프오'
      when a.merchantName like '%쿠쿠전자%' or a.boostName = '쿠쿠몰' then '쿠쿠몰'
      when a.merchantName like '%이삭토스트%' or a.boostName = '이삭토스트' then '이삭토스트'
      when a.merchantName like '%더기프팅컴퍼니%' or a.boostName = '인더웨어' then '인더웨어'
      when a.merchantName like '%죠스떡볶이%' or a.boostName = '죠스떡볶이' then '죠스떡볶이'
      when a.merchantName like '%사보텐%' or a.boostName = '사보텐' then '사보텐'
      when a.merchantName like '%타코벨%' or a.boostName = '타코벨' then '타코벨'
      when a.merchantName like '%올리브영%' or a.boostName = '올리브영' then '올리브영'
      when a.merchantName like '%담화컴퍼니%' or a.boostName = '술담화' then '술담화'
      when a.merchantName like '%비주얼%' or a.boostName = '비주얼' then '비주얼'
      when a.merchantName like '%롭스%' or a.boostName = '롭스' then '롭스'
      when a.merchantName like '%크몽%' or a.boostName = '크몽' then '크몽'
      when a.merchantName like '%더스윙%' or a.boostName = '스윙' then '스윙'
      when a.merchantName like '%야놀자%' or a.boostName = '야놀자' then '야놀자'
      when a.merchantName like '%브이씨엔씨%' or a.boostName = '타다' then '타다'
      when a.merchantName like '%아워홈%' or a.boostName = '아워홈' then '아워홈'
      when a.merchantName like '%비엘큐%' or a.boostName = '테스트밸리' then '테스트밸리'
      when a.merchantName like '%29CM%' or a.boostName = '29CM' then '29CM'
      when a.merchantName like '%타이어픽%' or a.boostName = '타이어픽' then '타이어픽'
      when a.merchantName like '%얌테이블%' or a.boostName = '얌테이블' then '얌테이블'
      when a.merchantName like '%지마켓%' or a.boostName = '지마켓' then '지마켓'
      when a.merchantName like '%SK스토아%' or a.boostName = 'SK스토아' then 'SK스토아'
      when a.merchantName like '%지에스리테일%' or a.merchantName like '%GS리테일%' or a.boostName = 'GS프레시몰' then 'GS프레시몰'
      when a.merchantName like '%카모아%' or a.boostName = '카모아' then '카모아'
      when a.merchantName like '%데싱디바%' or a.boostName = '데싱디바' then '데싱디바'
      when a.merchantName like '%오설록%' or a.boostName = '오설록' then '오설록'
      when a.merchantName like '%니뽕내뽕%' or a.boostName = '니뽕내뽕' then '니뽕내뽕'
      when a.merchantName like '%인테이크%' or a.boostName = '인테이크' then '인테이크'
      when a.merchantName like '%바잇미%' or a.boostName = '바잇미' then '바잇미'
      when a.merchantName like '%위메프%' or a.boostName = '위메프' then '위메프'
      when a.merchantName like '%앰플브라운%' or a.boostName = '앰플브라운' then '앰플브라운'
      when a.merchantName like '%브랜디%' or a.boostName = '브랜디' then '브랜디'
      when a.merchantName like '%두브레인%' or a.boostName = '두브레인' then '두브레인'
      when a.merchantName like '%와디즈%' or a.boostName = '와디즈' then '와디즈'
      when a.merchantName like '%마켓컬리%' or a.boostName = '마켓컬리' then '마켓컬리'
      when a.merchantName like '%여기어때%' or a.boostName = '여기어때' then '여기어때'
      when a.merchantName like '%아모레퍼시픽%' or a.boostName = '아모레몰' then '아모레몰'
      when a.merchantName like '%핏펫%' or a.boostName = '핏펫' then '핏펫'
      when a.merchantName like '%무신사%' or a.boostName = '무신사' then '무신사'
      when a.merchantName like '%와이오엘오%' or a.boostName = '크로켓' then '크로켓'
      when a.merchantName like '%딜리버리%히%' or a.merchantName like '%위대한%상상%' or a.boostName = '요기요' then '요기요'
      when a.merchantName like '%티몬%' or a.boostName = '티몬' then '티몬'
      when a.merchantName like '%교보문고%' or a.boostName = '교보문고' then '교보문고'
      when a.merchantName like '%해피머니%' or a.boostName = '해피머니' then '해피머니'
      when a.merchantName like '%에이블리%' or a.boostName = '에이블리' then '에이블리'
      when a.merchantName like '%쿠캣%' or a.boostName = '쿠캣마켓' then '쿠캣마켓'
      when a.merchantName like '%현대%백%' or a.boostName = '현대백화점투홈' then '현대백화점투홈'
      when a.merchantName like '%설로인%' or a.boostName = '설로인' then '설로인'
      when a.merchantName like '%캐치패션%' or a.boostName = '캐치패션' then '캐치패션'
      when a.merchantName like '%아더리시%' or a.boostName = '브랜드닭' then '브랜드닭'
      when a.merchantName like '%이비카드%' or a.boostName = '캐시비' then '캐시비'
      when a.merchantName like '%버드뷰%' or a.boostName = '화해' then '화해'
      when a.merchantName like '%롯데월드%' or a.boostName = '롯데월드' then '롯데월드'
      when a.merchantName like '%데일리호텔%' or a.boostName = '데일리호텔' then '데일리호텔'
      when a.merchantName like '%텐바이텐%' or a.boostName = '텐바이텐' then '텐바이텐'
      when a.merchantName like '%동원디어푸드%' or a.boostName = '동원몰' then '동원몰'
      when a.merchantName like '%투믹스%' or a.boostName = '투믹스' then '투믹스'
      when a.merchantName like '%디어코퍼%' or a.boostName = 'deer' then 'deer'
      when a.merchantName like '%(주)한섬%' or a.boostName = '한섬' then '한섬'
      when a.merchantName like '%전시몰%' or a.boostName = 'AJ전시몰' then 'AJ전시몰'
      when a.merchantName like '%보고플레이%' or a.boostName = '보고플레이' then '보고플레이'
      when a.merchantName like '%아아컴퍼니%' or a.boostName = '주붕샵' then '주붕샵'
      when a.merchantName like '%아아컴퍼니%' or a.boostName = '아이니유' then '아이니유'
      when a.merchantName like '%오유%인터내셔널%' or a.boostName = '원데이즈유' then '원데이즈유'
      when a.merchantName like '%아이디어스%' or a.boostName = '아이디어스' then '아이디어스'
      when a.merchantName like '%카카오헤어샵%' or a.boostName = '카카오헤어샵' then '카카오헤어샵'
      when a.merchantName like '%데일리샷%' or a.boostName = '데일리샷' then '데일리샷'
      when a.merchantName like '%마미%' or a.boostName = '마미' then '마미'
      when a.merchantName like '%아그레아블%' or a.boostName = '윙잇' then '윙잇'
      when a.merchantName like '%진%모빌리티%' or a.boostName = '아이엠택시' then '아이엠택시'
      when a.merchantName like '%롯데슈퍼%' or a.boostName = '롯데슈퍼' then '롯데슈퍼'
      when a.merchantName like '%동원디어푸드%' or a.boostName = '더반찬' then '더반찬'
      when a.merchantName like '%엔씨엑스%' or a.boostName = '핑크테이블' then '핑크테이블'
      when a.merchantName in ('(주)커뮤니케이션앤컬','주식회사 커뮤니케이') or a.boostName = '슬림나인' then '슬림나인'
      when a.merchantName like '%주식회사 레벨13%' or a.boostName = '룩핀' then '룩핀'
      when a.merchantName like '%스타일씨%' or a.boostName = '스타일씨' then '스타일씨'
      when a.merchantName like '%에스엘디티%' or a.boostName = '솔드아웃' then '솔드아웃'
      when a.merchantName like '%롯데월드 아쿠아%' or a.boostName = '롯데월드 아쿠아리움' then '롯데월드 아쿠아리움'
      when a.merchantName like '%SEOUL SKY%' or a.boostName = '롯데월드 서울스카이' then '롯데월드 서울스카이'
      when a.merchantName like '%(주)오뚜기%' or a.boostName = '오뚜기몰' then '오뚜기몰'
      when a.merchantName like '%모두의컴퍼니%' or a.boostName = '모두의주차장' then '모두의주차장'
      when a.merchantName like '%현대그린푸드%' or a.boostName = '그리팅몰' then '그리팅몰'
      when a.merchantName like '%집꾸미기%' or a.boostName = '집꾸미기' then '집꾸미기'
      end as Merchant_Name
      from (select
            case when m.name = '차이 신용카드' then 'credit_card'
            when m.name = '차이 체크카드' then 'check_card'
            else 'ewallet' end as payment_type ,
            p.year,
            p.month,
            p.status,
            to_char(p.created_at,'yyyy-mm-dd HH24:MM:SS')::date as date,
            p.id as payment_id,
            b.payment_id as boost_id,
            p.user_id,
            case when m.name not like ('%카드%') then m.name
            else split_part(split_part(p.data,'cardMerchantName":',2),'"',2) end
            as merchantName,
            b2.name as boostName,
            case when bpp.type = 'standard' then '일반'
            when bpp.type = 'fcfs' then '선착순'
            else '' end as boost_type,
            bpp.title,
            p.idempotency_key,
            split_part(split_part(p.data,'approvalNo":',2),'"',2) as cardApporovalNo,
            coalesce(case when ad.type = 'cps' then ad.unit_price
                  when ad.type = 'ratio' then ad.ratio * 0.01 * p.cashback_amount
                  when ad.type = 'cpa' then ad.unit_price * 0.5
                  end,0) as adSpend,
            p.cashback_amount + coalesce(ch.cashback_delta,0) as cashback_amount,
            p.cashback_amount + coalesce(ch.cashback_delta,0) -
            coalesce(case when ad.type = 'cps' then ad.unit_price
                  when ad.type = 'ratio' then ad.ratio * 0.01 * p.cashback_amount
                  when ad.type = 'cpa' then ad.unit_price * 0.5
                  end,0) as chaiCredit,
            p.checkout_amount as checkout_amount,
            coalesce(case when b.payment_id is not null then p.checkout_amount end,0) as boostCheckout_amount
            from chai_card_chai_prod_public.payment p
            left join chai_card_chai_prod_public.merchant m on m.id = p.merchant_id
            left join chai_card_chai_prod_public.boost b on b.payment_id = p.id
            left join chai_card_chai_prod_public.boost_promotion_policy bpp on bpp.id = b.boost_promotion_id
            left join chai_card_chai_prod_public.brand b2 on b2.id = bpp.brand_id
            left join chai_card_chai_prod_public.delayed_cashback_history ch on ch.payment_id = p.id
            left join chai_card_chai_prod_public.boost_campaign_ad_spend ad on ad.boost_campaign_id = b.boost_campaign_id
              and (case when ad.end_at is not null then b.created_at between ad.start_at and ad.end_at
              when ad.end_at is null then ad.start_at <= b.created_at end)
            where p.status = 'confirmed'
            and p.year = 2022)a
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }
  measure: total_checkout_amount {
    type: sum
    sql: ${TABLE}.checkout_amount ;;
  }

  measure: total_boost_checkout_amount {
    type: sum
    sql: ${TABLE}.boostCheckout_amount ;;
  }

  measure: total_cashback {
    type: sum
    sql: ${TABLE}.cashback_amount ;;
  }

  measure: total_ad_spend {
    type: sum
    sql: ${TABLE}.adspend ;;
  }

  measure: total_chai_credit {
    type: sum
    sql: ${TABLE}.chaiCredit ;;
  }

  measure: users {
    type: count_distinct
    sql: ${TABLE}.user_id  ;;
  }

  measure: boost {
    type: count_distinct
    sql: ${TABLE}.boost_id ;;
  }

  dimension: payment_type {
    type: string
    sql: ${TABLE}.payment_type ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }

  dimension: month {
    type: number
    sql: ${TABLE}.month ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: date {
    type: date
    sql: ${TABLE}.date ;;
  }

  dimension: payment_id {
    type: string
    sql: ${TABLE}.payment_id ;;
  }

  dimension: boost_id {
    type: string
    sql: ${TABLE}.boost_id ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: merchantname {
    type: string
    sql: ${TABLE}.merchantname ;;
  }

  dimension: boostname {
    type: string
    sql: ${TABLE}.boostname ;;
  }

  dimension: boost_type {
    type: string
    sql: ${TABLE}.boost_type ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: idempotency_key {
    type: string
    sql: ${TABLE}.idempotency_key ;;
  }

  dimension: cardapporovalno {
    type: string
    sql: ${TABLE}.cardapporovalno ;;
  }

  dimension: adspend {
    type: number
    sql: ${TABLE}.adspend ;;
  }

  dimension: cashback_amount {
    type: number
    sql: ${TABLE}.cashback_amount ;;
  }

  dimension: chaicredit {
    type: number
    sql: ${TABLE}.chaicredit ;;
  }

  dimension: checkout_amount {
    type: number
    sql: ${TABLE}.checkout_amount ;;
  }

  dimension: boostcheckout_amount {
    type: number
    sql: ${TABLE}.boostcheckout_amount ;;
  }

  dimension: merchant_name {
    type: string
    sql: ${TABLE}.merchant_name ;;
  }

  set: detail {
    fields: [
      payment_type,
      year,
      month,
      status,
      date,
      payment_id,
      boost_id,
      user_id,
      merchantname,
      boostname,
      boost_type,
      title,
      idempotency_key,
      cardapporovalno,
      adspend,
      cashback_amount,
      chaicredit,
      checkout_amount,
      boostcheckout_amount,
      merchant_name
    ]
  }
}
