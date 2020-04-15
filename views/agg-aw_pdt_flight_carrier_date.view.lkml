view: agg_aw_pdt_flight_carrier_date {


    derived_table: {
    datagroup_trigger: e_flights_default_datagroup
      indexes: ["id","flight_num"]
      explore_source: ontime {
        timezone: "America/Los_Angeles"
        column: id2 {}
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
