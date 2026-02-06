CREATE TABLE course_configuration (
    id text,
    course_id text,
    effective_value text,
    effective_value_source text,
    explicit_value text,
    PRIMARY KEY (id),
    FOREIGN KEY (course_id) REFERENCES course(id)
);

CREATE TABLE course_tag (
    tags text,
    course_id text,
    PRIMARY KEY (tags, course_id),
    FOREIGN KEY (course_id) REFERENCES course(id)
);

CREATE TABLE course_keyword (
    "index" text,
    course_id text,
    keyword text,
    PRIMARY KEY ("index", course_id),
    FOREIGN KEY (course_id) REFERENCES course(id)
);

CREATE TABLE course (
    id text,
    activity_id text,
    course_learning_standard text,
    created text,
    dispatched text,
    metadata_description text,
    metadata_description_language text,
    metadata_duration text,
    metadata_title text,
    metadata_title_language text,
    metadata_typical_time text,
    registration_count text,
    root_activity_children jsonb,
    root_activity_external_identifier text,
    root_activity_item_identifier text,
    root_activity_resource_identifier text,
    root_activity_scaled_passing_score text,
    root_activity_title text,
    root_activity_type text,
    title text,
    updated text,
    version text,
    x_api_activity_id text,
    PRIMARY KEY (id)
);

CREATE TABLE registered_learner (
    id text,
    registration_id text,
    course_id text,
    email text,
    first_name text,
    last_name text,
    PRIMARY KEY (id),
    FOREIGN KEY (registration_id) REFERENCES registration(id)
);

CREATE TABLE registration_tag (
    tags text,
    registration_id text,
    PRIMARY KEY (tags, registration_id),
    FOREIGN KEY (registration_id) REFERENCES registration(id)
);

CREATE TABLE registration_shared_data (
    id text,
    registration_id text,
    "value" text,
    PRIMARY KEY (id),
    FOREIGN KEY (registration_id) REFERENCES registration(id)
);

CREATE TABLE registration_activity_runtime_interaction (
    id text,
    registration_id text,
    correct_responses jsonb,
    description text,
    latency text,
    learner_response text,
    objectives jsonb,
    "result" text,
    "timestamp" text,
    timestamp_utc text,
    "type" text,
    weighting text,
    PRIMARY KEY (id),
    FOREIGN KEY (registration_id) REFERENCES registration(id)
);

CREATE TABLE registration_activity_runtime_objective (
    id text,
    registration_id text,
    description text,
    progress_measure text,
    runtime_objective_completion_status text,
    runtime_objective_success_status text,
    score_max text,
    score_min text,
    score_raw text,
    score_scaled text,
    PRIMARY KEY (id),
    FOREIGN KEY (registration_id) REFERENCES registration(id)
);

CREATE TABLE registration (
    id text,
    course_id text,
    dispatch_id text,
    activity_completion_amount text,
    activity_details_activity_completion text,
    activity_details_activity_success text,
    activity_details_attempts text,
    activity_details_children jsonb,
    activity_details_id text,
    activity_details_suspended text,
    activity_details_time_tracked text,
    activity_details_title text,
    activity_runtime_completion_status text,
    activity_runtime_credit text,
    activity_runtime_entry text,
    activity_runtime_exit text,
    activity_runtime_learner_audio_captioning text,
    activity_runtime_learner_audio_level text,
    activity_runtime_learner_delivery_speed text,
    activity_runtime_learner_language text,
    activity_runtime_location text,
    activity_runtime_mode text,
    activity_runtime_progress_measure text,
    activity_runtime_runtime_success_status text,
    activity_runtime_score_max text,
    activity_runtime_score_min text,
    activity_runtime_score_raw text,
    activity_runtime_score_scaled text,
    activity_runtime_suspend_data text,
    activity_runtime_time_tracked text,
    activity_runtime_total_time text,
    activity_score text,
    activity_static_properties_completion_threshold text,
    activity_static_properties_launch_data text,
    activity_static_properties_max_time_allowed text,
    activity_static_properties_scaled_passing_score text,
    activity_static_properties_scaled_passing_score_used text,
    activity_static_properties_time_limit_action text,
    completed_date text,
    created_date text,
    first_access_date text,
    instance text,
    last_access_date text,
    registration_completion text,
    registration_completion_amount text,
    registration_success text,
    score_scaled text,
    suspended_activity_id text,
    total_seconds_tracked text,
    updated text,
    xapi_registration_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (course_id) REFERENCES course(id),
    FOREIGN KEY (dispatch_id) REFERENCES dispatch(id)
);

CREATE TABLE registration_objective (
    id text,
    registration_id text,
    first_score_scaled text,
    first_success_timestamp text,
    objective_completion text,
    objective_success text,
    previous_objective_success text,
    previous_score_scaled text,
    "primary" text,
    progress_measure text,
    score_max text,
    score_min text,
    score_raw text,
    score_scaled text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (registration_id) REFERENCES registration(id)
);

CREATE TABLE registration_activity_comment (
    _fivetran_id text,
    registration_id text,
    date_time text,
    location text,
    "type" text,
    "value" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (registration_id) REFERENCES registration(id)
);

CREATE TABLE dispatch_tag (
    tags text,
    dispatch_id text,
    PRIMARY KEY (tags, dispatch_id),
    FOREIGN KEY (dispatch_id) REFERENCES dispatch(id)
);

CREATE TABLE dispatch (
    id text,
    course_id text,
    destination_id text,
    allow_new_registrations text,
    created text,
    enabled text,
    expiration_date text,
    instanced text,
    notes text,
    registration_cap text,
    registration_count text,
    updated text,
    PRIMARY KEY (id),
    FOREIGN KEY (course_id) REFERENCES course(id),
    FOREIGN KEY (destination_id) REFERENCES destination(id)
);

CREATE TABLE course_asset (
    "path" text,
    course_id text,
    modified text,
    "size" text,
    PRIMARY KEY ("path"),
    FOREIGN KEY (course_id) REFERENCES course(id)
);

CREATE TABLE learner_tag (
    tags text,
    learner_id text,
    PRIMARY KEY (tags, learner_id),
    FOREIGN KEY (learner_id) REFERENCES registered_learner(id)
);

CREATE TABLE destination_tag (
    tags text,
    destination_id text,
    PRIMARY KEY (tags, destination_id),
    FOREIGN KEY (destination_id) REFERENCES destination(id)
);

CREATE TABLE destination (
    id text,
    created text,
    email text,
    launch_auth_expiry text,
    launch_auth_fingerprint text,
    launch_auth_ip_address text,
    launch_auth_sliding_expiry text,
    launch_auth_type text,
    lti_13_access_token_url text,
    lti_13_client_id text,
    lti_13_deployment_id text,
    lti_13_json_web_key_set_url text,
    lti_13_oidc_authorization_endpoint text,
    lti_13_platform_issuer_identifier text,
    "name" text,
    notes text,
    updated text,
    PRIMARY KEY (id)
);

CREATE TABLE registration_launch_history (
    id text,
    completion_status text,
    exit_time text,
    history_log text,
    instance text,
    last_runtime_update text,
    launch_time text,
    success_status text,
    total_seconds_tracked text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES registration(id)
);

CREATE TABLE registration_statement_attachment (
    file_url text,
    registration_statement_id text,
    content_type text,
    description_additional_prop_1 text,
    description_additional_prop_2 text,
    description_additional_prop_3 text,
    display_additional_prop_1 text,
    display_additional_prop_2 text,
    display_additional_prop_3 text,
    length text,
    sha_2 text,
    usage_type text,
    PRIMARY KEY (file_url, registration_statement_id),
    FOREIGN KEY (registration_statement_id) REFERENCES registration_statement(id)
);

CREATE TABLE registration_verb (
    id text,
    registration_statement_id text,
    additional_prop_1 text,
    additional_prop_2 text,
    additional_prop_3 text,
    PRIMARY KEY (id, registration_statement_id),
    FOREIGN KEY (registration_statement_id) REFERENCES registration_statement(id)
);

CREATE TABLE registration_object_activity (
    id text,
    registration_statement_id text,
    definition_correct_responses_pattern jsonb,
    definition_interaction_type text,
    definition_more_info text,
    definition_type text,
    description_additional_prop_1 jsonb,
    description_additional_prop_2 jsonb,
    description_additional_prop_3 jsonb,
    extensions_additional_prop_1 text,
    extensions_additional_prop_2 text,
    extensions_additional_prop_3 text,
    name_additional_prop_1 text,
    name_additional_prop_2 text,
    name_additional_prop_3 text,
    object_type text,
    PRIMARY KEY (id, registration_statement_id),
    FOREIGN KEY (registration_statement_id) REFERENCES registration_statement(id)
);

CREATE TABLE registration_statement (
    id text,
    objectreference_id text,
    registration_id text,
    actor_account_home_page text,
    actor_account_name text,
    actor_mbox text,
    actor_mbox_sha_1_sum text,
    actor_member jsonb,
    actor_name text,
    actor_object_type text,
    actor_openid text,
    authority_account_home_page text,
    authority_account_name text,
    authority_mbox text,
    authority_mbox_sha_1_sum text,
    authority_member jsonb,
    authority_name text,
    authority_object_type text,
    authority_openid text,
    context_extensions_additional_prop_1 text,
    context_extensions_additional_prop_2 text,
    context_extensions_additional_prop_3 text,
    context_instructor_account_home_page text,
    context_instructor_account_name text,
    context_instructor_mbox text,
    context_instructor_mbox_sha_1_sum text,
    context_instructor_member jsonb,
    context_instructor_name text,
    context_instructor_object_type text,
    context_instructor_openid text,
    context_language text,
    context_platform text,
    context_registration text,
    context_revision text,
    context_statement_id text,
    context_statement_object_type text,
    context_team_account_home_page text,
    context_team_account_name text,
    context_team_mbox text,
    context_team_mbox_sha_1_sum text,
    context_team_member jsonb,
    context_team_name text,
    context_team_object_type text,
    context_team_openid text,
    object_agent_group_account_home_page text,
    object_agent_group_account_name text,
    object_agent_group_mbox text,
    object_agent_group_mbox_sha_1_sum text,
    object_agent_group_member jsonb,
    object_agent_group_name text,
    object_agent_group_object_type text,
    object_agent_group_openid text,
    object_reference_id text,
    result_completion text,
    result_duration text,
    result_extensions_additional_prop_1 jsonb,
    result_extensions_additional_prop_2 jsonb,
    result_extensions_additional_prop_3 jsonb,
    result_response text,
    result_score_max text,
    result_score_min text,
    result_score_raw text,
    result_score_scaled text,
    result_success text,
    stored text,
    "timestamp" text,
    PRIMARY KEY (id),
    FOREIGN KEY (objectreference_id) REFERENCES registration_objective(id),
    FOREIGN KEY (registration_id) REFERENCES registration(id)
);

CREATE TABLE registration_object_activity_definition (
    id text,
    registration_object_activity_id text,
    additional_prop_1 text,
    additional_prop_2 text,
    additional_prop_3 text,
    "type" text,
    PRIMARY KEY (id, registration_object_activity_id),
    FOREIGN KEY (registration_object_activity_id) REFERENCES registration_object_activity(id)
);
