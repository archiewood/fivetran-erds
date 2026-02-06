CREATE TABLE location (
    id text,
    external_id text,
    "name" text,
    "status" text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE time_tracking_break (
    id text,
    time_tracking_id text,
    PRIMARY KEY (id, time_tracking_id),
    FOREIGN KEY (time_tracking_id) REFERENCES time_tracking(id)
);

CREATE TABLE time_tracking_filter (
    id text,
    time_tracking_id text,
    active text,
    external_id text,
    title text,
    PRIMARY KEY (id, time_tracking_id),
    FOREIGN KEY (time_tracking_id) REFERENCES time_tracking(id)
);

CREATE TABLE time_tracking (
    id text,
    location_id text,
    user_id text,
    working_area_id text,
    actual_ends_at text,
    actual_starts_at text,
    break_time text,
    confirmed text,
    created_at text,
    employee_id text,
    end_signature_id text,
    ends_at text,
    filters text,
    is_confirmed text,
    last_edit_by text,
    secure_id text,
    start_signature_id text,
    starts_at text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (location_id) REFERENCES location(id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (working_area_id) REFERENCES working_area(id)
);

CREATE TABLE evaluation (
    id text,
    user_id text,
    actual text,
    charged text,
    compensation text,
    created_at text,
    "day" text,
    payout text,
    plan text,
    target text,
    updated_at timestamp,
    vacation text,
    vacation_source_id text,
    vacation_source_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE shifts_tags (
    shifts_id text,
    tag_id text,
    PRIMARY KEY (shifts_id, tag_id),
    FOREIGN KEY (shifts_id) REFERENCES shifts(id),
    FOREIGN KEY (tag_id) REFERENCES tags(id)
);

CREATE TABLE shifts (
    id text,
    location_id text,
    working_area_id text,
    company_id text,
    created_at text,
    edited text,
    ends_at text,
    event_note_content text,
    exact_pause_duration text,
    import_id text,
    note text,
    number_of_employees text,
    outlook_id text,
    recurrence_id text,
    remove text,
    shift_id text,
    starts_at text,
    "status" text,
    updated_at timestamp,
    user_shift text,
    uuid text,
    visible text,
    PRIMARY KEY (id),
    FOREIGN KEY (location_id) REFERENCES location(id),
    FOREIGN KEY (working_area_id) REFERENCES working_area(id)
);

CREATE TABLE working_area (
    id text,
    location_id text,
    custom_field_values jsonb,
    external_id text,
    "name" text,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE absence (
    id text,
    user_id text,
    absence_type_external_id text,
    absence_type_id text,
    charge_days_job_status text,
    confirm_message text,
    confirmed text,
    confirmed_at text,
    confirmed_by text,
    created_at text,
    created_by text,
    ends_at text,
    external_id text,
    force_calc_custom_hours text,
    full_day text,
    import_id text,
    note text,
    outlook_id text,
    paid_hours text,
    secure_id text,
    starts_at text,
    "status" text,
    time_zone text,
    title text,
    updated_at timestamp,
    uuid text,
    vacation_days text,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE user_working_area (
    user_id text,
    working_area_id text,
    PRIMARY KEY (user_id, working_area_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (working_area_id) REFERENCES working_area(id)
);

CREATE TABLE user_location (
    location_id text,
    user_id text,
    PRIMARY KEY (location_id, user_id),
    FOREIGN KEY (location_id) REFERENCES location(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE user_tags (
    tag_id text,
    user_id text,
    PRIMARY KEY (tag_id, user_id),
    FOREIGN KEY (tag_id) REFERENCES tags(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    abbrev text,
    birthday_level text,
    birthday_value text,
    cost_center_level text,
    cost_center_value text,
    cost_object_level text,
    cost_object_value text,
    descending_level text,
    descending_value text,
    email text,
    end_of_contract_level text,
    end_of_contract_value text,
    enterprise_id text,
    external_id text,
    home_office text,
    initial_time_account text,
    locale text,
    "name" text,
    phone_level text,
    phone_value text,
    salary text,
    staff_number text,
    start_of_work_level text,
    start_of_work_value text,
    "status" text,
    trial_period_level text,
    trial_period_value text,
    working_sessions_creator text,
    PRIMARY KEY (id)
);

CREATE TABLE tags (
    id text,
    location_id text,
    active text,
    color text,
    external_id text,
    title text,
    PRIMARY KEY (id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);
