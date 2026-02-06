CREATE TABLE contact_preference (
    "index" text,
    contact_id text,
    category text,
    last_modified text,
    "name" text,
    "source" text,
    "value" text,
    PRIMARY KEY ("index", contact_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE contact (
    id text,
    anonymous text,
    created text,
    custom_fields jsonb,
    email text,
    external_id text,
    permission text,
    standard_fields jsonb,
    updated text,
    PRIMARY KEY (id)
);

CREATE TABLE target_group (
    id text,
    author text,
    contact_filter_id text,
    contact_filter_name text,
    count_active_contacts text,
    count_contacts text,
    created text,
    evaluated text,
    "name" text,
    "state" text,
    "type" text,
    updated text,
    PRIMARY KEY (id)
);

CREATE TABLE mailing_list (
    id text,
    "name" text,
    schedule_time text,
    "state" text,
    "type" text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE recipient (
    _fivetran_id text,
    contact_id text,
    mailing_id text,
    contact_permission_status text,
    contact_permission_type text,
    msg_id text,
    time_stamp text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (mailing_id) REFERENCES mailing_list(id)
);

CREATE TABLE conversion (
    _fivetran_id text,
    contact_id text,
    mailing_id text,
    goal_id text,
    goal_name text,
    link_id text,
    link_url text,
    mailing_name text,
    mailing_sent_date text,
    mailing_sent_date_sql text,
    site_id text,
    site_name text,
    time_stamp text,
    timestamp_sql text,
    "value" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (mailing_id) REFERENCES mailing_list(id)
);

CREATE TABLE bounce (
    _fivetran_id text,
    contact_id text,
    mailing_id text,
    contact_permission_status text,
    contact_permission_type text,
    msg_id text,
    "source" text,
    status_code text,
    time_stamp text,
    "type" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (mailing_id) REFERENCES mailing_list(id)
);

CREATE TABLE unsubscription (
    _fivetran_id text,
    contact_id text,
    mailing_id text,
    msg_id text,
    "source" text,
    time_stamp text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (mailing_id) REFERENCES mailing_list(id)
);

CREATE TABLE unique_opens (
    _fivetran_id text,
    contact_id text,
    mailing_id text,
    client_browser text,
    client_browser_group text,
    client_browser_type text,
    client_os_group text,
    client_os_name text,
    client_rendering_engine text,
    client_user_agent text,
    contact_anonymous text,
    contact_permission_status text,
    contact_permission_type text,
    device_type text,
    format text,
    msg_id text,
    time_stamp text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (mailing_id) REFERENCES mailing_list(id)
);

CREATE TABLE opens (
    _fivetran_id text,
    contact_id text,
    mailing_id text,
    client_browser text,
    client_browser_group text,
    client_browser_type text,
    client_os_group text,
    client_os_name text,
    client_rendering_engine text,
    client_user_agent text,
    contact_permission_status text,
    contact_permission_type text,
    device_type text,
    format text,
    msg_id text,
    time_stamp text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (mailing_id) REFERENCES mailing_list(id)
);

CREATE TABLE click (
    _fivetran_id text,
    contact_id text,
    mailing_id text,
    client_browser text,
    client_browser_group text,
    client_browser_type text,
    client_os_group text,
    client_os_name text,
    client_rendering_engine text,
    client_user_agent text,
    contact_permission_status text,
    contact_permission_type text,
    device_type text,
    format text,
    link_id text,
    link_tag jsonb,
    link_type text,
    link_url text,
    msg_id text,
    time_stamp text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (mailing_id) REFERENCES mailing_list(id)
);

CREATE TABLE subscriber (
    _fivetran_id text,
    contact_id text,
    mailing_id text,
    contact_permission_status text,
    contact_permission_type text,
    ip text,
    msg_id text,
    time_stamp text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (mailing_id) REFERENCES mailing_list(id)
);

CREATE TABLE unique_click (
    _fivetran_id text,
    contact_id text,
    mailing_id text,
    client_browser text,
    client_browser_group text,
    client_browser_type text,
    client_os_group text,
    client_os_name text,
    client_rendering_engine text,
    client_user_agent text,
    contact_permission_status text,
    contact_permission_type text,
    device_type text,
    format text,
    link_id text,
    link_tag jsonb,
    link_type text,
    link_url text,
    msg_id text,
    time_stamp text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (mailing_id) REFERENCES mailing_list(id)
);
