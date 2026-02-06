CREATE TABLE candidate_skill (
    "index" text,
    candidate_id text,
    skill text,
    PRIMARY KEY ("index", candidate_id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(id)
);

CREATE TABLE candidate_tag (
    "index" text,
    candidate_id text,
    tags text,
    PRIMARY KEY ("index", candidate_id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(id)
);

CREATE TABLE candidate_profile_link (
    "index" text,
    candidate_id text,
    "name" text,
    url text,
    PRIMARY KEY ("index", candidate_id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(id)
);

CREATE TABLE candidate_qualification (
    degree text,
    candidate_id text,
    end_date text,
    field_of_study text,
    grade text,
    is_current text,
    school_name text,
    start_date text,
    summary text,
    PRIMARY KEY (degree, candidate_id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(id)
);

CREATE TABLE candidate_position (
    title text,
    candidate_id text,
    company text,
    end_date text,
    is_current text,
    start_date text,
    summary text,
    PRIMARY KEY (title, candidate_id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(id)
);

CREATE TABLE candidate_resume (
    id text,
    candidate_id text,
    content_file_name text,
    content_file_size text,
    description text,
    url text,
    PRIMARY KEY (id, candidate_id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(id)
);

CREATE TABLE candidate_cover_letter (
    id text,
    candidate_id text,
    content_file_name text,
    content_file_size text,
    description text,
    url text,
    PRIMARY KEY (id, candidate_id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(id)
);

CREATE TABLE candidate_portfolios (
    id text,
    candidate_id text,
    content_file_name text,
    content_file_size text,
    description text,
    url text,
    PRIMARY KEY (id, candidate_id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(id)
);

CREATE TABLE candidate (
    id text,
    owner_id text,
    source_category_id text,
    source_id text,
    cool_off_date text,
    created_at text,
    date_of_birth text,
    deleted text,
    description text,
    eeo_disabled text,
    eeo_ethnicity text,
    eeo_gender text,
    eeo_veteran text,
    email text,
    first_name text,
    gender text,
    last_name text,
    location_city text,
    location_country_code text,
    location_state text,
    location_street text,
    location_zip_code text,
    middle_name text,
    mobile text,
    other_attachment jsonb,
    phone text,
    skype_id text,
    spam text,
    total_experience_in_month text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES applicant(candidate_id),
    FOREIGN KEY (owner_id) REFERENCES employee(id),
    FOREIGN KEY (source_category_id) REFERENCES source_category(id),
    FOREIGN KEY (source_id) REFERENCES "source"(id)
);

CREATE TABLE source_category (
    id text,
    created_at text,
    deleted text,
    is_default text,
    label text,
    leads_count text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE new_hire_work_number (
    "index" text,
    new_hire_employee_id text,
    "name" text,
    number text,
    PRIMARY KEY ("index", new_hire_employee_id),
    FOREIGN KEY (new_hire_employee_id) REFERENCES new_hire(id)
);

CREATE TABLE new_hire_phone_number (
    "index" text,
    new_hire_employee_id text,
    masked text,
    "name" text,
    number text,
    PRIMARY KEY ("index", new_hire_employee_id),
    FOREIGN KEY (new_hire_employee_id) REFERENCES new_hire(id)
);

CREATE TABLE new_hire_emergency_contact (
    "index" text,
    new_hire_employee_id text,
    address text,
    contact_number text,
    email text,
    "name" text,
    relationship text,
    PRIMARY KEY ("index", new_hire_employee_id),
    FOREIGN KEY (new_hire_employee_id) REFERENCES new_hire(id)
);

CREATE TABLE new_hire_social_profile (
    "index" text,
    new_hire_employee_id text,
    "name" text,
    url text,
    PRIMARY KEY ("index", new_hire_employee_id),
    FOREIGN KEY (new_hire_employee_id) REFERENCES new_hire(id)
);

CREATE TABLE new_hire_time_off (
    id text,
    new_hire_employee_id text,
    availed text,
    credit text,
    "name" text,
    PRIMARY KEY (id, new_hire_employee_id),
    FOREIGN KEY (new_hire_employee_id) REFERENCES new_hire(id)
);

CREATE TABLE new_hire_dependent (
    id text,
    new_hire_employee_id text,
    date_of_birth text,
    deleted text,
    gender text,
    "name" text,
    relationship text,
    PRIMARY KEY (id, new_hire_employee_id),
    FOREIGN KEY (new_hire_employee_id) REFERENCES new_hire(id)
);

CREATE TABLE new_hire_previous_employment_reference (
    "index" text,
    new_hire_employee_id text,
    previous_employment_id text,
    contact_number text,
    "name" text,
    PRIMARY KEY ("index", new_hire_employee_id, previous_employment_id),
    FOREIGN KEY (new_hire_employee_id) REFERENCES new_hire_previous_employment(new_hire_employee_id),
    FOREIGN KEY (previous_employment_id) REFERENCES new_hire_previous_employment(id)
);

CREATE TABLE new_hire_previous_employment (
    id text,
    new_hire_employee_id text,
    company text,
    deleted text,
    description text,
    end_date text,
    job_type text,
    other_salary_components text,
    "role" text,
    salary_value text,
    start_date text,
    PRIMARY KEY (id, new_hire_employee_id),
    FOREIGN KEY (new_hire_employee_id) REFERENCES new_hire(id)
);

CREATE TABLE new_hire_qualification (
    id text,
    new_hire_employee_id text,
    course text,
    degree text,
    deleted text,
    description text,
    end_date text,
    grade_average text,
    institue_name text,
    pass_out_date text,
    start_date text,
    PRIMARY KEY (id, new_hire_employee_id),
    FOREIGN KEY (new_hire_employee_id) REFERENCES new_hire(id)
);

CREATE TABLE new_hire_bank_account (
    id text,
    new_hire_employee_id text,
    account_number text,
    bank_name text,
    branch_code text,
    deleted text,
    name_as_per_account text,
    PRIMARY KEY (id, new_hire_employee_id),
    FOREIGN KEY (new_hire_employee_id) REFERENCES new_hire(id)
);

CREATE TABLE new_hire_compensation (
    id text,
    new_hire_employee_id text,
    annual_amount text,
    cost_center_id text,
    cost_center_value text,
    currency text,
    "current" text,
    deleted text,
    description text,
    effective_date text,
    eligible_work_hour text,
    other_component text,
    pay_factor text,
    pay_group_id text,
    pay_group_value text,
    pay_method_id text,
    pay_method_value text,
    pay_rate_id text,
    pay_rate_name text,
    pay_rate_value text,
    pay_schedule_id text,
    pay_schedule_name text,
    reason_id text,
    reason_value text,
    variable_pay text,
    variable_pay_detail text,
    variable_pay_frequency_id text,
    variable_pay_frequency_name text,
    work_hour_rate_id text,
    work_hour_rate_value text,
    PRIMARY KEY (id, new_hire_employee_id),
    FOREIGN KEY (new_hire_employee_id) REFERENCES new_hire(id)
);

CREATE TABLE new_hire_bonus (
    id text,
    new_hire_employee_id text,
    additional_detail text,
    bonus_type_id text,
    bonus_type_value text,
    currency text,
    deleted text,
    effective_date text,
    "value" text,
    PRIMARY KEY (id, new_hire_employee_id),
    FOREIGN KEY (new_hire_employee_id) REFERENCES new_hire(id)
);

CREATE TABLE new_hire_stock (
    id text,
    new_hire_employee_id text,
    currency text,
    deleted text,
    description text,
    effective_date text,
    exercise_price text,
    exercise_price_discount text,
    expiration_date text,
    grant_date text,
    grant_number text,
    grant_reason_id text,
    grant_reason_value text,
    grant_type_id text,
    grant_type_value text,
    pay_rate_id text,
    pay_rate_name text,
    total_stock_units text,
    value_per_share text,
    vesting_period text,
    vesting_rate text,
    vesting_schedule text,
    vesting_type text,
    with_in_range text,
    PRIMARY KEY (id, new_hire_employee_id),
    FOREIGN KEY (new_hire_employee_id) REFERENCES new_hire(id)
);

CREATE TABLE new_hire_award (
    id text,
    new_hire_employee_id text,
    awarded_by text,
    deleted text,
    "name" text,
    PRIMARY KEY (id, new_hire_employee_id),
    FOREIGN KEY (new_hire_employee_id) REFERENCES new_hire(id)
);

CREATE TABLE new_hire_honor (
    id text,
    new_hire_employee_id text,
    awarded_by text,
    deleted text,
    "name" text,
    PRIMARY KEY (id, new_hire_employee_id),
    FOREIGN KEY (new_hire_employee_id) REFERENCES new_hire(id)
);

CREATE TABLE new_hire_certificate (
    id text,
    new_hire_employee_id text,
    awarded_by text,
    deleted text,
    grade text,
    "name" text,
    PRIMARY KEY (id, new_hire_employee_id),
    FOREIGN KEY (new_hire_employee_id) REFERENCES new_hire(id)
);

CREATE TABLE new_hire_license (
    id text,
    new_hire_employee_id text,
    deleted text,
    expiry_date text,
    "name" text,
    restrictions text,
    PRIMARY KEY (id, new_hire_employee_id),
    FOREIGN KEY (new_hire_employee_id) REFERENCES new_hire(id)
);

CREATE TABLE new_hire_background_verification_detail (
    id text,
    new_hire_employee_id text,
    completion_date text,
    deleted text,
    initiation_date text,
    notes text,
    "status" text,
    vendor text,
    PRIMARY KEY (id, new_hire_employee_id),
    FOREIGN KEY (new_hire_employee_id) REFERENCES new_hire(id)
);

CREATE TABLE new_hire_visa (
    id text,
    new_hire_employee_id text,
    country_code text,
    deleted text,
    valid_from text,
    valid_to text,
    visa_number text,
    visa_type text,
    PRIMARY KEY (id, new_hire_employee_id),
    FOREIGN KEY (new_hire_employee_id) REFERENCES new_hire(id)
);

CREATE TABLE new_hire_government_document (
    id text,
    new_hire_employee_id text,
    country_code text,
    deleted text,
    expiry_date text,
    issuing_authority text,
    issuing_date text,
    "name" text,
    number text,
    type_id text,
    type_position text,
    type_value text,
    PRIMARY KEY (id, new_hire_employee_id),
    FOREIGN KEY (new_hire_employee_id) REFERENCES new_hire(id)
);

CREATE TABLE new_hire_role (
    id text,
    new_hire_employee_id text,
    PRIMARY KEY (id, new_hire_employee_id),
    FOREIGN KEY (new_hire_employee_id) REFERENCES new_hire(id)
);

CREATE TABLE new_hire (
    id text,
    branch_id text,
    business_unit_id text,
    department_id text,
    employee_id text,
    hr_incharge_id text,
    job_role_id text,
    level_id text,
    reporting_to_id text,
    sub_department_id text,
    team_id text,
    user_function_id text,
    actual_retirement_date text,
    additional_hr_manager jsonb,
    additional_manager jsonb,
    additional_team jsonb,
    address_city text,
    address_country_code text,
    address_state text,
    address_street text,
    address_zip_code text,
    blood_group text,
    citizenship_status_id text,
    citizenship_status_value text,
    communication_address_city text,
    communication_address_country_code text,
    communication_address_same_as_residential text,
    communication_address_state text,
    communication_address_street text,
    communication_address_zip_code text,
    cost_center jsonb,
    cost_center_id text,
    cost_center_value text,
    country_of_birth text,
    created_at text,
    date_of_birth text,
    deleted text,
    designation text,
    eeo_company_code text,
    eeo_disabled text,
    eeo_ethnicity text,
    eeo_job_category text,
    eeo_vetran text,
    employee_type text,
    employment_end_date text,
    end_time text,
    expected_retirement_date text,
    first_name text,
    flsa_required text,
    gender text,
    hereditary_last_name text,
    hire_reason text,
    id_card_detail text,
    im_address text,
    job_code text,
    job_exempt text,
    job_role_value text,
    joining_date text,
    languages jsonb,
    last_name text,
    legal_name text,
    marital_status text,
    middle_name text,
    nick_name text,
    notice_end_date text,
    notice_period text,
    notice_start_date text,
    official_email text,
    personal_email text,
    place_of_birth text,
    previous_name text,
    previous_name_change_date text,
    probation_end_date text,
    probation_start_date text,
    retirement_eligibility_date text,
    retirement_status_id text,
    retirement_status_value text,
    scheduled_weekly_hour text,
    secondary_business_email text,
    secondary_last_name text,
    shift_id text,
    shift_value text,
    start_time text,
    "status" text,
    termination_category_id text,
    termination_category_value text,
    termination_date text,
    termination_reason text,
    updated_at timestamp,
    user_academic_suffix_id text,
    user_academic_suffix_value text,
    user_honorary_suffix_id text,
    user_honorary_suffix_value text,
    user_professional_suffix_id text,
    user_professional_suffix_value text,
    user_suffix_id text,
    user_suffix_value text,
    user_title_id text,
    user_title_value text,
    work_hour text,
    workstation_number text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (branch_id) REFERENCES branch(id),
    FOREIGN KEY (business_unit_id) REFERENCES business_unit(id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (employee_id) REFERENCES employee(id),
    FOREIGN KEY (hr_incharge_id) REFERENCES employee(id),
    FOREIGN KEY (job_role_id) REFERENCES "role"(id),
    FOREIGN KEY (level_id) REFERENCES "level"(id),
    FOREIGN KEY (reporting_to_id) REFERENCES employee(id),
    FOREIGN KEY (sub_department_id) REFERENCES sub_department(id),
    FOREIGN KEY (team_id) REFERENCES team(id),
    FOREIGN KEY (user_function_id) REFERENCES user_function(id)
);

CREATE TABLE department (
    id text,
    created_at text,
    deleted text,
    "name" text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE "level" (
    id text,
    created_at text,
    deleted text,
    "name" text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE business_unit (
    id text,
    created_at text,
    deleted text,
    description text,
    "name" text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE "source" (
    id text,
    created_at text,
    deleted text,
    is_deault text,
    label text,
    leads_count text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE time_off (
    id text,
    applied_by_id text,
    approved_by_id text,
    cancelled_by_id text,
    rejected_by_id text,
    time_off_type_id text,
    user_id text,
    cancelled_at text,
    comments text,
    created_at text,
    end_date text,
    leave_units text,
    optional_leave_units text,
    rejected_at text,
    start_date text,
    "status" text,
    status_comments text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (applied_by_id) REFERENCES employee(id),
    FOREIGN KEY (approved_by_id) REFERENCES employee(id),
    FOREIGN KEY (cancelled_by_id) REFERENCES employee(id),
    FOREIGN KEY (rejected_by_id) REFERENCES employee(id),
    FOREIGN KEY (time_off_type_id) REFERENCES time_off_type(id),
    FOREIGN KEY (user_id) REFERENCES employee(id)
);

CREATE TABLE time_off_type (
    id text,
    applicable_for text,
    created_at text,
    deleted text,
    description text,
    is_default text,
    marital_status text,
    "name" text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE job_posting_field_picklist_value (
    id text,
    field_id text,
    pickable_id text,
    pickable_type text,
    "position" text,
    "value" text,
    PRIMARY KEY (id, field_id),
    FOREIGN KEY (field_id) REFERENCES job_posting_field(id)
);

CREATE TABLE job_posting_field (
    id text,
    created_at text,
    field_type text,
    is_default text,
    job_form_id text,
    label text,
    "name" text,
    "position" text,
    public text,
    required text,
    restricted text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE "role" (
    id text,
    created_at text,
    description text,
    is_default text,
    "name" text,
    sensitive text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE user_function (
    id text,
    created_at text,
    deleted text,
    updated_at text,
    "value" text,
    PRIMARY KEY (id)
);

CREATE TABLE sub_department (
    id text,
    created_at text,
    deleted text,
    "name" text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE branch (
    id text,
    city text,
    contact_info text,
    country_code text,
    created_at text,
    currency text,
    date_format text,
    deleted text,
    languages text,
    main_office text,
    "name" text,
    "state" text,
    street text,
    time_zone text,
    updated_at text,
    zip text,
    PRIMARY KEY (id)
);

CREATE TABLE employee_work_number (
    "index" text,
    employee_id text,
    "name" text,
    number text,
    PRIMARY KEY ("index", employee_id),
    FOREIGN KEY (employee_id) REFERENCES employee(id)
);

CREATE TABLE employee_phone_number (
    "index" text,
    employee_id text,
    masked text,
    "name" text,
    number text,
    PRIMARY KEY ("index", employee_id),
    FOREIGN KEY (employee_id) REFERENCES employee(id)
);

CREATE TABLE employee_emergency_contact (
    "index" text,
    employee_id text,
    address text,
    contact_number text,
    email text,
    "name" text,
    relationship text,
    PRIMARY KEY ("index", employee_id),
    FOREIGN KEY (employee_id) REFERENCES employee(id)
);

CREATE TABLE employee_social_profile (
    "index" text,
    employee_id text,
    "name" text,
    url text,
    PRIMARY KEY ("index", employee_id),
    FOREIGN KEY (employee_id) REFERENCES employee(id)
);

CREATE TABLE employee_time_off (
    id text,
    employee_id text,
    availed text,
    credit text,
    "name" text,
    PRIMARY KEY (id, employee_id),
    FOREIGN KEY (employee_id) REFERENCES employee(id)
);

CREATE TABLE employee_dependent (
    id text,
    employee_id text,
    date_of_birth text,
    deleted text,
    gender text,
    "name" text,
    relationship text,
    PRIMARY KEY (id, employee_id),
    FOREIGN KEY (employee_id) REFERENCES employee(id)
);

CREATE TABLE employee_previous_employment_reference (
    "index" text,
    employee_id text,
    previous_employment_id text,
    contact_number text,
    "name" text,
    PRIMARY KEY ("index", employee_id, previous_employment_id),
    FOREIGN KEY (employee_id) REFERENCES employee_previous_employment(employee_id),
    FOREIGN KEY (previous_employment_id) REFERENCES employee_previous_employment(id)
);

CREATE TABLE employee_previous_employment (
    id text,
    employee_id text,
    company text,
    deleted text,
    description text,
    end_date text,
    job_type text,
    other_salary_components text,
    "role" text,
    salary_value text,
    start_date text,
    PRIMARY KEY (id, employee_id),
    FOREIGN KEY (employee_id) REFERENCES employee(id)
);

CREATE TABLE employee_qualification (
    id text,
    employee_id text,
    course text,
    degree text,
    deleted text,
    description text,
    end_date text,
    grade_average text,
    institue_name text,
    pass_out_date text,
    start_date text,
    PRIMARY KEY (id, employee_id),
    FOREIGN KEY (employee_id) REFERENCES employee(id)
);

CREATE TABLE employee_bank_account (
    id text,
    employee_id text,
    account_number text,
    bank_name text,
    branch_code text,
    deleted text,
    name_as_per_account text,
    PRIMARY KEY (id, employee_id),
    FOREIGN KEY (employee_id) REFERENCES employee(id)
);

CREATE TABLE employee_compensation (
    id text,
    employee_id text,
    annual_amount text,
    cost_center_id text,
    cost_center_value text,
    currency text,
    "current" text,
    deleted text,
    description text,
    effective_date text,
    eligible_work_hour text,
    other_component text,
    pay_factor text,
    pay_group_id text,
    pay_group_value text,
    pay_method_id text,
    pay_method_value text,
    pay_rate_id text,
    pay_rate_name text,
    pay_rate_value text,
    pay_schedule_id text,
    pay_schedule_name text,
    reason_id text,
    reason_value text,
    variable_pay text,
    variable_pay_detail text,
    variable_pay_frequency_id text,
    variable_pay_frequency_name text,
    work_hour_rate_id text,
    work_hour_rate_value text,
    PRIMARY KEY (id, employee_id),
    FOREIGN KEY (employee_id) REFERENCES employee(id)
);

CREATE TABLE employee_bonus (
    id text,
    employee_id text,
    additional_detail text,
    bonus_type_id text,
    bonus_type_value text,
    currency text,
    deleted text,
    effective_date text,
    "value" text,
    PRIMARY KEY (id, employee_id),
    FOREIGN KEY (employee_id) REFERENCES employee(id)
);

CREATE TABLE employee_stock (
    id text,
    employee_id text,
    currency text,
    deleted text,
    description text,
    effective_date text,
    exercise_price text,
    exercise_price_discount text,
    expiration_date text,
    grant_date text,
    grant_number text,
    grant_reason_id text,
    grant_reason_value text,
    grant_type_id text,
    grant_type_value text,
    pay_rate_id text,
    pay_rate_name text,
    total_stock_units text,
    value_per_share text,
    vesting_period text,
    vesting_rate text,
    vesting_schedule text,
    vesting_type text,
    with_in_range text,
    PRIMARY KEY (id, employee_id),
    FOREIGN KEY (employee_id) REFERENCES employee(id)
);

CREATE TABLE employee_award (
    id text,
    employee_id text,
    awarded_by text,
    deleted text,
    "name" text,
    PRIMARY KEY (id, employee_id),
    FOREIGN KEY (employee_id) REFERENCES employee(id)
);

CREATE TABLE employee_honor (
    id text,
    employee_id text,
    awarded_by text,
    deleted text,
    "name" text,
    PRIMARY KEY (id, employee_id),
    FOREIGN KEY (employee_id) REFERENCES employee(id)
);

CREATE TABLE employee_certificate (
    id text,
    employee_id text,
    awarded_by text,
    deleted text,
    grade text,
    "name" text,
    PRIMARY KEY (id, employee_id),
    FOREIGN KEY (employee_id) REFERENCES employee(id)
);

CREATE TABLE employee_license (
    id text,
    employee_id text,
    deleted text,
    expiry_date text,
    "name" text,
    restrictions text,
    PRIMARY KEY (id, employee_id),
    FOREIGN KEY (employee_id) REFERENCES employee(id)
);

CREATE TABLE employee_background_verification_detail (
    id text,
    employee_id text,
    completion_date text,
    deleted text,
    initiation_date text,
    notes text,
    "status" text,
    vendor text,
    PRIMARY KEY (id, employee_id),
    FOREIGN KEY (employee_id) REFERENCES employee(id)
);

CREATE TABLE employee_visa (
    id text,
    employee_id text,
    country_code text,
    deleted text,
    valid_from text,
    valid_to text,
    visa_number text,
    visa_type text,
    PRIMARY KEY (id, employee_id),
    FOREIGN KEY (employee_id) REFERENCES employee(id)
);

CREATE TABLE employee_government_document (
    id text,
    employee_id text,
    country_code text,
    deleted text,
    expiry_date text,
    issuing_authority text,
    issuing_date text,
    "name" text,
    number text,
    type_id text,
    type_position text,
    type_value text,
    PRIMARY KEY (id, employee_id),
    FOREIGN KEY (employee_id) REFERENCES employee(id)
);

CREATE TABLE employee_role (
    id text,
    employee_id text,
    PRIMARY KEY (id, employee_id),
    FOREIGN KEY (employee_id) REFERENCES employee(id)
);

CREATE TABLE employee (
    id text,
    branch_id text,
    business_unit_id text,
    department_id text,
    hr_incharge_id text,
    job_role_id text,
    level_id text,
    reporting_to_id text,
    sub_department_id text,
    team_id text,
    user_function_id text,
    actual_retirement_date text,
    additional_hr_manager jsonb,
    additional_manager jsonb,
    additional_team jsonb,
    address_city text,
    address_country_code text,
    address_state text,
    address_street text,
    address_zip_code text,
    blood_group text,
    citizenship_status_id text,
    citizenship_status_value text,
    communication_address_city text,
    communication_address_country_code text,
    communication_address_same_as_residential text,
    communication_address_state text,
    communication_address_street text,
    communication_address_zip_code text,
    cost_center jsonb,
    cost_center_id text,
    cost_center_value text,
    country_of_birth text,
    created_at text,
    date_of_birth text,
    deleted text,
    designation text,
    draft text,
    eeo_company_code text,
    eeo_disabled text,
    eeo_ethnicity text,
    eeo_job_category text,
    eeo_vetran text,
    employee_id text,
    employee_type text,
    employment_end_date text,
    end_time text,
    expected_retirement_date text,
    first_name text,
    flsa_required text,
    gender text,
    hereditary_last_name text,
    hire_reason text,
    hired_on text,
    id_card_detail text,
    im_address text,
    job_code text,
    job_exempt text,
    job_role_value text,
    joining_date text,
    languages jsonb,
    last_name text,
    legal_name text,
    marital_status text,
    middle_name text,
    nick_name text,
    notice_end_date text,
    notice_period text,
    notice_start_date text,
    official_email text,
    personal_email text,
    place_of_birth text,
    previous_name text,
    previous_name_change_date text,
    probation_end_date text,
    probation_start_date text,
    retirement_eligibility_date text,
    retirement_status_id text,
    retirement_status_value text,
    scheduled_weekly_hour text,
    secondary_business_email text,
    secondary_last_name text,
    shift_id text,
    shift_value text,
    start_time text,
    "status" text,
    termination_category_id text,
    termination_category_value text,
    termination_date text,
    termination_reason text,
    updated_at timestamp,
    user_academic_suffix_id text,
    user_academic_suffix_value text,
    user_honorary_suffix_id text,
    user_honorary_suffix_value text,
    user_professional_suffix_id text,
    user_professional_suffix_value text,
    user_suffix_id text,
    user_suffix_value text,
    user_title_id text,
    user_title_value text,
    work_hour text,
    workstation_number text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (branch_id) REFERENCES branch(id),
    FOREIGN KEY (business_unit_id) REFERENCES business_unit(id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (hr_incharge_id) REFERENCES employee(id),
    FOREIGN KEY (job_role_id) REFERENCES "role"(id),
    FOREIGN KEY (level_id) REFERENCES "level"(id),
    FOREIGN KEY (reporting_to_id) REFERENCES employee(id),
    FOREIGN KEY (sub_department_id) REFERENCES sub_department(id),
    FOREIGN KEY (team_id) REFERENCES team(id),
    FOREIGN KEY (user_function_id) REFERENCES user_function(id)
);

CREATE TABLE applicant_follower (
    id text,
    applicant_id text,
    user_id text,
    PRIMARY KEY (id, applicant_id),
    FOREIGN KEY (applicant_id) REFERENCES applicant(id),
    FOREIGN KEY (user_id) REFERENCES employee(id)
);

CREATE TABLE applicant (
    id text,
    candidate_id text,
    job_id text,
    requisition_id text,
    source_category_id text,
    source_id text,
    sub_stage_id text,
    archived_at text,
    created_at text,
    deleted text,
    job_title text,
    moved_at text,
    on_hold_at text,
    on_hold_till text,
    rejected_at text,
    stage text,
    "status" text,
    updated_at text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (candidate_id) REFERENCES candidate(id),
    FOREIGN KEY (job_id) REFERENCES job_posting(id),
    FOREIGN KEY (requisition_id) REFERENCES job_post_requisition(id),
    FOREIGN KEY (source_category_id) REFERENCES "source"(id),
    FOREIGN KEY (source_id) REFERENCES "source"(id),
    FOREIGN KEY (sub_stage_id) REFERENCES job_post_sub_stage(id)
);

CREATE TABLE employee_field_scope (
    scopable_id text,
    employee_field_id text,
    scopable_lable text,
    scopable_type text,
    PRIMARY KEY (scopable_id, employee_field_id),
    FOREIGN KEY (employee_field_id) REFERENCES employee_field(id)
);

CREATE TABLE employee_field_picklist (
    id text,
    employee_field_id text,
    pickable_id text,
    pickable_type text,
    "position" text,
    "value" text,
    PRIMARY KEY (id, employee_field_id),
    FOREIGN KEY (employee_field_id) REFERENCES employee_field(id)
);

CREATE TABLE employee_field (
    id text,
    created_at text,
    deleted text,
    editable_by text,
    employee_form_id text,
    field_type jsonb,
    is_default text,
    label text,
    "name" text,
    "position" text,
    required text,
    section_label text,
    tab text,
    updated_at text,
    viewable_by text,
    PRIMARY KEY (id)
);

CREATE TABLE job_post_skill (
    "index" text,
    job_posting_id text,
    skill text,
    PRIMARY KEY ("index", job_posting_id),
    FOREIGN KEY (job_posting_id) REFERENCES job_posting(id)
);

CREATE TABLE job_remote_branch (
    "index" text,
    job_posting_id text,
    remote_branch text,
    PRIMARY KEY ("index", job_posting_id),
    FOREIGN KEY (job_posting_id) REFERENCES job_posting(id)
);

CREATE TABLE recruiter (
    employee_id text,
    job_posting_id text,
    requisition_id text,
    PRIMARY KEY (employee_id, job_posting_id, requisition_id),
    FOREIGN KEY (employee_id) REFERENCES employee(id),
    FOREIGN KEY (job_posting_id) REFERENCES job_post_requisition(job_posting_id),
    FOREIGN KEY (requisition_id) REFERENCES job_post_requisition(id)
);

CREATE TABLE hiring_manager (
    employee_id text,
    job_posting_id text,
    requisition_id text,
    PRIMARY KEY (employee_id, job_posting_id, requisition_id),
    FOREIGN KEY (employee_id) REFERENCES employee(id),
    FOREIGN KEY (job_posting_id) REFERENCES job_post_requisition(job_posting_id),
    FOREIGN KEY (requisition_id) REFERENCES job_post_requisition(id)
);

CREATE TABLE panel_member (
    employee_id text,
    job_posting_id text,
    requisition_id text,
    PRIMARY KEY (employee_id, job_posting_id, requisition_id),
    FOREIGN KEY (employee_id) REFERENCES employee(id),
    FOREIGN KEY (job_posting_id) REFERENCES job_post_requisition(job_posting_id),
    FOREIGN KEY (requisition_id) REFERENCES job_post_requisition(id)
);

CREATE TABLE job_post_requisition (
    id text,
    job_posting_id text,
    deleted text,
    title text,
    PRIMARY KEY (id, job_posting_id),
    FOREIGN KEY (job_posting_id) REFERENCES job_posting(id)
);

CREATE TABLE job_post_sub_stage (
    id text,
    job_posting_id text,
    deleted text,
    is_default text,
    "name" text,
    "position" text,
    stage text,
    PRIMARY KEY (id, job_posting_id),
    FOREIGN KEY (job_posting_id) REFERENCES job_posting(id)
);

CREATE TABLE job_posting (
    id text,
    branch_id text,
    department_id text,
    applicant_access_type text,
    applicant_apply_link text,
    closing_date text,
    created_at text,
    deleted text,
    description text,
    experience text,
    interview_process_id text,
    interview_process_name text,
    remote text,
    salary_currency text,
    salary_max text,
    salary_min text,
    show_pursue_as_career text,
    "status" text,
    title text,
    "type" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (branch_id) REFERENCES branch(id),
    FOREIGN KEY (department_id) REFERENCES department(id)
);

CREATE TABLE applicant_field_picklist_value (
    id text,
    field_id text,
    job_posting_id text,
    pickable_id text,
    pickable_type text,
    "position" text,
    "value" text,
    PRIMARY KEY (id),
    FOREIGN KEY (field_id) REFERENCES applicant_field(id),
    FOREIGN KEY (job_posting_id) REFERENCES applicant_field(job_posting_id)
);

CREATE TABLE applicant_field (
    id text,
    job_posting_id text,
    applicant_form_id text,
    base_model text,
    created_at text,
    deleted text,
    external_field text,
    field_type text,
    group_label text,
    group_name text,
    group_position text,
    is_default text,
    label text,
    "name" text,
    "position" text,
    recruiter_field text,
    required_in_external_form text,
    required_in_recruiter_form text,
    required_in_vendor_form text,
    updated_at text,
    vendor_field text,
    viewable_by text,
    PRIMARY KEY (id, job_posting_id),
    FOREIGN KEY (job_posting_id) REFERENCES job_posting(id)
);

CREATE TABLE team (
    id text,
    created_at text,
    deleted text,
    "name" text,
    updated_at text,
    PRIMARY KEY (id)
);
