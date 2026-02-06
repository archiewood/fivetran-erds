CREATE TABLE group_image (
    "index" text,
    group_id text,
    image_uri text,
    resolution text,
    PRIMARY KEY ("index", group_id),
    FOREIGN KEY (group_id) REFERENCES groups(id)
);

CREATE TABLE group_address (
    "index" text,
    group_id text,
    address text,
    display text,
    extension text,
    media_type text,
    "type" text,
    PRIMARY KEY ("index", group_id),
    FOREIGN KEY (group_id) REFERENCES groups(id)
);

CREATE TABLE group_owner (
    group_id text,
    user_id text,
    PRIMARY KEY (group_id, user_id),
    FOREIGN KEY (group_id) REFERENCES groups(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE groups (
    id text,
    chat_jabber_id text,
    date_modified text,
    description text,
    member_count text,
    "name" text,
    rules_visible text,
    self_uri text,
    "state" text,
    "type" text,
    version text,
    visibility text,
    PRIMARY KEY (id)
);

CREATE TABLE campaign_diagnostic_dnc (
    _fivetran_id text,
    campaign_id text,
    dnc_id text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign_diagnostic(campaign_id),
    FOREIGN KEY (dnc_id) REFERENCES dnc(id)
);

CREATE TABLE campaign_diagnostic_rule_set (
    _fivetran_id text,
    campaign_id text,
    rule_set_id text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign_diagnostic(campaign_id),
    FOREIGN KEY (rule_set_id) REFERENCES ruleset(id)
);

CREATE TABLE campaign_rule_set_diagnostic (
    _fivetran_id text,
    campaign_id text,
    rule_set_id text,
    warnings jsonb,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign_diagnostic(campaign_id),
    FOREIGN KEY (rule_set_id) REFERENCES ruleset(id)
);

CREATE TABLE campaign_diagnostic (
    _fivetran_id text,
    attempt_limit_id text,
    callable_time_set_id text,
    campaign_id text,
    queue_utilization_diagnostic_queue_id text,
    campaign_skill_statistics_eligible_skilled_agent text,
    campaign_skill_statistics_skill_combination text,
    outstanding_interactions_count text,
    queue_utilization_diagnostic_active_users_in_queue text,
    queue_utilization_diagnostic_users_in_queue text,
    queue_utilization_diagnostic_users_not_utilized text,
    queue_utilization_diagnostic_users_on_a_campaign_call text,
    queue_utilization_diagnostic_users_on_a_non_campaign_call text,
    queue_utilization_diagnostic_users_on_different_edge_group text,
    queue_utilization_diagnostic_users_on_queue text,
    queue_utilization_diagnostic_users_on_queue_with_station text,
    scheduled_interactions_count text,
    timezone_rescheduled_calls_count text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (attempt_limit_id) REFERENCES attempt_limit(id),
    FOREIGN KEY (callable_time_set_id) REFERENCES callable_timeset(id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (queue_utilization_diagnostic_queue_id) REFERENCES routing_queue(id)
);

CREATE TABLE flow_data_table (
    id text,
    division_id text,
    description text,
    "name" text,
    schema_additional_properties jsonb,
    schema_description text,
    schema_id text,
    schema_properties jsonb,
    schema_required jsonb,
    schema_schema text,
    schema_title text,
    schema_type text,
    self_uri text,
    PRIMARY KEY (id),
    FOREIGN KEY (division_id) REFERENCES division(id)
);

CREATE TABLE conversation_survey_answer_question_group_question_score (
    "index" text,
    conversation_id text,
    conversation_survey_answer_question_group_score_index text,
    conversation_survey_id text,
    answer_id text,
    assisted_answer_id text,
    free_text_answer text,
    marked_na text,
    nps_score text,
    nps_text_answer text,
    question_id text,
    score text,
    system_marked_na text,
    PRIMARY KEY ("index", conversation_id, conversation_survey_answer_question_group_score_index, conversation_survey_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation_survey_answer_question_group_score(conversation_id),
    FOREIGN KEY (conversation_survey_answer_question_group_score_index) REFERENCES conversation_survey_answer_question_group_score("index"),
    FOREIGN KEY (conversation_survey_id) REFERENCES conversation_survey_answer_question_group_score(conversation_survey_id)
);

CREATE TABLE conversation_survey_answer_question_group_score (
    "index" text,
    conversation_id text,
    conversation_survey_id text,
    marked_na text,
    max_total_score text,
    question_group_id text,
    system_marked_na text,
    total_score text,
    PRIMARY KEY ("index", conversation_id, conversation_survey_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation_survey(conversation_id),
    FOREIGN KEY (conversation_survey_id) REFERENCES conversation_survey(id)
);

CREATE TABLE conversation_survey (
    conversation_id text,
    id text,
    agent_id text,
    queue_id text,
    survey_form_id text,
    agent_team_date_created text,
    agent_team_date_modified text,
    agent_team_description text,
    agent_team_division_id text,
    agent_team_division_name text,
    agent_team_id text,
    agent_team_member_count text,
    agent_team_name text,
    agent_team_self_uri text,
    answer_nps_score text,
    answer_total_score text,
    completed_date text,
    flow_id text,
    missing_required_answer text,
    "name" text,
    self_uri text,
    "status" text,
    survey_error_flow_diagnostic_last_action_id text,
    survey_error_survey_error_reason text,
    survey_type text,
    PRIMARY KEY (conversation_id, id),
    FOREIGN KEY (agent_id) REFERENCES users(id),
    FOREIGN KEY (queue_id) REFERENCES user_queue(id),
    FOREIGN KEY (survey_form_id) REFERENCES survey_form(id)
);

CREATE TABLE wrapup_code_map (
    _fivetran_id text,
    date_created text,
    date_modified text,
    default_set jsonb,
    id text,
    mapping jsonb,
    "name" text,
    self_uri text,
    version text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE user_call_forwarding_target (
    _fivetran_id text,
    user_call_forwarding_id text,
    user_id text,
    "type" text,
    "value" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (user_call_forwarding_id) REFERENCES user_call_forwarding(id),
    FOREIGN KEY (user_id) REFERENCES user_call_forwarding(user_id)
);

CREATE TABLE user_call_forwarding (
    id text,
    user_id text,
    enabled text,
    modified_date text,
    "name" text,
    phone_number text,
    self_uri text,
    voicemail text,
    PRIMARY KEY (id, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE location_path (
    "index" text,
    location_id text,
    "path" text,
    PRIMARY KEY ("index", location_id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE location_profile_image (
    _fivetran_id text,
    location_id text,
    image_uri text,
    resolution text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE location_floor_plan_image (
    "index" text,
    location_id text,
    floor_plan_image text,
    PRIMARY KEY ("index", location_id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE location (
    id text,
    contact_user_id text,
    address_city text,
    address_country text,
    address_country_name text,
    address_state text,
    address_stored text,
    address_street_1 text,
    address_street_2 text,
    address_verified text,
    address_verify_date_finished text,
    address_verify_date_started text,
    address_verify_service text,
    address_verify_status text,
    address_zipcode text,
    emergency_e_164 text,
    emergency_number text,
    emergency_type text,
    images text,
    "name" text,
    notes text,
    self_uri text,
    "state" text,
    version text,
    PRIMARY KEY (id),
    FOREIGN KEY (contact_user_id) REFERENCES users(id)
);

CREATE TABLE campaign_stats (
    _fivetran_id text,
    campaign_id text,
    adjusted_calls_per_agent text,
    contact_rate_attempts text,
    contact_rate_connect_ratio text,
    contact_rate_connects text,
    effective_idle_agents text,
    idle_agents text,
    outstanding_calls text,
    scheduled_calls text,
    time_zone_rescheduled_calls text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id)
);

CREATE TABLE agent_activity_evaluator_list_contact_info (
    "index" text,
    agent_activity_evaluator_list_index text,
    agent_activity_fivetran_id text,
    address text,
    media_type text,
    "type" text,
    PRIMARY KEY ("index", agent_activity_evaluator_list_index, agent_activity_fivetran_id),
    FOREIGN KEY (agent_activity_evaluator_list_index) REFERENCES agent_activity_evaluator_list("index"),
    FOREIGN KEY (agent_activity_fivetran_id) REFERENCES agent_activity_evaluator_list(agent_activity_fivetran_id)
);

CREATE TABLE agent_activity_evaluator_list (
    "index" text,
    agent_activity_fivetran_id text,
    agent_id text,
    evaluator_id text,
    average_evaluation_score text,
    id text,
    "name" text,
    num_evaluation text,
    num_evaluations_without_view_permission text,
    PRIMARY KEY ("index", agent_activity_fivetran_id),
    FOREIGN KEY (agent_activity_fivetran_id) REFERENCES agent_activity(_fivetran_id),
    FOREIGN KEY (agent_id) REFERENCES users(id),
    FOREIGN KEY (evaluator_id) REFERENCES users(id)
);

CREATE TABLE agent_activity (
    _fivetran_id text,
    agent_id text,
    integration_presence_definition_id text,
    presence_definition_id text,
    average_critical_score text,
    average_evaluation_score text,
    highest_critical_score text,
    highest_evaluation_score text,
    id text,
    lowest_critical_score text,
    lowest_evaluation_score text,
    "name" text,
    num_critical_evaluations text,
    num_evaluations text,
    num_evaluations_without_view_permission text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (agent_id) REFERENCES users(id),
    FOREIGN KEY (integration_presence_definition_id) REFERENCES presence_definition(id),
    FOREIGN KEY (presence_definition_id) REFERENCES presence_definition(id)
);

CREATE TABLE routing_queue_routing_rule (
    _fivetran_id text,
    routing_queue_id text,
    operator text,
    threshold text,
    wait_seconds text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (routing_queue_id) REFERENCES routing_queue(id)
);

CREATE TABLE routing_queue_conditional_group_routing_rule_group (
    group_id text,
    "index" text,
    routing_queue_id text,
    PRIMARY KEY (group_id, "index", routing_queue_id),
    FOREIGN KEY (group_id) REFERENCES groups(id),
    FOREIGN KEY ("index") REFERENCES routing_queue_conditional_group_routing_rule("index"),
    FOREIGN KEY (routing_queue_id) REFERENCES routing_queue_conditional_group_routing_rule(routing_queue_id)
);

CREATE TABLE routing_queue_conditional_group_routing_rule (
    "index" text,
    routing_queue_id text,
    condition_value text,
    metric text,
    operator text,
    wait_seconds text,
    PRIMARY KEY ("index", routing_queue_id),
    FOREIGN KEY (routing_queue_id) REFERENCES routing_queue(id)
);

CREATE TABLE routing_queue_bulls_eye_ring_expansion_criteria (
    _fivetran_id text,
    routing_queue_id text,
    threshold text,
    "type" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (routing_queue_id) REFERENCES routing_queue(id)
);

CREATE TABLE routing_queue_bulls_eye_ring_skill_to_remove (
    id text,
    routing_queue_id text,
    "name" text,
    self_uri text,
    PRIMARY KEY (id, routing_queue_id),
    FOREIGN KEY (routing_queue_id) REFERENCES routing_queue(id)
);

CREATE TABLE routing_queue_bulls_eye_ring_member_group (
    id text,
    routing_queue_id text,
    member_count text,
    "name" text,
    self_uri text,
    "type" text,
    PRIMARY KEY (id, routing_queue_id),
    FOREIGN KEY (routing_queue_id) REFERENCES routing_queue(id)
);

CREATE TABLE routing_queue_member_group (
    id text,
    routing_queue_id text,
    member_count text,
    "name" text,
    self_uri text,
    "type" text,
    PRIMARY KEY (id, routing_queue_id),
    FOREIGN KEY (routing_queue_id) REFERENCES routing_queue(id)
);

CREATE TABLE routing_queue_email_address_route_skill (
    id text,
    routing_queue_id text,
    "name" text,
    self_uri text,
    PRIMARY KEY (id, routing_queue_id),
    FOREIGN KEY (routing_queue_id) REFERENCES routing_queue(id)
);

CREATE TABLE routing_queue_email_address_auto_bcc (
    _fivetran_id text,
    routing_queue_id text,
    email text,
    "name" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (routing_queue_id) REFERENCES routing_queue(id)
);

CREATE TABLE routing_queue (
    id text,
    division_id text,
    acw_settings_timeout_ms text,
    acw_settings_wrapup_prompt text,
    agent_owned_routing_enable_agent_owned_call_back text,
    agent_owned_routing_max_owned_call_back_delay_hours text,
    agent_owned_routing_max_owned_call_back_hours text,
    auto_answer_only text,
    calling_party_name text,
    calling_party_number text,
    created_by text,
    date_created text,
    date_modified text,
    default_script jsonb,
    description text,
    direct_routing_agent_wait_second text,
    direct_routing_backup_queue_id text,
    direct_routing_call_media_settingenabled text,
    direct_routing_call_media_settinginbound_flow_id text,
    direct_routing_call_media_settinginbound_self_uri text,
    direct_routing_call_media_settingvoice_mail_flow text,
    direct_routing_email_media_settingenabled text,
    direct_routing_email_media_settinginbound_flow_id text,
    direct_routing_email_media_settinginbound_self_uri text,
    direct_routing_enabled text,
    direct_routing_message_media_setting text,
    direct_routing_wait_for_agent text,
    email_in_queue_flow_id text,
    email_in_queue_flow_name text,
    email_in_queue_flow_self_uri text,
    enable_manual_assignment text,
    enable_transcription text,
    joined_member_count text,
    media_settings_call_alerting_timeout_seconds text,
    media_settings_call_auto_answer_alert_tone_seconds text,
    media_settings_call_enable_auto_answer text,
    media_settings_call_manual_answer_alert_tone_seconds text,
    media_settings_call_service_level text,
    media_settings_call_sub_type_setting jsonb,
    media_settings_callback_alerting_timeout_seconds text,
    media_settings_callback_auto_answer_alert_tone_seconds text,
    media_settings_callback_enable_auto_answer text,
    media_settings_callback_manual_answer_alert_tone_seconds text,
    media_settings_callback_service_level text,
    media_settings_callback_sub_type_setting jsonb,
    media_settings_chat_alerting_timeout_seconds text,
    media_settings_chat_auto_answer_alert_tone_seconds text,
    media_settings_chat_enable_auto_answer text,
    media_settings_chat_manual_answer_alert_tone_seconds text,
    media_settings_chat_service_level text,
    media_settings_chat_sub_type_setting jsonb,
    media_settings_email_alerting_timeout_seconds text,
    media_settings_email_auto_answer_alert_tone_seconds text,
    media_settings_email_enable_auto_answer text,
    media_settings_email_manual_answer_alert_tone_seconds text,
    media_settings_email_service_level text,
    media_settings_email_sub_type_setting jsonb,
    media_settings_message_alerting_timeout_seconds text,
    media_settings_message_auto_answer_alert_tone_seconds text,
    media_settings_message_enable_auto_answer text,
    media_settings_message_manual_answer_alert_tone_seconds text,
    media_settings_message_service_level text,
    media_settings_message_sub_type_setting jsonb,
    member_count text,
    message_in_queue_flow_id text,
    message_in_queue_flow_name text,
    message_in_queue_flow_self_uri text,
    modified_by text,
    "name" text,
    on_hold_prompt_id text,
    on_hold_prompt_name text,
    on_hold_prompt_self_uri text,
    outbound_messaging_addresses_open_messaging_recipient_id text,
    outbound_messaging_addresses_open_messaging_recipient_name text,
    outbound_messaging_addresses_open_messaging_recipient_self_uri text,
    outbound_messaging_addresses_sms_address_name text,
    outbound_messaging_addresses_sms_address_self_uri text,
    outbound_messaging_addresses_sms_adress_id text,
    outbound_messaging_addresses_whats_app_recipient_id text,
    outbound_messaging_addresses_whats_app_recipient_name text,
    outbound_messaging_addresses_whats_app_recipient_self_uri text,
    peer_id text,
    queue_flow_id text,
    queue_flow_name text,
    queue_flow_self_uri text,
    reply_email_address_domain_id text,
    reply_email_address_domain_name text,
    reply_email_address_domain_self_uri text,
    reply_email_address_route_allow_multiple_actions text,
    reply_email_address_route_always_included text,
    reply_email_address_route_flow_id text,
    reply_email_address_route_flow_name text,
    reply_email_address_route_flow_self_uri text,
    reply_email_address_route_from_email text,
    reply_email_address_route_from_name text,
    reply_email_address_route_history_inclusion text,
    reply_email_address_route_id text,
    reply_email_address_route_inclusion_type text,
    reply_email_address_route_language_id text,
    reply_email_address_route_language_name text,
    reply_email_address_route_language_self_url text,
    reply_email_address_route_name text,
    reply_email_address_route_pattern text,
    reply_email_address_route_priority text,
    reply_email_address_route_queue_id text,
    reply_email_address_route_reply_email_address jsonb,
    reply_email_address_route_self_uri text,
    reply_email_address_route_signature_canned_response_id text,
    reply_email_address_route_signature_enabled text,
    reply_email_address_route_spam_flow_id text,
    reply_email_address_route_spam_flow_name text,
    reply_email_address_route_spam_flow_self_uri text,
    scoring_method text,
    self_uri text,
    skill_evaluation_method text,
    suppress_in_queue_call_recording text,
    user_member_count text,
    whisper_prompt_id text,
    whisper_prompt_name text,
    whisper_prompt_self_uri text,
    PRIMARY KEY (id),
    FOREIGN KEY (division_id) REFERENCES division(id)
);

CREATE TABLE station (
    id text,
    user_id text,
    web_rtc_user_id text,
    description text,
    line_appearance_id text,
    "name" text,
    primary_edge_id text,
    primary_edge_name text,
    primary_edge_self_uri text,
    secondary_edge text,
    secondary_edge_id text,
    secondary_edge_name text,
    secondary_edge_self_uri text,
    self_uri text,
    "status" text,
    "type" text,
    web_rtc_call_appearances text,
    web_rtc_force_turn text,
    web_rtc_media_dscp text,
    web_rtc_persistent_enabled text,
    web_rtc_require_media_helper text,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (web_rtc_user_id) REFERENCES users(id)
);

CREATE TABLE conversation_id (
    "index" text,
    conversation_id text,
    PRIMARY KEY ("index", conversation_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id)
);

CREATE TABLE conversation_division_entity (
    id text,
    conversation_id text,
    division_id text,
    "name" text,
    self_uri text,
    PRIMARY KEY (id, conversation_id, division_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id),
    FOREIGN KEY (division_id) REFERENCES division(id)
);

CREATE TABLE conversation_recent_transfer (
    id text,
    conversation_id text,
    destination_user_id text,
    initiator_user_id text,
    modified_by_id text,
    date_issued text,
    destination_address text,
    "state" text,
    transfer_type text,
    PRIMARY KEY (id, conversation_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id),
    FOREIGN KEY (destination_user_id) REFERENCES users(id),
    FOREIGN KEY (initiator_user_id) REFERENCES users(id),
    FOREIGN KEY (modified_by_id) REFERENCES users(id)
);

CREATE TABLE conversation_participant_media_role (
    "index" text,
    conversation_id text,
    conversation_participant_id text,
    media_roles text,
    PRIMARY KEY ("index", conversation_id, conversation_participant_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation_participant(conversation_id),
    FOREIGN KEY (conversation_participant_id) REFERENCES conversation_participant(id)
);

CREATE TABLE conversation_participant_conversation_routing_data_skills (
    conversation_id text,
    conversation_participant_id text,
    id text,
    PRIMARY KEY (conversation_id, conversation_participant_id, id),
    FOREIGN KEY (conversation_id) REFERENCES conversation_participant(conversation_id),
    FOREIGN KEY (conversation_participant_id) REFERENCES conversation_participant(id),
    FOREIGN KEY (id) REFERENCES user_routing_skill(id)
);

CREATE TABLE conversation_participant_conversation_routing_data_scored_agent (
    agent_id text,
    conversation_id text,
    conversation_participant_id text,
    agent_name text,
    agent_self_uri text,
    score text,
    PRIMARY KEY (agent_id, conversation_id, conversation_participant_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation_participant(conversation_id),
    FOREIGN KEY (conversation_participant_id) REFERENCES conversation_participant(id)
);

CREATE TABLE conversation_participant_wrapup_tag (
    "index" text,
    conversation_id text,
    conversation_participant_id text,
    tag_name text,
    PRIMARY KEY ("index", conversation_id, conversation_participant_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation_participant(conversation_id),
    FOREIGN KEY (conversation_participant_id) REFERENCES conversation_participant(id)
);

CREATE TABLE conversation_participant_call_wrapup_tag (
    "index" text,
    conversation_id text,
    conversation_participant_call_id text,
    conversation_participant_id text,
    tag_name text,
    PRIMARY KEY ("index", conversation_id, conversation_participant_call_id, conversation_participant_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation_participant_call(conversation_id),
    FOREIGN KEY (conversation_participant_call_id) REFERENCES conversation_participant_call(id),
    FOREIGN KEY (conversation_participant_id) REFERENCES conversation_participant_call(conversation_participant_id)
);

CREATE TABLE conversation_participant_call_segment (
    "index" text,
    conversation_id text,
    conversation_participant_call_id text,
    conversation_participant_id text,
    disconnect_type text,
    end_time text,
    how_ended text,
    start_time text,
    "type" text,
    PRIMARY KEY ("index", conversation_id, conversation_participant_call_id, conversation_participant_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation_participant_call(conversation_id),
    FOREIGN KEY (conversation_participant_call_id) REFERENCES conversation_participant_call(id),
    FOREIGN KEY (conversation_participant_id) REFERENCES conversation_participant_call(conversation_participant_id)
);

CREATE TABLE conversation_participant_call_disconnect_reason (
    "index" text,
    conversation_id text,
    conversation_participant_call_id text,
    conversation_participant_id text,
    code text,
    phrase text,
    "type" text,
    PRIMARY KEY ("index", conversation_id, conversation_participant_call_id, conversation_participant_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation_participant_call(conversation_id),
    FOREIGN KEY (conversation_participant_call_id) REFERENCES conversation_participant_call(id),
    FOREIGN KEY (conversation_participant_id) REFERENCES conversation_participant_call(conversation_participant_id)
);

CREATE TABLE conversation_participant_call (
    id text,
    conversation_id text,
    conversation_participant_id text,
    script_id text,
    after_call_work_end_time text,
    after_call_work_required text,
    after_call_work_start_time text,
    after_call_work_state text,
    agent_assistant_id text,
    confined text,
    connected_time text,
    detection_event_name text,
    detection_is_person_likely text,
    detection_line_connected text,
    detection_mode text,
    detection_preconnect_duration text,
    detection_total_ringbacks text,
    direction text,
    disconnect_type text,
    disconnected_time text,
    disposition_analyzer text,
    disposition_name text,
    document_id text,
    error_info_code text,
    error_info_message text,
    fax_status_active_page text,
    fax_status_baud_rate text,
    fax_status_bytes_transmitted text,
    fax_status_direction text,
    fax_status_expected_pages text,
    fax_status_line_errors text,
    fax_status_lines_transmitted text,
    fax_status_page_errors text,
    held text,
    initial_state text,
    muted text,
    other_address_displayable text,
    other_address_name text,
    other_address_name_raw text,
    other_address_normalized text,
    other_address_raw text,
    peer_id text,
    provider text,
    recording text,
    recording_id text,
    recording_state text,
    secure_pause text,
    self_address_displayable text,
    self_address_name text,
    self_address_name_raw text,
    self_address_normalized text,
    self_address_raw text,
    start_alerting_time text,
    start_hold_time text,
    "state" text,
    uui_data text,
    wrapup_code text,
    wrapup_duration_seconds text,
    wrapup_end_time text,
    wrapup_name text,
    wrapup_notes text,
    wrapup_provisional text,
    PRIMARY KEY (id, conversation_id, conversation_participant_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation_participant(conversation_id),
    FOREIGN KEY (conversation_participant_id) REFERENCES conversation_participant(id),
    FOREIGN KEY (script_id) REFERENCES script(id)
);

CREATE TABLE conversation_participant_callback_wrapup_tag (
    "index" text,
    conversation_id text,
    conversation_participant_callback_id text,
    conversation_participant_id text,
    tag_name text,
    PRIMARY KEY ("index", conversation_id, conversation_participant_callback_id, conversation_participant_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation_participant_callback(conversation_id),
    FOREIGN KEY (conversation_participant_callback_id) REFERENCES conversation_participant_callback(id),
    FOREIGN KEY (conversation_participant_id) REFERENCES conversation_participant_callback(conversation_participant_id)
);

CREATE TABLE conversation_participant_callback_segment (
    _fivetran_id text,
    conversation_id text,
    conversation_participant_callback_id text,
    conversation_participant_id text,
    disconnect_type text,
    end_time text,
    how_ended text,
    start_time text,
    "type" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation_participant_callback(conversation_id),
    FOREIGN KEY (conversation_participant_callback_id) REFERENCES conversation_participant_callback(id),
    FOREIGN KEY (conversation_participant_id) REFERENCES conversation_participant_callback(conversation_participant_id)
);

CREATE TABLE conversation_participant_callback_number (
    "index" text,
    conversation_id text,
    conversation_participant_callback_id text,
    conversation_participant_id text,
    callback_number text,
    PRIMARY KEY ("index", conversation_id, conversation_participant_callback_id, conversation_participant_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation_participant_callback(conversation_id),
    FOREIGN KEY (conversation_participant_callback_id) REFERENCES conversation_participant_callback(id),
    FOREIGN KEY (conversation_participant_id) REFERENCES conversation_participant_callback(conversation_participant_id)
);

CREATE TABLE conversation_participant_callback (
    id text,
    conversation_id text,
    conversation_participant_id text,
    dialer_preview_campaign_id text,
    dialer_preview_contact_list_id text,
    script_id text,
    after_call_work_end_time text,
    after_call_work_required text,
    after_call_work_start_time text,
    after_call_work_state text,
    automated_callback_config_id text,
    call_back_scheduled_time text,
    call_back_user_name text,
    caller_id text,
    caller_id_name text,
    connected_time text,
    dialer_preview_contact_id text,
    dialer_preview_id text,
    dialer_preview_phone_number_columns jsonb,
    direction text,
    disconnect_type text,
    disconnected_time text,
    external_campaign text,
    held text,
    initial_state text,
    peer_id text,
    provider text,
    skip_enabled text,
    start_alerting_time text,
    start_hold_time text,
    "state" text,
    timeout_seconds text,
    voicemail_id text,
    voicemail_upload_status text,
    wrapup_code text,
    wrapup_duration_seconds text,
    wrapup_end_time text,
    wrapup_name text,
    wrapup_notes text,
    wrapup_provisional text,
    PRIMARY KEY (id, conversation_id, conversation_participant_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation_participant(conversation_id),
    FOREIGN KEY (conversation_participant_id) REFERENCES conversation_participant(id),
    FOREIGN KEY (dialer_preview_campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (dialer_preview_contact_list_id) REFERENCES contact_list(id),
    FOREIGN KEY (script_id) REFERENCES script(id)
);

CREATE TABLE conversation_participant_chat_wrapup_tag (
    "index" text,
    conversation_id text,
    conversation_participant_chat_id text,
    conversation_participant_id text,
    tag_name text,
    PRIMARY KEY ("index", conversation_id, conversation_participant_chat_id, conversation_participant_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation_participant_chat(conversation_id),
    FOREIGN KEY (conversation_participant_chat_id) REFERENCES conversation_participant_chat(id),
    FOREIGN KEY (conversation_participant_id) REFERENCES conversation_participant_chat(conversation_participant_id)
);

CREATE TABLE conversation_participant_chat_segment (
    _fivetran_id text,
    conversation_id text,
    conversation_participant_chat_id text,
    conversation_participant_id text,
    disconnect_type text,
    end_time text,
    how_ended text,
    start_time text,
    "type" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation_participant_chat(conversation_id),
    FOREIGN KEY (conversation_participant_chat_id) REFERENCES conversation_participant_chat(id),
    FOREIGN KEY (conversation_participant_id) REFERENCES conversation_participant_chat(conversation_participant_id)
);

CREATE TABLE conversation_participant_chat (
    id text,
    conversation_id text,
    conversation_participant_id text,
    script_id text,
    after_call_work_end_time text,
    after_call_work_required text,
    after_call_work_start_time text,
    after_call_work_state text,
    avatar_image_url text,
    connected_time text,
    direction text,
    disconnect_type text,
    disconnected_time text,
    held text,
    initial_state text,
    journey_context_customer_id text,
    journey_context_customer_id_type text,
    journey_context_customer_session_id text,
    journey_context_customer_session_id_type text,
    journey_context_triggering_action_action_map_id text,
    journey_context_triggering_action_action_map_version text,
    journey_context_triggering_action_id text,
    peer_id text,
    provider text,
    recording_id text,
    room_id text,
    start_alerting_time text,
    start_hold_time text,
    "state" text,
    wrapup_code text,
    wrapup_duration_seconds text,
    wrapup_end_time text,
    wrapup_name text,
    wrapup_notes text,
    wrapup_provisional text,
    PRIMARY KEY (id, conversation_id, conversation_participant_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation_participant(conversation_id),
    FOREIGN KEY (conversation_participant_id) REFERENCES conversation_participant(id),
    FOREIGN KEY (script_id) REFERENCES script(id)
);

CREATE TABLE conversation_participant_conversation_cobrowse_session_wrapup_tag (
    "index" text,
    conversation_id text,
    conversation_participant_conversation_cobrowse_session_id text,
    conversation_participant_id text,
    tag_name text,
    PRIMARY KEY ("index", conversation_id, conversation_participant_conversation_cobrowse_session_id, conversation_participant_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation_participant_conversation_cobrowse_session(conversation_id),
    FOREIGN KEY (conversation_participant_conversation_cobrowse_session_id) REFERENCES conversation_participant_conversation_cobrowse_session(id),
    FOREIGN KEY (conversation_participant_id) REFERENCES conversation_participant_conversation_cobrowse_session(conversation_participant_id)
);

CREATE TABLE conversation_participan_conversation_cobrowse_session_controlling (
    "index" text,
    conversation_id text,
    conversation_participant_conversation_cobrowse_session_id text,
    conversation_participant_id text,
    controlling text,
    PRIMARY KEY ("index", conversation_id, conversation_participant_conversation_cobrowse_session_id, conversation_participant_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation_participant_conversation_cobrowse_session(conversation_id),
    FOREIGN KEY (conversation_participant_conversation_cobrowse_session_id) REFERENCES conversation_participant_conversation_cobrowse_session(id),
    FOREIGN KEY (conversation_participant_id) REFERENCES conversation_participant_conversation_cobrowse_session(conversation_participant_id)
);

CREATE TABLE conversation_participan_conversation_cobrowse_session_segment (
    _fivetran_id text,
    conversation_id text,
    conversation_participant_conversation_cobrowse_session_id text,
    conversation_participant_id text,
    disconnect_type text,
    end_time text,
    how_ended text,
    start_time text,
    "type" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation_participant_conversation_cobrowse_session(conversation_id),
    FOREIGN KEY (conversation_participant_conversation_cobrowse_session_id) REFERENCES conversation_participant_conversation_cobrowse_session(id),
    FOREIGN KEY (conversation_participant_id) REFERENCES conversation_participant_conversation_cobrowse_session(conversation_participant_id)
);

CREATE TABLE conversation_participant_conversation_cobrowse_session (
    id text,
    conversation_id text,
    conversation_participant_id text,
    after_call_work_end_time text,
    after_call_work_required text,
    after_call_work_start_time text,
    after_call_work_state text,
    cobrowse_role text,
    cobrowse_session_id text,
    connected_time text,
    disconnect_type text,
    disconnected_time text,
    initial_state text,
    peer_id text,
    provider text,
    provider_event_time text,
    self_address_displayable text,
    self_address_name text,
    self_address_name_raw text,
    self_address_normalized text,
    self_address_raw text,
    start_alerting_time text,
    "state" text,
    viewer_url text,
    wrapup_code text,
    wrapup_duration_seconds text,
    wrapup_end_time text,
    wrapup_name text,
    wrapup_notes text,
    wrapup_provisional text,
    PRIMARY KEY (id, conversation_id, conversation_participant_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation_participant(conversation_id),
    FOREIGN KEY (conversation_participant_id) REFERENCES conversation_participant(id)
);

CREATE TABLE conversation_participant_email_wrapup_tag (
    "index" text,
    conversation_id text,
    conversation_participant_email_id text,
    conversation_participant_id text,
    tag_name text,
    PRIMARY KEY ("index", conversation_id, conversation_participant_email_id, conversation_participant_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation_participant_email(conversation_id),
    FOREIGN KEY (conversation_participant_email_id) REFERENCES conversation_participant_email(id),
    FOREIGN KEY (conversation_participant_id) REFERENCES conversation_participant_email(conversation_participant_id)
);

CREATE TABLE conversation_participant_email_segment (
    _fivetran_id text,
    conversation_id text,
    conversation_participant_email_id text,
    conversation_participant_id text,
    disconnect_type text,
    end_time text,
    how_ended text,
    start_time text,
    "type" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation_participant_email(conversation_id),
    FOREIGN KEY (conversation_participant_email_id) REFERENCES conversation_participant_email(id),
    FOREIGN KEY (conversation_participant_id) REFERENCES conversation_participant_email(conversation_participant_id)
);

CREATE TABLE conversation_participant_email_draft_attachment (
    attachment_id text,
    conversation_id text,
    conversation_participant_email_id text,
    conversation_participant_id text,
    content_length text,
    content_type text,
    content_uri text,
    inline_image text,
    "name" text,
    PRIMARY KEY (attachment_id, conversation_id, conversation_participant_email_id, conversation_participant_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation_participant_email(conversation_id),
    FOREIGN KEY (conversation_participant_email_id) REFERENCES conversation_participant_email(id),
    FOREIGN KEY (conversation_participant_id) REFERENCES conversation_participant_email(conversation_participant_id)
);

CREATE TABLE conversation_participant_email (
    id text,
    conversation_id text,
    conversation_participant_id text,
    script_id text,
    after_call_work_end_time text,
    after_call_work_required text,
    after_call_work_start_time text,
    after_call_work_state text,
    auto_generated text,
    connected_time text,
    direction text,
    dis_connected_time text,
    disconnect_type text,
    error_info_code text,
    error_info_context_id text,
    error_info_details jsonb,
    error_info_entity_id text,
    error_info_entity_name text,
    error_info_error jsonb,
    error_info_limit_key text,
    error_info_limit_namespace text,
    error_info_limit_value text,
    error_info_message text,
    error_info_message_params jsonb,
    error_info_message_with_params text,
    error_info_status text,
    held text,
    initial_state text,
    message_id text,
    messages_sent text,
    peer_id text,
    provider text,
    recording_id text,
    spam text,
    start_alerting_time text,
    start_hold_time text,
    "state" text,
    subject text,
    wrapup_code text,
    wrapup_duration_seconds text,
    wrapup_end_time text,
    wrapup_name text,
    wrapup_notes text,
    wrapup_provisional text,
    PRIMARY KEY (id, conversation_id, conversation_participant_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation_participant(conversation_id),
    FOREIGN KEY (conversation_participant_id) REFERENCES conversation_participant(id),
    FOREIGN KEY (script_id) REFERENCES script(id)
);

CREATE TABLE conversation_participant_message_wrapup_tag (
    "index" text,
    conversation_id text,
    conversation_participant_id text,
    conversation_participant_message_id text,
    tag_name text,
    PRIMARY KEY ("index", conversation_id, conversation_participant_id, conversation_participant_message_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation_participant_message(conversation_id),
    FOREIGN KEY (conversation_participant_id) REFERENCES conversation_participant_message(conversation_participant_id),
    FOREIGN KEY (conversation_participant_message_id) REFERENCES conversation_participant_message(id)
);

CREATE TABLE conversation_participant_message_segment (
    _fivetran_id text,
    conversation_id text,
    conversation_participant_id text,
    conversation_participant_message_id text,
    disconnect_type text,
    end_time text,
    how_ended text,
    start_time text,
    "type" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation_participant_message(conversation_id),
    FOREIGN KEY (conversation_participant_id) REFERENCES conversation_participant_message(conversation_participant_id),
    FOREIGN KEY (conversation_participant_message_id) REFERENCES conversation_participant_message(id)
);

CREATE TABLE conversation_participant_sent_message_media (
    id text,
    conversation_id text,
    conversation_participant_id text,
    conversation_participant_message_id text,
    message_id text,
    content_length_bytes text,
    media_type text,
    "name" text,
    url text,
    PRIMARY KEY (id, conversation_id, conversation_participant_id, conversation_participant_message_id, message_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation_participant_sent_message(conversation_id),
    FOREIGN KEY (conversation_participant_id) REFERENCES conversation_participant_sent_message(conversation_participant_id),
    FOREIGN KEY (conversation_participant_message_id) REFERENCES conversation_participant_sent_message(conversation_participant_message_id),
    FOREIGN KEY (message_id) REFERENCES conversation_participant_sent_message(message_id)
);

CREATE TABLE conversation_participant_sent_message_sticker (
    id text,
    conversation_id text,
    conversation_participant_id text,
    conversation_participant_message_id text,
    message_id text,
    url text,
    PRIMARY KEY (id, conversation_id, conversation_participant_id, conversation_participant_message_id, message_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation_participant_sent_message(conversation_id),
    FOREIGN KEY (conversation_participant_id) REFERENCES conversation_participant_sent_message(conversation_participant_id),
    FOREIGN KEY (conversation_participant_message_id) REFERENCES conversation_participant_sent_message(conversation_participant_message_id),
    FOREIGN KEY (message_id) REFERENCES conversation_participant_sent_message(message_id)
);

CREATE TABLE conversation_participant_sent_message (
    message_id text,
    conversation_id text,
    conversation_participant_id text,
    conversation_participant_message_id text,
    error_info_code text,
    error_info_message text,
    message_segment_count text,
    message_status text,
    message_time text,
    -- message_metadata_* (dynamic column),
    PRIMARY KEY (message_id, conversation_id, conversation_participant_id, conversation_participant_message_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation_participant_message(conversation_id),
    FOREIGN KEY (conversation_participant_id) REFERENCES conversation_participant_message(conversation_participant_id),
    FOREIGN KEY (conversation_participant_message_id) REFERENCES conversation_participant_message(id)
);

CREATE TABLE conversation_participant_message (
    id text,
    conversation_id text,
    conversation_participant_id text,
    script_id text,
    after_call_work_end_time text,
    after_call_work_required text,
    after_call_work_start_time text,
    after_call_work_state text,
    agent_assistant_id text,
    authenticated text,
    byo_sms_integration_id text,
    connected_time text,
    direction text,
    dis_connected_time text,
    disconnect_type text,
    error_info_code text,
    error_info_context_id text,
    error_info_details jsonb,
    error_info_entity_id text,
    error_info_entity_name text,
    error_info_error jsonb,
    error_info_limit_key text,
    error_info_limit_namespace text,
    error_info_limit_value text,
    error_info_message text,
    error_info_message_params jsonb,
    error_info_message_with_params text,
    error_info_status text,
    from_address_address_displayable text,
    from_address_address_name text,
    from_address_address_name_raw text,
    from_address_address_normalized text,
    from_address_address_raw text,
    held text,
    initial_state text,
    journey_context_customer_id text,
    journey_context_customer_id_type text,
    journey_context_customer_session_id text,
    journey_context_customer_session_id_type text,
    journey_context_triggering_action_action_map_id text,
    journey_context_triggering_action_action_map_version text,
    journey_context_triggering_action_id text,
    peer_id text,
    recipient_country text,
    recipient_type text,
    start_alerting_time text,
    start_hold_time text,
    "state" text,
    to_address_address_displayable text,
    to_address_address_name text,
    to_address_address_name_raw text,
    to_address_address_normalized text,
    to_address_address_raw text,
    "type" text,
    wrapup_code text,
    wrapup_duration_seconds text,
    wrapup_end_time text,
    wrapup_name text,
    wrapup_notes text,
    wrapup_provisional text,
    PRIMARY KEY (id, conversation_id, conversation_participant_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation_participant(conversation_id),
    FOREIGN KEY (conversation_participant_id) REFERENCES conversation_participant(id),
    FOREIGN KEY (script_id) REFERENCES script(id)
);

CREATE TABLE conversation_participant_screenshare_wrapup_tag (
    "index" text,
    conversation_id text,
    conversation_participant_id text,
    conversation_participant_screenshare_id text,
    tag_name text,
    PRIMARY KEY ("index", conversation_id, conversation_participant_id, conversation_participant_screenshare_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation_participant_screenshare(conversation_id),
    FOREIGN KEY (conversation_participant_id) REFERENCES conversation_participant_screenshare(conversation_participant_id),
    FOREIGN KEY (conversation_participant_screenshare_id) REFERENCES conversation_participant_screenshare(id)
);

CREATE TABLE conversation_participant_screenshare_segment (
    _fivetran_id text,
    conversation_id text,
    conversation_participant_id text,
    conversation_participant_screenshare_id text,
    disconnect_type text,
    end_time text,
    how_ended text,
    start_time text,
    "type" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation_participant_screenshare(conversation_id),
    FOREIGN KEY (conversation_participant_id) REFERENCES conversation_participant_screenshare(conversation_participant_id),
    FOREIGN KEY (conversation_participant_screenshare_id) REFERENCES conversation_participant_screenshare(id)
);

CREATE TABLE conversation_participant_screenshare (
    id text,
    conversation_id text,
    conversation_participant_id text,
    after_call_work_end_time text,
    after_call_work_required text,
    after_call_work_start_time text,
    after_call_work_state text,
    connected_time text,
    context text,
    disconnect_type text,
    disconnected_time text,
    initial_state text,
    peer_count text,
    peer_id text,
    provider text,
    sharing text,
    start_alerting_time text,
    "state" text,
    wrapup_code text,
    wrapup_duration_seconds text,
    wrapup_end_time text,
    wrapup_name text,
    wrapup_notes text,
    wrapup_provisional text,
    PRIMARY KEY (id, conversation_id, conversation_participant_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation_participant(conversation_id),
    FOREIGN KEY (conversation_participant_id) REFERENCES conversation_participant(id)
);

CREATE TABLE conversation_participant_social_expression_wrapup_tag (
    "index" text,
    conversation_id text,
    conversation_participant_id text,
    conversation_participant_social_expression_id text,
    tag_name text,
    PRIMARY KEY ("index", conversation_id, conversation_participant_id, conversation_participant_social_expression_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation_participant_social_expression(conversation_id),
    FOREIGN KEY (conversation_participant_id) REFERENCES conversation_participant_social_expression(conversation_participant_id),
    FOREIGN KEY (conversation_participant_social_expression_id) REFERENCES conversation_participant_social_expression(id)
);

CREATE TABLE conversation_participant_social_expression_segment (
    _fivetran_id text,
    conversation_id text,
    conversation_participant_id text,
    conversation_participant_social_expression_id text,
    disconnect_type text,
    end_time text,
    how_ended text,
    start_time text,
    "type" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation_participant_social_expression(conversation_id),
    FOREIGN KEY (conversation_participant_id) REFERENCES conversation_participant_social_expression(conversation_participant_id),
    FOREIGN KEY (conversation_participant_social_expression_id) REFERENCES conversation_participant_social_expression(id)
);

CREATE TABLE conversation_participant_social_expression (
    id text,
    conversation_id text,
    conversation_participant_id text,
    script_id text,
    after_call_work_end_time text,
    after_call_work_required text,
    after_call_work_start_time text,
    after_call_work_state text,
    connected_time text,
    disconnect_type text,
    disconnected_time text,
    held text,
    peer_id text,
    preview_text text,
    provider text,
    recording_id text,
    social_media_hub text,
    social_media_id text,
    social_user_name text,
    start_alerting_time text,
    start_hold_time text,
    "state" text,
    wrapup_code text,
    wrapup_duration_seconds text,
    wrapup_end_time text,
    wrapup_name text,
    wrapup_notes text,
    wrapup_provisional text,
    PRIMARY KEY (id, conversation_id, conversation_participant_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation_participant(conversation_id),
    FOREIGN KEY (conversation_participant_id) REFERENCES conversation_participant(id),
    FOREIGN KEY (script_id) REFERENCES script(id)
);

CREATE TABLE conversation_participant_video_wrapup_tag (
    "index" text,
    conversation_id text,
    conversation_participant_id text,
    conversation_participant_video_id text,
    tag_name text,
    PRIMARY KEY ("index", conversation_id, conversation_participant_id, conversation_participant_video_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation_participant_video(conversation_id),
    FOREIGN KEY (conversation_participant_id) REFERENCES conversation_participant_video(conversation_participant_id),
    FOREIGN KEY (conversation_participant_video_id) REFERENCES conversation_participant_video(id)
);

CREATE TABLE conversation_participant_video_ms_id (
    "index" text,
    conversation_id text,
    conversation_participant_id text,
    conversation_participant_video_id text,
    ms_id text,
    PRIMARY KEY ("index", conversation_id, conversation_participant_id, conversation_participant_video_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation_participant_video(conversation_id),
    FOREIGN KEY (conversation_participant_id) REFERENCES conversation_participant_video(conversation_participant_id),
    FOREIGN KEY (conversation_participant_video_id) REFERENCES conversation_participant_video(id)
);

CREATE TABLE conversation_participant_video (
    id text,
    conversation_id text,
    conversation_participant_id text,
    after_call_work_end_time text,
    after_call_work_required text,
    after_call_work_start_time text,
    after_call_work_state text,
    audio_muted text,
    context text,
    disconnect_type text,
    disconnected_time text,
    initial_state text,
    peer_count text,
    peer_id text,
    provider text,
    self_address_displayable text,
    self_address_normalized text,
    self_address_raw text,
    self_name text,
    self_name_raw text,
    sharing_screen text,
    "state" text,
    video_muted text,
    wrapup_code text,
    wrapup_duration_seconds text,
    wrapup_end_time text,
    wrapup_name text,
    wrapup_notes text,
    wrapup_provisional text,
    PRIMARY KEY (id, conversation_id, conversation_participant_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation_participant(conversation_id),
    FOREIGN KEY (conversation_participant_id) REFERENCES conversation_participant(id)
);

CREATE TABLE conversation_participant_evaluation_form_question_group_question (
    id text,
    conversation_id text,
    conversation_participant_evaluation_form_question_group_id text,
    conversation_participant_evaluation_id text,
    conversation_participant_id text,
    answer_options jsonb,
    comments_required text,
    help_text text,
    is_critical text,
    is_kill text,
    na_enabled text,
    text text,
    "type" text,
    visibility_condition jsonb,
    PRIMARY KEY (id, conversation_id, conversation_participant_evaluation_form_question_group_id, conversation_participant_evaluation_id, conversation_participant_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation_participant_evaluation_form_question_group(conversation_id),
    FOREIGN KEY (conversation_participant_evaluation_form_question_group_id) REFERENCES conversation_participant_evaluation_form_question_group(id),
    FOREIGN KEY (conversation_participant_evaluation_id) REFERENCES conversation_participant_evaluation_form_question_group(conversation_participant_evaluation_id),
    FOREIGN KEY (conversation_participant_id) REFERENCES conversation_participant_evaluation_form_question_group(conversation_participant_id)
);

CREATE TABLE conversation_participant_evaluation_form_question_group (
    id text,
    conversation_id text,
    conversation_participant_evaluation_id text,
    conversation_participant_id text,
    default_answers_to_highest text,
    default_answers_to_na text,
    manual_weight text,
    na_enabled text,
    "name" text,
    "type" text,
    visibility_condition text,
    weight text,
    PRIMARY KEY (id, conversation_id, conversation_participant_evaluation_id, conversation_participant_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation_participant_evaluation(conversation_id),
    FOREIGN KEY (conversation_participant_evaluation_id) REFERENCES conversation_participant_evaluation(id),
    FOREIGN KEY (conversation_participant_id) REFERENCES conversation_participant_evaluation(conversation_participant_id)
);

CREATE TABLE conversation_participant_evaluation_answers_question_group_score (
    _fivetran_id text,
    conversation_id text,
    conversation_participant_evaluation_id text,
    conversation_participant_id text,
    marked_na text,
    max_total_critical_score text,
    max_total_critical_score_unweighted text,
    max_total_non_critical_score text,
    max_total_non_critical_score_unweighted text,
    max_total_score text,
    max_total_score_unweighted text,
    question_group_id text,
    question_scores jsonb,
    total_critical_score text,
    total_critical_score_unweighted text,
    total_non_critical_score text,
    total_non_critical_score_unweighted text,
    total_score text,
    total_score_unweighted text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation_participant_evaluation(conversation_id),
    FOREIGN KEY (conversation_participant_evaluation_id) REFERENCES conversation_participant_evaluation(id),
    FOREIGN KEY (conversation_participant_id) REFERENCES conversation_participant_evaluation(conversation_participant_id)
);

CREATE TABLE conversation_participant_evaluation_answers_transcript_topic (
    id text,
    conversation_id text,
    conversation_participant_evaluation_id text,
    conversation_participant_id text,
    confidence text,
    duration_total_milliseconds text,
    "name" text,
    offset_character_count text,
    offset_word_count text,
    recording_location text,
    start_time_milliseconds text,
    topic_phrase text,
    transcript_phrase text,
    PRIMARY KEY (id, conversation_id, conversation_participant_evaluation_id, conversation_participant_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation_participant_evaluation(conversation_id),
    FOREIGN KEY (conversation_participant_evaluation_id) REFERENCES conversation_participant_evaluation(id),
    FOREIGN KEY (conversation_participant_id) REFERENCES conversation_participant_evaluation(conversation_participant_id)
);

CREATE TABLE conversation_participant_evaluation_media_type (
    _fivetran_id text,
    conversation_id text,
    conversation_participant_evaluation_id text,
    conversation_participant_id text,
    media_type text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation_participant_evaluation(conversation_id),
    FOREIGN KEY (conversation_participant_evaluation_id) REFERENCES conversation_participant_evaluation(id),
    FOREIGN KEY (conversation_participant_id) REFERENCES conversation_participant_evaluation(conversation_participant_id)
);

CREATE TABLE conversation_participant_evaluation_authorized_action (
    _fivetran_id text,
    conversation_id text,
    conversation_participant_evaluation_id text,
    conversation_participant_id text,
    authorized_actions text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation_participant_evaluation(conversation_id),
    FOREIGN KEY (conversation_participant_evaluation_id) REFERENCES conversation_participant_evaluation(id),
    FOREIGN KEY (conversation_participant_id) REFERENCES conversation_participant_evaluation(conversation_participant_id)
);

CREATE TABLE conversation_participant_evaluation (
    id text,
    conversation_id text,
    conversation_participant_id text,
    agent_id text,
    assignee_id text,
    evaluator_id text,
    queue_id text,
    reference_conversationid text,
    agent_has_read text,
    answers_agent_comments text,
    answers_any_failed_kill_questions text,
    answers_comments text,
    answers_private_comments text,
    answers_self_uri text,
    answers_total_critical_score text,
    answers_total_non_critical_score text,
    answers_total_score text,
    assigned text,
    assigned_date text,
    assignee_applicable text,
    calibration_agent text,
    calibration_average_score text,
    calibration_calibrator text,
    calibration_context_id text,
    calibration_conversation text,
    calibration_created_date text,
    calibration_evaluation_form text,
    calibration_evaluations jsonb,
    calibration_evaluators jsonb,
    calibration_expert_evaluator text,
    calibration_high_score text,
    calibration_id text,
    calibration_low_score text,
    calibration_name text,
    calibration_scoring_index text,
    calibration_self_uri text,
    changed_date text,
    conversation_date text,
    conversation_end_date text,
    date_assignee_changed text,
    evaluation_form_context_id text,
    evaluation_form_id text,
    evaluation_form_modified_date text,
    evaluation_form_name text,
    evaluation_form_published text,
    evaluation_form_self_uri text,
    evaluation_source_id text,
    evaluation_source_name text,
    evaluation_source_self_uri text,
    evaluation_source_type text,
    has_assistance_failed text,
    is_scoring_index text,
    "name" text,
    never_release text,
    redacted text,
    reference_conversation_id text,
    release_date text,
    rescore text,
    resource_id text,
    resource_type text,
    revision_created_date text,
    self_uri text,
    "status" text,
    PRIMARY KEY (id, conversation_id, conversation_participant_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation_participant(conversation_id),
    FOREIGN KEY (conversation_participant_id) REFERENCES conversation_participant(id),
    FOREIGN KEY (agent_id) REFERENCES users(id),
    FOREIGN KEY (assignee_id) REFERENCES users(id),
    FOREIGN KEY (evaluator_id) REFERENCES users(id),
    FOREIGN KEY (queue_id) REFERENCES routing_queue(id),
    FOREIGN KEY (reference_conversationid) REFERENCES conversation(id)
);

CREATE TABLE conversation_participant (
    id text,
    conversation_id text,
    barged_participant_id text,
    coached_participant_id text,
    consult_participant_id text,
    conversation_routing_data_queue_id text,
    group_id text,
    monitored_participant_id text,
    queue_id text,
    user_id text,
    address text,
    alerting_timeout_ms text,
    ani text,
    ani_name text,
    connected_time text,
    conversation_routing_data_language text,
    conversation_routing_data_language_self_uri text,
    conversation_routing_data_priority text,
    dnis text,
    end_acw_time text,
    end_time text,
    external_contact_id text,
    external_organization_id text,
    flagged_reason text,
    locale text,
    "name" text,
    participant_type text,
    purpose text,
    queue_name text,
    screen_recording_state text,
    start_acw_time text,
    start_time text,
    team_id text,
    wrapup_code text,
    wrapup_duration_seconds text,
    wrapup_end_time text,
    wrapup_name text,
    wrapup_notes text,
    wrapup_prompt text,
    wrapup_provisional text,
    wrapup_required text,
    wrapup_skipped text,
    wrapup_timeout_ms text,
    PRIMARY KEY (id, conversation_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id),
    FOREIGN KEY (barged_participant_id) REFERENCES conversation_participant(id),
    FOREIGN KEY (coached_participant_id) REFERENCES conversation_participant(id),
    FOREIGN KEY (consult_participant_id) REFERENCES conversation_participant(id),
    FOREIGN KEY (conversation_routing_data_queue_id) REFERENCES routing_queue(id),
    FOREIGN KEY (group_id) REFERENCES groups(id),
    FOREIGN KEY (monitored_participant_id) REFERENCES conversation_participant(id),
    FOREIGN KEY (queue_id) REFERENCES routing_queue(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE conversation (
    id text,
    address text,
    end_time text,
    external_tag text,
    max_participants text,
    "name" text,
    recording_state text,
    secure_pause text,
    self_uri text,
    start_time text,
    "state" text,
    PRIMARY KEY (id)
);

CREATE TABLE calibration (
    id text,
    agent_id text,
    calibrator_id text,
    conversation_id text,
    evaluation_form_id text,
    evaluation_id text,
    evaluator_id text,
    expert_evaluator_id text,
    manager_id text,
    scoring_index_id text,
    agent text,
    average_score text,
    context_id text,
    created_date text,
    high_score text,
    low_score text,
    "name" text,
    self_uri text,
    PRIMARY KEY (id),
    FOREIGN KEY (agent_id) REFERENCES users(id),
    FOREIGN KEY (calibrator_id) REFERENCES users(id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id),
    FOREIGN KEY (evaluation_form_id) REFERENCES evaluation_form(id),
    FOREIGN KEY (evaluation_id) REFERENCES evaluation(id),
    FOREIGN KEY (evaluator_id) REFERENCES users(id),
    FOREIGN KEY (expert_evaluator_id) REFERENCES users(id),
    FOREIGN KEY (manager_id) REFERENCES users(id),
    FOREIGN KEY (scoring_index_id) REFERENCES evaluation(id)
);

CREATE TABLE conversation_call_history_participants (
    id text,
    conversation_call_history_id text,
    campaign_id text,
    group_id text,
    queue_id text,
    user_id text,
    address text,
    ani text,
    did_interact text,
    direction text,
    disconnect_type text,
    dnis text,
    end_time text,
    external_canonical_contact_id text,
    external_canonical_contact_self_uri text,
    external_contact_address_address_1 text,
    external_contact_address_address_2 text,
    external_contact_address_city text,
    external_contact_address_country_code text,
    external_contact_address_postal_code text,
    external_contact_address_state text,
    external_contact_cellphone_accepts_sms text,
    external_contact_cellphone_country_code text,
    external_contact_cellphone_display text,
    external_contact_cellphone_e_164 text,
    external_contact_cellphone_extension text,
    external_contact_cellphone_user_input text,
    external_contact_create_date text,
    external_contact_custom_fields jsonb,
    external_contact_external_data_source jsonb,
    external_contact_external_organization_id text,
    external_contact_external_system_url text,
    external_contact_facebook_id jsonb,
    external_contact_facebook_id_displayname text,
    external_contact_first_name text,
    external_contact_homephone_accepts_sms text,
    external_contact_homephone_country_code text,
    external_contact_homephone_display text,
    external_contact_homephone_e_164 text,
    external_contact_homephone_extension text,
    external_contact_homephone_user_input text,
    external_contact_id text,
    external_contact_json_schema text,
    external_contact_json_schema_additional_properties jsonb,
    external_contact_json_schema_description text,
    external_contact_json_schema_id text,
    external_contact_json_schema_properties jsonb,
    external_contact_json_schema_required jsonb,
    external_contact_json_schema_title text,
    external_contact_json_schema_type text,
    external_contact_last_name text,
    external_contact_line_id jsonb,
    external_contact_line_id_display_name text,
    external_contact_merge_operation_resulting_contact_id text,
    external_contact_merge_operation_resulting_contact_self_uri text,
    external_contact_merge_operation_source_contact_id text,
    external_contact_merge_operation_source_contact_self_uri text,
    external_contact_merge_operation_target_contact_id text,
    external_contact_merge_operation_target_contact_self_uri text,
    external_contact_merge_set jsonb,
    external_contact_middle_name text,
    external_contact_modify_date text,
    external_contact_other_email text,
    external_contact_other_phone_accepts_sms text,
    external_contact_other_phone_country_code text,
    external_contact_other_phone_display text,
    external_contact_other_phone_e_164 text,
    external_contact_other_phone_extension text,
    external_contact_other_phone_user_input text,
    external_contact_personal_email text,
    external_contact_salutation text,
    external_contact_schema_applies_to text,
    external_contact_schema_created_by_id text,
    external_contact_schema_date_created text,
    external_contact_schema_enabled text,
    external_contact_schema_id text,
    external_contact_schema_name text,
    external_contact_schema_self_uri text,
    external_contact_schema_version text,
    external_contact_self_uri text,
    external_contact_survey_opt_out text,
    external_contact_title text,
    external_contact_twitter_id text,
    external_contact_twitter_id_id text,
    external_contact_twitter_id_name text,
    external_contact_twitter_id_profile_url text,
    external_contact_twitter_id_screen_name text,
    external_contact_twitter_id_verified text,
    external_contact_type text,
    external_contact_whatsapp_id_phone_number_accepts_sms text,
    external_contact_whatsapp_id_phone_number_country_code text,
    external_contact_whatsapp_id_phone_number_display text,
    external_contact_whatsapp_id_phone_number_e_164 text,
    external_contact_whatsapp_id_phone_number_extension text,
    external_contact_whatsapp_id_phone_number_user_input text,
    external_contact_whatsappid_displayname text,
    external_contact_work_email text,
    external_contact_workphone_accepts_sms text,
    external_contact_workphone_country_code text,
    external_contact_workphone_display text,
    external_contact_workphone_e_164 text,
    external_contact_workphone_extension text,
    external_contact_workphone_user_input text,
    external_organization_address_address_1 text,
    external_organization_address_address_2 text,
    external_organization_address_city text,
    external_organization_address_country_code text,
    external_organization_address_postal_code text,
    external_organization_address_state text,
    external_organization_company_type text,
    external_organization_create_date text,
    external_organization_custom_fields text,
    external_organization_did_interact text,
    external_organization_employee_count text,
    external_organization_external_data_source text,
    external_organization_external_system_url text,
    external_organization_fax_number_accepts_sms text,
    external_organization_fax_number_country_code text,
    external_organization_fax_number_display text,
    external_organization_fax_number_e_164 text,
    external_organization_fax_number_extension text,
    external_organization_fax_number_user_input text,
    external_organization_flagged_reason text,
    external_organization_id text,
    external_organization_industry text,
    external_organization_modify_date text,
    external_organization_name text,
    external_organization_outbound_campaign_id text,
    external_organization_phone_number_accepts_sms text,
    external_organization_phone_number_country_code text,
    external_organization_phone_number_display text,
    external_organization_phone_number_e_164 text,
    external_organization_phone_number_extension text,
    external_organization_phone_number_user_input text,
    external_organization_primary_contact_id text,
    external_organization_revenue text,
    external_organization_schema_additional_properties text,
    external_organization_schema_applies_to text,
    external_organization_schema_created_by_id text,
    external_organization_schema_date_created text,
    external_organization_schema_enabled text,
    external_organization_schema_id text,
    external_organization_schema_jsonschema_description text,
    external_organization_schema_jsonschema_id text,
    external_organization_schema_jsonschema_schema text,
    external_organization_schema_jsonschema_title text,
    external_organization_schema_jsonschema_type text,
    external_organization_schema_name text,
    external_organization_schema_properties text,
    external_organization_schema_required text,
    external_organization_schema_version text,
    external_organization_selfuri text,
    external_organization_sip_response_code text,
    external_organization_tag jsonb,
    external_organization_tickers jsonb,
    external_organization_trustor_authorization_permission text,
    external_organization_trustor_created_by_id text,
    external_organization_trustor_date_created text,
    external_organization_trustor_enabled text,
    external_organization_trustor_id text,
    external_organization_trustor_organization jsonb,
    external_organization_trustor_selfuri text,
    external_organization_websites jsonb,
    flagged_reason text,
    had_cobrowse text,
    had_screen_share text,
    missed_call text,
    "name" text,
    purpose text,
    self_uri text,
    start_time text,
    was_callback text,
    was_conference text,
    was_outbound_campaign text,
    went_to_voicemail text,
    PRIMARY KEY (id, conversation_call_history_id),
    FOREIGN KEY (conversation_call_history_id) REFERENCES conversation_call_history(id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (group_id) REFERENCES groups(id),
    FOREIGN KEY (queue_id) REFERENCES routing_queue(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE conversation_call_history (
    id text,
    direction text,
    had_cobrowse text,
    had_screen_share text,
    missed_call text,
    "name" text,
    self_uri text,
    start_time text,
    was_callback text,
    was_conference text,
    was_outbound_campaign text,
    went_to_voice_mail text,
    PRIMARY KEY (id)
);

CREATE TABLE division (
    id text,
    description text,
    home_division text,
    "name" text,
    self_uri text,
    -- count_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE sequence_campaign (
    campaign_id text,
    sequence_id text,
    PRIMARY KEY (campaign_id, sequence_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (sequence_id) REFERENCES "sequence"(id)
);

CREATE TABLE "sequence" (
    id text,
    current_campaign text,
    date_created text,
    date_modified timestamp,
    "name" text,
    "repeat" text,
    self_uri text,
    "status" text,
    stop_message text,
    version text,
    PRIMARY KEY (id)
);

CREATE TABLE attempt_limit (
    id text,
    date_created text,
    date_modified timestamp,
    max_attempts_per_contact text,
    max_attempts_per_number text,
    "name" text,
    recall_entries jsonb,
    reset_period text,
    self_uri text,
    time_zone_id text,
    version text,
    PRIMARY KEY (id)
);

CREATE TABLE rule_condition_field_mapping (
    _fivetran_id text,
    "index" text,
    rule_id text,
    ruleset_id text,
    contact_column_name text,
    data_action_field text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY ("index") REFERENCES rule_condition("index"),
    FOREIGN KEY (rule_id) REFERENCES rule_condition(rule_id),
    FOREIGN KEY (ruleset_id) REFERENCES rule_condition(ruleset_id)
);

CREATE TABLE rule_condition_predicate (
    _fivetran_id text,
    "index" text,
    rule_id text,
    ruleset_id text,
    comparison_value text,
    inverted text,
    output_field text,
    output_field_missing_resolution text,
    output_operator text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY ("index") REFERENCES rule_condition("index"),
    FOREIGN KEY (rule_id) REFERENCES rule_condition(rule_id),
    FOREIGN KEY (ruleset_id) REFERENCES rule_condition(ruleset_id)
);

CREATE TABLE rule_condition (
    "index" text,
    rule_id text,
    ruleset_id text,
    agent_wrapup_field text,
    attribute_name text,
    call_analysis_result_field text,
    codes jsonb,
    contact_id_field text,
    data_action_id text,
    data_action_name text,
    data_action_self_uri text,
    data_not_found_resolution text,
    inverted text,
    operator text,
    property text,
    property_type text,
    "type" text,
    "value" text,
    value_type text,
    PRIMARY KEY ("index", rule_id, ruleset_id),
    FOREIGN KEY (rule_id) REFERENCES rule(id),
    FOREIGN KEY (ruleset_id) REFERENCES rule(ruleset_id)
);

CREATE TABLE rule_action_field_mapping (
    _fivetran_id text,
    "index" text,
    rule_id text,
    ruleset_id text,
    contact_column_name text,
    data_action_field text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY ("index") REFERENCES rule_action("index"),
    FOREIGN KEY (rule_id) REFERENCES rule_action(rule_id),
    FOREIGN KEY (ruleset_id) REFERENCES rule_action(ruleset_id)
);

CREATE TABLE rule_action (
    "index" text,
    rule_id text,
    ruleset_id text,
    action_type_name text,
    agent_wrapup_field text,
    call_analysis_result_field text,
    contact_id_field text,
    data_action_id text,
    data_action_name text,
    data_action_self_uri text,
    properties jsonb,
    "type" text,
    update_option text,
    PRIMARY KEY ("index", rule_id, ruleset_id),
    FOREIGN KEY (rule_id) REFERENCES rule(id),
    FOREIGN KEY (ruleset_id) REFERENCES rule(ruleset_id)
);

CREATE TABLE rule (
    id text,
    ruleset_id text,
    category text,
    "name" text,
    orders text,
    PRIMARY KEY (id, ruleset_id),
    FOREIGN KEY (ruleset_id) REFERENCES ruleset(id)
);

CREATE TABLE ruleset (
    id text,
    contact_list_id text,
    queue_id text,
    date_created text,
    date_modified timestamp,
    "name" text,
    self_uri text,
    version text,
    PRIMARY KEY (id),
    FOREIGN KEY (contact_list_id) REFERENCES contact_list(id),
    FOREIGN KEY (queue_id) REFERENCES routing_queue(id)
);

CREATE TABLE analytics_conversation_aggregate_query_data_metric (
    analytics_conversation_aggregate_query_data_index text,
    conversation_id text,
    "index" text,
    "interval" text,
    media_type text,
    metric text,
    qualifier text,
    stats_count text,
    stats_count_negative text,
    stats_count_positive text,
    stats_current text,
    stats_denominator text,
    stats_max text,
    stats_min text,
    stats_numerator text,
    stats_p_95 text,
    stats_p_99 text,
    stats_ratio text,
    stats_sum text,
    stats_target text,
    PRIMARY KEY (analytics_conversation_aggregate_query_data_index, conversation_id, "index")
);

CREATE TABLE flow_outcome_error_detail (
    _fivetran_id text,
    flow_outcome_id text,
    entity_id text,
    entity_name text,
    error_code text,
    field_name text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (flow_outcome_id) REFERENCES flow_outcome(id)
);

CREATE TABLE flow_outcome (
    id text,
    current_operation_user_id text,
    division_id text,
    current_operation_action_name text,
    current_operation_action_status text,
    current_operation_client_id text,
    current_operation_client_name text,
    current_operation_client_self_uri text,
    current_operation_complete text,
    current_operation_error_code text,
    current_operation_error_message text,
    current_operation_error_message_params jsonb,
    current_operation_id text,
    description text,
    "name" text,
    self_uri text,
    PRIMARY KEY (id),
    FOREIGN KEY (current_operation_user_id) REFERENCES users(id),
    FOREIGN KEY (division_id) REFERENCES division(id)
);

CREATE TABLE dnc_code (
    "index" text,
    dnc_id text,
    dnc_code text,
    PRIMARY KEY ("index", dnc_id),
    FOREIGN KEY (dnc_id) REFERENCES dnc(id)
);

CREATE TABLE dnc (
    id text,
    campaign_id text,
    division_id text,
    contact_method text,
    custom_exclusion_column text,
    date_created text,
    date_modified timestamp,
    dnc_source_type text,
    import_status_completed_records text,
    import_status_failure_reason text,
    import_status_percent_complete text,
    import_status_state text,
    import_status_total_record text,
    license_id text,
    login_id text,
    "name" text,
    self_uri text,
    "size" text,
    version text,
    PRIMARY KEY (id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (division_id) REFERENCES division(id)
);

CREATE TABLE external_contact_identifier (
    "index" text,
    external_contact_id text,
    date_created text,
    "type" text,
    "value" text,
    PRIMARY KEY ("index", external_contact_id),
    FOREIGN KEY (external_contact_id) REFERENCES external_contact(id)
);

CREATE TABLE external_contact_line_id (
    "index" text,
    external_contact_id text,
    user_id text,
    PRIMARY KEY ("index", external_contact_id),
    FOREIGN KEY (external_contact_id) REFERENCES external_contact(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE external_contact_facebook_id (
    "index" text,
    external_contact_id text,
    scoped_id text,
    PRIMARY KEY ("index", external_contact_id),
    FOREIGN KEY (external_contact_id) REFERENCES external_contact(id)
);

CREATE TABLE external_contact_external_data_source (
    "index" text,
    external_contact_id text,
    platform text,
    url text,
    PRIMARY KEY ("index", external_contact_id),
    FOREIGN KEY (external_contact_id) REFERENCES external_contact(id)
);

CREATE TABLE external_contact_external_id (
    "index" text,
    external_contact_id text,
    external_source_active text,
    external_source_id text,
    external_source_link_configuration_uri_template text,
    external_source_name text,
    "value" text,
    PRIMARY KEY ("index", external_contact_id),
    FOREIGN KEY (external_contact_id) REFERENCES external_contact(id)
);

CREATE TABLE external_contact (
    id text,
    canonical_contact_id text,
    organization_id text,
    address_1 text,
    address_2 text,
    address_city text,
    address_country_code text,
    address_postal_code text,
    address_state text,
    create_date text,
    external_system_url text,
    facebook_display_name text,
    first_name text,
    last_name text,
    line_display_name text,
    merge_operation_resulting_contact text,
    merge_operation_source_contact text,
    merge_operation_target_contact text,
    merge_set jsonb,
    middle_name text,
    modify_date text,
    other_email text,
    personal_email text,
    salutation text,
    "schema" text,
    self_uri text,
    survey_opt_out text,
    title text,
    twitter_id text,
    twitter_name text,
    twitter_profile_url text,
    twitter_screen_name text,
    twitter_verified text,
    "type" text,
    whats_app_display_name text,
    whats_app_phone_number text,
    work_email text,
    work_phone_accepts_sms text,
    work_phone_country_code text,
    work_phone_display text,
    work_phone_e_164 text,
    work_phone_extension text,
    work_phone_normalization_country_code text,
    work_phone_user_input text,
    -- custom_field_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (canonical_contact_id) REFERENCES contact_list(id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE routing_wrapup_code (
    id text,
    division_id text,
    created_by text,
    date_created text,
    date_modified text,
    modified_by text,
    "name" text,
    self_uri text,
    PRIMARY KEY (id),
    FOREIGN KEY (division_id) REFERENCES division(id)
);

CREATE TABLE messaging_campaign_dnc (
    dnc_id text,
    messaging_campaign_id text,
    PRIMARY KEY (dnc_id, messaging_campaign_id),
    FOREIGN KEY (dnc_id) REFERENCES dnc(id),
    FOREIGN KEY (messaging_campaign_id) REFERENCES messaging_campaign(id)
);

CREATE TABLE messaging_campaign_contact_sort (
    _fivetran_id text,
    messaging_campaign_id text,
    direction text,
    field_name text,
    numeric text,
    PRIMARY KEY (_fivetran_id, messaging_campaign_id),
    FOREIGN KEY (messaging_campaign_id) REFERENCES messaging_campaign(id)
);

CREATE TABLE messaging_campaign_contact_list_filter (
    contact_list_filter_id text,
    messaging_campaign_id text,
    PRIMARY KEY (contact_list_filter_id, messaging_campaign_id),
    FOREIGN KEY (contact_list_filter_id) REFERENCES contact_list_filter(id),
    FOREIGN KEY (messaging_campaign_id) REFERENCES messaging_campaign(id)
);

CREATE TABLE messaging_campaign_rule_set (
    messaging_campaign_id text,
    rule_set_id text,
    PRIMARY KEY (messaging_campaign_id, rule_set_id),
    FOREIGN KEY (messaging_campaign_id) REFERENCES messaging_campaign(id),
    FOREIGN KEY (rule_set_id) REFERENCES ruleset(id)
);

CREATE TABLE messaging_campaign_error (
    _fivetran_id text,
    messaging_campaign_id text,
    details text,
    error text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (messaging_campaign_id) REFERENCES messaging_campaign(id)
);

CREATE TABLE messaging_campaign (
    id text,
    callable_time_set_id text,
    contact_list_id text,
    division_id text,
    always_running text,
    campaign_status text,
    date_created text,
    date_modified text,
    dynamic_contact_queueing_settings_sort text,
    email_config_content_template_id text,
    email_config_content_template_name text,
    email_config_content_template_self_uri text,
    email_config_email_column jsonb,
    email_config_from_address_domain_id text,
    email_config_from_address_domain_name text,
    email_config_from_address_domain_self_uri text,
    email_config_from_address_friendly_name text,
    email_config_from_address_local_part text,
    email_config_reply_address_domain_id text,
    email_config_reply_address_domain_name text,
    email_config_reply_address_domain_self_uri text,
    email_config_reply_address_route_id text,
    email_config_reply_address_route_name text,
    email_config_reply_address_route_self_uri text,
    messages_per_minute text,
    "name" text,
    self_uri text,
    sms_config_content_template_id text,
    sms_config_content_template_name text,
    sms_config_content_template_self_uri text,
    sms_config_message_column text,
    sms_config_phone_column text,
    sms_config_sender_sms_phone_number text,
    sms_config_sender_sms_phone_number_self_uri text,
    version text,
    PRIMARY KEY (id),
    FOREIGN KEY (callable_time_set_id) REFERENCES callable_timeset(id),
    FOREIGN KEY (contact_list_id) REFERENCES contact_list(id),
    FOREIGN KEY (division_id) REFERENCES division(id)
);

CREATE TABLE evaluation_answer_question_group_question_score (
    question_id text,
    evaluation_answer_question_group_score_question_group_id text,
    evaluation_id text,
    answer_id text,
    assisted_answer_id text,
    comments text,
    failed_kill_question text,
    marked_na text,
    score text,
    system_marked_na text,
    PRIMARY KEY (question_id, evaluation_answer_question_group_score_question_group_id, evaluation_id),
    FOREIGN KEY (evaluation_answer_question_group_score_question_group_id) REFERENCES evaluation_answer_question_group_score(question_group_id),
    FOREIGN KEY (evaluation_id) REFERENCES evaluation_answer_question_group_score(evaluation_id)
);

CREATE TABLE evaluation_answer_question_group_score (
    question_group_id text,
    evaluation_id text,
    marked_na text,
    max_total_critical_score text,
    max_total_critical_score_unweighted text,
    max_total_non_critical_score text,
    max_total_non_critical_score_unweighted text,
    max_total_score text,
    max_total_score_unweighted text,
    system_marked_na text,
    total_critical_score text,
    total_critical_score_unweighted text,
    total_non_critical_score text,
    total_non_critical_score_unweighted text,
    total_score text,
    total_score_unweighted text,
    PRIMARY KEY (question_group_id, evaluation_id),
    FOREIGN KEY (evaluation_id) REFERENCES evaluation(id)
);

CREATE TABLE evaluation_answer_transcript_topic (
    "index" text,
    evaluation_id text,
    confidence text,
    duration_total_milliseconds text,
    id text,
    "name" text,
    offset_charactercount text,
    offset_wordcount text,
    recording_location text,
    start_time_milliseconds text,
    topic_phrase text,
    transcript_phrase text,
    PRIMARY KEY ("index", evaluation_id),
    FOREIGN KEY (evaluation_id) REFERENCES evaluation(id)
);

CREATE TABLE evaluation (
    id text,
    agent_team_division_id text,
    assignee_id text,
    calibration_id text,
    conversation_id text,
    evaluation_form_id text,
    evaluator_id text,
    queue_id text,
    agent_has_read text,
    agent_id text,
    agent_team_date_created text,
    agent_team_date_modified text,
    agent_team_description text,
    agent_team_id text,
    agent_team_member_count text,
    agent_team_name text,
    agent_team_self_uri text,
    answer_agent_comments text,
    answer_any_failed_kill_questions text,
    answer_comments text,
    answer_private_comments text,
    answer_question_group_scores text,
    answer_total_critical_score text,
    answer_total_non_critical_score text,
    answer_total_score text,
    assigned text,
    assigned_date text,
    assignee_applicable text,
    changed_date text,
    conversation_date text,
    conversation_end_date text,
    date_assignee_changed text,
    evaluation_source_id text,
    evaluation_source_name text,
    evaluation_source_self_uri text,
    evaluation_source_type text,
    has_assistance_failed text,
    is_scoring_index text,
    "name" text,
    never_release text,
    redacted text,
    release_date text,
    rescore text,
    resource_id text,
    resource_type text,
    revision_created_date text,
    self_uri text,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (agent_team_division_id) REFERENCES division(id),
    FOREIGN KEY (assignee_id) REFERENCES users(id),
    FOREIGN KEY (calibration_id) REFERENCES calibration(id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id),
    FOREIGN KEY (evaluation_form_id) REFERENCES evaluation_form(id),
    FOREIGN KEY (evaluator_id) REFERENCES users(id),
    FOREIGN KEY (queue_id) REFERENCES routing_queue(id)
);

CREATE TABLE callable_timeset_callable_time_slot (
    _fivetran_id text,
    callable_timeset_id text,
    "day" text,
    start_time text,
    stop_time text,
    time_zone_id text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE callable_timeset (
    id text,
    date_created text,
    date_modified timestamp,
    "name" text,
    self_uri text,
    version text,
    PRIMARY KEY (id)
);

CREATE TABLE users_primary_contact_info (
    "index" text,
    user_id text,
    address text,
    country_code text,
    display text,
    extension text,
    integration text,
    media_type text,
    "type" text,
    PRIMARY KEY ("index", user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users_address (
    "index" text,
    user_id text,
    address text,
    country_code text,
    display text,
    extension text,
    integration text,
    media_type text,
    "type" text,
    PRIMARY KEY ("index", user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users_image (
    "index" text,
    user_id text,
    image_uri text,
    resolution text,
    PRIMARY KEY ("index", user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users_certification (
    "index" text,
    user_id text,
    certifications text,
    PRIMARY KEY ("index", user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users_biography_interest (
    "index" text,
    user_id text,
    interests text,
    PRIMARY KEY ("index", user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users_biography_hobby (
    "index" text,
    user_id text,
    hobbies text,
    PRIMARY KEY ("index", user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users_biography_education (
    "index" text,
    user_id text,
    date_end text,
    date_start text,
    field_of_study text,
    notes text,
    school text,
    PRIMARY KEY ("index", user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users_geo_location_location (
    id text,
    user_id text,
    users_geo_location_id text,
    PRIMARY KEY (id, user_id, users_geo_location_id),
    FOREIGN KEY (id) REFERENCES location(id),
    FOREIGN KEY (user_id) REFERENCES users_geo_location(user_id),
    FOREIGN KEY (users_geo_location_id) REFERENCES users_geo_location(id)
);

CREATE TABLE users_geo_location (
    id text,
    user_id text,
    PRIMARY KEY (id, user_id),
    FOREIGN KEY (id) REFERENCES location(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users_profile_skill (
    "index" text,
    user_id text,
    profile_skill text,
    PRIMARY KEY ("index", user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users_location (
    location_definition_id text,
    user_id text,
    coordinates jsonb,
    floorplan_id text,
    id text,
    notes text,
    PRIMARY KEY (location_definition_id, user_id),
    FOREIGN KEY (location_definition_id) REFERENCES location(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users_skill (
    id text,
    user_id text,
    "name" text,
    proficiency text,
    self_uri text,
    skill_uri text,
    "state" text,
    PRIMARY KEY (id, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users_language (
    id text,
    user_id text,
    language_uri text,
    "name" text,
    proficiency text,
    self_uri text,
    "state" text,
    PRIMARY KEY (id, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users_authorization_role (
    id text,
    user_id text,
    "name" text,
    PRIMARY KEY (id, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users_authorization_unused_role (
    id text,
    user_id text,
    "name" text,
    PRIMARY KEY (id, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users_authorization_permission (
    "index" text,
    user_id text,
    permission text,
    PRIMARY KEY ("index", user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users_authorization_permission_policy (
    _fivetran_id text,
    user_id text,
    action_set jsonb,
    action_set_key text,
    allow_conditions text,
    domain text,
    entity_name text,
    id text,
    named_resources jsonb,
    policy_description text,
    policy_name text,
    resource_condition text,
    resource_condition_node_conjunction text,
    resource_condition_node_variable_name text,
    resourceconditionnode_operator text,
    terms jsonb,
    -- custom_operands_* (dynamic column),
    PRIMARY KEY (_fivetran_id, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    associated_station_default_user text,
    associated_station_location_id text,
    associated_station_user_id text,
    conversation_summary_user_id text,
    default_station_default_user text,
    default_station_location_id text,
    default_station_user_id text,
    division_id text,
    effective_station_default_user text,
    effective_station_location_id text,
    effective_station_user_id text,
    last_associated_station_default_user text,
    last_associated_station_location_id text,
    last_associated_station_user_id text,
    manager_id text,
    out_of_office_user_id text,
    routing_status_user_id text,
    team_division_id text,
    acd_auto_answer text,
    associated_station_date text,
    associated_station_default_user_id text,
    associated_station_edge_group_id text,
    associated_station_id text,
    associated_station_name text,
    associated_station_web_rtc_call_appearances text,
    biography text,
    biography_spouse text,
    chat_jabber_id text,
    conversation_call_contact_center_active text,
    conversation_call_contact_center_acw text,
    conversation_call_enterprise_active text,
    conversation_call_enterprise_acw text,
    conversation_callback_contact_center_active text,
    conversation_callback_contact_center_acw text,
    conversation_callback_enterprise_active text,
    conversation_callback_enterprise_acw text,
    conversation_chat_contact_center_active text,
    conversation_chat_contact_center_acw text,
    conversation_chat_enterprise_active text,
    conversation_chat_enterprise_acw text,
    conversation_email_contact_center_active text,
    conversation_email_contact_center_acw text,
    conversation_email_enterprise_active text,
    conversation_email_enterprise_acw text,
    conversation_message_contact_center_active text,
    conversation_message_contact_center_acw text,
    conversation_message_enterprise_active text,
    conversation_message_enterprise_acw text,
    conversation_social_expression_contact_center_active text,
    conversation_social_expression_contact_center_acw text,
    conversation_social_expression_enterprise_active text,
    conversation_social_expression_enterprise_acw text,
    conversation_video_contact_center_active text,
    conversation_video_contact_center_acw text,
    conversation_video_enterprise_active text,
    conversation_video_enterprise_acw text,
    date_last_login text,
    default_station_date text,
    default_station_default_user_id text,
    default_station_edge_group_id text,
    default_station_id text,
    default_station_name text,
    default_station_web_rtc_call_appearances text,
    department text,
    effective_station_date text,
    effective_station_default_user_id text,
    effective_station_edge_group_id text,
    effective_station_id text,
    effective_station_name text,
    effective_station_web_rtc_call_appearances text,
    email text,
    employee_date_hire text,
    employee_id text,
    employee_official_name text,
    employee_type text,
    geolocation_city text,
    geolocation_country text,
    geolocation_id text,
    geolocation_latitude text,
    geolocation_longitude text,
    geolocation_name text,
    geolocation_primary text,
    geolocation_region text,
    geolocation_self_uri text,
    geolocation_type text,
    integration_presence_definition_id text,
    integration_presence_definition_self_uri text,
    integration_presence_definition_system_presence text,
    integration_presence_id text,
    integration_presence_message text,
    integration_presence_modified_date text,
    integration_presence_name text,
    integration_presence_primary text,
    integration_presence_self_uri text,
    integration_presence_source text,
    language_preference text,
    last_associated_station_associated_date text,
    last_associated_station_default_user_id text,
    last_associated_station_edge_group_id text,
    last_associated_station_id text,
    last_associated_station_name text,
    last_associated_station_web_rtc_call_appearances text,
    last_token_issueddate text,
    "name" text,
    out_of_office_active text,
    out_of_office_end_date text,
    out_of_office_id text,
    out_of_office_indefinite text,
    out_of_office_name text,
    out_of_office_self_uri text,
    out_of_office_start_date text,
    presence_definition_id text,
    presence_definition_self_uri text,
    presence_definition_system_presence text,
    presence_id text,
    presence_message text,
    presence_modified_date text,
    presence_name text,
    presence_primary text,
    presence_self_uri text,
    presence_source text,
    routing_status text,
    routing_status_start_time text,
    self_uri text,
    "state" text,
    team_date_created text,
    team_date_modified text,
    team_description text,
    team_id text,
    team_member_count text,
    team_name text,
    team_self_uri text,
    title text,
    username text,
    version text,
    PRIMARY KEY (id),
    FOREIGN KEY (associated_station_default_user) REFERENCES users(id),
    FOREIGN KEY (associated_station_location_id) REFERENCES location(id),
    FOREIGN KEY (associated_station_user_id) REFERENCES users(id),
    FOREIGN KEY (conversation_summary_user_id) REFERENCES users(id),
    FOREIGN KEY (default_station_default_user) REFERENCES users(id),
    FOREIGN KEY (default_station_location_id) REFERENCES location(id),
    FOREIGN KEY (default_station_user_id) REFERENCES users(id),
    FOREIGN KEY (division_id) REFERENCES division(id),
    FOREIGN KEY (effective_station_default_user) REFERENCES users(id),
    FOREIGN KEY (effective_station_location_id) REFERENCES location(id),
    FOREIGN KEY (effective_station_user_id) REFERENCES users(id),
    FOREIGN KEY (last_associated_station_default_user) REFERENCES users(id),
    FOREIGN KEY (last_associated_station_location_id) REFERENCES location(id),
    FOREIGN KEY (last_associated_station_user_id) REFERENCES users(id),
    FOREIGN KEY (manager_id) REFERENCES users(id),
    FOREIGN KEY (out_of_office_user_id) REFERENCES users(id),
    FOREIGN KEY (routing_status_user_id) REFERENCES users(id),
    FOREIGN KEY (team_division_id) REFERENCES division(id)
);

CREATE TABLE campaign_interaction_pending (
    id text,
    campaign_id text,
    conversation_id text,
    queue_id text,
    script_id text,
    skill_id text,
    active_preview_call text,
    agent_id text,
    agent_name text,
    agent_self_uri text,
    call_placed_time text,
    call_routed_time text,
    caller_address text,
    caller_name text,
    contact_id text,
    contact_name text,
    contact_self_uri text,
    creation_time text,
    destination_address text,
    dialer_system_participant_id text,
    dialing_mode text,
    disposition text,
    last_active_preview_wrapup_time text,
    object_type text,
    parent_campaign_id text,
    preview_connected_time text,
    preview_pop_delivered_time text,
    self_uri text,
    PRIMARY KEY (id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id),
    FOREIGN KEY (queue_id) REFERENCES routing_queue(id),
    FOREIGN KEY (script_id) REFERENCES script(id),
    FOREIGN KEY (skill_id) REFERENCES users_skill(id)
);

CREATE TABLE campaign_interaction_proceed (
    id text,
    campaign_id text,
    conversation_id text,
    queue_id text,
    script_id text,
    skill_id text,
    active_preview_call text,
    agent_id text,
    agent_name text,
    agent_self_uri text,
    call_placed_time text,
    call_routed_time text,
    caller_address text,
    caller_name text,
    contact_id text,
    contact_name text,
    contact_self_uri text,
    creation_time text,
    destination_address text,
    dialer_system_participant_id text,
    dialing_mode text,
    disposition text,
    last_active_preview_wrapup_time text,
    object_type text,
    parent_campaign_id text,
    preview_connected_time text,
    preview_pop_delivered_time text,
    self_uri text,
    PRIMARY KEY (id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id),
    FOREIGN KEY (queue_id) REFERENCES routing_queue(id),
    FOREIGN KEY (script_id) REFERENCES script(id),
    FOREIGN KEY (skill_id) REFERENCES users_skill(id)
);

CREATE TABLE campaign_interaction_previewing (
    id text,
    campaign_id text,
    conversation_id text,
    queue_id text,
    script_id text,
    skill_id text,
    active_preview_call text,
    agent_id text,
    agent_name text,
    agent_self_uri text,
    call_placed_time text,
    call_routed_time text,
    caller_address text,
    caller_name text,
    contact_id text,
    contact_name text,
    contact_self_uri text,
    creation_time text,
    destination_address text,
    dialer_system_participant_id text,
    dialing_mode text,
    disposition text,
    last_active_preview_wrapup_time text,
    object_type text,
    parent_campaign_id text,
    preview_connected_time text,
    preview_pop_delivered_time text,
    self_uri text,
    PRIMARY KEY (id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id),
    FOREIGN KEY (queue_id) REFERENCES routing_queue(id),
    FOREIGN KEY (script_id) REFERENCES script(id),
    FOREIGN KEY (skill_id) REFERENCES users_skill(id)
);

CREATE TABLE campaign_interaction_interacting (
    id text,
    campaign_id text,
    conversation_id text,
    queue_id text,
    script_id text,
    skill_id text,
    active_preview_call text,
    agent_id text,
    agent_name text,
    agent_self_uri text,
    call_placed_time text,
    call_routed_time text,
    caller_address text,
    caller_name text,
    contact_id text,
    contact_name text,
    contact_self_uri text,
    creation_time text,
    destination_address text,
    dialer_system_participant_id text,
    dialing_mode text,
    disposition text,
    last_active_preview_wrapup_time text,
    object_type text,
    parent_campaign_id text,
    preview_connected_time text,
    preview_pop_delivered_time text,
    self_uri text,
    PRIMARY KEY (id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id),
    FOREIGN KEY (queue_id) REFERENCES routing_queue(id),
    FOREIGN KEY (script_id) REFERENCES script(id),
    FOREIGN KEY (skill_id) REFERENCES users_skill(id)
);

CREATE TABLE campaign_interaction_scheduled (
    id text,
    campaign_id text,
    conversation_id text,
    queue_id text,
    script_id text,
    skill_id text,
    active_preview_call text,
    agent_id text,
    agent_name text,
    agent_self_uri text,
    call_placed_time text,
    call_routed_time text,
    caller_address text,
    caller_name text,
    contact_id text,
    contact_name text,
    contact_self_uri text,
    creation_time text,
    destination_address text,
    dialer_system_participant_id text,
    dialing_mode text,
    disposition text,
    last_active_preview_wrapup_time text,
    object_type text,
    parent_campaign_id text,
    preview_connected_time text,
    preview_pop_delivered_time text,
    self_uri text,
    PRIMARY KEY (id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id),
    FOREIGN KEY (queue_id) REFERENCES routing_queue(id),
    FOREIGN KEY (script_id) REFERENCES script(id),
    FOREIGN KEY (skill_id) REFERENCES users_skill(id)
);

CREATE TABLE organization_ticker (
    "index" text,
    organization_id text,
    exchange text,
    symbol text,
    PRIMARY KEY ("index", organization_id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE organization_external_data_source (
    "index" text,
    organization_id text,
    platform text,
    url text,
    PRIMARY KEY ("index", organization_id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE organization (
    id text,
    created_by_id text,
    trustor_id text,
    address_1 text,
    address_2 text,
    address_city text,
    address_country_code text,
    address_postal_code text,
    address_state text,
    company_type text,
    create_date text,
    employee_count text,
    external_system_url text,
    fax_number text,
    industry text,
    modify_date text,
    "name" text,
    phone_number_accepts_sms text,
    phone_number_country_code text,
    phone_number_display text,
    phone_number_e_164 text,
    phone_number_extension text,
    phone_number_normalization_country_code text,
    phone_number_user_input text,
    primary_contact_id text,
    revenue text,
    schema_applies_to jsonb,
    schema_created_by_id text,
    schema_created_by_name text,
    schema_date_created text,
    schema_enabled text,
    schema_id text,
    schema_json_schema text,
    schema_json_schema_additional_properties jsonb,
    schema_json_schema_description text,
    schema_json_schema_id text,
    schema_json_schema_properties jsonb,
    schema_json_schema_required jsonb,
    schema_json_schema_title text,
    schema_json_schema_type text,
    schema_name text,
    schema_version text,
    self_uri text,
    tags jsonb,
    trustor_authorization_permissions jsonb,
    trustor_created_by_organization_default_country_code text,
    trustor_created_by_organization_default_language text,
    trustor_created_by_organization_default_site_id text,
    trustor_created_by_organization_domain text,
    trustor_created_by_organization_features jsonb,
    trustor_created_by_organization_id text,
    trustor_created_by_organization_name text,
    trustor_created_by_organization_product_platform text,
    trustor_created_by_organization_self_uri text,
    trustor_created_by_organization_state text,
    trustor_created_by_organization_support_uri text,
    trustor_created_by_organization_third_party_org_name text,
    trustor_created_by_organization_third_party_uri text,
    trustor_created_by_organization_version text,
    trustor_created_by_organization_voicemail_enabled text,
    trustor_date_created text,
    trustor_enabled text,
    trustor_organization text,
    twitter_id text,
    twitter_name text,
    twitter_profile_url text,
    twitter_screen_name text,
    twitter_verified text,
    websites jsonb,
    -- custom_field_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_id) REFERENCES users(id),
    FOREIGN KEY (trustor_id) REFERENCES organization(id)
);

CREATE TABLE user_routing_language (
    id text,
    user_id text,
    language_uri text,
    "name" text,
    proficiency text,
    self_uri text,
    "state" text,
    PRIMARY KEY (id, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE schedule_campaign_interval (
    _fivetran_id text,
    schedule_campaign_id text,
    ends text,
    "start" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (schedule_campaign_id) REFERENCES schedule_campaign(id)
);

CREATE TABLE schedule_campaign (
    id text,
    campaign_id text,
    date_created text,
    date_modified text,
    "name" text,
    self_uri text,
    timezone text,
    version text,
    PRIMARY KEY (id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id)
);

CREATE TABLE presence_definition (
    id text,
    deactivated text,
    division_id text,
    "name" text,
    self_uri text,
    system_presence text,
    "type" text,
    -- language_labels_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE survey_form_published_version (
    "index" text,
    survey_form_id text,
    context_id text,
    disabled text,
    id text,
    lang text,
    modified_date text,
    "name" text,
    published text,
    question_groups jsonb,
    self_uri text,
    weight_mode text,
    PRIMARY KEY ("index", survey_form_id),
    FOREIGN KEY (survey_form_id) REFERENCES survey_form(id)
);

CREATE TABLE campaign_phone_column (
    _fivetran_id text,
    campaign_id text,
    column_name text,
    "type" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id)
);

CREATE TABLE campaign_dnc (
    campaign_id text,
    dnc_id text,
    PRIMARY KEY (campaign_id, dnc_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (dnc_id) REFERENCES dnc(id)
);

CREATE TABLE campaign_errors (
    _fivetran_id text,
    campaign_id text,
    details text,
    error text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id)
);

CREATE TABLE campaign_rule_set (
    campaign_id text,
    rule_set_id text,
    PRIMARY KEY (campaign_id, rule_set_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (rule_set_id) REFERENCES ruleset(id)
);

CREATE TABLE campaign_contact_sort (
    _fivetran_id text,
    campaign_id text,
    direction text,
    field_name text,
    numeric text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id)
);

CREATE TABLE campaign_contact_list_filter (
    campaign_id text,
    contact_list_filter_id text,
    PRIMARY KEY (campaign_id, contact_list_filter_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (contact_list_filter_id) REFERENCES contact_list_filter(id)
);

CREATE TABLE campaign (
    id text,
    callable_time_set_id text,
    contact_list_id text,
    division_id text,
    queue_id text,
    script_id text,
    abandon_rate text,
    always_running text,
    call_analysis_language text,
    call_analysis_response_set_id text,
    call_analysis_response_set_name text,
    call_analysis_response_set_self_uri text,
    caller_address text,
    caller_name text,
    campaign_status text,
    contact_sort_direction text,
    contact_sort_field_name text,
    contact_sort_numeric text,
    date_created text,
    date_modified timestamp,
    dialing_mode text,
    dynamic_contact_queueing_settings_sort text,
    edge_group_id text,
    edge_group_name text,
    edge_group_self_uri text,
    "name" text,
    no_answer_timeout text,
    outbound_line_count text,
    preview_time_out_second text,
    priority text,
    self_uri text,
    single_number_preview text,
    site_id text,
    site_name text,
    site_self_uri text,
    skip_preview_disabled text,
    version text,
    PRIMARY KEY (id),
    FOREIGN KEY (callable_time_set_id) REFERENCES callable_timeset(id),
    FOREIGN KEY (contact_list_id) REFERENCES contact_list(id),
    FOREIGN KEY (division_id) REFERENCES division(id),
    FOREIGN KEY (queue_id) REFERENCES routing_queue(id),
    FOREIGN KEY (script_id) REFERENCES script(id)
);

CREATE TABLE contact_list_column_name (
    "index" text,
    contact_list_id text,
    column_name text,
    PRIMARY KEY ("index", contact_list_id),
    FOREIGN KEY (contact_list_id) REFERENCES contact_list(id)
);

CREATE TABLE contact_list_phone_column (
    _fivetran_id text,
    contact_list_id text,
    callable_time_column text,
    column_name text,
    "type" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (contact_list_id) REFERENCES contact_list(id)
);

CREATE TABLE contact_list_email_column (
    _fivetran_id text,
    contact_list_id text,
    callable_time_column text,
    column_name text,
    "type" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (contact_list_id) REFERENCES contact_list(id)
);

CREATE TABLE contact_list_preview_mode_accepted_value (
    "index" text,
    contact_list_id text,
    preview_mode_accepted_value text,
    PRIMARY KEY ("index", contact_list_id),
    FOREIGN KEY (contact_list_id) REFERENCES contact_list(id)
);

CREATE TABLE column_data_type_specification (
    _fivetran_id text,
    contact_list_id text,
    column_data_type text,
    column_name text,
    max text,
    max_length text,
    min text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (contact_list_id) REFERENCES contact_list(id)
);

CREATE TABLE contact_list (
    id text,
    attempt_limit_id text,
    division_id text,
    automatic_time_zone_mapping text,
    date_created text,
    date_modified timestamp,
    import_status_completed_record text,
    import_status_failure_reason text,
    import_status_percent_complete text,
    import_status_state text,
    import_status_total_record text,
    "name" text,
    preview_mode_column_name text,
    self_uri text,
    "size" text,
    trim_white_space text,
    version text,
    zip_code_column_name text,
    PRIMARY KEY (id),
    FOREIGN KEY (attempt_limit_id) REFERENCES attempt_limit(id),
    FOREIGN KEY (division_id) REFERENCES division(id)
);

CREATE TABLE flow_milestone (
    id text,
    division_id text,
    description text,
    "name" text,
    self_uri text,
    PRIMARY KEY (id),
    FOREIGN KEY (division_id) REFERENCES division(id)
);

CREATE TABLE event (
    id text,
    category text,
    correlation_id text,
    error_entity_id text,
    error_entity_name text,
    error_entity_self_uri text,
    "level" text,
    "name" text,
    related_entity_id text,
    related_entity_name text,
    related_entity_self_uri text,
    resource_uris_code text,
    resource_uris_documentation_uri text,
    resource_uris_message text,
    resource_uris_message_params jsonb,
    resource_uris_message_with_params text,
    resource_uris_resource_uris jsonb,
    self_uri text,
    time_stamp text,
    PRIMARY KEY (id)
);

CREATE TABLE evaluation_form_published_version (
    context_id text,
    id text,
    evaluation_form_id text,
    modified_date text,
    "name" text,
    published text,
    question_groups jsonb,
    self_uri text,
    weight_mode text,
    PRIMARY KEY (context_id, id, evaluation_form_id),
    FOREIGN KEY (evaluation_form_id) REFERENCES evaluation_form(id)
);

CREATE TABLE evaluation_form_dispute_assignee (
    "index" text,
    evaluation_form_id text,
    user_id text,
    "type" text,
    PRIMARY KEY ("index", evaluation_form_id),
    FOREIGN KEY (evaluation_form_id) REFERENCES evaluation_form(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE evaluation_form_question_group_question_answer_option_assistance_condition (
    "index" text,
    evaluation_form_id text,
    evaluation_form_question_group_index text,
    evaluation_form_question_group_question_answer_option_index text,
    evaluation_form_question_group_question_index text,
    operator text,
    topic_ids jsonb,
    PRIMARY KEY ("index", evaluation_form_id, evaluation_form_question_group_index, evaluation_form_question_group_question_answer_option_index, evaluation_form_question_group_question_index),
    FOREIGN KEY (evaluation_form_id) REFERENCES evaluation_form_question_group_question_answer_option(evaluation_form_id),
    FOREIGN KEY (evaluation_form_question_group_index) REFERENCES evaluation_form_question_group_question_answer_option(evaluation_form_question_group_index),
    FOREIGN KEY (evaluation_form_question_group_question_answer_option_index) REFERENCES evaluation_form_question_group_question_answer_option("index"),
    FOREIGN KEY (evaluation_form_question_group_question_index) REFERENCES evaluation_form_question_group_question_answer_option(evaluation_form_question_group_question_index)
);

CREATE TABLE evaluation_form_question_group_question_answer_option (
    "index" text,
    evaluation_form_id text,
    evaluation_form_question_group_index text,
    evaluation_form_question_group_question_index text,
    id text,
    text text,
    "value" text,
    PRIMARY KEY ("index", evaluation_form_id, evaluation_form_question_group_index, evaluation_form_question_group_question_index),
    FOREIGN KEY (evaluation_form_id) REFERENCES evaluation_form_question_group_question(evaluation_form_id),
    FOREIGN KEY (evaluation_form_question_group_index) REFERENCES evaluation_form_question_group_question(evaluation_form_question_group_index),
    FOREIGN KEY (evaluation_form_question_group_question_index) REFERENCES evaluation_form_question_group_question("index")
);

CREATE TABLE evaluation_form_question_group_question (
    "index" text,
    evaluation_form_id text,
    evaluation_form_question_group_index text,
    comments_required text,
    help_text text,
    id text,
    is_critical text,
    is_kill text,
    na_enabled text,
    text text,
    "type" text,
    visibility_condition_combining_operation text,
    visibility_condition_predicates jsonb,
    PRIMARY KEY ("index", evaluation_form_id, evaluation_form_question_group_index),
    FOREIGN KEY (evaluation_form_id) REFERENCES evaluation_form_question_group(evaluation_form_id),
    FOREIGN KEY (evaluation_form_question_group_index) REFERENCES evaluation_form_question_group("index")
);

CREATE TABLE evaluation_form_question_group (
    "index" text,
    evaluation_form_id text,
    default_answers_to_highest text,
    default_answers_to_na text,
    id text,
    manual_weight text,
    na_enabled text,
    "name" text,
    "type" text,
    visibility_condition text,
    weight text,
    PRIMARY KEY ("index", evaluation_form_id),
    FOREIGN KEY (evaluation_form_id) REFERENCES evaluation_form(id)
);

CREATE TABLE evaluation_form (
    id text,
    context_id text,
    evaluation_setting_disputes_allowed_per_evaluation text,
    evaluation_setting_disputes_enabled text,
    evaluation_setting_revisions_enabled text,
    modified_date text,
    "name" text,
    published text,
    self_uri text,
    weight_mode text,
    PRIMARY KEY (id)
);

CREATE TABLE user_skill_group_skill_condition_routing_skill_condition (
    _fivetran_id text,
    user_id text,
    user_skill_group_id text,
    child_condition jsonb,
    comparator text,
    proficiency text,
    routing_skill text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (user_id) REFERENCES user_skill_group(user_id),
    FOREIGN KEY (user_skill_group_id) REFERENCES user_skill_group(id)
);

CREATE TABLE user_skill_group_skill_condition_language_skill_condition (
    _fivetran_id text,
    user_id text,
    user_skill_group_id text,
    child_condition jsonb,
    comparator text,
    language_skill text,
    proficiency text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (user_id) REFERENCES user_skill_group(user_id),
    FOREIGN KEY (user_skill_group_id) REFERENCES user_skill_group(id)
);

CREATE TABLE user_skill_group (
    id text,
    user_id text,
    division_id text,
    date_created text,
    date_modified text,
    description text,
    member_count text,
    "name" text,
    self_uri text,
    PRIMARY KEY (id, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (division_id) REFERENCES division(id)
);

CREATE TABLE campaign_agent_mapping_review_result (
    _fivetran_id text,
    user_id text,
    agent_owned_column text,
    campaign_id text,
    email text,
    exists text,
    is_queue_member text,
    record_count text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE campaign_progress (
    _fivetran_id text,
    campaign_id text,
    contact_list_id text,
    number_of_contact_call text,
    number_of_contact_message text,
    number_of_contact_skipped jsonb,
    percentage text,
    total_number_of_contact text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (contact_list_id) REFERENCES contact_list(id)
);

CREATE TABLE contact_list_filter_clause_predicate (
    _fivetran_id text,
    contact_list_filter_id text,
    column_name text,
    column_type text,
    "index" text,
    inverted text,
    operator text,
    range_in_set jsonb,
    range_max text,
    range_max_inclusive text,
    range_min text,
    range_min_inclusive text,
    "value" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (contact_list_filter_id) REFERENCES contact_list_filter(id)
);

CREATE TABLE contact_list_filter (
    id text,
    contact_list_id text,
    date_created text,
    date_modified timestamp,
    filter_type text,
    "name" text,
    self_uri text,
    version text,
    PRIMARY KEY (id),
    FOREIGN KEY (contact_list_id) REFERENCES contact_list(id)
);

CREATE TABLE script_page (
    id text,
    script_id text,
    created_date text,
    modified_date text,
    "name" text,
    properties jsonb,
    root_container jsonb,
    self_uri text,
    version_id text,
    PRIMARY KEY (id, script_id),
    FOREIGN KEY (script_id) REFERENCES script(id)
);

CREATE TABLE script (
    id text,
    division_id text,
    created_date text,
    custom_actions jsonb,
    features jsonb,
    modified_date timestamp,
    "name" text,
    published_date text,
    self_uri text,
    start_page_id text,
    start_page_name text,
    variables jsonb,
    version_date text,
    version_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (division_id) REFERENCES division(id)
);

CREATE TABLE conversation_callback_participants_wrapup_tag (
    "index" text,
    conversation_callback_id text,
    conversation_callback_participants_id text,
    tag_name text,
    PRIMARY KEY ("index", conversation_callback_id, conversation_callback_participants_id),
    FOREIGN KEY (conversation_callback_id) REFERENCES conversation_callback_participants(conversation_callback_id),
    FOREIGN KEY (conversation_callback_participants_id) REFERENCES conversation_callback_participants(id)
);

CREATE TABLE conversation_callback_participants_callback_number (
    "index" text,
    conversation_callback_id text,
    conversation_callback_participants_id text,
    callback_number text,
    PRIMARY KEY ("index", conversation_callback_id, conversation_callback_participants_id),
    FOREIGN KEY (conversation_callback_id) REFERENCES conversation_callback_participants(conversation_callback_id),
    FOREIGN KEY (conversation_callback_participants_id) REFERENCES conversation_callback_participants(id)
);

CREATE TABLE conversation_callback_participants_media_role (
    "index" text,
    conversation_callback_id text,
    conversation_callback_participants_id text,
    media_role text,
    PRIMARY KEY ("index", conversation_callback_id, conversation_callback_participants_id),
    FOREIGN KEY (conversation_callback_id) REFERENCES conversation_callback_participants(conversation_callback_id),
    FOREIGN KEY (conversation_callback_participants_id) REFERENCES conversation_callback_participants(id)
);

CREATE TABLE conversation_callback_participants (
    id text,
    conversation_callback_id text,
    queue_id text,
    user_id text,
    alerting_timeout_ms text,
    attributes jsonb,
    connected_time text,
    direction text,
    disconnect_type text,
    end_time text,
    error_info_code text,
    error_info_message text,
    external_contact_id text,
    external_contact_name text,
    external_contact_self_url text,
    external_organization_id text,
    external_organization_name text,
    external_organization_self_url text,
    flagged_reason text,
    held text,
    media_roles jsonb,
    "name" text,
    peer text,
    provider text,
    purpose text,
    script_id text,
    start_hold_time text,
    start_time text,
    "state" text,
    team_id text,
    team_name text,
    team_self_url text,
    wrapup_code text,
    wrapup_duration_seconds text,
    wrapup_end_time text,
    wrapup_name text,
    wrapup_notes text,
    wrapup_prompt text,
    wrapup_provisional text,
    wrapup_required text,
    wrapup_skipped text,
    wrapup_tag jsonb,
    wrapup_timeout_ms text,
    PRIMARY KEY (id, conversation_callback_id),
    FOREIGN KEY (conversation_callback_id) REFERENCES conversation_callback(id),
    FOREIGN KEY (queue_id) REFERENCES routing_queue(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE conversation_callback_other_media_uris (
    _fivetran_id text,
    conversation_callback_id text,
    other_media_uri text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (conversation_callback_id) REFERENCES conversation_callback(id)
);

CREATE TABLE conversation_callback_participants_recent_transfer (
    id text,
    conversation_callback_id text,
    destination_user_id text,
    initiator_id text,
    modified_by_id text,
    date_issued text,
    destination_address text,
    "state" text,
    PRIMARY KEY (id, conversation_callback_id),
    FOREIGN KEY (conversation_callback_id) REFERENCES conversation_callback(id),
    FOREIGN KEY (destination_user_id) REFERENCES users(id),
    FOREIGN KEY (initiator_id) REFERENCES users(id),
    FOREIGN KEY (modified_by_id) REFERENCES users(id)
);

CREATE TABLE conversation_callback (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE user_queue_routing_rule (
    _fivetran_id text,
    user_id text,
    user_queue_id text,
    operator text,
    threshold text,
    wait_seconds text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (user_id) REFERENCES user_queue(user_id),
    FOREIGN KEY (user_queue_id) REFERENCES user_queue(id)
);

CREATE TABLE user_queue_conditional_group_routing_rule_group (
    group_id text,
    "index" text,
    user_id text,
    user_queue_id text,
    PRIMARY KEY (group_id, "index", user_id, user_queue_id),
    FOREIGN KEY ("index") REFERENCES user_queue_conditional_group_routing_rule("index"),
    FOREIGN KEY (user_id) REFERENCES user_queue_conditional_group_routing_rule(user_id),
    FOREIGN KEY (user_queue_id) REFERENCES user_queue_conditional_group_routing_rule(user_queue_id)
);

CREATE TABLE user_queue_conditional_group_routing_rule (
    "index" text,
    user_id text,
    user_queue_id text,
    condition_value text,
    metric text,
    operator text,
    wait_seconds text,
    PRIMARY KEY ("index", user_id, user_queue_id),
    FOREIGN KEY (user_id) REFERENCES user_queue(user_id),
    FOREIGN KEY (user_queue_id) REFERENCES user_queue(id)
);

CREATE TABLE user_queue_bulls_eye_ring_expansion_criteria (
    _fivetran_id text,
    user_id text,
    user_queue_id text,
    threshold text,
    "type" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (user_id) REFERENCES user_queue(user_id),
    FOREIGN KEY (user_queue_id) REFERENCES user_queue(id)
);

CREATE TABLE user_queue_bulls_eye_ring_skill_to_remove (
    id text,
    user_id text,
    user_queue_id text,
    "name" text,
    self_uri text,
    PRIMARY KEY (id, user_id, user_queue_id),
    FOREIGN KEY (user_id) REFERENCES user_queue(user_id),
    FOREIGN KEY (user_queue_id) REFERENCES user_queue(id)
);

CREATE TABLE user_queue_bulls_eye_ring_member_group (
    id text,
    user_id text,
    user_queue_id text,
    member_count text,
    "name" text,
    self_uri text,
    "type" text,
    PRIMARY KEY (id, user_id, user_queue_id),
    FOREIGN KEY (user_id) REFERENCES user_queue(user_id),
    FOREIGN KEY (user_queue_id) REFERENCES user_queue(id)
);

CREATE TABLE user_queue_member_group (
    id text,
    user_id text,
    user_queue_id text,
    member_count text,
    "name" text,
    self_uri text,
    "type" text,
    PRIMARY KEY (id, user_id, user_queue_id),
    FOREIGN KEY (user_id) REFERENCES user_queue(user_id),
    FOREIGN KEY (user_queue_id) REFERENCES user_queue(id)
);

CREATE TABLE user_queue_email_address_route_skill (
    id text,
    user_id text,
    user_queue_id text,
    "name" text,
    self_uri text,
    PRIMARY KEY (id, user_id, user_queue_id),
    FOREIGN KEY (user_id) REFERENCES user_queue(user_id),
    FOREIGN KEY (user_queue_id) REFERENCES user_queue(id)
);

CREATE TABLE user_queue_email_address_auto_bcc (
    _fivetran_id text,
    user_id text,
    user_queue_id text,
    email text,
    "name" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (user_id) REFERENCES user_queue(user_id),
    FOREIGN KEY (user_queue_id) REFERENCES user_queue(id)
);

CREATE TABLE user_queue (
    id text,
    user_id text,
    division_id text,
    acw_settings_timeout_ms text,
    acw_settings_wrapup_prompt text,
    agent_owned_routing_enable_agent_owned_call_back text,
    agent_owned_routing_max_owned_call_back_delay_hours text,
    agent_owned_routing_max_owned_call_back_hours text,
    auto_answer_only text,
    calling_party_name text,
    calling_party_number text,
    created_by text,
    date_created text,
    date_modified text,
    default_script jsonb,
    description text,
    direct_routing_agent_wait_second text,
    direct_routing_backup_queue_id text,
    direct_routing_call_media_setting_enabled text,
    direct_routing_call_media_setting_inbound_flow_id text,
    direct_routing_call_media_setting_inbound_self_uri text,
    direct_routing_call_media_setting_voice_mail_flow text,
    direct_routing_email_media_setting_enabled text,
    direct_routing_email_media_setting_inbound_flow_id text,
    direct_routing_email_media_setting_inbound_self_uri text,
    direct_routing_enabled text,
    direct_routing_message_media_setting text,
    direct_routing_wait_for_agent text,
    email_in_queue_flow_id text,
    email_in_queue_flow_name text,
    email_in_queue_flow_self_uri text,
    enable_manual_assignment text,
    enable_transcription text,
    joined_member_count text,
    media_settings_call_alerting_timeout_seconds text,
    media_settings_call_auto_answer_alert_tone_seconds text,
    media_settings_call_enable_auto_answer text,
    media_settings_call_manual_answer_alert_tone_seconds text,
    media_settings_call_service_level text,
    media_settings_call_sub_type_setting jsonb,
    media_settings_callback_alerting_timeout_seconds text,
    media_settings_callback_auto_answer_alert_tone_seconds text,
    media_settings_callback_enable_auto_answer text,
    media_settings_callback_manual_answer_alert_tone_seconds text,
    media_settings_callback_service_level text,
    media_settings_callback_sub_type_setting jsonb,
    media_settings_chat_alerting_timeout_seconds text,
    media_settings_chat_auto_answer_alert_tone_seconds text,
    media_settings_chat_enable_auto_answer text,
    media_settings_chat_manual_answer_alert_tone_seconds text,
    media_settings_chat_service_level text,
    media_settings_chat_sub_type_setting jsonb,
    media_settings_email_alerting_timeout_seconds text,
    media_settings_email_auto_answer_alert_tone_seconds text,
    media_settings_email_enable_auto_answer text,
    media_settings_email_manual_answer_alert_tone_seconds text,
    media_settings_email_service_level text,
    media_settings_email_sub_type_setting jsonb,
    media_settings_message_alerting_timeout_seconds text,
    media_settings_message_auto_answer_alert_tone_seconds text,
    media_settings_message_enable_auto_answer text,
    media_settings_message_manual_answer_alert_tone_seconds text,
    media_settings_message_service_level text,
    media_settings_message_sub_type_setting jsonb,
    member_count text,
    message_in_queue_flow_id text,
    message_in_queue_flow_name text,
    message_in_queue_flow_self_uri text,
    modified_by text,
    "name" text,
    on_hold_prompt_id text,
    on_hold_prompt_name text,
    on_hold_prompt_self_uri text,
    outbound_messaging_addresses_open_messaging_recipient_id text,
    outbound_messaging_addresses_open_messaging_recipient_name text,
    outbound_messaging_addresses_open_messaging_recipient_self_uri text,
    outbound_messaging_addresses_sms_address_name text,
    outbound_messaging_addresses_sms_address_self_uri text,
    outbound_messaging_addresses_sms_adress_id text,
    outbound_messaging_addresses_whats_app_recipient_id text,
    outbound_messaging_addresses_whats_app_recipient_name text,
    outbound_messaging_addresses_whats_app_recipient_self_uri text,
    peer_id text,
    queue_flow_id text,
    queue_flow_name text,
    queue_flow_self_uri text,
    reply_email_address_domain_id text,
    reply_email_address_domain_name text,
    reply_email_address_domain_self_uri text,
    reply_email_address_route_allow_multiple_actions text,
    reply_email_address_route_always_included text,
    reply_email_address_route_flow_id text,
    reply_email_address_route_flow_name text,
    reply_email_address_route_flow_self_uri text,
    reply_email_address_route_from_email text,
    reply_email_address_route_from_name text,
    reply_email_address_route_history_inclusion text,
    reply_email_address_route_id text,
    reply_email_address_route_inclusion_type text,
    reply_email_address_route_language_id text,
    reply_email_address_route_language_name text,
    reply_email_address_route_language_self_url text,
    reply_email_address_route_name text,
    reply_email_address_route_pattern text,
    reply_email_address_route_priority text,
    reply_email_address_route_queue_id text,
    reply_email_address_route_reply_email_address jsonb,
    reply_email_address_route_self_uri text,
    reply_email_address_route_signature_canned_response_id text,
    reply_email_address_route_signature_enabled text,
    reply_email_address_route_spam_flow_id text,
    reply_email_address_route_spam_flow_name text,
    reply_email_address_route_spam_flow_self_uri text,
    scoring_method text,
    self_uri text,
    skill_evaluation_method text,
    suppress_in_queue_call_recording text,
    user_member_count text,
    whisper_prompt_id text,
    whisper_prompt_name text,
    whisper_prompt_self_uri text,
    PRIMARY KEY (id, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (division_id) REFERENCES division(id)
);

CREATE TABLE campaign_rule_campaign (
    campaign_id text,
    campaign_rule_id text,
    PRIMARY KEY (campaign_id, campaign_rule_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (campaign_rule_id) REFERENCES campaign_rule(id)
);

CREATE TABLE campaign_rule_entity_sequence (
    campaign_rule_id text,
    id text,
    PRIMARY KEY (campaign_rule_id, id),
    FOREIGN KEY (campaign_rule_id) REFERENCES campaign_rule(id),
    FOREIGN KEY (id) REFERENCES "sequence"(id)
);

CREATE TABLE campaign_rule_condition (
    id text,
    campaign_rule_id text,
    condition_type text,
    parameters_dialing_mode text,
    parameters_operator text,
    parameters_priority text,
    parameters_value text,
    PRIMARY KEY (id, campaign_rule_id),
    FOREIGN KEY (campaign_rule_id) REFERENCES campaign_rule(id)
);

CREATE TABLE campaign_rule_action_campaign (
    campaign_id text,
    campaign_rule_action_id text,
    campaign_rule_id text,
    PRIMARY KEY (campaign_id, campaign_rule_action_id, campaign_rule_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (campaign_rule_action_id) REFERENCES campaign_rule_action(id),
    FOREIGN KEY (campaign_rule_id) REFERENCES campaign_rule_action(campaign_rule_id)
);

CREATE TABLE campaign_rule_action_sequence (
    campaign_rule_action_id text,
    campaign_rule_id text,
    id text,
    PRIMARY KEY (campaign_rule_action_id, campaign_rule_id, id),
    FOREIGN KEY (campaign_rule_action_id) REFERENCES campaign_rule_action(id),
    FOREIGN KEY (campaign_rule_id) REFERENCES campaign_rule_action(campaign_rule_id),
    FOREIGN KEY (id) REFERENCES "sequence"(id)
);

CREATE TABLE campaign_rule_action (
    id text,
    campaign_rule_id text,
    action_type text,
    parameters_dialing_mode text,
    parameters_operator text,
    parameters_priority text,
    parameters_value text,
    use_triggering_entity text,
    PRIMARY KEY (id, campaign_rule_id),
    FOREIGN KEY (campaign_rule_id) REFERENCES campaign_rule(id)
);

CREATE TABLE campaign_rule (
    id text,
    date_created text,
    date_modified timestamp,
    enabled text,
    match_any_conditions text,
    "name" text,
    self_uri text,
    version text,
    PRIMARY KEY (id)
);

CREATE TABLE routing_skill (
    id text,
    date_modified text,
    "name" text,
    self_uri text,
    "state" text,
    version text,
    PRIMARY KEY (id)
);

CREATE TABLE user_routing_skill (
    id text,
    user_id text,
    "name" text,
    proficiency text,
    self_uri text,
    skill_uri text,
    "state" text,
    PRIMARY KEY (id, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE messaging_campaign_progress (
    _fivetran_id text,
    messaging_campaign_id text,
    campaign_id text,
    contact_list_id text,
    number_of_contacts_called text,
    number_of_contacts_messaged text,
    number_of_contacts_skipped jsonb,
    percentage text,
    total_number_of_contact text,
    PRIMARY KEY (_fivetran_id, messaging_campaign_id),
    FOREIGN KEY (messaging_campaign_id) REFERENCES messaging_campaign(id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (contact_list_id) REFERENCES contact_list(id)
);

CREATE TABLE survey_form_question_group_question (
    id text,
    survey_form_id text,
    survey_form_question_group_id text,
    answer_options jsonb,
    explanation_prompt text,
    help_text text,
    max_response_characters text,
    na_enabled text,
    text text,
    "type" text,
    visibility_condition_combining_operation text,
    visibility_condition_predicates jsonb,
    PRIMARY KEY (id, survey_form_id, survey_form_question_group_id),
    FOREIGN KEY (survey_form_id) REFERENCES survey_form_question_group(survey_form_id),
    FOREIGN KEY (survey_form_question_group_id) REFERENCES survey_form_question_group(id)
);

CREATE TABLE survey_form_question_group (
    id text,
    survey_form_id text,
    na_enabled text,
    "name" text,
    "type" text,
    visibility_condition text,
    PRIMARY KEY (id, survey_form_id),
    FOREIGN KEY (survey_form_id) REFERENCES survey_form(id)
);

CREATE TABLE survey_form (
    id text,
    context_id text,
    disabled text,
    footer text,
    header text,
    lang text,
    modified_date text,
    "name" text,
    published text,
    self_uri text,
    PRIMARY KEY (id)
);

CREATE TABLE users_group (
    user_id text,
    id text,
    PRIMARY KEY (user_id, id),
    FOREIGN KEY (id) REFERENCES groups(id)
);

CREATE TABLE task_management_workitem_skill (
    "index" text,
    task_management_workitem_id text,
    task_management_workitem_workbin_id text,
    id text,
    PRIMARY KEY ("index", task_management_workitem_id, task_management_workitem_workbin_id),
    FOREIGN KEY (task_management_workitem_id) REFERENCES task_management_workitem(id),
    FOREIGN KEY (task_management_workitem_workbin_id) REFERENCES task_management_workitem(workbin_id)
);

CREATE TABLE task_management_workitem_score_agent (
    "index" text,
    task_management_workitem_id text,
    task_management_workitem_workbin_id text,
    agent text,
    score text,
    PRIMARY KEY ("index", task_management_workitem_id, task_management_workitem_workbin_id),
    FOREIGN KEY (task_management_workitem_id) REFERENCES task_management_workitem(id),
    FOREIGN KEY (task_management_workitem_workbin_id) REFERENCES task_management_workitem(workbin_id)
);

CREATE TABLE task_management_workitem (
    id text,
    workbin_id text,
    assignee_id text,
    division_id text,
    external_contact_id text,
    queue_id text,
    alert_timeout_seconds text,
    assignment_state text,
    auto_status_transition text,
    auto_status_transition_date_of_transition text,
    auto_status_transition_error_code text,
    auto_status_transition_error_message text,
    auto_status_transition_next_status text,
    date_assignment_state_changed text,
    date_closed text,
    date_created text,
    date_due text,
    date_expires text,
    date_modified text,
    date_status_changed text,
    description text,
    duration_seconds text,
    external_tag text,
    language_id text,
    modified_by_id text,
    "name" text,
    preferred_agents jsonb,
    priority text,
    queue_name text,
    reporter_id text,
    reporter_name text,
    schema_id text,
    schema_name text,
    schema_version text,
    scored_agents text,
    self_uri text,
    status_category text,
    status_id text,
    status_name text,
    ttl text,
    type_id text,
    type_name text,
    utilization_label_id text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id, workbin_id),
    FOREIGN KEY (assignee_id) REFERENCES users(id),
    FOREIGN KEY (division_id) REFERENCES division(id),
    FOREIGN KEY (external_contact_id) REFERENCES external_contact(id),
    FOREIGN KEY (queue_id) REFERENCES user_queue(id)
);

CREATE TABLE analytics_conversation_details_division (
    conversation_id text,
    division_id text,
    PRIMARY KEY (conversation_id, division_id),
    FOREIGN KEY (conversation_id) REFERENCES analytics_conversation_details(conversation_id),
    FOREIGN KEY (division_id) REFERENCES division(id)
);

CREATE TABLE analytics_conversation_details_knowledge_base_id (
    "index" text,
    conversation_id text,
    knowledge_base_id text,
    PRIMARY KEY ("index", conversation_id),
    FOREIGN KEY (conversation_id) REFERENCES analytics_conversation_details(conversation_id)
);

CREATE TABLE analytics_conversation_details_evaluation (
    _fivetran_id text,
    assignee_id text,
    conversation_id text,
    division_id text,
    evaluator_id text,
    user_id text,
    assignee_applicable text,
    calibration_id text,
    context_id text,
    deleted text,
    evaluation_id text,
    evaluation_status text,
    event_time text,
    form_id text,
    form_name text,
    queue_id text,
    released text,
    rescored text,
    total_critical_score text,
    total_score text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (assignee_id) REFERENCES users(id),
    FOREIGN KEY (conversation_id) REFERENCES analytics_conversation_details(conversation_id),
    FOREIGN KEY (division_id) REFERENCES division(id),
    FOREIGN KEY (evaluator_id) REFERENCES users(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE analytics_conversation_details_survey (
    _fivetran_id text,
    conversation_id text,
    queue_id text,
    user_id text,
    event_time text,
    o_survey_total_score text,
    survey_completed_date text,
    survey_form_context_id text,
    survey_form_id text,
    survey_form_name text,
    survey_id text,
    survey_promoter_score text,
    survey_status text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (conversation_id) REFERENCES analytics_conversation_details(conversation_id),
    FOREIGN KEY (queue_id) REFERENCES routing_queue(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE analytics_conversation_details_resolution (
    _fivetran_id text,
    conversation_id text,
    queue_id text,
    user_id text,
    event_time text,
    n_next_contact_avoided text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (conversation_id) REFERENCES analytics_conversation_details(conversation_id),
    FOREIGN KEY (queue_id) REFERENCES routing_queue(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE analytics_conversation_details_participant_session_callback_number (
    callback_number text,
    conversation_id text,
    participant_id text,
    session_id text,
    PRIMARY KEY (callback_number, conversation_id, participant_id, session_id),
    FOREIGN KEY (conversation_id) REFERENCES analytics_conversation_details_participant_session(conversation_id),
    FOREIGN KEY (participant_id) REFERENCES analytics_conversation_details_participant_session(participant_id),
    FOREIGN KEY (session_id) REFERENCES analytics_conversation_details_participant_session(session_id)
);

CREATE TABLE analytics_conversation_details_participant_session_bcc (
    _fivetran_id text,
    conversation_id text,
    participant_id text,
    session_id text,
    bcc text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (conversation_id) REFERENCES analytics_conversation_details_participant_session(conversation_id),
    FOREIGN KEY (participant_id) REFERENCES analytics_conversation_details_participant_session(participant_id),
    FOREIGN KEY (session_id) REFERENCES analytics_conversation_details_participant_session(session_id)
);

CREATE TABLE analytics_conversation_details_participant_session_cc (
    _fivetran_id text,
    conversation_id text,
    participant_id text,
    session_id text,
    cc text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (conversation_id) REFERENCES analytics_conversation_details_participant_session(conversation_id),
    FOREIGN KEY (participant_id) REFERENCES analytics_conversation_details_participant_session(participant_id),
    FOREIGN KEY (session_id) REFERENCES analytics_conversation_details_participant_session(session_id)
);

CREATE TABLE analytics_conversation_details_participant_session_destination_address (
    _fivetran_id text,
    conversation_id text,
    participant_id text,
    session_id text,
    destination_addresses text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (conversation_id) REFERENCES analytics_conversation_details_participant_session(conversation_id),
    FOREIGN KEY (participant_id) REFERENCES analytics_conversation_details_participant_session(participant_id),
    FOREIGN KEY (session_id) REFERENCES analytics_conversation_details_participant_session(session_id)
);

CREATE TABLE analytics_conversation_details_participant_session_eligible_agent_count (
    _fivetran_id text,
    conversation_id text,
    participant_id text,
    session_id text,
    eligible_agent_count text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (conversation_id) REFERENCES analytics_conversation_details_participant_session(conversation_id),
    FOREIGN KEY (participant_id) REFERENCES analytics_conversation_details_participant_session(participant_id),
    FOREIGN KEY (session_id) REFERENCES analytics_conversation_details_participant_session(session_id)
);

CREATE TABLE analytics_conversation_details_participant_session_requested_routing (
    _fivetran_id text,
    conversation_id text,
    participant_id text,
    session_id text,
    requested_routing text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (conversation_id) REFERENCES analytics_conversation_details_participant_session(conversation_id),
    FOREIGN KEY (participant_id) REFERENCES analytics_conversation_details_participant_session(participant_id),
    FOREIGN KEY (session_id) REFERENCES analytics_conversation_details_participant_session(session_id)
);

CREATE TABLE analytics_conversation_details_participant_session_waiting_interaction_counts (
    _fivetran_id text,
    conversation_id text,
    participant_id text,
    session_id text,
    waiting_interaction_count text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (conversation_id) REFERENCES analytics_conversation_details_participant_session(conversation_id),
    FOREIGN KEY (participant_id) REFERENCES analytics_conversation_details_participant_session(participant_id),
    FOREIGN KEY (session_id) REFERENCES analytics_conversation_details_participant_session(session_id)
);

CREATE TABLE analytics_conversation_details_participant_session_proposed_agent (
    _fivetran_id text,
    conversation_id text,
    participant_id text,
    session_id text,
    agent_rank text,
    proposed_agent_id text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (conversation_id) REFERENCES analytics_conversation_details_participant_session(conversation_id),
    FOREIGN KEY (participant_id) REFERENCES analytics_conversation_details_participant_session(participant_id),
    FOREIGN KEY (session_id) REFERENCES analytics_conversation_details_participant_session(session_id)
);

CREATE TABLE analytics_conversation_details_participant_session_agent_group (
    _fivetran_id text,
    conversation_id text,
    participant_id text,
    session_id text,
    agent_group_id text,
    agent_group_type text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (conversation_id) REFERENCES analytics_conversation_details_participant_session(conversation_id),
    FOREIGN KEY (participant_id) REFERENCES analytics_conversation_details_participant_session(participant_id),
    FOREIGN KEY (session_id) REFERENCES analytics_conversation_details_participant_session(session_id)
);

CREATE TABLE analytics_conversation_details_participant_session_media_endpoint_stats (
    _fivetran_id text,
    conversation_id text,
    participant_id text,
    session_id text,
    codecs jsonb,
    discarded_packets text,
    duplicate_packets text,
    event_time text,
    invalid_packets text,
    max_latency_ms text,
    min_mos text,
    min_r_factor text,
    overrun_packets text,
    received_packets text,
    underrun_packets text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (conversation_id) REFERENCES analytics_conversation_details_participant_session(conversation_id),
    FOREIGN KEY (participant_id) REFERENCES analytics_conversation_details_participant_session(participant_id),
    FOREIGN KEY (session_id) REFERENCES analytics_conversation_details_participant_session(session_id)
);

CREATE TABLE analytics_conversation_details_participant_session_flow_outcome (
    _fivetran_id text,
    conversation_id text,
    participant_id text,
    session_id text,
    flow_outcome text,
    flow_outcome_end_timestamp text,
    flow_outcome_id text,
    flow_outcome_start_timestamp text,
    flow_outcome_value text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (conversation_id) REFERENCES analytics_conversation_details_participant_session(conversation_id),
    FOREIGN KEY (participant_id) REFERENCES analytics_conversation_details_participant_session(participant_id),
    FOREIGN KEY (session_id) REFERENCES analytics_conversation_details_participant_session(session_id)
);

CREATE TABLE analytics_conversation_details_participant_session_metric (
    _fivetran_id text,
    conversation_id text,
    participant_id text,
    session_id text,
    emit_date text,
    "name" text,
    "value" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (conversation_id) REFERENCES analytics_conversation_details_participant_session(conversation_id),
    FOREIGN KEY (participant_id) REFERENCES analytics_conversation_details_participant_session(participant_id),
    FOREIGN KEY (session_id) REFERENCES analytics_conversation_details_participant_session(session_id)
);

CREATE TABLE analytics_conversation_details_participant_session_segment (
    _fivetran_id text,
    conversation_id text,
    participant_id text,
    session_id text,
    audio_muted text,
    conference text,
    destination_conversation_id text,
    destination_session_id text,
    disconnect_type text,
    error_code text,
    group_id text,
    properties jsonb,
    q_850_response_code jsonb,
    queue_id text,
    requested_language_id text,
    requested_routing_skill_ids jsonb,
    requested_routing_user_ids jsonb,
    scored_agents jsonb,
    segment_end text,
    segment_start text,
    segment_type text,
    sip_response_codes jsonb,
    source_conversation_id text,
    source_session_id text,
    subject text,
    video_muted text,
    wrap_up_code text,
    wrap_up_note text,
    wrap_up_tags jsonb,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (conversation_id) REFERENCES analytics_conversation_details_participant_session(conversation_id),
    FOREIGN KEY (participant_id) REFERENCES analytics_conversation_details_participant_session(participant_id),
    FOREIGN KEY (session_id) REFERENCES analytics_conversation_details_participant_session(session_id)
);

CREATE TABLE analytics_conversation_details_participant_session (
    session_id text,
    conversation_id text,
    participant_id text,
    assigner_id text,
    campaign_id text,
    contact_list_id text,
    script_id text,
    acw_skipped text,
    address_from text,
    address_other text,
    address_self text,
    address_to text,
    agent_assistant_id text,
    agent_bullseye_ring text,
    agent_owned text,
    ani text,
    authenticated text,
    barged_participant_id text,
    callback_scheduled_time text,
    callback_user_name text,
    cleared text,
    coached_participant_id text,
    cobrowse_role text,
    cobrowse_room_id text,
    contact_id text,
    delivery_status text,
    delivery_status_change_date text,
    direction text,
    disposition_analyzer text,
    disposition_name text,
    dnis text,
    edge_id text,
    extended_delivery_status text,
    flow_in_type text,
    flow_out_type text,
    journey_action_id text,
    journey_action_map_id text,
    journey_action_map_version text,
    journey_customer_id text,
    journey_customer_id_type text,
    journey_customer_session_id text,
    journey_customer_session_id_type text,
    media_bridge_id text,
    media_count text,
    media_type text,
    message_type text,
    monitored_participant_id text,
    peer_id text,
    protocol_call_id text,
    provider text,
    recording text,
    remote text,
    remote_name_displayable text,
    room_id text,
    routing_ring text,
    routing_rule text,
    routing_rule_type text,
    screen_share_address_self text,
    screen_share_room_id text,
    selected_agent_id text,
    selected_agent_rank text,
    session_dnis text,
    sharing_screen text,
    skip_enabled text,
    timeout_seconds text,
    used_routing text,
    video_address_self text,
    video_room_id text,
    PRIMARY KEY (session_id, conversation_id, participant_id),
    FOREIGN KEY (conversation_id) REFERENCES analytics_conversation_details_participant(conversation_id),
    FOREIGN KEY (participant_id) REFERENCES analytics_conversation_details_participant(participant_id),
    FOREIGN KEY (assigner_id) REFERENCES users(id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (contact_list_id) REFERENCES contact_list(id),
    FOREIGN KEY (script_id) REFERENCES script(id)
);

CREATE TABLE analytics_conversation_details_participant (
    conversation_id text,
    participant_id text,
    user_id text,
    external_contact_id text,
    external_organization_id text,
    flagged_reason text,
    participant_name text,
    purpose text,
    team_id text,
    -- attributes_* (dynamic column),
    PRIMARY KEY (conversation_id, participant_id),
    FOREIGN KEY (conversation_id) REFERENCES analytics_conversation_details(conversation_id),
    FOREIGN KEY (participant_id) REFERENCES users(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE analytics_conversation_details (
    conversation_id text,
    conference_start text,
    conversation_end text,
    conversation_initiator text,
    conversation_start text,
    customer_participation text,
    evaluation_form_context_id text,
    evaluation_form_id text,
    evaluation_form_modified_date text,
    evaluation_form_name text,
    evaluation_form_published text,
    evaluation_form_self_uri text,
    external_tag text,
    media_stats_min_conversation_mos text,
    media_stats_min_conversation_r_factor text,
    originating_direction text,
    self_served text,
    wrapup_code text,
    wrapup_duration_seconds text,
    wrapup_end_time text,
    wrapup_name text,
    wrapup_notes text,
    wrapup_provisional text,
    PRIMARY KEY (conversation_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id)
);

CREATE TABLE analytics_conversation_details_participant_session_skill_id (
    skill_id text,
    conversation_id text,
    participant_id text,
    session_id text,
    object_type text,
    PRIMARY KEY (skill_id, conversation_id, participant_id, session_id),
    FOREIGN KEY (conversation_id) REFERENCES analytics_conversation_details_participant_session(conversation_id),
    FOREIGN KEY (participant_id) REFERENCES analytics_conversation_details_participant_session(participant_id),
    FOREIGN KEY (session_id) REFERENCES analytics_conversation_details_participant_session(session_id)
);

CREATE TABLE analytic_user_detail_primary_presence (
    "index" text,
    user_id text,
    end_time text,
    organization_presence_id text,
    start_time text,
    system_presence text,
    PRIMARY KEY ("index", user_id),
    FOREIGN KEY (user_id) REFERENCES analytic_user_detail(user_id)
);

CREATE TABLE analytic_user_detail_routing_status (
    "index" text,
    user_id text,
    end_time text,
    routing_status text,
    start_time text,
    PRIMARY KEY ("index", user_id),
    FOREIGN KEY (user_id) REFERENCES analytic_user_detail(user_id)
);

CREATE TABLE analytic_user_detail (
    user_id text,
    PRIMARY KEY (user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);
