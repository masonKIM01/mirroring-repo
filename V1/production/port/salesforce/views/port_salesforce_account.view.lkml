view: port_salesforce_account {
  derived_table: {
    sql: SELECT *
      FROM
      `port-thirdparty-prod.salesforce.account`
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

  dimension: account_source {
    type: string
    sql: ${TABLE}.account_source ;;
  }

  dimension: activity_metric_id {
    type: string
    sql: ${TABLE}.activity_metric_id ;;
  }

  dimension: activity_metric_rollup_id {
    type: string
    sql: ${TABLE}.activity_metric_rollup_id ;;
  }

  dimension: am_c {
    type: string
    sql: ${TABLE}.am_c ;;
  }

  dimension: am_transferdate_c {
    type: date
    datatype: date
    sql: ${TABLE}.am_transferdate_c ;;
  }

  dimension: amtransferred_c {
    type: yesno
    sql: ${TABLE}.amtransferred_c ;;
  }

  dimension: annual_revenue {
    type: number
    sql: ${TABLE}.annual_revenue ;;
  }

  dimension: billing_city {
    type: string
    sql: ${TABLE}.billing_city ;;
  }

  dimension: billing_country {
    type: string
    sql: ${TABLE}.billing_country ;;
  }

  dimension: billing_geocode_accuracy {
    type: string
    sql: ${TABLE}.billing_geocode_accuracy ;;
  }

  dimension: billing_latitude {
    type: number
    sql: ${TABLE}.billing_latitude ;;
  }

  dimension: billing_longitude {
    type: number
    sql: ${TABLE}.billing_longitude ;;
  }

  dimension: billing_postal_code {
    type: string
    sql: ${TABLE}.billing_postal_code ;;
  }

  dimension: billing_state {
    type: string
    sql: ${TABLE}.billing_state ;;
  }

  dimension: billing_street {
    type: string
    sql: ${TABLE}.billing_street ;;
  }

  dimension: business_number_c {
    type: string
    sql: ${TABLE}.business_number_c ;;
  }

  dimension: ceo_c {
    type: string
    sql: ${TABLE}.ceo_c ;;
  }

  dimension: color_code_c {
    type: string
    sql: ${TABLE}.color_code_c ;;
  }

  dimension: created_by_id {
    type: string
    sql: ${TABLE}.created_by_id ;;
  }

  dimension_group: created_date {
    type: time
    sql: ${TABLE}.created_date ;;
  }

  dimension: customer_status_c {
    type: string
    sql: ${TABLE}.customer_status_c ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: fax {
    type: string
    sql: ${TABLE}.fax ;;
  }

  dimension: health_score_c {
    type: string
    sql: ${TABLE}.health_score_c ;;
  }

  dimension: industry {
    type: string
    sql: ${TABLE}.industry ;;
  }

  dimension: industry_general_del_c {
    type: string
    sql: ${TABLE}.industry_general_del_c ;;
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.is_deleted ;;
  }

  dimension: iseeit_is_hierarchy_c {
    type: yesno
    sql: ${TABLE}.iseeit_is_hierarchy_c ;;
  }

  dimension: iseeit_org_chart_contacts_c {
    type: number
    sql: ${TABLE}.iseeit_org_chart_contacts_c ;;
  }

  dimension: jigsaw {
    type: string
    sql: ${TABLE}.jigsaw ;;
  }

  dimension: jigsaw_company_id {
    type: string
    sql: ${TABLE}.jigsaw_company_id ;;
  }

  dimension: last_activity_date {
    type: date
    datatype: date
    sql: ${TABLE}.last_activity_date ;;
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

  dimension: master_record_id {
    type: string
    sql: ${TABLE}.master_record_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: number_of_employees {
    type: number
    sql: ${TABLE}.number_of_employees ;;
  }

  dimension: opportunity_list_c {
    type: string
    sql: ${TABLE}.opportunity_list_c ;;
  }

  dimension: owner_id {
    type: string
    sql: ${TABLE}.owner_id ;;
  }

  dimension: parent_id {
    type: string
    sql: ${TABLE}.parent_id ;;
  }

  dimension: pgname_c {
    type: string
    sql: ${TABLE}.pgname_c ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }

  dimension: photo_url {
    type: string
    sql: ${TABLE}.photo_url ;;
  }

  dimension: prospect_status_c {
    type: string
    sql: ${TABLE}.prospect_status_c ;;
  }

  dimension: quip_c {
    type: string
    sql: ${TABLE}.quip_c ;;
  }

  dimension: record_type_id {
    type: string
    sql: ${TABLE}.record_type_id ;;
  }

  dimension: related_contact_c {
    type: string
    sql: ${TABLE}.related_contact_c ;;
  }

  dimension: service_name_c {
    type: string
    sql: ${TABLE}.service_name_c ;;
  }

  dimension: shipping_city {
    type: string
    sql: ${TABLE}.shipping_city ;;
  }

  dimension: shipping_country {
    type: string
    sql: ${TABLE}.shipping_country ;;
  }

  dimension: shipping_geocode_accuracy {
    type: string
    sql: ${TABLE}.shipping_geocode_accuracy ;;
  }

  dimension: shipping_latitude {
    type: number
    sql: ${TABLE}.shipping_latitude ;;
  }

  dimension: shipping_longitude {
    type: number
    sql: ${TABLE}.shipping_longitude ;;
  }

  dimension: shipping_postal_code {
    type: string
    sql: ${TABLE}.shipping_postal_code ;;
  }

  dimension: shipping_state {
    type: string
    sql: ${TABLE}.shipping_state ;;
  }

  dimension: shipping_street {
    type: string
    sql: ${TABLE}.shipping_street ;;
  }

  dimension: sic_desc {
    type: string
    sql: ${TABLE}.sic_desc ;;
  }

  dimension: special_note_c {
    type: string
    sql: ${TABLE}.special_note_c ;;
  }

  dimension_group: system_modstamp {
    type: time
    sql: ${TABLE}.system_modstamp ;;
  }

  dimension: tramount_c {
    type: number
    sql: ${TABLE}.tramount_c ;;
  }

  dimension: txdate_c {
    type: date
    datatype: date
    sql: ${TABLE}.txdate_c ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: user_id_c {
    type: string
    sql: ${TABLE}.user_id_c ;;
  }

  dimension: website {
    type: string
    sql: ${TABLE}.website ;;
  }

  set: detail {
    fields: [
      id,
      _fivetran_synced_time,
      account_source,
      activity_metric_id,
      activity_metric_rollup_id,
      am_c,
      am_transferdate_c,
      amtransferred_c,
      annual_revenue,
      billing_city,
      billing_country,
      billing_geocode_accuracy,
      billing_latitude,
      billing_longitude,
      billing_postal_code,
      billing_state,
      billing_street,
      business_number_c,
      ceo_c,
      color_code_c,
      created_by_id,
      created_date_time,
      customer_status_c,
      description,
      fax,
      health_score_c,
      industry,
      industry_general_del_c,
      is_deleted,
      iseeit_is_hierarchy_c,
      iseeit_org_chart_contacts_c,
      jigsaw,
      jigsaw_company_id,
      last_activity_date,
      last_modified_by_id,
      last_modified_date_time,
      last_referenced_date_time,
      last_viewed_date_time,
      master_record_id,
      name,
      number_of_employees,
      opportunity_list_c,
      owner_id,
      parent_id,
      pgname_c,
      phone,
      photo_url,
      prospect_status_c,
      quip_c,
      record_type_id,
      related_contact_c,
      service_name_c,
      shipping_city,
      shipping_country,
      shipping_geocode_accuracy,
      shipping_latitude,
      shipping_longitude,
      shipping_postal_code,
      shipping_state,
      shipping_street,
      sic_desc,
      special_note_c,
      system_modstamp_time,
      tramount_c,
      txdate_c,
      type,
      user_id_c,
      website
    ]
  }
}
