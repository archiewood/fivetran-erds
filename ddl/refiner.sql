CREATE TABLE rating_report (
    date_range_end timestamp,
    date_range_start timestamp,
    average text,
    count text,
    data jsonb,
    sum text,
    PRIMARY KEY (date_range_end, date_range_start)
);

CREATE TABLE nps_report (
    date_range_end timestamp,
    date_range_start timestamp,
    count text,
    detractors text,
    nps text,
    passives text,
    promoters text,
    PRIMARY KEY (date_range_end, date_range_start)
);

CREATE TABLE csat_report (
    date_range_end timestamp,
    date_range_start timestamp,
    count text,
    csat text,
    data_neutral text,
    data_satisfied text,
    data_unsatisfied text,
    data_very_satisfied text,
    data_very_unsatisfied text,
    PRIMARY KEY (date_range_end, date_range_start)
);

CREATE TABLE form (
    id text,
    archived_at text,
    channels jsonb,
    created_at timestamp,
    first_form_view_at text,
    folder text,
    last_form_view_at text,
    "name" text,
    published_at timestamp,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE distribution_report (
    date_range_end timestamp,
    date_range_start timestamp,
    data jsonb,
    datapoints text,
    responses text,
    PRIMARY KEY (date_range_end, date_range_start)
);

CREATE TABLE response (
    id text,
    contact_id text,
    form_id text,
    completed_at text,
    data_first_question text,
    data_second_question text,
    dismissed_at text,
    first_data_reception_at text,
    first_shown_at text,
    last_data_reception_at text,
    last_shown_at text,
    received_at text,
    show_counter text,
    PRIMARY KEY (id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (form_id) REFERENCES form(id)
);

CREATE TABLE segment (
    id text,
    is_manual text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE contact_segment (
    contact_id text,
    id text,
    PRIMARY KEY (contact_id, id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (id) REFERENCES segment(id)
);

CREATE TABLE contact (
    id text,
    account_display_name text,
    account_domain text,
    account_first_seen_at timestamp,
    account_id text,
    account_last_seen_at timestamp,
    account_remote_id text,
    display_name text,
    email text,
    first_seen_at timestamp,
    last_seen_at timestamp,
    remote_id text,
    -- account_attributes_* (dynamic column),
    -- attributes_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE count_report (
    date_range_end timestamp,
    date_range_start timestamp,
    responses text,
    views text,
    PRIMARY KEY (date_range_end, date_range_start)
);
