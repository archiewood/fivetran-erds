-- Note
-- All tables with prefix ds_ will only be synced when data sync is enabled on the pendo setup form.

CREATE TABLE guide_step_history (
    guide_id text,
    guide_last_updated_at timestamp,
    step_id text,
    PRIMARY KEY (guide_id, guide_last_updated_at, step_id),
    FOREIGN KEY (guide_id) REFERENCES guide_history(id),
    FOREIGN KEY (guide_last_updated_at) REFERENCES guide_history(id),
    FOREIGN KEY (step_id) REFERENCES step_history(id)
);

CREATE TABLE track_type_rule_history (
    rule text,
    track_id text,
    track_last_updated_at timestamp,
    PRIMARY KEY (rule, track_id, track_last_updated_at),
    FOREIGN KEY (track_id) REFERENCES track_type_history(id),
    FOREIGN KEY (track_last_updated_at) REFERENCES track_type_history(id)
);

CREATE TABLE page_event (
    _fivetran_id text,
    remote_ip text,
    server_name text,
    "timestamp" timestamp,
    user_agent text,
    account_id text,
    page_id text,
    visitor_id text,
    app_id text,
    num_events integer,
    num_minutes integer,
    PRIMARY KEY (_fivetran_id, remote_ip, server_name, "timestamp", user_agent, account_id, page_id, visitor_id),
    FOREIGN KEY (account_id) REFERENCES account_history(last_updated_at),
    FOREIGN KEY (page_id) REFERENCES page_history(id),
    FOREIGN KEY (visitor_id) REFERENCES visitor_history(last_updated_at),
    FOREIGN KEY (app_id) REFERENCES application_history(id)
);

CREATE TABLE ds_feature_history (
    feature_id text,
    last_updated_at bigint,
    page_id text,
    created_at bigint,
    is_core_event boolean,
    kind text,
    "name" text,
    PRIMARY KEY (feature_id, last_updated_at),
    FOREIGN KEY (page_id) REFERENCES ds_page_history(page_id)
);

CREATE TABLE ds_track_type_history (
    last_updated_at bigint,
    track_type_id text,
    created_at bigint,
    is_core_event boolean,
    kind text,
    "name" text,
    PRIMARY KEY (last_updated_at, track_type_id)
);

CREATE TABLE poll (
    id text,
    question text,
    reset_at timestamp,
    -- attribute_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE guide_event (
    _fivetran_id text,
    remote_ip text,
    server_name text,
    "timestamp" timestamp,
    user_agent text,
    account_id text,
    guide_id text,
    visitor_id text,
    app_id text,
    country text,
    element_path text,
    event_id text,
    guide_step_id text,
    latitude double precision,
    load_time integer,
    longitude double precision,
    region text,
    "type" text,
    ui_element_actions text,
    ui_element_id text,
    ui_element_text text,
    ui_element_type text,
    url text,
    PRIMARY KEY (_fivetran_id, remote_ip, server_name, "timestamp", user_agent, account_id, guide_id, visitor_id),
    FOREIGN KEY (account_id) REFERENCES account_history(last_updated_at),
    FOREIGN KEY (guide_id) REFERENCES guide_history(id),
    FOREIGN KEY (visitor_id) REFERENCES visitor_history(last_updated_at),
    FOREIGN KEY (app_id) REFERENCES application_history(id)
);

CREATE TABLE ds_feature_event (
    event_id text,
    period_id text,
    feature_id text,
    guide_id text,
    guide_step_id text,
    account_id text,
    browser_timestamp timestamp,
    country text,
    destination_step_id text,
    element_path text,
    event_class text,
    event_source text,
    event_type text,
    guide_seen_reason text,
    guide_seen_timeout_ms bigint,
    guide_session_id text,
    guide_snooze_duration_ms bigint,
    language text,
    latitude double precision,
    load_duration_ms bigint,
    longitude double precision,
    old_visitor_id text,
    poll_id text,
    poll_response text,
    poll_type text,
    region text,
    remote_ip text,
    server text,
    ui_element_actions text,
    ui_element_id text,
    ui_element_text text,
    ui_element_type text,
    url text,
    user_agent text,
    visitor_id text,
    PRIMARY KEY (event_id, period_id, feature_id),
    FOREIGN KEY (feature_id) REFERENCES ds_feature_history(feature_id),
    FOREIGN KEY (guide_id) REFERENCES ds_guide_history(guide_id),
    FOREIGN KEY (guide_step_id) REFERENCES ds_guide_step_history(guide_id)
);

CREATE TABLE ds_track_type_event_property_history (
    event_property_name text,
    last_updated_at bigint,
    track_type_id text,
    PRIMARY KEY (event_property_name, last_updated_at, track_type_id),
    FOREIGN KEY (last_updated_at) REFERENCES ds_track_type_history(track_type_id),
    FOREIGN KEY (track_type_id) REFERENCES ds_track_type_history(track_type_id)
);

CREATE TABLE poll_event (
    _fivetran_id text,
    remote_ip text,
    server_name text,
    "timestamp" timestamp,
    user_agent text,
    account_id text,
    guide_id text,
    poll_id text,
    visitor_id text,
    app_id text,
    country text,
    element_path text,
    event_id text,
    guide_step_id text,
    latitude double precision,
    load_time integer,
    longitude double precision,
    poll_response text,
    region text,
    "type" text,
    url text,
    PRIMARY KEY (_fivetran_id, remote_ip, server_name, "timestamp", user_agent, account_id, guide_id, poll_id, visitor_id),
    FOREIGN KEY (account_id) REFERENCES account_history(last_updated_at),
    FOREIGN KEY (guide_id) REFERENCES guide_history(id),
    FOREIGN KEY (poll_id) REFERENCES poll(id),
    FOREIGN KEY (visitor_id) REFERENCES visitor_history(last_updated_at),
    FOREIGN KEY (app_id) REFERENCES application_history(id)
);

CREATE TABLE step_thumbnail_url_history (
    url text,
    step_id text,
    step_last_updated_at timestamp,
    PRIMARY KEY (url, step_id, step_last_updated_at),
    FOREIGN KEY (step_id) REFERENCES step_history(id),
    FOREIGN KEY (step_last_updated_at) REFERENCES step_history(id)
);

CREATE TABLE track_type_history (
    id text,
    last_updated_at timestamp,
    app_id text,
    created_by_user_id text,
    group_id text,
    last_updated_by_user_id text,
    color text,
    created_at timestamp,
    description text,
    dirty boolean,
    "name" text,
    root_version_id text,
    stable_version_id text,
    track_type_name text,
    valid_through timestamp,
    PRIMARY KEY (id, last_updated_at),
    FOREIGN KEY (app_id) REFERENCES application_history(id),
    FOREIGN KEY (created_by_user_id) REFERENCES "user"(id),
    FOREIGN KEY (group_id) REFERENCES "group"(id),
    FOREIGN KEY (last_updated_by_user_id) REFERENCES "user"(id)
);

CREATE TABLE step_poll_history (
    poll_id text,
    step_id text,
    step_last_updated_at timestamp,
    PRIMARY KEY (poll_id, step_id, step_last_updated_at),
    FOREIGN KEY (poll_id) REFERENCES poll(id),
    FOREIGN KEY (step_id) REFERENCES step_history(id),
    FOREIGN KEY (step_last_updated_at) REFERENCES step_history(id)
);

CREATE TABLE visitor_account_history (
    account_id text,
    visitor_id text,
    visitor_last_updated_at timestamp,
    PRIMARY KEY (account_id, visitor_id, visitor_last_updated_at),
    FOREIGN KEY (account_id) REFERENCES account_history(last_updated_at),
    FOREIGN KEY (visitor_id) REFERENCES visitor_history(last_updated_at),
    FOREIGN KEY (visitor_last_updated_at) REFERENCES visitor_history(last_updated_at)
);

CREATE TABLE "group" (
    id text,
    app_id text,
    created_by_user_id text,
    last_updated_by_user_id text,
    color text,
    created_at timestamp,
    description text,
    last_updated_at timestamp,
    length integer,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (app_id) REFERENCES application_history(id),
    FOREIGN KEY (created_by_user_id) REFERENCES "user"(id),
    FOREIGN KEY (last_updated_by_user_id) REFERENCES "user"(id)
);

CREATE TABLE feature_event (
    _fivetran_id text,
    remote_ip text,
    server_name text,
    "timestamp" timestamp,
    user_agent text,
    account_id text,
    feature_id text,
    visitor_id text,
    app_id text,
    num_events integer,
    num_minutes integer,
    PRIMARY KEY (_fivetran_id, remote_ip, server_name, "timestamp", user_agent, account_id, feature_id, visitor_id),
    FOREIGN KEY (account_id) REFERENCES account_history(last_updated_at),
    FOREIGN KEY (feature_id) REFERENCES feature_history(id),
    FOREIGN KEY (visitor_id) REFERENCES visitor_history(last_updated_at),
    FOREIGN KEY (app_id) REFERENCES application_history(id)
);

CREATE TABLE guide_history (
    id text,
    last_updated_at timestamp,
    app_id text,
    created_by_user_id text,
    last_updated_by_user_id text,
    audience jsonb,
    audience_ui_hint jsonb,
    authored_language text,
    created_at timestamp,
    current_first_eligible_to_be_seen_at timestamp,
    description text,
    editor_type text,
    email_state text,
    is_module boolean,
    is_multi_step boolean,
    is_top_level boolean,
    is_training boolean,
    kind text,
    launch_method text,
    "name" text,
    published_at timestamp,
    published_ever boolean,
    recurrence bigint,
    recurrence_eligibility_window bigint,
    reset_at timestamp,
    root_version_id text,
    stable_version_id text,
    "state" text,
    -- attribute_* (dynamic column),
    PRIMARY KEY (id, last_updated_at),
    FOREIGN KEY (app_id) REFERENCES application_history(id),
    FOREIGN KEY (created_by_user_id) REFERENCES "user"(id),
    FOREIGN KEY (last_updated_by_user_id) REFERENCES "user"(id)
);

CREATE TABLE feature_element_path_rule_history (
    rule text,
    feature_id text,
    feature_last_updated_at timestamp,
    PRIMARY KEY (rule, feature_id, feature_last_updated_at),
    FOREIGN KEY (feature_id) REFERENCES feature_history(id),
    FOREIGN KEY (feature_last_updated_at) REFERENCES feature_history(id)
);

CREATE TABLE picklist_poll_response (
    response_id text,
    poll_id text,
    response_text text,
    PRIMARY KEY (response_id, poll_id),
    FOREIGN KEY (poll_id) REFERENCES poll(id)
);

CREATE TABLE account_history (
    id text,
    last_updated_at timestamp,
    first_visit timestamp,
    id_hash bigint,
    last_visit timestamp,
    PRIMARY KEY (id, last_updated_at)
);

CREATE TABLE feature_history (
    id text,
    last_updated_at timestamp,
    app_id text,
    created_by_user_id text,
    group_id text,
    last_updated_by_user_id text,
    page_id text,
    color text,
    created_at timestamp,
    description text,
    dirty boolean,
    is_core_event boolean,
    "name" text,
    root_version_id text,
    stable_version_id text,
    valid_through timestamp,
    PRIMARY KEY (id, last_updated_at),
    FOREIGN KEY (app_id) REFERENCES application_history(id),
    FOREIGN KEY (created_by_user_id) REFERENCES "user"(id),
    FOREIGN KEY (group_id) REFERENCES "group"(id),
    FOREIGN KEY (last_updated_by_user_id) REFERENCES "user"(id),
    FOREIGN KEY (page_id) REFERENCES page_history(id)
);

CREATE TABLE ds_page_history (
    last_updated_at bigint,
    page_id text,
    created_at bigint,
    is_core_event boolean,
    kind text,
    "name" text,
    rules_json text,
    PRIMARY KEY (last_updated_at, page_id)
);

CREATE TABLE track_type_event (
    _fivetran_id text,
    remote_ip text,
    server_name text,
    time_stamp timestamp,
    user_agent text,
    account_id text,
    track_type_id text,
    visitor_id text,
    app_id text,
    num_events integer,
    num_minutes integer,
    PRIMARY KEY (_fivetran_id, remote_ip, server_name, time_stamp, user_agent, account_id, track_type_id, visitor_id),
    FOREIGN KEY (account_id) REFERENCES account_history(last_updated_at),
    FOREIGN KEY (track_type_id) REFERENCES track_type_history(id),
    FOREIGN KEY (visitor_id) REFERENCES visitor_history(last_updated_at),
    FOREIGN KEY (app_id) REFERENCES application_history(id)
);

CREATE TABLE ds_guide_history (
    guide_id text,
    last_updated_at bigint,
    audience_ui_hint text,
    created_at bigint,
    email_state text,
    is_multi_step boolean,
    is_training boolean,
    kind text,
    launch_method text,
    "name" text,
    published_at bigint,
    recurrence bigint,
    recurrence_eligibility_window bigint,
    reset_at bigint,
    "state" text,
    PRIMARY KEY (guide_id, last_updated_at)
);

CREATE TABLE account_application_history (
    account_id text,
    account_last_updated_at timestamp,
    app_id text,
    first_visit timestamp,
    id_hash bigint,
    last_updated timestamp,
    last_visit timestamp,
    PRIMARY KEY (account_id, account_last_updated_at, app_id),
    FOREIGN KEY (account_id) REFERENCES account_history(last_updated_at),
    FOREIGN KEY (account_last_updated_at) REFERENCES account_history(last_updated_at),
    FOREIGN KEY (app_id) REFERENCES application_history(id)
);

CREATE TABLE page_history (
    id text,
    last_updated_at timestamp,
    app_id text,
    created_by_user_id text,
    group_id text,
    last_updated_by_user_id text,
    color text,
    created_at timestamp,
    description text,
    dirty boolean,
    is_core_event boolean,
    is_suggested boolean,
    kind text,
    "name" text,
    root_version_id text,
    stable_version_id text,
    valid_through timestamp,
    PRIMARY KEY (id, last_updated_at),
    FOREIGN KEY (app_id) REFERENCES application_history(id),
    FOREIGN KEY (created_by_user_id) REFERENCES "user"(id),
    FOREIGN KEY (group_id) REFERENCES "group"(id),
    FOREIGN KEY (last_updated_by_user_id) REFERENCES "user"(id)
);

CREATE TABLE event (
    _fivetran_id text,
    account_id text,
    app_id text,
    visitor_id text,
    num_events integer,
    num_minutes integer,
    page_id text,
    remote_ip text,
    server_name text,
    "timestamp" timestamp,
    user_agent text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (account_id) REFERENCES account_history(last_updated_at),
    FOREIGN KEY (app_id) REFERENCES application_history(id),
    FOREIGN KEY (visitor_id) REFERENCES visitor_history(last_updated_at)
);

CREATE TABLE step_history (
    id text,
    last_updated_at timestamp,
    page_id text,
    advance_method text,
    building_blocks_url text,
    content_type text,
    content_url text,
    content_url_css text,
    content_url_js text,
    dom_jsonp_url text,
    dom_url text,
    element_path_rule text,
    rank bigint,
    regex_url_rule text,
    reset_at timestamp,
    template_id text,
    "type" text,
    -- attribute_* (dynamic column),
    PRIMARY KEY (id, last_updated_at),
    FOREIGN KEY (page_id) REFERENCES page_history(id)
);

CREATE TABLE "user" (
    id text,
    deleted_at timestamp,
    first_name text,
    last_name text,
    "role" integer,
    user_type text,
    username text,
    PRIMARY KEY (id)
);

CREATE TABLE visitor_application_history (
    app_id text,
    visitor_id text,
    visitor_last_updated_at timestamp,
    first_visit timestamp,
    id_hash bigint,
    last_browser_name text,
    last_browser_version text,
    last_operating_system text,
    last_server_name text,
    last_updated timestamp,
    last_user_agent text,
    last_visit timestamp,
    n_id bigint,
    PRIMARY KEY (app_id, visitor_id, visitor_last_updated_at),
    FOREIGN KEY (app_id) REFERENCES application_history(id),
    FOREIGN KEY (visitor_id) REFERENCES visitor_history(last_updated_at),
    FOREIGN KEY (visitor_last_updated_at) REFERENCES visitor_history(last_updated_at)
);

CREATE TABLE ds_guide_step_history (
    guide_step_id text,
    guide_id text,
    last_updated_at bigint,
    app_relay_url text,
    "name" text,
    page_id text,
    PRIMARY KEY (guide_step_id, guide_id, last_updated_at),
    FOREIGN KEY (guide_id) REFERENCES ds_guide_history(guide_id),
    FOREIGN KEY (last_updated_at) REFERENCES ds_guide_history(guide_id)
);

CREATE TABLE ds_event (
    event_id text,
    guide_id text,
    guide_step_id text,
    account_id text,
    browser_timestamp timestamp,
    country text,
    destination_step_id text,
    element_path text,
    event_class text,
    event_source text,
    event_type text,
    guide_seen_reason text,
    guide_seen_timeout_ms bigint,
    guide_session_id text,
    guide_snooze_duration_ms bigint,
    language text,
    latitude double precision,
    load_duration_ms bigint,
    longitude double precision,
    old_visitor_id text,
    period_id text,
    poll_id text,
    poll_response text,
    poll_type text,
    region text,
    remote_ip text,
    server text,
    ui_element_actions text,
    ui_element_id text,
    ui_element_text text,
    ui_element_type text,
    url text,
    user_agent text,
    visitor_id text,
    PRIMARY KEY (event_id),
    FOREIGN KEY (guide_id) REFERENCES ds_guide_history(guide_id),
    FOREIGN KEY (guide_step_id) REFERENCES ds_guide_step_history(guide_id)
);

CREATE TABLE application_history (
    id text,
    last_updated_at timestamp,
    agent_policy_prod text,
    agent_policy_staging text,
    agent_version_prod text,
    agent_version_staging text,
    created_at timestamp,
    created_by_user_id text,
    description text,
    disabled_at timestamp,
    display_name text,
    event_count bigint,
    event_rate integer,
    first_event_time timestamp,
    guide_css_url text,
    icon_url text,
    integrated boolean,
    is_deleted boolean,
    last_updated_by_user_id text,
    marked_for_deletion_at timestamp,
    "name" text,
    platform text,
    push_application_id text,
    record_until timestamp,
    sampling_rate timestamp,
    starting_event_time timestamp,
    store_url text,
    subscription_id text,
    -- application_flags_* (dynamic column),
    PRIMARY KEY (id, last_updated_at)
);

CREATE TABLE ds_track_type_event (
    event_id text,
    period_id text,
    track_type_id text,
    guide_id text,
    guide_step_id text,
    account_id text,
    browser_timestamp timestamp,
    country text,
    destination_step_id text,
    element_path text,
    event_class text,
    event_source text,
    event_type text,
    guide_seen_reason text,
    guide_seen_timeout_ms bigint,
    guide_session_id text,
    guide_snooze_duration_ms bigint,
    language text,
    latitude double precision,
    load_duration_ms bigint,
    longitude double precision,
    old_visitor_id text,
    poll_id text,
    poll_response text,
    poll_type text,
    region text,
    remote_ip text,
    server text,
    ui_element_actions text,
    ui_element_id text,
    ui_element_text text,
    ui_element_type text,
    url text,
    user_agent text,
    visitor_id text,
    PRIMARY KEY (event_id, period_id, track_type_id),
    FOREIGN KEY (track_type_id) REFERENCES ds_track_type_history(track_type_id),
    FOREIGN KEY (guide_id) REFERENCES ds_guide_history(guide_id),
    FOREIGN KEY (guide_step_id) REFERENCES ds_guide_step_history(guide_id)
);

CREATE TABLE page_rule_history (
    rule text,
    page_id text,
    page_last_updated_at timestamp,
    designer_hint text,
    parsed_rule text,
    PRIMARY KEY (rule, page_id, page_last_updated_at),
    FOREIGN KEY (page_id) REFERENCES page_history(id),
    FOREIGN KEY (page_last_updated_at) REFERENCES page_history(id)
);

CREATE TABLE ds_page_event (
    event_id text,
    period_id text,
    page_id text,
    guide_id text,
    guide_step_id text,
    account_id text,
    browser_timestamp timestamp,
    country text,
    destination_step_id text,
    element_path text,
    event_class text,
    event_source text,
    event_type text,
    guide_seen_reason text,
    guide_seen_timeout_ms bigint,
    guide_session_id text,
    guide_snooze_duration_ms bigint,
    language text,
    latitude double precision,
    load_duration_ms bigint,
    longitude double precision,
    old_visitor_id text,
    poll_id text,
    poll_response text,
    poll_type text,
    region text,
    remote_ip text,
    server text,
    ui_element_actions text,
    ui_element_id text,
    ui_element_text text,
    ui_element_type text,
    url text,
    user_agent text,
    visitor_id text,
    PRIMARY KEY (event_id, period_id, page_id),
    FOREIGN KEY (page_id) REFERENCES ds_page_history(page_id),
    FOREIGN KEY (guide_id) REFERENCES ds_guide_history(guide_id),
    FOREIGN KEY (guide_step_id) REFERENCES ds_guide_step_history(guide_id)
);

CREATE TABLE visitor_history (
    id text,
    last_updated_at timestamp,
    account_id text,
    first_visit timestamp,
    id_hash bigint,
    last_browser_name text,
    last_browser_version text,
    last_operating_system text,
    last_server_name text,
    last_user_agent text,
    last_visit timestamp,
    n_id text,
    PRIMARY KEY (id, last_updated_at)
);
