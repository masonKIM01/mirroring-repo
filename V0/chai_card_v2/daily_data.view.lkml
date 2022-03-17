view: daily_data {
  derived_table: {
    sql: select
        b.date as date,
        case when b.merchant_id = '0385e3db-4a50-4035-9285-1ced4a3e0209' then 'card' else 'ewallet' end as type,
        count(b.payment_id) as transactions,
        count(distinct b.user_id) as users,
        sum(b.checkout_amount) as checkout_amount,
        sum(b.total_cashback_amount) as cashback_amount,
        sum(b.ad_spend) as ad_spend
      from
        (select
        *,
        case when a.type = 'CPS' then 1.0 * a.contract * a.count_boost_id
             when a.type = 'CPA' then 1.0 * a.contract * 0.2 * a.count_boost_id
             when a.type = 'ROAS' then 1.0 * a.merchant_ratio::decimal(2,1) * total_cashback_amount
             else 0 end as AD_SPEND
      from
      (WITH table_redshift_payment AS (select
            to_char(created_at,'yyyy-mm-01') as months, *
            from chai_card_chai_prod_public.payment
       )
        ,  table_redshift_boost AS (select
            *
            from chai_card_chai_prod_public.boost b
             )
        ,  table_redshift_boost_promotion_policy AS (select *
            from chai_card_chai_prod_public.boost_promotion_policy bpp
             )
        ,  table_redshift_brand AS (select
            *
            from chai_card_chai_prod_public.brand
             )
        ,  table_merchant_adspend AS (select '2021-10-01' as months, '무신사' as merchant_name, '10,000원 캐시백' as title, 'CPA' as type, '0' as merchant_ratio, '0' as contract, '11509000' as CPA_done union all
            select '2021-10-01' as months, '여기어때' as merchant_name, '10,000원 캐시백' as title, 'CPA' as type, '0' as merchant_ratio, '0' as contract, '2205000' as CPA_done union all
            select '2021-10-01' as months, '동원몰' as merchant_name, '50% 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '5000' as contract, '0' as CPA_done union all
            select '2021-10-01' as months, '위메프' as merchant_name, '2,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '1000' as contract, '0' as CPA_done union all
            select '2021-10-01' as months, '에이블리' as merchant_name, '10,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '5000' as contract, '0' as CPA_done union all
            select '2021-10-01' as months, '에이블리' as merchant_name, '6,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '3000' as contract, '0' as CPA_done union all
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
      select '2021-12-01' as months, 'W컨셉' as merchant_name, '3,000원 캐시백' as title, '' as type, '' as merchant_ratio, '' as contract, '0' as CPA_done union all
      select '2021-12-01' as months, 'W컨셉' as merchant_name, '5,000원 캐시백' as title, '' as type, '' as merchant_ratio, '' as contract, '0' as CPA_done union all
      select '2021-12-01' as months, '이삭토스트' as merchant_name, '30% 캐시백' as title, 'ROAS' as type, '0.5' as merchant_ratio, '0' as contract, '0' as CPA_done union all
      select '2021-12-01' as months, '그린카' as merchant_name, '80% 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '4000' as contract, '0' as CPA_done union all
      select '2021-12-01' as months, '프립' as merchant_name, '10,000원 캐시백' as title, 'ROAS' as type, '0.5' as merchant_ratio, '0' as contract, '0' as CPA_done union all
      select '2021-12-01' as months, '화해' as merchant_name, '30% 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '3000' as contract, '0' as CPA_done union all
      select '2021-12-01' as months, '설로인' as merchant_name, '10,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '5000' as contract, '0' as CPA_done union all
      select '2021-12-01' as months, '설로인' as merchant_name, '11,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '5000' as contract, '0' as CPA_done union all
      select '2021-12-01' as months, '설로인' as merchant_name, '15,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '8000' as contract, '0' as CPA_done union all
      select '2021-12-01' as months, '설로인' as merchant_name, '16,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '8000' as contract, '0' as CPA_done union all
      select '2021-12-01' as months, '설로인' as merchant_name, '20,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '10000' as contract, '0' as CPA_done union all
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
      select '2021-12-01' as months, '한섬EQL' as merchant_name, '30,000원 캐시백' as title, 'CPS' as type, '0' as merchant_ratio, '17000' as contract, '0' as CPA_done
             )
      SELECT
          table_redshift_payment.created_at AS "date",
          table_redshift_payment.merchant_id as "merchant_id",
          table_redshift_brand.name  AS "name",
          table_merchant_adspend.contract  AS "contract",
          table_merchant_adspend.cpa_done  AS "cpa_done",
          table_merchant_adspend.merchant_ratio  AS "merchant_ratio",
          table_merchant_adspend.type  AS "type",
          table_redshift_payment.id as "payment_id",
          table_redshift_payment.user_id as "user_id",
          COALESCE(SUM(coalesce( table_redshift_payment.checkout_amount  ,0) ), 0) AS "checkout_amount",
          COALESCE(SUM(coalesce( table_redshift_payment.cashback_amount  ,0) ), 0) AS "total_cashback_amount",
          COUNT(DISTINCT table_redshift_boost.payment_id ) AS "count_boost_id"
      FROM table_redshift_payment
      LEFT JOIN table_redshift_boost ON table_redshift_boost.payment_id = table_redshift_payment.id
      LEFT JOIN table_redshift_boost_promotion_policy ON table_redshift_boost_promotion_policy.id = table_redshift_boost.boost_promotion_id
      LEFT JOIN table_redshift_brand ON table_redshift_brand.id = table_redshift_boost_promotion_policy.brand_id
      LEFT JOIN table_merchant_adspend ON table_redshift_brand.name = table_merchant_adspend.merchant_name
                and table_redshift_boost_promotion_policy.title = table_merchant_adspend.title
                and (table_redshift_payment.months) = (table_merchant_adspend.months)

      WHERE (table_redshift_payment.status ) = 'confirmed' AND (table_redshift_payment.year) in (2021,2022)
      AND (table_redshift_payment.created_at) >= '2021-10-15'
      GROUP BY
          1,
          2,
          3,
          4,
          5,
          6,
          7,
          8,9
      ORDER BY
          1 DESC
      )a
      group by 1,2,3,4,5,6,7,8,9,10,11,12
      )b
      group by 1,2
      union all
      select
      p.created_at as date,
      case when p.merchant_id = '0385e3db-4a50-4035-9285-1ced4a3e0209' then 'card' else 'ewallet' end as type,
        count(p.id) as transactions,
        count(distinct p.customer_id) as users,
        sum(p.checkout_amount) as checkout_amount,
        sum(p.cashback_amount) as cashback_amount,
        sum(p.ad_spend) as ad_spend
      from analytics_deprecated.payment p
      where p.created_at < '2021-10-15'
      and p.status = 'confirmed'
      group by 1,2
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: total_transactions {
    type: sum
    sql: ${TABLE}.transactions ;;
  }

  measure: total_users {
    type: sum
    sql: ${TABLE}.users ;;
  }

  measure: total_checkout_amount {
    type: sum
    sql: ${TABLE}.checkout_amount ;;
  }

  measure: total_cashback_amount {
    type: sum
    sql: ${TABLE}.cashback_amount ;;
  }

  measure: total_ad_spend {
    type: sum
    sql: ${TABLE}.ad_spend ;;
  }

  dimension_group: date {
    type: time
    sql: ${TABLE}.date ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: transactions {
    type: number
    sql: ${TABLE}.transactions ;;
  }

  dimension: users {
    type: number
    sql: ${TABLE}.users ;;
  }

  dimension: checkout_amount {
    type: number
    sql: ${TABLE}.checkout_amount ;;
  }

  dimension: cashback_amount {
    type: number
    sql: ${TABLE}.cashback_amount ;;
  }

  dimension: ad_spend {
    type: number
    sql: ${TABLE}.ad_spend ;;
  }

  set: detail {
    fields: [
      date_date,
      type,
      transactions,
      users,
      checkout_amount,
      cashback_amount,
      ad_spend
    ]
  }
}
