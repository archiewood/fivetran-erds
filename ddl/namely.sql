CREATE TABLE groups (
    id text,
    address_country_id text,
    group_type_id text,
    address_address_1 text,
    address_address_2 text,
    address_city text,
    address_country text,
    address_phone text,
    address_state text,
    address_state_id text,
    address_zip text,
    count text,
    is_team text,
    title text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (address_country_id) REFERENCES country(id),
    FOREIGN KEY (group_type_id) REFERENCES group_type(id)
);

CREATE TABLE group_type (
    id text,
    deletable text,
    field_name text,
    title text,
    "type" text,
    x_groups_as_team text,
    PRIMARY KEY (id)
);

CREATE TABLE event (
    id text,
    profile text,
    appreciations jsonb,
    can_comment text,
    can_destroy text,
    can_edit text,
    can_like text,
    content text,
    created_at timestamp,
    file text,
    href text,
    html_content text,
    liked_by_current_profile text,
    likes_count text,
    "time" timestamp,
    "type" text,
    updated_at timestamp,
    use_comments text,
    utc_offset text,
    years_at_company text,
    PRIMARY KEY (id),
    FOREIGN KEY (profile) REFERENCES profile(id)
);

CREATE TABLE "comment" (
    id text,
    event_id text,
    profile text,
    can_destroy text,
    content text,
    created_at timestamp,
    html_content text,
    liked_by_current_profile text,
    likes_count text,
    utc_offset text,
    PRIMARY KEY (id, event_id),
    FOREIGN KEY (event_id) REFERENCES event(id),
    FOREIGN KEY (profile) REFERENCES profile(id)
);

CREATE TABLE profile_group (
    group_id text,
    profile_id text,
    PRIMARY KEY (group_id, profile_id),
    FOREIGN KEY (group_id) REFERENCES groups(id),
    FOREIGN KEY (profile_id) REFERENCES profile(id)
);

CREATE TABLE profile_image (
    id text,
    profile_id text,
    filename text,
    mime_type text,
    original text,
    thumb_150_x_150 text,
    thumb_150_x_150_c text,
    thumb_300_x_300 text,
    thumb_450_x_450 text,
    thumb_75_x_75 text,
    thumb_75_x_75_c text,
    thumb_800_x_800 text,
    PRIMARY KEY (id, profile_id),
    FOREIGN KEY (profile_id) REFERENCES profile(id)
);

CREATE TABLE reports_to (
    profile_id text,
    reports_to_profile_id text,
    PRIMARY KEY (profile_id, reports_to_profile_id),
    FOREIGN KEY (profile_id) REFERENCES profile(id),
    FOREIGN KEY (reports_to_profile_id) REFERENCES profile(id)
);

CREATE TABLE profile (
    id text,
    home_country_id text,
    job_id text,
    office_country_id text,
    access_role text,
    allergies text,
    anthem_member_id text,
    bio text,
    communication_style text,
    company text,
    company_uuid text,
    created_at timestamp,
    current_job_description text,
    date_format text,
    departure_date text,
    diversity_stats jsonb,
    division text,
    dob text,
    email text,
    emergency_contact text,
    emergency_contact_phone text,
    emergency_contact_relationship text,
    employee_id text,
    employee_level text,
    employee_type text,
    employee_wage_theft_prevention_act text,
    engineering_team text,
    ethnicity text,
    first_name text,
    full_name text,
    gender text,
    gender_identity jsonb,
    home_address_1 text,
    home_address_2 text,
    home_city text,
    home_phone text,
    home_state_id text,
    home_zip text,
    hrbp text,
    is_namely_admin text,
    job_description text,
    last_name text,
    linkedin_url text,
    marital_status text,
    middle_name text,
    mobile_phone text,
    namely_time_employee_url text,
    namely_time_manager_url text,
    offer_letter text,
    office_address_1 text,
    office_address_2 text,
    office_city text,
    office_direct_dial text,
    office_main_number text,
    office_phone text,
    office_state_id text,
    office_zip text,
    on_target_earnings text,
    people_partner text,
    personal_email text,
    preferred_name text,
    preferred_pronoun text,
    relationship_disclosure text,
    resume text,
    salary_amount_raw text,
    salary_currency_type text,
    salary_date text,
    salary_guid text,
    salary_is_hourly boolean,
    salary_payroll_company_name text,
    salary_payroll_job_id text,
    salary_rate text,
    salary_yearly_amount double precision,
    ssn text,
    start_date text,
    t_shirt_size text,
    team_positions jsonb,
    temporary_address_covid_19 text,
    updated_at timestamp,
    user_status text,
    PRIMARY KEY (id),
    FOREIGN KEY (home_country_id) REFERENCES country(id),
    FOREIGN KEY (job_id) REFERENCES job_title(id),
    FOREIGN KEY (office_country_id) REFERENCES country(id)
);

CREATE TABLE country (
    id text,
    "name" text,
    subdivision_type text,
    PRIMARY KEY (id)
);

CREATE TABLE resource_in_folder (
    id text,
    folder_id text,
    file_format text,
    file_name text,
    file_size text,
    file_url text,
    last_edited text,
    link text,
    title text,
    PRIMARY KEY (id),
    FOREIGN KEY (folder_id) REFERENCES folder(id)
);

CREATE TABLE resource_not_in_folder (
    id text,
    folder_id text,
    file_format text,
    file_name text,
    file_size text,
    file_url text,
    last_edited text,
    link text,
    title text,
    PRIMARY KEY (id),
    FOREIGN KEY (folder_id) REFERENCES folder(id)
);

CREATE TABLE section_block_title (
    block_title text,
    profile_field_section_id text,
    PRIMARY KEY (block_title, profile_field_section_id),
    FOREIGN KEY (profile_field_section_id) REFERENCES profile_field_section(id)
);

CREATE TABLE profile_field_section (
    id text,
    title text,
    PRIMARY KEY (id)
);

CREATE TABLE comment_like (
    id text,
    comment_id text,
    full_name text,
    href text,
    job_title text,
    PRIMARY KEY (id, comment_id),
    FOREIGN KEY (comment_id) REFERENCES "comment"(id)
);

CREATE TABLE folder (
    id text,
    items_count text,
    "position" text,
    title text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE job_tier (
    id text,
    active text,
    defaults text,
    numerical_id text,
    title text,
    PRIMARY KEY (id)
);

CREATE TABLE profile_field (
    id text,
    "section" text,
    block_index text,
    defaults text,
    deletable text,
    label text,
    "name" text,
    "type" text,
    valid_format_info text,
    PRIMARY KEY (id),
    FOREIGN KEY ("section") REFERENCES profile_field_section(id)
);

CREATE TABLE team_category (
    category_id text,
    team_id text,
    PRIMARY KEY (category_id, team_id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE team (
    id text,
    count text,
    created_at timestamp,
    email text,
    "name" text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE category (
    id text,
    title text,
    PRIMARY KEY (id)
);

CREATE TABLE job_title (
    id text,
    job_tier text,
    parent_id text,
    active text,
    title text,
    PRIMARY KEY (id),
    FOREIGN KEY (job_tier) REFERENCES job_tier(id),
    FOREIGN KEY (parent_id) REFERENCES job_title(id)
);

CREATE TABLE event_like (
    id text,
    event_id text,
    full_name text,
    href text,
    job_title text,
    PRIMARY KEY (id, event_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE notification (
    id text,
    profile_id text,
    requester_id text,
    responder_id text,
    action_url text,
    "read" text,
    seen text,
    text text,
    time_off_request_id text,
    timestamps timestamp,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (profile_id) REFERENCES profile(id),
    FOREIGN KEY (requester_id) REFERENCES profile(id),
    FOREIGN KEY (responder_id) REFERENCES profile(id)
);
