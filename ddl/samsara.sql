CREATE TABLE defect (
    id text,
    resolved_by_id text,
    trailer_id text,
    vehicle_id text,
    "comment" text,
    created_at_time text,
    defect_type text,
    is_resolved boolean,
    mechanic_notes text,
    mechanic_notes_updated_at_time text,
    resolved_at_time text,
    resolved_by_name text,
    resolved_by_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (resolved_by_id) REFERENCES users(id),
    FOREIGN KEY (trailer_id) REFERENCES trailer(id),
    FOREIGN KEY (vehicle_id) REFERENCES vehicle(id)
);

CREATE TABLE dvir_trailer_defect (
    dvir_id text,
    trailer_defect_id text,
    PRIMARY KEY (dvir_id, trailer_defect_id),
    FOREIGN KEY (dvir_id) REFERENCES dvir(id),
    FOREIGN KEY (trailer_defect_id) REFERENCES defect(id)
);

CREATE TABLE dvir_vehicle_defect (
    dvir_id text,
    vechile_defect_id text,
    PRIMARY KEY (dvir_id, vechile_defect_id),
    FOREIGN KEY (dvir_id) REFERENCES dvir(id),
    FOREIGN KEY (vechile_defect_id) REFERENCES defect(id)
);

CREATE TABLE dvir (
    id text,
    author_signature_signatory_user_id text,
    second_signature_signatory_user_id text,
    third_signature_signatory_user_id text,
    trailer_id text,
    vehicle_id text,
    author_signature_signatory_user_name text,
    author_signature_signed_at_time text,
    author_signature_type text,
    end_time text,
    location text,
    mechanic_notes text,
    odometer_meters bigint,
    safety_status text,
    second_signature_signatory_user_name text,
    second_signature_signed_at_time text,
    second_signature_type text,
    start_time text,
    third_signature_signatory_user_name text,
    third_signature_signed_at_time text,
    third_signature_type text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (author_signature_signatory_user_id) REFERENCES users(id),
    FOREIGN KEY (second_signature_signatory_user_id) REFERENCES users(id),
    FOREIGN KEY (third_signature_signatory_user_id) REFERENCES users(id),
    FOREIGN KEY (trailer_id) REFERENCES trailer(id),
    FOREIGN KEY (vehicle_id) REFERENCES vehicle(id)
);

CREATE TABLE safety_behavior (
    label text,
    safety_event_id text,
    "name" text,
    "source" text,
    PRIMARY KEY (label, safety_event_id),
    FOREIGN KEY (safety_event_id) REFERENCES safety_event(id)
);

CREATE TABLE safety_event (
    id text,
    driver_id text,
    vehicle_id text,
    coaching_state text,
    location_latitude double precision,
    location_longitude double precision,
    max_acceleration_gforce double precision,
    "time" text,
    PRIMARY KEY (id),
    FOREIGN KEY (driver_id) REFERENCES driver(id),
    FOREIGN KEY (vehicle_id) REFERENCES vehicle(id)
);

CREATE TABLE hos_log_codriver (
    codriver_id text,
    hos_log_log_end_time text,
    hos_log_log_start_time text,
    hos_log_vehicle_id text,
    PRIMARY KEY (codriver_id, hos_log_log_end_time, hos_log_log_start_time, hos_log_vehicle_id),
    FOREIGN KEY (codriver_id) REFERENCES driver(id),
    FOREIGN KEY (hos_log_log_end_time) REFERENCES hos_log(log_end_time),
    FOREIGN KEY (hos_log_log_start_time) REFERENCES hos_log(log_start_time),
    FOREIGN KEY (hos_log_vehicle_id) REFERENCES hos_log(vehicle_id)
);

CREATE TABLE hos_log (
    log_end_time text,
    log_start_time text,
    vehicle_id text,
    driver_id text,
    hos_status_type text,
    log_recorded_location_latitude double precision,
    log_recorded_location_longitude double precision,
    remark text,
    PRIMARY KEY (log_end_time, log_start_time, vehicle_id),
    FOREIGN KEY (vehicle_id) REFERENCES vehicle(id),
    FOREIGN KEY (driver_id) REFERENCES driver(id)
);

CREATE TABLE tag_equipment (
    "index" text,
    equipment_id text,
    tag_id text,
    PRIMARY KEY ("index", equipment_id),
    FOREIGN KEY (equipment_id) REFERENCES equipment(id),
    FOREIGN KEY (tag_id) REFERENCES tags(id)
);

CREATE TABLE equipment (
    id text,
    gateway_serial text,
    equipment_serial_number text,
    "name" text,
    notes text,
    PRIMARY KEY (id),
    FOREIGN KEY (gateway_serial) REFERENCES gateway(serial)
);

CREATE TABLE user_role (
    "index" text,
    users_id text,
    tag_id text,
    PRIMARY KEY ("index", users_id),
    FOREIGN KEY (users_id) REFERENCES users(id),
    FOREIGN KEY (tag_id) REFERENCES tags(id)
);

CREATE TABLE users (
    id text,
    auth_type text,
    email text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE tags (
    id text,
    parent_tag_id text,
    external_id jsonb,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (parent_tag_id) REFERENCES tags(id)
);

CREATE TABLE hos_daily_log (
    end_time text,
    start_time text,
    driver_id text,
    active_duration_ms text,
    adverse_driving_claimed text,
    big_day_claimed text,
    carrier_formatted_address text,
    carrier_name text,
    carrier_us_dot_number text,
    certified_at_time text,
    drive_distance_meters text,
    drive_duration_ms text,
    home_terminal_formatted_address text,
    home_terminal_name text,
    is_certified text,
    is_us_short_haul_active text,
    off_duty_duration_ms text,
    on_duty_duration_ms text,
    pending_active_duration_ms text,
    pending_drive_duration_ms text,
    pending_off_duty_duration_ms text,
    pending_on_duty_duration_ms text,
    pending_personal_conveyance_duration_ms text,
    pending_sleeper_berth_duration_ms text,
    pending_waiting_time_duration_ms text,
    pending_yard_move_duration_ms text,
    personal_conveyance_distance_meters text,
    personal_conveyance_duration_ms text,
    shipping_docs text,
    sleeper_berth_duration_ms text,
    waiting_time_duration_ms text,
    yard_move_distance_meters text,
    yard_move_duration_ms text,
    PRIMARY KEY (end_time, start_time, driver_id),
    FOREIGN KEY (driver_id) REFERENCES driver(id)
);

CREATE TABLE route_stop (
    id text,
    address_id text,
    route_id text,
    actual_arrival_time text,
    actual_departure_time text,
    en_route_time text,
    eta text,
    external_id jsonb,
    live_sharing_url text,
    "name" text,
    notes text,
    scheduled_arrival_time text,
    scheduled_departure_time text,
    single_use_location_address text,
    single_use_location_latitude double precision,
    single_use_location_longitude double precision,
    skipped_time text,
    "state" text,
    PRIMARY KEY (id),
    FOREIGN KEY (address_id) REFERENCES address(id),
    FOREIGN KEY (route_id) REFERENCES route(id)
);

CREATE TABLE route (
    id text,
    driver_id text,
    vehicle_id text,
    actual_route_end_time text,
    actual_route_start_time text,
    completion_condition text,
    external_id jsonb,
    "name" text,
    notes text,
    scheduled_route_end_time text,
    scheduled_route_start_time text,
    starting_condition text,
    PRIMARY KEY (id),
    FOREIGN KEY (driver_id) REFERENCES driver(id),
    FOREIGN KEY (vehicle_id) REFERENCES vehicle(id)
);

CREATE TABLE tag_driver (
    "index" text,
    driver_id text,
    tag_id text,
    PRIMARY KEY ("index", driver_id),
    FOREIGN KEY (driver_id) REFERENCES driver(id),
    FOREIGN KEY (tag_id) REFERENCES tags(id)
);

CREATE TABLE driver (
    id text,
    peer_group_tag_id text,
    carrier_settings_carrier_name text,
    carrier_settings_dot_number bigint,
    carrier_settings_home_terminal_address text,
    carrier_settings_home_terminal_name text,
    carrier_settings_main_office_address text,
    created_at_time text,
    current_id_card_code text,
    eld_adverse_weather_exemption_enabled boolean,
    eld_big_day_exemption_enabled boolean,
    eld_day_start_hour bigint,
    eld_exempt boolean,
    eld_exempt_reason text,
    eld_pc_enabled boolean,
    eld_ym_enabled boolean,
    external_id jsonb,
    license_number text,
    license_state text,
    locale text,
    "name" text,
    notes text,
    tachograph_card_number text,
    timezone text,
    updated_at_time text,
    us_driver_ruleset_override_break text,
    us_driver_ruleset_override_cycle text,
    us_driver_ruleset_override_restart text,
    us_driver_ruleset_override_us_state_to_override text,
    username text,
    PRIMARY KEY (id),
    FOREIGN KEY (peer_group_tag_id) REFERENCES tags(id)
);

CREATE TABLE vehicle_idling_report (
    _fivetran_id text,
    vehicle_id text,
    address_formatted text,
    address_latitude text,
    address_longitude text,
    duration_ms text,
    end_time text,
    fuel_consumption_ml text,
    is_pto_active text,
    start_time text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (vehicle_id) REFERENCES vehicle(id)
);

CREATE TABLE j_1939_diagnostic_trouble_code (
    _fivetran_id text,
    fault_code_time text,
    fault_code_vehicle_id text,
    fmi_description text,
    fmi_id bigint,
    mil_status bigint,
    occurrence_count bigint,
    source_address_name text,
    spn_description text,
    spn_id bigint,
    tx_id bigint,
    vendor_specific_fields_dtc_description text,
    vendor_specific_fields_repair_instructions_url text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (fault_code_time) REFERENCES fault_code("time"),
    FOREIGN KEY (fault_code_vehicle_id) REFERENCES fault_code(vehicle_id)
);

CREATE TABLE obdii_diagnostic_trouble_code (
    tx_id bigint,
    fault_code_time text,
    fault_code_vehicle_id text,
    ignition_type text,
    mil_status boolean,
    monitor_status_catalyst text,
    monitor_status_comprehensive text,
    monitor_status_egr text,
    monitor_status_evap_system text,
    monitor_status_fuel text,
    monitor_status_heated_catalyst text,
    monitor_status_heated_o_2_sensor text,
    monitor_status_iso_sae_reserved text,
    monitor_status_misfire text,
    monitor_status_not_ready_count bigint,
    monitor_status_o_2_sensor text,
    monitor_status_secondary_air text,
    PRIMARY KEY (tx_id),
    FOREIGN KEY (fault_code_time) REFERENCES fault_code("time"),
    FOREIGN KEY (fault_code_vehicle_id) REFERENCES fault_code(vehicle_id)
);

CREATE TABLE oem_diagnostic_trouble_code (
    _fivetran_id text,
    fault_code_time text,
    fault_code_vehicle_id text,
    code_description text,
    code_identifier text,
    code_severity text,
    code_source text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (fault_code_time) REFERENCES fault_code("time"),
    FOREIGN KEY (fault_code_vehicle_id) REFERENCES fault_code(vehicle_id)
);

CREATE TABLE fault_code (
    "time" text,
    vehicle_id text,
    can_bus_type text,
    j_1939_check_engine_lights_emissions_is_on boolean,
    j_1939_check_engine_lights_protect_is_on boolean,
    j_1939_check_engine_lights_stop_is_on boolean,
    j_1939_check_engine_lights_warning_is_on boolean,
    obdii_check_engine_light_is_on boolean,
    PRIMARY KEY ("time", vehicle_id),
    FOREIGN KEY (vehicle_id) REFERENCES vehicle(id)
);

CREATE TABLE fuel_percent (
    "time" text,
    vehicle_id text,
    "value" bigint,
    PRIMARY KEY ("time", vehicle_id),
    FOREIGN KEY (vehicle_id) REFERENCES vehicle(id)
);

CREATE TABLE battery_milli_volt (
    "time" text,
    vehicle_id text,
    "value" bigint,
    PRIMARY KEY ("time", vehicle_id),
    FOREIGN KEY (vehicle_id) REFERENCES vehicle(id)
);

CREATE TABLE dtc (
    _fivetran_id text,
    tx_id bigint,
    dtc_description text,
    dtc_id bigint,
    dtc_short_code text,
    dtc_type text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (tx_id) REFERENCES obdii_diagnostic_trouble_code(tx_id)
);

CREATE TABLE obd_engine_second (
    "time" text,
    vehicle_id text,
    "value" bigint,
    PRIMARY KEY ("time", vehicle_id),
    FOREIGN KEY (vehicle_id) REFERENCES vehicle(id)
);

CREATE TABLE synthetic_engine_second (
    "time" text,
    vehicle_id text,
    "value" bigint,
    PRIMARY KEY ("time", vehicle_id),
    FOREIGN KEY (vehicle_id) REFERENCES vehicle(id)
);

CREATE TABLE engine_state (
    "time" text,
    vehicle_id text,
    "value" text,
    PRIMARY KEY ("time", vehicle_id),
    FOREIGN KEY (vehicle_id) REFERENCES vehicle(id)
);

CREATE TABLE aux_input (
    "time" text,
    vehicle_id text,
    "name" text,
    "type" text,
    "value" boolean,
    PRIMARY KEY ("time", vehicle_id)
);

CREATE TABLE conditional_field_section (
    _fivetran_id text,
    document_id text,
    conditional_field_first_index bigint,
    conditional_field_last_index bigint,
    triggering_field_index bigint,
    triggering_field_value text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (document_id) REFERENCES document(id)
);

CREATE TABLE document_field (
    label text,
    document_id text,
    "type" text,
    -- value_* (dynamic column),
    PRIMARY KEY (label, document_id),
    FOREIGN KEY (document_id) REFERENCES document(id)
);

CREATE TABLE document (
    id text,
    driver_id text,
    route_id text,
    route_stop_id text,
    vehicle_id text,
    created_at_time text,
    document_type_id text,
    document_type_name text,
    "name" text,
    notes text,
    "state" text,
    updated_at_time text,
    PRIMARY KEY (id),
    FOREIGN KEY (driver_id) REFERENCES driver(id),
    FOREIGN KEY (route_id) REFERENCES route(id),
    FOREIGN KEY (route_stop_id) REFERENCES route_stop(id),
    FOREIGN KEY (vehicle_id) REFERENCES vehicle(id)
);

CREATE TABLE gps (
    "time" text,
    vehicle_id text,
    address_id text,
    heading_degrees double precision,
    is_ecu_speed boolean,
    latitude double precision,
    longitude double precision,
    reverse_geo_formatted_location text,
    speed_miles_per_hour double precision,
    PRIMARY KEY ("time", vehicle_id),
    FOREIGN KEY (vehicle_id) REFERENCES vehicle(id),
    FOREIGN KEY (address_id) REFERENCES address(id)
);

CREATE TABLE alert_incident_conditions (
    "index" text,
    configuration_id text,
    updated_at_time text,
    description text,
    details jsonb,
    trigger_id text,
    PRIMARY KEY ("index", configuration_id, updated_at_time),
    FOREIGN KEY (configuration_id) REFERENCES alert_incident(configuration_id),
    FOREIGN KEY (updated_at_time) REFERENCES alert_incident(updated_at_time)
);

CREATE TABLE alert_incident (
    configuration_id text,
    updated_at_time text,
    happened_at_time text,
    incident_url text,
    is_resolved text,
    resolved_at_time text,
    PRIMARY KEY (configuration_id, updated_at_time)
);

CREATE TABLE tag_vehicle (
    "index" text,
    vehicle_id text,
    tag_id text,
    PRIMARY KEY ("index", vehicle_id),
    FOREIGN KEY (vehicle_id) REFERENCES vehicle(id),
    FOREIGN KEY (tag_id) REFERENCES tags(id)
);

CREATE TABLE vehicle (
    id text,
    gateway_serial text,
    aux_input_1 text,
    aux_input_10 text,
    aux_input_11 text,
    aux_input_12 text,
    aux_input_13 text,
    aux_input_2 text,
    aux_input_3 text,
    aux_input_4 text,
    aux_input_5 text,
    aux_input_6 text,
    aux_input_7 text,
    aux_input_8 text,
    aux_input_9 text,
    created_at_time text,
    engine_serial_number text,
    external_id jsonb,
    harsh_acceleration_setting text,
    license_plate text,
    make text,
    model text,
    "name" text,
    notes text,
    updated_at_time text,
    vehicle_regulation_mode text,
    vin text,
    "year" text,
    PRIMARY KEY (id),
    FOREIGN KEY (gateway_serial) REFERENCES gateway(serial)
);

CREATE TABLE tag_trailer (
    "index" text,
    trailer_id text,
    tag_id text,
    PRIMARY KEY ("index", trailer_id),
    FOREIGN KEY (trailer_id) REFERENCES trailer(id),
    FOREIGN KEY (tag_id) REFERENCES tags(id)
);

CREATE TABLE trailer (
    id text,
    gateway_serial text,
    enabled_for_mobile boolean,
    external_id jsonb,
    license_plate text,
    "name" text,
    notes text,
    trailer_serial_number text,
    PRIMARY KEY (id),
    FOREIGN KEY (gateway_serial) REFERENCES gateway(serial)
);

CREATE TABLE driver_hos_violation (
    day_start_time text,
    "type" text,
    driver_id text,
    day_end_time text,
    description text,
    duration_ms text,
    violation_start_time text,
    PRIMARY KEY (day_start_time, "type", driver_id),
    FOREIGN KEY (driver_id) REFERENCES driver(id)
);

CREATE TABLE vehicle_trip_asset (
    trailer_id bigint,
    vehicle_trip_end_ms text,
    vehicle_trip_start_ms text,
    vehicle_trip_vehicle_id text,
    PRIMARY KEY (trailer_id),
    FOREIGN KEY (vehicle_trip_end_ms) REFERENCES vehicle_trip(end_ms),
    FOREIGN KEY (vehicle_trip_start_ms) REFERENCES vehicle_trip(start_ms),
    FOREIGN KEY (vehicle_trip_vehicle_id) REFERENCES vehicle_trip(vehicle_id)
);

CREATE TABLE vehicle_trip_codriver (
    codriver_id bigint,
    vehicle_trip_end_ms text,
    vehicle_trip_start_ms text,
    vehicle_trip_vehicle_id text,
    PRIMARY KEY (codriver_id),
    FOREIGN KEY (codriver_id) REFERENCES driver(id),
    FOREIGN KEY (vehicle_trip_end_ms) REFERENCES vehicle_trip(end_ms),
    FOREIGN KEY (vehicle_trip_start_ms) REFERENCES vehicle_trip(start_ms),
    FOREIGN KEY (vehicle_trip_vehicle_id) REFERENCES vehicle_trip(vehicle_id)
);

CREATE TABLE vehicle_trip (
    end_ms text,
    start_ms text,
    vehicle_id text,
    driver_id bigint,
    end_address_id text,
    start_address_id bigint,
    distance_meters bigint,
    end_coordinates_latitude double precision,
    end_coordinates_longitude double precision,
    end_location text,
    end_odometer bigint,
    fuel_consumed_ml bigint,
    start_coordinates_latitude double precision,
    start_coordinates_longitude double precision,
    start_location text,
    start_odometer bigint,
    toll_meters bigint,
    PRIMARY KEY (end_ms, start_ms, vehicle_id),
    FOREIGN KEY (vehicle_id) REFERENCES vehicle(id),
    FOREIGN KEY (driver_id) REFERENCES driver(id),
    FOREIGN KEY (end_address_id) REFERENCES address(id),
    FOREIGN KEY (start_address_id) REFERENCES address(id)
);

CREATE TABLE stream_dvir_defect (
    "index" text,
    stream_dvir_id text,
    defect_id text,
    PRIMARY KEY ("index", stream_dvir_id),
    FOREIGN KEY (stream_dvir_id) REFERENCES stream_dvir(id),
    FOREIGN KEY (defect_id) REFERENCES defect(id)
);

CREATE TABLE stream_dvir (
    id text,
    author_signature_signatory_user_id text,
    second_signature_signatory_user_id text,
    third_signature_signatory_user_id text,
    trailer_id text,
    vehicle_id text,
    author_signature_signed_at_time text,
    author_signature_type text,
    dvir_submission_begin_time text,
    dvir_submission_time text,
    formatted_address text,
    mechanic_notes text,
    odometer_meters text,
    safety_status text,
    second_signature_signed_at_time text,
    second_signature_type text,
    third_signature_signed_at_time text,
    third_signature_type text,
    "type" text,
    updated_at_time text,
    PRIMARY KEY (id),
    FOREIGN KEY (author_signature_signatory_user_id) REFERENCES users(id),
    FOREIGN KEY (second_signature_signatory_user_id) REFERENCES users(id),
    FOREIGN KEY (third_signature_signatory_user_id) REFERENCES users(id),
    FOREIGN KEY (trailer_id) REFERENCES trailer(id),
    FOREIGN KEY (vehicle_id) REFERENCES vehicle(id)
);

CREATE TABLE tag_address (
    "index" text,
    address_id text,
    tag_id text,
    PRIMARY KEY ("index", address_id),
    FOREIGN KEY (address_id) REFERENCES address(id),
    FOREIGN KEY (tag_id) REFERENCES tags(id)
);

CREATE TABLE address (
    id text,
    created_at_time text,
    external_id jsonb,
    formatted_address text,
    latitude double precision,
    longitude double precision,
    "name" text,
    notes text,
    settings_show_address boolean,
    "type" jsonb,
    PRIMARY KEY (id)
);

CREATE TABLE driver_vehicle_assignment (
    _fivetran_id text,
    driver_id text,
    vehicle_id text,
    assigned_at_time text,
    assignment_type text,
    end_time text,
    is_passenger boolean,
    metadata_source_name text,
    start_time text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (driver_id) REFERENCES driver(id),
    FOREIGN KEY (vehicle_id) REFERENCES vehicle(id)
);

CREATE TABLE equipment_stats (
    id text,
    gateway_engine_seconds_time text,
    gateway_engine_seconds_value text,
    gps_odometer_meters_time text,
    gps_odometer_meters_value text,
    obd_engine_seconds_time text,
    obd_engine_seconds_value text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES equipment(id)
);

CREATE TABLE gps_distance_meter (
    "time" text,
    vehicle_id text,
    "value" double precision,
    PRIMARY KEY ("time", vehicle_id),
    FOREIGN KEY (vehicle_id) REFERENCES vehicle(id)
);

CREATE TABLE gps_odometer (
    "time" text,
    vehicle_id text,
    "value" bigint,
    PRIMARY KEY ("time", vehicle_id),
    FOREIGN KEY (vehicle_id) REFERENCES vehicle(id)
);

CREATE TABLE obd_odometer (
    "time" text,
    vehicle_id text,
    "value" bigint,
    PRIMARY KEY ("time", vehicle_id),
    FOREIGN KEY (vehicle_id) REFERENCES vehicle(id)
);

CREATE TABLE accessory_device (
    serial text,
    gateway_id text,
    model text,
    PRIMARY KEY (serial),
    FOREIGN KEY (gateway_id) REFERENCES gateway(id)
);

CREATE TABLE gateway (
    id text,
    connection_status_health_status text,
    connection_status_last_connected text,
    model text,
    serial text,
    thirty_day_data_usage_bytes bigint,
    thirty_day_hotspot_usage_bytes bigint,
    PRIMARY KEY (id)
);

CREATE TABLE engine_rpm (
    "time" text,
    vehicle_id text,
    "value" text,
    PRIMARY KEY ("time", vehicle_id),
    FOREIGN KEY (vehicle_id) REFERENCES vehicle(id)
);

CREATE TABLE ambient_air_temperature_milli_c (
    "time" text,
    vehicle_id text,
    "value" text,
    PRIMARY KEY ("time", vehicle_id),
    FOREIGN KEY (vehicle_id) REFERENCES vehicle(id)
);

CREATE TABLE barometric_pressure_pa (
    "time" text,
    vehicle_id text,
    "value" text,
    PRIMARY KEY ("time", vehicle_id),
    FOREIGN KEY (vehicle_id) REFERENCES vehicle(id)
);

CREATE TABLE fuel_energy_by_vehicle_report (
    id text,
    distance_traveled_meters text,
    efficiency_mpge text,
    energy_type text,
    energy_used_kwh text,
    engine_idle_time_duration_milli_seconds text,
    engine_runtime_duration_milli_seconds text,
    est_carbon_emission_kg text,
    est_fuel_energy_cost_amount text,
    est_fuel_energy_cost_currency_code text,
    fuel_consumed_ml text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES vehicle(id)
);

CREATE TABLE fuel_energy_by_driver_report (
    id text,
    distance_traveled_meters text,
    efficiency_mpge text,
    energy_used_kwh text,
    engine_idle_time_duration_milli_seconds text,
    engine_runtime_duration_milli_seconds text,
    est_carbon_emission_kg text,
    est_fuel_energy_cost_amount text,
    est_fuel_energy_cost_currency_code text,
    fuel_consumed_ml text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES driver(id)
);

CREATE TABLE def_level_milli_percent (
    "time" text,
    vehicle_id text,
    "value" text,
    PRIMARY KEY ("time", vehicle_id),
    FOREIGN KEY (vehicle_id) REFERENCES vehicle(id)
);

CREATE TABLE ecu_speed_mph (
    "time" text,
    vehicle_id text,
    "value" text,
    PRIMARY KEY ("time", vehicle_id),
    FOREIGN KEY (vehicle_id) REFERENCES vehicle(id)
);

CREATE TABLE engine_coolant_temperature_milli_c (
    "time" text,
    vehicle_id text,
    "value" text,
    PRIMARY KEY ("time", vehicle_id),
    FOREIGN KEY (vehicle_id) REFERENCES vehicle(id)
);

CREATE TABLE engine_load_percent (
    "time" text,
    vehicle_id text,
    "value" text,
    PRIMARY KEY ("time", vehicle_id),
    FOREIGN KEY (vehicle_id) REFERENCES vehicle(id)
);

CREATE TABLE intake_manifold_temperature_milli_c (
    "time" text,
    vehicle_id text,
    "value" text,
    PRIMARY KEY ("time", vehicle_id),
    FOREIGN KEY (vehicle_id) REFERENCES vehicle(id)
);
