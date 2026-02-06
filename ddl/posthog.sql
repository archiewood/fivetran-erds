CREATE TABLE annotation (
    id text,
    created_by_uuid text,
    project_id text,
    content text,
    created_at text,
    created_by_id text,
    creation_type text,
    dashboard_item text,
    date_marker text,
    deleted text,
    scope text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_uuid) REFERENCES users(uuid),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE "session" (
    id text,
    project_id text,
    is_numerical text,
    is_seen_on_filtered_events text,
    "name" text,
    property_type text,
    tags jsonb,
    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE cohort (
    id text,
    created_by_uuid text,
    project_id text,
    count text,
    created_at text,
    created_by_id text,
    deleted text,
    description text,
    error_calculating text,
    filters_properties_type text,
    filters_properties_value jsonb,
    groups jsonb,
    is_calculating text,
    is_static text,
    last_calculation text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_uuid) REFERENCES users(uuid),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE app_url (
    app_url text,
    project_id text,
    PRIMARY KEY (app_url, project_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE test_account_filter (
    _fivetran_id text,
    project_id text,
    "key" text,
    operator text,
    "type" text,
    "value" jsonb,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE path_cleaning_filter (
    _fivetran_id text,
    project_id text,
    "key" text,
    operator text,
    "type" text,
    "value" jsonb,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE persons_display_name_property (
    person_display_name_property text,
    project_id text,
    PRIMARY KEY (person_display_name_property, project_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE live_events_column (
    live_events_column text,
    project_id text,
    PRIMARY KEY (live_events_column, project_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE project (
    id text,
    access_control text,
    anonymize_ips text,
    completed_snippet_onboarding text,
    created_at text,
    data_attribute jsonb,
    effective_membership_level text,
    excluded_event_name jsonb,
    excluded_event_property_name jsonb,
    excluded_person_property_name jsonb,
    has_group_types text,
    ingested_event text,
    is_demo text,
    "name" text,
    organization text,
    primary_dashboard text,
    session_recording_opt_in text,
    slack_incoming_webhook text,
    timezone text,
    updated_at text,
    uuid text,
    PRIMARY KEY (id)
);

CREATE TABLE users (
    uuid text,
    anonymize_data text,
    date_joined text,
    distinct_id text,
    email text,
    email_opt_in text,
    first_name text,
    has_password text,
    is_impersonated text,
    is_staff text,
    toolbar_mode text,
    PRIMARY KEY (uuid)
);

CREATE TABLE insight_tag (
    tags text,
    insight_id text,
    PRIMARY KEY (tags, insight_id),
    FOREIGN KEY (insight_id) REFERENCES insight(id)
);

CREATE TABLE insight (
    id text,
    created_by_uuid text,
    last_modified_by_uuid text,
    project_id text,
    created_at text,
    created_by_id text,
    dashboards jsonb,
    deleted text,
    derived_name text,
    description text,
    effective_privilege_level text,
    effective_restriction_level text,
    favorited text,
    filters_hash text,
    is_sample text,
    last_modified_at text,
    last_modified_by_id text,
    last_refresh text,
    "name" text,
    orders text,
    refreshing text,
    "result" jsonb,
    saved text,
    short_id text,
    timezone jsonb,
    updated_at text,
    -- filter_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_uuid) REFERENCES users(uuid),
    FOREIGN KEY (last_modified_by_uuid) REFERENCES users(uuid),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE person_name (
    person_name text,
    person_id text,
    PRIMARY KEY (person_name, person_id),
    FOREIGN KEY (person_id) REFERENCES person(id)
);

CREATE TABLE person (
    id text,
    project_id text,
    created_at text,
    is_identified text,
    "name" text,
    "type" text,
    uuid text,
    -- property_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE cohort_person (
    person_uuid text,
    cohort_id text,
    project_id text,
    created_at text,
    is_identified text,
    matched_recordings jsonb,
    "name" text,
    "type" text,
    value_at_data_point text,
    PRIMARY KEY (person_uuid),
    FOREIGN KEY (person_uuid) REFERENCES person(id),
    FOREIGN KEY (cohort_id) REFERENCES cohort(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE session_recording (
    id text,
    person_uuid text,
    project_id text,
    active_seconds text,
    activity_score text,
    click_count text,
    console_error_count text,
    console_log_count text,
    console_warn_count text,
    distinct_id text,
    end_time text,
    inactive_seconds text,
    keypress_count text,
    mouse_activity_count text,
    ongoing text,
    person_id text,
    recording_duration text,
    snapshot_source text,
    start_time text,
    start_url text,
    storage text,
    viewed text,
    PRIMARY KEY (id),
    FOREIGN KEY (person_uuid) REFERENCES person(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE filter_group_property (
    _fivetran_id text,
    feature_flag_filter_group_index text,
    feature_flag_id text,
    "key" text,
    operator text,
    "type" text,
    "value" jsonb,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (feature_flag_filter_group_index) REFERENCES feature_flag_filter_group("index"),
    FOREIGN KEY (feature_flag_id) REFERENCES feature_flag_filter_group(feature_flag_id)
);

CREATE TABLE feature_flag_filter_group (
    "index" text,
    feature_flag_id text,
    rollout_percentage text,
    PRIMARY KEY ("index", feature_flag_id),
    FOREIGN KEY (feature_flag_id) REFERENCES feature_flag(id)
);

CREATE TABLE feature_flag (
    id text,
    created_by_uuid text,
    project_id text,
    active text,
    created_at text,
    created_by_id text,
    deleted text,
    ensure_experience_continuity text,
    filters_multivariate jsonb,
    is_simple_flag text,
    "key" text,
    "name" text,
    rollout_percentage text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_uuid) REFERENCES users(uuid),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE event (
    id text,
    distinct_id text,
    project_id text,
    elements jsonb,
    elements_chain text,
    event text,
    groups_customer text,
    groups_project text,
    groups_user text,
    person_distinct_ids jsonb,
    person_is_identified text,
    person_properties jsonb,
    time_stamp text,
    -- properties_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (distinct_id) REFERENCES person_name(person_name),
    FOREIGN KEY (project_id) REFERENCES project(id)
);
