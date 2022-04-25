connection: "chai_redshift_production"
include: "/V1/production/wallet/redshift/views/**/*.view.lkml"
# include V0 views that will be deprecated
include: "/V0(will_be_deprecated)/**/*.view.lkml"

# https://docs.looker.com/reference/view-params/sql_trigger_value#examples
datagroup: daily_datagroup {
  sql_trigger: "SELECT FLOOR((EXTRACT(epoch from GETDATE()) - 60*60*19)/(60*60*24))" ;;
  description: "Trigger query daily at 7PM UTC. Replace the “19” with the hour of day you would like the regeneration to occur"
}

explore: chai_boost {}
explore: chai_user {}
explore: card_card_info {}
explore: card_card_accident_receipt_history {}
explore: chai_bolt_history {}
explore: chai_boost_up {}
explore: chai_merchant {}
explore: chai_card {}
explore: amplitude_raw_events {}
explore: prejoined_payment_pdt {}
explore: prejoined_boost {
  from: table_boost
  join: chai_payment {
    type: left_outer
    sql_on: ${prejoined_boost.payment_id}= ${chai_payment.id} ;;
    relationship: many_to_one
  }
}
explore: prejoined_plcc_card_application {
  from: plcc_card_application
  join: chai_card_user {
    type: left_outer
    sql_on: ${prejoined_plcc_card_application.user_id} = ${chai_card_user.id} ;;
    relationship: many_to_one
  }
  join: chai_korea_spec {
    type: left_outer
    sql_on: ${chai_korea_spec.ci}= ${chai_card_user.ci} ;;
    relationship: many_to_one
  }
  join: chai_user {
    type: left_outer
    sql_on: ${chai_user.id} = ${chai_korea_spec.user_id} ;;
    relationship: many_to_one
  }
  join: prejoined_payment_pdt {
    type: left_outer
    sql_on: ${prejoined_payment_pdt.payment_user_id} = ${chai_user.id} ;;
    relationship: many_to_one
  }
  join: table_ad_spend_v2{
    type: left_outer
    sql_on: ${table_ad_spend_v2.payment_id} = ${prejoined_payment_pdt.payment_id} ;;
    relationship: one_to_one
  }

  join: table_adspend_owner {
    type: left_outer
    sql_on: ${prejoined_payment_pdt.brand_name} = ${table_adspend_owner.merchant_name} ;;
    relationship: one_to_one
  }
  join: table_delayed_cashback {
    type: left_outer
    sql_on: ${prejoined_payment_pdt.payment_id} = ${table_delayed_cashback.payment_id} ;;
    relationship: one_to_one
  }
  join: table_plcc_user {
    type: left_outer
    sql_on: ${prejoined_payment_pdt.payment_user_id} = ${table_plcc_user.user_id} ;;
    relationship: one_to_one
  }
}
