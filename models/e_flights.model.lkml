connection: "faa"

include: "/views/*.view.lkml"

aggregate_awareness: yes


explore: agg_aw_pdt_flight_carrier_date {}

explore: e_flights_pdt {
  label: "E Flights PDT Stable Name"
}

datagroup: e_flights_default_datagroup {
  sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: e_flights_default_datagroup

explore: aircraft {
  description: "Aircraft Data"
  join: aircraft_types {
    type: left_outer
    sql_on: ${aircraft.aircraft_type_id} = ${aircraft_types.aircraft_type_id} ;;
    relationship: many_to_one
  }

  join: aircraft_engine_types {
    type: left_outer
    sql_on: ${aircraft.aircraft_engine_type_id} = ${aircraft_engine_types.aircraft_engine_type_id} ;;
    relationship: many_to_one
  }
}

explore: aircraft_engine_types {}

explore: aircraft_engines {
  join: aircraft_engine_types {
    type: left_outer
    sql_on: ${aircraft_engines.aircraft_engine_type_id} = ${aircraft_engine_types.aircraft_engine_type_id} ;;
    relationship: many_to_one
  }
}

explore: aircraft_models {
  join: aircraft_types {
    type: left_outer
    sql_on: ${aircraft_models.aircraft_type_id} = ${aircraft_types.aircraft_type_id} ;;
    relationship: many_to_one
  }

  join: aircraft_engine_types {
    type: left_outer
    sql_on: ${aircraft_models.aircraft_engine_type_id} = ${aircraft_engine_types.aircraft_engine_type_id} ;;
    relationship: many_to_one
  }
}

explore: aircraft_types {}

explore: airport_remarks {}

explore: airports {}

explore: carriers {}

explore: exceptions {}

explore: ontime {}

explore: states {}

explore: zipcodes {}
