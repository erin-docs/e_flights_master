view: erin_flights_pdt_stable_name {

    derived_table: {
      publish_as_db_view: yes
      datagroup_trigger: e_flights_default_datagroup
      explore_source: ontime {
        timezone: "America/Los_Angeles"
        column: flight_num {}
        column: carrier {}
        column: arr_date {}
      }
    }
    dimension: flight_num {}
    dimension: carrier {}
    dimension: arr_date {
      type: date
    }
  }
