CREATE TABLE call_ai_data_sales_dialer_moment (
    "index" text,
    call_ai_data_id text,
    call_moment text,
    PRIMARY KEY ("index", call_ai_data_id),
    FOREIGN KEY (call_ai_data_id) REFERENCES call_ai_data_sales_dialer(id)
);

CREATE TABLE call_ai_data_sales_dialer_transcription (
    "index" text,
    call_ai_data_id text,
    end_time text,
    sentence text,
    speaker_id text,
    speaker_name text,
    start_time text,
    PRIMARY KEY ("index", call_ai_data_id),
    FOREIGN KEY (call_ai_data_id) REFERENCES call_ai_data_sales_dialer(id)
);

CREATE TABLE call_ai_data_sales_dialer_tags (
    "index" text,
    call_ai_data_id text,
    tags text,
    PRIMARY KEY ("index", call_ai_data_id),
    FOREIGN KEY (call_ai_data_id) REFERENCES call_ai_data_sales_dialer(id)
);

CREATE TABLE call_ai_data_sales_dialer_smart_chapter (
    "index" text,
    call_ai_data_id text,
    overview jsonb,
    "section" text,
    PRIMARY KEY ("index", call_ai_data_id),
    FOREIGN KEY (call_ai_data_id) REFERENCES call_ai_data_sales_dialer(id)
);

CREATE TABLE call_ai_data_sales_dialer (
    id text,
    action_items text,
    call_score text,
    call_score_parameters_call_etiquette text,
    call_score_parameters_customer_sentiment_score text,
    call_score_parameters_de_escalation text,
    call_score_parameters_dead_air_time text,
    call_score_parameters_empathy text,
    call_score_parameters_filler_word text,
    call_score_parameters_greetings text,
    call_score_parameters_monologue_duration text,
    call_score_parameters_talk_listen_ratio text,
    call_score_parameters_words_per_minute text,
    call_summary text,
    customer_sentiment text,
    interaction_stats_agent_speak_time text,
    interaction_stats_customer_speak_time text,
    interaction_stats_customer_story_duration text,
    interaction_stats_dead_air_time text,
    interaction_stats_interactivity_count text,
    interaction_stats_monologue_duration text,
    manual_call_score text,
    platform text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES "call"(id)
);

CREATE TABLE sale_dialer_campaign (
    id text,
    default_number text,
    "name" text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE sales_dialer_analytics (
    agent_id text,
    abandoned_calls text,
    agent_email text,
    agent_name text,
    agent_success_rate text,
    answered_calls text,
    available_time_in_campaign text,
    average_call_duration text,
    campaigns_run text,
    connection_rate text,
    dialed_calls text,
    max_call_duration text,
    pause_time text,
    total_after_call_work text,
    total_call_duration text,
    total_cost_incurred text,
    total_unanswered_calls text,
    total_voicemails_drops text,
    PRIMARY KEY (agent_id),
    FOREIGN KEY (agent_id) REFERENCES users(id)
);

CREATE TABLE analytics_daily (
    _fivetran_id text,
    analytics_agent_id text,
    "day" text,
    greaterthan_6_0 text,
    inbound text,
    inbound_minutes text,
    missed text,
    outbound text,
    outbound_minutes text,
    uniqueinbound text,
    uniqueoutbound text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (analytics_agent_id) REFERENCES users(id)
);

CREATE TABLE analytics (
    agent_id text,
    "name" text,
    summary_inbound_minutes text,
    summary_outbound_minutes text,
    summary_total_inbound text,
    summary_total_outbound text,
    PRIMARY KEY (agent_id),
    FOREIGN KEY (agent_id) REFERENCES users(id)
);

CREATE TABLE contact_custom_field (
    "index" text,
    contact_id text,
    "key" text,
    label text,
    "type" text,
    "value" text,
    PRIMARY KEY ("index", contact_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE contact (
    id text,
    address text,
    birthday text,
    created_at timestamp,
    email text,
    "name" text,
    occupation text,
    phone_number text,
    "status" text,
    status_updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE text_mms (
    _fivetran_id text,
    text_id text,
    content_type text,
    media_url text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (text_id) REFERENCES text(id)
);

CREATE TABLE text (
    id text,
    agent_id text,
    justcall_number text,
    client_number text,
    contact_email text,
    contact_name text,
    contact_number text,
    cost_incurred text,
    datetime text,
    delivery_status text,
    direction text,
    is_deleted text,
    justcall_line_name text,
    medium text,
    sms_date text,
    sms_info_body text,
    sms_info_is_mms text,
    sms_time text,
    sms_user_date text,
    sms_user_time text,
    PRIMARY KEY (id),
    FOREIGN KEY (agent_id) REFERENCES users(id),
    FOREIGN KEY (justcall_number) REFERENCES phone_number(id)
);

CREATE TABLE sales_dialer_call_ai_moment (
    "index" text,
    sales_dialer_call_id text,
    sales_dialer_call_sid text,
    call_moment text,
    PRIMARY KEY ("index", sales_dialer_call_id, sales_dialer_call_sid),
    FOREIGN KEY (sales_dialer_call_id) REFERENCES sales_dialer_call(call_id),
    FOREIGN KEY (sales_dialer_call_sid) REFERENCES sales_dialer_call(call_sid)
);

CREATE TABLE sales_dialer_call_ai_tag (
    "index" text,
    sales_dialer_call_id text,
    sales_dialer_call_sid text,
    tags text,
    PRIMARY KEY ("index", sales_dialer_call_id, sales_dialer_call_sid),
    FOREIGN KEY (sales_dialer_call_id) REFERENCES sales_dialer_call(call_id),
    FOREIGN KEY (sales_dialer_call_sid) REFERENCES sales_dialer_call(call_sid)
);

CREATE TABLE sales_dialer_call (
    call_id text,
    call_sid text,
    agent_id text,
    campaign_id text,
    contact_id text,
    call_date text,
    call_info_call_answered_by text,
    call_info_cost_incurred text,
    call_info_direction text,
    call_info_disposition text,
    call_info_duration text,
    call_info_friendly_duration text,
    call_info_notes text,
    call_info_rating text,
    call_info_reattempt_number text,
    call_info_recording text,
    call_info_type text,
    call_time text,
    call_user_date text,
    call_user_time text,
    justcall_ai_call_score text,
    justcall_ai_call_score_parameters_call_etiquette text,
    justcall_ai_call_score_parameters_customer_sentiment_score text,
    justcall_ai_call_score_parameters_de_escalation text,
    justcall_ai_call_score_parameters_dead_air_time text,
    justcall_ai_call_score_parameters_empathy text,
    justcall_ai_call_score_parameters_filler_word text,
    justcall_ai_call_score_parameters_greeting text,
    justcall_ai_call_score_parameters_monologue_duration text,
    justcall_ai_call_score_parameters_talk_listen_ratio text,
    justcall_ai_call_score_parameters_words_per_minute text,
    justcall_ai_call_summary text,
    justcall_ai_customer_sentiment text,
    justcall_ai_manual_call_score text,
    sales_dialer_number text,
    PRIMARY KEY (call_id, call_sid),
    FOREIGN KEY (agent_id) REFERENCES users(id),
    FOREIGN KEY (campaign_id) REFERENCES sale_dialer_campaign(id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE groups (
    id text,
    extension text,
    "name" text,
    total_members text,
    updated_on text,
    PRIMARY KEY (id)
);

CREATE TABLE user_group (
    group_id text,
    user_id text,
    PRIMARY KEY (group_id, user_id),
    FOREIGN KEY (group_id) REFERENCES groups(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE user_owned_number (
    "index" text,
    user_id text,
    owned_number text,
    PRIMARY KEY ("index", user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE user_shared_number (
    "index" text,
    user_id text,
    shared_number text,
    PRIMARY KEY ("index", user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    available text,
    created_at text,
    email text,
    extention text,
    last_login_timestamp text,
    "name" text,
    on_call text,
    "role" text,
    timezone text,
    unavailability_reason text,
    working_hours_type text,
    PRIMARY KEY (id)
);

CREATE TABLE call_info_trait (
    "index" text,
    call_id text,
    call_trait text,
    PRIMARY KEY ("index", call_id),
    FOREIGN KEY (call_id) REFERENCES "call"(id)
);

CREATE TABLE "call" (
    id text,
    agent_id text,
    justcall_number text,
    agent_active text,
    call_date text,
    call_duration_conversation_time text,
    call_duration_friendly_duration text,
    call_duration_handle_time text,
    call_duration_hold_time text,
    call_duration_queue_wait_time text,
    call_duration_ring_time text,
    call_duration_total_duration text,
    call_duration_wrap_up_time text,
    call_info_direction text,
    call_info_disposition text,
    call_info_missed_call_reason text,
    call_info_notes text,
    call_info_rating text,
    call_info_recording text,
    call_info_recording_child text,
    call_info_status text,
    call_info_type text,
    call_info_voicemail_transcription text,
    call_sid text,
    call_time text,
    call_user_date text,
    call_user_time text,
    contact_email text,
    contact_name text,
    contact_number text,
    cost_incurred text,
    forward_info_datetime text,
    forward_info_from_number text,
    forward_info_to_number text,
    ivr_info_content text,
    ivr_info_digit_pressed text,
    justcall_line_name text,
    queue_callback_attempted text,
    queue_callback_attempted_time text,
    queue_callback_reached text,
    queue_callback_reached_duration text,
    queue_callback_reached_time text,
    queue_callback_requested text,
    queue_callback_requested_time text,
    queue_callback_status text,
    queue_callback_wait_duration text,
    queue_entered_at_position text,
    queue_exit_reason text,
    PRIMARY KEY (id),
    FOREIGN KEY (agent_id) REFERENCES users(id),
    FOREIGN KEY (justcall_number) REFERENCES phone_number(id)
);

CREATE TABLE thread_tag (
    id text,
    thread_id text,
    thread_phone_id text,
    colour text,
    "name" text,
    PRIMARY KEY (id, thread_id, thread_phone_id),
    FOREIGN KEY (thread_id) REFERENCES thread(id),
    FOREIGN KEY (thread_phone_id) REFERENCES thread(phone_id)
);

CREATE TABLE recent_message_mms (
    "index" text,
    thread_id text,
    thread_phone_id text,
    content_type text,
    media_url text,
    PRIMARY KEY ("index", thread_id, thread_phone_id),
    FOREIGN KEY (thread_id) REFERENCES thread(id),
    FOREIGN KEY (thread_phone_id) REFERENCES thread(phone_id)
);

CREATE TABLE thread (
    id text,
    phone_id text,
    contact_id text,
    recent_message_body text,
    recent_message_datetime text,
    recent_message_direction text,
    recent_message_id text,
    recent_message_is_mms text,
    recent_message_readstatus text,
    PRIMARY KEY (id, phone_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE call_ai_data_justcall_moment (
    "index" text,
    call_ai_data_id text,
    call_moment text,
    PRIMARY KEY ("index", call_ai_data_id),
    FOREIGN KEY (call_ai_data_id) REFERENCES call_ai_data_justcall(id)
);

CREATE TABLE call_ai_data_justcall_transcription (
    "index" text,
    call_ai_data_id text,
    end_time text,
    sentence text,
    speaker_id text,
    speaker_name text,
    start_time text,
    PRIMARY KEY ("index", call_ai_data_id),
    FOREIGN KEY (call_ai_data_id) REFERENCES call_ai_data_justcall(id)
);

CREATE TABLE call_ai_data_justcall_tags (
    "index" text,
    call_ai_data_id text,
    tags text,
    PRIMARY KEY ("index", call_ai_data_id),
    FOREIGN KEY (call_ai_data_id) REFERENCES call_ai_data_justcall(id)
);

CREATE TABLE call_ai_data_justcall_smart_chapter (
    "index" text,
    call_ai_data_id text,
    overview jsonb,
    "section" text,
    PRIMARY KEY ("index", call_ai_data_id),
    FOREIGN KEY (call_ai_data_id) REFERENCES call_ai_data_justcall(id)
);

CREATE TABLE call_ai_data_justcall (
    id text,
    action_items text,
    call_score text,
    call_score_parameters_call_etiquette text,
    call_score_parameters_customer_sentiment_score text,
    call_score_parameters_de_escalation text,
    call_score_parameters_dead_air_time text,
    call_score_parameters_empathy text,
    call_score_parameters_filler_word text,
    call_score_parameters_greetings text,
    call_score_parameters_monologue_duration text,
    call_score_parameters_talk_listen_ratio text,
    call_score_parameters_words_per_minute text,
    call_summary text,
    customer_sentiment text,
    interaction_stats_agent_speak_time text,
    interaction_stats_customer_speak_time text,
    interaction_stats_customer_story_duration text,
    interaction_stats_dead_air_time text,
    interaction_stats_interactivity_count text,
    interaction_stats_monologue_duration text,
    manual_call_score text,
    platform text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES "call"(id)
);

CREATE TABLE text_tag (
    id text,
    created_by_agent_id text,
    color_code text,
    created_at text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_agent_id) REFERENCES users(id)
);

CREATE TABLE phone_number_user_group (
    "index" text,
    phone_number_id text,
    group_id text,
    PRIMARY KEY ("index", phone_number_id),
    FOREIGN KEY (phone_number_id) REFERENCES phone_number(id),
    FOREIGN KEY (group_id) REFERENCES groups(id)
);

CREATE TABLE phone_number_team_member (
    "index" text,
    phone_number_id text,
    email text,
    id text,
    "name" text,
    PRIMARY KEY ("index", phone_number_id),
    FOREIGN KEY (phone_number_id) REFERENCES phone_number(id)
);

CREATE TABLE phone_number (
    id text,
    number_owner_id text,
    availability_setting text,
    business_registration text,
    capabilities_call text,
    capabilities_mms text,
    capabilities_sms text,
    current_status text,
    friendly_number text,
    justcall_line_name text,
    justcall_number text,
    number_type text,
    sms_compliance text,
    PRIMARY KEY (id),
    FOREIGN KEY (number_owner_id) REFERENCES users(id)
);
