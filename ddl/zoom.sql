CREATE TABLE channel (
    id text,
    channel_settings_allow_to_add_external_users bigint,
    channel_settings_new_members_can_see_previous_messages_files boolean,
    channel_settings_posting_permissions bigint,
    jid text,
    "name" text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE meeting_report_custom_key (
    "key" text,
    meeting_report_uuid text,
    "value" text,
    PRIMARY KEY ("key", meeting_report_uuid),
    FOREIGN KEY (meeting_report_uuid) REFERENCES meeting_report(uuid)
);

CREATE TABLE meeting_report_tracking (
    field text,
    meeting_report_uuid text,
    "value" text,
    PRIMARY KEY (field, meeting_report_uuid),
    FOREIGN KEY (meeting_report_uuid) REFERENCES meeting_report(uuid)
);

CREATE TABLE meeting_report (
    uuid text,
    dept text,
    duration bigint,
    end_time timestamp,
    meeting_id bigint,
    participants_count bigint,
    start_time timestamp,
    topic text,
    total_minutes bigint,
    "type" text,
    user_email text,
    user_name text,
    PRIMARY KEY (uuid),
    FOREIGN KEY (uuid) REFERENCES meeting(uuid)
);

CREATE TABLE meeting (
    uuid text,
    host_id text,
    created_at timestamp,
    duration bigint,
    id bigint,
    join_url text,
    start_time timestamp,
    timezone text,
    topic text,
    "type" bigint,
    PRIMARY KEY (uuid),
    FOREIGN KEY (host_id) REFERENCES users(id)
);

CREATE TABLE event_survey_report_question_answer (
    "index" text,
    event_id text,
    event_survey_report_fivetran_id text,
    answer text,
    question text,
    PRIMARY KEY ("index", event_id, event_survey_report_fivetran_id),
    FOREIGN KEY (event_id) REFERENCES event_survey_report(event_id),
    FOREIGN KEY (event_survey_report_fivetran_id) REFERENCES event_survey_report(_fivetran_id)
);

CREATE TABLE event_survey_report (
    _fivetran_id text,
    event_id text,
    email text,
    session_id text,
    session_name text,
    PRIMARY KEY (_fivetran_id, event_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE account_parent_team (
    id text,
    account_team_id text,
    "name" text,
    PRIMARY KEY (id, account_team_id),
    FOREIGN KEY (account_team_id) REFERENCES account_team(id)
);

CREATE TABLE account_team (
    id text,
    description text,
    leaf text,
    member_size text,
    "name" text,
    supervisor_size text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE event_attendance_report_ticket_question (
    "index" text,
    event_attendance_fivetran_id text,
    event_attendance_report_ticket_id text,
    event_id text,
    answer text,
    title text,
    PRIMARY KEY ("index", event_attendance_fivetran_id, event_attendance_report_ticket_id, event_id),
    FOREIGN KEY (event_attendance_fivetran_id) REFERENCES event_attendance_report_ticket(event_attendance_fivetran_id),
    FOREIGN KEY (event_attendance_report_ticket_id) REFERENCES event_attendance_report_ticket(ticket_id),
    FOREIGN KEY (event_id) REFERENCES event_attendance_report_ticket(event_id)
);

CREATE TABLE event_attendance_report_ticket (
    ticket_id text,
    event_attendance_fivetran_id text,
    event_id text,
    ticket_type_id text,
    ticket_type_name text,
    PRIMARY KEY (ticket_id, event_attendance_fivetran_id, event_id),
    FOREIGN KEY (event_attendance_fivetran_id) REFERENCES event_attendance_report(_fivetran_id),
    FOREIGN KEY (event_id) REFERENCES event_attendance_report(event_id)
);

CREATE TABLE event_attendance_report_session_attendance (
    session_id text,
    event_attendance_report_fivetran_id text,
    event_id text,
    chat_messages_sent text,
    duration_spent_in_session text,
    live_streaming_view text,
    live_streaming_view_duration text,
    material_download text,
    recording_view text,
    recording_view_duration text,
    session_attendance text,
    session_name text,
    PRIMARY KEY (session_id, event_attendance_report_fivetran_id, event_id),
    FOREIGN KEY (event_attendance_report_fivetran_id) REFERENCES event_attendance_report(_fivetran_id),
    FOREIGN KEY (event_id) REFERENCES event_attendance_report(event_id)
);

CREATE TABLE event_attendance_report (
    _fivetran_id text,
    event_id text,
    attendance_type jsonb,
    connection_made text,
    display_name text,
    email text,
    event_attendance text,
    first_name text,
    last_name text,
    lobby_attendance text,
    lobby_chat_sent text,
    marketing_consent_prechecked text,
    number_of_tickets text,
    opt_in_marketing text,
    personal_chats text,
    profile_created text,
    "role" text,
    survey_taken text,
    total_sessions_joined text,
    PRIMARY KEY (_fivetran_id, event_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE webinar_participant (
    user_id text,
    webinar_uuid text,
    participant_user_id text,
    customer_key text,
    duration bigint,
    failover boolean,
    join_time timestamp,
    leave_time timestamp,
    "name" text,
    registrant_id text,
    "status" text,
    user_email text,
    PRIMARY KEY (user_id, webinar_uuid),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (webinar_uuid) REFERENCES webinar(uuid),
    FOREIGN KEY (participant_user_id) REFERENCES users(id)
);

CREATE TABLE event (
    id text,
    access_level text,
    attendance_type text,
    blocked_countries jsonb,
    calendar jsonb,
    categories jsonb,
    contact_email text,
    contact_name text,
    description text,
    end_time timestamp,
    event_status_type text,
    event_type text,
    event_url text,
    hub_id text,
    lobby_end_time timestamp,
    lobby_start_time timestamp,
    meeting_type text,
    "name" text,
    physical_location text,
    recurrence_duration text,
    recurrence_end_date_time text,
    recurrence_end_times text,
    recurrence_monthly_days text,
    recurrence_monthly_week text,
    recurrence_monthly_week_day text,
    recurrence_repeat_interval text,
    recurrence_type text,
    recurrence_weekly_days text,
    role_type text,
    start_time timestamp,
    "status" text,
    tagline text,
    tags jsonb,
    timezone text,
    PRIMARY KEY (id)
);

CREATE TABLE webinar_question_and_answer_question_detail (
    _fivetran_id text,
    webinar_question_and_answer_id bigint,
    webinar_question_and_answer_question_index text,
    webinar_uuid text,
    answer text,
    question text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (webinar_question_and_answer_id) REFERENCES webinar_question_and_answer_question(webinar_question_and_answer_id),
    FOREIGN KEY (webinar_question_and_answer_question_index) REFERENCES webinar_question_and_answer_question("index"),
    FOREIGN KEY (webinar_uuid) REFERENCES webinar_question_and_answer_question(webinar_uuid)
);

CREATE TABLE webinar_question_and_answer_question (
    "index" text,
    webinar_question_and_answer_id bigint,
    webinar_uuid text,
    email text,
    "name" text,
    PRIMARY KEY ("index", webinar_question_and_answer_id, webinar_uuid),
    FOREIGN KEY (webinar_question_and_answer_id) REFERENCES webinar_question_and_answer(id),
    FOREIGN KEY (webinar_uuid) REFERENCES webinar_question_and_answer(webinar_uuid)
);

CREATE TABLE webinar_question_and_answer (
    id bigint,
    webinar_uuid text,
    start_time timestamp,
    uuid text,
    PRIMARY KEY (id, webinar_uuid),
    FOREIGN KEY (webinar_uuid) REFERENCES webinar(uuid)
);

CREATE TABLE webinar_absentee (
    registrant_id text,
    webinar_uuid text,
    email text,
    PRIMARY KEY (registrant_id, webinar_uuid),
    FOREIGN KEY (registrant_id) REFERENCES webinar_registrant(user_id),
    FOREIGN KEY (webinar_uuid) REFERENCES webinar(uuid),
    FOREIGN KEY (email) REFERENCES users(email)
);

CREATE TABLE phone_sms_mms_charge_usage_report (
    message_id text,
    session_id text,
    billing_number text,
    cost_center text,
    currency text,
    department text,
    from_display_name text,
    from_extension_number text,
    from_number text,
    message_type text,
    rate text,
    sent_time text,
    to_display_name text,
    to_extension_number text,
    to_number text,
    total_charge text,
    PRIMARY KEY (message_id, session_id)
);

CREATE TABLE webinar_panelist (
    user_id text,
    webinar_uuid text,
    email text,
    join_url text,
    "name" text,
    name_tag_description text,
    name_tag_id text,
    name_tag_name text,
    name_tag_pronouns text,
    virtual_background_id text,
    PRIMARY KEY (user_id, webinar_uuid),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (webinar_uuid) REFERENCES webinar(uuid)
);

CREATE TABLE event_registration_ticket_question (
    "index" text,
    event_id text,
    event_registration_fivetran_id text,
    event_registration_ticket_id text,
    answer text,
    title text,
    PRIMARY KEY ("index", event_id, event_registration_fivetran_id, event_registration_ticket_id),
    FOREIGN KEY (event_id) REFERENCES event_registration_ticket(event_id),
    FOREIGN KEY (event_registration_fivetran_id) REFERENCES event_registration_ticket(event_registration_fivetran_id),
    FOREIGN KEY (event_registration_ticket_id) REFERENCES event_registration_ticket(ticket_id)
);

CREATE TABLE event_registration_ticket (
    ticket_id text,
    event_id text,
    event_registration_fivetran_id text,
    authentication_method text,
    external_ticket_id text,
    ticket_type_id text,
    ticket_type_name text,
    PRIMARY KEY (ticket_id, event_id, event_registration_fivetran_id),
    FOREIGN KEY (event_id) REFERENCES event_registration(event_id),
    FOREIGN KEY (event_registration_fivetran_id) REFERENCES event_registration(_fivetran_id)
);

CREATE TABLE event_registration (
    _fivetran_id text,
    event_id text,
    attendance_type jsonb,
    display_name text,
    email text,
    event_attendance text,
    first_name text,
    last_name text,
    marketing_consent_prechecked text,
    opt_in_marketing text,
    register_date text,
    registration_method text,
    registration_source text,
    PRIMARY KEY (_fivetran_id, event_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE disposition (
    id text,
    modified_by text,
    disposition_description text,
    disposition_name text,
    disposition_type text,
    last_modified_time timestamp,
    queue_count text,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (modified_by) REFERENCES users(id)
);

CREATE TABLE webinar_poll_question_answer (
    _fivetran_id text,
    webinar_poll_id text,
    webinar_poll_question_index text,
    webinar_uuid text,
    answer text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (webinar_poll_id) REFERENCES webinar_poll_question(webinar_poll_id),
    FOREIGN KEY (webinar_poll_question_index) REFERENCES webinar_poll_question("index"),
    FOREIGN KEY (webinar_uuid) REFERENCES webinar_poll_question(webinar_uuid)
);

CREATE TABLE webinar_poll_question_prompt (
    _fivetran_id text,
    webinar_poll_id text,
    webinar_poll_question_index text,
    webinar_uuid text,
    prompt_question text,
    prompt_right_answers jsonb,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (webinar_poll_id) REFERENCES webinar_poll_question(webinar_poll_id),
    FOREIGN KEY (webinar_poll_question_index) REFERENCES webinar_poll_question("index"),
    FOREIGN KEY (webinar_uuid) REFERENCES webinar_poll_question(webinar_uuid)
);

CREATE TABLE webinar_poll_question (
    "index" text,
    webinar_poll_id text,
    webinar_uuid text,
    answer_max_character bigint,
    answer_min_character bigint,
    answer_required boolean,
    case_sensitive boolean,
    "name" text,
    rating_max_label text,
    rating_max_value bigint,
    rating_min_label text,
    rating_min_value bigint,
    right_answers jsonb,
    show_as_dropdown boolean,
    "type" text,
    PRIMARY KEY ("index", webinar_poll_id, webinar_uuid),
    FOREIGN KEY (webinar_poll_id) REFERENCES webinar_poll(id),
    FOREIGN KEY (webinar_uuid) REFERENCES webinar_poll(webinar_uuid)
);

CREATE TABLE webinar_poll (
    id text,
    webinar_uuid text,
    anonymous boolean,
    poll_type bigint,
    "status" text,
    title text,
    PRIMARY KEY (id, webinar_uuid),
    FOREIGN KEY (webinar_uuid) REFERENCES webinar(uuid)
);

CREATE TABLE webinar_registrant_custom_question (
    "index" text,
    user_id text,
    webinar_uuid text,
    title text,
    "value" text,
    PRIMARY KEY ("index", user_id, webinar_uuid),
    FOREIGN KEY (user_id) REFERENCES webinar_registrant(user_id),
    FOREIGN KEY (webinar_uuid) REFERENCES webinar_registrant(webinar_uuid)
);

CREATE TABLE webinar_registrant (
    user_id text,
    webinar_uuid text,
    email text,
    address text,
    city text,
    comments text,
    country text,
    create_time timestamp,
    industry text,
    job_title text,
    join_url text,
    no_of_employees text,
    org text,
    phone text,
    purchasing_time_frame text,
    role_in_purchase_process text,
    "state" text,
    zip text,
    PRIMARY KEY (user_id, webinar_uuid),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (webinar_uuid) REFERENCES webinar(uuid),
    FOREIGN KEY (email) REFERENCES users(email)
);

CREATE TABLE phone_call_path (
    id text,
    phone_call_history_id text,
    callee_country_code text,
    callee_country_iso_code text,
    callee_device_type text,
    callee_number_type text,
    caller_country_code text,
    caller_country_iso_code text,
    caller_device_type text,
    caller_number_type text,
    client_code text,
    device_private_ip text,
    device_public_ip text,
    event text,
    hold_time text,
    is_node text,
    node text,
    operator_ext_id text,
    operator_ext_number text,
    operator_ext_type text,
    operator_name text,
    press_key text,
    recording_id text,
    recording_type text,
    "result" text,
    result_reason text,
    segment text,
    voicemail_id text,
    waiting_time text,
    PRIMARY KEY (id, phone_call_history_id),
    FOREIGN KEY (phone_call_history_id) REFERENCES phone_call_history(id)
);

CREATE TABLE webinar_tracking_source (
    id text,
    webinar_uuid text,
    registrationr_count bigint,
    source_name text,
    tracking_url text,
    visitor_count bigint,
    PRIMARY KEY (id, webinar_uuid),
    FOREIGN KEY (webinar_uuid) REFERENCES webinar(uuid)
);

CREATE TABLE phone_call_history (
    call_id text,
    id text,
    group_id text,
    answer_time text,
    call_result text,
    call_type text,
    callee_country_code text,
    callee_country_iso_code text,
    callee_device_type text,
    callee_did_number text,
    callee_email text,
    callee_ext_id text,
    callee_ext_number text,
    callee_ext_type text,
    callee_name text,
    callee_number_type text,
    caller_country_code text,
    caller_country_iso_code text,
    caller_device_type text,
    caller_did_number text,
    caller_email text,
    caller_ext_id text,
    caller_ext_number text,
    caller_ext_type text,
    caller_name text,
    caller_number_type text,
    client_code text,
    connect_type text,
    cost_center text,
    department text,
    direction text,
    duration text,
    end_time timestamp,
    international text,
    recording_status text,
    sbc_id text,
    sbc_name text,
    sip_group_id text,
    sip_group_name text,
    site_id text,
    site_name text,
    spam text,
    start_time timestamp,
    PRIMARY KEY (call_id, id),
    FOREIGN KEY (group_id) REFERENCES user_group(group_id)
);

CREATE TABLE webinar (
    uuid text,
    host_id text,
    created_at timestamp,
    duration bigint,
    id bigint,
    join_url text,
    start_time timestamp,
    timezone text,
    topic text,
    "type" bigint,
    PRIMARY KEY (uuid),
    FOREIGN KEY (host_id) REFERENCES users(id)
);

CREATE TABLE user_group (
    group_id text,
    user_id text,
    PRIMARY KEY (group_id, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE user_im_group (
    im_group_id text,
    user_id text,
    PRIMARY KEY (im_group_id, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE user_custom_attribute (
    "key" text,
    user_id text,
    "name" text,
    "value" text,
    PRIMARY KEY ("key", user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    created_at timestamp,
    dept text,
    email text,
    employee_unique_id text,
    first_name text,
    host_key text,
    languages text,
    last_client_version text,
    last_login_time timestamp,
    last_name text,
    phone_number text,
    plan_united_type text,
    pmi bigint,
    role_id text,
    "status" text,
    timezone text,
    "type" bigint,
    verified bigint,
    PRIMARY KEY (id)
);

CREATE TABLE webinar_report_custom_key (
    "key" text,
    webinar_report_uuid text,
    "value" text,
    PRIMARY KEY ("key", webinar_report_uuid),
    FOREIGN KEY (webinar_report_uuid) REFERENCES webinar_report(uuid)
);

CREATE TABLE webinar_report_tracking (
    field text,
    webinar_report_uuid text,
    "value" text,
    PRIMARY KEY (field, webinar_report_uuid),
    FOREIGN KEY (webinar_report_uuid) REFERENCES webinar_report(uuid)
);

CREATE TABLE webinar_report (
    uuid text,
    dept text,
    duration bigint,
    end_time timestamp,
    id text,
    participants_count bigint,
    start_time timestamp,
    topic text,
    total_minutes bigint,
    "type" text,
    user_email text,
    user_name text,
    PRIMARY KEY (uuid),
    FOREIGN KEY (uuid) REFERENCES webinar(uuid)
);

CREATE TABLE phone_call_charge_usage_report (
    call_log_id text,
    billing_number text,
    call_type text,
    callee_billing_number text,
    callee_number text,
    caller_billing_number text,
    caller_number text,
    calling_party_name text,
    charge_mode text,
    cost_center text,
    currency text,
    department text,
    duration text,
    employee_id text,
    end_time timestamp,
    forward_number_billing text,
    rate text,
    service_type text,
    total_charge text,
    PRIMARY KEY (call_log_id)
);

CREATE TABLE meeting_participant (
    meeting_uuid text,
    user_id text,
    participant_user_id text,
    bo_mtg_id text,
    customer_key text,
    duration bigint,
    failover boolean,
    join_time timestamp,
    leave_time timestamp,
    "name" text,
    registrant_id text,
    "status" text,
    user_email text,
    PRIMARY KEY (meeting_uuid, user_id),
    FOREIGN KEY (meeting_uuid) REFERENCES meeting(uuid),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (participant_user_id) REFERENCES users(id)
);

CREATE TABLE room (
    id text,
    account_type text,
    calender_name text,
    camera text,
    device_ip text,
    email text,
    health text,
    issues jsonb,
    last_start_time text,
    location text,
    location_id text,
    microphone text,
    room_name text,
    speaker text,
    "status" text,
    PRIMARY KEY (id)
);

CREATE TABLE voice_historical_detail_report_channel (
    "index" text,
    engagement_id text,
    channel text,
    channel_source text,
    PRIMARY KEY ("index", engagement_id),
    FOREIGN KEY (engagement_id) REFERENCES voice_historical_detail_report(engagement_id)
);

CREATE TABLE voice_historical_detail_report_flow (
    flow_id text,
    engagement_id text,
    flow_name text,
    flow_version text,
    PRIMARY KEY (flow_id, engagement_id),
    FOREIGN KEY (engagement_id) REFERENCES voice_historical_detail_report(engagement_id)
);

CREATE TABLE voice_historical_detail_report_queue (
    cc_queue_id text,
    engagement_id text,
    queue_name text,
    PRIMARY KEY (cc_queue_id, engagement_id),
    FOREIGN KEY (cc_queue_id) REFERENCES voice_historical_queue_report(cc_queue_id),
    FOREIGN KEY (engagement_id) REFERENCES voice_historical_detail_report(engagement_id)
);

CREATE TABLE voice_historical_detail_report_agent (
    "index" text,
    engagement_id text,
    display_name text,
    user_id text,
    PRIMARY KEY ("index", engagement_id),
    FOREIGN KEY (engagement_id) REFERENCES voice_historical_detail_report(engagement_id)
);

CREATE TABLE voice_historical_detail_report_required_skill (
    skill_id text,
    engagement_id text,
    minimum_proficiency_level text,
    skill_name text,
    PRIMARY KEY (skill_id, engagement_id),
    FOREIGN KEY (engagement_id) REFERENCES voice_historical_detail_report(engagement_id)
);

CREATE TABLE voice_historical_detail_report_optional_skill (
    skill_id text,
    engagement_id text,
    minimum_proficiency_level text,
    skill_name text,
    PRIMARY KEY (skill_id, engagement_id),
    FOREIGN KEY (engagement_id) REFERENCES voice_historical_detail_report(engagement_id)
);

CREATE TABLE voice_historical_detail_report_agent_skill (
    skill_id text,
    engagement_id text,
    minimum_proficiency_level text,
    skill_name text,
    PRIMARY KEY (skill_id, engagement_id),
    FOREIGN KEY (engagement_id) REFERENCES voice_historical_detail_report(engagement_id)
);

CREATE TABLE voice_historical_detail_report (
    engagement_id text,
    disposition_id text,
    agent_first_message_speed text,
    callback_pending_duration text,
    callback_waiting_duration text,
    channel text,
    consumer_id text,
    consumer_name text,
    consumer_number text,
    dialed_numbers jsonb,
    direction text,
    disposition_name text,
    handling_duration text,
    hold_duration text,
    ivr_duration text,
    last_widget_name text,
    queue_wait_type text,
    results text,
    ring_duration text,
    start_time timestamp,
    talking_duration text,
    total_duration text,
    total_flow_duration text,
    waiting_duration text,
    wrap_up_duration text,
    PRIMARY KEY (engagement_id),
    FOREIGN KEY (disposition_id) REFERENCES disposition(id)
);

CREATE TABLE voice_historical_queue_report (
    cc_queue_id text,
    queue_name text,
    total_completed text,
    total_inbound text,
    total_transferred_in text,
    total_transferred_out text,
    voice_average_outbound_answer_duration text,
    voice_average_outbound_hold_duration text,
    voice_average_outbound_wrap_up_duration text,
    voice_end_time_interval text,
    voice_hangup_outbound text,
    voice_hold_abandoned text,
    voice_inbound_average_talking_duration text,
    voice_inbound_average_waiting_duration text,
    voice_inbound_average_wrap_up_duration text,
    voice_inbound_longest_talking_duration text,
    voice_inbound_longest_waiting_duration text,
    voice_inbound_longest_wrap_up_duration text,
    voice_inbound_shortest_talking_duration text,
    voice_inbound_shortest_waiting_duration text,
    voice_inbound_shortest_wrap_up_duration text,
    voice_long_abandoned text,
    voice_long_outbound text,
    voice_service_level text,
    voice_short_abandoned text,
    voice_short_outbound text,
    voice_start_time_interval text,
    voice_total_abandoned_duration text,
    voice_total_answer_duration text,
    voice_total_answered_users text,
    voice_total_hold_duration text,
    voice_total_missed text,
    voice_total_outbound text,
    voice_total_outbound_answer_duration text,
    voice_total_outbound_hold_duration text,
    voice_total_outbound_wrap_up_duration text,
    voice_total_overflowed text,
    voice_total_queue_wait_duration text,
    voice_total_wrap_up_duration text,
    voice_upgraded_to_video_call text,
    PRIMARY KEY (cc_queue_id)
);

CREATE TABLE phone_sms_session_participant (
    "index" text,
    phone_sms_session_id text,
    display_name text,
    extension_deleted_time text,
    extension_status text,
    is_session_owner text,
    owner_id text,
    owner_type text,
    phone_number text,
    PRIMARY KEY ("index", phone_sms_session_id),
    FOREIGN KEY (phone_sms_session_id) REFERENCES phone_sms_session(id)
);

CREATE TABLE phone_sms_session (
    id text,
    last_access_time text,
    session_type text,
    PRIMARY KEY (id)
);

CREATE TABLE messaging_historical_queue_report (
    cc_queue_id text,
    messaging_average_agent_first_message_speed text,
    messaging_average_outbound_answer_duration text,
    messaging_average_outbound_wrap_up_duration text,
    messaging_average_sent text,
    messaging_channel_sources jsonb,
    messaging_end_time_interval text,
    messaging_inbound_average_messaging_duration text,
    messaging_inbound_average_waiting_duration text,
    messaging_inbound_longest_messaging_duration text,
    messaging_inbound_longest_waiting_duration text,
    messaging_inbound_shortest_messaging_duration text,
    messaging_inbound_shortest_waiting_duration text,
    messaging_longest_agent_first_message_speed text,
    messaging_service_level text,
    messaging_shortest_agent_first_message_speed text,
    messaging_start_time_interval text,
    messaging_total_abandoned text,
    messaging_total_auto_closed text,
    messaging_total_outbound text,
    messaging_total_outbound_answer_duration text,
    messaging_total_outbound_wrap_up_duration text,
    messaging_total_overflowed text,
    messaging_total_released text,
    messaging_total_sent text,
    messaging_upgraded_to_video_call text,
    messaging_upgraded_to_voice_call text,
    queue_name text,
    total_completed text,
    total_inbound text,
    total_transferred_in text,
    total_transferred_out text,
    PRIMARY KEY (cc_queue_id)
);

CREATE TABLE video_historical_queue_report (
    cc_queue_id text,
    queue_name text,
    total_completed text,
    total_inbound text,
    total_transferred_in text,
    total_transferred_out text,
    video_average_talking_duration text,
    video_average_waiting_duration text,
    video_average_wrap_up_duration text,
    video_end_time_interval text,
    video_hold_abandoned text,
    video_long_abandoned text,
    video_longest_talking_duration text,
    video_longest_waiting_duration text,
    video_longest_wrap_up_duration text,
    video_service_level text,
    video_short_abandoned text,
    video_shortest_talking_duration text,
    video_shortest_waiting_duration text,
    video_shortest_wrap_up_duration text,
    video_start_time_interval text,
    video_total_missed text,
    video_total_overflowed text,
    PRIMARY KEY (cc_queue_id)
);

CREATE TABLE phone_call_log (
    call_id text,
    callee_codec text,
    callee_device_private_ip text,
    callee_device_public_ip text,
    callee_device_type text,
    callee_extension_number text,
    callee_headset text,
    callee_isp text,
    callee_microphone text,
    callee_phone_number text,
    callee_site_id text,
    caller_codec text,
    caller_device_private_ip text,
    caller_device_public_ip text,
    caller_device_type text,
    caller_extension_number text,
    caller_headset text,
    caller_isp text,
    caller_microphone text,
    caller_phone_number text,
    caller_site_id text,
    date_time text,
    direction text,
    duration text,
    mos text,
    PRIMARY KEY (call_id)
);

CREATE TABLE agent_status_history (
    _fivetran_id text,
    user_id text,
    display_name text,
    duration text,
    end_time timestamp,
    occupied_engagements jsonb,
    start_time timestamp,
    status_id text,
    status_name text,
    sub_status_id text,
    sub_status_name text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE deal (
    id text,
    owner_id text,
    account_name text,
    account_type text,
    amount text,
    close_date text,
    create_time timestamp,
    currency_type text,
    description text,
    is_closed text,
    is_private text,
    last_activity_time timestamp,
    "name" text,
    number_of_conversations text,
    owner_email text,
    owner_name text,
    stage text,
    time_in_stage text,
    PRIMARY KEY (id),
    FOREIGN KEY (owner_id) REFERENCES users(id)
);

CREATE TABLE messaging_agent_leg_report (
    _fivetran_id text,
    cc_queue_id text,
    disposition_id text,
    engagement_id text,
    agent_end_time text,
    agent_first_response_duration text,
    agent_offered text,
    agent_start_time text,
    channel text,
    channel_source text,
    conference_count text,
    conference_duration text,
    conversation_duration text,
    direct_transfer text,
    display_name text,
    disposition_name text,
    handle_duration text,
    handled_engagement text,
    hold_count text,
    hold_duration text,
    queue_name text,
    refused_engagement text,
    ring_duration text,
    user_email text,
    user_id text,
    warm_conference text,
    warm_conference_duration text,
    warm_transfer_completed text,
    warm_transfer_duration text,
    warm_transfer_initiated text,
    wrap_up_duration text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (cc_queue_id) REFERENCES messaging_historical_queue_report(cc_queue_id),
    FOREIGN KEY (disposition_id) REFERENCES disposition(id),
    FOREIGN KEY (engagement_id) REFERENCES engagement(id)
);

CREATE TABLE agent_time_sheet (
    _fivetran_id text,
    user_id text,
    average_video_call_talking_duration text,
    average_wrap_up_duration text,
    display_name text,
    end_time_interval text,
    inbound_average_voice_call_talking_duration text,
    not_ready_duration text,
    not_ready_percentage text,
    occupied_duration text,
    occupied_percentage text,
    offline_duration text,
    online_duration text,
    ready_duration text,
    ready_percentage text,
    start_time_interval text,
    total_inbound_voice_call text,
    total_inbound_voice_call_duration text,
    total_outbound_voice_call text,
    total_outbound_voice_call_duration text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE voice_agent_leg_report (
    _fivetran_id text,
    cc_queue_id text,
    disposition_id text,
    engagement_id text,
    agent_end_time text,
    agent_first_response_duration text,
    agent_offered text,
    agent_start_time text,
    channel text,
    channel_source text,
    conference_count text,
    conference_duration text,
    conversation_duration text,
    direct_transfer text,
    display_name text,
    disposition_name text,
    handle_duration text,
    handled_engagement text,
    hold_count text,
    hold_duration text,
    queue_name text,
    refused_engagement text,
    ring_duration text,
    user_email text,
    user_id text,
    warm_conference text,
    warm_conference_duration text,
    warm_transfer_completed text,
    warm_transfer_duration text,
    warm_transfer_initiated text,
    wrap_up_duration text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (cc_queue_id) REFERENCES voice_historical_queue_report(cc_queue_id),
    FOREIGN KEY (disposition_id) REFERENCES disposition(id),
    FOREIGN KEY (engagement_id) REFERENCES engagement(id)
);

CREATE TABLE conversation (
    id text,
    deal_id text,
    host_id text,
    meeting_uuid text,
    conversation_topic text,
    conversation_type text,
    duration text,
    duration_sec text,
    engagement_score text,
    engaging_questions_count text,
    filler_words_count text,
    iq_processed_time text,
    meeting_id text,
    meeting_start_time text,
    next_steps_count text,
    processing_analysis text,
    sentiment_score text,
    topic text,
    PRIMARY KEY (id),
    FOREIGN KEY (deal_id) REFERENCES deal(id),
    FOREIGN KEY (host_id) REFERENCES users(id),
    FOREIGN KEY (meeting_uuid) REFERENCES meeting(uuid)
);

CREATE TABLE email_historical_queue_report (
    cc_queue_id text,
    email_end_time_interval text,
    email_inbound_average_agent_first_reply_duration text,
    email_inbound_average_agent_reply_duration text,
    email_inbound_average_inactive_duration text,
    email_inbound_average_messaging_duration text,
    email_inbound_average_waiting_duration text,
    email_inbound_longest_agent_first_reply_duration text,
    email_inbound_longest_agent_reply_duration text,
    email_inbound_longest_inactive_duration text,
    email_inbound_longest_messaging_duration text,
    email_inbound_longest_waiting_duration text,
    email_inbound_shortest_agent_first_reply_duration text,
    email_inbound_shortest_agent_reply_duration text,
    email_inbound_shortest_inactive_duration text,
    email_inbound_shortest_messaging_duration text,
    email_inbound_shortest_waiting_duration text,
    email_service_level text,
    email_start_time_interval text,
    email_total_auto_closed text,
    email_total_handled text,
    email_total_offered text,
    email_total_offers text,
    email_total_offers_acd text,
    email_total_offers_answered text,
    email_total_offers_declined text,
    email_total_offers_missed text,
    email_total_offers_non_acd text,
    email_total_overflowed text,
    email_total_released text,
    email_total_transferred_in_to_agent text,
    email_total_transferred_in_to_queue text,
    email_total_transferred_out_of_queue text,
    email_total_transferred_out_within_queue text,
    queue_name text,
    total_completed text,
    total_inbound text,
    total_transferred_in text,
    total_transferred_out text,
    PRIMARY KEY (cc_queue_id)
);

CREATE TABLE email_historical_detail_report_channel (
    "index" text,
    engagement_id text,
    channel text,
    channel_source text,
    PRIMARY KEY ("index", engagement_id),
    FOREIGN KEY (engagement_id) REFERENCES email_historical_detail_report(engagement_id)
);

CREATE TABLE email_historical_detail_report_flow (
    flow_id text,
    engagement_id text,
    flow_name text,
    flow_version text,
    PRIMARY KEY (flow_id, engagement_id),
    FOREIGN KEY (engagement_id) REFERENCES email_historical_detail_report(engagement_id)
);

CREATE TABLE email_historical_detail_report_queue (
    cc_queue_id text,
    engagement_id text,
    queue_name text,
    PRIMARY KEY (cc_queue_id, engagement_id),
    FOREIGN KEY (cc_queue_id) REFERENCES email_historical_queue_report(cc_queue_id),
    FOREIGN KEY (engagement_id) REFERENCES email_historical_detail_report(engagement_id)
);

CREATE TABLE email_historical_detail_report_agent (
    "index" text,
    engagement_id text,
    display_name text,
    user_id text,
    PRIMARY KEY ("index", engagement_id),
    FOREIGN KEY (engagement_id) REFERENCES email_historical_detail_report(engagement_id)
);

CREATE TABLE email_historical_detail_report_required_skill (
    skill_id text,
    engagement_id text,
    minimum_proficiency_level text,
    skill_name text,
    PRIMARY KEY (skill_id, engagement_id),
    FOREIGN KEY (engagement_id) REFERENCES email_historical_detail_report(engagement_id)
);

CREATE TABLE email_historical_detail_report_optional_skill (
    skill_id text,
    engagement_id text,
    minimum_proficiency_level text,
    skill_name text,
    PRIMARY KEY (skill_id, engagement_id),
    FOREIGN KEY (engagement_id) REFERENCES email_historical_detail_report(engagement_id)
);

CREATE TABLE email_historical_detail_report_agent_skill (
    skill_id text,
    engagement_id text,
    minimum_proficiency_level text,
    skill_name text,
    PRIMARY KEY (skill_id, engagement_id),
    FOREIGN KEY (engagement_id) REFERENCES email_historical_detail_report(engagement_id)
);

CREATE TABLE email_historical_detail_report (
    engagement_id text,
    disposition_id text,
    agent_first_message_speed text,
    callback_pending_duration text,
    callback_waiting_duration text,
    channel text,
    consumer_id text,
    consumer_name text,
    consumer_number text,
    dialed_numbers jsonb,
    direction text,
    disposition_name text,
    handling_duration text,
    hold_duration text,
    ivr_duration text,
    last_widget_name text,
    queue_wait_type text,
    results text,
    ring_duration text,
    start_time timestamp,
    talking_duration text,
    total_duration text,
    total_flow_duration text,
    waiting_duration text,
    wrap_up_duration text,
    PRIMARY KEY (engagement_id),
    FOREIGN KEY (disposition_id) REFERENCES disposition(id)
);

CREATE TABLE video_historical_detail_report_channel (
    "index" text,
    engagement_id text,
    channel text,
    channel_source text,
    PRIMARY KEY ("index", engagement_id),
    FOREIGN KEY (engagement_id) REFERENCES video_historical_detail_report(engagement_id)
);

CREATE TABLE video_historical_detail_report_flow (
    flow_id text,
    engagement_id text,
    flow_name text,
    flow_version text,
    PRIMARY KEY (flow_id, engagement_id),
    FOREIGN KEY (engagement_id) REFERENCES video_historical_detail_report(engagement_id)
);

CREATE TABLE video_historical_detail_report_queue (
    cc_queue_id text,
    engagement_id text,
    queue_name text,
    PRIMARY KEY (cc_queue_id, engagement_id),
    FOREIGN KEY (cc_queue_id) REFERENCES video_historical_queue_report(cc_queue_id),
    FOREIGN KEY (engagement_id) REFERENCES video_historical_detail_report(engagement_id)
);

CREATE TABLE video_historical_detail_report_agent (
    "index" text,
    engagement_id text,
    display_name text,
    user_id text,
    PRIMARY KEY ("index", engagement_id),
    FOREIGN KEY (engagement_id) REFERENCES video_historical_detail_report(engagement_id)
);

CREATE TABLE video_historical_detail_report_required_skill (
    skill_id text,
    engagement_id text,
    minimum_proficiency_level text,
    skill_name text,
    PRIMARY KEY (skill_id, engagement_id),
    FOREIGN KEY (engagement_id) REFERENCES video_historical_detail_report(engagement_id)
);

CREATE TABLE video_historical_detail_report_optional_skill (
    skill_id text,
    engagement_id text,
    minimum_proficiency_level text,
    skill_name text,
    PRIMARY KEY (skill_id, engagement_id),
    FOREIGN KEY (engagement_id) REFERENCES video_historical_detail_report(engagement_id)
);

CREATE TABLE video_historical_detail_report_agent_skill (
    skill_id text,
    engagement_id text,
    minimum_proficiency_level text,
    skill_name text,
    PRIMARY KEY (skill_id, engagement_id),
    FOREIGN KEY (engagement_id) REFERENCES video_historical_detail_report(engagement_id)
);

CREATE TABLE video_historical_detail_report (
    engagement_id text,
    disposition_id text,
    agent_first_message_speed text,
    callback_pending_duration text,
    callback_waiting_duration text,
    channel text,
    consumer_id text,
    consumer_name text,
    consumer_number text,
    dialed_numbers jsonb,
    direction text,
    disposition_name text,
    handling_duration text,
    hold_duration text,
    ivr_duration text,
    last_widget_name text,
    queue_wait_type text,
    results text,
    ring_duration text,
    start_time timestamp,
    talking_duration text,
    total_duration text,
    total_flow_duration text,
    waiting_duration text,
    wrap_up_duration text,
    PRIMARY KEY (engagement_id),
    FOREIGN KEY (disposition_id) REFERENCES disposition(id)
);

CREATE TABLE messaging_historical_detail_report_channel (
    "index" text,
    engagement_id text,
    channel text,
    channel_source text,
    PRIMARY KEY ("index", engagement_id),
    FOREIGN KEY (engagement_id) REFERENCES messaging_historical_detail_report(engagement_id)
);

CREATE TABLE messaging_historical_detail_report_flow (
    flow_id text,
    engagement_id text,
    flow_name text,
    flow_version text,
    PRIMARY KEY (flow_id, engagement_id),
    FOREIGN KEY (engagement_id) REFERENCES messaging_historical_detail_report(engagement_id)
);

CREATE TABLE messaging_historical_detail_report_queue (
    cc_queue_id text,
    engagement_id text,
    queue_name text,
    PRIMARY KEY (cc_queue_id, engagement_id),
    FOREIGN KEY (cc_queue_id) REFERENCES messaging_historical_queue_report(cc_queue_id),
    FOREIGN KEY (engagement_id) REFERENCES messaging_historical_detail_report(engagement_id)
);

CREATE TABLE messaging_historical_detail_report_agent (
    "index" text,
    engagement_id text,
    display_name text,
    user_id text,
    PRIMARY KEY ("index", engagement_id),
    FOREIGN KEY (engagement_id) REFERENCES messaging_historical_detail_report(engagement_id)
);

CREATE TABLE messaging_historical_detail_report_required_skill (
    skill_id text,
    engagement_id text,
    minimum_proficiency_level text,
    skill_name text,
    PRIMARY KEY (skill_id, engagement_id),
    FOREIGN KEY (engagement_id) REFERENCES messaging_historical_detail_report(engagement_id)
);

CREATE TABLE messaging_historical_detail_report_optional_skill (
    skill_id text,
    engagement_id text,
    minimum_proficiency_level text,
    skill_name text,
    PRIMARY KEY (skill_id, engagement_id),
    FOREIGN KEY (engagement_id) REFERENCES messaging_historical_detail_report(engagement_id)
);

CREATE TABLE messaging_historical_detail_report_agent_skill (
    skill_id text,
    engagement_id text,
    minimum_proficiency_level text,
    skill_name text,
    PRIMARY KEY (skill_id, engagement_id),
    FOREIGN KEY (engagement_id) REFERENCES messaging_historical_detail_report(engagement_id)
);

CREATE TABLE messaging_historical_detail_report (
    engagement_id text,
    disposition_id text,
    agent_first_message_speed text,
    callback_pending_duration text,
    callback_waiting_duration text,
    channel text,
    consumer_id text,
    consumer_name text,
    consumer_number text,
    dialed_numbers jsonb,
    direction text,
    disposition_name text,
    handling_duration text,
    hold_duration text,
    ivr_duration text,
    last_widget_name text,
    queue_wait_type text,
    results text,
    ring_duration text,
    start_time timestamp,
    talking_duration text,
    total_duration text,
    total_flow_duration text,
    waiting_duration text,
    wrap_up_duration text,
    PRIMARY KEY (engagement_id),
    FOREIGN KEY (disposition_id) REFERENCES disposition(id)
);

CREATE TABLE deal_activity (
    _fivetran_id text,
    deal_id text,
    conversation_id text,
    host_id text,
    activity_type text,
    conversation_topic text,
    direction text,
    duration text,
    engagement_score text,
    message_id text,
    number_of_message_in_thread text,
    processing_analysis text,
    sentiment_score text,
    stage text,
    stage_during_conversation text,
    start_date timestamp,
    PRIMARY KEY (_fivetran_id, deal_id),
    FOREIGN KEY (deal_id) REFERENCES deal(id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id),
    FOREIGN KEY (host_id) REFERENCES users(id)
);

CREATE TABLE conversation_scorecard_question (
    question_id text,
    conversation_id text,
    conversation_scorecard_id text,
    max_score_label text,
    min_score_label text,
    question_comment text,
    question_description text,
    question_title text,
    score text,
    PRIMARY KEY (question_id, conversation_id, conversation_scorecard_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation_scorecard(conversation_id),
    FOREIGN KEY (conversation_scorecard_id) REFERENCES conversation_scorecard(id)
);

CREATE TABLE conversation_scorecard (
    id text,
    conversation_id text,
    user_id text,
    average_score text,
    rate_time text,
    rater_display_name text,
    rater_email text,
    rater_user_id text,
    scorecard_description text,
    scorecard_name text,
    PRIMARY KEY (id, conversation_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE engagement_survey_result (
    question_id text,
    engagement_id text,
    survey_id text,
    answer text,
    date_time text,
    file_url text,
    question_name text,
    question_order text,
    question_type text,
    PRIMARY KEY (question_id, engagement_id, survey_id),
    FOREIGN KEY (engagement_id) REFERENCES engagement_survey(engagement_id),
    FOREIGN KEY (survey_id) REFERENCES engagement_survey(survey_id)
);

CREATE TABLE engagement_survey (
    survey_id text,
    engagement_id text,
    flow_id text,
    queue_id text,
    flow_name text,
    queue_name text,
    survey_name text,
    survey_trigger_level text,
    PRIMARY KEY (survey_id, engagement_id),
    FOREIGN KEY (engagement_id) REFERENCES engagement(id),
    FOREIGN KEY (flow_id) REFERENCES engagement_flow(id),
    FOREIGN KEY (queue_id) REFERENCES engagement_queues(id)
);

CREATE TABLE engagement_channel (
    "index" text,
    engagement_id text,
    channel text,
    channel_source text,
    PRIMARY KEY ("index", engagement_id),
    FOREIGN KEY (engagement_id) REFERENCES engagement(id)
);

CREATE TABLE engagement_customer (
    id text,
    engagement_id text,
    consumer_display_name text,
    consumer_number text,
    PRIMARY KEY (id, engagement_id),
    FOREIGN KEY (engagement_id) REFERENCES engagement(id)
);

CREATE TABLE engagement_flow (
    id text,
    engagement_id text,
    flow_name text,
    flow_version text,
    PRIMARY KEY (id, engagement_id),
    FOREIGN KEY (engagement_id) REFERENCES engagement(id)
);

CREATE TABLE engagement_queues (
    id text,
    engagement_id text,
    queue_name text,
    PRIMARY KEY (id, engagement_id),
    FOREIGN KEY (engagement_id) REFERENCES engagement(id)
);

CREATE TABLE engagement_agent (
    engagement_id text,
    id text,
    display_name text,
    PRIMARY KEY (engagement_id, id),
    FOREIGN KEY (engagement_id) REFERENCES engagement(id),
    FOREIGN KEY (id) REFERENCES users(id)
);

CREATE TABLE engagement_event_skills (
    skill_category_id text,
    skill_id text,
    engagement_id text,
    skill_category_name text,
    skill_name text,
    skill_proficiency_level text,
    PRIMARY KEY (skill_category_id, skill_id, engagement_id),
    FOREIGN KEY (engagement_id) REFERENCES engagement(id)
);

CREATE TABLE engagement_event (
    _fivetran_id text,
    engagement_id text,
    transfer_to_user_id text,
    user_id text,
    accept_type text,
    cc_queue_id text,
    channel text,
    channel_source text,
    conference_type text,
    consumer_display_name text,
    consumer_id text,
    crm_call_status text,
    crm_type text,
    direction text,
    duration text,
    email_reply_bcc jsonb,
    email_reply_cc jsonb,
    email_reply_to jsonb,
    event_type text,
    flow_id text,
    flow_name text,
    inbox_id text,
    inbox_name text,
    invitee text,
    invitee_type text,
    queue_name text,
    start_time text,
    supervisor_display_name text,
    supervisor_id text,
    transfer_to_cc_queue_id text,
    transfer_to_flow_id text,
    transfer_to_flow_name text,
    transfer_to_number text,
    transfer_to_queue_name text,
    transfer_to_user_display_name text,
    transfer_type text,
    upgraded_to_channel_type text,
    user_display_name text,
    PRIMARY KEY (_fivetran_id, engagement_id),
    FOREIGN KEY (engagement_id) REFERENCES engagement(id),
    FOREIGN KEY (transfer_to_user_id) REFERENCES users(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE engagement_disposition (
    engagement_id text,
    id text,
    disposition_name text,
    PRIMARY KEY (engagement_id, id),
    FOREIGN KEY (engagement_id) REFERENCES engagement(id),
    FOREIGN KEY (id) REFERENCES disposition(id)
);

CREATE TABLE engagement_notes (
    id text,
    user_id text,
    engagement_id text,
    last_modified_time text,
    note text,
    PRIMARY KEY (id, user_id, engagement_id),
    FOREIGN KEY (engagement_id) REFERENCES engagement(id)
);

CREATE TABLE engagement (
    id text,
    channel_types text,
    direction text,
    duration text,
    end_time text,
    flow_duration text,
    handling_duration text,
    queue_wait_type text,
    start_time text,
    survey_id text,
    talk_duration text,
    transcript_url text,
    transfer_count text,
    voice_mail text,
    waiting_duration text,
    wrap_up_duration text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES engagement(id)
);
