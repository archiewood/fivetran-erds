CREATE TABLE template_label (
    label text,
    template_id text,
    PRIMARY KEY (label, template_id),
    FOREIGN KEY (template_id) REFERENCES template(id)
);

CREATE TABLE template (
    id text,
    code text,
    created_at text,
    draft_updated_at text,
    from_email text,
    from_name text,
    "name" text,
    publish_code text,
    publish_from_email text,
    publish_from_name text,
    publish_name text,
    publish_subject text,
    publish_text text,
    published_at text,
    subject text,
    text text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE message_smtp_event (
    "index" integer,
    message_event_fivetran_id text,
    message_id text,
    destination_ip text,
    diag text,
    "size" bigint,
    source_ip text,
    timestamps timestamp,
    "type" text,
    PRIMARY KEY ("index", message_event_fivetran_id, message_id),
    FOREIGN KEY (message_event_fivetran_id) REFERENCES message(event_fivetran_id),
    FOREIGN KEY (message_id) REFERENCES message(id)
);

CREATE TABLE message_tag (
    tags text,
    message_event_fivetran_id text,
    message_id text,
    PRIMARY KEY (tags, message_event_fivetran_id, message_id),
    FOREIGN KEY (message_event_fivetran_id) REFERENCES message(event_fivetran_id),
    FOREIGN KEY (message_id) REFERENCES message(id)
);

CREATE TABLE message (
    id text,
    event_fivetran_id text,
    template_id text,
    bounce_description text,
    diag text,
    email text,
    metadata jsonb,
    sender text,
    "state" text,
    subaccount text,
    subject text,
    timestamps timestamp,
    PRIMARY KEY (id, event_fivetran_id),
    FOREIGN KEY (event_fivetran_id) REFERENCES event(_fivetran_id),
    FOREIGN KEY (template_id) REFERENCES template(id)
);

CREATE TABLE event (
    _fivetran_id text,
    message_id text,
    event text,
    ip text,
    location_city text,
    location_country_long text,
    location_country_short text,
    location_latitude text,
    location_longitude text,
    location_postal_code text,
    location_region text,
    location_timezone text,
    timestamps timestamp,
    url text,
    user_agent_company text,
    user_agent_company_url text,
    user_agent_family text,
    user_agent_icon text,
    user_agent_mobile boolean,
    user_agent_name text,
    user_agent_os_company text,
    user_agent_os_company_url text,
    user_agent_os_family text,
    user_agent_os_icon text,
    user_agent_os_name text,
    user_agent_os_url text,
    user_agent_type text,
    user_agent_url text,
    user_agent_version text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (message_id) REFERENCES message(id)
);
