CREATE TABLE award (
    id text,
    project_id text,
    cons text,
    creator_id text,
    creator_type text,
    external_id text,
    pros text,
    "state" text,
    title text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE attachment (
    id text,
    download_url text,
    download_url_expires_at text,
    external_id text,
    file_size text,
    title text,
    uploaded_at text,
    uploaded_by text,
    PRIMARY KEY (id)
);

CREATE TABLE payment_currency (
    id text,
    alpha text,
    external_id text,
    numeric text,
    PRIMARY KEY (id)
);

CREATE TABLE contract_custom_field (
    "index" text,
    contract_id text,
    "name" text,
    "value" text,
    PRIMARY KEY ("index", contract_id),
    FOREIGN KEY (contract_id) REFERENCES contract(id)
);

CREATE TABLE contract_relationship_attachment_data (
    id text,
    contract_id text,
    PRIMARY KEY (id, contract_id),
    FOREIGN KEY (contract_id) REFERENCES contract(id)
);

CREATE TABLE contract (
    id text,
    contract_type_id text,
    supplier_company_id text,
    actual_end_date text,
    actual_spend_amount text,
    actual_start_date text,
    approval_rounds text,
    approved_at text,
    auto_renewal text,
    description text,
    external_id text,
    first_sent_for_approval_at text,
    invoiced_po_amount text,
    marked_as_needs_attention_at text,
    needs_attention text,
    needs_attention_note text,
    needs_attention_reason text,
    non_po_invoiced_amount text,
    number text,
    po_amount text,
    relationships_creator_data_id text,
    relationships_creator_data_type text,
    relationships_owner_data_id text,
    relationships_owner_data_type text,
    renew_number_of_times text,
    renewal_term_unit text,
    renewal_term_value text,
    renewal_termination_notice_date text,
    renewal_termination_notice_unit text,
    renewal_termination_notice_value text,
    renewal_termination_reminder_date text,
    renewal_termination_reminder_unit text,
    renewal_termination_reminder_value text,
    request_opened_at text,
    request_submitted_at text,
    sent_for_approval_at text,
    spend_category_id text,
    "state" text,
    state_label text,
    terminated_note text,
    terminated_reason text,
    title text,
    total_invoiced_amount text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (contract_type_id) REFERENCES contract_type(id),
    FOREIGN KEY (supplier_company_id) REFERENCES supplier_company(id)
);

CREATE TABLE event_custom_field (
    "index" text,
    event_id text,
    "name" text,
    "value" text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE event_relationship_attachment (
    event_id text,
    id text,
    PRIMARY KEY (event_id, id),
    FOREIGN KEY (event_id) REFERENCES event(id),
    FOREIGN KEY (id) REFERENCES attachment(id)
);

CREATE TABLE event (
    id text,
    bid_submission_deadline text,
    duplication_state text,
    event_type text,
    external_id text,
    instant_notifications text,
    late_bids text,
    relationships_commodity_codes_data jsonb,
    relationships_event_template_data jsonb,
    relationships_project_data jsonb,
    request_type text,
    revise_bids text,
    spend_amount text,
    spend_category_id text,
    "state" text,
    supplier_question_deadline text,
    supplier_rsvp_deadline text,
    title text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE bid (
    id text,
    event_id text,
    supplier_company_id text,
    intend_to_bid text,
    intend_to_bid_answered_at text,
    resubmitted_at text,
    "status" text,
    submitted_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (event_id) REFERENCES event(id),
    FOREIGN KEY (supplier_company_id) REFERENCES supplier_company(id)
);

CREATE TABLE supplier_company_risk (
    id text,
    color text,
    label text,
    orders text,
    slug text,
    PRIMARY KEY (id)
);

CREATE TABLE field_group (
    id text,
    "name" text,
    "position" text,
    target_object text,
    PRIMARY KEY (id)
);

CREATE TABLE projects_custom_field (
    "index" text,
    project_id text,
    "name" text,
    "value" text,
    PRIMARY KEY ("index", project_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE projects_relationship_attachment (
    id text,
    project_id text,
    PRIMARY KEY (id, project_id),
    FOREIGN KEY (id) REFERENCES attachment(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE project (
    id text,
    project_type_id text,
    actual_end_date text,
    actual_savings_amount text,
    actual_spend_amount text,
    actual_start_date text,
    approval_rounds text,
    approved_at text,
    approved_spend_amount text,
    canceled_note text,
    canceled_reason text,
    description text,
    estimated_savings_amount text,
    estimated_spend_amount text,
    external_id text,
    first_sent_for_approval_at text,
    marked_as_needs_attention_at text,
    needs_attention text,
    needs_attention_note text,
    needs_attention_reason text,
    number text,
    on_hold_note text,
    on_hold_reason text,
    relationships_creator_data_id text,
    relationships_creator_data_type text,
    relationships_owner_data_id text,
    relationships_owner_data_type text,
    relationships_requester_data_id text,
    relationships_requester_data_type text,
    request_opened_at text,
    request_submitted_at text,
    sent_for_approval_at text,
    spend_category_id text,
    "state" text,
    state_label text,
    target_end_date text,
    target_start_date text,
    title text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (project_type_id) REFERENCES project_type(id)
);

CREATE TABLE worksheet_column (
    id text,
    worksheet_id text,
    data_identifier text,
    mapping_key text,
    "name" text,
    PRIMARY KEY (id, worksheet_id),
    FOREIGN KEY (worksheet_id) REFERENCES worksheet(id)
);

CREATE TABLE worksheet (
    id text,
    event_id text,
    budget text,
    notes text,
    title text,
    updated_at text,
    worksheet_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE project_type (
    id text,
    "name" text,
    shortcode text,
    PRIMARY KEY (id)
);

CREATE TABLE bid_line_item (
    _fivetran_id text,
    bid_id text,
    event_id text,
    line_item_id text,
    worksheet_id text,
    id text,
    updated_at text,
    -- attributes_data_* (dynamic column),
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (bid_id) REFERENCES bid(id),
    FOREIGN KEY (event_id) REFERENCES event(id),
    FOREIGN KEY (line_item_id) REFERENCES line_item(id),
    FOREIGN KEY (worksheet_id) REFERENCES worksheet(id)
);

CREATE TABLE spend_category_usage (
    usage text,
    spend_category_id text,
    PRIMARY KEY (usage, spend_category_id),
    FOREIGN KEY (spend_category_id) REFERENCES spend_category(id)
);

CREATE TABLE spend_category (
    id text,
    external_id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE event_template (
    id text,
    event_type text,
    title text,
    PRIMARY KEY (id)
);

CREATE TABLE field (
    id text,
    field_group_id text,
    data_type text,
    "name" text,
    "position" text,
    required text,
    scout_data_type text,
    target_object text,
    PRIMARY KEY (id),
    FOREIGN KEY (field_group_id) REFERENCES field_group(id)
);

CREATE TABLE payment_term (
    id text,
    external_id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE supplier_company_segmentation_status (
    id text,
    icon text,
    label text,
    orders text,
    slug text,
    PRIMARY KEY (id)
);

CREATE TABLE supplier_contact_type_data (
    id text,
    supplier_contact_id text,
    PRIMARY KEY (id, supplier_contact_id),
    FOREIGN KEY (supplier_contact_id) REFERENCES supplier_contact(id)
);

CREATE TABLE supplier_contact_phone_data (
    id text,
    supplier_contact_id text,
    PRIMARY KEY (id, supplier_contact_id),
    FOREIGN KEY (supplier_contact_id) REFERENCES supplier_contact(id)
);

CREATE TABLE supplier_contact (
    id text,
    supplier_company_id text,
    email text,
    external_id text,
    first_name text,
    is_suggested text,
    job_title text,
    last_name text,
    "name" text,
    notes text,
    phone_number text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (supplier_company_id) REFERENCES supplier_company(id)
);

CREATE TABLE contract_type (
    id text,
    external_id text,
    "name" text,
    shortcode text,
    PRIMARY KEY (id)
);

CREATE TABLE payment_type (
    id text,
    external_id text,
    "name" text,
    payment_method text,
    PRIMARY KEY (id)
);

CREATE TABLE award_line_item (
    id text,
    award_id text,
    supplier_company_id text,
    worksheet_id text,
    allocated_quantity text,
    is_quoted text,
    line_item_type text,
    net_savings text,
    net_savings_percentage text,
    price text,
    sought_quantity text,
    total_spend text,
    -- attributes_data_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (award_id) REFERENCES award(id),
    FOREIGN KEY (supplier_company_id) REFERENCES supplier_company(id),
    FOREIGN KEY (worksheet_id) REFERENCES worksheet(id)
);

CREATE TABLE line_item (
    id text,
    event_id text,
    worksheet_id text,
    -- attributes_data_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (event_id) REFERENCES event(id),
    FOREIGN KEY (worksheet_id) REFERENCES worksheet(id)
);

CREATE TABLE supplier_category (
    id text,
    external_id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE supplier_company_tag (
    tags text,
    supplier_company_id text,
    PRIMARY KEY (tags, supplier_company_id),
    FOREIGN KEY (supplier_company_id) REFERENCES supplier_company(id)
);

CREATE TABLE supplier_company_custom_field (
    "index" text,
    supplier_company_id text,
    "name" text,
    "value" text,
    PRIMARY KEY ("index", supplier_company_id),
    FOREIGN KEY (supplier_company_id) REFERENCES supplier_company(id)
);

CREATE TABLE supplier_company_attachment_data (
    id text,
    supplier_company_id text,
    attachment_id text,
    PRIMARY KEY (id, supplier_company_id),
    FOREIGN KEY (supplier_company_id) REFERENCES supplier_company(id),
    FOREIGN KEY (attachment_id) REFERENCES attachment(id)
);

CREATE TABLE supplier_company_supplier_group (
    id text,
    supplier_company_id text,
    supplier_group_id text,
    PRIMARY KEY (id, supplier_company_id),
    FOREIGN KEY (supplier_company_id) REFERENCES supplier_company(id),
    FOREIGN KEY (supplier_group_id) REFERENCES supplier_group(id)
);

CREATE TABLE supplier_company_supplier_classification_value (
    id text,
    supplier_company_id text,
    PRIMARY KEY (id, supplier_company_id),
    FOREIGN KEY (supplier_company_id) REFERENCES supplier_company(id)
);

CREATE TABLE supplier_company (
    id text,
    payment_currency_id text,
    payment_term_id text,
    payment_type_id text,
    supplier_category_id text,
    supplier_classification_values_id text,
    accept_all_currencies text,
    description text,
    external_id text,
    is_suggested text,
    "name" text,
    public text,
    risk text,
    segmentation text,
    segmentation_notes text,
    segmentation_status text,
    updated_at text,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (payment_currency_id) REFERENCES payment_currency(id),
    FOREIGN KEY (payment_term_id) REFERENCES payment_term(id),
    FOREIGN KEY (payment_type_id) REFERENCES payment_type(id),
    FOREIGN KEY (supplier_category_id) REFERENCES supplier_category(id),
    FOREIGN KEY (supplier_classification_values_id) REFERENCES supplier_classification(id)
);

CREATE TABLE supplier_company_segmentation (
    id text,
    label text,
    orders text,
    slug text,
    PRIMARY KEY (id)
);

CREATE TABLE supplier_group (
    id text,
    external_id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE field_option (
    id text,
    field_id text,
    label text,
    "position" text,
    PRIMARY KEY (id),
    FOREIGN KEY (field_id) REFERENCES field(id)
);

CREATE TABLE supplier_classification_field (
    id text,
    supplier_classification_id text,
    PRIMARY KEY (id, supplier_classification_id),
    FOREIGN KEY (supplier_classification_id) REFERENCES supplier_classification(id)
);

CREATE TABLE supplier_classification (
    id text,
    active text,
    codename text,
    country_alpha_2 text,
    external_id text,
    "name" text,
    orders text,
    request_additional_information text,
    PRIMARY KEY (id)
);
