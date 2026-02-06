CREATE TABLE onboarding_request_section_status (
    "index" text,
    onboarding_request_requested_date text,
    onboarding_request_requestor_key text,
    approver_key text,
    approver_name text,
    assigned_to text,
    assigned_to_key text,
    is_required text,
    section_name text,
    "status" text,
    status_date text,
    PRIMARY KEY ("index", onboarding_request_requested_date, onboarding_request_requestor_key),
    FOREIGN KEY (onboarding_request_requested_date) REFERENCES onboarding_request(requested_date),
    FOREIGN KEY (onboarding_request_requestor_key) REFERENCES onboarding_request(requestor_key)
);

CREATE TABLE onboarding_request (
    requested_date text,
    requestor_key text,
    product_key text,
    vendor_key text,
    approved_or_declined_date text,
    deadline_date text,
    product_name text,
    relationship_key text,
    requestor_name text,
    "status" text,
    status_id text,
    vendor_name text,
    vmo_manager_key text,
    vmo_manager_name text,
    PRIMARY KEY (requested_date, requestor_key),
    FOREIGN KEY (product_key) REFERENCES vendor_profile_product("key"),
    FOREIGN KEY (vendor_key) REFERENCES vendor_profile("key")
);

CREATE TABLE oversight_task_product (
    "index" text,
    oversight_task_key text,
    "key" text,
    PRIMARY KEY ("index", oversight_task_key),
    FOREIGN KEY (oversight_task_key) REFERENCES oversight_task("key")
);

CREATE TABLE oversight_task_document (
    "index" text,
    oversight_task_key text,
    "key" text,
    PRIMARY KEY ("index", oversight_task_key),
    FOREIGN KEY (oversight_task_key) REFERENCES oversight_task("key")
);

CREATE TABLE oversight_task_comment (
    "index" text,
    oversight_task_key text,
    "comment" text,
    PRIMARY KEY ("index", oversight_task_key),
    FOREIGN KEY (oversight_task_key) REFERENCES oversight_task("key")
);

CREATE TABLE oversight_task (
    "key" text,
    approver_key text,
    completed_by_key text,
    internal_reviewer_key text,
    owner_key text,
    vendor_key text,
    approval_status text,
    completed_date text,
    end_date text,
    external_reviewer text,
    external_reviewer_date text,
    internal_reviewer_date text,
    lifecycle text,
    offboarding_property_request_key text,
    onboarding_property_request_relationship_key text,
    owner_type text,
    requirement_key text,
    requirement_name text,
    review_result text,
    soc_type text,
    start_date text,
    task_status text,
    PRIMARY KEY ("key"),
    FOREIGN KEY (approver_key) REFERENCES users("key"),
    FOREIGN KEY (completed_by_key) REFERENCES users("key"),
    FOREIGN KEY (internal_reviewer_key) REFERENCES users("key"),
    FOREIGN KEY (owner_key) REFERENCES users("key"),
    FOREIGN KEY (vendor_key) REFERENCES vendor_profile("key")
);

CREATE TABLE oversight_requirement (
    "key" text,
    is_one_time_requirement text,
    is_soc text,
    lifecycle text,
    "name" text,
    offboarding_lifecycle text,
    onboarding_lifecycle_approver_contact_key text,
    onboarding_lifecycle_approver_contact_name text,
    onboarding_lifecycle_default_task_owner_key text,
    onboarding_lifecycle_default_task_owner_name text,
    onboarding_lifecycle_default_task_owner_type text,
    onboarding_lifecycle_is_active text,
    onboarding_lifecycle_is_approval_required text,
    onboarding_lifecycle_oversight_requirement_key text,
    ongoing_lifecycle text,
    oversight_requirement_category text,
    oversight_requirement_result_group text,
    oversight_requirement_type text,
    should_notify_admin_when_overdue text,
    task_duration_in_days text,
    PRIMARY KEY ("key")
);

CREATE TABLE spend (
    "key" text,
    budget_key text,
    product_key text,
    vendor_key text,
    amount text,
    budget_name text,
    invoice_date text,
    invoice_number text,
    notes text,
    PRIMARY KEY ("key"),
    FOREIGN KEY (budget_key) REFERENCES budget("key"),
    FOREIGN KEY (product_key) REFERENCES vendor_profile_product("key"),
    FOREIGN KEY (vendor_key) REFERENCES vendor_profile("key")
);

CREATE TABLE business_unit_product (
    "index" text,
    business_unit_key text,
    "key" text,
    PRIMARY KEY ("index", business_unit_key),
    FOREIGN KEY (business_unit_key) REFERENCES business_unit("key")
);

CREATE TABLE business_unit_user (
    "index" text,
    business_unit_key text,
    "key" text,
    PRIMARY KEY ("index", business_unit_key),
    FOREIGN KEY (business_unit_key) REFERENCES business_unit("key"),
    FOREIGN KEY ("key") REFERENCES users("key")
);

CREATE TABLE business_unit (
    "key" text,
    "name" text,
    PRIMARY KEY ("key")
);

CREATE TABLE unassigned_product (
    "key" text,
    PRIMARY KEY ("key"),
    FOREIGN KEY ("key") REFERENCES vendor_profile_product("key")
);

CREATE TABLE unassigned_user (
    "key" text,
    PRIMARY KEY ("key"),
    FOREIGN KEY ("key") REFERENCES users("key")
);

CREATE TABLE country (
    dialing_code text,
    abbreviation text,
    country text,
    PRIMARY KEY (dialing_code)
);

CREATE TABLE service_product (
    "index" text,
    service_id text,
    "key" text,
    "name" text,
    PRIMARY KEY ("index", service_id),
    FOREIGN KEY (service_id) REFERENCES service(id)
);

CREATE TABLE service (
    id text,
    vendor_key text,
    created_date text,
    "key" text,
    "status" text,
    status_changed_date text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (vendor_key) REFERENCES vendor_profile("key")
);

CREATE TABLE vendor_profile_fourth_party (
    "index" text,
    vendor_profile_key text,
    "key" text,
    PRIMARY KEY ("index", vendor_profile_key),
    FOREIGN KEY (vendor_profile_key) REFERENCES vendor_profile("key")
);

CREATE TABLE vendor_profile_third_party (
    "index" text,
    vendor_profile_key text,
    "key" text,
    PRIMARY KEY ("index", vendor_profile_key),
    FOREIGN KEY (vendor_profile_key) REFERENCES vendor_profile("key")
);

CREATE TABLE vendor_profile_data_answer (
    "index" text,
    vendor_profile_data_key text,
    vendor_profile_key text,
    answer text,
    PRIMARY KEY ("index", vendor_profile_data_key, vendor_profile_key),
    FOREIGN KEY (vendor_profile_data_key) REFERENCES vendor_profile_data("key"),
    FOREIGN KEY (vendor_profile_key) REFERENCES vendor_profile_data(vendor_profile_key)
);

CREATE TABLE vendor_profile_data (
    "key" text,
    vendor_profile_key text,
    answer_format text,
    data_field_key text,
    formatted_answer text,
    group_identity text,
    label text,
    PRIMARY KEY ("key", vendor_profile_key),
    FOREIGN KEY (vendor_profile_key) REFERENCES vendor_profile("key")
);

CREATE TABLE vendor_profile_open_requirement_product (
    "index" text,
    vendor_profile_key text,
    vendor_profile_open_requirement_index text,
    "key" text,
    PRIMARY KEY ("index", vendor_profile_key, vendor_profile_open_requirement_index),
    FOREIGN KEY (vendor_profile_key) REFERENCES vendor_profile_open_requirement(vendor_profile_key),
    FOREIGN KEY (vendor_profile_open_requirement_index) REFERENCES vendor_profile_open_requirement("index")
);

CREATE TABLE vendor_profile_open_requirement (
    "index" text,
    vendor_profile_key text,
    due_date text,
    "key" text,
    requirement_key text,
    task_owner_key text,
    PRIMARY KEY ("index", vendor_profile_key),
    FOREIGN KEY (vendor_profile_key) REFERENCES vendor_profile("key")
);

CREATE TABLE vendor_profile_product_contact_phone_number (
    "index" text,
    vendor_profile_key text,
    vendor_profile_product_contact_index text,
    vendor_profile_product_key text,
    area_code text,
    extension text,
    prefix text,
    suffix text,
    "type" text,
    PRIMARY KEY ("index", vendor_profile_key, vendor_profile_product_contact_index, vendor_profile_product_key),
    FOREIGN KEY (vendor_profile_key) REFERENCES vendor_profile_product_contact(vendor_profile_key),
    FOREIGN KEY (vendor_profile_product_contact_index) REFERENCES vendor_profile_product_contact("index"),
    FOREIGN KEY (vendor_profile_product_key) REFERENCES vendor_profile_product_contact(vendor_profile_product_key)
);

CREATE TABLE vendor_profile_product_contact (
    "index" text,
    vendor_profile_key text,
    vendor_profile_product_key text,
    contact_key text,
    email_address text,
    first_name text,
    is_primary text,
    is_primary_questionnaires text,
    "key" text,
    last_name text,
    PRIMARY KEY ("index", vendor_profile_key, vendor_profile_product_key),
    FOREIGN KEY (vendor_profile_key) REFERENCES vendor_profile_product(vendor_profile_key),
    FOREIGN KEY (vendor_profile_product_key) REFERENCES vendor_profile_product("key")
);

CREATE TABLE vendor_profile_product_data_answer (
    "index" text,
    vendor_profile_key text,
    vendor_profile_product_data_key text,
    vendor_profile_product_key text,
    answer text,
    PRIMARY KEY ("index", vendor_profile_key, vendor_profile_product_data_key, vendor_profile_product_key),
    FOREIGN KEY (vendor_profile_key) REFERENCES vendor_profile_product_data(vendor_profile_key),
    FOREIGN KEY (vendor_profile_product_data_key) REFERENCES vendor_profile_product_data("key"),
    FOREIGN KEY (vendor_profile_product_key) REFERENCES vendor_profile_product_data(vendor_profile_product_key)
);

CREATE TABLE vendor_profile_product_data (
    "key" text,
    vendor_profile_key text,
    vendor_profile_product_key text,
    answer_format text,
    data_field_key text,
    formatted_answer text,
    group_identity text,
    label text,
    PRIMARY KEY ("key", vendor_profile_key, vendor_profile_product_key),
    FOREIGN KEY (vendor_profile_key) REFERENCES vendor_profile_product(vendor_profile_key),
    FOREIGN KEY (vendor_profile_product_key) REFERENCES vendor_profile_product("key")
);

CREATE TABLE vendor_profile_collaborator (
    "index" text,
    vendor_profile_key text,
    vendor_profile_product_key text,
    "key" text,
    PRIMARY KEY ("index", vendor_profile_key, vendor_profile_product_key),
    FOREIGN KEY (vendor_profile_key) REFERENCES vendor_profile_product(vendor_profile_key),
    FOREIGN KEY (vendor_profile_product_key) REFERENCES vendor_profile_product("key")
);

CREATE TABLE vendor_profile_business_unit (
    "index" text,
    vendor_profile_key text,
    vendor_profile_product_key text,
    business_unit text,
    PRIMARY KEY ("index", vendor_profile_key, vendor_profile_product_key),
    FOREIGN KEY (vendor_profile_key) REFERENCES vendor_profile_product(vendor_profile_key),
    FOREIGN KEY (vendor_profile_product_key) REFERENCES vendor_profile_product("key")
);

CREATE TABLE vendor_profile_product (
    "key" text,
    vendor_profile_key text,
    assessment_last_completed text,
    assessment_next_due text,
    category text,
    created_date text,
    inherent_assessment_approved_by text,
    inherent_assessment_performed_by text,
    inherent_risk text,
    inherent_risk_score text,
    is_active text,
    manager_key text,
    "name" text,
    product_type text,
    residual_assessment_approved_by text,
    residual_assessment_performed_by text,
    residual_risk text,
    residual_risk_score text,
    PRIMARY KEY ("key", vendor_profile_key),
    FOREIGN KEY (vendor_profile_key) REFERENCES vendor_profile("key")
);

CREATE TABLE vendor_profile_contract (
    "key" text,
    vendor_profile_key text,
    PRIMARY KEY ("key", vendor_profile_key),
    FOREIGN KEY ("key") REFERENCES contract("key"),
    FOREIGN KEY (vendor_profile_key) REFERENCES vendor_profile("key")
);

CREATE TABLE vendor_profile (
    "key" text,
    confidence_level text,
    confidence_level_comment text,
    contact_key text,
    has_vendor_spend_budget text,
    has_vendor_spend_detail text,
    is_critical text,
    is_fourth_party text,
    is_third_party text,
    "name" text,
    PRIMARY KEY ("key")
);

CREATE TABLE request_answer_vendor_profile_expected_answer (
    "index" text,
    request_answer_vendor_profile_answer_key text,
    expected_answer text,
    PRIMARY KEY ("index", request_answer_vendor_profile_answer_key),
    FOREIGN KEY (request_answer_vendor_profile_answer_key) REFERENCES request_answer_vendor_profile_answer("key")
);

CREATE TABLE request_answer_vendor_profile_answer (
    "key" text,
    relationship_key text,
    PRIMARY KEY ("key")
);

CREATE TABLE request_answer_product_profile_expected_answer (
    "index" text,
    request_answer_product_profile_answer_key text,
    expected_answer text,
    PRIMARY KEY ("index", request_answer_product_profile_answer_key),
    FOREIGN KEY (request_answer_product_profile_answer_key) REFERENCES request_answer_product_profile_answer("key")
);

CREATE TABLE request_answer_product_profile_answer (
    "key" text,
    relationship_key text,
    PRIMARY KEY ("key")
);

CREATE TABLE budget (
    "key" text,
    vendor_profile_key text,
    amount text,
    end_date text,
    "name" text,
    start_date text,
    PRIMARY KEY ("key", vendor_profile_key),
    FOREIGN KEY (vendor_profile_key) REFERENCES vendor_profile("key")
);

CREATE TABLE form_vendor_profile_expected_answer (
    "index" text,
    form_vendor_profile_answer_key text,
    expected_answer text,
    PRIMARY KEY ("index", form_vendor_profile_answer_key),
    FOREIGN KEY (form_vendor_profile_answer_key) REFERENCES form_vendor_profile_answer("key")
);

CREATE TABLE form_vendor_profile_answer (
    "key" text,
    form_key text,
    PRIMARY KEY ("key"),
    FOREIGN KEY (form_key) REFERENCES vendor_onboarding_form("key")
);

CREATE TABLE form_product_profile_expected_answer (
    "index" text,
    form_product_profile_answer_key text,
    expected_answer text,
    PRIMARY KEY ("index", form_product_profile_answer_key),
    FOREIGN KEY (form_product_profile_answer_key) REFERENCES form_product_profile_answer("key")
);

CREATE TABLE form_product_profile_answer (
    "key" text,
    form_key text,
    PRIMARY KEY ("key"),
    FOREIGN KEY (form_key) REFERENCES vendor_onboarding_form("key")
);

CREATE TABLE vendor_profile_expected_answer (
    "index" text,
    vendor_profile_answer_key text,
    vendor_profile_key text,
    expected_answer text,
    PRIMARY KEY ("index", vendor_profile_answer_key, vendor_profile_key),
    FOREIGN KEY (vendor_profile_answer_key) REFERENCES vendor_profile_answer("key"),
    FOREIGN KEY (vendor_profile_key) REFERENCES vendor_profile_answer(vendor_profile_key)
);

CREATE TABLE vendor_profile_answer (
    "key" text,
    vendor_profile_key text,
    PRIMARY KEY ("key", vendor_profile_key),
    FOREIGN KEY (vendor_profile_key) REFERENCES vendor_profile("key")
);

CREATE TABLE product_profile_expected_answer (
    "index" text,
    product_profile_answer_key text,
    vendor_profile_key text,
    expected_answer text,
    PRIMARY KEY ("index", product_profile_answer_key, vendor_profile_key),
    FOREIGN KEY (product_profile_answer_key) REFERENCES product_profile_answer("key"),
    FOREIGN KEY (vendor_profile_key) REFERENCES product_profile_answer(vendor_profile_key)
);

CREATE TABLE product_profile_answer (
    "key" text,
    vendor_profile_key text,
    PRIMARY KEY ("key", vendor_profile_key),
    FOREIGN KEY (vendor_profile_key) REFERENCES vendor_profile("key")
);

CREATE TABLE contract_product (
    contract_key text,
    "key" text,
    "status" text,
    PRIMARY KEY (contract_key, "key"),
    FOREIGN KEY (contract_key) REFERENCES contract("key"),
    FOREIGN KEY ("key") REFERENCES vendor_profile_product("key")
);

CREATE TABLE contract (
    "key" text,
    vendor_key text,
    auto_renewal_notice_days text,
    effective_date text,
    expiration_date text,
    is_perpetual text,
    "name" text,
    required_notification_dead_line text,
    "status" text,
    PRIMARY KEY ("key"),
    FOREIGN KEY (vendor_key) REFERENCES vendor_profile("key")
);

CREATE TABLE vendor_onboarding_form_category (
    "index" text,
    vendor_onboarding_form_key text,
    category text,
    PRIMARY KEY ("index", vendor_onboarding_form_key),
    FOREIGN KEY (vendor_onboarding_form_key) REFERENCES vendor_onboarding_form("key")
);

CREATE TABLE vendor_onboarding_form (
    "key" text,
    last_edited_by_key text,
    is_active text,
    last_edited_by text,
    last_edited_date text,
    "name" text,
    "type" text,
    PRIMARY KEY ("key"),
    FOREIGN KEY (last_edited_by_key) REFERENCES users("key")
);

CREATE TABLE vendor_onboarding_request_reason (
    id text,
    is_custom_reason text,
    reason text,
    PRIMARY KEY (id)
);

CREATE TABLE form_vendor_information_child_question (
    "key" text,
    form_key text,
    form_vendor_information_question_key text,
    parent_selection_name text,
    question text,
    responsibility text,
    "type" text,
    PRIMARY KEY ("key", form_key, form_vendor_information_question_key),
    FOREIGN KEY (form_key) REFERENCES form_vendor_information_question(form_key),
    FOREIGN KEY (form_vendor_information_question_key) REFERENCES form_vendor_information_question("key")
);

CREATE TABLE form_vendor_information_question (
    "key" text,
    form_key text,
    data_field_key text,
    question text,
    responsibility text,
    "type" text,
    PRIMARY KEY ("key", form_key),
    FOREIGN KEY (form_key) REFERENCES form("key")
);

CREATE TABLE form_product_information_child_question (
    "key" text,
    form_key text,
    form_product_information_question_key text,
    parent_selection_name text,
    question text,
    responsibility text,
    "type" text,
    PRIMARY KEY ("key", form_key, form_product_information_question_key),
    FOREIGN KEY (form_key) REFERENCES form_product_information_question(form_key),
    FOREIGN KEY (form_product_information_question_key) REFERENCES form_product_information_question("key")
);

CREATE TABLE form_product_information_question (
    "key" text,
    form_key text,
    data_field_key text,
    question text,
    responsibility text,
    "type" text,
    PRIMARY KEY ("key", form_key),
    FOREIGN KEY (form_key) REFERENCES form("key")
);

CREATE TABLE form_pricing_question (
    "key" text,
    form_key text,
    question text,
    responsibility text,
    PRIMARY KEY ("key", form_key),
    FOREIGN KEY (form_key) REFERENCES form("key")
);

CREATE TABLE form_criticality_question (
    "key" text,
    form_key text,
    question text,
    responsibility text,
    PRIMARY KEY ("key", form_key),
    FOREIGN KEY (form_key) REFERENCES form("key")
);

CREATE TABLE form_risk_assessment_question (
    "key" text,
    form_key text,
    is_prevailing text,
    question text,
    responsibility text,
    PRIMARY KEY ("key", form_key),
    FOREIGN KEY (form_key) REFERENCES form("key")
);

CREATE TABLE form (
    "key" text,
    PRIMARY KEY ("key"),
    FOREIGN KEY ("key") REFERENCES vendor_onboarding_form("key")
);

CREATE TABLE client_info_oversight_requirement (
    "key" text,
    applies_to_all_products text,
    label text,
    PRIMARY KEY ("key"),
    FOREIGN KEY ("key") REFERENCES oversight_requirement("key")
);

CREATE TABLE user_phone_number (
    "index" text,
    user_key text,
    area_code text,
    extension text,
    prefix text,
    suffix text,
    "type" text,
    PRIMARY KEY ("index", user_key),
    FOREIGN KEY (user_key) REFERENCES users("key")
);

CREATE TABLE user_role (
    "key" text,
    user_key text,
    is_custom text,
    "name" text,
    PRIMARY KEY ("key", user_key),
    FOREIGN KEY (user_key) REFERENCES users("key")
);

CREATE TABLE users (
    "key" text,
    created_by_user_key_or_description text,
    created_date text,
    email_address text,
    first_name text,
    full_name text,
    is_active text,
    is_enrolled text,
    last_name text,
    PRIMARY KEY ("key")
);

CREATE TABLE client_info_risk_level (
    "key" text,
    "name" text,
    score text,
    PRIMARY KEY ("key")
);

CREATE TABLE client_info_value_list (
    _fivetran_id text,
    data_key_field text,
    data_key_field_label text,
    "key" text,
    label text,
    sort_index text,
    PRIMARY KEY (_fivetran_id)
);
