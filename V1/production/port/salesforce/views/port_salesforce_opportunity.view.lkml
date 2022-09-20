view: port_salesforce_opportunity {
  derived_table: {
    sql: SELECT *
      FROM `port-thirdparty-prod.salesforce.opportunity`
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

  dimension: am_1_st_meeting_check_c {
    type: yesno
    sql: ${TABLE}.am_1_st_meeting_check_c ;;
  }

  dimension: am_2_nd_meeting_check_c {
    type: yesno
    sql: ${TABLE}.am_2_nd_meeting_check_c ;;
  }

  dimension: am_check_c {
    type: yesno
    sql: ${TABLE}.am_check_c ;;
  }

  dimension: am_note_c {
    type: string
    sql: ${TABLE}.am_note_c ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension: bottleneck_c {
    type: string
    sql: ${TABLE}.bottleneck_c ;;
  }

  dimension: budget_handler_c {
    type: yesno
    sql: ${TABLE}.budget_handler_c ;;
  }

  dimension: campaign_id {
    type: string
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: close_date {
    type: date
    datatype: date
    sql: ${TABLE}.close_date ;;
  }

  dimension: commission_c {
    type: yesno
    sql: ${TABLE}.commission_c ;;
  }

  dimension: contact_c {
    type: string
    sql: ${TABLE}.contact_c ;;
  }

  dimension: contact_id {
    type: string
    sql: ${TABLE}.contact_id ;;
  }

  dimension: contract_id {
    type: string
    sql: ${TABLE}.contract_id ;;
  }

  dimension: created_by_id {
    type: string
    sql: ${TABLE}.created_by_id ;;
  }

  dimension_group: created_date {
    type: time
    sql: ${TABLE}.created_date ;;
  }

  dimension: dashboards_gsp_close_date_extensions_c {
    type: number
    sql: ${TABLE}.dashboards_gsp_close_date_extensions_c ;;
  }

  dimension: dashboards_gsp_close_date_month_extensions_c {
    type: number
    sql: ${TABLE}.dashboards_gsp_close_date_month_extensions_c ;;
  }

  dimension: dashboards_gsp_date_opportunity_was_closed_c {
    type: date
    datatype: date
    sql: ${TABLE}.dashboards_gsp_date_opportunity_was_closed_c ;;
  }

  dimension: dashboards_gsp_days_open_delete_c {
    type: number
    sql: ${TABLE}.dashboards_gsp_days_open_delete_c ;;
  }

  dimension: dashboards_gsp_last_stage_change_date_c {
    type: date
    datatype: date
    sql: ${TABLE}.dashboards_gsp_last_stage_change_date_c ;;
  }

  dimension: delay_reason_c {
    type: string
    sql: ${TABLE}.delay_reason_c ;;
  }

  dimension: delay_reason_detail_c {
    type: string
    sql: ${TABLE}.delay_reason_detail_c ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: developer_cost_saving_c {
    type: number
    sql: ${TABLE}.developer_cost_saving_c ;;
  }

  dimension: distrib_settlement_c {
    type: yesno
    sql: ${TABLE}.distrib_settlement_c ;;
  }

  dimension: drop_reason_c {
    type: string
    sql: ${TABLE}.drop_reason_c ;;
  }

  dimension: expected_live_date_when_stage_5_c {
    type: date
    datatype: date
    sql: ${TABLE}.expected_live_date_when_stage_5_c ;;
  }

  dimension: expected_revenue {
    type: number
    sql: ${TABLE}.expected_revenue ;;
  }

  dimension: expected_tpv_when_stage_5_c {
    type: number
    sql: ${TABLE}.expected_tpv_when_stage_5_c ;;
  }

  dimension: first_grade_as_c {
    type: number
    sql: ${TABLE}.first_grade_as_c ;;
  }

  dimension: first_grade_to_c {
    type: number
    sql: ${TABLE}.first_grade_to_c ;;
  }

  dimension: fiscal {
    type: string
    sql: ${TABLE}.fiscal ;;
  }

  dimension: fiscal_quarter {
    type: number
    sql: ${TABLE}.fiscal_quarter ;;
  }

  dimension: fiscal_year {
    type: number
    sql: ${TABLE}.fiscal_year ;;
  }

  dimension: forecast_category {
    type: string
    sql: ${TABLE}.forecast_category ;;
  }

  dimension: forecast_category_name {
    type: string
    sql: ${TABLE}.forecast_category_name ;;
  }

  dimension: has_open_activity {
    type: yesno
    sql: ${TABLE}.has_open_activity ;;
  }

  dimension: has_opportunity_line_item {
    type: yesno
    sql: ${TABLE}.has_opportunity_line_item ;;
  }

  dimension: has_overdue_task {
    type: yesno
    sql: ${TABLE}.has_overdue_task ;;
  }

  dimension: iamport_id_c {
    type: string
    sql: ${TABLE}.iamport_id_c ;;
  }

  dimension: iamport_signup_c {
    type: string
    sql: ${TABLE}.iamport_signup_c ;;
  }

  dimension: integration_pgdata_c {
    type: yesno
    sql: ${TABLE}.integration_pgdata_c ;;
  }

  dimension: is_closed {
    type: yesno
    sql: ${TABLE}.is_closed ;;
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.is_deleted ;;
  }

  dimension: is_private {
    type: yesno
    sql: ${TABLE}.is_private ;;
  }

  dimension: is_split {
    type: yesno
    sql: ${TABLE}.is_split ;;
  }

  dimension: is_won {
    type: yesno
    sql: ${TABLE}.is_won ;;
  }

  dimension: iseeit_competitor_name_c {
    type: string
    sql: ${TABLE}.iseeit_competitor_name_c ;;
  }

  dimension: iseeit_current_generators_c {
    type: string
    sql: ${TABLE}.iseeit_current_generators_c ;;
  }

  dimension: iseeit_current_stages_c {
    type: string
    sql: ${TABLE}.iseeit_current_stages_c ;;
  }

  dimension_group: iseeit_date_time_field_c {
    type: time
    sql: ${TABLE}.iseeit_date_time_field_c ;;
  }

  dimension: iseeit_deal_progress_score_c {
    type: number
    sql: ${TABLE}.iseeit_deal_progress_score_c ;;
  }

  dimension: iseeit_deal_type_c {
    type: string
    sql: ${TABLE}.iseeit_deal_type_c ;;
  }

  dimension: iseeit_default_forecast_image_url_c {
    type: string
    sql: ${TABLE}.iseeit_default_forecast_image_url_c ;;
  }

  dimension: iseeit_delivery_installation_status_c {
    type: string
    sql: ${TABLE}.iseeit_delivery_installation_status_c ;;
  }

  dimension: iseeit_forecast_image_link_c {
    type: string
    sql: ${TABLE}.iseeit_forecast_image_link_c ;;
  }

  dimension: iseeit_forecast_image_url_c {
    type: string
    sql: ${TABLE}.iseeit_forecast_image_url_c ;;
  }

  dimension: iseeit_is_archived_c {
    type: yesno
    sql: ${TABLE}.iseeit_is_archived_c ;;
  }

  dimension: iseeit_is_hierarchy_c {
    type: yesno
    sql: ${TABLE}.iseeit_is_hierarchy_c ;;
  }

  dimension: iseeit_is_update_c {
    type: yesno
    sql: ${TABLE}.iseeit_is_update_c ;;
  }

  dimension_group: iseeit_last_modified_date_for_trend_c {
    type: time
    sql: ${TABLE}.iseeit_last_modified_date_for_trend_c ;;
  }

  dimension: iseeit_lead_id_c {
    type: string
    sql: ${TABLE}.iseeit_lead_id_c ;;
  }

  dimension: iseeit_main_competitors_c {
    type: string
    sql: ${TABLE}.iseeit_main_competitors_c ;;
  }

  dimension: iseeit_opportunity_reason_c {
    type: string
    sql: ${TABLE}.iseeit_opportunity_reason_c ;;
  }

  dimension: iseeit_order_number_c {
    type: string
    sql: ${TABLE}.iseeit_order_number_c ;;
  }

  dimension: iseeit_org_chart_contacts_c {
    type: number
    sql: ${TABLE}.iseeit_org_chart_contacts_c ;;
  }

  dimension: iseeit_progress_difference_c {
    type: string
    sql: ${TABLE}.iseeit_progress_difference_c ;;
  }

  dimension: iseeit_progress_status_c {
    type: string
    sql: ${TABLE}.iseeit_progress_status_c ;;
  }

  dimension: iseeit_reason_c {
    type: string
    sql: ${TABLE}.iseeit_reason_c ;;
  }

  dimension: iseeit_reference_c {
    type: yesno
    sql: ${TABLE}.iseeit_reference_c ;;
  }

  dimension: iseeit_score_c {
    type: number
    sql: ${TABLE}.iseeit_score_c ;;
  }

  dimension: iseeit_status_c {
    type: string
    sql: ${TABLE}.iseeit_status_c ;;
  }

  dimension: iseeit_tracking_number_c {
    type: string
    sql: ${TABLE}.iseeit_tracking_number_c ;;
  }

  dimension: kakao_hubtype_c {
    type: yesno
    sql: ${TABLE}.kakao_hubtype_c ;;
  }

  dimension: last_activity_date {
    type: date
    datatype: date
    sql: ${TABLE}.last_activity_date ;;
  }

  dimension: last_amount_changed_history_id {
    type: string
    sql: ${TABLE}.last_amount_changed_history_id ;;
  }

  dimension: last_close_date_changed_history_id {
    type: string
    sql: ${TABLE}.last_close_date_changed_history_id ;;
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

  dimension_group: last_stage_change_date {
    type: time
    sql: ${TABLE}.last_stage_change_date ;;
  }

  dimension_group: last_viewed_date {
    type: time
    sql: ${TABLE}.last_viewed_date ;;
  }

  dimension: lead_source {
    type: string
    sql: ${TABLE}.lead_source ;;
  }

  dimension: link_c {
    type: yesno
    sql: ${TABLE}.link_c ;;
  }

  dimension: lost_reason_c {
    type: string
    sql: ${TABLE}.lost_reason_c ;;
  }

  dimension: margin_target_c {
    type: number
    sql: ${TABLE}.margin_target_c ;;
  }

  dimension: method_of_integration_c {
    type: string
    sql: ${TABLE}.method_of_integration_c ;;
  }

  dimension: min_margin_c {
    type: string
    sql: ${TABLE}.min_margin_c ;;
  }

  dimension: multi_pg_c {
    type: yesno
    sql: ${TABLE}.multi_pg_c ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: next_step {
    type: string
    sql: ${TABLE}.next_step ;;
  }

  dimension: on_off_integration_c {
    type: yesno
    sql: ${TABLE}.on_off_integration_c ;;
  }

  dimension: onboarding_notice_c {
    type: yesno
    sql: ${TABLE}.onboarding_notice_c ;;
  }

  dimension: opportunity_product_c {
    type: string
    sql: ${TABLE}.opportunity_product_c ;;
  }

  dimension: original_bd_member_c {
    type: string
    sql: ${TABLE}.original_bd_member_c ;;
  }

  dimension: overseas_payment_c {
    type: yesno
    sql: ${TABLE}.overseas_payment_c ;;
  }

  dimension: owner_id {
    type: string
    sql: ${TABLE}.owner_id ;;
  }

  dimension: pay_method_c {
    type: string
    sql: ${TABLE}.pay_method_c ;;
  }

  dimension: pgcontact_c {
    type: string
    sql: ${TABLE}.pgcontact_c ;;
  }

  dimension: pgid_c {
    type: string
    sql: ${TABLE}.pgid_c ;;
  }

  dimension: pgmanager_c {
    type: string
    sql: ${TABLE}.pgmanager_c ;;
  }

  dimension: pgsubscriptionfee_c {
    type: string
    sql: ${TABLE}.pgsubscriptionfee_c ;;
  }

  dimension: pricebook_2_id {
    type: string
    sql: ${TABLE}.pricebook_2_id ;;
  }

  dimension: probability {
    type: number
    sql: ${TABLE}.probability ;;
  }

  dimension: promotion_c {
    type: yesno
    sql: ${TABLE}.promotion_c ;;
  }

  dimension: push_count {
    type: number
    sql: ${TABLE}.push_count ;;
  }

  dimension: push_count_c {
    type: number
    sql: ${TABLE}.push_count_c ;;
  }

  dimension: reconnect_bdchange_c {
    type: yesno
    sql: ${TABLE}.reconnect_bdchange_c ;;
  }

  dimension: reconnect_coldmail_c {
    type: yesno
    sql: ${TABLE}.reconnect_coldmail_c ;;
  }

  dimension: reconnect_date_c {
    type: date
    datatype: date
    sql: ${TABLE}.reconnect_date_c ;;
  }

  dimension: reconnect_nonned_c {
    type: yesno
    sql: ${TABLE}.reconnect_nonned_c ;;
  }

  dimension: recontact_c {
    type: yesno
    sql: ${TABLE}.recontact_c ;;
  }

  dimension: record_purpose_c {
    type: yesno
    sql: ${TABLE}.record_purpose_c ;;
  }

  dimension: record_type_id {
    type: string
    sql: ${TABLE}.record_type_id ;;
  }

  dimension: regularpayment_c {
    type: yesno
    sql: ${TABLE}.regularpayment_c ;;
  }

  dimension: revenue_type_c {
    type: string
    sql: ${TABLE}.revenue_type_c ;;
  }

  dimension: rm_c {
    type: yesno
    sql: ${TABLE}.rm_c ;;
  }

  dimension: second_grade_as_c {
    type: number
    sql: ${TABLE}.second_grade_as_c ;;
  }

  dimension: second_grade_to_c {
    type: number
    sql: ${TABLE}.second_grade_to_c ;;
  }

  dimension: service_length_c {
    type: string
    sql: ${TABLE}.service_length_c ;;
  }

  dimension: service_type_c {
    type: string
    sql: ${TABLE}.service_type_c ;;
  }

  dimension: servicewebsite_c {
    type: string
    sql: ${TABLE}.servicewebsite_c ;;
  }

  dimension: source_c {
    type: string
    sql: ${TABLE}.source_c ;;
  }

  dimension: stage_1_date_c {
    type: date
    datatype: date
    sql: ${TABLE}.stage_1_date_c ;;
  }

  dimension: stage_1_no_c {
    type: number
    sql: ${TABLE}.stage_1_no_c ;;
  }

  dimension: stage_5_date_c {
    type: date
    datatype: date
    sql: ${TABLE}.stage_5_date_c ;;
  }

  dimension: stage_7_date_c {
    type: date
    datatype: date
    sql: ${TABLE}.stage_7_date_c ;;
  }

  dimension: stage_7_no_c {
    type: number
    sql: ${TABLE}.stage_7_no_c ;;
  }

  dimension: stage_name {
    type: string
    sql: ${TABLE}.stage_name ;;
  }

  dimension: synced_quote_id {
    type: string
    sql: ${TABLE}.synced_quote_id ;;
  }

  dimension_group: system_modstamp {
    type: time
    sql: ${TABLE}.system_modstamp ;;
  }

  dimension: third_grade_as_c {
    type: number
    sql: ${TABLE}.third_grade_as_c ;;
  }

  dimension: third_grade_to_c {
    type: number
    sql: ${TABLE}.third_grade_to_c ;;
  }

  dimension: total_opportunity_quantity {
    type: number
    sql: ${TABLE}.total_opportunity_quantity ;;
  }

  dimension: tramount_c {
    type: number
    sql: ${TABLE}.tramount_c ;;
  }

  dimension: transaction_amount_actual_c {
    type: number
    sql: ${TABLE}.transaction_amount_actual_c ;;
  }

  dimension: transaction_amount_c {
    type: number
    sql: ${TABLE}.transaction_amount_c ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: user_code_c {
    type: string
    sql: ${TABLE}.user_code_c ;;
  }

  dimension: white_label_c {
    type: yesno
    sql: ${TABLE}.white_label_c ;;
  }

  set: detail {
    fields: [
      id,
      _fivetran_synced_time,
      account_id,
      activity_metric_id,
      activity_metric_rollup_id,
      am_1_st_meeting_check_c,
      am_2_nd_meeting_check_c,
      am_check_c,
      am_note_c,
      amount,
      bottleneck_c,
      budget_handler_c,
      campaign_id,
      close_date,
      commission_c,
      contact_c,
      contact_id,
      contract_id,
      created_by_id,
      created_date_time,
      dashboards_gsp_close_date_extensions_c,
      dashboards_gsp_close_date_month_extensions_c,
      dashboards_gsp_date_opportunity_was_closed_c,
      dashboards_gsp_days_open_delete_c,
      dashboards_gsp_last_stage_change_date_c,
      delay_reason_c,
      delay_reason_detail_c,
      description,
      developer_cost_saving_c,
      distrib_settlement_c,
      drop_reason_c,
      expected_live_date_when_stage_5_c,
      expected_revenue,
      expected_tpv_when_stage_5_c,
      first_grade_as_c,
      first_grade_to_c,
      fiscal,
      fiscal_quarter,
      fiscal_year,
      forecast_category,
      forecast_category_name,
      has_open_activity,
      has_opportunity_line_item,
      has_overdue_task,
      iamport_id_c,
      iamport_signup_c,
      integration_pgdata_c,
      is_closed,
      is_deleted,
      is_private,
      is_split,
      is_won,
      iseeit_competitor_name_c,
      iseeit_current_generators_c,
      iseeit_current_stages_c,
      iseeit_date_time_field_c_time,
      iseeit_deal_progress_score_c,
      iseeit_deal_type_c,
      iseeit_default_forecast_image_url_c,
      iseeit_delivery_installation_status_c,
      iseeit_forecast_image_link_c,
      iseeit_forecast_image_url_c,
      iseeit_is_archived_c,
      iseeit_is_hierarchy_c,
      iseeit_is_update_c,
      iseeit_last_modified_date_for_trend_c_time,
      iseeit_lead_id_c,
      iseeit_main_competitors_c,
      iseeit_opportunity_reason_c,
      iseeit_order_number_c,
      iseeit_org_chart_contacts_c,
      iseeit_progress_difference_c,
      iseeit_progress_status_c,
      iseeit_reason_c,
      iseeit_reference_c,
      iseeit_score_c,
      iseeit_status_c,
      iseeit_tracking_number_c,
      kakao_hubtype_c,
      last_activity_date,
      last_amount_changed_history_id,
      last_close_date_changed_history_id,
      last_modified_by_id,
      last_modified_date_time,
      last_referenced_date_time,
      last_stage_change_date_time,
      last_viewed_date_time,
      lead_source,
      link_c,
      lost_reason_c,
      margin_target_c,
      method_of_integration_c,
      min_margin_c,
      multi_pg_c,
      name,
      next_step,
      on_off_integration_c,
      onboarding_notice_c,
      opportunity_product_c,
      original_bd_member_c,
      overseas_payment_c,
      owner_id,
      pay_method_c,
      pgcontact_c,
      pgid_c,
      pgmanager_c,
      pgsubscriptionfee_c,
      pricebook_2_id,
      probability,
      promotion_c,
      push_count,
      push_count_c,
      reconnect_bdchange_c,
      reconnect_coldmail_c,
      reconnect_date_c,
      reconnect_nonned_c,
      recontact_c,
      record_purpose_c,
      record_type_id,
      regularpayment_c,
      revenue_type_c,
      rm_c,
      second_grade_as_c,
      second_grade_to_c,
      service_length_c,
      service_type_c,
      servicewebsite_c,
      source_c,
      stage_1_date_c,
      stage_1_no_c,
      stage_5_date_c,
      stage_7_date_c,
      stage_7_no_c,
      stage_name,
      synced_quote_id,
      system_modstamp_time,
      third_grade_as_c,
      third_grade_to_c,
      total_opportunity_quantity,
      tramount_c,
      transaction_amount_actual_c,
      transaction_amount_c,
      type,
      user_code_c,
      white_label_c
    ]
  }
}
