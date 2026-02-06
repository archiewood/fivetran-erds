CREATE TABLE external_account (
    id bigint,
    created_at timestamp,
    external_created_at timestamp,
    external_id text,
    is_blocking boolean,
    last_active_at timestamp,
    ltv_cents bigint,
    mrr_cents bigint,
    "name" text,
    plan text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE user_team (
    team_id bigint,
    user_id bigint,
    PRIMARY KEY (team_id, user_id),
    FOREIGN KEY (team_id) REFERENCES team(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE label (
    id bigint,
    parent_id bigint,
    created_at timestamp,
    full_name text,
    "level" bigint,
    "name" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (parent_id) REFERENCES label(id)
);

CREATE TABLE "comment" (
    id bigint,
    created_by_id bigint,
    suggestion_id bigint,
    body text,
    channel text,
    created_at timestamp,
    inappropriate_flags_count bigint,
    is_admin_comment boolean,
    "state" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_id) REFERENCES "user"(id),
    FOREIGN KEY (suggestion_id) REFERENCES suggestion_history(id)
);

CREATE TABLE team (
    id bigint,
    created_at timestamp,
    "name" text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE custom_field_enum_value (
    id bigint,
    is_default boolean,
    label text,
    numeric_value double precision,
    PRIMARY KEY (id)
);

CREATE TABLE supporter (
    id bigint,
    suggestion_id bigint,
    user_id bigint,
    channel text,
    created_at timestamp,
    how text,
    is_subscribed boolean,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (suggestion_id) REFERENCES suggestion_history(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE suggestion_label (
    label_id bigint,
    suggestion_id bigint,
    PRIMARY KEY (label_id, suggestion_id),
    FOREIGN KEY (label_id) REFERENCES label(id),
    FOREIGN KEY (suggestion_id) REFERENCES suggestion_history(id)
);

CREATE TABLE feature_status (
    id bigint,
    created_by_id bigint,
    created_at timestamp,
    is_default boolean,
    "name" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_id) REFERENCES "user"(id)
);

CREATE TABLE supporter_message (
    id bigint,
    created_by_id bigint,
    suggestion_id bigint,
    body text,
    created_at timestamp,
    mail_clicked_count bigint,
    mail_opened_count bigint,
    mail_sent_count bigint,
    notification_email_address text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_id) REFERENCES "user"(id),
    FOREIGN KEY (suggestion_id) REFERENCES suggestion_history(id)
);

CREATE TABLE request (
    id bigint,
    suggestion_id bigint,
    supporter_id bigint,
    user_id bigint,
    body text,
    channel text,
    created_at timestamp,
    prompt text,
    referrer text,
    severity bigint,
    source_guid text,
    source_title text,
    source_type text,
    source_url text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (suggestion_id) REFERENCES suggestion_history(id),
    FOREIGN KEY (supporter_id) REFERENCES supporter(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE suggestion_history (
    id bigint,
    category_id bigint,
    created_by_id bigint,
    forum_id bigint,
    parent_suggestion_id bigint,
    status_id bigint,
    approved_at timestamp,
    average_engagement text,
    body text,
    channel text,
    closed_at timestamp,
    created_at timestamp,
    engagement_trend text,
    first_support_at timestamp,
    inappropriate_flags_count bigint,
    is_blocker boolean,
    recent_engagement bigint,
    "state" text,
    title text,
    unmergeable boolean,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (category_id) REFERENCES category(id),
    FOREIGN KEY (created_by_id) REFERENCES "user"(id),
    FOREIGN KEY (forum_id) REFERENCES forum(id),
    FOREIGN KEY (parent_suggestion_id) REFERENCES suggestion_history(id),
    FOREIGN KEY (status_id) REFERENCES "status"(id)
);

CREATE TABLE category (
    id bigint,
    forum_id bigint,
    created_at timestamp,
    "name" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (forum_id) REFERENCES forum(id)
);

CREATE TABLE message (
    id bigint,
    comment_id bigint,
    note_id bigint,
    request_id bigint,
    user_id bigint,
    created_at timestamp,
    is_email_reply boolean,
    stripped_html text,
    stripped_text text,
    thread_updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (comment_id) REFERENCES "comment"(id),
    FOREIGN KEY (note_id) REFERENCES note(id),
    FOREIGN KEY (request_id) REFERENCES request(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE "user" (
    id bigint,
    allowed_state text,
    city text,
    comment_notifications boolean,
    country text,
    created_at timestamp,
    email_address text,
    email_confirmed boolean,
    guid text,
    is_admin boolean,
    is_owner boolean,
    job_title text,
    last_login timestamp,
    "name" text,
    region text,
    "state" text,
    status_notifications boolean,
    support_created_at timestamp,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE forum (
    id bigint,
    category_required boolean,
    classic_voting boolean,
    created_at timestamp,
    example text,
    is_private boolean,
    is_public boolean,
    "name" text,
    prompt text,
    updated_at timestamp,
    welcome_message text,
    PRIMARY KEY (id)
);

CREATE TABLE external_user (
    id bigint,
    external_account_id bigint,
    user_id bigint,
    created_at timestamp,
    email text,
    external_created_at timestamp,
    external_id text,
    ip text,
    last_seen_at timestamp,
    "name" text,
    seen_days bigint,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (external_account_id) REFERENCES external_account(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE feature_suggestion (
    feature_id bigint,
    suggestion_id bigint,
    PRIMARY KEY (feature_id, suggestion_id),
    FOREIGN KEY (feature_id) REFERENCES feature_history(id),
    FOREIGN KEY (suggestion_id) REFERENCES suggestion_history(id)
);

CREATE TABLE nps_rating (
    id bigint,
    user_id bigint,
    body text,
    created_at timestamp,
    prompt text,
    rating bigint,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE note (
    id bigint,
    created_by_id bigint,
    suggestion_id bigint,
    body text,
    created_at timestamp,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_id) REFERENCES "user"(id),
    FOREIGN KEY (suggestion_id) REFERENCES suggestion_history(id)
);

CREATE TABLE product_area (
    id bigint,
    created_by_id bigint,
    created_at timestamp,
    "name" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_id) REFERENCES "user"(id)
);

CREATE TABLE "status" (
    id bigint,
    allow_comments boolean,
    created_at timestamp,
    is_open boolean,
    "name" text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE feature_history (
    id bigint,
    created_by_id bigint,
    feature_status_id bigint,
    product_area_id bigint,
    created_at timestamp,
    description text,
    is_blocker boolean,
    "name" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_id) REFERENCES "user"(id),
    FOREIGN KEY (feature_status_id) REFERENCES feature_status(id),
    FOREIGN KEY (product_area_id) REFERENCES product_area(id)
);
