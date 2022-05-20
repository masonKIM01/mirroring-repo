include: "../../explore_for_pdt/prejoined_plcc.explore.lkml"

view: prejoined_plcc_pdt {
  derived_table: {
    datagroup_trigger: daily_datagroup
    distribution_style: all
    increment_key: "plcc_card_application_created_date"
    increment_offset:  7
    explore_source: prejoined_plcc {
      column: plcc_card_application_id { field: prejoined_plcc.id }
      column: plcc_card_application_user_id { field: prejoined_plcc.user_id }
      column: plcc_card_application_status { field: prejoined_plcc.status }
      column: plcc_card_application_created_date { field: prejoined_plcc.created_date }
      column: plcc_card_application_created_at { field: prejoined_plcc.created_raw }
      column: plcc_card_application_updated_at { field: prejoined_plcc.updated_raw }
      column: korea_spec_user_di { field: chai_korea_spec.di }
      column: korea_spec_user_ci { field: chai_korea_spec.ci }
      column: korea_spec_user_id { field: chai_korea_spec.user_id }
      column: payment_id { field: chai_payment.id }
      column: payment_user_id { field: chai_payment.user_id }
      column: payment_status { field: chai_payment.status }
      column: payment_created_at { field: chai_payment.created_raw }
      column: payment_updated_at { field: chai_payment.updated_raw }
      column: payment_checkout_amount { field: chai_payment.checkout_amount }
      column: payment_charging_amount { field: chai_payment.charging_amount }
      column: payment_cashback_amount { field: chai_payment.cashback_amount }
      column: payment_billing_amount { field: chai_payment.billing_amount }
      column: payment_canceled_amount { field: chai_payment.canceled_amount }
      column: merchant_id { field: chai_merchant.id }
      column: merchant_name { field: chai_merchant.name }
    }
  }
  dimension: plcc_card_application_id {
    type: string
  }
  dimension: plcc_card_application_user_id {
    type: string
  }
  dimension: plcc_card_application_status {
    type: string
  }
  dimension: plcc_card_application_created_date {
    type: date
  }
  dimension_group: plcc_card_application_created_at {
    type: time
  }
  dimension_group: plcc_card_application_updated_at {
    type: time
  }
  dimension: korea_spec_user_di {
    type: string
  }
  dimension: korea_spec_user_ci {
    type: string
  }
  dimension: korea_spec_user_id {
    type: string
  }
  dimension: payment_id {
    type: string
  }
  dimension: payment_user_id {
    type: string
  }
  dimension: payment_status {
    type: string
  }
  dimension: payment_created_at {
    type: string
  }
  dimension: payment_updated_at {
    type: string
  }
  dimension: payment_checkout_amount {
    type: string
  }
  dimension: payment_charging_amount {
    type: string
  }
  dimension: payment_cashback_amount {
    type: string
  }
  dimension: payment_billing_amount {
    type: string
  }
  dimension: payment_canceled_amount {
    type: string
  }
  dimension: merchant_id {
    type: string
  }
  dimension: merchant_name {
    type: string
  }
  measure: applied_plcc_users {
    type: count_distinct
    description: "# of user who apply plcc credit card"
    filters: [
      plcc_card_application_status: "applied",
    ]
    sql: plcc_card_application_user_id;;
  }
  measure: rejected_plcc_users {
    type: count_distinct
    description: "# of user who are rejected from issuing plcc credit card"
    filters: [
      plcc_card_application_status: "reject",
    ]
    sql: plcc_card_application_user_id;;
  }
  measure: confiremd_plcc_users {
    type: count_distinct
    description: "# of user who are applied and confirmed to issue plcc credit card"
    filters: [
      plcc_card_application_status: "confirmed",
    ]
    sql: plcc_card_application_user_id;;
  }
  measure: plcc_users_who_made_payment {
    type: count_distinct
    description: "# of user who made payment at least once with plcc credit card"
    filters: [
      plcc_card_application_status: "confirmed",
      merchant_name: "차이 신용카드"
    ]
    sql: plcc_card_application_user_id;;
  }
  measure: payment_total_charging_amount {
    type: sum
    sql: coalesce(${payment_charging_amount},0) ;;
  }
  measure: payment_total_checkout_amount {
    type: sum
    sql: coalesce(${payment_checkout_amount},0) ;;
  }
  measure: payment_total_cashback_amount {
    type: sum
    sql: coalesce(${payment_cashback_amount},0) ;;
  }
  measure: payment_total_billing_amount {
    type: sum
    sql: coalesce(${payment_billing_amount},0) ;;
  }
}
