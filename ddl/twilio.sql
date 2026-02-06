CREATE TABLE participant (
    id text,
    account_id text,
    chat_service_id text,
    conversation_id text,
    role_id text,
    attributes text,
    created_at timestamp,
    last_read_message_index integer,
    last_read_timestamp timestamp,
    participant_identity text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account_history(id),
    FOREIGN KEY (chat_service_id) REFERENCES service(id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id),
    FOREIGN KEY (role_id) REFERENCES "role"(id)
);

CREATE TABLE "call" (
    id text,
    account_id text,
    outgoing_caller_id text,
    parent_call_id text,
    trunk_id text,
    annotation text,
    answered_by text,
    caller_name text,
    created_at timestamp,
    direction text,
    duration text,
    end_time timestamp,
    forwarded_from text,
    "from" text,
    from_formatted text,
    group_id text,
    price text,
    price_unit text,
    queue_time text,
    start_time timestamp,
    "status" text,
    "to" text,
    to_formatted text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account_history(id),
    FOREIGN KEY (outgoing_caller_id) REFERENCES outgoing_caller_id(id),
    FOREIGN KEY (parent_call_id) REFERENCES "call"(id),
    FOREIGN KEY (trunk_id) REFERENCES trunk(id)
);

CREATE TABLE usage_record (
    category text,
    end_date text,
    start_date text,
    account_id text,
    as_of timestamp,
    count text,
    count_unit text,
    description text,
    price text,
    price_unit text,
    usage text,
    usage_unit text,
    PRIMARY KEY (category, end_date, start_date, account_id),
    FOREIGN KEY (account_id) REFERENCES account_history(id)
);

CREATE TABLE coached_call (
    call_id text,
    coach_id text,
    PRIMARY KEY (call_id, coach_id),
    FOREIGN KEY (call_id) REFERENCES "call"(id),
    FOREIGN KEY (coach_id) REFERENCES conference_participant_extended(id)
);

CREATE TABLE verification_service (
    id text,
    account_id text,
    code_length integer,
    created_at timestamp,
    custom_code_enabled boolean,
    default_template_sid text,
    do_not_share_warning_enabled boolean,
    dtmf_input_required boolean,
    friendly_name text,
    lookup_enabled boolean,
    mailer_sid text,
    psd_2_enabled boolean,
    push_apn_credential_sid text,
    push_fcm_credential_sid text,
    push_include_date boolean,
    skip_sms_to_landlines boolean,
    tts_name text,
    updated_at timestamp,
    verify_event_subscription_enabled boolean,
    -- totp_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account_history(id)
);

CREATE TABLE execution (
    id text,
    flow_id text,
    contact_channel_address text,
    context jsonb,
    created_at timestamp,
    "status" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (flow_id) REFERENCES flow_history(id)
);

CREATE TABLE message (
    id text,
    account_id text,
    messaging_service_sid text,
    body text,
    created_at timestamp,
    date_sent timestamp,
    direction text,
    error_code text,
    error_message text,
    "from" text,
    num_media text,
    num_segments text,
    price text,
    price_unit text,
    "status" text,
    "to" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account_history(id),
    FOREIGN KEY (messaging_service_sid) REFERENCES messaging_service(id)
);

CREATE TABLE execution_step (
    id text,
    execution_id text,
    context jsonb,
    created_at timestamp,
    "name" text,
    transitioned_from text,
    transitioned_to text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (execution_id) REFERENCES execution(id)
);

CREATE TABLE conversation_message (
    id text,
    account_id text,
    conversation_id text,
    participant_id text,
    service_id text,
    author text,
    body text,
    created_at timestamp,
    "index" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account_history(id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id),
    FOREIGN KEY (participant_id) REFERENCES participant(id),
    FOREIGN KEY (service_id) REFERENCES service(id)
);

CREATE TABLE verification_attempt (
    id text,
    account_id text,
    service_id text,
    channel text,
    conversion_status text,
    created_at timestamp,
    price_currency text,
    price_value numeric,
    updated_at timestamp,
    verification_id text,
    -- channel_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account_history(id),
    FOREIGN KEY (service_id) REFERENCES verification_service(id)
);

CREATE TABLE messaging_service (
    id text,
    account_id text,
    area_code_geomatch boolean,
    created_at timestamp,
    fallback_method text,
    fallback_to_long_code boolean,
    fallback_url text,
    friendly_name text,
    inbound_method text,
    inbound_request_url text,
    mms_converter boolean,
    scan_message_content text,
    smart_encoding boolean,
    status_callback text,
    sticky_sender boolean,
    synchronous_validation boolean,
    updated_at timestamp,
    us_app_to_person_registered boolean,
    use_inbound_webhook_on_number boolean,
    usecase text,
    validity_period integer,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account_history(id)
);

CREATE TABLE "role" (
    id text,
    account_id text,
    chat_service_id text,
    created_at timestamp,
    friendly_name text,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account_history(id),
    FOREIGN KEY (chat_service_id) REFERENCES service(id)
);

CREATE TABLE service (
    id text,
    account_id text,
    created_at timestamp,
    friendly_name text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account_history(id)
);

CREATE TABLE conference_participant (
    call_id text,
    conference_id text,
    call_id_to_coach text,
    coaching boolean,
    created_at timestamp,
    end_conference_on_exit boolean,
    hold boolean,
    muted boolean,
    start_conference_on_enter boolean,
    "status" text,
    updated_at timestamp,
    PRIMARY KEY (call_id, conference_id),
    FOREIGN KEY (call_id) REFERENCES "call"(id),
    FOREIGN KEY (conference_id) REFERENCES conference(id),
    FOREIGN KEY (call_id_to_coach) REFERENCES conference_participant(call_id)
);

CREATE TABLE incoming_phone_number (
    id text,
    account_id text,
    address_id text,
    emergency_address_id text,
    trunk_id text,
    address_requirements text,
    beta boolean,
    capabilities_mms boolean,
    capabilities_sms boolean,
    capabilities_voice boolean,
    created_at timestamp,
    emergency_status text,
    friendly_name text,
    origin text,
    phone_number text,
    updated_at timestamp,
    voice_caller_id_lookup boolean,
    voice_url text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account_history(id),
    FOREIGN KEY (address_id) REFERENCES address(id),
    FOREIGN KEY (emergency_address_id) REFERENCES address(id),
    FOREIGN KEY (trunk_id) REFERENCES trunk(id)
);

CREATE TABLE trunk (
    id text,
    account_id text,
    auth_type text,
    auth_type_set jsonb,
    cnam_lookup_enabled boolean,
    created_at timestamp,
    domain_name text,
    friendly_name text,
    recording jsonb,
    secure boolean,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account_history(id)
);

CREATE TABLE conference (
    id text,
    created_at timestamp,
    friendly_name text,
    region text,
    "status" text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE address (
    id text,
    account_id text,
    city text,
    created_at timestamp,
    customer_name text,
    emergency_enabled boolean,
    friendly_name text,
    iso_country text,
    postal_code text,
    region text,
    street text,
    updated_at timestamp,
    validated boolean,
    verified boolean,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account_history(id)
);

CREATE TABLE receipt (
    id text,
    account_id text,
    conversation_id text,
    message_id text,
    participant_id text,
    service_id text,
    channel_message_id text,
    created_at timestamp,
    error_code integer,
    "status" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account_history(id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id),
    FOREIGN KEY (message_id) REFERENCES conversation_message(id),
    FOREIGN KEY (participant_id) REFERENCES participant(id),
    FOREIGN KEY (service_id) REFERENCES service(id)
);

CREATE TABLE account_history (
    id text,
    updated_at timestamp,
    owner_account_id text,
    created_at timestamp,
    friendly_name text,
    "status" text,
    "type" text,
    PRIMARY KEY (id, updated_at),
    FOREIGN KEY (owner_account_id) REFERENCES account_history(id)
);

CREATE TABLE conversation_user (
    id text,
    account_id text,
    chat_service_id text,
    role_id text,
    created_at timestamp,
    friendly_name text,
    is_notifiable boolean,
    is_online boolean,
    updated_at timestamp,
    user_identity text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account_history(id),
    FOREIGN KEY (chat_service_id) REFERENCES service(id),
    FOREIGN KEY (role_id) REFERENCES "role"(id)
);

CREATE TABLE flow_history (
    id text,
    updated_at timestamp,
    account_id text,
    created_at timestamp,
    friendly_name text,
    "status" text,
    version bigint,
    PRIMARY KEY (id, updated_at),
    FOREIGN KEY (account_id) REFERENCES account_history(id)
);

CREATE TABLE role_permission (
    permission text,
    role_id text,
    PRIMARY KEY (permission, role_id),
    FOREIGN KEY (role_id) REFERENCES "role"(id)
);

CREATE TABLE conversation (
    id text,
    account_id text,
    chat_service_id text,
    created_at timestamp,
    friendly_name text,
    messaging_service_id text,
    "state" text,
    unique_name text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account_history(id),
    FOREIGN KEY (chat_service_id) REFERENCES service(id)
);

CREATE TABLE outgoing_caller_id (
    id text,
    created_at timestamp,
    friendly_name text,
    phone_number text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE recording (
    id text,
    call_id text,
    conference_id text,
    api_version text,
    channels integer,
    created_at timestamp,
    duration text,
    error_code integer,
    price text,
    price_unit text,
    "source" text,
    start_time timestamp,
    "status" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (call_id) REFERENCES "call"(id),
    FOREIGN KEY (conference_id) REFERENCES conference(id)
);

CREATE TABLE conference_participant_extended (
    id text,
    call_id text,
    conference_id text,
    call_type text,
    end_conference_on_exit boolean,
    is_coach boolean,
    is_moderator boolean,
    label text,
    participant_region text,
    start_conference_on_enter boolean,
    PRIMARY KEY (id),
    FOREIGN KEY (call_id) REFERENCES "call"(id),
    FOREIGN KEY (conference_id) REFERENCES conference(id)
);
