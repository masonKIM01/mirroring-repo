view: raw_rds_prod_boost_joined {
  derived_table: {
    sql: select
        b.id,
        b.status,
        pp.max_discount_amount,
        brand.name as brand_name,
        bb.title as budget_title
      from raw_rds_production.boost b
      join raw_rds_production.boost_promotion_policy bpp
        on b.boost_promotion_id = bpp.id
      join raw_rds_production.promotion_policy pp
        on bpp.promotion_id = pp.id
      join raw_rds_production.boost_campaign bc
        on b.boost_campaign_id = bc.id
      join raw_rds_production.boost_budget bb
        on bc.boost_budget_id = bb.id
      join raw_rds_production.brand brand
        on bb.brand_id = brand.id
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }
  measure: max_discount_amount_sum {
    type: sum
    value_format: "0"
    sql: COALESCE(${max_discount_amount},0) ;;
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: max_discount_amount {
    type: number
    sql: ${TABLE}.max_discount_amount ;;
  }

  dimension: brand_name {
    type: string
    sql: ${TABLE}.brand_name ;;
  }

  dimension: budget_title {
    type: string
    sql: ${TABLE}.budget_title ;;
  }

  set: detail {
    fields: [id, status, max_discount_amount, brand_name, budget_title]
  }
}
