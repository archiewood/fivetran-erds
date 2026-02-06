CREATE TABLE answer (
    id text,
    question_id text,
    response_id text,
    survey_id text,
    choice text,
    choice_label text,
    choices jsonb,
    "comment" text,
    created text,
    follow_up_answer text,
    follow_up_answer_choice text,
    follow_up_answer_choices jsonb,
    modified text,
    published_as_testimonial text,
    sentiment text,
    PRIMARY KEY (id),
    FOREIGN KEY (question_id) REFERENCES question(id),
    FOREIGN KEY (response_id) REFERENCES response(id),
    FOREIGN KEY (survey_id) REFERENCES survey(id)
);

CREATE TABLE response_team_member (
    id text,
    response_id text,
    created text,
    custom_attributes jsonb,
    email text,
    external_id text,
    modified text,
    "name" text,
    PRIMARY KEY (id, response_id),
    FOREIGN KEY (response_id) REFERENCES response(id)
);

CREATE TABLE response_answer (
    answer_id text,
    response_id text,
    PRIMARY KEY (answer_id, response_id),
    FOREIGN KEY (answer_id) REFERENCES answer(id),
    FOREIGN KEY (response_id) REFERENCES response(id)
);

CREATE TABLE response_tag (
    "name" text,
    response_id text,
    PRIMARY KEY ("name", response_id),
    FOREIGN KEY (response_id) REFERENCES response(id)
);

CREATE TABLE response (
    id text,
    survey_id text,
    created text,
    customer_company text,
    customer_custom_attributes text,
    customer_email text,
    customer_external_id text,
    customer_id text,
    customer_name text,
    customer_tags text,
    ip_address text,
    modified text,
    "source" text,
    team_member_id text,
    ticket_custom_attributes jsonb,
    ticket_external_id text,
    ticket_id text,
    ticket_subject text,
    PRIMARY KEY (id),
    FOREIGN KEY (survey_id) REFERENCES survey(id)
);

CREATE TABLE survey (
    id text,
    brand_name text,
    metric text,
    "name" text,
    survey_token text,
    survey_type text,
    PRIMARY KEY (id)
);

CREATE TABLE question_rule (
    "index" text,
    question_id text,
    "action" text,
    conditions jsonb,
    question jsonb,
    PRIMARY KEY ("index", question_id),
    FOREIGN KEY (question_id) REFERENCES question(id)
);

CREATE TABLE question (
    id text,
    survey_id text,
    choices jsonb,
    metric text,
    orders text,
    rating_scale text,
    required text,
    text text,
    PRIMARY KEY (id),
    FOREIGN KEY (survey_id) REFERENCES survey(id)
);
