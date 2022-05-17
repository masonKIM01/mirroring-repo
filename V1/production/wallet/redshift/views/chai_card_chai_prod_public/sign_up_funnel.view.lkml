view: sign_up_funnel {
  derived_table: {
    sql:
    WITH views AS (
      SELECT
        event_time::TIMESTAMP + INTERVAL '9 HOUR' AS event_time,
        JSON_EXTRACT_PATH_TEXT(event_properties, 'screen_view') AS screen,
        user_id,
        amplitude_id,
        event_type
      FROM amplitude_amplitude.raw_events
      WHERE year = '2022'
      AND month = '5'
      AND day = '1'
      AND event_type = 'view'
    ),
    sign AS (
      SELECT
        event_time,
        user_id,
        amplitude_id
      FROM views
      WHERE screen = 'sign'
    ), sign_tos AS (
      SELECT
        event_time,
        user_id,
        amplitude_id
      FROM views
      WHERE screen = 'sign_tos'
    ), sign_cert AS (
      SELECT
        event_time,
        user_id,
        amplitude_id
      FROM views
      WHERE screen = 'sign_certification'
    ), sign_reg AS (
      SELECT
        event_time,
        user_id,
        amplitude_id
      FROM views
      WHERE screen = 'register_bank_account'
    ), sign_reg_num AS (
      SELECT
        event_time,
        user_id,
        amplitude_id
      FROM views
      WHERE screen = 'register_bank_account_num'
    ), sign_ars AS (
      SELECT
        event_time,
        user_id,
        amplitude_id
      FROM views
      WHERE screen = 'sign_ars'
    ), sign_password AS (
      SELECT
        event_time,
        user_id,
        amplitude_id
      FROM views
      WHERE screen = 'sign_password'
    ), sign_password_confirm AS (
      SELECT
        event_time,
        user_id,
        amplitude_id
      FROM views
      WHERE screen = 'sign_password_confirm'
    )
    SELECT
      COUNT(DISTINCT(s.amplitude_id)) AS sign_users,
      COUNT(DISTINCT(st.amplitude_id)) AS tos_users,
      COUNT(DISTINCT(sc.amplitude_id)) AS cert_users,
      COUNT(DISTINCT(sr.amplitude_id)) AS reg_users,
      COUNT(DISTINCT(srn.amplitude_id)) AS reg_num_users,
      COUNT(DISTINCT(sa.amplitude_id)) AS ars_users,
      COUNT(DISTINCT(sp.amplitude_id)) AS password_users,
      COUNT(DISTINCT(spc.amplitude_id)) AS password_cfm_users
    FROM sign s
    LEFT JOIN sign_tos st
      ON s.amplitude_id = st.amplitude_id
      AND DATEDIFF(minute, s.event_time, st.event_time) <= 5
    LEFT JOIN sign_cert sc
      ON st.amplitude_id = sc.amplitude_id
      AND DATEDIFF(minute, st.event_time, sc.event_time) <= 5
    LEFT JOIN sign_reg sr
      ON sc.amplitude_id = sr.amplitude_id
      AND DATEDIFF(minute, sc.event_time, sr.event_time) <= 5
    LEFT JOIN sign_reg_num srn
      ON sr.amplitude_id = srn.amplitude_id
      AND DATEDIFF(minute, sr.event_time, srn.event_time) <= 5
    LEFT JOIN sign_ars sa
      ON srn.amplitude_id = sa.amplitude_id
      AND DATEDIFF(minute, srn.event_time, sa.event_time) <= 5
    LEFT JOIN sign_password sp
      ON sa.amplitude_id = sp.amplitude_id
      AND DATEDIFF(minute, sa.event_time, sp.event_time) <= 5
    LEFT JOIN sign_password_confirm spc
      ON sp.amplitude_id = spc.amplitude_id
      AND DATEDIFF(minute, sp.event_time, spc.event_time) <= 5
    ;;
  }
  dimension: sign_users {
    description: "프로필 정보 입력 페이지 도달 유저수"
    type: number
    sql: {TABLE}.sign_users ;;
  }
  dimension: tos_users {
    description: "약관 노출 페이지 도달 유저수"
    type: number
    sql: {TABLE}.tos_users ;;
  }
  dimension: cert_users {
    description: "otp 인증 페이지 도달 유저수"
    type: number
    sql: {TABLE}.cert_users ;;
  }
  dimension: reg_users {
    description: "은행 리스트 페이지 도달 유저수"
    type: number
    sql: {TABLE}.reg_users ;;
  }
  dimension: reg_num_users {
    description: "은행 계좌번호 입력 페이지 도달 유저수"
    type: number
    sql: {TABLE}.reg_num_users ;;
  }
  dimension: ars_users {
    description: "ARS 인증 페이지 도달 유저수"
    type: number
    sql: {TABLE}.ars_users ;;
  }
  dimension: password_users {
    description: "비밀번호 등록 페이지 도달 유저수"
    type: number
    sql: {TABLE}.password_users ;;
  }
  dimension: password_cfm_users {
    description: "비밀번호 확인 페이지 도달 유저수"
    type: number
    sql: {TABLE}.password_cfm_users ;;
  }
}
