connection: "chai_redshift_production"
include: "views/**/*.view.lkml"

datagroup: daily_datagroup {
  sql_trigger: "SELECT EXTRACT(DAY FROM NOW())" ;;
  description: "trigger query daily"
}

explore: chai_card_chai_prod_public_boost {}
explore: prejoined_payment_pdt{}
