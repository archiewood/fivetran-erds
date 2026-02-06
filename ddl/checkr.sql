CREATE TABLE school (
    id text,
    candidate_id text,
    address_city text,
    address_country text,
    address_state text,
    address_street text,
    address_unit text,
    address_zipcode text,
    "current" text,
    degree text,
    end_date text,
    major text,
    minor text,
    "name" text,
    object text,
    phone text,
    school_url text,
    start_date text,
    uri text,
    year_awarded text,
    PRIMARY KEY (id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(id)
);

CREATE TABLE candidate_geo (
    "index" text,
    candidate_id text,
    geo_id text,
    PRIMARY KEY ("index", candidate_id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(id)
);

CREATE TABLE candidate_report (
    "index" text,
    candidate_id text,
    report_id text,
    PRIMARY KEY ("index", candidate_id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(id),
    FOREIGN KEY (report_id) REFERENCES report(id)
);

CREATE TABLE candidate (
    id text,
    adjudication text,
    copy_requested text,
    created_at text,
    dob text,
    driver_license_number text,
    driver_license_state text,
    email text,
    first_name text,
    last_name text,
    locale text,
    middle_name text,
    mother_maiden_name text,
    no_middle_name text,
    object text,
    phone text,
    previous_driver_license_number text,
    previous_driver_license_state text,
    ssn text,
    updated_at text,
    uri text,
    zipcode text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE account_available_screening (
    "index" text,
    account_id text,
    available_screening text,
    PRIMARY KEY ("index", account_id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE account (
    id text,
    account_deauthorization_reason text,
    adverse_action_email text,
    api_authorized text,
    authorized text,
    billing_email text,
    company_city text,
    company_dba_name text,
    company_incorporation_state text,
    company_incorporation_type text,
    company_industry text,
    company_name text,
    company_phone text,
    company_state text,
    company_street text,
    company_website text,
    company_zipcode text,
    compliance_contact_email text,
    created_at text,
    default_compliance_city text,
    default_compliance_state text,
    geos_required text,
    "name" text,
    object text,
    purpose text,
    segmentation_enabled text,
    support_email text,
    support_phone text,
    technical_contact_email text,
    uri text,
    uri_name text,
    PRIMARY KEY (id)
);

CREATE TABLE package_screening (
    "index" text,
    package_id text,
    subtype text,
    "type" text,
    PRIMARY KEY ("index", package_id),
    FOREIGN KEY (package_id) REFERENCES package(id)
);

CREATE TABLE package_enabled_exam_service (
    "index" text,
    package_enabled_exam_index text,
    package_id text,
    counter_part_slug text,
    label text,
    "name" text,
    PRIMARY KEY ("index", package_enabled_exam_index, package_id),
    FOREIGN KEY (package_enabled_exam_index) REFERENCES package_enabled_exam("index"),
    FOREIGN KEY (package_id) REFERENCES package_enabled_exam(package_id)
);

CREATE TABLE package_enabled_exam (
    "index" text,
    package_id text,
    description text,
    "name" text,
    screening_type text,
    PRIMARY KEY ("index", package_id),
    FOREIGN KEY (package_id) REFERENCES package(id)
);

CREATE TABLE package (
    id text,
    apply_url text,
    created_at text,
    deleted_at text,
    drug_screening_price text,
    "name" text,
    object text,
    price text,
    requires_observed_drug_test text,
    slug text,
    uri text,
    PRIMARY KEY (id)
);

CREATE TABLE report_address (
    _fivetran_id text,
    report_id text,
    city text,
    end_date text,
    "name" text,
    start_date text,
    "state" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (report_id) REFERENCES report(id)
);

CREATE TABLE continuous_check_work_location (
    "index" text,
    continuous_check_id text,
    city text,
    country text,
    "state" text,
    PRIMARY KEY ("index", continuous_check_id),
    FOREIGN KEY (continuous_check_id) REFERENCES continuous_check(id)
);

CREATE TABLE continuous_check (
    id text,
    candidate_id text,
    created_at text,
    node text,
    object text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(id)
);

CREATE TABLE invitation (
    id text,
    candidate_id text,
    report_id text,
    archived text,
    archived_info_time text,
    archived_info_user_email text,
    archived_info_user_id text,
    completed_at text,
    created_at text,
    deleted_at text,
    expires_at text,
    invitation_url text,
    locale text,
    object text,
    package text,
    "status" text,
    tags jsonb,
    uri text,
    PRIMARY KEY (id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(id),
    FOREIGN KEY (report_id) REFERENCES report(id)
);

CREATE TABLE adverse_item (
    id text,
    report_id text,
    assessment_rule_name text,
    assessment_rule_type text,
    assessment_value text,
    object text,
    text text,
    PRIMARY KEY (id, report_id),
    FOREIGN KEY (report_id) REFERENCES report(id)
);

CREATE TABLE users_role (
    "name" text,
    users_id text,
    PRIMARY KEY ("name", users_id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    created_at text,
    email text,
    full_name text,
    PRIMARY KEY (id)
);

CREATE TABLE program_package (
    package_id text,
    program_id text,
    PRIMARY KEY (package_id, program_id),
    FOREIGN KEY (program_id) REFERENCES program(id)
);

CREATE TABLE program_geo (
    geo_id text,
    program_id text,
    PRIMARY KEY (geo_id, program_id),
    FOREIGN KEY (program_id) REFERENCES program(id)
);

CREATE TABLE program (
    id text,
    created_at text,
    deleted_at text,
    "name" text,
    object text,
    PRIMARY KEY (id)
);

CREATE TABLE verification (
    id text,
    report_id text,
    completed_at text,
    created_at text,
    object text,
    processed_at text,
    uri text,
    verification_type text,
    verification_url text,
    PRIMARY KEY (id),
    FOREIGN KEY (report_id) REFERENCES report(id)
);

CREATE TABLE subscription_work_location (
    "index" text,
    subscription_id text,
    city text,
    country text,
    "state" text,
    PRIMARY KEY ("index", subscription_id),
    FOREIGN KEY (subscription_id) REFERENCES subscription(id)
);

CREATE TABLE subscription (
    id text,
    candidate_id text,
    canceled_at text,
    created_at text,
    interval_count text,
    interval_unit text,
    next_occurrence_date text,
    node text,
    object text,
    package text,
    start_date text,
    "status" text,
    uri text,
    PRIMARY KEY (id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(id)
);

CREATE TABLE driver_license_issued_date (
    "index" text,
    driver_license_id text,
    "source" text,
    "value" text,
    PRIMARY KEY ("index", driver_license_id),
    FOREIGN KEY (driver_license_id) REFERENCES driver_license(id)
);

CREATE TABLE driver_license (
    id text,
    candidate_id text,
    "current" text,
    number text,
    object text,
    "state" text,
    uri text,
    PRIMARY KEY (id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(id)
);

CREATE TABLE report_county_criminal_search_record_charge (
    "index" text,
    county_criminal_report_id text,
    county_criminal_search_id text,
    record_id text,
    arrest_date text,
    assessment text,
    charge text,
    charge_date text,
    charge_id text,
    charge_type text,
    classification text,
    conviction_date text,
    court text,
    defendant text,
    deposition text,
    deposition_date text,
    disposition text,
    disposition_date text,
    id text,
    jail_time text,
    next_court_date text,
    offense_date text,
    plaintiff text,
    plea text,
    prison_time text,
    probation_status text,
    probation_time text,
    release_date text,
    restitution text,
    sentence text,
    sentence_date text,
    PRIMARY KEY ("index", county_criminal_report_id, county_criminal_search_id, record_id),
    FOREIGN KEY (county_criminal_report_id) REFERENCES report_county_criminal_search_record(county_criminal_report_id),
    FOREIGN KEY (county_criminal_search_id) REFERENCES report_county_criminal_search_record(county_criminal_search_id),
    FOREIGN KEY (record_id) REFERENCES report_county_criminal_search_record(id)
);

CREATE TABLE report_county_criminal_search_record (
    id text,
    county_criminal_report_id text,
    county_criminal_search_id text,
    address text,
    arresting_agency text,
    case_number text,
    county text,
    court_jurisdiction text,
    court_of_record text,
    dob text,
    file_date text,
    filtered_by_positive_adjudication_charges jsonb,
    full_name text,
    "state" text,
    yob text,
    PRIMARY KEY (id, county_criminal_report_id, county_criminal_search_id),
    FOREIGN KEY (county_criminal_report_id) REFERENCES report_county_criminal_search(report_id),
    FOREIGN KEY (county_criminal_search_id) REFERENCES report_county_criminal_search(id)
);

CREATE TABLE report_county_criminal_search_screening_pointer (
    "index" text,
    county_criminal_report_id text,
    county_criminal_search_id text,
    screening_pointer text,
    PRIMARY KEY ("index", county_criminal_report_id, county_criminal_search_id),
    FOREIGN KEY (county_criminal_report_id) REFERENCES report_county_criminal_search(report_id),
    FOREIGN KEY (county_criminal_search_id) REFERENCES report_county_criminal_search(id)
);

CREATE TABLE report_county_criminal_search (
    id text,
    report_id text,
    assessment text,
    cancellation_reason text,
    cancellation_reason_description text,
    completed_at text,
    county text,
    created_at text,
    filtered_by_positive_adjudication_records jsonb,
    object text,
    "result" text,
    "state" text,
    "status" text,
    turnaround_time text,
    uri text,
    PRIMARY KEY (id, report_id),
    FOREIGN KEY (report_id) REFERENCES report(id)
);

CREATE TABLE report_state_criminal_search_screening_pointer (
    "index" text,
    report_id text,
    report_state_criminal_search_id text,
    screening_pointer text,
    PRIMARY KEY ("index", report_id, report_state_criminal_search_id),
    FOREIGN KEY (report_id) REFERENCES report_state_criminal_search(report_id),
    FOREIGN KEY (report_state_criminal_search_id) REFERENCES report_state_criminal_search(id)
);

CREATE TABLE report_state_criminal_search (
    id text,
    report_id text,
    assessment text,
    cancellation_reason text,
    cancellation_reason_description text,
    completed_at text,
    created_at text,
    filtered_by_positive_adjudication_records jsonb,
    in_lieu_of_county text,
    object text,
    records jsonb,
    "result" text,
    "state" text,
    state_source_name text,
    "status" text,
    turnaround_time text,
    uri text,
    PRIMARY KEY (id, report_id),
    FOREIGN KEY (report_id) REFERENCES report(id)
);

CREATE TABLE report_candidate_story (
    id text,
    report_id text,
    content text,
    created_at text,
    documents jsonb,
    object text,
    record_case_number text,
    record_charge text,
    record_id text,
    record_location text,
    record_offense_date text,
    reviewed_at text,
    reviewer text,
    uri text,
    PRIMARY KEY (id),
    FOREIGN KEY (report_id) REFERENCES report(id)
);

CREATE TABLE report_work_location (
    "index" text,
    report_id text,
    city text,
    country text,
    "state" text,
    PRIMARY KEY ("index", report_id),
    FOREIGN KEY (report_id) REFERENCES report(id)
);

CREATE TABLE report_federal_criminal_search (
    id text,
    report_id text,
    assessment text,
    cancellation_reason text,
    cancellation_reason_description text,
    completed_at text,
    created_at text,
    filtered_by_positive_adjudication_records jsonb,
    records jsonb,
    "result" text,
    "status" text,
    turnaround_time text,
    PRIMARY KEY (id, report_id),
    FOREIGN KEY (report_id) REFERENCES report(id)
);

CREATE TABLE report_international_global_watchlist_search (
    id text,
    report_id text,
    assessment text,
    cancellation_reason text,
    cancellation_reason_description text,
    completed_at text,
    created_at text,
    pdf_url text,
    "result" text,
    "status" text,
    turnaround_time text,
    PRIMARY KEY (id, report_id),
    FOREIGN KEY (report_id) REFERENCES report(id)
);

CREATE TABLE report_international_employment_verification_history (
    id text,
    report_id text,
    verification_history_id text,
    candidate_employer_id text,
    cancellation_reason text,
    candidate_explanation text,
    candidate_proof_requested_at text,
    contract_type text,
    contract_type_ignored text,
    created_at text,
    deleted_at text,
    do_not_contact text,
    employment_verifiable_id text,
    employment_verifiable_type text,
    from_date text,
    from_date_ignored text,
    internal_state text,
    modifier_id text,
    name_commonality_lookup_cache jsonb,
    name_first_name text,
    name_id text,
    name_last_name text,
    name_middle_name text,
    name_middle_name_rank text,
    name_suffix text,
    pdf_url text,
    "position" text,
    position_ignored text,
    provider text,
    provider_requested_at text,
    reason_for_leaving_ignored text,
    salary text,
    salary_ignored text,
    sent_to_qa_at text,
    "status" text,
    task_id text,
    to_date text,
    to_date_ignored text,
    updated_at text,
    version text,
    PRIMARY KEY (id, report_id, verification_history_id),
    FOREIGN KEY (report_id) REFERENCES report_international_employment_verification(report_id),
    FOREIGN KEY (verification_history_id) REFERENCES report_international_employment_verification(id),
    FOREIGN KEY (candidate_employer_id) REFERENCES employer(id)
);

CREATE TABLE report_international_employment_verification_record (
    id text,
    report_id text,
    verification_history_id text,
    employer_id text,
    cancellation_reason text,
    cancellation_reason_description text,
    events jsonb,
    pdf_url text,
    result_contract_type_comment text,
    result_contract_type_ignored text,
    result_contract_type_verified text,
    result_dot_compliant text,
    result_end_date_comment text,
    result_end_date_ignored text,
    result_end_date_verified text,
    result_question jsonb,
    result_reason_for_leaving_comment text,
    result_reason_for_leaving_ignored text,
    result_reason_for_leaving_verified text,
    result_salary_comment text,
    result_salary_ignored text,
    result_salary_verified text,
    result_start_date_comment text,
    result_start_date_ignored text,
    result_start_date_verified text,
    "status" text,
    PRIMARY KEY (id, report_id, verification_history_id),
    FOREIGN KEY (report_id) REFERENCES report_international_employment_verification(report_id),
    FOREIGN KEY (verification_history_id) REFERENCES report_international_employment_verification(id),
    FOREIGN KEY (employer_id) REFERENCES employer(id)
);

CREATE TABLE report_international_employment_verification (
    id text,
    report_id text,
    assessment text,
    cancellation_reason text,
    cancellation_reason_description text,
    completed_at text,
    created_at text,
    "result" text,
    "status" text,
    turnaround_time text,
    PRIMARY KEY (id, report_id),
    FOREIGN KEY (report_id) REFERENCES report(id)
);

CREATE TABLE report_international_adverse_media_search (
    id text,
    report_id text,
    cancellation_reason text,
    cancellation_reason_description text,
    completed_at text,
    country text,
    created_at text,
    pdf_url text,
    "result" text,
    "status" text,
    turnaround_time text,
    PRIMARY KEY (id, report_id),
    FOREIGN KEY (report_id) REFERENCES report(id)
);

CREATE TABLE report_international_education_verification_record_event (
    "index" text,
    record_id text,
    report_id text,
    verification_id text,
    created_at text,
    text text,
    "type" text,
    PRIMARY KEY ("index", record_id, report_id, verification_id),
    FOREIGN KEY (record_id) REFERENCES report_international_education_verification_record(id),
    FOREIGN KEY (report_id) REFERENCES report_international_education_verification_record(report_id),
    FOREIGN KEY (verification_id) REFERENCES report_international_education_verification_record(verification_id)
);

CREATE TABLE report_international_education_verification_record (
    id text,
    report_id text,
    verification_id text,
    school_id text,
    country text,
    pdf_url text,
    result_verified text,
    "status" text,
    PRIMARY KEY (id, report_id, verification_id),
    FOREIGN KEY (report_id) REFERENCES report_international_education_verification(report_id),
    FOREIGN KEY (verification_id) REFERENCES report_international_education_verification(id),
    FOREIGN KEY (school_id) REFERENCES school(id)
);

CREATE TABLE report_international_education_verification (
    id text,
    report_id text,
    cancellation_reason text,
    cancellation_reason_description text,
    completed_at text,
    created_at text,
    "result" text,
    "status" text,
    turnaround_time text,
    PRIMARY KEY (id, report_id),
    FOREIGN KEY (report_id) REFERENCES report(id)
);

CREATE TABLE report_international_identity_document_validation (
    id text,
    report_id text,
    cancellation_reason text,
    cancellation_reason_description text,
    completed_at text,
    created_at text,
    pdf_url text,
    "result" text,
    "status" text,
    turnaround_time text,
    PRIMARY KEY (id, report_id),
    FOREIGN KEY (report_id) REFERENCES report(id)
);

CREATE TABLE report_international_motor_vehicle_license_info (
    license_number text,
    report_id text,
    report_international_motor_vehicle_license_index text,
    vehicle_id text,
    country text,
    expiration_date text,
    is_current text,
    license_class text,
    sub_division text,
    PRIMARY KEY (license_number, report_id, report_international_motor_vehicle_license_index, vehicle_id),
    FOREIGN KEY (license_number) REFERENCES driver_license(id),
    FOREIGN KEY (report_id) REFERENCES report_international_motor_vehicle_license(report_id),
    FOREIGN KEY (report_international_motor_vehicle_license_index) REFERENCES report_international_motor_vehicle_license("index"),
    FOREIGN KEY (vehicle_id) REFERENCES report_international_motor_vehicle_license(vehicle_id)
);

CREATE TABLE report_international_motor_vehicle_license_violation (
    "index" text,
    report_id text,
    report_international_motor_vehicle_license_index text,
    vehicle_id text,
    description text,
    issued_date text,
    PRIMARY KEY ("index", report_id, report_international_motor_vehicle_license_index, vehicle_id),
    FOREIGN KEY (report_id) REFERENCES report_international_motor_vehicle_license(report_id),
    FOREIGN KEY (report_international_motor_vehicle_license_index) REFERENCES report_international_motor_vehicle_license("index"),
    FOREIGN KEY (vehicle_id) REFERENCES report_international_motor_vehicle_license(vehicle_id)
);

CREATE TABLE report_international_motor_vehicle_license (
    "index" text,
    report_id text,
    vehicle_id text,
    actual_license_class text,
    is_valid_license_class text,
    license_status text,
    PRIMARY KEY ("index", report_id, vehicle_id),
    FOREIGN KEY (report_id) REFERENCES report_international_motor_vehicle(report_id),
    FOREIGN KEY (vehicle_id) REFERENCES report_international_motor_vehicle(id)
);

CREATE TABLE report_international_motor_vehicle (
    id text,
    report_id text,
    cancellation_reason text,
    cancellation_reason_description text,
    completed_at text,
    country text,
    created_at text,
    pdf_url text,
    "result" text,
    "status" text,
    turnaround_time text,
    PRIMARY KEY (id, report_id),
    FOREIGN KEY (report_id) REFERENCES report(id)
);

CREATE TABLE report_international_criminal_search (
    id text,
    report_id text,
    cancellation_reason text,
    cancellation_reason_description text,
    completed_at text,
    country text,
    created_at text,
    pdf_url text,
    record text,
    "result" text,
    result_sub_status text,
    "status" text,
    turnaround_time text,
    PRIMARY KEY (id, report_id),
    FOREIGN KEY (report_id) REFERENCES report(id)
);

CREATE TABLE report_segment_stamp (
    "index" text,
    report_id text,
    segment_stamp text,
    PRIMARY KEY ("index", report_id),
    FOREIGN KEY (report_id) REFERENCES report(id)
);

CREATE TABLE report_document (
    id text,
    report_id text,
    content_type text,
    created_at text,
    download_uri text,
    filename text,
    filesize text,
    locale text,
    object text,
    "type" text,
    PRIMARY KEY (id, report_id),
    FOREIGN KEY (report_id) REFERENCES report(id)
);

CREATE TABLE report_global_watchlist_search (
    id text,
    report_id text,
    assessment text,
    cancellation_reason text,
    cancellation_reason_description text,
    completed_at text,
    created_at text,
    object text,
    records jsonb,
    "result" text,
    "status" text,
    turnaround_time text,
    uri text,
    PRIMARY KEY (id, report_id),
    FOREIGN KEY (report_id) REFERENCES report(id)
);

CREATE TABLE report_terrorist_watchlist_search (
    id text,
    report_id text,
    assessment text,
    cancellation_reason text,
    cancellation_reason_description text,
    completed_at text,
    created_at text,
    object text,
    records jsonb,
    "result" text,
    "status" text,
    turnaround_time text,
    uri text,
    PRIMARY KEY (id, report_id),
    FOREIGN KEY (report_id) REFERENCES report(id)
);

CREATE TABLE report_ssn_trace (
    id text,
    report_id text,
    addresses jsonb,
    aliases jsonb,
    cancellation_reason text,
    cancellation_reason_description text,
    completed_at text,
    created_at text,
    data_mismatch text,
    death_index text,
    dob_mismatch text,
    fake_ssn text,
    invalid_issuance_year text,
    issued_state text,
    issued_year text,
    name_mismatch text,
    no_data text,
    object text,
    "result" text,
    ssn text,
    ssn_already_taken text,
    "status" text,
    thin_file text,
    turnaround_time text,
    uri text,
    PRIMARY KEY (id, report_id),
    FOREIGN KEY (report_id) REFERENCES report(id)
);

CREATE TABLE report_geo (
    id text,
    report_id text,
    city text,
    country text,
    created_at text,
    deleted_at text,
    "name" text,
    "state" text,
    PRIMARY KEY (id, report_id),
    FOREIGN KEY (report_id) REFERENCES report(id)
);

CREATE TABLE report_sex_offender_search (
    id text,
    report_id text,
    cancellation_reason text,
    cancellation_reason_description text,
    completed_at text,
    created_at text,
    object text,
    records jsonb,
    "result" text,
    "status" text,
    turnaround_time text,
    uri text,
    PRIMARY KEY (id, report_id),
    FOREIGN KEY (report_id) REFERENCES report(id)
);

CREATE TABLE report_national_criminal_search (
    id text,
    report_id text,
    cancellation_reason text,
    cancellation_reason_description text,
    completed_at text,
    created_at text,
    filtered_by_positive_adjudication_records jsonb,
    object text,
    records jsonb,
    "result" text,
    "status" text,
    turnaround_time text,
    uri text,
    PRIMARY KEY (id, report_id),
    FOREIGN KEY (report_id) REFERENCES report(id)
);

CREATE TABLE report_motor_vehicle_restriction (
    "index" text,
    report_motor_vehicle_id text,
    report_motor_vehicle_report_id text,
    restriction text,
    PRIMARY KEY ("index", report_motor_vehicle_id, report_motor_vehicle_report_id),
    FOREIGN KEY (report_motor_vehicle_id) REFERENCES report_motor_vehicle(id),
    FOREIGN KEY (report_motor_vehicle_report_id) REFERENCES report_motor_vehicle(report_id)
);

CREATE TABLE report_motor_vehicle_violation (
    "index" text,
    report_motor_vehicle_id text,
    report_motor_vehicle_report_id text,
    acd_code text,
    alternate_description text,
    category text,
    city text,
    conviction_date text,
    county text,
    court_name text,
    description text,
    disposition text,
    docket text,
    issued_date text,
    points text,
    reinstatement_date text,
    "state" text,
    state_code text,
    ticket_number text,
    "type" text,
    PRIMARY KEY ("index", report_motor_vehicle_id, report_motor_vehicle_report_id),
    FOREIGN KEY (report_motor_vehicle_id) REFERENCES report_motor_vehicle(id),
    FOREIGN KEY (report_motor_vehicle_report_id) REFERENCES report_motor_vehicle(report_id)
);

CREATE TABLE report_motor_vehicle_suspension (
    "index" text,
    report_motor_vehicle_id text,
    report_motor_vehicle_report_id text,
    description text,
    end_date text,
    groups text,
    start_date text,
    "state" text,
    PRIMARY KEY ("index", report_motor_vehicle_id, report_motor_vehicle_report_id),
    FOREIGN KEY (report_motor_vehicle_id) REFERENCES report_motor_vehicle(id),
    FOREIGN KEY (report_motor_vehicle_report_id) REFERENCES report_motor_vehicle(report_id)
);

CREATE TABLE report_motor_vehicle_accident (
    "index" text,
    report_motor_vehicle_id text,
    report_motor_vehicle_report_id text,
    accident_date text,
    acd_code text,
    action_taken text,
    category text,
    city text,
    county text,
    description text,
    enforcing_agency text,
    fatality_accident text,
    fatality_count text,
    fine_amount text,
    groups text,
    injury_accident text,
    injury_count text,
    jurisdiction text,
    license_plate text,
    note text,
    order_number text,
    points text,
    policy_number text,
    reinstatement_date text,
    report_number text,
    severity text,
    "state" text,
    state_code text,
    ticket_number text,
    vehicle_speed text,
    vehicles_involved_count text,
    violation_number text,
    PRIMARY KEY ("index", report_motor_vehicle_id, report_motor_vehicle_report_id),
    FOREIGN KEY (report_motor_vehicle_id) REFERENCES report_motor_vehicle(id),
    FOREIGN KEY (report_motor_vehicle_report_id) REFERENCES report_motor_vehicle(report_id)
);

CREATE TABLE report_motor_vehicle_miscellaneous_incident (
    "index" text,
    report_motor_vehicle_id text,
    report_motor_vehicle_report_id text,
    "date" text,
    description text,
    PRIMARY KEY ("index", report_motor_vehicle_id, report_motor_vehicle_report_id),
    FOREIGN KEY (report_motor_vehicle_id) REFERENCES report_motor_vehicle(id),
    FOREIGN KEY (report_motor_vehicle_report_id) REFERENCES report_motor_vehicle(report_id)
);

CREATE TABLE report_motor_vehicle (
    id text,
    report_id text,
    cancellation_reason text,
    cancellation_reason_description text,
    completed_at text,
    created_at text,
    custom_rules jsonb,
    dob text,
    endorsements jsonb,
    experience_failed text,
    expiration_date text,
    first_issued_date text,
    full_name text,
    inferred_issued_date text,
    issued_date text,
    license_class text,
    license_number text,
    license_state text,
    license_status text,
    license_type text,
    not_found text,
    object text,
    previous_license_number text,
    previous_license_state text,
    privilege_to_drive text,
    "result" text,
    "status" text,
    turnaround_time text,
    uri text,
    PRIMARY KEY (id, report_id),
    FOREIGN KEY (report_id) REFERENCES report(id)
);

CREATE TABLE report_drug_screening_analyte (
    "index" text,
    report_drug_screening_id text,
    report_drug_screening_report_id text,
    disposition text,
    "name" text,
    quantity text,
    slug text,
    specimen_type text,
    PRIMARY KEY ("index", report_drug_screening_id, report_drug_screening_report_id),
    FOREIGN KEY (report_drug_screening_id) REFERENCES report_drug_screening(id),
    FOREIGN KEY (report_drug_screening_report_id) REFERENCES report_drug_screening(report_id)
);

CREATE TABLE report_drug_screening_event (
    "index" text,
    report_drug_screening_id text,
    report_drug_screening_report_id text,
    created_at text,
    text text,
    "type" text,
    PRIMARY KEY ("index", report_drug_screening_id, report_drug_screening_report_id),
    FOREIGN KEY (report_drug_screening_id) REFERENCES report_drug_screening(id),
    FOREIGN KEY (report_drug_screening_report_id) REFERENCES report_drug_screening(report_id)
);

CREATE TABLE report_drug_screening (
    id text,
    report_id text,
    appointment_id text,
    appointment_updateable text,
    cancellation_reason text,
    cancellation_reason_description text,
    disposition text,
    location_city text,
    location_distance text,
    location_distance_unit text,
    location_electronically_enabled text,
    location_fax_number text,
    location_hours_closed_for_lunch_friday text,
    location_hours_closed_for_lunch_monday text,
    location_hours_closed_for_lunch_saturday text,
    location_hours_closed_for_lunch_sunday text,
    location_hours_closed_for_lunch_thursday text,
    location_hours_closed_for_lunch_tuesday text,
    location_hours_closed_for_lunch_wednesday text,
    location_hours_closed_friday text,
    location_hours_closed_monday text,
    location_hours_closed_saturday text,
    location_hours_closed_sunday text,
    location_hours_closed_thursday text,
    location_hours_closed_tuesday text,
    location_hours_closed_wednesday text,
    location_hours_friday_hours_close text,
    location_hours_friday_hours_open text,
    location_hours_friday_lunch_from text,
    location_hours_friday_lunch_to text,
    location_hours_monday_hours_close text,
    location_hours_monday_hours_open text,
    location_hours_monday_lunch_from text,
    location_hours_monday_lunch_to text,
    location_hours_normal_hours_close text,
    location_hours_normal_hours_open text,
    location_hours_saturday_hours_close text,
    location_hours_saturday_hours_open text,
    location_hours_saturday_lunch_from text,
    location_hours_saturday_lunch_to text,
    location_hours_sunday_hours_close text,
    location_hours_sunday_hours_open text,
    location_hours_sunday_lunch_from text,
    location_hours_sunday_lunch_to text,
    location_hours_thursday_hours_close text,
    location_hours_thursday_hours_open text,
    location_hours_thursday_lunch_from text,
    location_hours_thursday_lunch_to text,
    location_hours_truck_access text,
    location_hours_tuesday_hours_close text,
    location_hours_tuesday_hours_open text,
    location_hours_tuesday_lunch_from text,
    location_hours_tuesday_lunch_to text,
    location_hours_twenty_four_hours text,
    location_hours_wednesday_hours_close text,
    location_hours_wednesday_hours_open text,
    location_hours_wednesday_lunch_from text,
    location_hours_wednesday_lunch_to text,
    location_latitude text,
    location_longitude text,
    location_metadata text,
    location_name text,
    location_phone_number text,
    location_state text,
    location_street text,
    location_unit text,
    location_zipcode text,
    mro_notes text,
    object text,
    order_id text,
    "result" text,
    screening_pass_expires_at text,
    "status" text,
    PRIMARY KEY (id, report_id),
    FOREIGN KEY (report_id) REFERENCES report(id)
);

CREATE TABLE report_tag (
    "index" text,
    report_id text,
    tags text,
    PRIMARY KEY ("index", report_id),
    FOREIGN KEY (report_id) REFERENCES report(id)
);

CREATE TABLE report (
    id text,
    candidate_id text,
    program_id text,
    adjudication text,
    archived text,
    arrest_search text,
    assessment text,
    billing_entity text,
    completed_at text,
    created_at text,
    due_time text,
    estimated_completion_time text,
    facis_search text,
    federal_district_civil_search_ids jsonb,
    federal_district_criminal_search_ids jsonb,
    includes_canceled text,
    municipal_criminal_searches jsonb,
    object text,
    package text,
    personal_reference_verifications jsonb,
    pointer_state_criminal_searches jsonb,
    professional_license_verifications jsonb,
    professional_reference_verifications jsonb,
    "result" text,
    revised_at text,
    self_disclosures jsonb,
    skipped_screening_ids jsonb,
    "source" text,
    "status" text,
    turnaround_time text,
    upgraded_at text,
    uri text,
    PRIMARY KEY (id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(id),
    FOREIGN KEY (program_id) REFERENCES program(id)
);

CREATE TABLE employer (
    id text,
    candidate_id text,
    address_city text,
    address_country text,
    address_state text,
    address_street text,
    address_unit text,
    address_zipcode text,
    contract_type text,
    do_not_contact text,
    employer_url text,
    end_date text,
    manager_email text,
    manager_name text,
    manager_phone text,
    manager_title text,
    "name" text,
    object text,
    "position" text,
    salary text,
    start_date text,
    uri text,
    PRIMARY KEY (id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(id)
);

CREATE TABLE assessment_result_assessed_object (
    object_id text,
    _fivetran_id text,
    assessment_result_index text,
    object_type text,
    PRIMARY KEY (object_id, _fivetran_id, assessment_result_index),
    FOREIGN KEY (_fivetran_id) REFERENCES assessment_result(_fivetran_id),
    FOREIGN KEY (assessment_result_index) REFERENCES assessment_result("index")
);

CREATE TABLE assessment_result (
    "index" text,
    _fivetran_id text,
    rule_name text,
    rule_type text,
    "value" text,
    PRIMARY KEY ("index", _fivetran_id),
    FOREIGN KEY (_fivetran_id) REFERENCES assessment(_fivetran_id)
);

CREATE TABLE assessment (
    _fivetran_id text,
    report_id text,
    created_at text,
    id text,
    ruleset_name text,
    ruleset_version_number text,
    "value" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (report_id) REFERENCES report(id)
);
