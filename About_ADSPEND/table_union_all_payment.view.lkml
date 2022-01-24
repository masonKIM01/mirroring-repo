view: table_union_all_payment {
  derived_table: {
    sql: select *
      from
             (select
              to_char(ap.created_at, 'yyyy-mm-01') as months, ap.id, ap.status, ap.checkout_amount, ap.canceled_amount, ap.created_at, ap.cashback_amount,
              0 as cpa_done, ap.ad_spend, ap.chai_credit, ap.merchant_id, ap.idempotency_key, ap.customer_id as user_id,
              am.name, b.id as boost_id, bpp.sub_title, bpp.title, b2.name as brand_name
              from analytics_deprecated.payment ap
              left join chai_card_chai_prod_public.merchant am on am.id = ap.merchant_id
              left join chai_card_chai_prod_public.boost b on b.payment_id = ap.id
              left join chai_card_chai_prod_public.boost_promotion_policy bpp on bpp.id = b.boost_promotion_id
              left join chai_card_chai_prod_public.brand b2 on b2.id = bpp.brand_id
            where ap.created_at <= '2021-10-14 23:59:59.999'
      union all
            select
              to_char(p.created_at, 'yyyy-mm-01') as months, p.id, p.status, p.checkout_amount, p.canceled_amount, p.created_at, p.cashback_amount
              , case when ad.CPA_done > 0 then ad.CPA_done::numeric end as cpa_done
              , case when ad.type = 'ROAS' then ad.merchant_ratio * p.cashback_amount
                     when ad.CPA_done = 0 and ad.type in ('CPA') then 0.2*ad.contract::numeric
                     when ad.CPA_done = 0 and ad.type in ('CPS') then ad.contract::numeric
                end as ad_spend
              , 0 as chai_credit
              , p.merchant_id
              , p.idempotency_key
              , p.user_id
              , m.name
              , b.id as boost_id, bpp.sub_title, bpp.title, b2.name as brand_name
            from chai_card_chai_prod_public.payment p
            left join chai_card_chai_prod_public.merchant m on m.id = p.merchant_id
            left join chai_card_chai_prod_public.boost b on b.payment_id = p.id
            left join chai_card_chai_prod_public.boost_promotion_policy bpp on bpp.id = b.boost_promotion_id
            left join chai_card_chai_prod_public.brand b2 on b2.id = bpp.brand_id
            left join
              (select '2021-10-01' as months, '무신사' as merchant_name, '10,000원 캐시백' as title, 'CPA' as type, '0' as merchant_ratio, '0' as contract, '11509000' as CPA_done union all
            select '2021-10-01' as months, '여기어때' as merchant_name, '10,000원 캐시백' as title, 'CPA' as type, '0' as merchant_ratio, '0' as contract, '2205000' as CPA_done union all
            select '2021-10-01' as months, '동원몰' as merchant_name, '50% 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '5000' as contract, '0' as CPA_done union all
            select '2021-10-01' as months, '위메프' as merchant_name, '2,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '1000' as contract, '0' as CPA_done union all
            select '2021-10-01' as months, '에이블리' as merchant_name, '10,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '5000' as contract, '0' as CPA_done union all
            select '2021-10-01' as months, '텐바이텐' as merchant_name, '3,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '3000' as contract, '0' as CPA_done union all
            select '2021-10-01' as months, '젝시믹스 (삭제 필요)' as merchant_name, '20% 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '2500' as contract, '0' as CPA_done union all
            select '2021-10-01' as months, 'aj전시몰' as merchant_name, '5,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '5000' as contract, '0' as CPA_done union all
            select '2021-10-01' as months, 'aj전시몰' as merchant_name, '7,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '5000' as contract, '0' as CPA_done union all
            select '2021-10-01' as months, '롭스' as merchant_name, '5,000원 캐시백' as title, 'ROAS' as type, '0.5' as merchant_ratio, '0' as contract, '0' as CPA_done union all
            select '2021-10-01' as months, '롭스' as merchant_name, '7,000원 캐시백' as title, 'ROAS' as type, '0.5' as merchant_ratio, '0' as contract, '0' as CPA_done union all
            select '2021-10-01' as months, '프립' as merchant_name, '10,000원 캐시백' as title, 'ROAS' as type, '0.5' as merchant_ratio, '0' as contract, '0' as CPA_done union all
            select '2021-10-01' as months, '에릭 요한슨 사진전' as merchant_name, '15,000원 캐시백' as title, 'ROAS' as type, '0.5' as merchant_ratio, '0' as contract, '0' as CPA_done union all
            select '2021-10-01' as months, '티몬 스키시즌 오픈!' as merchant_name, '30% 캐시백' as title, 'ROAS' as type, '0.5' as merchant_ratio, '0' as contract, '0' as CPA_done union all
            select '2021-10-01' as months, '그린카' as merchant_name, '80% 캐시백' as title, 'ROAS' as type, '0.5' as merchant_ratio, '0' as contract, '0' as CPA_done union all
            select '2021-10-01' as months, '다노샵' as merchant_name, '10,000원 캐시백' as title, 'ROAS' as type, '0.7' as merchant_ratio, '0' as contract, '0' as CPA_done union all
            select '2021-10-01' as months, '다노샵' as merchant_name, '50% 캐시백' as title, 'ROAS' as type, '0.7' as merchant_ratio, '0' as contract, '0' as CPA_done union all
            select '2021-10-01' as months, '디코드' as merchant_name, '10,000원 캐시백' as title, 'ROAS' as type, '0.84' as merchant_ratio, '0' as contract, '0' as CPA_done union all
            select '2021-10-01' as months, '디코드' as merchant_name, '10000원 캐시백' as title, 'ROAS' as type, '0.84' as merchant_ratio, '0' as contract, '0' as CPA_done union all
            select '2021-10-01' as months, '디코드' as merchant_name, '5,000원 캐시백' as title, 'ROAS' as type, '0.84' as merchant_ratio, '0' as contract, '0' as CPA_done union all
            select '2021-10-01' as months, '디코드' as merchant_name, '5000원 캐시백' as title, 'ROAS' as type, '0.84' as merchant_ratio, '0' as contract, '0' as CPA_done union all
            select '2021-10-01' as months, '바잇미' as merchant_name, '10,000원 캐시백' as title, 'ROAS' as type, '0.7' as merchant_ratio, '0' as contract, '0' as CPA_done union all
            select '2021-10-01' as months, '바잇미' as merchant_name, '10000원 캐시백' as title, 'ROAS' as type, '0.7' as merchant_ratio, '0' as contract, '0' as CPA_done union all
            select '2021-10-01' as months, '바잇미' as merchant_name, '5,000원 캐시백' as title, 'ROAS' as type, '0.7' as merchant_ratio, '0' as contract, '0' as CPA_done union all
            select '2021-10-01' as months, '바잇미' as merchant_name, '7,000원 캐시백' as title, 'ROAS' as type, '0.7' as merchant_ratio, '0' as contract, '0' as CPA_done union all
            select '2021-10-01' as months, '바잇미' as merchant_name, '7000원 캐시백' as title, 'ROAS' as type, '0.7' as merchant_ratio, '0' as contract, '0' as CPA_done union all
            select '2021-10-01' as months, '술담화' as merchant_name, '10,000원 캐시백' as title, 'ROAS' as type, '0.7' as merchant_ratio, '0' as contract, '0' as CPA_done union all
            select '2021-10-01' as months, '아몬즈' as merchant_name, '7,000원 캐시백' as title, 'ROAS' as type, '1' as merchant_ratio, '0' as contract, '0' as CPA_done union all
            select '2021-10-01' as months, '아워홈' as merchant_name, '35% 캐시백' as title, 'ROAS' as type, '0.6' as merchant_ratio, '0' as contract, '0' as CPA_done union all
            select '2021-10-01' as months, '아워홈' as merchant_name, '50% 캐시백' as title, 'ROAS' as type, '0.6' as merchant_ratio, '0' as contract, '0' as CPA_done union all
            select '2021-10-01' as months, '아워홈' as merchant_name, '7,000원 캐시백' as title, 'ROAS' as type, '0.6' as merchant_ratio, '0' as contract, '0' as CPA_done union all
            select '2021-10-01' as months, '아워홈' as merchant_name, '8,000원 캐시백' as title, 'ROAS' as type, '0.6' as merchant_ratio, '0' as contract, '0' as CPA_done union all
            select '2021-10-01' as months, '카모아' as merchant_name, '7,000원 캐시백' as title, 'ROAS' as type, '0.5' as merchant_ratio, '0' as contract, '0' as CPA_done union all
            select '2021-10-01' as months, '쿠쿠몰' as merchant_name, '30% 캐시백' as title, 'ROAS' as type, '0.5' as merchant_ratio, '0' as contract, '0' as CPA_done union all
            select '2021-10-01' as months, '크로켓' as merchant_name, '10,000원 캐시백' as title, 'ROAS' as type, '1' as merchant_ratio, '0' as contract, '0' as CPA_done union all
            select '2021-10-01' as months, '크로켓' as merchant_name, '5,000원 캐시백' as title, 'ROAS' as type, '1' as merchant_ratio, '0' as contract, '0' as CPA_done union all
            select '2021-10-01' as months, '뮬라웨어' as merchant_name, '80% 캐시백' as title, 'ROAS' as type, '1' as merchant_ratio, '0' as contract, '0' as CPA_done union all
            select '2021-10-01' as months, '아모레몰' as merchant_name, '10,000원 캐시백' as title, 'ROAS' as type, '0.5' as merchant_ratio, '0' as contract, '0' as CPA_done union all
            select '2021-10-01' as months, '아모레몰' as merchant_name, '15,000원 캐시백' as title, 'ROAS' as type, '0.5' as merchant_ratio, '0' as contract, '0' as CPA_done union all
            select '2021-10-01' as months, '아모레몰' as merchant_name, '20,000원 캐시백' as title, 'ROAS' as type, '0.5' as merchant_ratio, '0' as contract, '0' as CPA_done union all
            select '2021-10-01' as months, '아모레몰' as merchant_name, '5,000원 캐시백' as title, 'ROAS' as type, '0.5' as merchant_ratio, '0' as contract, '0' as CPA_done union all
            select '2021-10-01' as months, '아모레몰' as merchant_name, '7,000원 캐시백' as title, 'ROAS' as type, '0.5' as merchant_ratio, '0' as contract, '0' as CPA_done union all
            select '2021-10-01' as months, '얌테이블' as merchant_name, '10,000원 캐시백' as title, 'ROAS' as type, '0.7' as merchant_ratio, '0' as contract, '0' as CPA_done union all
            select '2021-10-01' as months, '얌테이블' as merchant_name, '5,000원 캐시백' as title, 'ROAS' as type, '0.7' as merchant_ratio, '0' as contract, '0' as CPA_done union all
            select '2021-10-01' as months, '어바웃펫' as merchant_name, '10,000원 캐시백' as title, 'ROAS' as type, '0.5' as merchant_ratio, '0' as contract, '0' as CPA_done union all
            select '2021-10-01' as months, '어바웃펫' as merchant_name, '12,000원 캐시백' as title, 'ROAS' as type, '0.5' as merchant_ratio, '0' as contract, '0' as CPA_done union all
            select '2021-10-01' as months, '어바웃펫' as merchant_name, '9,900원 캐시백' as title, 'ROAS' as type, '1' as merchant_ratio, '0' as contract, '0' as CPA_done union all
            select '2021-10-01' as months, '위메프오' as merchant_name, '30% 캐시백' as title, 'ROAS' as type, '0.5' as merchant_ratio, '0' as contract, '0' as CPA_done union all
            select '2021-10-01' as months, '위메프오' as merchant_name, '50% 캐시백' as title, 'ROAS' as type, '0.5' as merchant_ratio, '0' as contract, '0' as CPA_done union all
            select '2021-10-01' as months, '인더웨어' as merchant_name, '2,970원 캐시백' as title, 'ROAS' as type, '1' as merchant_ratio, '0' as contract, '0' as CPA_done union all
            select '2021-10-01' as months, '인더웨어' as merchant_name, '3,480원 캐시백' as title, 'ROAS' as type, '1' as merchant_ratio, '0' as contract, '0' as CPA_done union all
            select '2021-10-01' as months, '인더웨어' as merchant_name, '3,580원 캐시백' as title, 'ROAS' as type, '1' as merchant_ratio, '0' as contract, '0' as CPA_done union all
            select '2021-10-01' as months, '인더웨어' as merchant_name, '5,000원 캐시백' as title, 'ROAS' as type, '1' as merchant_ratio, '0' as contract, '0' as CPA_done union all
            select '2021-10-01' as months, '인더웨어' as merchant_name, '5000원 캐시백' as title, 'ROAS' as type, '1' as merchant_ratio, '0' as contract, '0' as CPA_done union all
            select '2021-10-01' as months, '인테이크' as merchant_name, '2,000원 캐시백' as title, 'ROAS' as type, '1' as merchant_ratio, '0' as contract, '0' as CPA_done union all
            select '2021-10-01' as months, '인테이크' as merchant_name, '2000원 캐시백' as title, 'ROAS' as type, '1' as merchant_ratio, '0' as contract, '0' as CPA_done union all
            select '2021-10-01' as months, '젝시믹스' as merchant_name, '20% 캐시백' as title, 'ROAS' as type, '0.5' as merchant_ratio, '0' as contract, '0' as CPA_done union all
            select '2021-10-01' as months, '펫프렌즈' as merchant_name, '12,000원 캐시백' as title, 'ROAS' as type, '0.7' as merchant_ratio, '0' as contract, '0' as CPA_done union all
            select '2021-10-01' as months, '펫프렌즈' as merchant_name, '12000원 캐시백' as title, 'ROAS' as type, '0.7' as merchant_ratio, '0' as contract, '0' as CPA_done union all
            select '2021-10-01' as months, '펫프렌즈' as merchant_name, '50% 캐시백' as title, 'ROAS' as type, '0.5' as merchant_ratio, '0' as contract, '0' as CPA_done union all
            select '2021-10-01' as months, '해피머니' as merchant_name, '5,000원 캐시백' as title, 'ROAS' as type, '0.5' as merchant_ratio, '0' as contract, '0' as CPA_done union all
            select '2021-10-01' as months, '인테이크 (삭제 필요)' as merchant_name, '2,000원 캐시백' as title, 'ROAS' as type, '1' as merchant_ratio, '0' as contract, '0' as CPA_done union all
            select '2021-10-01' as months, '이니스프리' as merchant_name, '50% 캐시백' as title, 'ROAS' as type, '0.4' as merchant_ratio, '0' as contract, '0' as CPA_done union all
            select '2021-10-01' as months, 'KKDAY' as merchant_name, '7,000원 캐시백' as title, 'ROAS' as type, '0.7' as merchant_ratio, '0' as contract, '0' as CPA_done union all
            select '2021-11-01' as months, '여기어때' as merchant_name, '7,000원 캐시백' as title, 'CPA' as type, '0' as merchant_ratio, '0' as contract, '6420000' as CPA_done union all
            select '2021-11-01' as months, '네파' as merchant_name, '15,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '10000' as contract, '0' as CPA_done union all
            select '2021-11-01' as months, '네파' as merchant_name, '20,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '10000' as contract, '0' as CPA_done union all
            select '2021-11-01' as months, '네파' as merchant_name, '30,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '10000' as contract, '0' as CPA_done union all
            select '2021-11-01' as months, '디코드' as merchant_name, '10,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '7000' as contract, '0' as CPA_done union all
            select '2021-11-01' as months, '디코드' as merchant_name, '5,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '3500' as contract, '0' as CPA_done union all
            select '2021-11-01' as months, '설로인' as merchant_name, '10,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '5000' as contract, '0' as CPA_done union all
            select '2021-11-01' as months, '설로인' as merchant_name, '12,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '5000' as contract, '0' as CPA_done union all
            select '2021-11-01' as months, '설로인' as merchant_name, '15,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '5000' as contract, '0' as CPA_done union all
            select '2021-11-01' as months, '설로인' as merchant_name, '60% 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '5000' as contract, '0' as CPA_done union all
            select '2021-11-01' as months, '설로인' as merchant_name, '80% 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '5000' as contract, '0' as CPA_done union all
            select '2021-11-01' as months, '위메프' as merchant_name, '25% 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '1000' as contract, '0' as CPA_done union all
            select '2021-11-01' as months, '위메프' as merchant_name, '3,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '1000' as contract, '0' as CPA_done union all
            select '2021-11-01' as months, '위메프' as merchant_name, '35% 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '1000' as contract, '0' as CPA_done union all
            select '2021-11-01' as months, '위메프' as merchant_name, '40% 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '1000' as contract, '0' as CPA_done union all
            select '2021-11-01' as months, '위메프' as merchant_name, '4,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '1000' as contract, '0' as CPA_done union all
            select '2021-11-01' as months, '위메프' as merchant_name, '50% 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '1000' as contract, '0' as CPA_done union all
            select '2021-11-01' as months, '위메프' as merchant_name, '5,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '1000' as contract, '0' as CPA_done union all
            select '2021-11-01' as months, '위메프' as merchant_name, '8,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '1000' as contract, '0' as CPA_done union all
            select '2021-11-01' as months, '캐시비' as merchant_name, '50% 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '2000' as contract, '0' as CPA_done union all
            select '2021-11-01' as months, '쿠쿠몰' as merchant_name, '30% 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '10000' as contract, '0' as CPA_done union all
            select '2021-11-01' as months, '롯데월드' as merchant_name, '10,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '5000' as contract, '0' as CPA_done union all
            select '2021-11-01' as months, '브랜드닭' as merchant_name, '10,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '5000' as contract, '0' as CPA_done union all
            select '2021-11-01' as months, '브랜드닭' as merchant_name, '12,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '5000' as contract, '0' as CPA_done union all
            select '2021-11-01' as months, '얌테이블' as merchant_name, '10,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '7000' as contract, '0' as CPA_done union all
            select '2021-11-01' as months, '에이블리' as merchant_name, '6,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '3000' as contract, '0' as CPA_done union all
            select '2021-11-01' as months, '위메프오' as merchant_name, '30% 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '1500' as contract, '0' as CPA_done union all
            select '2021-11-01' as months, '위메프오' as merchant_name, '50% 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '2000' as contract, '0' as CPA_done union all
            select '2021-11-01' as months, '인더웨어' as merchant_name, '50% 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '5000' as contract, '0' as CPA_done union all
            select '2021-11-01' as months, '인더웨어' as merchant_name, '5,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '5000' as contract, '0' as CPA_done union all
            select '2021-11-01' as months, '텐바이텐' as merchant_name, '3,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '3000' as contract, '0' as CPA_done union all
            select '2021-11-01' as months, '텐바이텐' as merchant_name, '50% 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '3000' as contract, '0' as CPA_done union all
            select '2021-11-01' as months, '펫프렌즈' as merchant_name, '50% 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '1500' as contract, '0' as CPA_done union all
            select '2021-11-01' as months, '해피머니' as merchant_name, '5,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '2500' as contract, '0' as CPA_done union all
            select '2021-11-01' as months, '현대백화점투홈' as merchant_name, '50% 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '5000' as contract, '0' as CPA_done union all
            select '2021-11-01' as months, '현대백화점투홈' as merchant_name, '90% 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '5000' as contract, '0' as CPA_done union all
            select '2021-11-01' as months, 'aj전시몰' as merchant_name, '10,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '5000' as contract, '0' as CPA_done union all
            select '2021-11-01' as months, '지니' as merchant_name, '60% 캐시백' as title, 'ROAS' as type, '0.5' as merchant_ratio, '0' as contract, '0' as CPA_done union all
            select '2021-11-01' as months, '프립' as merchant_name, '10,000원 캐시백' as title, 'ROAS' as type, '0.5' as merchant_ratio, '0' as contract, '0' as CPA_done union all
            select '2021-11-01' as months, '그린카' as merchant_name, '80% 캐시백' as title, 'ROAS' as type, '0.5' as merchant_ratio, '0' as contract, '0' as CPA_done union all
            select '2021-11-01' as months, '바잇미' as merchant_name, '10,000원 캐시백' as title, 'ROAS' as type, '0.7' as merchant_ratio, '0' as contract, '0' as CPA_done union all
            select '2021-11-01' as months, '바잇미' as merchant_name, '60% 캐시백' as title, 'ROAS' as type, '1' as merchant_ratio, '0' as contract, '0' as CPA_done union all
            select '2021-11-01' as months, '바잇미' as merchant_name, '7,000원 캐시백' as title, 'ROAS' as type, '0.7' as merchant_ratio, '0' as contract, '0' as CPA_done union all
            select '2021-11-01' as months, '아몬즈' as merchant_name, '10,000원 캐시백' as title, 'ROAS' as type, '1' as merchant_ratio, '0' as contract, '0' as CPA_done union all
            select '2021-11-01' as months, '아몬즈' as merchant_name, '15,000원 캐시백' as title, 'ROAS' as type, '1' as merchant_ratio, '0' as contract, '0' as CPA_done union all
            select '2021-11-01' as months, '아몬즈' as merchant_name, '7,000원 캐시백' as title, 'ROAS' as type, '1' as merchant_ratio, '0' as contract, '0' as CPA_done union all
            select '2021-11-01' as months, '아워홈' as merchant_name, '35% 캐시백' as title, 'ROAS' as type, '0.6' as merchant_ratio, '0' as contract, '0' as CPA_done union all
            select '2021-11-01' as months, '아워홈' as merchant_name, '50% 캐시백' as title, 'ROAS' as type, '0.6' as merchant_ratio, '0' as contract, '0' as CPA_done union all
            select '2021-11-01' as months, '크로켓' as merchant_name, '7,000원 캐시백' as title, 'ROAS' as type, '1' as merchant_ratio, '0' as contract, '0' as CPA_done union all
            select '2021-11-01' as months, '뮬라웨어' as merchant_name, '10,000원 캐시백' as title, 'ROAS' as type, '1' as merchant_ratio, '0' as contract, '0' as CPA_done union all
            select '2021-11-01' as months, '뮬라웨어' as merchant_name, '20% 캐시백' as title, 'ROAS' as type, '1' as merchant_ratio, '0' as contract, '0' as CPA_done union all
            select '2021-11-01' as months, '어바웃펫' as merchant_name, '10,000원 캐시백' as title, 'ROAS' as type, '0.5' as merchant_ratio, '0' as contract, '0' as CPA_done union all
            select '2021-11-01' as months, '어바웃펫' as merchant_name, '11,000원 캐시백' as title, 'ROAS' as type, '0.5' as merchant_ratio, '0' as contract, '0' as CPA_done union all
            select '2021-11-01' as months, '어바웃펫' as merchant_name, '9,900원 캐시백' as title, 'ROAS' as type, '1' as merchant_ratio, '0' as contract, '0' as CPA_done union all
            select '2021-11-01' as months, '인테이크' as merchant_name, '2,000원 캐시백' as title, 'ROAS' as type, '1' as merchant_ratio, '0' as contract, '0' as CPA_done union all
            select '2021-11-01' as months, '젝시믹스' as merchant_name, '20% 캐시백' as title, 'ROAS' as type, '0.5' as merchant_ratio, '0' as contract, '0' as CPA_done union all
            select '2021-11-01' as months, '인테이크 (삭제 필요)' as merchant_name, '8,000원 캐시백' as title, 'ROAS' as type, '1' as merchant_ratio, '0' as contract, '0' as CPA_done union all
            select '2021-12-01' as months, '다노샵' as merchant_name, '50% 캐시백' as title, 'ROAS' as type, '0.5' as merchant_ratio, '0' as contract, '0' as CPA_done union all
select '2021-12-01' as months, '동원몰' as merchant_name, '10,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '5000' as contract, '0' as CPA_done union all
select '2021-12-01' as months, '동원몰' as merchant_name, '7,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '5000' as contract, '0' as CPA_done union all
select '2021-12-01' as months, '디코드' as merchant_name, '10,000원 캐시백' as title, 'ROAS' as type, '0.7' as merchant_ratio, '0' as contract, '0' as CPA_done union all
select '2021-12-01' as months, '무신사' as merchant_name, '8,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '2400' as contract, '0' as CPA_done union all
select '2021-12-01' as months, '바잇미' as merchant_name, '10,000원 캐시백' as title, 'ROAS' as type, '0.7' as merchant_ratio, '0' as contract, '0' as CPA_done union all
select '2021-12-01' as months, '바잇미' as merchant_name, '7,000원 캐시백' as title, 'ROAS' as type, '0.7' as merchant_ratio, '0' as contract, '0' as CPA_done union all
select '2021-12-01' as months, '아몬즈' as merchant_name, '7,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '7000' as contract, '0' as CPA_done union all
select '2021-12-01' as months, '아워홈' as merchant_name, '60% 캐시백' as title, 'ROAS' as type, '0.6' as merchant_ratio, '0' as contract, '0' as CPA_done union all
select '2021-12-01' as months, '아워홈' as merchant_name, '6,000원 캐시백' as title, 'ROAS' as type, '0.6' as merchant_ratio, '0' as contract, '0' as CPA_done union all
select '2021-12-01' as months, '캐시비' as merchant_name, '50% 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '2000' as contract, '0' as CPA_done union all
select '2021-12-01' as months, '쿠쿠몰' as merchant_name, '30% 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '10000' as contract, '0' as CPA_done union all
select '2021-12-01' as months, '크로켓' as merchant_name, '7,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '7000' as contract, '0' as CPA_done union all
select '2021-12-01' as months, '롯데월드' as merchant_name, '10,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '5000' as contract, '0' as CPA_done union all
select '2021-12-01' as months, '마켓컬리' as merchant_name, '3,000원 캐시백' as title, 'CPA' as type, '0' as merchant_ratio, '20000' as contract, '0' as CPA_done union all
select '2021-12-01' as months, '마켓컬리' as merchant_name, '3,500원 캐시백' as title, 'CPA' as type, '0' as merchant_ratio, '20000' as contract, '0' as CPA_done union all
select '2021-12-01' as months, '마켓컬리' as merchant_name, '8,000원 캐시백' as title, 'CPA' as type, '0' as merchant_ratio, '20000' as contract, '0' as CPA_done union all
select '2021-12-01' as months, '브랜드닭' as merchant_name, '10,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '5000' as contract, '0' as CPA_done union all
select '2021-12-01' as months, '브랜드닭' as merchant_name, '12,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '5000' as contract, '0' as CPA_done union all
select '2021-12-01' as months, '어바웃펫' as merchant_name, '10,000원 캐시백' as title, 'ROAS' as type, '0.7' as merchant_ratio, '0' as contract, '0' as CPA_done union all
select '2021-12-01' as months, '어바웃펫' as merchant_name, '12,000원 캐시백' as title, 'ROAS' as type, '0.7' as merchant_ratio, '0' as contract, '0' as CPA_done union all
select '2021-12-01' as months, '에이블리' as merchant_name, '6,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '3000' as contract, '0' as CPA_done union all
select '2021-12-01' as months, '여기어때' as merchant_name, '7,000원 캐시백' as title, 'CPA' as type, '0' as merchant_ratio, '15000' as contract, '0' as CPA_done union all
select '2021-12-01' as months, '젝시믹스 (삭제 필요)' as merchant_name, '20% 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '2500' as contract, '0' as CPA_done union all
select '2021-12-01' as months, '캐치패션' as merchant_name, '20,000원 캐시백' as title, 'CPA' as type, '0' as merchant_ratio, '10000' as contract, '0' as CPA_done union all
select '2021-12-01' as months, '캐치패션' as merchant_name, '25,000원 캐시백' as title, 'CPA' as type, '0' as merchant_ratio, '10000' as contract, '0' as CPA_done union all
select '2021-12-01' as months, '텐바이텐' as merchant_name, '3,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '3000' as contract, '0' as CPA_done union all
select '2021-12-01' as months, '텐바이텐' as merchant_name, '6,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '3000' as contract, '0' as CPA_done union all
select '2021-12-01' as months, '펫프렌즈' as merchant_name, '50% 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '1500' as contract, '0' as CPA_done union all
select '2021-12-01' as months, '해피머니' as merchant_name, '5,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '2500' as contract, '0' as CPA_done union all
select '2021-12-01' as months, '데일리호텔' as merchant_name, '5,000원 캐시백' as title, 'CPA' as type, '0' as merchant_ratio, '17000' as contract, '0' as CPA_done union all
select '2021-12-01' as months, '이니스프리' as merchant_name, '40% 캐시백' as title, 'ROAS' as type, '0.4' as merchant_ratio, '0' as contract, '0' as CPA_done union all
select '2021-12-01' as months, 'AJ전시몰' as merchant_name, '10,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '5000' as contract, '0' as CPA_done union all
select '2021-12-01' as months, 'AJ전시몰' as merchant_name, '15,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '5000' as contract, '0' as CPA_done union all
select '2021-12-01' as months, 'W컨셉' as merchant_name, '3,000원 캐시백' as title, 'ROAS' as type, '0' as merchant_ratio, '0' as contract, '0' as CPA_done union all
select '2021-12-01' as months, 'W컨셉' as merchant_name, '5,000원 캐시백' as title, 'ROAS' as type, '0' as merchant_ratio, '0' as contract, '0' as CPA_done union all
select '2021-12-01' as months, '이삭토스트' as merchant_name, '30% 캐시백' as title, 'ROAS' as type, '0.5' as merchant_ratio, '0' as contract, '0' as CPA_done union all
select '2021-12-01' as months, '그린카' as merchant_name, '80% 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '4000' as contract, '0' as CPA_done union all
select '2021-12-01' as months, '프립' as merchant_name, '10,000원 캐시백' as title, 'ROAS' as type, '0.5' as merchant_ratio, '0' as contract, '0' as CPA_done union all
select '2021-12-01' as months, '화해' as merchant_name, '30% 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '3000' as contract, '0' as CPA_done union all
select '2021-12-01' as months, '설로인' as merchant_name, '10,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '8000' as contract, '0' as CPA_done union all
select '2021-12-01' as months, '설로인' as merchant_name, '11,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '8000' as contract, '0' as CPA_done union all
select '2021-12-01' as months, '설로인' as merchant_name, '15,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '8000' as contract, '0' as CPA_done union all
select '2021-12-01' as months, '설로인' as merchant_name, '16,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '8000' as contract, '0' as CPA_done union all
select '2021-12-01' as months, '설로인' as merchant_name, '20,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '8000' as contract, '0' as CPA_done union all
select '2021-12-01' as months, '술담화' as merchant_name, '10% 캐시백' as title, 'ROAS' as type, '0.7' as merchant_ratio, '0' as contract, '0' as CPA_done union all
select '2021-12-01' as months, '위메프' as merchant_name, '2,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '1000' as contract, '0' as CPA_done union all
select '2021-12-01' as months, '위메프' as merchant_name, '3,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '1000' as contract, '0' as CPA_done union all
select '2021-12-01' as months, '위메프' as merchant_name, '35% 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '1000' as contract, '0' as CPA_done union all
select '2021-12-01' as months, '위메프' as merchant_name, '4,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '1000' as contract, '0' as CPA_done union all
select '2021-12-01' as months, '위메프' as merchant_name, '5,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '1000' as contract, '0' as CPA_done union all
select '2021-12-01' as months, '위메프' as merchant_name, '8,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '1000' as contract, '0' as CPA_done union all
select '2021-12-01' as months, '카모아' as merchant_name, '7,000원 캐시백' as title, 'ROAS' as type, '0.5' as merchant_ratio, '0' as contract, '0' as CPA_done union all
select '2021-12-01' as months, '리틀버드' as merchant_name, '20,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '20000' as contract, '0' as CPA_done union all
select '2021-12-01' as months, '뮬라웨어' as merchant_name, '20% 캐시백' as title, 'ROAS' as type, '1' as merchant_ratio, '0' as contract, '0' as CPA_done union all
select '2021-12-01' as months, '얌테이블' as merchant_name, '10,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '5000' as contract, '0' as CPA_done union all
select '2021-12-01' as months, '얌테이블' as merchant_name, '7,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '5000' as contract, '0' as CPA_done union all
select '2021-12-01' as months, '인더웨어' as merchant_name, '5,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '5000' as contract, '0' as CPA_done union all
select '2021-12-01' as months, '인테이크' as merchant_name, '2,000원 캐시백' as title, 'ROAS' as type, '1' as merchant_ratio, '0' as contract, '0' as CPA_done union all
select '2021-12-01' as months, '젝시믹스' as merchant_name, '20% 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '2500' as contract, '0' as CPA_done union all
select '2021-12-01' as months, '보고플레이' as merchant_name, '90% 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '7000' as contract, '0' as CPA_done union all
select '2021-12-01' as months, '한섬EQL' as merchant_name, '10,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '7000' as contract, '0' as CPA_done union all
select '2021-12-01' as months, '한섬EQL' as merchant_name, '20,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '15000' as contract, '0' as CPA_done union all
select '2021-12-01' as months, '한섬EQL' as merchant_name, '30,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '17000' as contract, '0' as CPA_done union all
select '2021-12-01' as months, '쏘카' as merchant_name, '80% 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '3500' as contract, '0' as CPA_done union all
select '2021-12-01' as months, '쏘카' as merchant_name, '10,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '3500' as contract, '0' as CPA_done union all
select '2021-12-01' as months, 'SK스토아' as merchant_name, '7,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '3500' as contract, '0' as CPA_done union all
select '2021-12-01' as months, '주붕샵' as merchant_name, '10,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '5000' as contract, '0' as CPA_done union all
select '2021-12-01' as months, '아이니유' as merchant_name, '10,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '5000' as contract, '0' as CPA_done union all
select '2021-12-01' as months, '원데이즈유' as merchant_name, '10,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '6500' as contract, '0' as CPA_done union all
  select '2022-01-01' as months, 'W컨셉' as merchant_name, '5,000원 캐시백' as title, '' as type, '0' as merchant_ratio, '0' as contract, '0' as CPA_done union all
  select '2022-01-01' as months, '한섬EQL' as merchant_name, '20,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '10000' as contract, '0' as CPA_done union all
  select '2022-01-01' as months, '한섬EQL' as merchant_name, '15,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '7000' as contract, '0' as CPA_done union all
  select '2022-01-01' as months, '프립' as merchant_name, '10,000원 캐시백' as title, 'ROAS' as type, '0.5' as merchant_ratio, '10000' as contract, '0' as CPA_done union all
  select '2022-01-01' as months, '크로켓' as merchant_name, '7,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '7000' as contract, '0' as CPA_done union all
  select '2022-01-01' as months, '쿠쿠몰' as merchant_name, '30% 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '10000' as contract, '0' as CPA_done union all
  select '2022-01-01' as months, '캐시비' as merchant_name, '50% 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '2000' as contract, '0' as CPA_done union all
  select '2022-01-01' as months, '카모아' as merchant_name, '7,000원 캐시백' as title, 'ROAS' as type, '0.5' as merchant_ratio, '0' as contract, '0' as CPA_done union all
  select '2022-01-01' as months, '지니' as merchant_name, '60% 캐시백' as title, 'ROAS' as type, '0.5' as merchant_ratio, '2200' as contract, '0' as CPA_done union all
  select '2022-01-01' as months, '주붕샵' as merchant_name, '10,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '6500' as contract, '0' as CPA_done union all
  select '2022-01-01' as months, '젝시믹스' as merchant_name, '20% 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '2500' as contract, '0' as CPA_done union all
  select '2022-01-01' as months, '인테이크' as merchant_name, '2,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '2000' as contract, '0' as CPA_done union all
  select '2022-01-01' as months, '인더웨어' as merchant_name, '5,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '5000' as contract, '0' as CPA_done union all
  select '2022-01-01' as months, '위메프오' as merchant_name, '3,500원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '1200' as contract, '0' as CPA_done union all
  select '2022-01-01' as months, '위메프오' as merchant_name, '30% 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '1200' as contract, '0' as CPA_done union all
  select '2022-01-01' as months, '원데이즈유' as merchant_name, '8,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '6500' as contract, '0' as CPA_done union all
  select '2022-01-01' as months, '원데이즈유' as merchant_name, '20,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '14000' as contract, '0' as CPA_done union all
  select '2022-01-01' as months, '여기어때' as merchant_name, '7,000원 캐시백' as title, 'CPA' as type, '0' as merchant_ratio, '15000' as contract, '0' as CPA_done union all
  select '2022-01-01' as months, '에이블리' as merchant_name, '6,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '3000' as contract, '0' as CPA_done union all
  select '2022-01-01' as months, '어바웃펫' as merchant_name, '10,000원 캐시백' as title, 'ROAS' as type, '0.5' as merchant_ratio, '5000' as contract, '0' as CPA_done union all
  select '2022-01-01' as months, '아이니유' as merchant_name, '10,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '6500' as contract, '0' as CPA_done union all
  select '2022-01-01' as months, '아워홈' as merchant_name, '60% 캐시백' as title, 'ROAS' as type, '0.4' as merchant_ratio, '0' as contract, '0' as CPA_done union all
  select '2022-01-01' as months, '아워홈' as merchant_name, '6,000원 캐시백' as title, 'ROAS' as type, '0.4' as merchant_ratio, '0' as contract, '0' as CPA_done union all
  select '2022-01-01' as months, '아몬즈' as merchant_name, '12,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '7000' as contract, '0' as CPA_done union all
  select '2022-01-01' as months, '아몬즈' as merchant_name, '8,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '7000' as contract, '0' as CPA_done union all
  select '2022-01-01' as months, '설로인' as merchant_name, '20,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '10000' as contract, '0' as CPA_done union all
  select '2022-01-01' as months, '설로인' as merchant_name, '15,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '10000' as contract, '0' as CPA_done union all
  select '2022-01-01' as months, '바잇미' as merchant_name, '7,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '7000' as contract, '0' as CPA_done union all
  select '2022-01-01' as months, '뮬라웨어' as merchant_name, '20% 캐시백' as title, 'ROAS' as type, '1' as merchant_ratio, '0' as contract, '0' as CPA_done union all
  select '2022-01-01' as months, '디코드' as merchant_name, '5,000원 캐시백' as title, 'ROAS' as type, '0.3' as merchant_ratio, '0' as contract, '0' as CPA_done union all
  select '2022-01-01' as months, '그린카' as merchant_name, '80% 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '4000' as contract, '0' as CPA_done union all
  select '2022-01-01' as months, '펫프렌즈' as merchant_name, '50% 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '1500' as contract, '0' as CPA_done union all
  select '2022-01-01' as months, '카모아' as merchant_name, '7,000원 캐시백' as title, 'ROAS' as type, '0.5' as merchant_ratio, '0' as contract, '0' as CPA_done union all
  select '2022-01-01' as months, '브랜드닭' as merchant_name, '10,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '5000' as contract, '0' as CPA_done union all
  select '2022-01-01' as months, '브랜드닭' as merchant_name, '12,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '5000' as contract, '0' as CPA_done union all
  select '2022-01-01' as months, '롯데월드' as merchant_name, '10,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '5000' as contract, '0' as CPA_done union all
  select '2022-01-01' as months, '텐바이텐' as merchant_name, '6,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '3000' as contract, '0' as CPA_done union all
  select '2022-01-01' as months, '이삭토스트' as merchant_name, '30% 캐시백' as title, 'ROAS' as type, '0.5' as merchant_ratio, '0' as contract, '0' as CPA_done union all
  select '2022-01-01' as months, '카카오헤어샵' as merchant_name, '6,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '3000' as contract, '0' as CPA_done union all
  select '2022-01-01' as months, '카카오헤어샵' as merchant_name, '8,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '3000' as contract, '0' as CPA_done union all
  select '2022-01-01' as months, '쏘카' as merchant_name, '70% 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '3500' as contract, '0' as CPA_done union all
  select '2022-01-01' as months, '윙잇' as merchant_name, '10,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '14000' as contract, '0' as CPA_done union all
  select '2022-01-01' as months, '윙잇' as merchant_name, '15,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '14000' as contract, '0' as CPA_done union all
  select '2022-01-01' as months, '데일리샷' as merchant_name, '10,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '5000' as contract, '0' as CPA_done union all
  select '2022-01-01' as months, '마미' as merchant_name, '10,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '5000' as contract, '0' as CPA_done union all
  select '2022-01-01' as months, '티몬' as merchant_name, '10% 캐시백' as title, 'ROAS' as type, '0.5' as merchant_ratio, '0' as contract, '0' as CPA_done union all
  select '2022-01-01' as months, 'GS프레시몰' as merchant_name, '10,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '5000' as contract, '0' as CPA_done union all
  select '2022-01-01' as months, '위메프' as merchant_name, '4,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '1600' as contract, '0' as CPA_done union all
  select '2022-01-01' as months, '더반찬' as merchant_name, '12,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '6000' as contract, '0' as CPA_done union all
  select '2022-01-01' as months, '티몬' as merchant_name, '15% 캐시백' as title, 'ROAS' as type, '0.5' as merchant_ratio, '0' as contract, '0' as CPA_done union all
  select '2022-01-01' as months, '아이엠택시' as merchant_name, '40% 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '8000' as contract, '0' as CPA_done
  )ad on ad.months = to_char(p.created_at, 'yyyy-mm-01')
                and ad.merchant_name = b2.name
                and ad.title = bpp.title
            where p.created_at >= '2021-10-15'
      )x
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

  measure: total_canceled_amount {
    type: sum
    sql: ${TABLE}.canceled_amount ;;
  }

  dimension_group: created_at {
    type: time
    sql: ${TABLE}.created_at ;;
  }

  measure: total_cashback_amount {
    type: sum
    sql: ${TABLE}.cashback_amount ;;
  }

  measure: total_ad_spend {
    type: sum
    sql: ${TABLE}.ad_spend ;;
  }

  measure: total_chai_credit {
    type: sum
    sql: ${TABLE}.chai_credit ;;
  }

  measure: total_cpa_done {
    type: sum_distinct
    sql: ${TABLE}.cpa_done  ;;
  }

  dimension: months {
    type: string
    sql: ${TABLE}.months ;;
  }

  dimension: id {
    type: string
    primary_key: yes
    sql: ${TABLE}.id ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: cpa_done {
    type: number
    sql: ${TABLE}.cpa_done ;;
  }

  dimension: checkout_amount {
    type: number
    sql: ${TABLE}.checkout_amount ;;
  }

  dimension: canceled_amount {
    type: number
    sql: ${TABLE}.canceled_amount ;;
  }

  dimension_group: created_at_date {
    type: time
    sql: ${TABLE}.created_at ;;
  }

  dimension: cashback_amount {
    type: number
    sql: ${TABLE}.cashback_amount ;;
  }

  dimension: ad_spend {
    type: number
    sql: ${TABLE}.ad_spend ;;
  }

  dimension: chai_credit {
    type: number
    sql: ${TABLE}.chai_credit ;;
  }

  dimension: merchant_id {
    type: string
    sql: ${TABLE}.merchant_id ;;
  }

  dimension: idempotency_key {
    type: string
    sql: ${TABLE}.idempotency_key ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: boost_id {
    type: number
    sql: ${TABLE}.boost_id ;;
  }

  dimension: sub_title {
    type: string
    sql: ${TABLE}.sub_title ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: brand_name {
    type: string
    sql: ${TABLE}.brand_name ;;
  }

  set: detail {
    fields: [
      months,
      id,
      status,
      checkout_amount,
      canceled_amount,
      created_at_time,
      cashback_amount,
      cpa_done,
      ad_spend,
      chai_credit,
      merchant_id,
      idempotency_key,
      user_id,
      name,
      boost_id,
      sub_title,
      title,
      brand_name
    ]
  }
}
