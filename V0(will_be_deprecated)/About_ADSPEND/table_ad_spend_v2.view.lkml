view: table_ad_spend_v2 {
  derived_table: {
    sql:
    SELECT ad.payment_id,
       CASE
         WHEN ad.type = 'cps' THEN ad.unit_price
         WHEN ad.type = 'ratio'
              AND ad.ratio > 1 THEN ad.ratio * 0.01 * (
                                    p.cashback_amount
                                    + COALESCE(x.cashback_delta, 0) -
                                             COALESCE(up.cashback_up, 0) )
         WHEN ad.type = 'ratio'
              AND ad.ratio < 1 THEN ad.ratio * ( p.cashback_amount
                                                 + COALESCE(x.cashback_delta, 0)
                                                 - COALESCE(up.cashback_up, 0) )
         WHEN ad.type = 'cpa' THEN ad.unit_price * 0.5
       END AS ad_spend
FROM   (SELECT b.payment_id,
               ad.type,
               b.id AS boost_id,
               unit_price,
               ratio,
               b.year,
               b.month
        FROM   chai_card_chai_prod_public.boost b
               INNER JOIN chai_card_chai_prod_public.boost_campaign_ad_spend ad
                       ON ( ad.boost_campaign_id = b.boost_campaign_id
                            AND CASE
                                  WHEN ad.end_at IS NOT NULL THEN
                                  b.created_at BETWEEN
                                  ad.start_at AND ad.end_at
                                  WHEN ad.end_at IS NULL THEN
                                  b.created_at >= ad.start_at
                                END )
        WHERE  b.year = '2022')ad
       LEFT JOIN chai_card_chai_prod_public.payment p
              ON p.id = ad.payment_id
                 AND p.year = '2022'
       LEFT JOIN (SELECT DISTINCT year,
                                  month,
                                  created_at,
                                  payment_id,
                                  Sum(cashback_delta) AS cashback_delta
                  FROM   (SELECT *,
                                 Count(action_type)
                                   OVER(
                                     partition BY payment_id)
                          FROM
                 chai_card_chai_prod_public.delayed_cashback_history dc
                          GROUP  BY 1,
                                    2,
                                    3,
                                    4,
                                    5,
                                    6,
                                    7,
                                    8,
                                    9,
                                    10,
                                    11,
                                    12,
                                    13,
                                    14,
                                    15,
                                    16)x
                  WHERE  x.count = 1
                  GROUP  BY 1,
                            2,
                            3,
                            4)x
              ON x.payment_id = ad.payment_id
       LEFT JOIN (SELECT up.boost_id,
                         Sum(up.cashback_amount) AS cashback_up
                  FROM   chai_card_chai_prod_public.boost_up up
                  GROUP  BY 1)up
              ON up.boost_id = ad.boost_id
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: sum_ad_spend {
    type: sum
    sql: coalesce(${TABLE}.ad_spend,0) ;;
  }

  dimension: payment_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.payment_id ;;
  }

  dimension: ad_spend {
    type: number
    sql: ${TABLE}.ad_spend ;;
  }

  set: detail {
    fields: [payment_id, ad_spend]
  }
}
