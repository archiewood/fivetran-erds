CREATE TABLE contact (
    id bigint,
    email text,
    adding_date text,
    city text,
    company text,
    company_size text,
    country text,
    custom_field jsonb,
    first_name text,
    industry text,
    last_name text,
    linked_in_profile text,
    linked_in_recruiter_url text,
    notes text,
    phone text,
    phone_status text,
    sales_navigation_url text,
    "state" text,
    time_zone_id text,
    title text,
    PRIMARY KEY (id, email),
    FOREIGN KEY (email) REFERENCES email_account(email)
);

CREATE TABLE contact_statistic_campaign_email (
    campaign_id bigint,
    step_num bigint,
    contact_statistic_id bigint,
    bounced boolean,
    "date" timestamp,
    opened boolean,
    replied boolean,
    PRIMARY KEY (campaign_id, step_num),
    FOREIGN KEY (campaign_id) REFERENCES contact_statistic_campaign(id),
    FOREIGN KEY (step_num) REFERENCES campaign_step(number),
    FOREIGN KEY (contact_statistic_id) REFERENCES contact_statistic_campaign(contact_statistic_id)
);

CREATE TABLE contact_statistic_campaign (
    contact_statistic_id bigint,
    id bigint,
    inbox_state text,
    person_status text,
    reply_date timestamp,
    reply_text text,
    "status" text,
    PRIMARY KEY (contact_statistic_id, id),
    FOREIGN KEY (contact_statistic_id) REFERENCES contact_statistic(id),
    FOREIGN KEY (id) REFERENCES campaign(id)
);

CREATE TABLE contact_statistic (
    id bigint,
    email text,
    is_blocked boolean,
    is_opted_out boolean,
    PRIMARY KEY (id),
    FOREIGN KEY (email) REFERENCES contact(email)
);

CREATE TABLE email_account (
    email text,
    id bigint,
    sender_name text,
    signature text,
    PRIMARY KEY (email, id)
);

CREATE TABLE contact_per_campaign (
    campaign_id bigint,
    id bigint,
    PRIMARY KEY (campaign_id, id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (id) REFERENCES contact(id)
);

CREATE TABLE email_template_attachment (
    attachment_id text,
    campaign_step_template_id bigint,
    campaign_id bigint,
    PRIMARY KEY (attachment_id, campaign_step_template_id),
    FOREIGN KEY (campaign_step_template_id) REFERENCES campaign_step_template(id),
    FOREIGN KEY (campaign_id) REFERENCES campaign_step(campaign_id)
);

CREATE TABLE campaign_step_template (
    id bigint,
    campaign_id bigint,
    campaign_step_id bigint,
    body text,
    cc_list text,
    email_template_id text,
    email_template_name text,
    subject text,
    PRIMARY KEY (id),
    FOREIGN KEY (campaign_id) REFERENCES campaign_step(campaign_id),
    FOREIGN KEY (campaign_step_id) REFERENCES campaign_step(id)
);

CREATE TABLE campaign_step (
    id bigint,
    campaign_id bigint,
    in_minutes_count bigint,
    number bigint,
    PRIMARY KEY (id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id)
);

CREATE TABLE template (
    id bigint,
    body text,
    category_id bigint,
    "name" text,
    subject text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE campaign_schedule (
    id bigint,
    is_default boolean,
    "name" text,
    timezone_id text,
    PRIMARY KEY (id)
);

CREATE TABLE campaign_time_range (
    campaign_schedule_id text,
    "type" text,
    week_day text,
    from_time_hour bigint,
    from_time_minute bigint,
    to_time_hour bigint,
    to_time_minute bigint,
    PRIMARY KEY (campaign_schedule_id, "type", week_day)
);

CREATE TABLE campaign_timing (
    campaign_schedule_id text,
    "type" text,
    week_day text,
    is_active boolean,
    PRIMARY KEY (campaign_schedule_id, "type", week_day)
);

CREATE TABLE campaign (
    id bigint,
    email text,
    bounces_count bigint,
    created text,
    deliveries_count bigint,
    "name" text,
    opens_count bigint,
    opt_outs_count bigint,
    out_of_office_count bigint,
    owner_email text,
    people_active bigint,
    people_count bigint,
    people_finished bigint,
    people_paused bigint,
    replies_count bigint,
    PRIMARY KEY (id),
    FOREIGN KEY (email) REFERENCES email_account(email)
);

CREATE TABLE email_sent (
    email text,
    id bigint,
    email_account_id text,
    sent_email_id text,
    email_from text,
    sent_email_date text,
    sent_email_message_id text,
    sent_email_variant text,
    sent_message_url text,
    PRIMARY KEY (email, id),
    FOREIGN KEY (email) REFERENCES contact(email),
    FOREIGN KEY (id) REFERENCES contact(id),
    FOREIGN KEY (email_account_id) REFERENCES email_account(id),
    FOREIGN KEY (sent_email_id) REFERENCES email_account(id)
);

CREATE TABLE email_replied (
    email text,
    id bigint,
    email_account_id text,
    sent_email_id text,
    reason text,
    reply_date text,
    reply_message_id text,
    reply_message_url text,
    PRIMARY KEY (email, id),
    FOREIGN KEY (email) REFERENCES contact(email),
    FOREIGN KEY (id) REFERENCES contact(id),
    FOREIGN KEY (email_account_id) REFERENCES email_account(id),
    FOREIGN KEY (sent_email_id) REFERENCES email_account(id)
);

CREATE TABLE contact_called (
    email text,
    id bigint,
    disposition text,
    duration text,
    from_number text,
    notes text,
    recording_url text,
    resolution text,
    PRIMARY KEY (email, id),
    FOREIGN KEY (email) REFERENCES contact(email),
    FOREIGN KEY (id) REFERENCES contact(id)
);

CREATE TABLE email_opened (
    email text,
    id bigint,
    email_account_id text,
    sent_email_id text,
    email_open_date text,
    opens_count text,
    sent_email_message_id text,
    PRIMARY KEY (email, id),
    FOREIGN KEY (email) REFERENCES contact(email),
    FOREIGN KEY (id) REFERENCES contact(id),
    FOREIGN KEY (email_account_id) REFERENCES email_account(id),
    FOREIGN KEY (sent_email_id) REFERENCES email_account(id)
);

CREATE TABLE contact_opted_out (
    email text,
    id bigint,
    prospect_opt_out_date text,
    PRIMARY KEY (email, id),
    FOREIGN KEY (email) REFERENCES contact(email),
    FOREIGN KEY (id) REFERENCES contact(id)
);

CREATE TABLE contact_finished (
    email text,
    id bigint,
    finish_reason text,
    finished_date text,
    PRIMARY KEY (email, id),
    FOREIGN KEY (email) REFERENCES contact(email),
    FOREIGN KEY (id) REFERENCES contact(id)
);
