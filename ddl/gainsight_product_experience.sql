CREATE TABLE kcbot_environment (
    "index" text,
    kcbot_id text,
    environment text,
    PRIMARY KEY ("index", kcbot_id),
    FOREIGN KEY (kcbot_id) REFERENCES kcbot(id)
);

CREATE TABLE kcbot_language (
    "index" text,
    kcbot_id text,
    language_code text,
    translated text,
    PRIMARY KEY ("index", kcbot_id),
    FOREIGN KEY (kcbot_id) REFERENCES kcbot(id)
);

CREATE TABLE kcbot (
    id text,
    created_by_id text,
    created_by_name text,
    created_date text,
    default_language text,
    description text,
    languages jsonb,
    modified_by_id text,
    modified_by_name text,
    modified_date text,
    "name" text,
    priority text,
    product_id text,
    product_name text,
    "status" text,
    PRIMARY KEY (id)
);

CREATE TABLE account_property_key (
    "index" text,
    account_id text,
    "key" text,
    PRIMARY KEY ("index", account_id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE account (
    id text,
    create_date text,
    duns_number text,
    industry text,
    last_modified_date timestamp,
    last_seen_date text,
    location_city text,
    location_continent text,
    location_coordinate_latitude text,
    location_coordinate_longitude text,
    location_country_code text,
    location_country_name text,
    location_postal_code text,
    location_region_name text,
    location_state_code text,
    location_state_name text,
    location_street text,
    location_time_zone text,
    naics_code text,
    "name" text,
    number_of_employees text,
    number_of_user text,
    parent_group_id text,
    plan text,
    sfdc_id text,
    sic_code text,
    tracked_subscription_id text,
    website text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE engagement_property_key (
    "index" text,
    engagement_id text,
    "key" text,
    "type" text,
    PRIMARY KEY ("index", engagement_id),
    FOREIGN KEY (engagement_id) REFERENCES engagement(id)
);

CREATE TABLE engagement_envs (
    "index" text,
    engagement_id text,
    envs text,
    PRIMARY KEY ("index", engagement_id),
    FOREIGN KEY (engagement_id) REFERENCES engagement(id)
);

CREATE TABLE engagement (
    id text,
    default_language text,
    description text,
    "name" text,
    "state" text,
    translation_state text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE segment (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE subscription_product_key (
    "key" text,
    subscription_id text,
    subscription_product_name text,
    channel text,
    url text,
    PRIMARY KEY ("key", subscription_id, subscription_product_name),
    FOREIGN KEY (subscription_id) REFERENCES subscription_product(subscription_id),
    FOREIGN KEY (subscription_product_name) REFERENCES subscription_product("name")
);

CREATE TABLE subscription_product (
    "name" text,
    subscription_id text,
    description text,
    PRIMARY KEY ("name", subscription_id),
    FOREIGN KEY (subscription_id) REFERENCES subscription(id)
);

CREATE TABLE subscription (
    id text,
    description text,
    icon_url text,
    "name" text,
    timezone text,
    website text,
    PRIMARY KEY (id)
);

CREATE TABLE article_kcbot (
    article_id text,
    kcbot_id text,
    PRIMARY KEY (article_id, kcbot_id),
    FOREIGN KEY (article_id) REFERENCES article(id),
    FOREIGN KEY (kcbot_id) REFERENCES kcbot(id)
);

CREATE TABLE article_language (
    "index" text,
    article_id text,
    code text,
    translated text,
    PRIMARY KEY ("index", article_id),
    FOREIGN KEY (article_id) REFERENCES article(id)
);

CREATE TABLE article (
    id text,
    author text,
    created_date text,
    default_language text,
    modified_by_id text,
    modified_by_name text,
    modified_date text,
    "name" text,
    product_id text,
    product_name text,
    release_date text,
    translation_state text,
    view_type text,
    PRIMARY KEY (id)
);

CREATE TABLE integration (
    _fivetran_id text,
    current_status text,
    last_error text,
    last_successful_date text,
    number_of_records_processed text,
    sync_name text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE engagement_error_detail (
    engagement_id text,
    browser text,
    error_count text,
    error_type text,
    step_name text,
    step_number text,
    "value" text,
    PRIMARY KEY (engagement_id),
    FOREIGN KEY (engagement_id) REFERENCES engagement(id)
);

CREATE TABLE feature_label (
    id text,
    feature_id text,
    color text,
    "name" text,
    PRIMARY KEY (id, feature_id),
    FOREIGN KEY (feature_id) REFERENCES feature(id)
);

CREATE TABLE feature (
    id text,
    "name" text,
    parent_id text,
    property_key text,
    "status" text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE pageview_event (
    id text,
    account_id text,
    identify_id text,
    session_id text,
    "date" text,
    event_type text,
    global_context jsonb,
    hash text,
    host text,
    languages jsonb,
    page_title text,
    "path" text,
    property_key text,
    query_params text,
    query_string text,
    referrer text,
    remote_host text,
    scheme text,
    screen_height text,
    screen_width text,
    user_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (identify_id) REFERENCES event_identification(identify_id),
    FOREIGN KEY (session_id) REFERENCES session_event(session_id)
);

CREATE TABLE email_event (
    id text,
    account_id text,
    identify_id text,
    attempt text,
    bounce_type text,
    "date" text,
    email text,
    engagement_id text,
    event_type text,
    global_context jsonb,
    link_index text,
    link_type text,
    link_url text,
    location_city text,
    location_continent text,
    location_coordinates_latitude text,
    location_coordinates_longitude text,
    location_country_code text,
    location_country_name text,
    location_postal_code text,
    location_region_name text,
    location_state_code text,
    location_state_name text,
    location_street text,
    location_time_zone text,
    mta_response text,
    property_key text,
    reason text,
    "status" text,
    track_type text,
    user_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (identify_id) REFERENCES event_identification(identify_id)
);

CREATE TABLE custom_event (
    id text,
    account_id text,
    identify_id text,
    session_id text,
    "date" text,
    global_context jsonb,
    "name" text,
    property_key text,
    referrer text,
    remote_host text,
    "type" text,
    url text,
    user_type text,
    -- attributes_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (identify_id) REFERENCES event_identification(identify_id),
    FOREIGN KEY (session_id) REFERENCES session_event(session_id)
);

CREATE TABLE feature_match_event (
    id text,
    feature_id text,
    account_id text,
    identify_id text,
    session_id text,
    "date" text,
    event_type text,
    global_context jsonb,
    property_key text,
    user_type text,
    PRIMARY KEY (id, feature_id),
    FOREIGN KEY (feature_id) REFERENCES feature(id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (identify_id) REFERENCES event_identification(identify_id),
    FOREIGN KEY (session_id) REFERENCES session_event(session_id)
);

CREATE TABLE survey_response_selection_info (
    "index" text,
    survey_response_event_id text,
    selection_id text,
    PRIMARY KEY ("index", survey_response_event_id),
    FOREIGN KEY (survey_response_event_id) REFERENCES survey_response(event_id)
);

CREATE TABLE survey_response (
    event_id text,
    account_id text,
    engagement_id text,
    identify_id text,
    session_id text,
    view_event_id text,
    carousel_state text,
    "comment" text,
    contact_me_allowed text,
    content_id text,
    content_type text,
    "date" text,
    engagement_track_type text,
    event_type text,
    execution_date text,
    execution_id text,
    global_context jsonb,
    guide_state text,
    link_url text,
    "path" text,
    property_key text,
    question_type text,
    score text,
    sequence_number text,
    slide_id text,
    step_id text,
    survey_state text,
    user_type text,
    PRIMARY KEY (event_id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (engagement_id) REFERENCES engagement(id),
    FOREIGN KEY (identify_id) REFERENCES event_identification(identify_id),
    FOREIGN KEY (session_id) REFERENCES session_event(session_id),
    FOREIGN KEY (view_event_id) REFERENCES engagement_view_event(view_event_id)
);

CREATE TABLE form_submit_event (
    id text,
    account_id text,
    identify_id text,
    session_id text,
    "date" text,
    event_type text,
    form_data text,
    global_context jsonb,
    hash text,
    host text,
    languages jsonb,
    page_title text,
    "path" text,
    property_key text,
    query_params jsonb,
    query_string text,
    referrer text,
    remote_host text,
    scheme text,
    screen_height text,
    screen_width text,
    user_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (identify_id) REFERENCES event_identification(identify_id),
    FOREIGN KEY (session_id) REFERENCES session_event(session_id)
);

CREATE TABLE segment_match_event (
    id text,
    segment_id text,
    account_id text,
    identify_id text,
    session_id text,
    "date" text,
    event_type text,
    global_context jsonb,
    property_key text,
    user_type text,
    PRIMARY KEY (id, segment_id),
    FOREIGN KEY (segment_id) REFERENCES segment(id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (identify_id) REFERENCES event_identification(identify_id),
    FOREIGN KEY (session_id) REFERENCES session_event(session_id)
);

CREATE TABLE event_identification (
    event_id text,
    identify_id text,
    account_id text,
    email text,
    session_id text,
    "date" text,
    event_type text,
    property_key text,
    user_type text,
    PRIMARY KEY (event_id, identify_id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (email) REFERENCES users(email),
    FOREIGN KEY (session_id) REFERENCES session_event(session_id)
);

CREATE TABLE engagement_view_event (
    id text,
    engagement_id text,
    account_id text,
    identify_id text,
    session_id text,
    carousel_state text,
    "comment" text,
    contact_me_allowed text,
    content_id text,
    content_type text,
    "date" text,
    engagement_track_type text,
    event_type text,
    execution_date text,
    execution_id text,
    global_context jsonb,
    guide_state text,
    link_url text,
    "path" text,
    property_key text,
    question_type text,
    score text,
    selection_ids jsonb,
    sequence_number text,
    slide_id text,
    step_id text,
    survey_state text,
    user_type text,
    view_event_id text,
    PRIMARY KEY (id, engagement_id),
    FOREIGN KEY (engagement_id) REFERENCES engagement(id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (identify_id) REFERENCES event_identification(identify_id),
    FOREIGN KEY (session_id) REFERENCES session_event(session_id)
);

CREATE TABLE lead_event (
    id text,
    account_id text,
    identify_id text,
    session_id text,
    "date" text,
    email text,
    event_type text,
    global_context jsonb,
    property_key text,
    user_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (identify_id) REFERENCES event_identification(identify_id),
    FOREIGN KEY (session_id) REFERENCES session_event(session_id)
);

CREATE TABLE session_event (
    id text,
    session_id text,
    account_id text,
    identify_id text,
    coordinate_latitude text,
    coordinate_longitude text,
    "date" text,
    event_type text,
    global_context jsonb,
    inferred_location_city text,
    inferred_location_continent text,
    inferred_location_country_code text,
    inferred_location_country_name text,
    inferred_location_postal_code text,
    inferred_location_region_name text,
    inferred_location_state_code text,
    inferred_location_state_name text,
    inferred_location_street text,
    inferred_location_time_zone text,
    property_key text,
    remote_host text,
    user_type text,
    PRIMARY KEY (id, session_id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (identify_id) REFERENCES event_identification(identify_id)
);

CREATE TABLE user_property_key (
    "index" text,
    users_aptrinsic_id text,
    "key" text,
    PRIMARY KEY ("index", users_aptrinsic_id),
    FOREIGN KEY (users_aptrinsic_id) REFERENCES users(aptrinsic_id)
);

CREATE TABLE last_visited_user_agent_data (
    "index" text,
    users_aptrinsic_id text,
    property_key text,
    useragent_browsertype text,
    useragent_browserversion text,
    useragent_device text,
    useragent_platformtype text,
    useragent_platformversion text,
    useragent_rawuseragent text,
    PRIMARY KEY ("index", users_aptrinsic_id),
    FOREIGN KEY (users_aptrinsic_id) REFERENCES users(aptrinsic_id)
);

CREATE TABLE users (
    aptrinsic_id text,
    account_id text,
    identify_id text,
    create_date text,
    email text,
    first_name text,
    first_visit_date text,
    gender text,
    global_unsubscribe text,
    id text,
    inferred_location_coordinate_latitude text,
    inferred_location_coordinate_longitude text,
    last_inferred_location_city text,
    last_inferred_location_continent text,
    last_inferred_location_country_code text,
    last_inferred_location_country_name text,
    last_inferred_location_postal_code text,
    last_inferred_location_region_name text,
    last_inferred_location_state_code text,
    last_inferred_location_state_name text,
    last_inferred_location_street text,
    last_inferred_location_time_zone text,
    last_modified_date timestamp,
    last_name text,
    last_seen_date text,
    location_city text,
    location_continent text,
    location_coordinate_latitude text,
    location_coordinate_longitude text,
    location_country_code text,
    location_country_name text,
    location_postal_code text,
    location_region_name text,
    location_state_code text,
    location_state_name text,
    location_street text,
    location_time_zone text,
    number_of_visit text,
    phone text,
    "role" text,
    score_bigger text,
    sfdc_contact_id text,
    sign_up_date text,
    subscription_id text,
    title text,
    "type" text,
    -- custom_* (dynamic column),
    PRIMARY KEY (aptrinsic_id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (identify_id) REFERENCES event_identification(identify_id)
);

CREATE TABLE user_preference (
    _fivetran_id text,
    guided_tour text,
    onboarding_bot text,
    product_update text,
    survey text,
    track_usage text,
    users_id text,
    PRIMARY KEY (_fivetran_id)
);
