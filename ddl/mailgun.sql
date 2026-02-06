CREATE TABLE route_action (
    "action" text,
    route_id text,
    PRIMARY KEY ("action", route_id),
    FOREIGN KEY (route_id) REFERENCES route(id)
);

CREATE TABLE route (
    id text,
    created_at text,
    description text,
    expression text,
    priority text,
    PRIMARY KEY (id)
);

CREATE TABLE receiving_dns_record (
    _fivetran_id text,
    domain_id text,
    cached text,
    priority text,
    record_type text,
    valid text,
    "value" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (domain_id) REFERENCES domain(id)
);

CREATE TABLE sending_dns_record (
    _fivetran_id text,
    domain_id text,
    cached text,
    "name" text,
    record_type text,
    valid text,
    "value" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (domain_id) REFERENCES domain(id)
);

CREATE TABLE domain (
    id text,
    created_at text,
    is_disabled text,
    "name" text,
    require_tls text,
    skip_verification text,
    smtp_login text,
    spam_action text,
    "state" text,
    "type" text,
    web_prefix text,
    web_scheme text,
    wildcard text,
    PRIMARY KEY (id)
);

CREATE TABLE blocklist_event (
    _fivetran_id text,
    blocklist text,
    event text,
    ip text,
    ip_pool text,
    timestamps text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE rejected_event_tag (
    "index" text,
    event_id text,
    tags text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES rejected_event(id)
);

CREATE TABLE rejected_event_message_attachment (
    "index" text,
    event_id text,
    content_type text,
    filename text,
    "size" text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES rejected_event(id)
);

CREATE TABLE rejected_event (
    id text,
    domain_id text,
    campaigns jsonb,
    event_type text,
    flags_is_test_mode text,
    log_level text,
    message_from text,
    message_message_id text,
    message_size text,
    message_subject text,
    message_to text,
    method text,
    originating_ip text,
    recipient text,
    recipient_domain text,
    reject_description text,
    reject_reason text,
    timestamps text,
    user_variables_org_id text,
    user_variables_silo_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (domain_id) REFERENCES domain(id)
);

CREATE TABLE spam_trap_count (
    ends text,
    "start" text,
    "date" text,
    pristine text,
    recycled text,
    total text,
    typo text,
    PRIMARY KEY (ends, "start")
);

CREATE TABLE delivered_event_tag (
    "index" text,
    event_id text,
    tags text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES delivered_event(id)
);

CREATE TABLE delivered_event_message_attachment (
    "index" text,
    event_id text,
    content_type text,
    filename text,
    "size" text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES delivered_event(id)
);

CREATE TABLE delivered_event (
    id text,
    domain_id text,
    campaigns jsonb,
    delivery_status_attempt_no text,
    delivery_status_certificate_verified text,
    delivery_status_code text,
    delivery_status_description text,
    delivery_status_enhanced_code text,
    delivery_status_message text,
    delivery_status_mx_host text,
    delivery_status_session_seconds text,
    delivery_status_tls text,
    delivery_status_utf_8 text,
    envelope_sender text,
    envelope_sending_ip text,
    envelope_targets text,
    envelope_transport text,
    event_type text,
    flags_is_authenticated text,
    flags_is_routed text,
    flags_is_system_test text,
    flags_is_test_mode text,
    log_level text,
    message_from text,
    message_message_id text,
    message_size text,
    message_subject text,
    message_to text,
    method text,
    originating_ip text,
    recipient text,
    recipient_domain text,
    storage_env text,
    storage_key text,
    storage_region text,
    storage_url text,
    timestamps text,
    user_variables_org_id text,
    user_variables_silo_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (domain_id) REFERENCES domain(id)
);

CREATE TABLE complained_event_tag (
    "index" text,
    event_id text,
    tags text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES complained_event(id)
);

CREATE TABLE complained_event_message_attachment (
    "index" text,
    event_id text,
    content_type text,
    filename text,
    "size" text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES complained_event(id)
);

CREATE TABLE complained_event (
    id text,
    domain_id text,
    campaigns jsonb,
    event_type text,
    flags_is_authenticated text,
    flags_is_routed text,
    flags_is_system_test text,
    flags_is_test_mode text,
    log_level text,
    message_from text,
    message_message_id text,
    message_size text,
    message_subject text,
    message_to text,
    recipient text,
    recipient_domain text,
    timestamps text,
    user_variables_org_id text,
    user_variables_silo_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (domain_id) REFERENCES domain(id)
);

CREATE TABLE mailing_list (
    email text,
    access_level text,
    created_at text,
    description text,
    members_count text,
    "name" text,
    reply_preference text,
    PRIMARY KEY (email)
);

CREATE TABLE template (
    id text,
    domain_id text,
    created_at text,
    created_by text,
    description text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (domain_id) REFERENCES domain(id)
);

CREATE TABLE inbox_ready_domain (
    _fivetran_id text,
    created_at text,
    id text,
    "name" text,
    spam_trap_monitoring text,
    "status" text,
    txt_record text,
    verified_at text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE whitelist (
    _fivetran_id text,
    domain_id text,
    created_at text,
    reason text,
    "type" text,
    "value" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (domain_id) REFERENCES domain(id)
);

CREATE TABLE failed_event_tag (
    "index" text,
    event_id text,
    tags text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES failed_event(id)
);

CREATE TABLE failed_event_message_attachment (
    "index" text,
    event_id text,
    content_type text,
    filename text,
    "size" text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES failed_event(id)
);

CREATE TABLE failed_event (
    id text,
    domain_id text,
    campaigns jsonb,
    delivery_status_attempt_no text,
    delivery_status_certificate_verified text,
    delivery_status_code text,
    delivery_status_description text,
    delivery_status_enhanced_code text,
    delivery_status_message text,
    delivery_status_mx_host text,
    delivery_status_session_seconds text,
    delivery_status_tls text,
    delivery_status_utf_8 text,
    envelope_sender text,
    envelope_sending_ip text,
    envelope_targets text,
    envelope_transport text,
    event_type text,
    flags_is_authenticated text,
    flags_is_routed text,
    flags_is_system_test text,
    flags_is_test_mode text,
    log_level text,
    message_from text,
    message_message_id text,
    message_size text,
    message_subject text,
    message_to text,
    method text,
    originating_ip text,
    reason text,
    recipient text,
    recipient_domain text,
    severity text,
    storage_env text,
    storage_key text,
    storage_region text,
    storage_url text,
    template_name text,
    timestamps text,
    user_variables_org_id text,
    user_variables_silo_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (domain_id) REFERENCES domain(id)
);

CREATE TABLE bounce (
    email text,
    domain_id text,
    code text,
    created_at text,
    error text,
    PRIMARY KEY (email, domain_id),
    FOREIGN KEY (domain_id) REFERENCES domain(id)
);

CREATE TABLE accepted_event_tag (
    "index" text,
    event_id text,
    tags text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES accepted_event(id)
);

CREATE TABLE accepted_event_message_attachment (
    "index" text,
    event_id text,
    content_type text,
    filename text,
    "size" text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES accepted_event(id)
);

CREATE TABLE accepted_event_message_recipient (
    "index" text,
    event_id text,
    recipient text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES accepted_event(id)
);

CREATE TABLE accepted_event_route (
    id text,
    event_id text,
    expression text,
    match_recipient text,
    PRIMARY KEY (id, event_id),
    FOREIGN KEY (event_id) REFERENCES accepted_event(id)
);

CREATE TABLE accepted_event (
    id text,
    domain_id text,
    campaigns jsonb,
    envelope_sender text,
    envelope_targets text,
    envelope_transport text,
    event_type text,
    flags_is_authenticated text,
    flags_is_test_mode text,
    log_level text,
    message_from text,
    message_message_id text,
    message_size text,
    message_subject text,
    message_to text,
    method text,
    originating_ip text,
    recipient text,
    recipient_domain text,
    storage_env text,
    storage_key text,
    storage_region text,
    storage_url text,
    timestamps text,
    user_variables_org_id text,
    user_variables_silo_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (domain_id) REFERENCES domain(id)
);

CREATE TABLE clicked_event_tag (
    "index" text,
    event_id text,
    tags text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES clicked_event(id)
);

CREATE TABLE clicked_event (
    id text,
    domain_id text,
    campaigns jsonb,
    client_info_client_name text,
    client_info_client_os text,
    client_info_client_type text,
    client_info_device_type text,
    client_info_user_agent text,
    event_type text,
    geolocation_city text,
    geolocation_country text,
    geolocation_region text,
    geolocation_sending_ip text,
    log_level text,
    message_from text,
    message_message_id text,
    message_size text,
    message_subject text,
    message_to text,
    recipient text,
    recipient_domain text,
    timestamps text,
    url text,
    user_variables_org_id text,
    user_variables_silo_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (domain_id) REFERENCES domain(id)
);

CREATE TABLE unsubsrcibed_event_tag (
    "index" text,
    event_id text,
    tags text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES unsubsrcibed_event(id)
);

CREATE TABLE unsubsrcibed_event (
    id text,
    domain_id text,
    campaigns jsonb,
    client_info_client_name text,
    client_info_client_os text,
    client_info_client_type text,
    client_info_device_type text,
    client_info_user_agent text,
    event_type text,
    geolocation_city text,
    geolocation_country text,
    geolocation_region text,
    geolocation_sending_ip text,
    ip text,
    log_level text,
    message_from text,
    message_message_id text,
    message_size text,
    message_subject text,
    message_to text,
    recipient text,
    recipient_domain text,
    timestamps text,
    user_variables_org_id text,
    user_variables_silo_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (domain_id) REFERENCES domain(id)
);

CREATE TABLE seed_list_result (
    result_id text,
    seed_list_id text,
    sender text,
    subject text,
    PRIMARY KEY (result_id, seed_list_id),
    FOREIGN KEY (seed_list_id) REFERENCES seed_list(id)
);

CREATE TABLE seed_list_sending_domain (
    domain_id text,
    seed_list_id text,
    PRIMARY KEY (domain_id, seed_list_id),
    FOREIGN KEY (domain_id) REFERENCES domain(id),
    FOREIGN KEY (seed_list_id) REFERENCES seed_list(id)
);

CREATE TABLE seed_list (
    id text,
    created_at text,
    delivery_stats_all_delivered text,
    delivery_stats_all_inbox text,
    delivery_stats_all_missing text,
    delivery_stats_all_pending text,
    delivery_stats_all_provider text,
    delivery_stats_all_spam text,
    delivery_stats_all_total text,
    delivery_stats_gmail_com_delivered text,
    delivery_stats_gmail_com_inbox text,
    delivery_stats_gmail_com_missing text,
    delivery_stats_gmail_com_pending text,
    delivery_stats_gmail_com_provider text,
    delivery_stats_gmail_com_spam text,
    delivery_stats_gmail_com_total text,
    delivery_stats_yahoo_com_delivered text,
    delivery_stats_yahoo_com_inbox text,
    delivery_stats_yahoo_com_missing text,
    delivery_stats_yahoo_com_pending text,
    delivery_stats_yahoo_com_provider text,
    delivery_stats_yahoo_com_spam text,
    delivery_stats_yahoo_com_total text,
    has_result text,
    is_auto_generated text,
    last_result_at text,
    mailing_list text,
    "name" text,
    seed_filter text,
    tags jsonb,
    target_email text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE complaint (
    _fivetran_id text,
    domain_id text,
    created_at text,
    email text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (domain_id) REFERENCES domain(id)
);

CREATE TABLE opened_event_tag (
    "index" text,
    event_id text,
    tags text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES opened_event(id)
);

CREATE TABLE opened_event (
    id text,
    domain_id text,
    campaigns jsonb,
    client_info_bot text,
    client_info_client_name text,
    client_info_client_os text,
    client_info_client_type text,
    client_info_device_type text,
    client_info_user_agent text,
    event_type text,
    geolocation_city text,
    geolocation_country text,
    geolocation_region text,
    geolocation_sending_ip text,
    ip text,
    log_level text,
    message_from text,
    message_message_id text,
    message_size text,
    message_subject text,
    message_to text,
    recipient text,
    recipient_domain text,
    timestamps text,
    user_variables_org_id text,
    user_variables_silo_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (domain_id) REFERENCES domain(id)
);

CREATE TABLE stored_event_tag (
    "index" text,
    event_id text,
    tags text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES stored_event(id)
);

CREATE TABLE stored_event_message_attachment (
    "index" text,
    event_id text,
    content_type text,
    filename text,
    "size" text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES stored_event(id)
);

CREATE TABLE stored_event_message_recipient (
    "index" text,
    event_id text,
    recipient text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES stored_event(id)
);

CREATE TABLE stored_event (
    id text,
    domain_id text,
    campaigns jsonb,
    delivery_status_attempt_no text,
    delivery_status_certificate_verified text,
    delivery_status_code text,
    delivery_status_description text,
    delivery_status_enhanced_code text,
    delivery_status_message text,
    delivery_status_mx_host text,
    delivery_status_session_seconds text,
    delivery_status_tls text,
    delivery_status_utf_8 text,
    event_type text,
    flags_is_authenticated text,
    flags_is_routed text,
    flags_is_system_test text,
    flags_is_test_mode text,
    log_level text,
    message_from text,
    message_message_id text,
    message_size text,
    message_subject text,
    message_to text,
    recipient text,
    recipient_domain text,
    storage_env text,
    storage_key text,
    storage_region text,
    storage_url text,
    template_name text,
    timestamps text,
    user_variables_org_id text,
    user_variables_silo_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (domain_id) REFERENCES domain(id)
);
