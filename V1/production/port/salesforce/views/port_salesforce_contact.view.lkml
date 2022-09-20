view: port_salesforce_contact {
  derived_table: {
    sql: SELECT *
      FROM `port-thirdparty-prod.salesforce.contact`
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

  dimension: account_id {
    type: string
    sql: ${TABLE}.account_id ;;
  }

  dimension: activity_metric_id {
    type: string
    sql: ${TABLE}.activity_metric_id ;;
  }

  dimension: activity_metric_rollup_id {
    type: string
    sql: ${TABLE}.activity_metric_rollup_id ;;
  }

  dimension: birthdate {
    type: date
    datatype: date
    sql: ${TABLE}.birthdate ;;
  }

  dimension: created_by_id {
    type: string
    sql: ${TABLE}.created_by_id ;;
  }

  dimension_group: created_date {
    type: time
    sql: ${TABLE}.created_date ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: do_not_call {
    type: yesno
    sql: ${TABLE}.do_not_call ;;
  }

  dimension_group: email_bounced_date {
    type: time
    sql: ${TABLE}.email_bounced_date ;;
  }

  dimension: email_bounced_reason {
    type: string
    sql: ${TABLE}.email_bounced_reason ;;
  }

  dimension: fax {
    type: string
    sql: ${TABLE}.fax ;;
  }

  dimension: has_opted_out_of_email {
    type: yesno
    sql: ${TABLE}.has_opted_out_of_email ;;
  }

  dimension: has_opted_out_of_fax {
    type: yesno
    sql: ${TABLE}.has_opted_out_of_fax ;;
  }

  dimension: individual_id {
    type: string
    sql: ${TABLE}.individual_id ;;
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.is_deleted ;;
  }

  dimension: is_email_bounced {
    type: yesno
    sql: ${TABLE}.is_email_bounced ;;
  }

  dimension: iseeit_champion_c {
    type: string
    sql: ${TABLE}.iseeit_champion_c ;;
  }

  dimension: iseeit_decision_maker_c {
    type: string
    sql: ${TABLE}.iseeit_decision_maker_c ;;
  }

  dimension: iseeit_languages_c {
    type: string
    sql: ${TABLE}.iseeit_languages_c ;;
  }

  dimension: iseeit_level_c {
    type: string
    sql: ${TABLE}.iseeit_level_c ;;
  }

  dimension: iseeit_parent_contact_c {
    type: string
    sql: ${TABLE}.iseeit_parent_contact_c ;;
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

  dimension_group: last_curequest_date {
    type: time
    sql: ${TABLE}.last_curequest_date ;;
  }

  dimension_group: last_cuupdate_date {
    type: time
    sql: ${TABLE}.last_cuupdate_date ;;
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

  dimension: lead_source {
    type: string
    sql: ${TABLE}.lead_source ;;
  }

  dimension: mailing_city {
    type: string
    sql: ${TABLE}.mailing_city ;;
  }

  dimension: mailing_country {
    type: string
    sql: ${TABLE}.mailing_country ;;
  }

  dimension: mailing_geocode_accuracy {
    type: string
    sql: ${TABLE}.mailing_geocode_accuracy ;;
  }

  dimension: mailing_latitude {
    type: number
    sql: ${TABLE}.mailing_latitude ;;
  }

  dimension: mailing_longitude {
    type: number
    sql: ${TABLE}.mailing_longitude ;;
  }

  dimension: mailing_postal_code {
    type: string
    sql: ${TABLE}.mailing_postal_code ;;
  }

  dimension: mailing_state {
    type: string
    sql: ${TABLE}.mailing_state ;;
  }

  dimension: mailing_street {
    type: string
    sql: ${TABLE}.mailing_street ;;
  }

  dimension: master_record_id {
    type: string
    sql: ${TABLE}.master_record_id ;;
  }

  dimension: mobile_phone {
    type: string
    sql: ${TABLE}.mobile_phone ;;
  }

  dimension: other_city {
    type: string
    sql: ${TABLE}.other_city ;;
  }

  dimension: other_country {
    type: string
    sql: ${TABLE}.other_country ;;
  }

  dimension: other_geocode_accuracy {
    type: string
    sql: ${TABLE}.other_geocode_accuracy ;;
  }

  dimension: other_latitude {
    type: number
    sql: ${TABLE}.other_latitude ;;
  }

  dimension: other_longitude {
    type: number
    sql: ${TABLE}.other_longitude ;;
  }

  dimension: other_phone {
    type: string
    sql: ${TABLE}.other_phone ;;
  }

  dimension: other_postal_code {
    type: string
    sql: ${TABLE}.other_postal_code ;;
  }

  dimension: other_state {
    type: string
    sql: ${TABLE}.other_state ;;
  }

  dimension: other_street {
    type: string
    sql: ${TABLE}.other_street ;;
  }

  dimension: owner_id {
    type: string
    sql: ${TABLE}.owner_id ;;
  }

  dimension: photo_url {
    type: string
    sql: ${TABLE}.photo_url ;;
  }

  dimension: reports_to_id {
    type: string
    sql: ${TABLE}.reports_to_id ;;
  }

  dimension: salutation {
    type: string
    sql: ${TABLE}.salutation ;;
  }

  dimension_group: system_modstamp {
    type: time
    sql: ${TABLE}.system_modstamp ;;
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

  set: detail {
    fields: [
      id,
      _fivetran_synced_time,
      account_id,
      activity_metric_id,
      activity_metric_rollup_id,
      birthdate,
      created_by_id,
      created_date_time,
      department,
      description,
      do_not_call,
      email_bounced_date_time,
      email_bounced_reason,
      fax,
      has_opted_out_of_email,
      has_opted_out_of_fax,
      individual_id,
      is_deleted,
      is_email_bounced,
      iseeit_champion_c,
      iseeit_decision_maker_c,
      iseeit_languages_c,
      iseeit_level_c,
      iseeit_parent_contact_c,
      jigsaw,
      jigsaw_contact_id,
      last_activity_date,
      last_curequest_date_time,
      last_cuupdate_date_time,
      last_modified_by_id,
      last_modified_date_time,
      last_referenced_date_time,
      last_viewed_date_time,
      lead_source,
      mailing_city,
      mailing_country,
      mailing_geocode_accuracy,
      mailing_latitude,
      mailing_longitude,
      mailing_postal_code,
      mailing_state,
      mailing_street,
      master_record_id,
      mobile_phone,
      other_city,
      other_country,
      other_geocode_accuracy,
      other_latitude,
      other_longitude,
      other_phone,
      other_postal_code,
      other_state,
      other_street,
      owner_id,
      photo_url,
      reports_to_id,
      salutation,
      system_modstamp_time,
      mzcdcxrmb_remember_external_key_c,
      mzcdcxrmb_remember_front_image_url_c,
      mzcdcxrmb_remember_updated_at_c_time
    ]
  }
}
