view: port_salesforce_opportunity_line_item {
  derived_table: {
    sql: SELECT * FROM `port-thirdparty-prod.salesforce.opportunity_line_item`
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension_group: _fivetran_synced {
    type: time
    sql: ${TABLE}._fivetran_synced ;;
  }

  dimension: account_product_c {
    type: string
    sql: ${TABLE}.account_product_c ;;
  }

  dimension: commission_c {
    type: number
    sql: ${TABLE}.commission_c ;;
  }

  dimension: commission_sum_as_is_c {
    type: number
    sql: ${TABLE}.commission_sum_as_is_c ;;
  }

  dimension: commission_sum_to_be_c {
    type: number
    sql: ${TABLE}.commission_sum_to_be_c ;;
  }

  dimension: cost_c {
    type: number
    sql: ${TABLE}.cost_c ;;
  }

  dimension: created_by_id {
    type: string
    sql: ${TABLE}.created_by_id ;;
  }

  dimension_group: created_date {
    type: time
    sql: ${TABLE}.created_date ;;
  }

  dimension: current_commission_c {
    type: number
    sql: ${TABLE}.current_commission_c ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: discount {
    type: number
    sql: ${TABLE}.discount ;;
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.is_deleted ;;
  }

  dimension: is_rate_based_c {
    type: yesno
    sql: ${TABLE}.is_rate_based_c ;;
  }

  dimension: last_modified_by_id {
    type: string
    sql: ${TABLE}.last_modified_by_id ;;
  }

  dimension_group: last_modified_date {
    type: time
    sql: ${TABLE}.last_modified_date ;;
  }

  dimension_group: last_referenced_date {
    type: time
    sql: ${TABLE}.last_referenced_date ;;
  }

  dimension_group: last_viewed_date {
    type: time
    sql: ${TABLE}.last_viewed_date ;;
  }

  dimension: list_price {
    type: number
    sql: ${TABLE}.list_price ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: opportunity_id {
    type: string
    sql: ${TABLE}.opportunity_id ;;
  }

  dimension: pricebook_entry_id {
    type: string
    sql: ${TABLE}.pricebook_entry_id ;;
  }

  dimension: product_2_id {
    type: string
    sql: ${TABLE}.product_2_id ;;
  }

  dimension: product_code {
    type: string
    sql: ${TABLE}.product_code ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }

  dimension: service_date {
    type: date
    datatype: date
    sql: ${TABLE}.service_date ;;
  }

  dimension: sort_order {
    type: number
    sql: ${TABLE}.sort_order ;;
  }

  dimension: subtotal {
    type: number
    sql: ${TABLE}.subtotal ;;
  }

  dimension_group: system_modstamp {
    type: time
    sql: ${TABLE}.system_modstamp ;;
  }

  dimension: total_price {
    type: number
    sql: ${TABLE}.total_price ;;
  }

  dimension_group: transaction_amount_changed_date_c {
    type: time
    sql: ${TABLE}.transaction_amount_changed_date_c ;;
  }

  dimension: transaction_count_c {
    type: number
    sql: ${TABLE}.transaction_count_c ;;
  }

  dimension: unit_price {
    type: number
    sql: ${TABLE}.unit_price ;;
  }

  dimension: weight_by_payment_method_c {
    type: number
    sql: ${TABLE}.weight_by_payment_method_c ;;
  }

  dimension: weight_by_payment_method_type_c {
    type: number
    sql: ${TABLE}.weight_by_payment_method_type_c ;;
  }

  set: detail {
    fields: [
      id,
      _fivetran_synced_time,
      account_product_c,
      commission_c,
      commission_sum_as_is_c,
      commission_sum_to_be_c,
      cost_c,
      created_by_id,
      created_date_time,
      current_commission_c,
      description,
      discount,
      is_deleted,
      is_rate_based_c,
      last_modified_by_id,
      last_modified_date_time,
      last_referenced_date_time,
      last_viewed_date_time,
      list_price,
      name,
      opportunity_id,
      pricebook_entry_id,
      product_2_id,
      product_code,
      quantity,
      service_date,
      sort_order,
      subtotal,
      system_modstamp_time,
      total_price,
      transaction_amount_changed_date_c_time,
      transaction_count_c,
      unit_price,
      weight_by_payment_method_c,
      weight_by_payment_method_type_c
    ]
  }
}
