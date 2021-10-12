view: test_mason {
  derived_table: {
    sql: WITH premart_staging_payment__add_reward AS (SELECT * from premart_staging.payment p
       )
SELECT
    trunc((COALESCE(SUM(COALESCE( premart_staging_payment__add_reward.chai_spend  ,0) ), 0) / COALESCE(SUM(COALESCE( premart_staging_payment__add_reward.checkout_amount  ,0) ), 0)*100),0)||'%'
    AS "premart_staging_payment__add_reward.total_chai_spend(%)"
FROM premart_staging_payment__add_reward
WHERE ((((( premart_staging_payment__add_reward.created_at  )) >= (TIMESTAMP '2021-09-01') AND (( premart_staging_payment__add_reward.created_at  )) < (TIMESTAMP '2021-10-01'))))
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: premart_staging_payment__add_reward_total_chai_spend {
    type: string
    sql: ${TABLE}."premart_staging_payment__add_reward.total_chai_spend(%)" ;;
  }

  set: detail {
    fields: [premart_staging_payment__add_reward_total_chai_spend]
  }
}
