CREATE TABLE location_attribute (
    "index" text,
    location_id text,
    "name" text,
    "value" text,
    PRIMARY KEY ("index", location_id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE location (
    id text,
    archive_date text,
    comp_start_date text,
    currency text,
    current_utc_offset text,
    "name" text,
    parent_id text,
    store_id text,
    street_address text,
    time_zone text,
    time_zone_abbrev text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE network_interface (
    _fivetran_id text,
    camera_device_id text,
    gateway text,
    ip text,
    mac text,
    mode text,
    "name" text,
    subnet text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (camera_device_id) REFERENCES camera(device_id)
);

CREATE TABLE video_channel (
    uuid text,
    camera_device_id text,
    PRIMARY KEY (uuid, camera_device_id),
    FOREIGN KEY (camera_device_id) REFERENCES camera(device_id)
);

CREATE TABLE camera (
    device_id text,
    accessories text,
    analytics_direction_line_configured text,
    analytics_dwell_zone_count text,
    analytics_traffic_line_count text,
    appliance_id text,
    configuration_summary jsonb,
    date_added text,
    device_name text,
    dns_servers jsonb,
    firmware_version text,
    height text,
    last_heard text,
    model text,
    network_configuration_dns text,
    network_configuration_gateway text,
    network_configuration_ip text,
    network_configuration_mode text,
    network_configuration_ntp text,
    private_ip text,
    public_ip text,
    serial_number text,
    store_uuid text,
    "type" text,
    vendor text,
    video_channel_count text,
    PRIMARY KEY (device_id)
);

CREATE TABLE appliance (
    appliance_id text,
    store_uuid text,
    mac_address text,
    private_ip text,
    public_ip text,
    PRIMARY KEY (appliance_id),
    FOREIGN KEY (appliance_id) REFERENCES camera(appliance_id),
    FOREIGN KEY (store_uuid) REFERENCES camera(store_uuid)
);

CREATE TABLE datamine_metric_location (
    datamine_location_from_datetime text,
    datamine_location_name text,
    datamine_location_to_datetime text,
    group_from_gregorian text,
    location_id text,
    group_through_gregorian text,
    group_type text,
    "index" text,
    validity text,
    "value" text,
    PRIMARY KEY (datamine_location_from_datetime, datamine_location_name, datamine_location_to_datetime, group_from_gregorian, location_id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE channel (
    channel_uuid text,
    device_id text,
    blur_video text,
    bytes_per_day text,
    camera_model text,
    first_recorded_time text,
    frame_rate text,
    max_resolution text,
    maximun_retention_days text,
    minimum_retention_days text,
    motion_per_day text,
    "name" text,
    record_on_motion text,
    recording_enabled text,
    resolution text,
    snapshot_enabled text,
    snapshot_interval_secs text,
    snapshot_resolution text,
    PRIMARY KEY (channel_uuid),
    FOREIGN KEY (device_id) REFERENCES camera(device_id)
);

CREATE TABLE user_profile (
    id text,
    enterprise_groups jsonb,
    idle_timeout text,
    "name" text,
    subscription_admin text,
    use_idle_timeout text,
    PRIMARY KEY (id)
);

CREATE TABLE users_location (
    "index" text,
    users_id text,
    id text,
    PRIMARY KEY ("index", users_id),
    FOREIGN KEY (users_id) REFERENCES users(id),
    FOREIGN KEY (id) REFERENCES location(id)
);

CREATE TABLE users (
    id text,
    current_sign_in_at text,
    disabled text,
    email text,
    invitation_accepted text,
    invitation_locale text,
    last_sign_in_at text,
    location_profile_id text,
    "name" text,
    "type" text,
    user_profile_id text,
    PRIMARY KEY (id)
);
