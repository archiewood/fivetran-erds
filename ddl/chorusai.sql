CREATE TABLE scorecard_score (
    question_id bigint,
    scorecard_id text,
    comment_text text,
    question_text text,
    score bigint,
    PRIMARY KEY (question_id, scorecard_id),
    FOREIGN KEY (scorecard_id) REFERENCES scorecard(id)
);

CREATE TABLE scorecard (
    id text,
    attributes_engagement_id text,
    attributes_recipient_user_id bigint,
    attributes_reviewer_user_id bigint,
    attributes_initiative_description text,
    attributes_initiative_id bigint,
    attributes_initiative_name text,
    attributes_initiative_url text,
    attributes_seen boolean,
    attributes_submitted text,
    attributes_url text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (attributes_engagement_id) REFERENCES engagement(id),
    FOREIGN KEY (attributes_recipient_user_id) REFERENCES users(id),
    FOREIGN KEY (attributes_reviewer_user_id) REFERENCES users(id)
);

CREATE TABLE engagement_participant (
    person_id bigint,
    engagement_id text,
    user_id bigint,
    company_name text,
    title text,
    "type" text,
    PRIMARY KEY (person_id, engagement_id),
    FOREIGN KEY (engagement_id) REFERENCES engagement(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE engagement_tracker_match (
    _fivetran_id text,
    engagement_id text,
    "name" text,
    num_matches bigint,
    "type" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (engagement_id) REFERENCES engagement(id)
);

CREATE TABLE engagement (
    id text,
    user_id bigint,
    account_id text,
    account_name text,
    call_state text,
    compliance text,
    date_time double precision,
    disposition_connected boolean,
    disposition_gatekeeper boolean,
    disposition_tree boolean,
    disposition_voicemail boolean,
    duration double precision,
    engagement_type text,
    initiator text,
    languages text,
    no_show boolean,
    num_cust_questions bigint,
    num_engaging_questions bigint,
    opportunity_id text,
    opportunity_name text,
    processing_state text,
    subject text,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE user_team (
    team_id bigint,
    user_id bigint,
    PRIMARY KEY (team_id, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users (
    id bigint,
    manager_id bigint,
    active bigint,
    autojoin bigint,
    created_on text,
    email text,
    first_name text,
    invalidated text,
    last_name text,
    license_type text,
    "name" text,
    onboarding_status text,
    primary_team bigint,
    provisioning_type text,
    "role" text,
    sync_calendar bigint,
    sync_email bigint,
    title text,
    PRIMARY KEY (id),
    FOREIGN KEY (manager_id) REFERENCES users(id)
);
