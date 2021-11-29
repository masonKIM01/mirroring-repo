view: monthly_roas {
  derived_table: {
    sql: select
      date(z.created_at),
      z.sub_title,
      z.merchant_ratio,
      sum(z.cashback) as cashback,
      sum(
      case when z.sub_title in ('현대백화점투홈') then '5000'
      when z.name in ('설로인') then '5000'
      merchant_ratio is not null then z.merchant_ratio * z.cashback
      else z.ad_spend end) as ad_spend
      from
      (select
        p.created_at,
        bpp.sub_title,
        cast(x.merchant_ratio as numeric(10,4)) as merchant_ratio,
        sum(p.cashback_amount) as cashback,
        sum(case when p.created_at <= '2021-10-14' then ap.ad_spend else 0 end) as ad_spend
      from  raw_rds_production.payment p
      left join analytics_production.analytics_payment ap on ap.id = p.id
      left join raw_rds_production.boost b on b.payment_id = p.id
      left join raw_rds_production.boost_promotion_policy bpp on bpp.id = b.boost_promotion_id
      left join
      (select
              date('2021-10-01') as "month",
              '에릭요한슨 사진전' as "sub_title",
              '0.5' as "merchant_ratio"
            union all
            select
              date('2021-10-01') as "month",
              '그린카' as "sub_title",
              '0.5' as "merchant_ratio"
            union all
            select
              date('2021-10-01') as "month",
              '뮬라웨어' as "sub_title",
              '1' as "merchant_ratio"
            union all
            select
              date('2021-10-01') as "month",
              '젝시믹스' as "sub_title",
              '0.5' as "merchant_ratio"
            union all
            select
              date('2021-10-01') as "month",
              '펫프렌즈' as "sub_title",
              '0.5' as "merchant_ratio"
            union all
            select
              date('2021-10-01') as "month",
              '인더웨어' as "sub_title",
              '1' as "merchant_ratio"
            union all
            select
              date('2021-10-01') as "month",
              '인테이크' as "sub_title",
              '1' as "merchant_ratio"
            union all
            select
              date('2021-10-01') as "month",
              '어바웃펫' as "sub_title",
              '0.5' as "merchant_ratio"
            union all
            select
              date('2021-10-01') as "month",
              '위메프오' as "sub_title",
              '0.6' as "merchant_ratio"
            union all
            select
              date('2021-10-01') as "month",
              '쿠쿠몰' as "sub_title",
              '0.5' as "merchant_ratio"
            union all
            select
              date('2021-10-01') as "month",
              '바잇미' as "sub_title",
              '0.7' as "merchant_ratio"
            union all
            select
              date('2021-10-01') as "month",
              '아모레몰' as "sub_title",
              '0.5' as "merchant_ratio"
            union all
            select
              date('2021-10-01') as "month",
              '에이블리' as "sub_title",
              '0.5' as "merchant_ratio"
            union all
            select
              date('2021-10-01') as "month",
              '얌테이블' as "sub_title",
              '0.7' as "merchant_ratio"
            union all
            select
              date('2021-10-01') as "month",
              '디코드' as "sub_title",
              '0.7' as "merchant_ratio"
            union all
            select
              date('2021-10-01') as "month",
              '아워홈' as "sub_title",
              '0.6' as "merchant_ratio"
            union all
            select
              date('2021-10-01') as "month",
              '아몬즈' as "sub_title",
              '1' as "merchant_ratio"
            union all
            select
              date('2021-10-01') as "month",
              '해피머니' as "sub_title",
              '0.5' as "merchant_ratio"
            union all
            select
              date('2021-10-01') as "month",
              '티몬 스키시즌 오픈!' as "sub_title",
              '0.5' as "merchant_ratio"
            union all
            select
              date('2021-10-01') as "month",
              '여행의 시작 KKday' as "sub_title",
              '0.7' as "merchant_ratio"
            union all
            select
              date('2021-10-01') as "month",
              '크로켓' as "sub_title",
              '1' as "merchant_ratio"
            union all
            select
              date('2021-10-01') as "month",
              '술담화' as "sub_title",
              '0.7' as "merchant_ratio"
            union all
            select
              date('2021-10-01') as "month",
              '롭스' as "sub_title",
              '0.5' as "merchant_ratio"
            union all
            select
              date('2021-10-01') as "month",
              '카모아' as "sub_title",
              '0.5' as "merchant_ratio"
            union all
            select date('2021-11-01') as "month",'뮬라웨어' as "sub_title", '1' as "merchant_ratio" union all
            select date('2021-11-01') as "month",'젝시믹스' as "sub_title", '0.5' as "merchant_ratio" union all
            select date('2021-11-01') as "month",'펫프렌즈' as "sub_title", '0.5' as "merchant_ratio" union all
            select date('2021-11-01') as "month",'인더웨어' as "sub_title", '1' as "merchant_ratio" union all
            select date('2021-11-01') as "month",'인테이크' as "sub_title", '1' as "merchant_ratio" union all
            select date('2021-11-01') as "month",'어바웃펫' as "sub_title", '0.5' as "merchant_ratio" union all
            select date('2021-11-01') as "month",'쿠쿠몰' as "sub_title", '0.5' as "merchant_ratio" union all
            select date('2021-11-01') as "month",'바잇미' as "sub_title", '0.7' as "merchant_ratio" union all
            select date('2021-11-01') as "month",'얌테이블' as "sub_title", '0.7' as "merchant_ratio" union all
            select date('2021-11-01') as "month",'디코드' as "sub_title", '0.7' as "merchant_ratio" union all
            select date('2021-11-01') as "month",'아워홈' as "sub_title", '0.6' as "merchant_ratio" union all
            select date('2021-11-01') as "month",'아몬즈' as "sub_title", '1' as "merchant_ratio" union all
            select date('2021-11-01') as "month",'해피머니' as "sub_title", '0.5' as "merchant_ratio" union all
            select date('2021-11-01') as "month",'크로켓' as "sub_title", '1' as "merchant_ratio" union all
            select date('2021-11-01') as "month",'롯데월드' as "sub_title", '0.5' as "merchant_ratio" union all
            )x on x.sub_title = bpp.sub_title and to_char(x.month,'yyyymm') = to_char(p.created_at,'yyyymm')
      group by 1,2,3
      )z
      where z.sub_title is not null
      group by 1,2,3
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: total_cashback {
    type: sum
    sql: ${TABLE}.cashback ;;
  }

  measure: total_adspend {
    type: sum
    sql: ${TABLE}.ad_spend ;;
  }

  dimension_group: date {
    type: time
    sql: ${TABLE}.date ;;
  }

  dimension: sub_title {
    type: string
    sql: ${TABLE}.sub_title ;;
  }

  dimension: merchant_ratio {
    type: number
    sql: ${TABLE}.merchant_ratio ;;
  }

  dimension: cashback {
    type: number
    sql: ${TABLE}.cashback ;;
  }

  dimension: ad_spend {
    type: number
    sql: ${TABLE}.ad_spend ;;
  }

  set: detail {
    fields: [date_date, sub_title, merchant_ratio, cashback, ad_spend]
  }
}
