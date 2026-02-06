CREATE TABLE browser_usage (
    _fivetran_id text,
    server_id text,
    "date" text,
    from_date text,
    google_chorme text,
    safari text,
    safari_mobile text,
    to_date text,
    -- custom_* (dynamic column),
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (server_id) REFERENCES server(id)
);

CREATE TABLE domain (
    id text,
    dkim_host text,
    dkim_pending_host text,
    dkim_pending_text_value text,
    dkim_revoked_host text,
    dkim_revoked_text_value text,
    dkim_text_value text,
    dkim_update_status text,
    dkim_verified text,
    "name" text,
    return_path_domain text,
    return_path_domain_cname_value text,
    return_path_domain_verified text,
    safe_to_remove_revoked_key_from_dns text,
    spf_host text,
    spf_text_value text,
    weak_dkim text,
    PRIMARY KEY (id)
);

CREATE TABLE sender_signature (
    id text,
    confirmation_personal_note text,
    confirmed text,
    dkim_host text,
    dkim_pending_host text,
    dkim_pending_text_value text,
    dkim_revoked_host text,
    dkim_revoked_text_value text,
    dkim_text_value text,
    dkim_update_status text,
    dkim_verified text,
    domain text,
    email_address text,
    "name" text,
    reply_to_email_address text,
    return_path_domain text,
    return_path_domain_cname_value text,
    return_path_domain_verified text,
    safe_to_remove_revoked_key_from_dns text,
    spf_host text,
    spf_text_value text,
    weak_dkim text,
    PRIMARY KEY (id)
);

CREATE TABLE browser_usage_platform (
    _fivetran_id text,
    server_id text,
    "date" text,
    desktop text,
    from_date text,
    mobile text,
    to_date text,
    unknown text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (server_id) REFERENCES server(id)
);

CREATE TABLE message_inbound_to (
    email text,
    message_inbound_id text,
    server_id text,
    "name" text,
    PRIMARY KEY (email, message_inbound_id, server_id),
    FOREIGN KEY (message_inbound_id) REFERENCES message_inbound(id),
    FOREIGN KEY (server_id) REFERENCES message_inbound(server_id)
);

CREATE TABLE message_inbound_cc (
    email text,
    message_inbound_id text,
    server_id text,
    "name" text,
    PRIMARY KEY (email, message_inbound_id, server_id),
    FOREIGN KEY (message_inbound_id) REFERENCES message_inbound(id),
    FOREIGN KEY (server_id) REFERENCES message_inbound(server_id)
);

CREATE TABLE message_inbound_header (
    "index" text,
    message_inbound_id text,
    server_id text,
    "name" text,
    "value" text,
    PRIMARY KEY ("index", message_inbound_id, server_id),
    FOREIGN KEY (message_inbound_id) REFERENCES message_inbound(id),
    FOREIGN KEY (server_id) REFERENCES message_inbound(server_id)
);

CREATE TABLE message_inbound_attachment (
    "index" text,
    message_inbound_id text,
    server_id text,
    content_id text,
    content_length text,
    content_type text,
    "name" text,
    PRIMARY KEY ("index", message_inbound_id, server_id),
    FOREIGN KEY (message_inbound_id) REFERENCES message_inbound(id),
    FOREIGN KEY (server_id) REFERENCES message_inbound(server_id)
);

CREATE TABLE message_inbound (
    id text,
    blocked_reason text,
    "date" text,
    from_email text,
    from_name text,
    html_body text,
    mailbox_hash text,
    original_recipient text,
    reply_to text,
    server_id text,
    "status" text,
    subject text,
    tags text,
    text_body text,
    PRIMARY KEY (id)
);

CREATE TABLE server (
    id text,
    bounce_hook_url text,
    click_hook_url text,
    color text,
    delivery_hook_url text,
    delivery_type text,
    enable_smtp_api_error_hook text,
    inbound_address text,
    inbound_domain text,
    inbound_hash text,
    inbound_hook_url text,
    inbound_spam_threshold text,
    include_bounce_content_in_hook text,
    "name" text,
    open_hook_url text,
    post_first_open_only text,
    raw_email_enabled text,
    server_link text,
    smtp_api_activated text,
    track_link text,
    track_open text,
    PRIMARY KEY (id)
);

CREATE TABLE template (
    id text,
    associated_server_id text,
    active text,
    alias text,
    html_body text,
    layout text,
    "name" text,
    subject text,
    text_body text,
    "type" text,
    PRIMARY KEY (id, associated_server_id),
    FOREIGN KEY (associated_server_id) REFERENCES server(id)
);

CREATE TABLE outbound_statistics (
    _fivetran_id text,
    server_id text,
    bounce_rate text,
    bounced text,
    from_date text,
    opens text,
    sent text,
    smtp_api_error text,
    spam_complaint text,
    spam_complaint_rate text,
    to_date text,
    total_click text,
    total_tracked_link_sent text,
    tracked text,
    unique_link_clicked text,
    unique_open text,
    with_client_recorded text,
    with_link_tracking text,
    with_open_tracking text,
    with_platform_recorded text,
    with_read_time_recorded text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (server_id) REFERENCES server(id)
);

CREATE TABLE message_outbound_to (
    email text,
    message_outbound_id text,
    server_id text,
    "name" text,
    PRIMARY KEY (email, message_outbound_id, server_id),
    FOREIGN KEY (message_outbound_id) REFERENCES message_outbound(id),
    FOREIGN KEY (server_id) REFERENCES message_outbound(server_id)
);

CREATE TABLE message_outbound_recipient (
    "index" text,
    message_outbound_id text,
    server_id text,
    recipient text,
    PRIMARY KEY ("index", message_outbound_id, server_id),
    FOREIGN KEY (message_outbound_id) REFERENCES message_outbound(id),
    FOREIGN KEY (server_id) REFERENCES message_outbound(server_id)
);

CREATE TABLE message_outbound_cc (
    email text,
    message_outbound_id text,
    server_id text,
    "name" text,
    PRIMARY KEY (email, message_outbound_id, server_id),
    FOREIGN KEY (message_outbound_id) REFERENCES message_outbound(id),
    FOREIGN KEY (server_id) REFERENCES message_outbound(server_id)
);

CREATE TABLE message_outbound_bcc (
    email text,
    message_outbound_id text,
    server_id text,
    "name" text,
    PRIMARY KEY (email, message_outbound_id, server_id),
    FOREIGN KEY (message_outbound_id) REFERENCES message_outbound(id),
    FOREIGN KEY (server_id) REFERENCES message_outbound(server_id)
);

CREATE TABLE message_outbound_attachment (
    "index" text,
    message_outbound_id text,
    server_id text,
    attachment text,
    PRIMARY KEY ("index", message_outbound_id, server_id),
    FOREIGN KEY (message_outbound_id) REFERENCES message_outbound(id),
    FOREIGN KEY (server_id) REFERENCES message_outbound(server_id)
);

CREATE TABLE message_outbound_event (
    "index" text,
    message_outbound_id text,
    server_id text,
    delivery_message text,
    destination_ip text,
    destination_server text,
    received_at text,
    recipient text,
    summary text,
    "type" text,
    PRIMARY KEY ("index", message_outbound_id, server_id),
    FOREIGN KEY (message_outbound_id) REFERENCES message_outbound(id),
    FOREIGN KEY (server_id) REFERENCES message_outbound(server_id)
);

CREATE TABLE message_outbound (
    id text,
    body text,
    html_body text,
    received_at text,
    received_from text,
    sandboxed text,
    server_id text,
    "status" text,
    subject text,
    track_links text,
    track_open text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE message_outbound_click (
    id text,
    server_id text,
    click_location text,
    client_company text,
    client_family text,
    client_name text,
    geo_coords text,
    geo_country text,
    geo_country_iso_code text,
    geo_ip text,
    original_link text,
    os_company text,
    os_family text,
    os_name text,
    platform text,
    received_at text,
    recipient text,
    record_type text,
    tags text,
    user_agent text,
    PRIMARY KEY (id, server_id),
    FOREIGN KEY (id) REFERENCES message_outbound(id),
    FOREIGN KEY (server_id) REFERENCES server(id)
);

CREATE TABLE bounce (
    id text,
    server_id text,
    message_id text,
    bounced_at text,
    can_activate text,
    description text,
    detail text,
    dump_available text,
    email text,
    inactive text,
    "name" text,
    received_from text,
    record_type text,
    subject text,
    tags text,
    "type" text,
    type_code text,
    PRIMARY KEY (id, server_id),
    FOREIGN KEY (server_id) REFERENCES server(id),
    FOREIGN KEY (message_id) REFERENCES message_outbound(id)
);

CREATE TABLE message_outbound_open (
    id text,
    server_id text,
    client_company text,
    client_family text,
    client_name text,
    geo_coords text,
    geo_country text,
    geo_country_iso_code text,
    geo_ip text,
    os_company text,
    os_family text,
    os_name text,
    platform text,
    read_seconds text,
    received_at text,
    recipient text,
    record_type text,
    stream text,
    tags text,
    user_agent text,
    PRIMARY KEY (id, server_id),
    FOREIGN KEY (id) REFERENCES message_outbound(id),
    FOREIGN KEY (server_id) REFERENCES server(id)
);

CREATE TABLE email_client_usage (
    _fivetran_id text,
    server_id text,
    apple_mail text,
    "date" text,
    from_date text,
    gmail text,
    outlook text,
    to_date text,
    -- custom_* (dynamic column),
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (server_id) REFERENCES server(id)
);

CREATE TABLE platform_usage (
    _fivetran_id text,
    server_id text,
    "date" text,
    desktop text,
    from_date text,
    mobile text,
    to_date text,
    unknown text,
    web_mail text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (server_id) REFERENCES server(id)
);

CREATE TABLE suppression (
    _fivetran_id text,
    message_stream_id text,
    server_id text,
    created_at text,
    email_address text,
    origin text,
    suppression_reason text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (message_stream_id) REFERENCES message_stream(id),
    FOREIGN KEY (server_id) REFERENCES server(id)
);

CREATE TABLE bounce_count (
    _fivetran_id text,
    server_id text,
    "date" text,
    from_date text,
    hard_bounce text,
    smtp_api_error text,
    soft_bounce text,
    to_date text,
    transient text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (server_id) REFERENCES server(id)
);

CREATE TABLE message_stream (
    id text,
    server_id text,
    archived_at text,
    created_at text,
    description text,
    expected_purge_date text,
    "name" text,
    subscription_management_configuration_unsubscribe_handling_type text,
    "type" text,
    updated_at text,
    PRIMARY KEY (id, server_id),
    FOREIGN KEY (server_id) REFERENCES server(id)
);

CREATE TABLE click_location (
    _fivetran_id text,
    server_id text,
    "date" text,
    from_date text,
    html text,
    text text,
    to_date text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (server_id) REFERENCES server(id)
);
