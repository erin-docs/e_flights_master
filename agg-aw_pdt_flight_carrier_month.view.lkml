
view: agg-aw_pdt_flight_carrier_month {
  derived_table: {
    datagroup_trigger: e_flights_default_datagroup
      explore_source: ontime {
      timezone: "America/Los_Angeles"
      column: arr_month {}
      column: flight_num {}
      column: carrier {}
    }
  }
  dimension: arr_month {
    type: date_month
  }
  dimension: flight_num {}
  dimension: carrier {}
}
