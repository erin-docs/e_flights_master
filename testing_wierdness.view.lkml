view: testing_wierdness {
  derived_table: {
    sql:
    SELECT
    address1,
    address2,
    aircraft_engine_code
    FROM flightstats.aircraft ;;
    indexes: ["address1"]
    persist_for: "10 minutes"
    }

    dimension: address1 {
      type: string
      sql: ${TABLE}.address1 ;;
    }

    dimension: address2 {
      type: string
      sql: ${TABLE}.address2 ;;
    }

    dimension: aircraft_engine_code {
      type: string
      sql: ${TABLE}.aircraft_engine_code ;;
    }

    }

    explore: testing_wierdness {}
