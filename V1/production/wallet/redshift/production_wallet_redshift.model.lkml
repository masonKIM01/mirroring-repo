connection: "chai_redshift_production"
include: "/V1/production/wallet/redshift/views/**/*.view.lkml"
# include V0 views that will be deprecated
include: "/V0(will_be_deprecated)/**/*.view.lkml"

# https://docs.looker.com/reference/view-params/sql_trigger_value#examples
datagroup: daily_datagroup {
  # sql_trigger: "SELECT DATE_PART('hour', GETDATE())" ;;
  interval_trigger: "1 hour"
  max_cache_age: "1 hour"
  description: "Run query every hour"
}

explore: chai_mission_reward_boost_campaign {
  description: "mission boost infos"
}
explore: chai_payment {
  description: "payment infos"
}
explore: chai_boost {
  description: "boost infos"
}
explore: chai_user {
  description: "user infos"
}
explore: card_card_info {
  description: "card detail infos"
}
explore: card_card_accident_receipt_history {
  description: "card shipping infos"
}
explore: chai_bolt_history {
  description: "bolt usage history infos"
}
explore: chai_boost_up {
  description: "강화(boost up) infos"
}
explore: chai_merchant {
  description: "merhant infos"
}
explore: chai_card {
  description: "debit card infos"
}
explore: chai_topup  {
  description: "topup (charge, withraw)"
}
explore: chai_churn_user {
  description: "churn user infos"
}

explore: plcc_hana_card {
  label: "PLCC - Hana credit card"
  description: "Information of hana credit card issurance"
}
explore: amplitude_raw_events {
  description: "amplitude infos"
}
explore: prejoined_plcc_pdt {
  description: "table that can check all infos related to plcc"
}

explore: prejoined_boost {
  description: "table that can check all infos related to boost"
  from: chai_boost
  join: chai_boost_promotion_policy {
    type: left_outer
    sql_on: ${prejoined_boost.boost_promotion_id} = ${chai_boost_promotion_policy.id} ;;
    relationship: one_to_one
  }
  join: chai_brand {
    type: left_outer
    sql_on: ${chai_boost_promotion_policy.brand_id} = ${chai_brand.id} ;;
    relationship: one_to_one
  }
  join: chai_payment {
    type: left_outer
    sql_on: ${prejoined_boost.payment_id}= ${chai_payment.id} ;;
    relationship: many_to_one
  }
  join: chai_boost_up {
    type: left_outer
    sql_on: ${chai_boost_up.boost_id} = ${prejoined_boost.id} ;;
    relationship: one_to_one
  }
}
# Todo(@Simon, @Mason): table belows use deprecated views. needs to be updated
explore: prejoined_plcc_card_application {
  description: "table that can check all infos related to plcc"
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

explore: prejoined_payment_pdt_with_ad_spend {
  description: "table that can check all infos related to plcc"
  from: prejoined_payment_pdt
  join: chai_user {
    type: left_outer
    sql_on: ${chai_user.id} = ${prejoined_payment_pdt_with_ad_spend.payment_user_id} ;;
    relationship: many_to_one
  }

  join: chai_card {
    type: left_outer
    sql_on: ${prejoined_payment_pdt_with_ad_spend.payment_user_id} = ${chai_card.user_id} ;;
    relationship: many_to_one
  }

  join: chai_boost_campaign_target_type {
    type: left_outer
    sql_on: ${chai_boost_campaign_target_type.boost_campaign_id} = ${prejoined_payment_pdt_with_ad_spend.boost_campaign_id} ;;
    relationship: one_to_one
  }

  join: table_ad_spend_v2{
    type: left_outer
    sql_on: ${table_ad_spend_v2.payment_id} = ${prejoined_payment_pdt_with_ad_spend.payment_id} ;;
    relationship: one_to_one
  }

  join: table_adspend_owner {
    type: left_outer
    sql_on: ${prejoined_payment_pdt_with_ad_spend.brand_name} = ${table_adspend_owner.merchant_name} ;;
    relationship: many_to_one
  }

  join: table_delayed_cashback {
    type: left_outer
    sql_on: ${prejoined_payment_pdt_with_ad_spend.payment_id} = ${table_delayed_cashback.payment_id} ;;
    relationship: one_to_one
  }

  join: table_plcc_user {
    type: left_outer
    sql_on: ${prejoined_payment_pdt_with_ad_spend.payment_user_id} = ${table_plcc_user.user_id} ;;
    relationship: many_to_one
  }

  join: table_merchant_adspend {
    type: left_outer
    sql_on: ${prejoined_payment_pdt_with_ad_spend.brand_name} = ${table_merchant_adspend.merchant_name}
      and ${prejoined_payment_pdt_with_ad_spend.boost_promotion_policy_title} = ${table_merchant_adspend.title}
      ;;
    relationship: many_to_one
  }
}
