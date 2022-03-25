# There is same connection defined in V0/chai_card_prod/chai_card_prod.model.lkml
# And it cause below error. we need to fix this after migration
# There are some issues with this LookML code that will cause aspects of your data model to behave unexpectedly. These should be repaired to ensure your data model works as intended.
# This "connection" is overridden by a "connection" declared in a file included below

connection: "chai_redshift_production"
include: "views/**/*.view.lkml"

datagroup: hourly_datagroup {
  max_cache_age: "2 hours"
  sql_trigger: "SELECT EXTRACT(HOUR FROM NOW())" ;;
  description: "cache data for max 2 hours and refersh it every 1 hour"
}

explore: chai_card_chai_prod_public_boost {}
explore: prejoined_payment_pdt{}
