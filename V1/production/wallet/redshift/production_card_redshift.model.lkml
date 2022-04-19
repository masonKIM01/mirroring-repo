connection: "chai_redshift_production"
include: "/V1/production/wallet/redshift/views/**/*.view.lkml"
# include V0 views that will be deprecated
include: "/V0(will_be_deprecated)/**/*.view.lkml"

datagroup: daily_datagroup {
  sql_trigger: "SELECT EXTRACT(DAY FROM NOW())" ;;
  description: "trigger query daily"
}

explore: chai_boost {}
explore: chai_user {}
explore: chai_bolt_history {}
explore: chai_boost_up {}
explore: chai_merchant {}
explore: chai_card {}
explore: amplitude_raw_events {}
explore: joined_payment_pdt{
  from: full_outer_joined_payment_boost
  always_filter: {
    filters: [joined_payment_pdt.boost_id: "NOT NULL"]
  }
}
explore: joined_boost_pdt {
  from: full_outer_joined_payment_boost
  always_filter: {
    filters: [joined_boost_pdt.boost_id: "NOT NULL"]
  }
}
