CREATE TABLE worker_data_collection_check (
    id text,
    worker_id text,
    canceled_at text,
    confirmed_at text,
    confirmed_user text,
    rejected_at text,
    requested_at text,
    "status" text,
    uploaded_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (worker_id) REFERENCES worker(id)
);

CREATE TABLE worker (
    id text,
    approved_at text,
    email text,
    is_active text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE note (
    id text,
    applicant_id text,
    user_id text,
    content text,
    created_at text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (applicant_id) REFERENCES applicant(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE timestamp_funnel (
    funnel_id text,
    timestamp_id text,
    PRIMARY KEY (funnel_id, timestamp_id),
    FOREIGN KEY (funnel_id) REFERENCES funnel(id),
    FOREIGN KEY (timestamp_id) REFERENCES timestamps(id)
);

CREATE TABLE timestamp_data_key (
    data_key text,
    timestamps_id text,
    PRIMARY KEY (data_key, timestamps_id),
    FOREIGN KEY (timestamps_id) REFERENCES timestamps(id)
);

CREATE TABLE timestamps (
    id text,
    busy text,
    lower_bound text,
    number_of_days text,
    title text,
    "type" text,
    upper_bound text,
    PRIMARY KEY (id)
);

CREATE TABLE user_activity (
    id text,
    applicant_id text,
    user_id text,
    activity_field text,
    activity_funnel_id text,
    activity_funnel_title text,
    activity_stage_id text,
    activity_stage_title text,
    activity_type text,
    created_at text,
    "key" text,
    owner_id text,
    owner_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (applicant_id) REFERENCES applicant(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE template_funnel (
    funnel_id text,
    template_id text,
    PRIMARY KEY (funnel_id, template_id),
    FOREIGN KEY (funnel_id) REFERENCES funnel(id),
    FOREIGN KEY (template_id) REFERENCES template(id)
);

CREATE TABLE template_field (
    field text,
    template_id text,
    PRIMARY KEY (field, template_id),
    FOREIGN KEY (template_id) REFERENCES template(id)
);

CREATE TABLE template (
    id text,
    title text,
    PRIMARY KEY (id)
);

CREATE TABLE applicant_label (
    _fivetran_id text,
    applicant_id text,
    completed text,
    title text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (applicant_id) REFERENCES applicant(id)
);

CREATE TABLE interview_session (
    id text,
    applicant_id text,
    stage_title text,
    booked_time text,
    end_time text,
    instructions text,
    location text,
    recruiter text,
    showed_up text,
    start_time text,
    PRIMARY KEY (id),
    FOREIGN KEY (applicant_id) REFERENCES applicant(id),
    FOREIGN KEY (stage_title) REFERENCES stage(title)
);

CREATE TABLE applicant_background_check (
    "index" text,
    applicant_id text,
    background_applicant_id text,
    candidate_id text,
    check_id text,
    report_id text,
    "status" text,
    title text,
    updated_at text,
    vendor text,
    PRIMARY KEY ("index", applicant_id),
    FOREIGN KEY (applicant_id) REFERENCES applicant(id)
);

CREATE TABLE applicant_partner_data (
    _fivetran_id text,
    applicant_id text,
    description text,
    example jsonb,
    "type" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (applicant_id) REFERENCES applicant(id)
);

CREATE TABLE applicant_document_signature (
    signature_id text,
    applicant_id text,
    file_url text,
    "status" text,
    vendor text,
    PRIMARY KEY (signature_id),
    FOREIGN KEY (applicant_id) REFERENCES applicant(id)
);

CREATE TABLE applicant_lessonly_result (
    "index" text,
    applicant_id text,
    completed_at text,
    lesson_name text,
    lesson_url text,
    report_card_url text,
    score_percent text,
    PRIMARY KEY ("index", applicant_id),
    FOREIGN KEY (applicant_id) REFERENCES applicant(id)
);

CREATE TABLE applicant_path_result (
    "index" text,
    applicant_id text,
    goal text,
    path_name text,
    progress text,
    url text,
    PRIMARY KEY ("index", applicant_id),
    FOREIGN KEY (applicant_id) REFERENCES applicant(id)
);

CREATE TABLE applicant_course_result (
    "index" text,
    applicant_id text,
    course_name text,
    goal text,
    progress text,
    url text,
    PRIMARY KEY ("index", applicant_id),
    FOREIGN KEY (applicant_id) REFERENCES applicant(id)
);

CREATE TABLE applicant_address (
    _fivetran_id text,
    applicant_id text,
    address_2 text,
    city text,
    country text,
    latitude text,
    longitude text,
    "state" text,
    street_name text,
    zip_code text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (applicant_id) REFERENCES applicant(id)
);

CREATE TABLE applicant_file_upload_request (
    id text,
    applicant_id text,
    created_at text,
    document_name text,
    recollection_reason text,
    PRIMARY KEY (id),
    FOREIGN KEY (applicant_id) REFERENCES applicant(id)
);

CREATE TABLE applicant_score_card_result_answer (
    _fivetran_id text,
    applicant_id text,
    applicant_score_card_result_user_id text,
    note text,
    question_text text,
    question_weight text,
    score text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (applicant_id) REFERENCES applicant(id),
    FOREIGN KEY (applicant_score_card_result_user_id) REFERENCES applicant_score_card_result(user_id)
);

CREATE TABLE applicant_score_card_result (
    applicant_id text,
    user_id text,
    created_at text,
    score text,
    template_name text,
    template_type text,
    template_weighted text,
    PRIMARY KEY (applicant_id, user_id),
    FOREIGN KEY (applicant_id) REFERENCES applicant(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE applicant_partner_language (
    languages text,
    applicant_id text,
    PRIMARY KEY (languages, applicant_id),
    FOREIGN KEY (applicant_id) REFERENCES applicant(id)
);

CREATE TABLE applicant_data (
    "name" text,
    applicant_id text,
    "value" text,
    PRIMARY KEY ("name", applicant_id),
    FOREIGN KEY (applicant_id) REFERENCES applicant(id)
);

CREATE TABLE applicant (
    id text,
    funnel_id text,
    stage_id text,
    bank_account_number text,
    bank_name text,
    bank_routing_number text,
    can_receive_sms text,
    can_work_in_us text,
    certifications_license text,
    citizenship text,
    city text,
    country text,
    created_at text,
    date_of_birth text,
    desired_employment_duration text,
    desired_hours_per_week text,
    did_apply_multiple_time text,
    driver_license_expiration_date text,
    driver_license_number text,
    driver_license_state text,
    earnings_expectations text,
    education text,
    email text,
    emergency_contact_name text,
    emergency_contact_phone text,
    emergency_contact_relationship text,
    ethnicity text,
    facebook text,
    first_language text,
    first_name text,
    gender text,
    have_prior_experience text,
    have_transportation text,
    income_income_tax_dollar_amount text,
    income_medicare_tax text,
    income_salary text,
    income_ss_tax text,
    income_taxpayer_identification_number text,
    insurance_benefactor_first_name text,
    insurance_benefactor_last_name text,
    insurance_benefactor_middle_name text,
    insurance_city_of_issue text,
    insurance_company_group_id text,
    insurance_company_of_issue text,
    insurance_country_of_issue text,
    insurance_expiration_date text,
    insurance_issue_date text,
    insurance_member_id text,
    insurance_type text,
    is_duplicate text,
    last_name text,
    last_transitioned_at text,
    linkedin text,
    "name" text,
    national_identification_number text,
    normalized_phone_number text,
    on_hold_reason text,
    passport_city_of_issue text,
    passport_country_of_issue text,
    passport_expiration_date text,
    passport_issue_date text,
    passport_number text,
    phone_number text,
    phone_number_country_code text,
    phone_platform text,
    previous_work text,
    receive_automated_email text,
    referral_source text,
    rejection_reason text,
    secure_data jsonb,
    ssn text,
    "state" text,
    street text,
    success_in_job text,
    team_or_solo text,
    twitter text,
    updated_at text,
    vehicle_make text,
    vehicle_model text,
    vehicle_registration_plate_number text,
    vehicle_vin_number text,
    vehicle_year text,
    w_4_federal_additional_properties text,
    w_4_federal_description text,
    w_4_federal_form_url text,
    w_4_federal_required jsonb,
    w_4_federal_status text,
    w_4_federal_type text,
    w_4_state_additional_properties text,
    w_4_state_description text,
    w_4_state_form_url text,
    w_4_state_required jsonb,
    w_4_state_status text,
    w_4_state_type text,
    why_should_we_hire_you text,
    work_availability text,
    zip_code text,
    PRIMARY KEY (id),
    FOREIGN KEY (funnel_id) REFERENCES funnel(id),
    FOREIGN KEY (stage_id) REFERENCES stage(id)
);

CREATE TABLE transition (
    _fivetran_id text,
    applicant_id text,
    parent_stage_id text,
    stage_id text,
    sub_stage_id text,
    user_id text,
    created_at text,
    transitioned_by text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (applicant_id) REFERENCES applicant(id),
    FOREIGN KEY (parent_stage_id) REFERENCES stage(id),
    FOREIGN KEY (stage_id) REFERENCES stage(id),
    FOREIGN KEY (sub_stage_id) REFERENCES stage(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE funnel_field (
    _fivetran_id text,
    funnel_id text,
    "key" text,
    question text,
    "type" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (funnel_id) REFERENCES funnel(id)
);

CREATE TABLE stage (
    id text,
    funnel_id text,
    parent_id text,
    title text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (funnel_id) REFERENCES funnel(id),
    FOREIGN KEY (parent_id) REFERENCES stage(id)
);

CREATE TABLE funnel (
    id text,
    owner_id text,
    active text,
    additional_info text,
    address text,
    apply_url text,
    brand text,
    compensation text,
    compensation_currency_code text,
    compensation_type text,
    created_at text,
    custom_id text,
    description text,
    is_private text,
    job_hours text,
    job_industry text,
    job_type text,
    location_group_id text,
    location_group_name text,
    location_id text,
    location_latitude text,
    location_longitude text,
    location_name text,
    "name" text,
    requirements text,
    time_zone text,
    title text,
    PRIMARY KEY (id),
    FOREIGN KEY (owner_id) REFERENCES users(id)
);

CREATE TABLE applicant_file (
    id text,
    applicant_id text,
    stage_id text,
    approved text,
    filename text,
    friendly_name text,
    "name" text,
    public_url text,
    "size" text,
    stage_form_description text,
    PRIMARY KEY (id),
    FOREIGN KEY (applicant_id) REFERENCES applicant(id),
    FOREIGN KEY (stage_id) REFERENCES stage(id)
);

CREATE TABLE stage_label (
    _fivetran_id text,
    stage_id text,
    completed text,
    title text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (stage_id) REFERENCES stage(id)
);

CREATE TABLE users (
    id text,
    email text,
    "name" text,
    PRIMARY KEY (id)
);
