CREATE TABLE site (
    id text,
    city text,
    country text,
    geolocation_accuracy text,
    geolocation_center text,
    geolocation_coordinate text,
    geolocation_relevance text,
    geolocation_valid_address text,
    "name" text,
    owner_object_id text,
    parent_id text,
    postal_code text,
    "state" text,
    street_address_1 text,
    street_address_2 text,
    time_zone text,
    PRIMARY KEY (id)
);

CREATE TABLE audit_event_property_change (
    "index" text,
    audit_event_uuid text,
    current_value text,
    previous_value text,
    property text,
    PRIMARY KEY ("index", audit_event_uuid),
    FOREIGN KEY (audit_event_uuid) REFERENCES audit_event(uuid)
);

CREATE TABLE audit_event (
    uuid text,
    actor_id text,
    actor_identity_type text,
    actor_name text,
    event_action_allowed text,
    event_actor_user_type_id text,
    event_credential_label text,
    event_credential_object_id text,
    event_detail text,
    event_object_id text,
    event_object_identity_type text,
    event_object_name text,
    event_object_subtype_id text,
    event_object_type_id text,
    event_user_group_name text,
    event_user_type_id text,
    object_type text,
    occurred text,
    processed text,
    security_action text,
    security_action_exception text,
    security_action_id text,
    PRIMARY KEY (uuid)
);

CREATE TABLE user_custom_field (
    id text,
    user_id text,
    field_name text,
    field_type text,
    "value" text,
    PRIMARY KEY (id, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE access_event (
    uuid text,
    site_id text,
    actor_id text,
    actor_identity_type text,
    actor_name text,
    event_action_allowed text,
    event_credential_object_id text,
    event_detail text,
    event_object_device_type_id text,
    event_object_device_type_name text,
    event_object_group_name text,
    event_object_id text,
    event_object_name text,
    event_object_subtype_id text,
    event_object_type_id text,
    event_user_type_id text,
    object_type text,
    occurred text,
    processed text,
    security_action text,
    security_action_exception text,
    security_action_id text,
    PRIMARY KEY (uuid),
    FOREIGN KEY (site_id) REFERENCES site(id)
);

CREATE TABLE camera (
    id text,
    site_id text,
    "name" text,
    video_provider_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (site_id) REFERENCES site(id)
);

CREATE TABLE event_subscription_criteria (
    id text,
    event_subscription_id text,
    operation_type text,
    "type" text,
    "value" text,
    PRIMARY KEY (id, event_subscription_id),
    FOREIGN KEY (event_subscription_id) REFERENCES event_subscription(id)
);

CREATE TABLE event_subscription (
    id text,
    error_email text,
    "name" text,
    url text,
    PRIMARY KEY (id)
);

CREATE TABLE account (
    id text,
    master_admin_email text,
    master_admin_first_name text,
    master_admin_last_name text,
    master_admin_username text,
    "name" text,
    number text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE access_point (
    id text,
    site_id text,
    activation_enabled text,
    control_panel_id text,
    "name" text,
    report_live_status text,
    two_factor_enabled text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (site_id) REFERENCES site(id)
);

CREATE TABLE schedule_holiday (
    "index" text,
    schedule_id text,
    end_date text,
    "name" text,
    start_date text,
    PRIMARY KEY ("index", schedule_id),
    FOREIGN KEY (schedule_id) REFERENCES schedule(id)
);

CREATE TABLE schedule_exception (
    "index" text,
    schedule_id text,
    enabling text,
    end_time text,
    recurrence_day text,
    recurrence_type text,
    recurrence_week_of_month text,
    start_time text,
    PRIMARY KEY ("index", schedule_id),
    FOREIGN KEY (schedule_id) REFERENCES schedule(id)
);

CREATE TABLE schedule (
    id text,
    site_id text,
    editable text,
    enabling_group_id text,
    enabling_group_name text,
    grace_period text,
    "name" text,
    schedule_block_friday jsonb,
    schedule_block_holiday jsonb,
    schedule_block_monday jsonb,
    schedule_block_saturday jsonb,
    schedule_block_sunday jsonb,
    schedule_block_thursday jsonb,
    schedule_block_tuesday jsonb,
    schedule_block_wednesday jsonb,
    PRIMARY KEY (id),
    FOREIGN KEY (site_id) REFERENCES site(id)
);

CREATE TABLE user_email (
    "index" text,
    user_id text,
    address text,
    "type" text,
    PRIMARY KEY ("index", user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE user_phone_number (
    "index" text,
    user_id text,
    number text,
    "type" text,
    PRIMARY KEY ("index", user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    ble_two_factor_exempt text,
    created text,
    first_name text,
    last_name text,
    suspended text,
    updated text,
    PRIMARY KEY (id)
);
