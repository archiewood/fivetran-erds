CREATE TABLE guardian_user_role_change (
    "role" text,
    guardian_user_id text,
    assigned_at timestamp,
    assigned_by text,
    PRIMARY KEY ("role", guardian_user_id),
    FOREIGN KEY (guardian_user_id) REFERENCES guardian_user(id)
);

CREATE TABLE guardian_user_ring_group (
    guardian_user_id text,
    "name" text,
    PRIMARY KEY (guardian_user_id, "name"),
    FOREIGN KEY (guardian_user_id) REFERENCES guardian_user(id),
    FOREIGN KEY ("name") REFERENCES ring_group("name")
);

CREATE TABLE guardian_user (
    id text,
    call_quality_avg_affected_calls text,
    call_quality_mos_avg text,
    creation_time timestamp,
    email text,
    "name" text,
    presence text,
    presence_type text,
    risk text,
    "role" text,
    "status" text,
    PRIMARY KEY (id)
);

CREATE TABLE user_attribute (
    attribute_id text,
    id text,
    team text,
    PRIMARY KEY (attribute_id, id),
    FOREIGN KEY (attribute_id) REFERENCES attribute(id),
    FOREIGN KEY (id) REFERENCES users(id)
);

CREATE TABLE outbound_dialer_calls (
    interaction_id text,
    campaign_agent_id text,
    campaign_id text,
    campaign_transferred_agent_id text,
    record_id text,
    attempt_number text,
    call_finished_time text,
    call_started_time text,
    callback_mode text,
    create_calls_analysis_in_queue text,
    create_calls_analysis_outbound_dialer_record_extra_data text,
    create_calls_analysis_proactive_outbound_phone_type text,
    create_calls_analysis_ringing_at_agent text,
    create_calls_analysis_ringing_at_customer text,
    customer_phone_number text,
    description text,
    disposition text,
    outbound_dialer_system_disposition text,
    sip_hangup_code text,
    talkdesk_phone_number text,
    team_name text,
    total_duration text,
    PRIMARY KEY (interaction_id),
    FOREIGN KEY (interaction_id) REFERENCES "call"(id),
    FOREIGN KEY (campaign_agent_id) REFERENCES users(id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (campaign_transferred_agent_id) REFERENCES users(id),
    FOREIGN KEY (record_id) REFERENCES record(id)
);

CREATE TABLE campaign_user (
    campaign_id text,
    id text,
    PRIMARY KEY (campaign_id, id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (id) REFERENCES users(id)
);

CREATE TABLE ring_group (
    "name" text,
    short_abandoned_threshold text,
    wait_time_threshold text,
    PRIMARY KEY ("name")
);

CREATE TABLE record_phone_number (
    "type" text,
    record_id text,
    number text,
    PRIMARY KEY ("type", record_id),
    FOREIGN KEY (record_id) REFERENCES record(id)
);

CREATE TABLE record (
    id text,
    record_list_id text,
    created_at timestamp,
    external_id text,
    external_provider text,
    external_url text,
    first_name text,
    last_name text,
    phone_number text,
    priority text,
    sync_external_id text,
    timezone text,
    updated_at timestamp,
    -- custom_* (dynamic column),
    PRIMARY KEY (id, record_list_id),
    FOREIGN KEY (record_list_id) REFERENCES record_list(id)
);

CREATE TABLE contact_phone (
    label text,
    contact_id text,
    number text,
    PRIMARY KEY (label, contact_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE contact (
    id text,
    company text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE csat_score (
    sent_at text,
    agent_id text,
    ring_groups_name text,
    score text,
    team_id text,
    PRIMARY KEY (sent_at, agent_id),
    FOREIGN KEY (agent_id) REFERENCES users(id)
);

CREATE TABLE talk_time_data (
    started_at text,
    agent_id text,
    ring_groups_name text,
    talk_time_seconds_total text,
    team_id text,
    PRIMARY KEY (started_at, agent_id),
    FOREIGN KEY (agent_id) REFERENCES users(id)
);

CREATE TABLE attribute_category (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE acw_time_data (
    started_at text,
    agent_id text,
    acw_time_seconds_total text,
    ring_groups_name text,
    team_id text,
    PRIMARY KEY (started_at, agent_id),
    FOREIGN KEY (agent_id) REFERENCES users(id)
);

CREATE TABLE studio_flow_execution (
    flow_id text,
    step_name text,
    interaction_id text,
    call_sid text,
    component_title text,
    destination_number text,
    execution_finished_time text,
    exit text,
    flow_name text,
    flow_timestamp text,
    origin_number text,
    step_execution_order text,
    time_in_step text,
    PRIMARY KEY (flow_id, step_name, interaction_id),
    FOREIGN KEY (interaction_id) REFERENCES "call"(id)
);

CREATE TABLE wallets (
    "name" text,
    account_id text,
    balance text,
    created_at timestamp,
    updated_at timestamp,
    PRIMARY KEY ("name"),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE guardian_case (
    id text,
    user_id text,
    baseline text,
    event_id text,
    guardian_case text,
    hits_number text,
    ingest_timestamp timestamp,
    pop_conf text,
    pop_prob text,
    "source" text,
    specification text,
    user_conf text,
    user_prob text,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES guardian_user(id)
);

CREATE TABLE user_ring_group (
    ring_group_name text,
    user_id text,
    PRIMARY KEY (ring_group_name, user_id),
    FOREIGN KEY (ring_group_name) REFERENCES ring_group("name"),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    active text,
    created_at timestamp,
    email text,
    extension text,
    external_phone_number text,
    gender text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE qm_evaluation_score_ring_group (
    agent_id text,
    qm_evaluation_score_evaluation_time text,
    ring_group_name text,
    PRIMARY KEY (agent_id, qm_evaluation_score_evaluation_time, ring_group_name),
    FOREIGN KEY (agent_id) REFERENCES qm_evaluation_score(agent_id),
    FOREIGN KEY (qm_evaluation_score_evaluation_time) REFERENCES qm_evaluation_score(evaluation_time),
    FOREIGN KEY (ring_group_name) REFERENCES ring_group("name")
);

CREATE TABLE qm_evaluation_score (
    evaluation_time text,
    agent_id text,
    evaluation_max_score text,
    evaluation_obtained_score text,
    team_id text,
    PRIMARY KEY (evaluation_time, agent_id),
    FOREIGN KEY (agent_id) REFERENCES users(id)
);

CREATE TABLE campaign_phone_number (
    id text,
    campaign_id text,
    phone_number text,
    PRIMARY KEY (id, campaign_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id)
);

CREATE TABLE messaging_contact_queue (
    messaging_contact_id text,
    ring_group_name text,
    PRIMARY KEY (messaging_contact_id, ring_group_name),
    FOREIGN KEY (messaging_contact_id) REFERENCES messaging_contact(contact_id),
    FOREIGN KEY (ring_group_name) REFERENCES ring_group("name")
);

CREATE TABLE messaging_contact_handling_queue (
    messaging_contact_id text,
    ring_group_name text,
    PRIMARY KEY (messaging_contact_id, ring_group_name),
    FOREIGN KEY (messaging_contact_id) REFERENCES messaging_contact(contact_id),
    FOREIGN KEY (ring_group_name) REFERENCES ring_group("name")
);

CREATE TABLE messaging_contact (
    contact_id text,
    interaction_id text,
    user_id text,
    virtual_agent_id text,
    channel_type text,
    contact_assigned_at text,
    contact_duration text,
    contact_finished_at text,
    contact_finished_reason text,
    contact_person_channel_identifier text,
    contact_person_id text,
    contact_person_name text,
    contact_started_at text,
    conversation text,
    direct_assignment_user_id text,
    direction text,
    disposition_name text,
    interaction_duration text,
    interaction_finished_at text,
    interaction_started_at text,
    interaction_status text,
    is_virtual_agent text,
    notes text,
    touchpoint_identifier text,
    touchpoint_name text,
    transfer_out text,
    wrap_up_duration text,
    PRIMARY KEY (contact_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (interaction_id) REFERENCES "call"(id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (virtual_agent_id) REFERENCES users(id)
);

CREATE TABLE campaign_record_chain (
    "type" text,
    campaign_id text,
    max_attempts text,
    retry_period text,
    retry_period_time_unit text,
    PRIMARY KEY ("type", campaign_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id)
);

CREATE TABLE campaign_calling_hour (
    id text,
    campaign_id text,
    end_time text,
    start_time text,
    week_days text,
    PRIMARY KEY (id, campaign_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id)
);

CREATE TABLE campaign (
    id text,
    action_required text,
    dialing_mode text,
    dialing_mode_configuration_abandonment_timeout text,
    dialing_mode_configuration_amd_metadata text,
    dialing_mode_configuration_answering_machine_detection text,
    dialing_mode_configuration_max_abandonment_rate text,
    dialing_mode_configuration_max_dialing_ratio text,
    dialing_mode_configuration_max_ring_time_in_secs text,
    dialing_strategy_ivr_enabled text,
    dialing_strategy_lists_sorting_criteria text,
    dialing_strategy_max_attempts text,
    dialing_strategy_max_skip_attempts text,
    dialing_strategy_preview_timeout text,
    dialing_strategy_retry_period text,
    dialing_strategy_retry_time_unit text,
    dialing_strategy_strategy_type text,
    "name" text,
    priority text,
    run_once text,
    "status" text,
    PRIMARY KEY (id)
);

CREATE TABLE contact_call_handling_ring_group (
    contact_call_id text,
    ring_group_name text,
    PRIMARY KEY (contact_call_id, ring_group_name),
    FOREIGN KEY (contact_call_id) REFERENCES contact_call(contact_id),
    FOREIGN KEY (ring_group_name) REFERENCES ring_group("name")
);

CREATE TABLE contact_call_ring_group (
    contact_call_id text,
    ring_group_name text,
    PRIMARY KEY (contact_call_id, ring_group_name),
    FOREIGN KEY (contact_call_id) REFERENCES contact_call(contact_id),
    FOREIGN KEY (ring_group_name) REFERENCES ring_group("name")
);

CREATE TABLE contact_call (
    contact_id text,
    interaction_id text,
    user_id text,
    abandon_time text,
    after_call_work_time text,
    answered_at text,
    callback text,
    company_number text,
    connect_time text,
    connected_at text,
    contact_person_number text,
    contact_type text,
    data_status text,
    direct_assignment_id text,
    direction text,
    disconnected_by_agent text,
    duration text,
    external_phone_number text,
    finished_at text,
    handle_time text,
    hard_hold_time text,
    hold_time text,
    inside_business_hours text,
    inside_service_level text,
    last_contact text,
    phone_display_name text,
    ring_time text,
    short_abandon_time text,
    soft_hold_time text,
    started_at text,
    talk_time text,
    team_id text,
    team_name text,
    time_to_missed text,
    time_to_voicemail text,
    transfer_in text,
    transfer_in_type text,
    transfer_out text,
    transfer_out_type text,
    wait_time text,
    within_service_level_threshold text,
    PRIMARY KEY (contact_id),
    FOREIGN KEY (interaction_id) REFERENCES "call"(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE messaging_traffic (
    message_id text,
    contact_id text,
    interaction_id text,
    user_id text,
    channel_type text,
    contact_person_id text,
    contact_person_name text,
    message_created_at text,
    message_direction text,
    PRIMARY KEY (message_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (interaction_id) REFERENCES "call"(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE hold_time_data (
    started_at text,
    agent_id text,
    hold_time_seconds_total text,
    ring_groups_name text,
    team_id text,
    PRIMARY KEY (started_at, agent_id),
    FOREIGN KEY (agent_id) REFERENCES users(id)
);

CREATE TABLE do_not_call_number (
    id text,
    do_not_call_list_id text,
    created_at timestamp,
    expiration_date text,
    phone_number text,
    reason text,
    PRIMARY KEY (id, do_not_call_list_id),
    FOREIGN KEY (do_not_call_list_id) REFERENCES do_not_call_list(id)
);

CREATE TABLE campaign_do_not_call_list (
    campaign_id text,
    id text,
    PRIMARY KEY (campaign_id, id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (id) REFERENCES do_not_call_list(id)
);

CREATE TABLE record_list (
    id text,
    account_id text,
    created_at timestamp,
    "name" text,
    records_count text,
    "status" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE guardian_session (
    id text,
    user_id text,
    browser_full text,
    country text,
    impersonate text,
    ip_address text,
    latitude text,
    login_timestamp timestamp,
    logout_timestamp timestamp,
    longitude text,
    os_full text,
    sso text,
    support_access text,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES guardian_user(id)
);

CREATE TABLE campaign_record_list (
    campaign_id text,
    id text,
    PRIMARY KEY (campaign_id, id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (id) REFERENCES record_list(id)
);

CREATE TABLE guardian_call_quality (
    call_id text,
    interaction_id text,
    user_id text,
    affected_call text,
    call_timestamp timestamp,
    jitter_avg text,
    jitter_max text,
    mos_avg text,
    mos_max text,
    mos_min text,
    packets_loss_percentage text,
    rtt_avg text,
    rtt_max text,
    rtt_min text,
    PRIMARY KEY (call_id),
    FOREIGN KEY (interaction_id) REFERENCES "call"(id),
    FOREIGN KEY (user_id) REFERENCES guardian_user(id)
);

CREATE TABLE attribute (
    id text,
    category_id text,
    active text,
    default_proficiency text,
    flows_count text,
    "name" text,
    proficiency text,
    users_count text,
    PRIMARY KEY (id),
    FOREIGN KEY (category_id) REFERENCES attribute_category(id)
);

CREATE TABLE user_status_ring_group (
    ring_group_name text,
    user_id text,
    user_status_start_at text,
    PRIMARY KEY (ring_group_name, user_id, user_status_start_at),
    FOREIGN KEY (ring_group_name) REFERENCES ring_group("name"),
    FOREIGN KEY (user_id) REFERENCES user_status(user_id),
    FOREIGN KEY (user_status_start_at) REFERENCES user_status(status_start_at)
);

CREATE TABLE user_status (
    status_start_at text,
    user_id text,
    is_user_active text,
    status_end_at text,
    status_label text,
    status_time text,
    team_id text,
    PRIMARY KEY (status_start_at, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE feedback_flow (
    _fivetran_id text,
    interaction_id text,
    agent_name text,
    component_id text,
    component_name text,
    component_text text,
    component_type text,
    date_time text,
    flow_name text,
    interaction_direction text,
    is_kpi text,
    pertains_to_agent text,
    recording_url text,
    respondent_phone_number text,
    response text,
    response_state text,
    ring_group text,
    sms_error text,
    survey_channel text,
    talkdesk_phone_number text,
    team_name text,
    touch_point_id text,
    touch_point_name text,
    touch_point_value text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (interaction_id) REFERENCES "call"(id)
);

CREATE TABLE inbound_contact_volume (
    started_at text,
    agent_id text,
    in_contact_volume text,
    ring_groups_name text,
    team_id text,
    PRIMARY KEY (started_at, agent_id),
    FOREIGN KEY (agent_id) REFERENCES users(id)
);

CREATE TABLE ring_attempt_queue (
    ring_attempt_id text,
    ring_group_name text,
    PRIMARY KEY (ring_attempt_id, ring_group_name),
    FOREIGN KEY (ring_attempt_id) REFERENCES ring_attempt(ring_attempt_id),
    FOREIGN KEY (ring_group_name) REFERENCES ring_group("name")
);

CREATE TABLE ring_attempt (
    ring_attempt_id text,
    contact_id text,
    interaction_id text,
    user_email text,
    attempt_type text,
    batch_ring_id text,
    ring_attempt_duration text,
    ring_finished_at_time text,
    ring_started_at_time text,
    team_name text,
    PRIMARY KEY (ring_attempt_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (interaction_id) REFERENCES "call"(id),
    FOREIGN KEY (user_email) REFERENCES users(email)
);

CREATE TABLE call_tag (
    interaction_id text,
    ring_group_name text,
    PRIMARY KEY (interaction_id, ring_group_name),
    FOREIGN KEY (interaction_id) REFERENCES "call"(id),
    FOREIGN KEY (ring_group_name) REFERENCES ring_group("name")
);

CREATE TABLE "call" (
    id text,
    agent_disconnected text,
    agent_name text,
    agent_speed_to_answer text,
    call_type text,
    callback_from_queue text,
    calls_historical_base_data_status text,
    csat_score text,
    csat_survey_time text,
    customer_phone_number text,
    description text,
    disposition_code text,
    end_time text,
    handling_agent text,
    hangup text,
    holding_time text,
    in_business_hours text,
    ivr_options text,
    mood text,
    mood_prompted text,
    phone_display_name text,
    rating text,
    rating_reason text,
    record text,
    start_time text,
    talk_time text,
    talkdesk_phone_number text,
    team text,
    transfer text,
    user_email text,
    waiting_time text,
    PRIMARY KEY (id)
);

CREATE TABLE qm_evaluation_analysis_ring_group (
    evaluation_id text,
    ring_group_name text,
    PRIMARY KEY (evaluation_id, ring_group_name),
    FOREIGN KEY (evaluation_id) REFERENCES qm_evaluation_analysis(evaluation_id),
    FOREIGN KEY (ring_group_name) REFERENCES ring_group("name")
);

CREATE TABLE qm_evaluation_analysis (
    evaluation_id text,
    question_id text,
    agent_id text,
    evaluator_id text,
    interaction_id text,
    branch_to text,
    evaluation_max_score text,
    evaluation_obtained_score text,
    evaluation_time text,
    evaluation_version text,
    first_evaluated_on text,
    form_element_mandatory text,
    form_id text,
    form_name text,
    header_id text,
    header_text text,
    interaction_channel text,
    interaction_date text,
    interaction_direction text,
    interaction_reference text,
    interaction_source text,
    interaction_type text,
    question_answer text,
    question_max_score text,
    question_obtained_score text,
    question_text text,
    question_type text,
    section_id text,
    section_max_score text,
    section_name text,
    section_obtained_score text,
    team_name text,
    PRIMARY KEY (evaluation_id, question_id),
    FOREIGN KEY (agent_id) REFERENCES users(id),
    FOREIGN KEY (evaluator_id) REFERENCES users(id),
    FOREIGN KEY (interaction_id) REFERENCES "call"(id)
);

CREATE TABLE do_not_call_list (
    id text,
    account_id text,
    created_at timestamp,
    entries_count text,
    "name" text,
    "status" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE account (
    id text,
    company_name text,
    created_at timestamp,
    "name" text,
    timezone text,
    PRIMARY KEY (id)
);
