CREATE TABLE event_guest_registration_answer (
    id text,
    event_guest_id text,
    answer text,
    label text,
    question_type text,
    PRIMARY KEY (id, event_guest_id),
    FOREIGN KEY (event_guest_id) REFERENCES event_guest(id)
);

CREATE TABLE event_guest (
    id text,
    event_id text,
    user_api_id text,
    approval_status text,
    check_in_qr_code text,
    checked_in_at text,
    created_at text,
    invited_at text,
    joined_at text,
    registered_at text,
    user_email text,
    user_name text,
    PRIMARY KEY (id, event_id),
    FOREIGN KEY (event_id) REFERENCES event(id),
    FOREIGN KEY (user_api_id) REFERENCES event(user_api_id)
);

CREATE TABLE event (
    id text,
    cover_url text,
    description text,
    duration_interval text,
    end_at text,
    event_type text,
    geo_address_json text,
    geo_latitude text,
    geo_longitude text,
    "name" text,
    series_api_id text,
    social_image_url text,
    start_at text,
    timezone text,
    url text,
    user_api_id text,
    visibility text,
    PRIMARY KEY (id)
);

CREATE TABLE event_host (
    event_id text,
    id text,
    avatar_url text,
    email text,
    "name" text,
    PRIMARY KEY (event_id, id),
    FOREIGN KEY (event_id) REFERENCES event(id),
    FOREIGN KEY (id) REFERENCES event(user_api_id)
);
