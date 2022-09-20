view: port_salesforce_lead {
  derived_table: {
    sql: SELECT *
      FROM `port-thirdparty-prod.salesforce.lead`
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

  dimension: activity_metric_id {
    type: string
    sql: ${TABLE}.activity_metric_id ;;
  }

  dimension: activity_metric_rollup_id {
    type: string
    sql: ${TABLE}.activity_metric_rollup_id ;;
  }

  dimension: already_has_pg_c {
    type: yesno
    sql: ${TABLE}.already_has_pg_c ;;
  }

  dimension: annual_revenue {
    type: number
    sql: ${TABLE}.annual_revenue ;;
  }

  dimension: biz_number_c {
    type: string
    sql: ${TABLE}.biz_number_c ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: company {
    type: string
    sql: ${TABLE}.company ;;
  }

  dimension: contacted_by_c {
    type: string
    sql: ${TABLE}.contacted_by_c ;;
  }

  dimension: converted_account_id {
    type: string
    sql: ${TABLE}.converted_account_id ;;
  }

  dimension: converted_contact_id {
    type: string
    sql: ${TABLE}.converted_contact_id ;;
  }

  dimension: converted_date {
    type: date
    datatype: date
    sql: ${TABLE}.converted_date ;;
  }

  dimension: converted_opportunity_id {
    type: string
    sql: ${TABLE}.converted_opportunity_id ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension: created_by_id {
    type: string
    sql: ${TABLE}.created_by_id ;;
  }

  dimension_group: created_date {
    type: time
    sql: ${TABLE}.created_date ;;
  }

  dimension: cs_contact_date_c {
    type: date
    datatype: date
    sql: ${TABLE}.cs_contact_date_c ;;
  }

  dimension: cs_member_c {
    type: string
    sql: ${TABLE}.cs_member_c ;;
  }

  dimension: cs_note_c {
    type: string
    sql: ${TABLE}.cs_note_c ;;
  }

  dimension: cs_or_bd_c {
    type: string
    sql: ${TABLE}.cs_or_bd_c ;;
  }

  dimension: cs_status_c {
    type: string
    sql: ${TABLE}.cs_status_c ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: ec_hosting_c {
    type: string
    sql: ${TABLE}.ec_hosting_c ;;
  }

  dimension_group: email_bounced_date {
    type: time
    sql: ${TABLE}.email_bounced_date ;;
  }

  dimension: email_bounced_reason {
    type: string
    sql: ${TABLE}.email_bounced_reason ;;
  }

  dimension: general_email_c {
    type: string
    sql: ${TABLE}.general_email_c ;;
  }

  dimension: geocode_accuracy {
    type: string
    sql: ${TABLE}.geocode_accuracy ;;
  }

  dimension: iamport_method_c {
    type: string
    sql: ${TABLE}.iamport_method_c ;;
  }

  dimension: individual_id {
    type: string
    sql: ${TABLE}.individual_id ;;
  }

  dimension: industry {
    type: string
    sql: ${TABLE}.industry ;;
  }

  dimension: industry_general_c {
    type: string
    sql: ${TABLE}.industry_general_c ;;
  }

  dimension: inquiry_type_c {
    type: string
    sql: ${TABLE}.inquiry_type_c ;;
  }

  dimension: interest_in_crossborder_c {
    type: yesno
    sql: ${TABLE}.interest_in_crossborder_c ;;
  }

  dimension: intergration_type_c {
    type: string
    sql: ${TABLE}.intergration_type_c ;;
  }

  dimension: investment_c {
    type: string
    sql: ${TABLE}.investment_c ;;
  }

  dimension: is_converted {
    type: yesno
    sql: ${TABLE}.is_converted ;;
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.is_deleted ;;
  }

  dimension: is_unread_by_owner {
    type: yesno
    sql: ${TABLE}.is_unread_by_owner ;;
  }

  dimension: iseeit_score_c {
    type: number
    sql: ${TABLE}.iseeit_score_c ;;
  }

  dimension: jigsaw {
    type: string
    sql: ${TABLE}.jigsaw ;;
  }

  dimension: jigsaw_contact_id {
    type: string
    sql: ${TABLE}.jigsaw_contact_id ;;
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

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: lead_source {
    type: string
    sql: ${TABLE}.lead_source ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: master_record_id {
    type: string
    sql: ${TABLE}.master_record_id ;;
  }

  dimension: mid_additional_guide_c {
    type: string
    sql: ${TABLE}.mid_additional_guide_c ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: need_recontact_c {
    type: yesno
    sql: ${TABLE}.need_recontact_c ;;
  }

  dimension: number_of_employees {
    type: number
    sql: ${TABLE}.number_of_employees ;;
  }

  dimension: online_tpv_range_c {
    type: string
    sql: ${TABLE}.online_tpv_range_c ;;
  }

  dimension: other_inquiry_c {
    type: string
    sql: ${TABLE}.other_inquiry_c ;;
  }

  dimension: owner_id {
    type: string
    sql: ${TABLE}.owner_id ;;
  }

  dimension: pg_already_register_c {
    type: string
    sql: ${TABLE}.pg_already_register_c ;;
  }

  dimension: pg_c {
    type: string
    sql: ${TABLE}.pg_c ;;
  }

  dimension: pgapplication_c {
    type: string
    sql: ${TABLE}.pgapplication_c ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }

  dimension: photo_url {
    type: string
    sql: ${TABLE}.photo_url ;;
  }

  dimension: poc_3_c {
    type: string
    sql: ${TABLE}.poc_3_c ;;
  }

  dimension: poc_4_c {
    type: yesno
    sql: ${TABLE}.poc_4_c ;;
  }

  dimension: poc_c {
    type: string
    sql: ${TABLE}.poc_c ;;
  }

  dimension: poc_name_c {
    type: string
    sql: ${TABLE}.poc_name_c ;;
  }

  dimension: poc_source_c {
    type: string
    sql: ${TABLE}.poc_source_c ;;
  }

  dimension: poc_title_c {
    type: string
    sql: ${TABLE}.poc_title_c ;;
  }

  dimension: postal_code {
    type: string
    sql: ${TABLE}.postal_code ;;
  }

  dimension: rating {
    type: string
    sql: ${TABLE}.rating ;;
  }

  dimension: recomm_c {
    type: yesno
    sql: ${TABLE}.recomm_c ;;
  }

  dimension: salutation {
    type: string
    sql: ${TABLE}.salutation ;;
  }

  dimension: seconnd_contact_date_c {
    type: date
    datatype: date
    sql: ${TABLE}.seconnd_contact_date_c ;;
  }

  dimension: size_c {
    type: string
    sql: ${TABLE}.size_c ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: street {
    type: string
    sql: ${TABLE}.street ;;
  }

  dimension_group: system_modstamp {
    type: time
    sql: ${TABLE}.system_modstamp ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: tramount_c {
    type: number
    sql: ${TABLE}.tramount_c ;;
  }

  dimension: transaction_amount_c {
    type: number
    sql: ${TABLE}.transaction_amount_c ;;
  }

  dimension: utm_campaign_c {
    type: string
    sql: ${TABLE}.utm_campaign_c ;;
  }

  dimension: utm_medium_c {
    type: string
    sql: ${TABLE}.utm_medium_c ;;
  }

  dimension: utm_source_c {
    type: string
    sql: ${TABLE}.utm_source_c ;;
  }

  dimension: website {
    type: string
    sql: ${TABLE}.website ;;
  }

  dimension: mzcdcxrmb_remember_external_key_c {
    type: string
    sql: ${TABLE}.mzcdcxrmb_remember_external_key_c ;;
  }

  dimension: mzcdcxrmb_remember_front_image_url_c {
    type: string
    sql: ${TABLE}.mzcdcxrmb_remember_front_image_url_c ;;
  }

  dimension_group: mzcdcxrmb_remember_updated_at_c {
    type: time
    sql: ${TABLE}.mzcdcxrmb_remember_updated_at_c ;;
  }

  dimension: location {
    type: location
    sql_latitude: ${TABLE}.latitude ;;
    sql_longitude: ${TABLE}.longitude ;;
  }

  set: detail {
    fields: [
      id,
      _fivetran_synced_time,
      activity_metric_id,
      activity_metric_rollup_id,
      already_has_pg_c,
      annual_revenue,
      biz_number_c,
      city,
      company,
      contacted_by_c,
      converted_account_id,
      converted_contact_id,
      converted_date,
      converted_opportunity_id,
      country,
      created_by_id,
      created_date_time,
      cs_contact_date_c,
      cs_member_c,
      cs_note_c,
      cs_or_bd_c,
      cs_status_c,
      description,
      ec_hosting_c,
      email_bounced_date_time,
      email_bounced_reason,
      general_email_c,
      geocode_accuracy,
      iamport_method_c,
      individual_id,
      industry,
      industry_general_c,
      inquiry_type_c,
      interest_in_crossborder_c,
      intergration_type_c,
      investment_c,
      is_converted,
      is_deleted,
      is_unread_by_owner,
      iseeit_score_c,
      jigsaw,
      jigsaw_contact_id,
      last_activity_date,
      last_modified_by_id,
      last_modified_date_time,
      last_referenced_date_time,
      last_viewed_date_time,
      latitude,
      lead_source,
      longitude,
      master_record_id,
      mid_additional_guide_c,
      name,
      need_recontact_c,
      number_of_employees,
      online_tpv_range_c,
      other_inquiry_c,
      owner_id,
      pg_already_register_c,
      pg_c,
      pgapplication_c,
      phone,
      photo_url,
      poc_3_c,
      poc_4_c,
      poc_c,
      poc_name_c,
      poc_source_c,
      poc_title_c,
      postal_code,
      rating,
      recomm_c,
      salutation,
      seconnd_contact_date_c,
      size_c,
      state,
      status,
      street,
      system_modstamp_time,
      title,
      tramount_c,
      transaction_amount_c,
      utm_campaign_c,
      utm_medium_c,
      utm_source_c,
      website,
      mzcdcxrmb_remember_external_key_c,
      mzcdcxrmb_remember_front_image_url_c,
      mzcdcxrmb_remember_updated_at_c_time,
      location
    ]
  }
}
