view: bd_member_tracking {
  derived_table: {
    sql: select
      p.date as created_at,
      y.*,
      p.checkout_amount,
      p.cashback_amount,
      p.card_checkout,
      p.card_cashback
      from
      (select
      date(p.created_at),
      sum(p.checkout_amount) as checkout_amount,
      sum(p.cashback_amount) as cashback_amount,
      sum(case when m.name = '차이카드' then p.checkout_amount end) as card_checkout,
      sum(case when m.name = '차이카드' then p.cashback_amount end) as card_cashback
      from chai_card_chai_prod_public.payment p
      left join chai_card_chai_prod_public.merchant m on m.id = p.merchant_id
      where p.status = 'confirmed'
      group by 1
      )p
      left join
      (select x.*,
            case when x.name in ('KKDAY','테스트밸리','위메프오 (삭제필요)','롯데ON','현대백화점투홈','위메프','아워홈','오설록 온라인','오설록 티뮤지엄','위메프오','지마켓','KKday', '데싱디바', 'G마켓',  'SK스토아',  '설로인',  '롭스', '롯데온',  '네파', '롯데월드', '현대식품관투홈',  '한섬EQL',  '투믹스',  '크몽', '이삭토스트',  '위메프오', '크로켓',  '원데이즈유',  '오설록',  '여기어때', '모던하우스',  '엔터식스', '29cm', '얌테이블', '데일리호텔',  '야놀자',  '아워홈몰', '아모레몰', '올리브영', '캐치패션', '아몬즈',  '테스트벨리',  '보고플레이',  '화해', '바잇미',  '무신사',  '동원몰',  '스윙', '쿠쿠몰')
            then 'cloe'
            when x.name in ('브알라 아이스크림','이랜드 크루즈','티몬 (삭제 필요)','펫츠비','티몬 스키시즌 오픈!', '다노샵','에릭 요한슨 사진전','해피머니',  '짬뽕지존', '에릭요한슨사진전', '캐시비',  '프립', '티몬', '텐바이텐', '이랜드크루즈', '이니스프리',  'LG유플러스', '디코드',  '에이블리', '브랜드닭', '쏘카', '청소연구소',  '브알라아이스크림', '다노', '노아베이커리','펫프렌즈 (삭제 필요)')
                 then 'kevin'
            when x.name in ('젝시믹스 (삭제 필요)','지니','인테이크 (삭제 필요)','마켓컬리 (삭제 필요)', '앰플브라운','뮬라웨어 (삭제 필요)','만랩커피', '두브레인', '타이어픽', '인테이크', '와디즈',  '술담화',  '일꼬르소', '핏펫', '핏펫', '펫프렌즈', '어바웃펫', '마켓컬리', '사보텐',  '타코벨',  '달리살다', '랄라블라', 'GS프레시몰', 'GS프레시몰', '지니뮤직', '죠스떡볶이',  '니뽕내뽕', '엠플브라운',  'mmgl', '브랜디',  '젝시믹스', '뮬라웨어', 'deer', '인더웨어', '그립', '그린카')
                 then 'sammy'
            when x.name in ('AJ전시몰',  '롯데시네마',  '카모아')
                 then 'owen'
            else 'null'
            end as "owner"
      from
      (select
      a.date , a.id, a.name,
      case when a.type = 'ROAS' then a.cashback_amount * cast(a.contract as numeric(10,4))
           else a.p_count * a.contract
      end as ad_spend
      from
      (select distinct
            date(to_char(bh.created_at,'yyyy-mm-dd')),
            b2.id, b2.name,
            case when b2.id in ('120','758','757','467') then 'CPS'
                 when b2.id in ('729') then 'CPA'
                 else 'ROAS'
            end as "type",
            case when b2.id in ('729') then '15000'
                 when b2.id in ('120','758','757') then '5000'
                 when b2.id in ('467') then '3000'
                 when b2.id in ('715','443','717','718','612') then '1'
                 when b2.id in ('284','733','730','319','520') then '0.7'
                 when b2.id in ('734','720') then '0.6'
                 when b2.id in ('251','714','731','322','719','713','324','716','611','721','732','722','224','693') then '0.5'
                 when b2.id in ('228') then '0.4'
                 when b2.id in ('114') then '0.3'
            end as "contract",
            sum(bh.ad_spend) as cashback_amount,
            count(bh.payment_id) as p_count
            from chai_card_chai_prod_public.boost_budget_usage_history bh
            inner join chai_card_chai_prod_public.boost b on b.payment_id = bh.payment_id
            inner join chai_card_chai_prod_public.boost_promotion_policy bpp on bpp.id = b.boost_promotion_id
            inner join chai_card_chai_prod_public.brand b2 on b2.id = bpp.brand_id
            where bh.ad_spend > 0
            group by 1,2,3,4)a
      union all
        select date(ap.created_at), b2.id, b2.name,
        sum(ap.ad_spend) as ad_spend
        from analytics_deprecated.analytics_payment ap
        inner join chai_card_chai_prod_public.boost b on b.payment_id = ap.id
        inner join chai_card_chai_prod_public.boost_promotion_policy bpp on bpp.id = b.boost_promotion_id
        inner join chai_card_chai_prod_public.brand b2 on b2.id = bpp.brand_id
        where ap.ad_spend > 0
        and ap.created_at between '2021-01-01' and '2021-10-14'
        group by 1,2,3)x
        )y on p.date = y.date
      order by 1,2,3,4
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: total_checkout_amount {
    type: sum
    sql: ${TABLE}.checkout_amount  ;;
  }

  measure: total_cashback_amount {
    type: sum
    sql: ${TABLE}.cashback_amount  ;;
  }

  measure: total_ad_spend {
    type: sum
    sql: ${TABLE}.ad_spend  ;;
  }

  measure: total_card_checkout_amount {
    type: sum
    sql: ${TABLE}.card_checkout  ;;
  }

  measure: total_card_cashback_amount {
    type: sum
    sql: ${TABLE}.card_cashback  ;;
  }

  dimension_group: created_at {
    type: time
    sql: ${TABLE}.created_at ;;
  }

  dimension: date {
    type: date
    sql: ${TABLE}.date ;;
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: ad_spend {
    type: number
    sql: ${TABLE}.ad_spend ;;
  }

  dimension: owner {
    type: string
    sql: ${TABLE}.owner ;;
  }

  dimension: checkout_amount {
    type: number
    sql: ${TABLE}.checkout_amount ;;
  }

  dimension: cashback_amount {
    type: number
    sql: ${TABLE}.cashback_amount ;;
  }

  dimension: card_checkout {
    type: number
    sql: ${TABLE}.card_checkout ;;
  }

  dimension: card_cashback {
    type: number
    sql: ${TABLE}.card_cashback ;;
  }

  set: detail {
    fields: [
      created_at_time,
      date,
      id,
      name,
      ad_spend,
      owner,
      checkout_amount,
      cashback_amount,
      card_checkout,
      card_cashback
    ]
  }
}
