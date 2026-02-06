CREATE TABLE location_collaborator (
    "index" text,
    account_id text,
    location_id text,
    email text,
    role_name text,
    PRIMARY KEY ("index", account_id, location_id),
    FOREIGN KEY (account_id) REFERENCES location(account_id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE location (
    id text,
    account_id text,
    country text,
    formatted_address text,
    latitude text,
    locality text,
    longitude text,
    "name" text,
    number_of_shipments_using text,
    postal_code text,
    radius_value text,
    selected_radius_unit text,
    "state" text,
    street text,
    sublocality text,
    PRIMARY KEY (id, account_id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE shipment_device (
    device_id text,
    public_shipment_id text,
    shipment_id text,
    PRIMARY KEY (device_id, public_shipment_id, shipment_id),
    FOREIGN KEY (device_id) REFERENCES device(id),
    FOREIGN KEY (public_shipment_id) REFERENCES shipment(public_shipment_id),
    FOREIGN KEY (shipment_id) REFERENCES shipment(id)
);

CREATE TABLE shipment_leg (
    "index" text,
    public_shipment_id text,
    shipment_id text,
    carrier_id text,
    airway_bill text,
    container_id text,
    current_eta_utc text,
    distance_left_km text,
    eta_date text,
    from_country text,
    from_latitude text,
    from_locality text,
    from_longitude text,
    from_postalcode text,
    from_state text,
    from_street text,
    is_active_leg_of_shipment text,
    leg_label text,
    mode text,
    order_no text,
    ship_from_date text,
    start_date_time_utc text,
    to_country text,
    to_latitude text,
    to_locality text,
    to_longitude text,
    to_postalcode text,
    to_state text,
    to_street text,
    PRIMARY KEY ("index", public_shipment_id, shipment_id),
    FOREIGN KEY (public_shipment_id) REFERENCES shipment(public_shipment_id),
    FOREIGN KEY (shipment_id) REFERENCES shipment(id),
    FOREIGN KEY (carrier_id) REFERENCES carrier(id)
);

CREATE TABLE shipment (
    id text,
    public_shipment_id text,
    account_id text,
    auto_complete text,
    auto_complete_minutes_delay text,
    eta_date text,
    is_completed text,
    is_departed text,
    is_shared text,
    is_started text,
    shared_url text,
    ship_from_date text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id, public_shipment_id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE device_alert_reason (
    "index" text,
    account_id text,
    alert_id text,
    device_alert_detail_index text,
    device_id text,
    reason text,
    PRIMARY KEY ("index", account_id, alert_id, device_alert_detail_index, device_id),
    FOREIGN KEY (account_id) REFERENCES device_alert(account_id),
    FOREIGN KEY (alert_id) REFERENCES device_alert(alert_id),
    FOREIGN KEY (device_alert_detail_index) REFERENCES device_alert_detail("index"),
    FOREIGN KEY (device_id) REFERENCES device_alert(device_id)
);

CREATE TABLE device_alert_detail (
    "index" text,
    account_id text,
    alert_id text,
    device_id text,
    country text,
    date_time text,
    formatted_address text,
    latitude text,
    locality text,
    location_method text,
    location_name text,
    longitude text,
    postalcode text,
    "state" text,
    street text,
    sublocality text,
    "type" text,
    PRIMARY KEY ("index", account_id, alert_id, device_id),
    FOREIGN KEY (account_id) REFERENCES device_alert(account_id),
    FOREIGN KEY (alert_id) REFERENCES device_alert(alert_id),
    FOREIGN KEY (device_id) REFERENCES device_alert(device_id)
);

CREATE TABLE device_alert (
    alert_id text,
    account_id text,
    device_id text,
    alert_preset_id text,
    public_shipment_id text,
    shipment_id text,
    alert_on text,
    interval_delay text,
    interval_delay_unit text,
    is_active_at_destination text,
    is_active_at_origin text,
    is_active_in_transit text,
    is_closed text,
    is_enabled text,
    trigger_unit text,
    trigger_value text,
    "type" text,
    PRIMARY KEY (alert_id, account_id, device_id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (device_id) REFERENCES device(id),
    FOREIGN KEY (alert_preset_id) REFERENCES alert_preset(id),
    FOREIGN KEY (public_shipment_id) REFERENCES shipment(public_shipment_id),
    FOREIGN KEY (shipment_id) REFERENCES shipment(id)
);

CREATE TABLE carrier_contact (
    id text,
    account_id text,
    carrier_id text,
    email text,
    first_name text,
    languages text,
    last_name text,
    phone_number text,
    PRIMARY KEY (id, account_id, carrier_id),
    FOREIGN KEY (account_id) REFERENCES carrier(account_id),
    FOREIGN KEY (carrier_id) REFERENCES carrier(id)
);

CREATE TABLE carrier (
    id text,
    account_id text,
    mode text,
    "name" text,
    standardized_carrier_id text,
    standardized_carrier_name text,
    PRIMARY KEY (id, account_id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE account_user_id (
    user_id text,
    account_id text,
    PRIMARY KEY (user_id, account_id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE account (
    id text,
    account_name text,
    autocomplete_shipment_delay_minute text,
    disabled text,
    webhook_id jsonb,
    PRIMARY KEY (id)
);

CREATE TABLE device_alert_preset_id (
    account_id text,
    alert_preset_id text,
    device_id text,
    PRIMARY KEY (account_id, alert_preset_id, device_id),
    FOREIGN KEY (account_id) REFERENCES device(account_id),
    FOREIGN KEY (alert_preset_id) REFERENCES alert_preset(id),
    FOREIGN KEY (device_id) REFERENCES device(id)
);

CREATE TABLE device (
    id text,
    account_id text,
    battery_percent text,
    device_name text,
    device_owner text,
    estimated_battery_life_minutes text,
    gps_enabled text,
    measurement_interval text,
    power_button_enabled text,
    transmission_interval text,
    wifi_enabled text,
    PRIMARY KEY (id, account_id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE shipment_tracker_data (
    measurement_time text,
    device_id text,
    public_shipment_id text,
    shipment_id text,
    account_id text,
    acceleration_g text,
    acceleration_x text,
    acceleration_y text,
    acceleration_z text,
    battery text,
    coordinates_latitude text,
    coordinates_longitude text,
    humidity text,
    light text,
    location text,
    location_method text,
    motion text,
    pressure text,
    probe_temperature text,
    process_time text,
    temperature text,
    PRIMARY KEY (measurement_time, device_id, public_shipment_id, shipment_id),
    FOREIGN KEY (device_id) REFERENCES device(id),
    FOREIGN KEY (public_shipment_id) REFERENCES shipment(public_shipment_id),
    FOREIGN KEY (shipment_id) REFERENCES shipment(id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE shipment_status (
    public_shipment_id text,
    shipment_id text,
    account_id text,
    completed_at text,
    completed_by_user text,
    country text,
    current_humidity text,
    current_light text,
    current_locationformatted_address text,
    current_locationlocation_method text,
    current_locationname text,
    current_pressure text,
    current_probe_temperature text,
    current_temperature text,
    degree_minutes_temperature text,
    delivered_at text,
    departed_at text,
    distance_remaining text,
    distance_travelled text,
    last_updated_at text,
    latitude text,
    locality text,
    longitude text,
    mean_kinetic_temperature text,
    postal_code text,
    standard_deviation_temperature text,
    started_at text,
    started_by_user text,
    "state" text,
    street text,
    total_distance text,
    PRIMARY KEY (public_shipment_id, shipment_id),
    FOREIGN KEY (public_shipment_id) REFERENCES shipment(public_shipment_id),
    FOREIGN KEY (shipment_id) REFERENCES shipment(id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE shipment_alert_reason (
    "index" text,
    alert_id text,
    public_shipment_id text,
    shipment_alert_detail_index text,
    shipment_id text,
    reason text,
    PRIMARY KEY ("index", alert_id, public_shipment_id, shipment_alert_detail_index, shipment_id),
    FOREIGN KEY (alert_id) REFERENCES shipment_alert(alert_id),
    FOREIGN KEY (public_shipment_id) REFERENCES shipment_alert(public_shipment_id),
    FOREIGN KEY (shipment_alert_detail_index) REFERENCES shipment_alert_detail("index"),
    FOREIGN KEY (shipment_id) REFERENCES shipment_alert(shipment_id)
);

CREATE TABLE shipment_alert_detail (
    "index" text,
    alert_id text,
    public_shipment_id text,
    shipment_id text,
    celsius text,
    date_time text,
    fahrenheit text,
    location_coordinates_latitude text,
    location_coordinates_longitude text,
    location_formatted_address text,
    location_location_method text,
    "type" text,
    PRIMARY KEY ("index", alert_id, public_shipment_id, shipment_id),
    FOREIGN KEY (alert_id) REFERENCES shipment_alert(alert_id),
    FOREIGN KEY (public_shipment_id) REFERENCES shipment_alert(public_shipment_id),
    FOREIGN KEY (shipment_id) REFERENCES shipment_alert(shipment_id)
);

CREATE TABLE shipment_alert (
    alert_id text,
    public_shipment_id text,
    shipment_id text,
    account_id text,
    alert_preset_id text,
    device_id text,
    alert_on text,
    interval_delay text,
    interval_delay_unit text,
    is_active_at_destination text,
    is_active_at_origin text,
    is_active_in_transit text,
    is_closed text,
    is_enabled text,
    trigger_unit text,
    trigger_value text,
    "type" text,
    PRIMARY KEY (alert_id, public_shipment_id, shipment_id),
    FOREIGN KEY (public_shipment_id) REFERENCES shipment(public_shipment_id),
    FOREIGN KEY (shipment_id) REFERENCES shipment(id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (alert_preset_id) REFERENCES alert_preset(id),
    FOREIGN KEY (device_id) REFERENCES device(id)
);

CREATE TABLE alert_preset_assignee (
    assignee text,
    account_id text,
    alert_preset_id text,
    PRIMARY KEY (assignee, account_id, alert_preset_id),
    FOREIGN KEY (account_id) REFERENCES alert_preset(account_id),
    FOREIGN KEY (alert_preset_id) REFERENCES alert_preset(id)
);

CREATE TABLE alert_preset (
    id text,
    account_id text,
    description text,
    "name" text,
    notify_all_collaborators text,
    notify_when_active text,
    PRIMARY KEY (id, account_id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE alert_preset_trigger (
    "index" text,
    trigger_type text,
    account_id text,
    alert_preset_id text,
    interval_delay text,
    interval_delay_unit text,
    is_active_at_destination text,
    is_active_at_origin text,
    is_active_in_transit text,
    trigger_unit text,
    trigger_value text,
    "type" text,
    PRIMARY KEY ("index", trigger_type, account_id, alert_preset_id),
    FOREIGN KEY (account_id) REFERENCES alert_preset(account_id),
    FOREIGN KEY (alert_preset_id) REFERENCES alert_preset(id)
);
