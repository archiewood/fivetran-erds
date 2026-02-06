CREATE TABLE conversation_form (
    id text,
    created_at text,
    form_fields text,
    is_default text,
    is_enabled text,
    title text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE "trigger" (
    id text,
    conversation_form_id text,
    expression_neq_queue text,
    form_id text,
    is_enabled text,
    order_index text,
    times_triggered text,
    title text,
    PRIMARY KEY (id),
    FOREIGN KEY (conversation_form_id) REFERENCES conversation_form(id)
);

CREATE TABLE disposition_field_name (
    disposition_form_id text,
    field_id text,
    disposition_id text,
    disposition_value text,
    PRIMARY KEY (disposition_form_id, field_id),
    FOREIGN KEY (disposition_form_id) REFERENCES disposition(form_id),
    FOREIGN KEY (field_id) REFERENCES field(id)
);

CREATE TABLE disposition (
    form_id text,
    conversation_form_id text,
    conversation_id text,
    PRIMARY KEY (form_id),
    FOREIGN KEY (conversation_form_id) REFERENCES conversation_form(id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id)
);

CREATE TABLE agent (
    id text,
    availability text,
    created_at text,
    display_name text,
    enabled text,
    "role" text,
    "status" text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE waiting_strategy_client_type (
    client_types text,
    waiting_strategy_id text,
    PRIMARY KEY (client_types, waiting_strategy_id),
    FOREIGN KEY (waiting_strategy_id) REFERENCES waiting_strategy(id)
);

CREATE TABLE waiting_strategy (
    id text,
    announcement_message_audio_source_type text,
    announcement_message_enabled text,
    announcement_message_repeat_interval_unit text,
    announcement_message_repeat_interval_value text,
    announcement_message_tts_audio_source_languages text,
    announcement_message_tts_audio_source_speech_rate text,
    announcement_message_tts_audio_source_text text,
    announcement_message_tts_audio_source_voice_gender text,
    announcement_message_tts_audio_source_voice_name text,
    applications jsonb,
    created_at text,
    did_numbers jsonb,
    greeting_message_audio_source_type text,
    greeting_message_enabled text,
    greeting_message_tts_audio_source_languages text,
    greeting_message_tts_audio_source_speech_rate text,
    greeting_message_tts_audio_source_text text,
    greeting_message_tts_audio_source_voice_gender text,
    greeting_message_tts_audio_source_voice_name text,
    maximum_wait_time_message_audio_source_type text,
    maximum_wait_time_message_enabled text,
    maximum_wait_time_message_tts_audio_source_languages text,
    maximum_wait_time_message_tts_audio_source_speech_rate text,
    maximum_wait_time_message_tts_audio_source_text text,
    maximum_wait_time_message_tts_audio_source_voice_gender text,
    maximum_wait_time_message_tts_audio_source_voice_name text,
    maximum_wait_time_unit text,
    maximum_wait_time_value text,
    music_on_hold_enabled text,
    "name" text,
    updated_at text,
    version text,
    PRIMARY KEY (id)
);

CREATE TABLE message (
    id text,
    conversation_id text,
    channel text,
    content_text text,
    content_type text,
    created_at text,
    direction text,
    froms text,
    single_send_message jsonb,
    tos text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id)
);

CREATE TABLE note (
    id text,
    agent_id text,
    conversation_id text,
    content text,
    created_at text,
    "type" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (agent_id) REFERENCES agent(id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id)
);

CREATE TABLE routings (
    id text,
    queue_id text,
    created_at text,
    enabled text,
    expresssion jsonb,
    "name" text,
    orders text,
    priority text,
    queue_name text,
    route_only_during_working_hours text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (queue_id) REFERENCES queue(id)
);

CREATE TABLE hold_config_queue (
    hold_config_id text,
    queue_id text,
    PRIMARY KEY (hold_config_id, queue_id),
    FOREIGN KEY (hold_config_id) REFERENCES hold_config(id),
    FOREIGN KEY (queue_id) REFERENCES queue(id)
);

CREATE TABLE hold_config (
    id text,
    announcement_message_audio_source_type text,
    announcement_message_duration_unit text,
    announcement_message_duration_value text,
    announcement_message_file_audio_source_file_descriptor text,
    announcement_message_tts_audio_source_file_descriptor text,
    announcement_message_tts_audio_source_languages text,
    announcement_message_tts_audio_source_speech_rate text,
    announcement_message_tts_audio_source_text text,
    announcement_message_tts_audio_source_voice_gender text,
    announcement_message_tts_audio_source_voice_name text,
    created_at text,
    defaults text,
    enabled text,
    "name" text,
    on_hold_music_enabled text,
    on_hold_music_file_audio_source_file_descriptor text,
    on_hold_music_use_default text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE agent_wrap_up (
    _fivetran_id text,
    agent_id text,
    is_active text,
    wrap_up_seconds text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (agent_id) REFERENCES agent(id)
);

CREATE TABLE person_email (
    address text,
    person_id text,
    PRIMARY KEY (address, person_id),
    FOREIGN KEY (person_id) REFERENCES person(id)
);

CREATE TABLE person_phone (
    number text,
    person_id text,
    PRIMARY KEY (number, person_id),
    FOREIGN KEY (person_id) REFERENCES person(id)
);

CREATE TABLE person_push (
    application_id text,
    person_id text,
    additional_data_birthdate text,
    additional_data_email text,
    additional_data_first_name text,
    additional_data_gender text,
    additional_data_last_name text,
    additional_data_middle_name text,
    registration_id text,
    -- system_data_* (dynamic column),
    PRIMARY KEY (application_id, person_id),
    FOREIGN KEY (person_id) REFERENCES person(id)
);

CREATE TABLE person_shopping_cart_list (
    _fivetran_id text,
    person_id text,
    product_category text,
    product_image text,
    product_name text,
    product_price text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (person_id) REFERENCES person(id)
);

CREATE TABLE person (
    id text,
    address text,
    birth_date text,
    city text,
    company_id text,
    country text,
    created_at text,
    external_id text,
    first_name text,
    gender text,
    last_name text,
    middle_name text,
    modified_at text,
    modified_from text,
    origin text,
    profile_picture text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES company(id)
);

CREATE TABLE person_social_account (
    application_id text,
    person_id text,
    "type" text,
    user_id text,
    -- system_data_* (dynamic column),
    PRIMARY KEY (application_id, person_id),
    FOREIGN KEY (person_id) REFERENCES person(id)
);

CREATE TABLE bot (
    id text,
    channel text,
    destination text,
    display_name text,
    enabled text,
    message_persistence_policy text,
    session_timeout_in_sec text,
    webhook_event_headers jsonb,
    webhook_event_url text,
    webhook_url text,
    PRIMARY KEY (id)
);

CREATE TABLE field_operator (
    operator_name text,
    field_id text,
    PRIMARY KEY (operator_name, field_id),
    FOREIGN KEY (field_id) REFERENCES field(id)
);

CREATE TABLE field_options (
    option_name text,
    field_id text,
    PRIMARY KEY (option_name, field_id),
    FOREIGN KEY (field_id) REFERENCES field(id)
);

CREATE TABLE field (
    id text,
    created_at text,
    is_default boolean,
    is_enabled text,
    regex text,
    title text,
    "type" text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE agent_conversation (
    id text,
    agent_id text,
    queue_id text,
    closed_at text,
    created_at text,
    pending_since text,
    priority text,
    "status" text,
    summary text,
    topic text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (agent_id) REFERENCES agent(id),
    FOREIGN KEY (queue_id) REFERENCES queue(id)
);

CREATE TABLE account_wrap_up (
    _fivetran_id text,
    is_active text,
    wrap_up_seconds text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE queue (
    id text,
    working_hours_id text,
    created_at text,
    deleted_at text,
    enabled_agents_count text,
    enabled_routes_count text,
    is_auto_assignment_enabled text,
    is_sticky_auto_assignment_enabled text,
    "name" text,
    sticky_agent_timeout_days text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (working_hours_id) REFERENCES working_hour(id)
);

CREATE TABLE company_domain (
    domain_name text,
    company_id text,
    PRIMARY KEY (domain_name, company_id),
    FOREIGN KEY (company_id) REFERENCES company(id)
);

CREATE TABLE company (
    id text,
    account_manager text,
    country text,
    created_at text,
    custom_attributes_contract_expiry text,
    customer_stage text,
    industry text,
    modified_at text,
    modified_from text,
    "name" text,
    notes text,
    origin text,
    region text,
    segment text,
    service_data jsonb,
    vat_number text,
    PRIMARY KEY (id)
);

CREATE TABLE eligible_queue (
    _fivetran_id text,
    queue_id text,
    active text,
    auto_assignment_enabled text,
    queue_name text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (queue_id) REFERENCES queue(id)
);

CREATE TABLE agent_recording (
    agent_id text,
    id text,
    enabled text,
    enabled_changed_at text,
    inbound text,
    media_type text,
    outbound text,
    use_default text,
    PRIMARY KEY (agent_id),
    FOREIGN KEY (id) REFERENCES agent(id)
);

CREATE TABLE account_recording (
    _fivetran_id text,
    enabled text,
    enabled_changed_at text,
    inbound text,
    media_type text,
    outbound text,
    video_download_preparation text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE working_hour (
    id text,
    close_conversations text,
    enabled text,
    holidays jsonb,
    is_default text,
    message text,
    "name" text,
    timezone text,
    work_week jsonb,
    PRIMARY KEY (id)
);

CREATE TABLE conversation (
    id text,
    agent_id text,
    queue_id text,
    closed_at text,
    created_at text,
    pending_since text,
    priority text,
    "status" text,
    summary text,
    topic text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (agent_id) REFERENCES agent(id),
    FOREIGN KEY (queue_id) REFERENCES queue(id)
);
