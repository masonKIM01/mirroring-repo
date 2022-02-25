view: table_amplitude {
  derived_table: {
    sql: select *
      from amplitude_amplitude.raw_events
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: user {
    type: count_distinct
    sql: ${TABLE}.amplitude_id ;;
  }

  dimension: insert_id {
    type: string
    sql: ${TABLE}."$insert_id" ;;
  }

  dimension: insert_key {
    type: string
    sql: ${TABLE}."$insert_key" ;;
  }

  dimension: schema {
    type: string
    sql: ${TABLE}."$schema" ;;
  }

  dimension: adid {
    type: string
    sql: ${TABLE}.adid ;;
  }

  dimension: amplitude_attribution_ids {
    type: string
    sql: ${TABLE}.amplitude_attribution_ids ;;
  }

  dimension: amplitude_event_type {
    type: string
    sql: ${TABLE}.amplitude_event_type ;;
  }

  dimension: amplitude_id {
    type: string
    sql: ${TABLE}.amplitude_id ;;
  }

  dimension: app {
    type: string
    sql: ${TABLE}.app ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: client_event_time {
    type: string
    sql: ${TABLE}.client_event_time ;;
  }

  dimension: client_upload_time {
    type: string
    sql: ${TABLE}.client_upload_time ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension: data {
    type: string
    sql: ${TABLE}.data ;;
  }

  dimension: device_brand {
    type: string
    sql: ${TABLE}.device_brand ;;
  }

  dimension: device_carrier {
    type: string
    sql: ${TABLE}.device_carrier ;;
  }

  dimension: device_family {
    type: string
    sql: ${TABLE}.device_family ;;
  }

  dimension: device_id {
    type: string
    sql: ${TABLE}.device_id ;;
  }

  dimension: device_manufacturer {
    type: string
    sql: ${TABLE}.device_manufacturer ;;
  }

  dimension: device_model {
    type: string
    sql: ${TABLE}.device_model ;;
  }

  dimension: device_type {
    type: string
    sql: ${TABLE}.device_type ;;
  }

  dimension: dma {
    type: string
    sql: ${TABLE}.dma ;;
  }

  dimension: event_id {
    type: string
    sql: ${TABLE}.event_id ;;
  }

  dimension: event_properties {
    type: string
    sql: ${TABLE}.event_properties ;;
  }

  dimension_group: event_time {
    type: time
    sql: ${TABLE}.event_time ;;
  }

  dimension: event_type {
    type: string
    sql: ${TABLE}.event_type ;;
  }

  dimension: idfa {
    type: string
    sql: ${TABLE}.idfa ;;
  }

  dimension: ip_address {
    type: string
    sql: ${TABLE}.ip_address ;;
  }

  dimension: is_attribution_event {
    type: string
    sql: ${TABLE}.is_attribution_event ;;
  }

  dimension: language {
    type: string
    sql: ${TABLE}.language ;;
  }

  dimension: library {
    type: string
    sql: ${TABLE}.library ;;
  }

  dimension: location_lat {
    type: string
    sql: ${TABLE}.location_lat ;;
  }

  dimension: location_lng {
    type: string
    sql: ${TABLE}.location_lng ;;
  }

  dimension: os_name {
    type: string
    sql: ${TABLE}.os_name ;;
  }

  dimension: os_version {
    type: string
    sql: ${TABLE}.os_version ;;
  }

  dimension: partner_id {
    type: string
    sql: ${TABLE}.partner_id ;;
  }

  dimension: paying {
    type: string
    sql: ${TABLE}.paying ;;
  }

  dimension: platform {
    type: string
    sql: ${TABLE}.platform ;;
  }

  dimension: processed_time {
    type: string
    sql: ${TABLE}.processed_time ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: sample_rate {
    type: string
    sql: ${TABLE}.sample_rate ;;
  }

  dimension: server_received_time {
    type: string
    sql: ${TABLE}.server_received_time ;;
  }

  dimension: server_upload_time {
    type: string
    sql: ${TABLE}.server_upload_time ;;
  }

  dimension: session_id {
    type: string
    sql: ${TABLE}.session_id ;;
  }

  dimension: start_version {
    type: string
    sql: ${TABLE}.start_version ;;
  }

  dimension: user_creation_time {
    type: string
    sql: ${TABLE}.user_creation_time ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: user_properties {
    type: string
    sql: ${TABLE}.user_properties ;;
  }

  dimension: uuid {
    type: string
    sql: ${TABLE}.uuid ;;
  }

  dimension: version_name {
    type: string
    sql: ${TABLE}.version_name ;;
  }

  dimension: year {
    type: string
    sql: ${TABLE}.year ;;
  }

  dimension: month {
    type: string
    sql: ${TABLE}.month ;;
  }

  dimension: day {
    type: string
    sql: ${TABLE}.day ;;
  }

  dimension: hour {
    type: string
    sql: ${TABLE}.hour ;;
  }

  set: detail {
    fields: [
      insert_id,
      insert_key,
      schema,
      adid,
      amplitude_attribution_ids,
      amplitude_event_type,
      amplitude_id,
      app,
      city,
      client_event_time,
      client_upload_time,
      country,
      data,
      device_brand,
      device_carrier,
      device_family,
      device_id,
      device_manufacturer,
      device_model,
      device_type,
      dma,
      event_id,
      event_properties,
      event_time_time,
      event_type,
      idfa,
      ip_address,
      is_attribution_event,
      language,
      library,
      location_lat,
      location_lng,
      os_name,
      os_version,
      partner_id,
      paying,
      platform,
      processed_time,
      region,
      sample_rate,
      server_received_time,
      server_upload_time,
      session_id,
      start_version,
      user_creation_time,
      user_id,
      user_properties,
      uuid,
      version_name,
      year,
      month,
      day,
      hour
    ]
  }
}
