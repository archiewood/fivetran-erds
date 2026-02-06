-- Note: 
-- Tag in the RESPONSE_TAG Table will be renamed to tags for the new connectors.

CREATE TABLE unsubscribed_people (
    person_id text,
    unsubscribed_at text,
    PRIMARY KEY (person_id),
    FOREIGN KEY (person_id) REFERENCES person(id)
);

CREATE TABLE person (
    id text,
    created_at timestamp,
    email text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE response_tag (
    tags text,
    response_id text,
    PRIMARY KEY (tags, response_id),
    FOREIGN KEY (response_id) REFERENCES response(id)
);

CREATE TABLE response_note (
    id text,
    response_id text,
    created_at timestamp,
    text text,
    user_email text,
    PRIMARY KEY (id),
    FOREIGN KEY (response_id) REFERENCES response(id)
);

CREATE TABLE question (
    id text,
    text text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE response_answer (
    id text,
    question_id text,
    response_id text,
    email text,
    free_response text,
    "name" text,
    scale integer,
    PRIMARY KEY (id),
    FOREIGN KEY (question_id) REFERENCES question(id),
    FOREIGN KEY (response_id) REFERENCES response(id)
);

CREATE TABLE response (
    id text,
    person_id text,
    "comment" text,
    created_at timestamp,
    permalink text,
    score integer,
    survey_type text,
    updated_at timestamp,
    -- properties_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (person_id) REFERENCES person(id)
);

CREATE TABLE response_answer_selection (
    id text,
    response_answer_id text,
    extra_text text,
    text text,
    PRIMARY KEY (id, response_answer_id),
    FOREIGN KEY (response_answer_id) REFERENCES response_answer(id)
);
