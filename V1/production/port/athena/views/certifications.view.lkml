view: certifications {
    sql_table_name:  hmscatalog.importdb.certifications ;;
    suggestions: no

    measure: count {
      type: count
      drill_fields: [detail*]
    }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

    dimension: user_id {
      type: number
      sql: ${TABLE}.user_id ;;
    }

    dimension: channel {
      type: string
      sql: ${TABLE}.channel ;;
    }

    dimension: imp_uid {
      type: string
      sql: ${TABLE}.imp_uid ;;
    }

    dimension: merchant_uid {
      type: string
      sql: ${TABLE}.merchant_uid ;;
    }

    dimension: pg_tid {
      type: string
      sql: ${TABLE}.pg_tid ;;
    }


    dimension: pg_provider {
      type: string
      sql: ${TABLE}.pg_provider ;;
    }


    dimension: pg_id {
      type: string
      sql: ${TABLE}.pg_id ;;
    }

    dimension: certification_method{
      type: string
      sql: ${TABLE}.certification_method ;;
    }


    dimension_group: certified {
      type: time
      sql: ${TABLE}.certified ;;
    }

    dimension_group: created {
      type: time
      sql: ${TABLE}.created ;;
    }

    dimension_group: date_field {
      type: time
      timeframes: [year, month, month_num, month_name, date, week_of_year]
      sql: ${TABLE}.created ;;
    }

    dimension_group: modified {
      type: time
      sql: ${TABLE}.modified ;;
    }

    dimension: yearmonth {
      type: string
      sql: ${TABLE}.yearmonth ;;
    }



    set: detail {
      fields: [id, user_id, channel, imp_uid, merchant_uid, pg_tid, pg_provider, pg_id, certification_method, certified_time, created_time, modified_time, yearmonth]
    }
  }
