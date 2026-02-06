CREATE TABLE survey_response_answered_question (
    question_id text,
    response_id text,
    answer text,
    "comment" text,
    question_title text,
    question_type text,
    selected_option_id text,
    PRIMARY KEY (question_id, response_id),
    FOREIGN KEY (response_id) REFERENCES survey_response(id)
);

CREATE TABLE survey_response (
    id text,
    anon_visitor_id text,
    identities text,
    ip_address text,
    nps_category text,
    nps_reason text,
    nps_respondent_id text,
    nps_response_uri text,
    nps_score text,
    nps_time text,
    nudge_id text,
    nudge_name text,
    page text,
    referrer text,
    "time" text,
    token text,
    user_agent text,
    -- properties_* (dynamic column),
    PRIMARY KEY (id)
);
