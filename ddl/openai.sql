CREATE TABLE embedding (
    api_key_id text,
    end_time text,
    model text,
    start_time text,
    project_id text,
    user_id text,
    input_token text,
    num_model_request text,
    object text,
    PRIMARY KEY (api_key_id, end_time, model, start_time, project_id, user_id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE project (
    id text,
    archived_at text,
    created_at text,
    "name" text,
    object text,
    "status" text,
    PRIMARY KEY (id)
);

CREATE TABLE completion (
    api_key_id text,
    end_time text,
    model text,
    start_time text,
    project_id text,
    user_id text,
    batch text,
    input_audio_token text,
    input_cached_token text,
    input_token text,
    num_model_request text,
    object text,
    output_audio_token text,
    output_token text,
    PRIMARY KEY (api_key_id, end_time, model, start_time, project_id, user_id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    added_at text,
    email text,
    "name" text,
    object text,
    "role" text,
    PRIMARY KEY (id)
);

CREATE TABLE audio_speech (
    api_key_id text,
    end_time text,
    model text,
    start_time text,
    project_id text,
    user_id text,
    character text,
    input_token text,
    num_model_request text,
    object text,
    PRIMARY KEY (api_key_id, end_time, model, start_time, project_id, user_id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE cost (
    _fivetran_id text,
    project_id text,
    amount_currency text,
    amount_value text,
    end_time text,
    line_item text,
    object text,
    organization_id text,
    start_time text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE project_user (
    id text,
    project_id text,
    PRIMARY KEY (id, project_id),
    FOREIGN KEY (id) REFERENCES users(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE audio_transcription (
    api_key_id text,
    end_time text,
    model text,
    start_time text,
    project_id text,
    user_id text,
    num_model_request text,
    object text,
    "second" text,
    PRIMARY KEY (api_key_id, end_time, model, start_time, project_id, user_id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);
