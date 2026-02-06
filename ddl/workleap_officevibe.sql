CREATE TABLE groups (
    id text,
    group_type text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE group_user (
    email text,
    group_id text,
    PRIMARY KEY (email, group_id),
    FOREIGN KEY (email) REFERENCES users(email),
    FOREIGN KEY (group_id) REFERENCES groups(id)
);

CREATE TABLE feedback_label (
    id text,
    color text,
    title text,
    PRIMARY KEY (id)
);

CREATE TABLE engagement_metric_value (
    id text,
    engagement_date text,
    display_name text,
    "value" text,
    PRIMARY KEY (id, engagement_date),
    FOREIGN KEY (engagement_date) REFERENCES engagement("date")
);

CREATE TABLE engagement (
    "date" text,
    group_name text,
    PRIMARY KEY ("date")
);

CREATE TABLE user_managed_group (
    "index" text,
    user_email text,
    managed_group text,
    PRIMARY KEY ("index", user_email),
    FOREIGN KEY (user_email) REFERENCES users(email)
);

CREATE TABLE user_member_group (
    "index" text,
    user_email text,
    member_group text,
    PRIMARY KEY ("index", user_email),
    FOREIGN KEY (user_email) REFERENCES users(email)
);

CREATE TABLE users (
    email text,
    first_name text,
    fist_name text,
    is_admin text,
    is_company_manager text,
    is_group_manager text,
    job_title text,
    last_name text,
    user_name text,
    PRIMARY KEY (email)
);

CREATE TABLE feedback_tag (
    "index" text,
    feedback_id text,
    tags text,
    PRIMARY KEY ("index", feedback_id),
    FOREIGN KEY (feedback_id) REFERENCES feedback(id),
    FOREIGN KEY (tags) REFERENCES feedback_label(id)
);

CREATE TABLE feedback_reply (
    id text,
    feedback_id text,
    user_email text,
    creation_date text,
    message text,
    user_display_name text,
    PRIMARY KEY (id, feedback_id),
    FOREIGN KEY (feedback_id) REFERENCES feedback(id),
    FOREIGN KEY (user_email) REFERENCES users(email)
);

CREATE TABLE feedback (
    id text,
    user_email text,
    creation_date text,
    last_modification_date text,
    message text,
    network_id text,
    question_asked text,
    user_display_name text,
    PRIMARY KEY (id),
    FOREIGN KEY (user_email) REFERENCES users(email)
);
