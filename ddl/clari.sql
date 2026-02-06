CREATE TABLE opportunity_field (
    id text,
    opportunity_id text,
    alias text,
    image_url text,
    trend text,
    PRIMARY KEY (id, opportunity_id),
    FOREIGN KEY (opportunity_id) REFERENCES opportunity(id)
);

CREATE TABLE opportunity_trend_history (
    "index" text,
    opportunity_id text,
    "date" text,
    new_value text,
    old_value text,
    PRIMARY KEY ("index", opportunity_id),
    FOREIGN KEY (opportunity_id) REFERENCES opportunity(id)
);

CREATE TABLE opportunity (
    id text,
    crm_score text,
    crm_score_message text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES activity_opportunity(id)
);

CREATE TABLE administrative (
    _fivetran_id text,
    available_concurrent_limit text,
    available_monthly_quota text,
    concurrent_limit text,
    monthly_quota text,
    running_job_ids jsonb,
    submitted_job_ids jsonb,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE item (
    _fivetran_id text,
    actor_id text,
    actor_type text,
    correlation_id text,
    event text,
    event_parameters text,
    event_timestamp_epoch_second text,
    event_timestamp_nano text,
    impersonating_actor_id text,
    ip_address text,
    session_id text,
    session_type text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE actor (
    actor_id text,
    actor_type text,
    email text,
    "name" text,
    PRIMARY KEY (actor_id),
    FOREIGN KEY (actor_id) REFERENCES item(actor_id)
);

CREATE TABLE export (
    job_id text,
    cells_truncated text,
    currency text,
    downloads text,
    end_time text,
    expired_time text,
    file_name text,
    file_type text,
    module text,
    organisation_id text,
    rows_truncated text,
    start_time text,
    "status" text,
    title text,
    user_id text,
    version text,
    viewed text,
    PRIMARY KEY (job_id)
);

CREATE TABLE activity_account (
    id text,
    activity_id text,
    "name" text,
    owner_id text,
    PRIMARY KEY (id, activity_id),
    FOREIGN KEY (activity_id) REFERENCES activity(id)
);

CREATE TABLE activity_opportunity (
    id text,
    activity_id text,
    "name" text,
    owner_id text,
    PRIMARY KEY (id, activity_id),
    FOREIGN KEY (activity_id) REFERENCES activity(id)
);

CREATE TABLE activity_participant (
    "index" text,
    activity_id text,
    email text,
    is_internal text,
    "name" text,
    sfdc_user_id text,
    PRIMARY KEY ("index", activity_id),
    FOREIGN KEY (activity_id) REFERENCES activity(id)
);

CREATE TABLE activity (
    id text,
    "date" text,
    organiser_id text,
    owner_id text,
    subject text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE forecast_data (
    _fivetran_id text,
    crm_user_id text,
    data_type text,
    data_value text,
    email text,
    end_day text,
    field text,
    forecast_id text,
    parent_role text,
    "role" text,
    start_day text,
    timeframe text,
    user_name text,
    week text,
    PRIMARY KEY (_fivetran_id)
);
