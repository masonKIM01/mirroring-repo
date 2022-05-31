view: derived_monthly_agg {
  derived_table: {
    sql: 
    SELECT
            *,
            DENSE_RANK() OVER (PARTITION BY a.yearmonth ORDER BY a.total_amount DESC) AS "rank"
    FROM (
            SELECT
                    CASE WHEN m.business_number IS NULL THEN
                          p.user_id
                    ELSE
                          m.business_number
                    END AS "business_number",
                    p.yearmonth AS "yearmonth",
                    COALESCE(SUM(p.amount_in_krw), 0) AS "total_amount",
                    COALESCE(SUM(
                                   CASE WHEN p.status = 'paid' THEN
                                        p.amount_in_krw
                                   END), 0) AS "net_amount"
            FROM
                  hmscatalog.importdb.payments p
            LEFT JOIN hmscatalog.importdb.merchant_details m ON p.user_id = m.user_id
            WHERE
                    p.sandbox = 0
                    AND p.status IN ('cancelled', 'paid')
            GROUP BY
                      1,
                      2 ) a;;

  }

  suggestions: no

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: business_number {
    primary_key: yes
    type: number
    sql: ${TABLE}.business_number ;;
  }

  dimension: yearmonth {
    type: string
    sql: ${TABLE}.yearmonth ;;
  }

  dimension: total_amount {
    type: number
    sql: ${TABLE}.total_amount ;;
  }

  dimension: net_amount {
    type: number
    sql: ${TABLE}.net_amount ;;
  }

  dimension: seg {
    type: string
    sql: case when ${total_amount} >= 5000000000 then 'enterprise'
      when ${total_amount} < 5000000000 and ${total_amount} >= 300000000 then 'growth'
      else 'young&long' end ;;
  }


  dimension: rank {
    type: number
    sql: ${TABLE}.rank ;;
  }



  measure: sum_total_amount {
    type: sum
    sql: ${total_amount} ;;
    label: "total gross tpv"
  }

  measure: sum_net_amount {
    type: sum
    sql: ${net_amount} ;;
    label: "total net tpv"
  }

  measure: mer_count {
    type: count_distinct
    sql: ${business_number} ;;
    label: "# of merchant"
  }



  set: detail {
    fields: [business_number, yearmonth, total_amount, net_amount]
  }
}
