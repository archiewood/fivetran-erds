CREATE TABLE question_answer_choice (
    id text,
    question_id text,
    survey_id text,
    content text,
    PRIMARY KEY (id, question_id, survey_id),
    FOREIGN KEY (question_id) REFERENCES question(id),
    FOREIGN KEY (survey_id) REFERENCES question(survey_id)
);

CREATE TABLE question (
    id text,
    survey_id text,
    introduction text,
    question text,
    "type" text,
    PRIMARY KEY (id, survey_id),
    FOREIGN KEY (survey_id) REFERENCES survey(id)
);

CREATE TABLE response (
    uuid text,
    survey_id text,
    collected_at text,
    device_type text,
    languages text,
    operating_system text,
    respondent_attributes jsonb,
    respondent_uuid text,
    url text,
    PRIMARY KEY (uuid),
    FOREIGN KEY (survey_id) REFERENCES survey(id)
);

CREATE TABLE nps_response (
    question_id text,
    response_uuid text,
    survey_id text,
    answer_content text,
    answer_tag text,
    PRIMARY KEY (question_id, response_uuid),
    FOREIGN KEY (response_uuid) REFERENCES response(uuid),
    FOREIGN KEY (survey_id) REFERENCES response(survey_id)
);

CREATE TABLE text_response (
    question_id text,
    response_uuid text,
    survey_id text,
    answer text,
    PRIMARY KEY (question_id, response_uuid),
    FOREIGN KEY (response_uuid) REFERENCES response(uuid),
    FOREIGN KEY (survey_id) REFERENCES response(survey_id)
);

CREATE TABLE smiley_scale_response (
    question_id text,
    response_uuid text,
    survey_id text,
    answer_content text,
    answer_id text,
    answer_rating text,
    PRIMARY KEY (question_id, response_uuid),
    FOREIGN KEY (response_uuid) REFERENCES response(uuid),
    FOREIGN KEY (survey_id) REFERENCES response(survey_id)
);

CREATE TABLE ranking_response (
    answer_id text,
    question_id text,
    response_uuid text,
    answer_content text,
    answer_rank text,
    survey_id text,
    PRIMARY KEY (answer_id, question_id, response_uuid)
);

CREATE TABLE form_response (
    _fivetran_id text,
    response_uuid text,
    survey_id text,
    field_content text,
    field_type text,
    question_id text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (response_uuid) REFERENCES response(uuid),
    FOREIGN KEY (survey_id) REFERENCES response(survey_id)
);

CREATE TABLE button_next_response (
    question_id text,
    response_uuid text,
    survey_id text,
    action_performed text,
    PRIMARY KEY (question_id, response_uuid),
    FOREIGN KEY (response_uuid) REFERENCES response(uuid),
    FOREIGN KEY (survey_id) REFERENCES response(survey_id)
);

CREATE TABLE empty_response (
    question_id text,
    response_uuid text,
    survey_id text,
    action_performed text,
    PRIMARY KEY (question_id, response_uuid),
    FOREIGN KEY (response_uuid) REFERENCES response(uuid),
    FOREIGN KEY (survey_id) REFERENCES response(survey_id)
);

CREATE TABLE single_response (
    answer_id text,
    question_id text,
    response_uuid text,
    survey_id text,
    answer_comment text,
    answer_content text,
    PRIMARY KEY (answer_id, question_id, response_uuid),
    FOREIGN KEY (response_uuid) REFERENCES response(uuid),
    FOREIGN KEY (survey_id) REFERENCES response(survey_id)
);

CREATE TABLE numerical_scale_response (
    question_id text,
    response_uuid text,
    survey_id text,
    answer_comment text,
    answer_content text,
    answer_disclaimer_accepted text,
    answer_id text,
    answer_rating text,
    answer_translated_comment text,
    PRIMARY KEY (question_id, response_uuid),
    FOREIGN KEY (response_uuid) REFERENCES response(uuid),
    FOREIGN KEY (survey_id) REFERENCES response(survey_id)
);

CREATE TABLE matrix_response (
    answer_id text,
    question_id text,
    response_uuid text,
    answer_content text,
    answer_score text,
    survey_id text,
    PRIMARY KEY (answer_id, question_id, response_uuid)
);

CREATE TABLE rating_response (
    question_id text,
    response_uuid text,
    survey_id text,
    answer_content text,
    answer_id text,
    answer_rating text,
    PRIMARY KEY (question_id, response_uuid),
    FOREIGN KEY (response_uuid) REFERENCES response(uuid),
    FOREIGN KEY (survey_id) REFERENCES response(survey_id)
);

CREATE TABLE date_response (
    question_id text,
    response_uuid text,
    survey_id text,
    answer text,
    PRIMARY KEY (question_id, response_uuid),
    FOREIGN KEY (response_uuid) REFERENCES response(uuid),
    FOREIGN KEY (survey_id) REFERENCES response(survey_id)
);

CREATE TABLE multiple_response (
    answer_id text,
    question_id text,
    response_uuid text,
    survey_id text,
    answer_comment text,
    answer_content text,
    question_type text,
    PRIMARY KEY (answer_id, question_id, response_uuid),
    FOREIGN KEY (response_uuid) REFERENCES response(uuid),
    FOREIGN KEY (survey_id) REFERENCES response(survey_id)
);

CREATE TABLE dropdown_response (
    answer_id text,
    question_id text,
    response_uuid text,
    survey_id text,
    answer_comment text,
    answer_content text,
    PRIMARY KEY (answer_id, question_id, response_uuid),
    FOREIGN KEY (response_uuid) REFERENCES response(uuid),
    FOREIGN KEY (survey_id) REFERENCES response(survey_id)
);

CREATE TABLE survey (
    id text,
    created_at text,
    enabled text,
    launch_end_at text,
    launch_response_limit text,
    launch_start_at text,
    "name" text,
    response text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE respondent_attribute (
    id text,
    "name" text,
    response_respondent_uuid text,
    "value" text,
    PRIMARY KEY (id)
);
