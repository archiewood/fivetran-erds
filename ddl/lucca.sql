CREATE TABLE leave_account_legal_entity (
    id text,
    leave_account_id text,
    "name" text,
    url text,
    PRIMARY KEY (id, leave_account_id),
    FOREIGN KEY (leave_account_id) REFERENCES leave_account(id)
);

CREATE TABLE leave_account_authorized_operation_scopes (
    id text,
    leave_account_authorized_operation_id text,
    leave_account_id text,
    code text,
    description text,
    "name" text,
    "value" text,
    PRIMARY KEY (id),
    FOREIGN KEY (leave_account_authorized_operation_id) REFERENCES leave_account_authorized_operation(id),
    FOREIGN KEY (leave_account_id) REFERENCES leave_account_authorized_operation(leave_account_id)
);

CREATE TABLE leave_account_authorized_operation (
    id text,
    leave_account_id text,
    description text,
    is_admin text,
    is_business_item_specific text,
    is_scope_specific text,
    label text,
    "name" text,
    PRIMARY KEY (id, leave_account_id),
    FOREIGN KEY (leave_account_id) REFERENCES leave_account(id)
);

CREATE TABLE leave_account (
    id text,
    created_by_id text,
    deleted_by_id text,
    modified_by_id text,
    allow_before_consumption text,
    allow_input text,
    allow_outer_consumption text,
    allow_select text,
    allow_simulation text,
    atp text,
    authorized_actions jsonb,
    auto_credit text,
    color text,
    complete_consumption text,
    consumption_end_date text,
    consumption_start_date text,
    created_at text,
    credit_account text,
    custom_color text,
    debit_account text,
    debit_allowed_rounding_limits text,
    debit_authorization text,
    deleted_at text,
    duration_hour text,
    entitlement_end_date text,
    entitlement_start_date text,
    extend_to_following_non_working_days text,
    french_sick_leave_nature text,
    half_day_authorization text,
    has_entitlement_period text,
    i_1_8_n_labels jsonb,
    is_absenteeism text,
    is_active text,
    is_actual_work text,
    is_full_entitlement text,
    is_leave text,
    is_movement_account text,
    is_orphan text,
    is_pristine text,
    is_public text,
    is_recurring text,
    is_remote_work text,
    leave_account_category_id text,
    leave_account_category_name text,
    leave_account_category_url text,
    leave_account_type text,
    leave_profile_entitlements jsonb,
    modified_at text,
    "name" text,
    nbj text,
    need_approval text,
    need_cancellation_approval text,
    need_supporting_documentation text,
    "position" text,
    requested_permission text,
    selected_date text,
    selected_user text,
    step_hour text,
    "type" text,
    unit text,
    url text,
    warning text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_id) REFERENCES users(id),
    FOREIGN KEY (deleted_by_id) REFERENCES users(id),
    FOREIGN KEY (modified_by_id) REFERENCES users(id)
);

CREATE TABLE leave_authorized_operation_scope (
    id text,
    leave_authorized_operation_id text,
    leave_authorized_operation_leave_id text,
    code text,
    description text,
    "name" text,
    "value" text,
    PRIMARY KEY (id, leave_authorized_operation_id, leave_authorized_operation_leave_id),
    FOREIGN KEY (leave_authorized_operation_id) REFERENCES leave_authorized_operation(id),
    FOREIGN KEY (leave_authorized_operation_leave_id) REFERENCES leave_authorized_operation(leave_id)
);

CREATE TABLE leave_authorized_operation (
    id text,
    leave_id text,
    description text,
    is_admin text,
    is_business_item_specific text,
    is_scope_specific text,
    label text,
    "name" text,
    PRIMARY KEY (id, leave_id),
    FOREIGN KEY (leave_id) REFERENCES leave(id)
);

CREATE TABLE leave (
    id text,
    cancellation_user_id text,
    leave_account_id text,
    leave_period_id text,
    authorized_actions_details text,
    calendar text,
    cancellation_date text,
    cancellation_user text,
    code text,
    color text,
    "comment" text,
    creation_date text,
    "date" text,
    days_off_check_id text,
    duration text,
    ends_at text,
    granularity text,
    is_a_m text,
    is_active text,
    is_actual_work text,
    is_being_imported text,
    is_cancellable text,
    is_public text,
    is_real_leave text,
    is_remote_work text,
    key_item_1 text,
    key_item_2 text,
    key_item_3 text,
    leave_account_duration text,
    "name" text,
    nature text,
    nature_of_half_day text,
    owner_id text,
    scope text,
    start_date_time text,
    starts_at text,
    "status" text,
    time_line text,
    "type" text,
    unit text,
    url text,
    "value" text,
    working_time_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (cancellation_user_id) REFERENCES users(id),
    FOREIGN KEY (leave_account_id) REFERENCES leave_account(id),
    FOREIGN KEY (leave_period_id) REFERENCES leave_period(id)
);

CREATE TABLE leave_request_log (
    id text,
    leave_request_id text,
    "comment" text,
    "date" text,
    "name" text,
    "status" text,
    PRIMARY KEY (id, leave_request_id),
    FOREIGN KEY (leave_request_id) REFERENCES leave_request(id)
);

CREATE TABLE leave_request_approval (
    id text,
    leave_request_id text,
    approved text,
    approver_id text,
    "comment" text,
    "date" text,
    "name" text,
    substituted_approver_id text,
    PRIMARY KEY (id, leave_request_id),
    FOREIGN KEY (leave_request_id) REFERENCES leave_request(id)
);

CREATE TABLE leave_request_cancellation (
    id text,
    leave_request_id text,
    approved text,
    author_id text,
    "comment" text,
    creation_date text,
    is_active text,
    "name" text,
    next_approver_id text,
    rank text,
    PRIMARY KEY (id, leave_request_id),
    FOREIGN KEY (leave_request_id) REFERENCES leave_request(id)
);

CREATE TABLE leave_request_authorized_operation_scope (
    _fivetran_id text,
    leave_request_authorized_operation_id text,
    leave_request_id text,
    code text,
    description text,
    id text,
    "name" text,
    "value" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (leave_request_authorized_operation_id) REFERENCES leave_request_authorized_operation(id),
    FOREIGN KEY (leave_request_id) REFERENCES leave_request_authorized_operation(leave_request_id)
);

CREATE TABLE leave_request_authorized_operation (
    id text,
    leave_request_id text,
    description text,
    is_admin text,
    is_business_item_specific text,
    is_scope_specific text,
    label text,
    "name" text,
    PRIMARY KEY (id, leave_request_id),
    FOREIGN KEY (leave_request_id) REFERENCES leave_request(id)
);

CREATE TABLE leave_request (
    id text,
    cancellation_user_id text,
    leave_period_id text,
    next_approver_id text,
    owner_id text,
    author_id text,
    author_name text,
    author_url text,
    authorized_actions jsonb,
    cancellation_date text,
    cancellation_request_pending jsonb,
    creation_date text,
    days_off_check_id text,
    is_active text,
    "name" text,
    owner_comment text,
    "source" text,
    "status" text,
    url text,
    warnings jsonb,
    PRIMARY KEY (id),
    FOREIGN KEY (cancellation_user_id) REFERENCES users(id),
    FOREIGN KEY (leave_period_id) REFERENCES leave_period(id),
    FOREIGN KEY (next_approver_id) REFERENCES users(id),
    FOREIGN KEY (owner_id) REFERENCES users(id)
);

CREATE TABLE department_user (
    department_id text,
    user_id text,
    PRIMARY KEY (department_id, user_id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE department_current_user (
    current_users text,
    department_id text,
    PRIMARY KEY (current_users, department_id),
    FOREIGN KEY (current_users) REFERENCES users(id),
    FOREIGN KEY (department_id) REFERENCES department(id)
);

CREATE TABLE department_authorized_operation_scope (
    id text,
    department_authorized_operation_id text,
    department_id text,
    code text,
    description text,
    "name" text,
    "value" text,
    PRIMARY KEY (id, department_authorized_operation_id, department_id),
    FOREIGN KEY (department_authorized_operation_id) REFERENCES department_authorized_operation(id),
    FOREIGN KEY (department_id) REFERENCES department_authorized_operation(department_id)
);

CREATE TABLE department_authorized_operation (
    id text,
    department_id text,
    description text,
    is_admin text,
    is_business_item_specific text,
    is_scope_specific text,
    label text,
    "name" text,
    PRIMARY KEY (id, department_id),
    FOREIGN KEY (department_id) REFERENCES department(id)
);

CREATE TABLE department (
    id text,
    head_id text,
    parent_id text,
    authorized_actions jsonb,
    code text,
    description text,
    hierarchy text,
    is_active text,
    "level" text,
    "name" text,
    "position" text,
    sort_order text,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (head_id) REFERENCES users(id),
    FOREIGN KEY (parent_id) REFERENCES department(id)
);

CREATE TABLE period_leaves (
    id text,
    leave_period_id text,
    "name" text,
    url text,
    PRIMARY KEY (id, leave_period_id),
    FOREIGN KEY (leave_period_id) REFERENCES leave_period(id)
);

CREATE TABLE leave_period_log (
    id text,
    leave_period_id text,
    "name" text,
    url text,
    PRIMARY KEY (id, leave_period_id),
    FOREIGN KEY (leave_period_id) REFERENCES leave_period(id)
);

CREATE TABLE leave_period_account (
    id text,
    leave_period_id text,
    "name" text,
    url text,
    PRIMARY KEY (id, leave_period_id),
    FOREIGN KEY (leave_period_id) REFERENCES leave_period(id)
);

CREATE TABLE leave_period_authorized_operation_scopes (
    id text,
    leave_period_authorized_operation_id text,
    leave_period_id text,
    code text,
    description text,
    "name" text,
    "value" text,
    PRIMARY KEY (id),
    FOREIGN KEY (leave_period_authorized_operation_id) REFERENCES leave_period_authorized_operation(id),
    FOREIGN KEY (leave_period_id) REFERENCES leave_period_authorized_operation(leave_period_id)
);

CREATE TABLE leave_period_authorized_operation (
    id text,
    leave_period_id text,
    description text,
    is_admin text,
    is_business_item_specific text,
    is_scope_specific text,
    label text,
    "name" text,
    PRIMARY KEY (id, leave_period_id),
    FOREIGN KEY (leave_period_id) REFERENCES leave_period(id)
);

CREATE TABLE leave_period (
    id text,
    owner_id text,
    attachment jsonb,
    attachment_id text,
    attachment_name text,
    attachment_preview jsonb,
    authorized_actions jsonb,
    confirmation_date text,
    duration text,
    duration_unit text,
    ends_am text,
    ends_on text,
    is_confirmed text,
    is_half_day text,
    migration_transation_id text,
    "name" text,
    relate_to_one_day text,
    starts_am text,
    starts_on text,
    supporting_documentation_controls text,
    time_zone_id text,
    url text,
    warnings jsonb,
    PRIMARY KEY (id),
    FOREIGN KEY (owner_id) REFERENCES users(id)
);

CREATE TABLE leave_request_approval_detail (
    leave_request_id text,
    id text,
    approver_id text,
    substituted_approver_id text,
    approved text,
    "comment" text,
    "date" text,
    "name" text,
    PRIMARY KEY (leave_request_id, id),
    FOREIGN KEY (id) REFERENCES leave_request_approval(id),
    FOREIGN KEY (approver_id) REFERENCES users(id),
    FOREIGN KEY (substituted_approver_id) REFERENCES users(id)
);

CREATE TABLE cancelation_request_detail (
    id text,
    leave_request_id text,
    author_id text,
    "comment" text,
    creation_date text,
    is_active text,
    "name" text,
    next_approver_id text,
    rank text,
    PRIMARY KEY (id, leave_request_id),
    FOREIGN KEY (leave_request_id) REFERENCES leave_request_cancellation(leave_request_id)
);

CREATE TABLE user_habilited_role (
    id text,
    users_id text,
    "name" text,
    url text,
    PRIMARY KEY (id, users_id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE user_work_cycle (
    id text,
    users_id text,
    "name" text,
    url text,
    PRIMARY KEY (id, users_id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE user_authorized_operation_scope (
    id text,
    user_authorized_operation_id text,
    user_id text,
    code text,
    description text,
    "name" text,
    "value" text,
    PRIMARY KEY (id, user_authorized_operation_id, user_id),
    FOREIGN KEY (user_authorized_operation_id) REFERENCES user_authorized_operation(id),
    FOREIGN KEY (user_id) REFERENCES user_authorized_operation(user_id)
);

CREATE TABLE user_authorized_operation (
    id text,
    user_id text,
    description text,
    is_admin text,
    is_business_item_specific text,
    is_scope_specific text,
    label text,
    "name" text,
    PRIMARY KEY (id, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    address text,
    application_data_manager_2 jsonb,
    application_data_manager_2_id jsonb,
    attributes jsonb,
    bank_name text,
    bic text,
    birth_date text,
    calendar_id text,
    calendar_name text,
    calendar_url text,
    civil_title text,
    corporate_card text,
    created_at text,
    created_on text,
    csp_id text,
    csp_name text,
    csp_url text,
    culture_code text,
    culture_id text,
    culture_name text,
    current_delegatee jsonb,
    current_delegatee_id text,
    department_id text,
    direct_line text,
    display_name text,
    dt_contract_end text,
    dt_contract_start text,
    employee_number text,
    external_id text,
    first_name text,
    french_car_tax_horse_power text,
    french_motocycles_tax_horse_power text,
    gender text,
    iban text,
    insurance_number text,
    job_qualification jsonb,
    job_qualification_id text,
    job_title text,
    last_annual_review_date_link text,
    last_annual_review_date_value jsonb,
    last_fixed_working_days_review_date_link text,
    last_fixed_working_days_review_date_value jsonb,
    last_name text,
    last_professional_review_date_link text,
    last_professional_review_date_value jsonb,
    legal_entity_id text,
    legal_entity_name text,
    legal_entity_url text,
    login text,
    mail text,
    manager_id text,
    modified_at text,
    modified_on text,
    "name" text,
    nationality_currency_id text,
    nationality_id text,
    nationality_name text,
    personal_account text,
    personal_card text,
    personal_email text,
    personal_mobile text,
    picture_extension text,
    picture_href text,
    picture_id text,
    picture_mime_type text,
    picture_name text,
    picture_url text,
    professional_mobile text,
    profile_figgo_id text,
    profile_figgo_name text,
    profile_figgo_url text,
    profile_utime_id text,
    profile_utime_name text,
    profile_utime_url text,
    quote text,
    rib text,
    role_principal_id text,
    role_principal_name text,
    role_principal_url text,
    seniority_date text,
    site jsonb,
    site_id text,
    unit_sell_price text,
    url text,
    -- extended_data_* (dynamic column),
    PRIMARY KEY (id)
);
