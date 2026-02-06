-- Event Email        
-- The email in the EVENT table is the email of the RECIPIENT

CREATE TABLE unsubscribe_group (
    id bigint,
    description text,
    is_default boolean,
    last_email_sent_at timestamp,
    "name" text,
    unsubscribes bigint,
    PRIMARY KEY (id)
);

CREATE TABLE event (
    _fivetran_id text,
    campaign_id bigint,
    singlesend_id text,
    attempt bigint,
    campaign_split_id text,
    campaign_version text,
    cert_err text,
    email text,
    event text,
    ip text,
    mc_stats text,
    phase_id text,
    pool_id text,
    pool_name text,
    post_type text,
    reason text,
    response text,
    send_at text,
    sg_event_id text,
    sg_machine_open boolean,
    sg_message_id text,
    sg_user_id text,
    singlesend_name text,
    smtp_id text,
    "status" text,
    "timestamp" timestamp,
    tls text,
    "type" text,
    url text,
    url_offset_index bigint,
    url_offset_type text,
    useragent text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (singlesend_id) REFERENCES single_send(id)
);

CREATE TABLE contact (
    id text,
    address_line_1 text,
    address_line_2 text,
    city text,
    country text,
    created_at timestamp,
    email text,
    facebook text,
    first_name text,
    last_name text,
    line text,
    phone_number text,
    postal_code text,
    state_province_region text,
    unique_name text,
    updated_at timestamp,
    whatsapp text,
    PRIMARY KEY (id)
);

CREATE TABLE campaign_segment (
    campaign_id text,
    segment_id text,
    PRIMARY KEY (campaign_id, segment_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (segment_id) REFERENCES segment(id)
);

CREATE TABLE recipient_list (
    list_id text,
    recipient_id text,
    PRIMARY KEY (list_id, recipient_id),
    FOREIGN KEY (list_id) REFERENCES list(id),
    FOREIGN KEY (recipient_id) REFERENCES recipient(id)
);

-- Legacy table
CREATE TABLE campaign (
    id text,
    sender_id bigint,
    unsubscribe_group_id integer,
    custom_unsubscribe_url text,
    editor text,
    html_content text,
    ip_pool text,
    plain_content text,
    "status" text,
    subject text,
    title text,
    PRIMARY KEY (id),
    FOREIGN KEY (sender_id) REFERENCES sender(id),
    FOREIGN KEY (unsubscribe_group_id) REFERENCES unsubscribe_group(id)
);

CREATE TABLE segment_condition (
    field text,
    segment_id text,
    operator text,
    "value" text,
    PRIMARY KEY (field, segment_id),
    FOREIGN KEY (segment_id) REFERENCES segment(id)
);

CREATE TABLE campaign_list (
    campaign_id text,
    list_id text,
    PRIMARY KEY (campaign_id, list_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (list_id) REFERENCES list(id)
);

CREATE TABLE sender (
    id bigint,
    address text,
    address_2 text,
    city text,
    country text,
    created_at timestamp,
    from_email text,
    from_name text,
    locked boolean,
    nickname text,
    reply_to_email text,
    reply_to_name text,
    "state" text,
    updated_at timestamp,
    verified_reason text,
    verified_status boolean,
    zip text,
    PRIMARY KEY (id)
);

CREATE TABLE list (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE segment (
    id text,
    list_id text,
    "condition" text,
    created_at timestamp,
    "name" text,
    sample_updated_at timestamp,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (list_id) REFERENCES list(id)
);

CREATE TABLE contact_list (
    contact_id text,
    list_id text,
    PRIMARY KEY (contact_id, list_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (list_id) REFERENCES list(id)
);

CREATE TABLE single_send (
    id text,
    email_config_sender_id bigint,
    email_config_unsubscribe_group_id integer,
    created_at text,
    email_config_custom_unsubscribe_url text,
    email_config_editor text,
    email_config_html_content text,
    email_config_ip_pool text,
    email_config_plain_content text,
    email_config_subject text,
    "name" text,
    send_at text,
    "status" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (email_config_sender_id) REFERENCES sender(id),
    FOREIGN KEY (email_config_unsubscribe_group_id) REFERENCES unsubscribe_group(id)
);

CREATE TABLE single_send_list (
    list_id text,
    single_send_id text,
    PRIMARY KEY (list_id, single_send_id),
    FOREIGN KEY (list_id) REFERENCES list(id),
    FOREIGN KEY (single_send_id) REFERENCES single_send(id)
);

CREATE TABLE contact_alternate_email (
    alternate_email text,
    contact_id text,
    PRIMARY KEY (alternate_email, contact_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE category (
    "index" integer,
    event_id text,
    campaign_id bigint,
    singlesend_id text,
    category text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES event(_fivetran_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (singlesend_id) REFERENCES single_send(id)
);

CREATE TABLE single_send_segment (
    segment_id text,
    single_send_id text,
    PRIMARY KEY (segment_id, single_send_id),
    FOREIGN KEY (segment_id) REFERENCES segment(id),
    FOREIGN KEY (single_send_id) REFERENCES single_send(id)
);

CREATE TABLE recipient (
    id text,
    created_at timestamp,
    email text,
    first_name text,
    last_clicked timestamp,
    last_emailed timestamp,
    last_name text,
    last_opened timestamp,
    updated_at timestamp,
    PRIMARY KEY (id)
);
