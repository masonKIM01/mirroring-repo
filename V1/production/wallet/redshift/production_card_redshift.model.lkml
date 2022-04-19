connection: "chai_redshift_production"
include: "/V1/production/wallet/redshift/views/**/*.view.lkml"
# include V0 views that will be deprecated
include: "/V0(will_be_deprecated)/**/*.view.lkml"

datagroup: daily_datagroup {
  sql_trigger: "SELECT EXTRACT(DAY FROM NOW())" ;;
  description: "trigger query daily"
}

explore: chai_boost {}
explore: prejoined_payment_pdt{}
explore: chai_user {}
explore: chai_bolt_history {}
explore: chai_boost_up {}
explore: chai_merchant {}
explore: chai_card {}
explore: amplitude_raw_events {}
