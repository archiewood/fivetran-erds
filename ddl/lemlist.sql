CREATE TABLE unsubscribe (
    id text,
    created_at text,
    "source" text,
    "value" text,
    PRIMARY KEY (id)
);

CREATE TABLE team_user (
    user_id text,
    team_id text,
    PRIMARY KEY (user_id, team_id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE team_beta (
    beta_name text,
    team_id text,
    PRIMARY KEY (beta_name, team_id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE team_invited_user (
    invited_by text,
    team_id text,
    email text,
    invited_at text,
    "role" text,
    PRIMARY KEY (invited_by, team_id),
    FOREIGN KEY (invited_by) REFERENCES team_user(user_id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE team (
    id text,
    created_by text,
    created_at text,
    custom_domain text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES team_user(user_id)
);

CREATE TABLE activity (
    id text,
    campaign_id text,
    created_by text,
    send_user_id text,
    team_id text,
    campaign_name text,
    clearbit_website_page_signal text,
    company_linkedin_url text,
    company_name text,
    company_size text,
    company_url text,
    country text,
    created_at text,
    email text,
    email_id text,
    email_status text,
    email_template_id text,
    email_template_name text,
    employee text,
    error_message text,
    first_name text,
    full_name text,
    headline text,
    industry text,
    is_first text,
    job_title text,
    languages text,
    last_name text,
    lead_company_name text,
    lead_email text,
    lead_first_name text,
    lead_id text,
    lead_last_name text,
    lh_id text,
    linkedin_url text,
    location_name text,
    member_id text,
    message_id text,
    "name" text,
    number_of_employees text,
    profile_link text,
    related_sent_at text,
    segment_signal text,
    send_user_email text,
    send_user_name text,
    sequence_id text,
    sequence_step text,
    sequence_tested text,
    step_tested text,
    stopped text,
    sub_industry text,
    total_sequence_step text,
    "type" text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (created_by) REFERENCES team_user(user_id),
    FOREIGN KEY (send_user_id) REFERENCES team_user(user_id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE campaign_label (
    _fivetran_id text,
    campaign_id text,
    label text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id)
);

CREATE TABLE campaign (
    id text,
    archived text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE lead (
    id text,
    campaign_id text,
    company_name text,
    current_company_position text,
    domain text,
    email text,
    first_name text,
    full_name text,
    industry text,
    is_paused text,
    last_name text,
    linkedin_company_url text,
    linkedin_url text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES activity(lead_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id)
);
