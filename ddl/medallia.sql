-- Note
-- field_option table consists of options for ENUM type fields.

CREATE TABLE survey_program (
    id text,
    activation_date timestamp,
    modified_by text,
    modified_on timestamp,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE unit (
    id bigint,
    identifier text,
    city text,
    "name" text,
    postal_code text,
    street_address text,
    timezone text,
    PRIMARY KEY (id, identifier)
);

CREATE TABLE "group" (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE unit_group (
    group_id text,
    unit_id bigint,
    PRIMARY KEY (group_id, unit_id),
    FOREIGN KEY (group_id) REFERENCES "group"(id),
    FOREIGN KEY (unit_id) REFERENCES unit(id)
);

CREATE TABLE feedback_topic (
    _fivetran_id text,
    feedback_id bigint,
    question_id text,
    "comment" text,
    topic_id bigint,
    topic_name text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (feedback_id) REFERENCES feedback_history(id),
    FOREIGN KEY (question_id) REFERENCES survey_question(question_id)
);

CREATE TABLE feedback_theme (
    _fivetran_id text,
    feedback_id bigint,
    question_id text,
    "comment" text,
    theme_id bigint,
    theme_name text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (feedback_id) REFERENCES feedback_history(id),
    FOREIGN KEY (question_id) REFERENCES survey_question(question_id)
);

CREATE TABLE feedback_answer (
    feedback_id bigint,
    question_id text,
    "value" text,
    rank integer,
    PRIMARY KEY (feedback_id, question_id, "value"),
    FOREIGN KEY (feedback_id) REFERENCES feedback_history(id),
    FOREIGN KEY (question_id) REFERENCES survey_question(question_id),
    FOREIGN KEY ("value") REFERENCES field_option(field_id)
);

CREATE TABLE feedback_theme_region (
    end_index integer,
    start_index integer,
    feedback_theme_id text,
    "value" text,
    PRIMARY KEY (end_index, start_index, feedback_theme_id),
    FOREIGN KEY (feedback_theme_id) REFERENCES feedback_theme(_fivetran_id)
);

CREATE TABLE feedback_history (
    id bigint,
    a_unit_identifier text,
    e_accepteddate timestamp,
    e_creationdate timestamp,
    e_expirationdate timestamp,
    e_lastupdated timestamp,
    e_responsedate timestamp,
    e_status text,
    e_survey_method text,
    e_survey_source text,
    PRIMARY KEY (id),
    FOREIGN KEY (a_unit_identifier) REFERENCES unit(id)
);

CREATE TABLE feedback_topic_region (
    end_index integer,
    start_index integer,
    feedback_topic_id text,
    "value" text,
    PRIMARY KEY (end_index, start_index, feedback_topic_id),
    FOREIGN KEY (feedback_topic_id) REFERENCES feedback_topic(_fivetran_id)
);

CREATE TABLE feedback_sentiment_region (
    end_index integer,
    start_index integer,
    feedback_sentiment_id text,
    "value" text,
    PRIMARY KEY (end_index, start_index, feedback_sentiment_id),
    FOREIGN KEY (feedback_sentiment_id) REFERENCES feedback_sentiment(_fivetran_id)
);

CREATE TABLE field_option (
    id text,
    field_id text,
    "name" text,
    numeric_value integer,
    PRIMARY KEY (id, field_id),
    FOREIGN KEY (field_id) REFERENCES field_meta_data(id)
);

CREATE TABLE feedback_sentiment (
    _fivetran_id text,
    feedback_id bigint,
    question_id text,
    "comment" text,
    sentiment text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (feedback_id) REFERENCES feedback_history(id),
    FOREIGN KEY (question_id) REFERENCES survey_question(question_id)
);

CREATE TABLE field_meta_data (
    id text,
    data_type text,
    filterable boolean,
    multivalued boolean,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE survey_question (
    program_id text,
    question_id text,
    text text,
    PRIMARY KEY (program_id, question_id),
    FOREIGN KEY (program_id) REFERENCES survey_program(id),
    FOREIGN KEY (question_id) REFERENCES field_meta_data(id)
);

CREATE TABLE customer_profile (
    id bigint,
    PRIMARY KEY (id)
);
