CREATE TABLE form_metadata_question_option (
    id text,
    form_metadata_id text,
    form_metadata_question_id text,
    label text,
    "value" text,
    PRIMARY KEY (id, form_metadata_id, form_metadata_question_id),
    FOREIGN KEY (form_metadata_id) REFERENCES form_metadata(id),
    FOREIGN KEY (form_metadata_question_id) REFERENCES form_metadata_question(id)
);

CREATE TABLE form_metadata_question (
    id text,
    form_metadata_id text,
    "name" text,
    "type" text,
    PRIMARY KEY (id, form_metadata_id),
    FOREIGN KEY (form_metadata_id) REFERENCES form_metadata(id)
);

CREATE TABLE form_metadata_calculation (
    id text,
    form_metadata_id text,
    "name" text,
    "type" text,
    PRIMARY KEY (id, form_metadata_id),
    FOREIGN KEY (form_metadata_id) REFERENCES form_metadata(id)
);

CREATE TABLE form_metadata_url_parameter (
    id text,
    form_metadata_id text,
    "name" text,
    PRIMARY KEY (id, form_metadata_id),
    FOREIGN KEY (form_metadata_id) REFERENCES form_metadata(id)
);

CREATE TABLE form_metadata_document (
    id text,
    form_metadata_id text,
    "name" text,
    PRIMARY KEY (id, form_metadata_id),
    FOREIGN KEY (form_metadata_id) REFERENCES form_metadata(id)
);

CREATE TABLE form_metadata_scheduling (
    id text,
    form_metadata_id text,
    "name" text,
    PRIMARY KEY (id, form_metadata_id),
    FOREIGN KEY (form_metadata_id) REFERENCES form_metadata(id)
);

CREATE TABLE form_metadata_payment (
    id text,
    form_metadata_id text,
    "name" text,
    PRIMARY KEY (id, form_metadata_id),
    FOREIGN KEY (form_metadata_id) REFERENCES form_metadata(id)
);

CREATE TABLE form_metadata (
    id text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES form(id)
);

CREATE TABLE form (
    id text,
    "name" text,
    uuid text,
    PRIMARY KEY (id)
);

CREATE TABLE submission_question (
    id text,
    submission_id text,
    "name" text,
    "type" text,
    "value" jsonb,
    PRIMARY KEY (id, submission_id),
    FOREIGN KEY (submission_id) REFERENCES submission(id)
);

CREATE TABLE submission_calculation (
    id text,
    submission_id text,
    "name" text,
    "type" text,
    "value" text,
    PRIMARY KEY (id, submission_id),
    FOREIGN KEY (submission_id) REFERENCES submission(id)
);

CREATE TABLE submission_url_parameter (
    id text,
    submission_id text,
    "name" text,
    "value" text,
    PRIMARY KEY (id, submission_id),
    FOREIGN KEY (submission_id) REFERENCES submission(id)
);

CREATE TABLE submission_schedule (
    id text,
    submission_id text,
    email text,
    event_end_time text,
    event_id text,
    event_start_time text,
    event_url text,
    full_name text,
    "name" text,
    reschedule_or_cancel_url text,
    timezone text,
    PRIMARY KEY (id, submission_id),
    FOREIGN KEY (submission_id) REFERENCES submission(id)
);

CREATE TABLE submission_payment (
    id text,
    submission_id text,
    currency text,
    discount_code text,
    email text,
    "name" text,
    payment_id text,
    "status" text,
    stripe_customer_id text,
    stripe_customer_url text,
    stripe_payment_url text,
    stripe_subscription_id text,
    total_amount text,
    PRIMARY KEY (id, submission_id),
    FOREIGN KEY (submission_id) REFERENCES submission(id)
);

CREATE TABLE submission (
    id text,
    form_id text,
    documents jsonb,
    last_updated_at text,
    login_email text,
    quiz_max_score text,
    quiz_score text,
    submission_time text,
    PRIMARY KEY (id, form_id),
    FOREIGN KEY (form_id) REFERENCES form(id)
);
