CREATE TABLE maintenance_id (
    maintenance_id bigint,
    checks_id bigint,
    id text,
    PRIMARY KEY (maintenance_id, checks_id),
    FOREIGN KEY (checks_id) REFERENCES checks(id),
    FOREIGN KEY (id) REFERENCES maintenance(id)
);

CREATE TABLE checks (
    id bigint,
    created timestamp,
    hostname text,
    ipv_6 boolean,
    last_down_end timestamp,
    last_down_start timestamp,
    last_error_time timestamp,
    last_response_time bigint,
    last_test_time timestamp,
    maintenance_ids jsonb,
    "name" text,
    resolution bigint,
    "status" text,
    "type" text,
    verify_certificate boolean,
    PRIMARY KEY (id)
);

CREATE TABLE sms (
    "index" text,
    contact_id bigint,
    country_code text,
    number text,
    provider text,
    severity text,
    PRIMARY KEY ("index", contact_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE email (
    "index" text,
    contact_id bigint,
    address text,
    severity text,
    PRIMARY KEY ("index", contact_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE contact (
    id bigint,
    member_id text,
    "name" text,
    owner boolean,
    paused boolean,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (member_id) REFERENCES member(id)
);

CREATE TABLE check_description (
    id bigint,
    created timestamp,
    custom_message text,
    hostname text,
    integration_ids jsonb,
    ipv_6 boolean,
    last_down_end timestamp,
    last_down_start timestamp,
    last_error_time timestamp,
    last_response_time bigint,
    last_test_time timestamp,
    "name" text,
    notify_again_every bigint,
    notify_when_backup boolean,
    probe_filters jsonb,
    resolution bigint,
    responsetime_threshold bigint,
    send_notification_when_down bigint,
    ssl_down_days_before bigint,
    "status" text,
    type_http_encryption boolean,
    type_http_password text,
    type_http_port bigint,
    type_http_post_data text,
    type_http_should_contain text,
    type_http_should_not_contain text,
    type_http_url text,
    type_http_user_agent text,
    type_http_username text,
    type_http_verify_certificate boolean,
    userids jsonb,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES checks(id)
);

CREATE TABLE analysis (
    id bigint,
    checks_id bigint,
    time_confirm_test timestamp,
    time_first_test timestamp,
    PRIMARY KEY (id, checks_id),
    FOREIGN KEY (checks_id) REFERENCES checks(id)
);

CREATE TABLE maintenance_occurrence (
    id bigint,
    maintenance_id bigint,
    duration bigint,
    duration_unit text,
    from_date timestamp,
    to_date timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (maintenance_id) REFERENCES maintenance(id)
);

CREATE TABLE "state" (
    "index" text,
    transaction_status_check_id bigint,
    error_in_step bigint,
    from_date timestamp,
    message text,
    "status" text,
    to_date timestamp,
    PRIMARY KEY ("index", transaction_status_check_id),
    FOREIGN KEY (transaction_status_check_id) REFERENCES transaction_status(check_id)
);

CREATE TABLE transaction_status (
    check_id bigint,
    "name" text,
    PRIMARY KEY (check_id),
    FOREIGN KEY (check_id) REFERENCES checks(id)
);

CREATE TABLE probe (
    id bigint,
    active boolean,
    city text,
    country text,
    country_iso text,
    hostname text,
    ip text,
    ipv_6 text,
    "name" text,
    region text,
    PRIMARY KEY (id)
);

CREATE TABLE uptime (
    uptime bigint,
    maintenance_id bigint,
    PRIMARY KEY (uptime, maintenance_id),
    FOREIGN KEY (maintenance_id) REFERENCES maintenance(id)
);

CREATE TABLE tms (
    tms bigint,
    maintenance_id bigint,
    PRIMARY KEY (tms, maintenance_id),
    FOREIGN KEY (maintenance_id) REFERENCES maintenance(id)
);

CREATE TABLE maintenance (
    id bigint,
    day_of_week_in_month bigint,
    description text,
    duration bigint,
    duration_unit text,
    effective_to timestamp,
    from_date timestamp,
    recurrence_type text,
    repeat_every bigint,
    to_date timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE region (
    id bigint,
    country_id bigint,
    date_time_format_id bigint,
    number_format_id bigint,
    timezone_id bigint,
    description text,
    PRIMARY KEY (id),
    FOREIGN KEY (country_id) REFERENCES country(id),
    FOREIGN KEY (date_time_format_id) REFERENCES date_time_format(id),
    FOREIGN KEY (number_format_id) REFERENCES number_format(id),
    FOREIGN KEY (timezone_id) REFERENCES time_zone(id)
);

CREATE TABLE time_zone (
    id bigint,
    description text,
    offsets bigint,
    timezone text,
    PRIMARY KEY (id)
);

CREATE TABLE date_time_format (
    id bigint,
    dateformat text,
    description text,
    timeformat text,
    PRIMARY KEY (id)
);

CREATE TABLE number_format (
    id bigint,
    description text,
    PRIMARY KEY (id)
);

CREATE TABLE country (
    id bigint,
    iso text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE phone_code (
    "name" text,
    country_id bigint,
    iso text,
    phone_code text,
    PRIMARY KEY ("name", country_id),
    FOREIGN KEY (country_id) REFERENCES country(id)
);

CREATE TABLE "action" (
    "time" timestamp,
    user_id bigint,
    check_id bigint,
    charged boolean,
    message_full text,
    message_short text,
    sent_to text,
    "status" text,
    username text,
    via text,
    PRIMARY KEY ("time", user_id, check_id),
    FOREIGN KEY (check_id) REFERENCES checks(id)
);

CREATE TABLE member (
    id bigint,
    team_id bigint,
    "name" text,
    "type" text,
    PRIMARY KEY (id, team_id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE team (
    id bigint,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE "result" (
    "time" timestamp,
    checks_id bigint,
    probe_id bigint,
    response_time bigint,
    "status" text,
    status_desc text,
    status_desc_long text,
    PRIMARY KEY ("time", checks_id, probe_id),
    FOREIGN KEY (checks_id) REFERENCES checks(id),
    FOREIGN KEY (probe_id) REFERENCES probe(id)
);
