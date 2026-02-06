CREATE TABLE expense_trip (
    id bigint,
    created_at timestamp,
    custom_fields jsonb,
    expense_trip_mileage_id bigint,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE online_store (
    id bigint,
    created_by_id bigint,
    updated_by_id bigint,
    created_at timestamp,
    custom_fields jsonb,
    login text,
    password text,
    updated_at timestamp,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_id) REFERENCES "user"(id),
    FOREIGN KEY (updated_by_id) REFERENCES "user"(id)
);

CREATE TABLE supplier_information_address (
    id bigint,
    account_type_item text,
    active boolean,
    address_name text,
    bank_account_number text,
    bank_address text,
    bank_city text,
    bank_code text,
    bank_country_id bigint,
    bank_postal_code text,
    bank_routing_number text,
    bank_state_region text,
    bic text,
    bic_routing_code text,
    bsb_number text,
    city text,
    country_id bigint,
    created_at text,
    created_by_id bigint,
    csp_rta_id bigint,
    custom_field_1 jsonb,
    custom_field_10 jsonb,
    custom_field_11 jsonb,
    custom_field_12 jsonb,
    custom_field_13 jsonb,
    custom_field_14 jsonb,
    custom_field_15 jsonb,
    custom_field_16 jsonb,
    custom_field_17 jsonb,
    custom_field_18 jsonb,
    custom_field_19 jsonb,
    custom_field_2 jsonb,
    custom_field_20 jsonb,
    custom_field_3 jsonb,
    custom_field_4 jsonb,
    custom_field_5 jsonb,
    custom_field_6 jsonb,
    custom_field_7 jsonb,
    custom_field_8 jsonb,
    custom_field_9 jsonb,
    email text,
    iban_number text,
    ifsc text,
    intermediary_bank_name text,
    international_bank_account_number text,
    kind text,
    location_code text,
    name_on_bank_account text,
    payment_method_item text,
    po_box text,
    po_box_postal_code text,
    postal_code text,
    sort_code text,
    state_iso_code text,
    state_region text,
    street_address text,
    street_address_2 text,
    street_address_3 text,
    street_address_4 text,
    supplier_information_id bigint,
    swift_code text,
    transit_number_and_institution_number text,
    updated_at timestamp,
    updated_by_id bigint,
    virtual_card_email text,
    wire_routing_number text,
    -- bank_fax_phone_* (dynamic column),
    -- bank_work_phone_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE payment_business_group_mapping (
    business_group_id bigint,
    payment_id bigint,
    PRIMARY KEY (business_group_id, payment_id),
    FOREIGN KEY (business_group_id) REFERENCES business_group(id),
    FOREIGN KEY (payment_id) REFERENCES payment(id)
);

CREATE TABLE remit_to_address (
    id bigint,
    active boolean,
    city text,
    country_id bigint,
    created_at timestamp,
    created_by_id bigint,
    custom_fields jsonb,
    external_src_name text,
    external_src_ref text,
    local_tax_number text,
    "name" text,
    postal_code text,
    remit_to_code text,
    "state" text,
    street_1 text,
    street_2 text,
    updated_at timestamp,
    updated_by_id bigint,
    vat_country_id bigint,
    vat_number text,
    PRIMARY KEY (id)
);

CREATE TABLE contact (
    id bigint,
    created_at timestamp,
    created_by_id bigint,
    custom_fields jsonb,
    email text,
    name_additional text,
    name_family text,
    name_fullname text,
    name_given text,
    name_prefix text,
    name_suffix text,
    notes text,
    photo text,
    updated_at timestamp,
    updated_by_id bigint,
    PRIMARY KEY (id)
);

CREATE TABLE shipping_term_business_group_mapping (
    business_group_id bigint,
    shipping_term_id bigint,
    PRIMARY KEY (business_group_id, shipping_term_id),
    FOREIGN KEY (business_group_id) REFERENCES business_group(id),
    FOREIGN KEY (shipping_term_id) REFERENCES shipping_term(id)
);

CREATE TABLE cp_account_type_mapping (
    account_id bigint,
    account_type_id bigint,
    cp_payment_id bigint,
    PRIMARY KEY (account_id, account_type_id, cp_payment_id),
    FOREIGN KEY (account_id) REFERENCES cp_account(id),
    FOREIGN KEY (account_type_id) REFERENCES account_type(id),
    FOREIGN KEY (cp_payment_id) REFERENCES cp_payment(id)
);

CREATE TABLE address_business_group_relation (
    address_id bigint,
    business_group_id bigint,
    PRIMARY KEY (address_id, business_group_id),
    FOREIGN KEY (address_id) REFERENCES address(id),
    FOREIGN KEY (business_group_id) REFERENCES business_group(id)
);

CREATE TABLE period (
    id bigint,
    account_type_id bigint,
    created_at timestamp,
    created_by_id bigint,
    custom_fields jsonb,
    end_date timestamp,
    is_open boolean,
    "name" text,
    segment_1 text,
    segment_10 text,
    segment_11 text,
    segment_12 text,
    segment_13 text,
    segment_14 text,
    segment_15 text,
    segment_16 text,
    segment_17 text,
    segment_18 text,
    segment_19 text,
    segment_2 text,
    segment_20 text,
    segment_3 text,
    segment_4 text,
    segment_5 text,
    segment_6 text,
    segment_7 text,
    segment_8 text,
    segment_9 text,
    start_date timestamp,
    updated_at timestamp,
    updated_by_id bigint,
    PRIMARY KEY (id)
);

CREATE TABLE approval (
    id bigint,
    easy_form_id bigint,
    approvable_id bigint,
    approvable_type text,
    approval_chain_id bigint,
    approval_date timestamp,
    approved_by_id bigint,
    created_at timestamp,
    created_by_id bigint,
    custom_fields jsonb,
    delegate_id bigint,
    note text,
    parent_approval_id bigint,
    "position" bigint,
    "status" text,
    "type" text,
    updated_at timestamp,
    updated_by_id bigint,
    PRIMARY KEY (id),
    FOREIGN KEY (easy_form_id) REFERENCES easy_form_data(id)
);

CREATE TABLE expense_per_diem_config (
    id bigint,
    country_id bigint,
    created_at timestamp,
    custom_fields jsonb,
    deductions_section_label text,
    policy_description text,
    policy_title text,
    rule_set_type text,
    scope text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE expense_violation (
    id bigint,
    expense_report_id bigint,
    created_at timestamp,
    created_by_id bigint,
    custom_fields jsonb,
    limit_exceeded double precision,
    receipt_missing boolean,
    updated_at timestamp,
    updated_by_id bigint,
    PRIMARY KEY (id),
    FOREIGN KEY (expense_report_id) REFERENCES expense_report(id)
);

CREATE TABLE expense_artifact (
    id bigint,
    expense_line_id bigint,
    created_at timestamp,
    created_by_id bigint,
    custom_fields jsonb,
    external_src_ref text,
    image_content_type text,
    image_file_name text,
    image_file_size text,
    ocr_status text,
    source_content_type text,
    source_file_name text,
    source_file_size text,
    updated_at timestamp,
    updated_by_id bigint,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (expense_line_id) REFERENCES expense_line(id)
);

CREATE TABLE order_pad_business_group_mapping (
    business_group_id bigint,
    order_pad_id bigint,
    PRIMARY KEY (business_group_id, order_pad_id),
    FOREIGN KEY (business_group_id) REFERENCES business_group(id),
    FOREIGN KEY (order_pad_id) REFERENCES order_pad(id)
);

CREATE TABLE payable_allocation (
    id bigint,
    payable_from_currency_id bigint,
    payable_to_currency_id bigint,
    bypass_strict_validations boolean,
    exported boolean,
    last_exported_at timestamp,
    payable_from_amount double precision,
    payable_from_id integer,
    payable_from_type text,
    payable_to_amount double precision,
    payable_to_id bigint,
    payable_to_type text,
    payment_reference_id bigint,
    payment_reference_type text,
    reason_code text,
    "source" text,
    source_transaction_from_id text,
    source_transaction_from_reference text,
    source_transaction_from_type text,
    source_transaction_to_id text,
    source_transaction_to_reference text,
    source_transaction_to_type text,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (payable_from_currency_id) REFERENCES currency(id),
    FOREIGN KEY (payable_to_currency_id) REFERENCES currency(id)
);

CREATE TABLE quote_request_line_attribute (
    id bigint,
    completed boolean,
    created_at timestamp,
    created_by_id bigint,
    custom_fields jsonb,
    end_date timestamp,
    manager_id bigint,
    start_date timestamp,
    "type" text,
    updated_at timestamp,
    updated_by_id bigint,
    work_confirmer_email text,
    PRIMARY KEY (id)
);

CREATE TABLE requisition_line (
    id bigint,
    requisition_header_id bigint,
    order_line_id bigint,
    account_id bigint,
    commodity_id bigint,
    contract_id bigint,
    created_at timestamp,
    created_by_id bigint,
    currency_id bigint,
    custom_fields jsonb,
    description text,
    end_date text,
    item_id bigint,
    line_num bigint,
    line_type text,
    need_by_date timestamp,
    order_pad_line_id bigint,
    payment_term_id bigint,
    period_id bigint,
    punchout_site_id bigint,
    quantity double precision,
    receipt_required boolean,
    shipping_term_id bigint,
    "source" text,
    source_part_num text,
    source_type text,
    start_date text,
    "status" text,
    sub_line_num bigint,
    supp_aux_part_num text,
    supplier_id bigint,
    supplier_site_id bigint,
    total double precision,
    transmission_emails text,
    transmission_method_override text,
    unit_price double precision,
    unspsc_code text,
    uom_id bigint,
    updated_at timestamp,
    updated_by_id bigint,
    PRIMARY KEY (id, requisition_header_id),
    FOREIGN KEY (requisition_header_id) REFERENCES requisition_header(id),
    FOREIGN KEY (order_line_id) REFERENCES order_line(id)
);

CREATE TABLE contract_term (
    id bigint,
    contract_id bigint,
    contract_term_type text,
    created_at timestamp,
    created_by_id bigint,
    custom_fields jsonb,
    "name" text,
    tier_10_disc_pct double precision,
    tier_10_upper_bound double precision,
    tier_11_disc_pct double precision,
    tier_11_upper_bound double precision,
    tier_12_disc_pct double precision,
    tier_12_upper_bound double precision,
    tier_13_disc_pct double precision,
    tier_13_upper_bound double precision,
    tier_14_disc_pct double precision,
    tier_14_upper_bound double precision,
    tier_15_disc_pct double precision,
    tier_15_upper_bound double precision,
    tier_16_disc_pct double precision,
    tier_16_upper_bound double precision,
    tier_17_disc_pct double precision,
    tier_17_upper_bound double precision,
    tier_18_disc_pct double precision,
    tier_18_upper_bound double precision,
    tier_19_disc_pct double precision,
    tier_19_upper_bound double precision,
    tier_1_disc_pct double precision,
    tier_1_upper_bound double precision,
    tier_20_disc_pct double precision,
    tier_20_upper_bound double precision,
    tier_2_disc_pct double precision,
    tier_2_upper_bound double precision,
    tier_3_disc_pct double precision,
    tier_3_upper_bound double precision,
    tier_4_disc_pct double precision,
    tier_4_upper_bound double precision,
    tier_5_disc_pct double precision,
    tier_5_upper_bound double precision,
    tier_6_disc_pct double precision,
    tier_6_upper_bound double precision,
    tier_7_disc_pct double precision,
    tier_7_upper_bound double precision,
    tier_8_disc_pct double precision,
    tier_8_upper_bound double precision,
    tier_9_disc_pct double precision,
    tier_9_upper_bound double precision,
    "type" text,
    updated_at timestamp,
    updated_by_id bigint,
    use_pct_discounts boolean,
    PRIMARY KEY (id),
    FOREIGN KEY (contract_id) REFERENCES contract(id)
);

CREATE TABLE project (
    id bigint,
    active boolean,
    additional_negotiated_savings text,
    additional_planned_savings text,
    additional_realized_savings text,
    allow_users_to_view_member text,
    commodity_id bigint,
    completion_percentage bigint,
    copy_project_id bigint,
    created_at timestamp,
    created_by_id bigint,
    custom_fields jsonb,
    description text,
    display_date_range_warning boolean,
    enabled_tabs jsonb,
    end_date timestamp,
    external_reference_number text,
    mention_name text,
    "name" text,
    "open" boolean,
    project_id bigint,
    show_contracts_rollup_fields boolean,
    show_sourcing_rollup_fields boolean,
    show_suppliers_rollup_fields boolean,
    start_date timestamp,
    "status" text,
    template_group jsonb,
    updated_at timestamp,
    updated_by_id bigint,
    PRIMARY KEY (id)
);

CREATE TABLE expense_attendee_type (
    id bigint,
    expense_category_id bigint,
    attendee_src text,
    created_at timestamp,
    custom_fields jsonb,
    "name" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (expense_category_id) REFERENCES expense_category(id)
);

CREATE TABLE approval_limit (
    id bigint,
    amount double precision,
    created_at timestamp,
    created_by_id bigint,
    currency_id bigint,
    custom_fields jsonb,
    "name" text,
    subject text,
    updated_at timestamp,
    updated_by_id bigint,
    PRIMARY KEY (id)
);

CREATE TABLE department (
    id bigint,
    active text,
    created_at timestamp,
    created_by_id bigint,
    custom_fields jsonb,
    "name" text,
    updated_at timestamp,
    updated_by_id bigint,
    PRIMARY KEY (id)
);

CREATE TABLE account_type (
    id bigint,
    active boolean,
    created_at timestamp,
    created_by_id bigint,
    currency_id bigint,
    custom_fields jsonb,
    legal_entity_name text,
    "name" text,
    primary_address_id bigint,
    primary_contact_id bigint,
    updated_at timestamp,
    updated_by_id bigint,
    PRIMARY KEY (id)
);

CREATE TABLE requisition_header (
    id bigint,
    receiving_warehouse_id bigint,
    approver_id bigint,
    buyer_note text,
    created_at timestamp,
    created_by_id bigint,
    currency_id bigint,
    current_approval_id bigint,
    custom_fields jsonb,
    department_id bigint,
    exported boolean,
    justification text,
    line_count bigint,
    mobile_total double precision,
    need_by_date timestamp,
    pcard_id bigint,
    price_hidden boolean,
    reject_reason_comment text,
    req_title text,
    requested_by_id bigint,
    ship_to_address_id bigint,
    ship_to_attention text,
    "status" text,
    submitted_at text,
    total double precision,
    updated_at timestamp,
    updated_by_id bigint,
    PRIMARY KEY (id),
    FOREIGN KEY (receiving_warehouse_id) REFERENCES warehouse(id)
);

CREATE TABLE invoice_charge_allocation (
    id bigint,
    invoice_charge_id bigint,
    account_id bigint,
    amount double precision,
    billing_note text,
    created_at timestamp,
    created_by_id bigint,
    custom_fields jsonb,
    pct double precision,
    updated_at timestamp,
    updated_by_id bigint,
    PRIMARY KEY (id),
    FOREIGN KEY (invoice_charge_id) REFERENCES invoice_charge(id)
);

CREATE TABLE payment_term (
    id bigint,
    active boolean,
    code text,
    created_at timestamp,
    created_by_id bigint,
    custom_fields jsonb,
    days_for_discount_payment bigint,
    days_for_net_payment bigint,
    description text,
    discount_rate double precision,
    updated_at timestamp,
    updated_by_id bigint,
    PRIMARY KEY (id)
);

CREATE TABLE virtual_card_partner_account_type_mapping (
    account_type_id bigint,
    virtual_card_partner_id bigint,
    PRIMARY KEY (account_type_id, virtual_card_partner_id),
    FOREIGN KEY (account_type_id) REFERENCES account_type(id),
    FOREIGN KEY (virtual_card_partner_id) REFERENCES virtual_card_partner(id)
);

CREATE TABLE invoice_reconciliation_line (
    id bigint,
    invoice_header_id bigint,
    amount double precision,
    amount_paid double precision,
    category text,
    created_at timestamp,
    created_by_id bigint,
    custom_fields jsonb,
    notes text,
    payable_id bigint,
    payable_type text,
    payment_date timestamp,
    updated_at timestamp,
    updated_by_id bigint,
    PRIMARY KEY (id),
    FOREIGN KEY (invoice_header_id) REFERENCES invoice_header(id)
);

CREATE TABLE supplier_restricted_account_type_mapping (
    restricted_account_type_id bigint,
    supplier_id bigint,
    PRIMARY KEY (restricted_account_type_id, supplier_id),
    FOREIGN KEY (restricted_account_type_id) REFERENCES account_type(id),
    FOREIGN KEY (supplier_id) REFERENCES supplier(id)
);

CREATE TABLE currency (
    id bigint,
    code text,
    created_by_id bigint,
    custom_fields jsonb,
    decimals bigint,
    enabled boolean,
    "name" text,
    symbol text,
    updated_by_id bigint,
    PRIMARY KEY (id)
);

CREATE TABLE comment_attachment_mapping (
    attachment_id bigint,
    comment_id bigint,
    PRIMARY KEY (attachment_id, comment_id),
    FOREIGN KEY (attachment_id) REFERENCES attachment(id),
    FOREIGN KEY (comment_id) REFERENCES "comment"(id)
);

CREATE TABLE expense_line (
    id bigint,
    expense_line_mileage_id bigint,
    expense_report_id bigint,
    order_line_id bigint,
    receipt_total_currency_id bigint,
    account_id bigint,
    accounting_total double precision,
    accounting_total_currency_id bigint,
    amount double precision,
    approved_amount double precision,
    created_at timestamp,
    created_by_id bigint,
    currency_id bigint,
    custom_field_1 jsonb,
    custom_field_10 jsonb,
    custom_field_11 jsonb,
    custom_field_12 jsonb,
    custom_field_13 jsonb,
    custom_field_14 jsonb,
    custom_field_15 jsonb,
    custom_field_16 jsonb,
    custom_field_17 jsonb,
    custom_field_18 jsonb,
    custom_field_19 jsonb,
    custom_field_2 jsonb,
    custom_field_3 jsonb,
    custom_field_4 jsonb,
    custom_field_5 jsonb,
    custom_field_6 jsonb,
    custom_field_7 jsonb,
    custom_field_8 jsonb,
    custom_field_9 jsonb,
    custom_fields jsonb,
    description text,
    divisor double precision,
    employee_reimbursable boolean,
    end_date timestamp,
    exchange_rate double precision,
    expense_category_custom_field_1 text,
    expense_category_custom_field_10 text,
    expense_category_custom_field_2 text,
    expense_category_custom_field_3 text,
    expense_category_custom_field_4 text,
    expense_category_custom_field_5 text,
    expense_category_custom_field_6 text,
    expense_category_custom_field_7 text,
    expense_category_custom_field_8 text,
    expense_category_custom_field_9 text,
    expense_category_id bigint,
    expense_date timestamp,
    expense_line_imported_data_id bigint,
    expense_line_per_diem_id bigint,
    expense_line_preapproval_id bigint,
    expense_trip_id bigint,
    external_src_data text,
    external_src_name text,
    external_src_ref text,
    foreign_currency_amount double precision,
    foreign_currency_id bigint,
    frugality text,
    integration_id bigint,
    line_number bigint,
    merchant text,
    over_limit boolean,
    parent_expense_line_id bigint,
    parent_external_src_data text,
    parent_external_src_name text,
    parent_external_src_ref text,
    period_id bigint,
    reason text,
    receipt_total_amount double precision,
    reporting_total double precision,
    requires_receipt boolean,
    start_date timestamp,
    "status" text,
    suggested_exchange_rate_id bigint,
    "type" text,
    updated_at timestamp,
    updated_by_id bigint,
    PRIMARY KEY (id),
    FOREIGN KEY (expense_line_mileage_id) REFERENCES expense_line_mileage(id),
    FOREIGN KEY (expense_report_id) REFERENCES expense_report(id),
    FOREIGN KEY (order_line_id) REFERENCES order_line(id),
    FOREIGN KEY (receipt_total_currency_id) REFERENCES currency(id)
);

CREATE TABLE project_business_group_mapping (
    business_group_id bigint,
    project_id bigint,
    PRIMARY KEY (business_group_id, project_id),
    FOREIGN KEY (business_group_id) REFERENCES business_group(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE lookup (
    id bigint,
    active boolean,
    created_at timestamp,
    created_by_id bigint,
    custom_fields jsonb,
    description text,
    fixed_depth boolean,
    level_10_name text,
    level_1_name text,
    level_2_name text,
    level_3_name text,
    level_4_name text,
    level_5_name text,
    level_6_name text,
    level_7_name text,
    level_8_name text,
    level_9_name text,
    "name" text,
    updated_by_id bigint,
    PRIMARY KEY (id)
);

CREATE TABLE expense_report (
    id bigint,
    audit_score bigint,
    auditor_note text,
    created_at timestamp,
    created_by_id bigint,
    currency_id bigint,
    custom_fields jsonb,
    expensed_by_id bigint,
    exported boolean,
    external_src_name text,
    external_src_ref text,
    last_exported_at text,
    paid boolean,
    past_due boolean,
    payment_channel text,
    payment_id bigint,
    reimbursable_total_amount double precision,
    reimbursable_total_currency_id bigint,
    reject_reason text,
    report_due_date text,
    "status" text,
    submitted_at timestamp,
    submitted_by_id bigint,
    title text,
    total double precision,
    updated_at timestamp,
    updated_by_id bigint,
    PRIMARY KEY (id)
);

CREATE TABLE account_group (
    id bigint,
    account_type_id bigint,
    created_at timestamp,
    created_by_id bigint,
    custom_fields jsonb,
    "name" text,
    segment_10_col text,
    segment_10_op text,
    segment_10_val text,
    segment_11_col text,
    segment_11_op text,
    segment_11_val text,
    segment_12_col text,
    segment_12_op text,
    segment_12_val text,
    segment_13_col text,
    segment_13_op text,
    segment_13_val text,
    segment_14_col text,
    segment_14_op text,
    segment_14_val text,
    segment_15_col text,
    segment_15_op text,
    segment_15_val text,
    segment_16_col text,
    segment_16_op text,
    segment_16_val text,
    segment_17_col text,
    segment_17_op text,
    segment_17_val text,
    segment_18_col text,
    segment_18_op text,
    segment_18_val text,
    segment_19_col text,
    segment_19_op text,
    segment_19_val text,
    segment_1_col text,
    segment_1_op text,
    segment_1_val text,
    segment_20_col text,
    segment_20_op text,
    segment_20_val text,
    segment_2_col text,
    segment_2_op text,
    segment_2_val text,
    segment_3_col text,
    segment_3_op text,
    segment_3_val text,
    segment_4_col text,
    segment_4_op text,
    segment_4_val text,
    segment_5_col text,
    segment_5_op text,
    segment_5_val text,
    segment_6_col text,
    segment_6_op text,
    segment_6_val text,
    segment_7_col text,
    segment_7_op text,
    segment_7_val text,
    segment_8_col text,
    segment_8_op text,
    segment_8_val text,
    segment_9_col text,
    segment_9_op text,
    segment_9_val text,
    updated_at timestamp,
    updated_by_id bigint,
    PRIMARY KEY (id)
);

CREATE TABLE invoice_email (
    id bigint,
    created_by_id bigint,
    updated_by_id bigint,
    created_at timestamp,
    custom_fields jsonb,
    email text,
    send_notification boolean,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_id) REFERENCES "user"(id),
    FOREIGN KEY (updated_by_id) REFERENCES "user"(id)
);

CREATE TABLE inspection_code (
    id bigint,
    code text,
    created_at timestamp,
    created_by_id bigint,
    custom_fields jsonb,
    description text,
    updated_at timestamp,
    updated_by_id bigint,
    PRIMARY KEY (id)
);

CREATE TABLE user_group (
    id bigint,
    active boolean,
    can_approve boolean,
    created_at timestamp,
    created_by_id bigint,
    custom_fields jsonb,
    description text,
    mention_name text,
    "name" text,
    "open" boolean,
    owner_id bigint,
    "type" text,
    updated_at timestamp,
    updated_by_id bigint,
    PRIMARY KEY (id)
);

CREATE TABLE tag (
    id bigint,
    invoice_line_id bigint,
    quote_request_id bigint,
    requisition_header_id bigint,
    requisition_line_id bigint,
    created_at timestamp,
    created_by_id bigint,
    custom_fields jsonb,
    "name" text,
    system_tag boolean,
    updated_at timestamp,
    updated_by_id bigint,
    PRIMARY KEY (id),
    FOREIGN KEY (invoice_line_id) REFERENCES invoice_line(id),
    FOREIGN KEY (quote_request_id) REFERENCES quote_request(id),
    FOREIGN KEY (requisition_header_id) REFERENCES requisition_header(id),
    FOREIGN KEY (requisition_line_id) REFERENCES requisition_line(id)
);

CREATE TABLE expense_line_daily_per_diem (
    id bigint,
    expense_line_per_diem_id bigint,
    created_at timestamp,
    custom_fields jsonb,
    expense_per_diem_rate_type_id bigint,
    max_rate text,
    per_diem_rate text,
    rate_applied text,
    rate_destination text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (expense_line_per_diem_id) REFERENCES expense_line_per_diem(id)
);

CREATE TABLE supplier_information_artifact_attachment_mapping (
    attachment_id bigint,
    supplier_information_artifact_id bigint,
    PRIMARY KEY (attachment_id, supplier_information_artifact_id),
    FOREIGN KEY (attachment_id) REFERENCES attachment(id),
    FOREIGN KEY (supplier_information_artifact_id) REFERENCES supplier_information_artifact(id)
);

CREATE TABLE integration_run (
    id bigint,
    created_at timestamp,
    custom_fields jsonb,
    end_time timestamp,
    integration_id bigint,
    records_processed bigint,
    start_time timestamp,
    "status" text,
    total_records bigint,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE invoice_charge (
    id bigint,
    accounting_total_currency_id double precision,
    invoice_header_id bigint,
    account_id bigint,
    billing_note text,
    created_at timestamp,
    created_by_id bigint,
    custom_fields jsonb,
    description text,
    distributed boolean,
    line_num bigint,
    pct double precision,
    period_id bigint,
    total double precision,
    "type" text,
    updated_at timestamp,
    updated_by_id bigint,
    PRIMARY KEY (id),
    FOREIGN KEY (accounting_total_currency_id) REFERENCES currency(id),
    FOREIGN KEY (invoice_header_id) REFERENCES invoice_header(id)
);

CREATE TABLE project_user_mapping (
    project_id bigint,
    user_id bigint,
    PRIMARY KEY (project_id, user_id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE expense_line_imported_data (
    id bigint,
    amount double precision,
    custom_fields jsonb,
    description text,
    PRIMARY KEY (id)
);

CREATE TABLE tagging (
    id bigint,
    created_by_id bigint,
    active boolean,
    created_at timestamp,
    custom_fields jsonb,
    description text,
    tag_id bigint,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_id) REFERENCES "user"(id)
);

CREATE TABLE exchange_rate (
    id bigint,
    created_at timestamp,
    created_by_id bigint,
    custom_fields jsonb,
    from_currency_id bigint,
    rate double precision,
    rate_date timestamp,
    to_currency_id bigint,
    updated_at timestamp,
    updated_by_id bigint,
    PRIMARY KEY (id)
);

CREATE TABLE cp_payment_detail_allocation_mapping (
    payable_allocation_id bigint,
    payment_detail_id bigint,
    payment_id bigint,
    PRIMARY KEY (payable_allocation_id, payment_detail_id, payment_id),
    FOREIGN KEY (payable_allocation_id) REFERENCES payable_allocation(id),
    FOREIGN KEY (payment_detail_id) REFERENCES cp_payment_detail(id),
    FOREIGN KEY (payment_id) REFERENCES cp_payment(id)
);

CREATE TABLE lookup_value (
    id bigint,
    lookup_id bigint,
    account_type_id bigint,
    active boolean,
    created_at timestamp,
    created_by_id bigint,
    custom_fields jsonb,
    depth bigint,
    description text,
    external_ref_code text,
    external_ref_num text,
    is_default boolean,
    "name" text,
    parent_id bigint,
    updated_at timestamp,
    updated_by_id bigint,
    PRIMARY KEY (id),
    FOREIGN KEY (lookup_id) REFERENCES lookup(id)
);

CREATE TABLE requisition_line_asset_tag_mapping (
    asset_tag_id bigint,
    requisition_line_id bigint,
    PRIMARY KEY (asset_tag_id, requisition_line_id),
    FOREIGN KEY (asset_tag_id) REFERENCES asset_tag(id),
    FOREIGN KEY (requisition_line_id) REFERENCES requisition_line(id)
);

CREATE TABLE easy_form_data (
    easy_form_id bigint,
    id bigint,
    created_by_id bigint,
    requested_by_id bigint,
    updated_by_id bigint,
    created_at timestamp,
    "name" text,
    rejected boolean,
    "status" text,
    subject jsonb,
    subject_id bigint,
    submitted_at timestamp,
    updated_at timestamp,
    PRIMARY KEY (easy_form_id, id),
    FOREIGN KEY (created_by_id) REFERENCES "user"(id),
    FOREIGN KEY (requested_by_id) REFERENCES "user"(id),
    FOREIGN KEY (updated_by_id) REFERENCES "user"(id)
);

CREATE TABLE order_line_change_allocation (
    id bigint,
    order_line_change_id bigint,
    period_id bigint,
    account_id bigint,
    amount double precision,
    created_at timestamp,
    created_by_id bigint,
    custom_fields jsonb,
    pct double precision,
    updated_at timestamp,
    updated_by_id bigint,
    PRIMARY KEY (id),
    FOREIGN KEY (order_line_change_id) REFERENCES order_line_change(id),
    FOREIGN KEY (period_id) REFERENCES period(id)
);

CREATE TABLE pcard (
    id bigint,
    active boolean,
    created_at timestamp,
    created_by_id bigint,
    custom_fields jsonb,
    cvv text,
    expiry text,
    "name" text,
    nickname text,
    number text,
    shared boolean,
    updated_at timestamp,
    updated_by_id bigint,
    PRIMARY KEY (id)
);

CREATE TABLE invoice_header_attachment_mapping (
    attachment_id bigint,
    invoice_header_id bigint,
    PRIMARY KEY (attachment_id, invoice_header_id),
    FOREIGN KEY (attachment_id) REFERENCES attachment(id),
    FOREIGN KEY (invoice_header_id) REFERENCES invoice_header(id)
);

CREATE TABLE supplier_information_business_group_mapping (
    business_group_id bigint,
    supplier_information_id bigint,
    PRIMARY KEY (business_group_id, supplier_information_id),
    FOREIGN KEY (business_group_id) REFERENCES business_group(id),
    FOREIGN KEY (supplier_information_id) REFERENCES supplier_information(id)
);

CREATE TABLE user_approval_group_mapping (
    approval_group_id bigint,
    user_id bigint,
    PRIMARY KEY (approval_group_id, user_id),
    FOREIGN KEY (approval_group_id) REFERENCES user_group(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE requisition_header_attachment_mapping (
    attachment_id bigint,
    requisition_header_id bigint,
    PRIMARY KEY (attachment_id, requisition_header_id),
    FOREIGN KEY (attachment_id) REFERENCES attachment(id),
    FOREIGN KEY (requisition_header_id) REFERENCES requisition_header(id)
);

CREATE TABLE virtual_card (
    id bigint,
    order_header_id bigint,
    card_number text,
    card_type text,
    coupa_pay_id bigint,
    created_at timestamp,
    created_by_id bigint,
    credit_account text,
    currency_id bigint,
    custom_fields jsonb,
    document_id bigint,
    document_type text,
    expiry_month bigint,
    expiry_year bigint,
    external_ref_id text,
    "name" text,
    payment_partner_id bigint,
    requested_by_id bigint,
    "status" text,
    total_booked double precision,
    total_charged double precision,
    updated_at timestamp,
    updated_by_id bigint,
    valid_from timestamp,
    valid_to timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (order_header_id) REFERENCES order_header(id)
);

CREATE TABLE expense_mileage_vehicle_type (
    id bigint,
    created_at timestamp,
    custom_fields jsonb,
    "name" text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE order_header_change_order_line_change_mapping (
    order_header_change bigint,
    order_line_change bigint,
    PRIMARY KEY (order_header_change, order_line_change),
    FOREIGN KEY (order_header_change) REFERENCES order_header_change(id),
    FOREIGN KEY (order_line_change) REFERENCES order_line_change(id)
);

CREATE TABLE commodity (
    id bigint,
    active boolean,
    category text,
    created_at timestamp,
    created_by_id bigint,
    custom_fields jsonb,
    deductibility text,
    "name" text,
    parent_id bigint,
    subcategory text,
    updated_at timestamp,
    updated_by_id bigint,
    PRIMARY KEY (id)
);

CREATE TABLE order_line_change (
    id bigint,
    order_header_change_id bigint,
    order_line_id bigint,
    commodity_id bigint,
    created_at timestamp,
    custom_fields jsonb,
    description text,
    line_num text,
    need_by_date timestamp,
    pending_delete boolean,
    price double precision,
    quantity double precision,
    savings_pct double precision,
    source_part_num text,
    total double precision,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (order_header_change_id) REFERENCES order_header_change(id),
    FOREIGN KEY (order_line_id) REFERENCES order_line(id)
);

CREATE TABLE invoice_payment_receipt (
    id bigint,
    invoice_header_id bigint,
    amount double precision,
    clearance_document text,
    created_at timestamp,
    custom_fields jsonb,
    document_uuid text,
    exchange_rate double precision,
    legal_payment_receipt_id bigint,
    payment_method text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (invoice_header_id) REFERENCES invoice_header(id)
);

CREATE TABLE asn_line (
    id bigint,
    asn_header_id bigint,
    comments text,
    created_at timestamp,
    created_by_id bigint,
    custom_fields jsonb,
    description text,
    invoice_line_id bigint,
    item_id bigint,
    line_num text,
    match_reference text,
    order_line_id bigint,
    quantity double precision,
    received_qty double precision,
    review_reason text,
    soft_close_for_receiving boolean,
    "status" text,
    supplier_aux_part_num text,
    supplier_part_num text,
    uom_id bigint,
    updated_at timestamp,
    updated_by_id bigint,
    PRIMARY KEY (id, asn_header_id),
    FOREIGN KEY (asn_header_id) REFERENCES asn_header(id)
);

CREATE TABLE supplier_information_address_mapping (
    address_id bigint,
    supplier_information_id bigint,
    PRIMARY KEY (address_id, supplier_information_id),
    FOREIGN KEY (address_id) REFERENCES supplier_information_address(id),
    FOREIGN KEY (supplier_information_id) REFERENCES supplier_information(id)
);

CREATE TABLE contract_party (
    id bigint,
    bill_to_address_id bigint,
    business_name text,
    clma_id bigint,
    contact_name text,
    contact_title text,
    counterparty_role text,
    created_at timestamp,
    custom_fields jsonb,
    email text,
    entity_name text,
    mail_to_address_id bigint,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE statement (
    id bigint,
    coupa_pay_id bigint,
    created_at timestamp,
    created_by_id bigint,
    currency_id bigint,
    custom_fields jsonb,
    exported boolean,
    external_ref_id text,
    last_exported_at timestamp,
    "name" text,
    number_of_lines bigint,
    payment_partner_id bigint,
    statement_date timestamp,
    total double precision,
    updated_at timestamp,
    updated_by_id bigint,
    PRIMARY KEY (id)
);

CREATE TABLE supplier_preferred_commodities_mapping (
    commodity_id bigint,
    supplier_id bigint,
    PRIMARY KEY (commodity_id, supplier_id),
    FOREIGN KEY (commodity_id) REFERENCES commodity(id),
    FOREIGN KEY (supplier_id) REFERENCES supplier(id)
);

CREATE TABLE business_group_contract_mapping (
    business_group_id bigint,
    contract_id bigint,
    PRIMARY KEY (business_group_id, contract_id),
    FOREIGN KEY (business_group_id) REFERENCES business_group(id),
    FOREIGN KEY (contract_id) REFERENCES contract(id)
);

CREATE TABLE expense_mileage_config (
    id bigint,
    accumulation_period_start_day_month timestamp,
    country_id bigint,
    created_at timestamp,
    custom_fields jsonb,
    distance_unit text,
    expense_mileage_tier_rules jsonb,
    mileage_accumulation_rule_enabled boolean,
    passenger_count_prompt text,
    passenger_count_rule_enabled boolean,
    region_prompt text,
    region_rule_enabled boolean,
    require_address boolean,
    show_map boolean,
    simple_fixed_rate_amount double precision,
    simple_fixed_rate_currency_id bigint,
    simple_fixed_rate_enabled boolean,
    updated_at timestamp,
    vehicle_type_prompt text,
    vehicle_type_rule_enabled boolean,
    PRIMARY KEY (id)
);

CREATE TABLE order_header_change (
    id bigint,
    acknowledged_at timestamp,
    created_at timestamp,
    created_by_id bigint,
    current_approval_id bigint,
    custom_fields jsonb,
    department_id bigint,
    exported boolean,
    justification text,
    order_header_id bigint,
    payment_method text,
    po_number text,
    price_hidden boolean,
    reject_reason_id bigint,
    requisition_header_id bigint,
    ship_to_attention text,
    "status" text,
    supplier_initiated boolean,
    transmission_emails text,
    transmission_method_override text,
    updated_at timestamp,
    version bigint,
    PRIMARY KEY (id)
);

CREATE TABLE expense_per_diem_rule_condition (
    id bigint,
    expense_per_diem_rule_id bigint,
    comparator text,
    created_at timestamp,
    custom_fields jsonb,
    lhs text,
    rhs text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (expense_per_diem_rule_id) REFERENCES expense_per_diem_rule(id)
);

CREATE TABLE cp_payment_detail (
    id bigint,
    cp_payment_id bigint,
    created_by_id bigint,
    currency_id bigint,
    updated_by_id bigint,
    adjustment_total double precision,
    created_at timestamp,
    custom_fields jsonb,
    discount_total text,
    payable_document_type text,
    payable_id bigint,
    payable_type text,
    payment_id text,
    payment_total double precision,
    source_transaction_id text,
    source_transaction_reference text,
    source_transaction_type text,
    supplier_site text,
    transaction_total double precision,
    updated_at timestamp,
    PRIMARY KEY (id, cp_payment_id),
    FOREIGN KEY (cp_payment_id) REFERENCES cp_payment(id),
    FOREIGN KEY (created_by_id) REFERENCES "user"(id),
    FOREIGN KEY (currency_id) REFERENCES currency(id),
    FOREIGN KEY (updated_by_id) REFERENCES "user"(id)
);

CREATE TABLE integration_error (
    id bigint,
    integration_run_id bigint,
    contact_alert_type text,
    created_at timestamp,
    created_by_id bigint,
    creation_method text,
    custom_fields jsonb,
    document_id bigint,
    document_revision bigint,
    document_status text,
    document_type text,
    external_id text,
    integration_filename text,
    integration_id bigint,
    resolved boolean,
    "status" text,
    updated_at timestamp,
    updated_by_id bigint,
    PRIMARY KEY (id),
    FOREIGN KEY (integration_run_id) REFERENCES integration_run(id)
);

CREATE TABLE user_business_group_mapping (
    business_group_id bigint,
    user_id bigint,
    PRIMARY KEY (business_group_id, user_id),
    FOREIGN KEY (business_group_id) REFERENCES business_group(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE per_diem_deduction (
    id bigint,
    expense_line_daily_per_diem_id bigint,
    expense_per_diem_deduction_id bigint,
    created_at timestamp,
    custom_fields jsonb,
    deduction_applied text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (expense_line_daily_per_diem_id) REFERENCES expense_line_daily_per_diem(id),
    FOREIGN KEY (expense_per_diem_deduction_id) REFERENCES expense_per_diem_deduction(id)
);

CREATE TABLE "user" (
    id bigint,
    manager_id bigint,
    account_security_type bigint,
    active boolean,
    aic_user boolean,
    analytics_user boolean,
    api_user boolean,
    approval_limit_id bigint,
    authentication_method text,
    avatar_thumb_url text,
    business_function text,
    business_group_security_type bigint,
    ccw_user boolean,
    contract_approval_limit_id bigint,
    contract_self_approval_limit_id bigint,
    contracts_user boolean,
    country_of_residence_id bigint,
    created_at timestamp,
    created_by_id bigint,
    default_account_id bigint,
    default_account_type_id bigint,
    default_address_id bigint,
    default_currency_id bigint,
    default_locale text,
    department_id bigint,
    edit_invoice_on_quick_entry boolean,
    email text,
    employee_number text,
    employee_payment_channel text,
    escalation_threshold_id bigint,
    expense_approval_limit_id bigint,
    expense_self_approval_limit_id bigint,
    expense_user boolean,
    firstname text,
    fullname text,
    generate_password_and_notify text,
    inventory_user boolean,
    invoice_approval_limit_id bigint,
    invoice_self_approval_limit_id bigint,
    lastname text,
    login text,
    mention_name text,
    password text,
    pcard_id bigint,
    purchasing_user boolean,
    requisition_approval_limit_id bigint,
    requisition_self_approval_limit_id bigint,
    salesforce_enabled boolean,
    salesforce_id text,
    self_approval_limit_id bigint,
    seniority_level text,
    sourcing_user boolean,
    spend_guard_user boolean,
    sso_identifier text,
    updated_at timestamp,
    updated_by_id bigint,
    work_confirmation_approval_limit_id bigint,
    -- custom_fields_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (manager_id) REFERENCES "user"(id)
);

CREATE TABLE req_line_allocation (
    id bigint,
    created_by_id bigint,
    requisition_line_id bigint,
    updated_by_id bigint,
    account_id bigint,
    amount double precision,
    created_at timestamp,
    custom_fields jsonb,
    pct double precision,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_id) REFERENCES "user"(id),
    FOREIGN KEY (requisition_line_id) REFERENCES requisition_line(id),
    FOREIGN KEY (updated_by_id) REFERENCES "user"(id)
);

CREATE TABLE legal_payment_receipt (
    id bigint,
    amount double precision,
    buyer_bank_name text,
    buyer_bank_reference text,
    buyer_tax_number text,
    check_number text,
    created_at timestamp,
    currency_id bigint,
    custom_fields jsonb,
    document_date text,
    form_of_payment text,
    payment_received_date text,
    supplier_bank_reference text,
    supplier_tax_number text,
    updated_at timestamp,
    uuid text,
    PRIMARY KEY (id)
);

CREATE TABLE expense_attendee (
    id bigint,
    expense_line_id bigint,
    user_id bigint,
    active boolean,
    company text,
    created_at timestamp,
    created_by_id bigint,
    custom_fields jsonb,
    expense_attendee_type_custom_field_1 text,
    expense_attendee_type_custom_field_10 text,
    expense_attendee_type_custom_field_2 text,
    expense_attendee_type_custom_field_3 text,
    expense_attendee_type_custom_field_4 text,
    expense_attendee_type_custom_field_5 text,
    expense_attendee_type_custom_field_6 text,
    expense_attendee_type_custom_field_7 text,
    expense_attendee_type_custom_field_8 text,
    expense_attendee_type_custom_field_9 text,
    expense_attendee_type_id bigint,
    expense_attendee_type_name text,
    first_name text,
    last_name text,
    title text,
    updated_at timestamp,
    updated_by_id bigint,
    PRIMARY KEY (id, expense_line_id),
    FOREIGN KEY (expense_line_id) REFERENCES expense_line(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE supplier_remit_to_address_mapping (
    remit_to_address_id bigint,
    supplier_id bigint,
    PRIMARY KEY (remit_to_address_id, supplier_id),
    FOREIGN KEY (remit_to_address_id) REFERENCES remit_to_address(id),
    FOREIGN KEY (supplier_id) REFERENCES supplier(id)
);

CREATE TABLE contract_current_parallel_approval_mapping (
    approval_id bigint,
    contract_id bigint,
    PRIMARY KEY (approval_id, contract_id),
    FOREIGN KEY (approval_id) REFERENCES approval(id),
    FOREIGN KEY (contract_id) REFERENCES contract(id)
);

CREATE TABLE expense_report_comment_mapping (
    comment_id bigint,
    expense_report_id bigint,
    PRIMARY KEY (comment_id, expense_report_id),
    FOREIGN KEY (comment_id) REFERENCES "comment"(id),
    FOREIGN KEY (expense_report_id) REFERENCES expense_report(id)
);

CREATE TABLE tax_rate (
    id bigint,
    active boolean,
    country_id bigint,
    created_at timestamp,
    created_by_id bigint,
    custom_fields jsonb,
    customer_accounting boolean,
    effective_date timestamp,
    exempt boolean,
    expiration_date timestamp,
    percentage double precision,
    reverse_charge boolean,
    tax_description text,
    tax_rate_type_id bigint,
    updated_at timestamp,
    updated_by_id bigint,
    PRIMARY KEY (id)
);

CREATE TABLE purpose (
    id bigint,
    address_id bigint,
    contact_id bigint,
    created_at timestamp,
    custom_fields jsonb,
    kind text,
    "name" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (address_id) REFERENCES address(id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE virtual_card_partner (
    id bigint,
    configuration text,
    created_at timestamp,
    created_by_id bigint,
    currency_id bigint,
    custom_fields jsonb,
    issuing_bank text,
    "name" text,
    notes text,
    payment_partner_type text,
    support_contact_id bigint,
    "type" text,
    updated_at timestamp,
    updated_by_id bigint,
    PRIMARY KEY (id)
);

CREATE TABLE order_pad (
    id bigint,
    add_all_items boolean,
    any_supplier boolean,
    base_value double precision,
    base_value_currency_id bigint,
    created_at timestamp,
    created_by_id bigint,
    custom_fields jsonb,
    locked boolean,
    "name" text,
    updated_at timestamp,
    updated_by_id bigint,
    use_base_value boolean,
    PRIMARY KEY (id)
);

CREATE TABLE quote_request_attachment_mapping (
    attachment_id bigint,
    quote_request_attachment_id bigint,
    PRIMARY KEY (attachment_id, quote_request_attachment_id),
    FOREIGN KEY (attachment_id) REFERENCES attachment(id),
    FOREIGN KEY (quote_request_attachment_id) REFERENCES quote_request_attachment(id)
);

CREATE TABLE contract_party_contract_mapping (
    contract_id bigint,
    contract_party_id bigint,
    PRIMARY KEY (contract_id, contract_party_id),
    FOREIGN KEY (contract_id) REFERENCES contract(id),
    FOREIGN KEY (contract_party_id) REFERENCES contract_party(id)
);

CREATE TABLE expense_report_event_history (
    id bigint,
    expense_report_id bigint,
    created_at timestamp,
    created_by_id bigint,
    custom_fields jsonb,
    "status" text,
    updated_at timestamp,
    updated_by_id bigint,
    PRIMARY KEY (id),
    FOREIGN KEY (expense_report_id) REFERENCES expense_report(id)
);

CREATE TABLE cp_account (
    id bigint,
    created_by_id bigint,
    currency_id bigint,
    payment_partner_id bigint,
    updated_by_id bigint,
    account_kind text,
    account_name text,
    account_type_ids text,
    coupa_pay_id bigint,
    created_at timestamp,
    custom_fields jsonb,
    digital_check_signature_viewpost_status text,
    document_types jsonb,
    payment_option text,
    physical_check_signature_presence boolean,
    pmx_disbursing_id text,
    positive_pay_partner jsonb,
    print_and_mail_partner_name text,
    source_name text,
    source_reference text,
    "status" text,
    supported_transfer_types jsonb,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_id) REFERENCES "user"(id),
    FOREIGN KEY (currency_id) REFERENCES currency(id),
    FOREIGN KEY (payment_partner_id) REFERENCES payment_partner(id),
    FOREIGN KEY (updated_by_id) REFERENCES "user"(id)
);

CREATE TABLE order_line (
    id bigint,
    order_header_id bigint,
    currency_id bigint,
    extra_line_attribute_id bigint,
    account_id bigint,
    accounting_total double precision,
    accounting_total_currency_id bigint,
    bulk_price_id bigint,
    commodity_id bigint,
    contract_id bigint,
    created_at timestamp,
    created_by_id bigint,
    custom_fields jsonb,
    department_id bigint,
    description text,
    end_date text,
    invoice_stop boolean,
    invoiced double precision,
    item_id bigint,
    line_num text,
    match_type text,
    need_by_date timestamp,
    order_header_number text,
    period_id bigint,
    price double precision,
    quantity double precision,
    receipt_required boolean,
    received double precision,
    receiving_warehouse_id bigint,
    reporting_total double precision,
    requester_id bigint,
    savings_pct double precision,
    service_type text,
    source_part_num text,
    start_date text,
    "status" text,
    sub_line_num bigint,
    supp_aux_part_num text,
    supplier_order_number text,
    supplier_site_id bigint,
    total double precision,
    "type" text,
    uom_id bigint,
    updated_at timestamp,
    updated_by_id bigint,
    version bigint,
    PRIMARY KEY (id, order_header_id),
    FOREIGN KEY (order_header_id) REFERENCES order_header(id),
    FOREIGN KEY (currency_id) REFERENCES currency(id),
    FOREIGN KEY (extra_line_attribute_id) REFERENCES order_line_attribute(id)
);

CREATE TABLE shipping_term (
    id bigint,
    active boolean,
    code text,
    created_at timestamp,
    created_by_id bigint,
    custom_fields jsonb,
    description text,
    updated_at timestamp,
    updated_by_id bigint,
    PRIMARY KEY (id)
);

CREATE TABLE inventory_txn_allocation (
    id bigint,
    inventory_transaction_id bigint,
    account_id bigint,
    amount double precision,
    created_at timestamp,
    created_by_id bigint,
    custom_fields jsonb,
    pct double precision,
    period_id bigint,
    updated_at timestamp,
    updated_by_id bigint,
    PRIMARY KEY (id),
    FOREIGN KEY (inventory_transaction_id) REFERENCES inventory_transaction(id)
);

CREATE TABLE order_header_change_approval_mapping (
    approval_id bigint,
    order_header_change_id bigint,
    PRIMARY KEY (approval_id, order_header_change_id),
    FOREIGN KEY (approval_id) REFERENCES approval(id),
    FOREIGN KEY (order_header_change_id) REFERENCES order_header_change(id)
);

CREATE TABLE integration_contacts (
    id bigint,
    supplier_id bigint,
    contact_alert_type text,
    contactable_id bigint,
    contactable_type text,
    created_at timestamp,
    created_by_id bigint,
    custom_fields jsonb,
    updated_at timestamp,
    updated_by_id bigint,
    PRIMARY KEY (id),
    FOREIGN KEY (supplier_id) REFERENCES supplier(id)
);

CREATE TABLE invoice_line_allocation (
    id bigint,
    invoice_header_id bigint,
    invoice_line_id bigint,
    account_id bigint,
    amount double precision,
    billing_note text,
    created_at timestamp,
    created_by_id bigint,
    custom_fields jsonb,
    handling_distribution_total double precision,
    misc_distribution_total double precision,
    pct double precision,
    period_id bigint,
    shipping_distribution_total double precision,
    tax_distribution_total double precision,
    updated_at timestamp,
    updated_by_id bigint,
    PRIMARY KEY (id, invoice_header_id, invoice_line_id),
    FOREIGN KEY (invoice_header_id) REFERENCES invoice_header(id),
    FOREIGN KEY (invoice_line_id) REFERENCES invoice_line(id)
);

CREATE TABLE payment_partner_account_type_mapping (
    account_id bigint,
    account_type_id bigint,
    payment_id bigint,
    payment_partner_id bigint,
    PRIMARY KEY (account_id, account_type_id, payment_id, payment_partner_id),
    FOREIGN KEY (account_id) REFERENCES cp_account(id),
    FOREIGN KEY (account_type_id) REFERENCES account_type(id),
    FOREIGN KEY (payment_id) REFERENCES cp_payment(id),
    FOREIGN KEY (payment_partner_id) REFERENCES payment_partner(id)
);

CREATE TABLE contract_template (
    id bigint,
    active boolean,
    authoring_method text,
    created_at timestamp,
    created_by_id bigint,
    custom_fields jsonb,
    description text,
    hierarchy_type text,
    "name" text,
    updated_at timestamp,
    updated_by_id bigint,
    PRIMARY KEY (id)
);

CREATE TABLE expense_line_preapproval (
    id bigint,
    amount double precision,
    created_at timestamp,
    currency_id bigint,
    custom_fields jsonb,
    expense_report_preapproval_id bigint,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE expense_line_mileage_allocation (
    id bigint,
    expense_line_mileage_id bigint,
    applied_distance double precision,
    applied_distance_ text,
    applied_rate double precision,
    created_at timestamp,
    custom_fields jsonb,
    expense_mileage_rate_type_id bigint,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (expense_line_mileage_id) REFERENCES expense_line_mileage(id)
);

CREATE TABLE charge_allocation (
    id bigint,
    charge_id bigint,
    account_id bigint,
    amount double precision,
    created_at timestamp,
    created_by_id bigint,
    currency_id bigint,
    custom_fields jsonb,
    pct double precision,
    period_id bigint,
    updated_at timestamp,
    updated_by_id bigint,
    PRIMARY KEY (id),
    FOREIGN KEY (charge_id) REFERENCES charge(id)
);

CREATE TABLE invoice_charge_tax_line_mapping (
    invoice_charge_id bigint,
    tax_line_id bigint,
    PRIMARY KEY (invoice_charge_id, tax_line_id),
    FOREIGN KEY (invoice_charge_id) REFERENCES invoice_charge(id),
    FOREIGN KEY (tax_line_id) REFERENCES tax_line(id)
);

CREATE TABLE invoice_failed_tolerance (
    id bigint,
    invoice_line_id bigint,
    account_type_id bigint,
    breach_amount text,
    breach_detail_1 text,
    breach_detail_2 text,
    breach_detail_3 text,
    breach_detail_4 text,
    breach_limit text,
    code text,
    created_at timestamp,
    custom_fields jsonb,
    failable_id bigint,
    failable_type text,
    resolution_strategy text,
    resolved boolean,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (invoice_line_id) REFERENCES invoice_line(id)
);

CREATE TABLE charge (
    id bigint,
    account_type_id text,
    accounting_currency_id bigint,
    order_header_id bigint,
    payment_partner_id bigint,
    supplier_id bigint,
    virtual_card_id bigint,
    accounting_total double precision,
    card_provider_account text,
    charge_date timestamp,
    coupa_pay_id text,
    coupa_pay_statement_id text,
    created_at timestamp,
    created_by_id bigint,
    custom_fields jsonb,
    document_id bigint,
    document_type text,
    expense_holding_account_id bigint,
    exported boolean,
    external_ref_id text,
    holding_account_id bigint,
    issuer_reconciliation_id text,
    last_exported_at timestamp,
    legal_entity_name text,
    mcc text,
    merchant_currency_id bigint,
    merchant_reference text,
    merchant_total double precision,
    order_header_currency text,
    order_header_number text,
    order_header_total text,
    posting_date timestamp,
    statement_id bigint,
    statement_name text,
    supplier_name text,
    total double precision,
    updated_at timestamp,
    updated_by_id bigint,
    PRIMARY KEY (id),
    FOREIGN KEY (account_type_id) REFERENCES account_type(id),
    FOREIGN KEY (accounting_currency_id) REFERENCES currency(id),
    FOREIGN KEY (order_header_id) REFERENCES order_header(id),
    FOREIGN KEY (payment_partner_id) REFERENCES payment_partner(id),
    FOREIGN KEY (supplier_id) REFERENCES supplier(id),
    FOREIGN KEY (virtual_card_id) REFERENCES virtual_card(id)
);

CREATE TABLE integration_record_response (
    id bigint,
    integration_error_id bigint,
    integration_history_record_id bigint,
    created_at timestamp,
    created_by_id bigint,
    custom_fields jsonb,
    response_code text,
    response_message text,
    updated_at timestamp,
    updated_by_id bigint,
    PRIMARY KEY (id),
    FOREIGN KEY (integration_error_id) REFERENCES integration_error(id),
    FOREIGN KEY (integration_history_record_id) REFERENCES integration_history_record(id)
);

CREATE TABLE quote_request (
    id bigint,
    allow_award_individual_line_items boolean,
    allow_multiple_response boolean,
    automatic_bid_unsealing boolean,
    comments text,
    commodity_id bigint,
    custom_fields jsonb,
    description text,
    end_time timestamp,
    event_type text,
    sealed_bids boolean,
    sealing_type text,
    start_on_submit boolean,
    start_time timestamp,
    timezone text,
    PRIMARY KEY (id)
);

CREATE TABLE address (
    id bigint,
    active boolean,
    attention text,
    business_group_name text,
    city text,
    country_id bigint,
    created_at timestamp,
    created_by_id bigint,
    custom_fields jsonb,
    external_src_name text,
    external_src_ref text,
    local_tax_number text,
    location_code text,
    "name" text,
    postal_code text,
    "state" text,
    state_iso_code text,
    street_1 text,
    street_2 text,
    street_3 text,
    street_4 text,
    updated_at timestamp,
    updated_by_id bigint,
    vat_country_id bigint,
    vat_number text,
    PRIMARY KEY (id)
);

CREATE TABLE easy_form_approval_mapping (
    approval_id bigint,
    easy_form_id bigint,
    PRIMARY KEY (approval_id, easy_form_id),
    FOREIGN KEY (approval_id) REFERENCES approval(id),
    FOREIGN KEY (easy_form_id) REFERENCES easy_form_data(id)
);

CREATE TABLE expense_mileage_region (
    id bigint,
    country_id bigint,
    created_at timestamp,
    custom_fields jsonb,
    location_id text,
    "name" text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE easy_form_widget_data (
    easy_form_widget_id bigint,
    id bigint,
    created_by_id bigint,
    easy_form_id bigint,
    easy_form_response_id bigint,
    updated_by_id bigint,
    answer jsonb,
    created_at timestamp,
    encrypted_answer jsonb,
    field_name text,
    "type" text,
    updated_at timestamp,
    widget_label text,
    widget_type text,
    PRIMARY KEY (easy_form_widget_id, id),
    FOREIGN KEY (created_by_id) REFERENCES "user"(id),
    FOREIGN KEY (easy_form_id) REFERENCES easy_form_data(id),
    FOREIGN KEY (easy_form_response_id) REFERENCES easy_form_data(id),
    FOREIGN KEY (updated_by_id) REFERENCES "user"(id)
);

CREATE TABLE reason_insight_event (
    id bigint,
    contract_id bigint,
    "comment" text,
    created_at timestamp,
    created_by_id bigint,
    custom_fields jsonb,
    eventable_id bigint,
    eventable_type text,
    reason_insight_id bigint,
    updated_at timestamp,
    updated_by_id bigint,
    PRIMARY KEY (id),
    FOREIGN KEY (contract_id) REFERENCES contract(id)
);

CREATE TABLE user_address_mapping (
    address_id bigint,
    user_id bigint,
    PRIMARY KEY (address_id, user_id),
    FOREIGN KEY (address_id) REFERENCES address(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE expense_line_allocation (
    id bigint,
    expense_line_id bigint,
    account_id bigint,
    amount double precision,
    created_at timestamp,
    created_by_id bigint,
    custom_fields jsonb,
    pct double precision,
    read_only boolean,
    updated_at timestamp,
    updated_by_id bigint,
    PRIMARY KEY (id),
    FOREIGN KEY (expense_line_id) REFERENCES expense_line(id)
);

CREATE TABLE account (
    id bigint,
    account_type_id bigint,
    active boolean,
    code text,
    created_at timestamp,
    created_by_id bigint,
    custom_fields jsonb,
    "name" text,
    segment_1 text,
    segment_10 text,
    segment_11 text,
    segment_12 text,
    segment_13 text,
    segment_14 text,
    segment_15 text,
    segment_16 text,
    segment_17 text,
    segment_18 text,
    segment_19 text,
    segment_2 text,
    segment_20 text,
    segment_3 text,
    segment_4 text,
    segment_5 text,
    segment_6 text,
    segment_7 text,
    segment_8 text,
    segment_9 text,
    updated_at timestamp,
    updated_by_id bigint,
    PRIMARY KEY (id)
);

CREATE TABLE expense_line_per_diem (
    id bigint,
    created_at timestamp,
    custom_fields jsonb,
    destination text,
    end_at timestamp,
    end_at_timezone text,
    start_at timestamp,
    start_at_timezone text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE warehouse_type (
    id bigint,
    created_at timestamp,
    created_by_id bigint,
    custom_fields jsonb,
    description text,
    "name" text,
    updated_at timestamp,
    updated_by_id bigint,
    PRIMARY KEY (id)
);

CREATE TABLE expense_category (
    id bigint,
    active boolean,
    attendee_tracking_enabled boolean,
    created_at timestamp,
    created_by_id bigint,
    custom_fields jsonb,
    expense_mileage_config_id bigint,
    expense_per_diem_config_id bigint,
    expense_policy_id bigint,
    "name" text,
    scope text,
    tax_enabled boolean,
    "type" text,
    updated_at timestamp,
    updated_by_id bigint,
    PRIMARY KEY (id)
);

CREATE TABLE country (
    id bigint,
    code text,
    custom_fields jsonb,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE supplier_item (
    id bigint,
    contract_id bigint,
    contract_term_id bigint,
    created_by_id bigint,
    currency_id bigint,
    item_id bigint,
    supplier_id bigint,
    updated_by_id bigint,
    availability text,
    availability_date timestamp,
    created_at timestamp,
    custom_fields jsonb,
    lead_time bigint,
    manufacturer text,
    minimum_order_quantity double precision,
    order_increment double precision,
    preferred boolean,
    price double precision,
    price_change text,
    price_tier_1 double precision,
    price_tier_10 double precision,
    price_tier_11 double precision,
    price_tier_12 double precision,
    price_tier_13 double precision,
    price_tier_14 double precision,
    price_tier_15 double precision,
    price_tier_16 double precision,
    price_tier_17 double precision,
    price_tier_18 double precision,
    price_tier_19 double precision,
    price_tier_2 double precision,
    price_tier_20 double precision,
    price_tier_3 double precision,
    price_tier_4 double precision,
    price_tier_5 double precision,
    price_tier_6 double precision,
    price_tier_7 double precision,
    price_tier_8 double precision,
    price_tier_9 double precision,
    savings_pct double precision,
    supplier_aux_part_num text,
    supplier_part_num text,
    unspsc_code text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (contract_id) REFERENCES contract(id),
    FOREIGN KEY (contract_term_id) REFERENCES contract_term(id),
    FOREIGN KEY (created_by_id) REFERENCES "user"(id),
    FOREIGN KEY (currency_id) REFERENCES currency(id),
    FOREIGN KEY (item_id) REFERENCES item(id),
    FOREIGN KEY (supplier_id) REFERENCES supplier(id),
    FOREIGN KEY (updated_by_id) REFERENCES "user"(id)
);

CREATE TABLE asset_tag (
    id bigint,
    created_at timestamp,
    created_by_id bigint,
    custom_fields jsonb,
    inventory_balance_id bigint,
    note text,
    order_line_id bigint,
    owner text,
    received boolean,
    requisition_line_id bigint,
    serial_number text,
    tag text,
    updated_at timestamp,
    updated_by_id bigint,
    PRIMARY KEY (id)
);

CREATE TABLE expense_preapproval (
    id bigint,
    available_amount_currency_id bigint,
    created_by_id bigint,
    currency_id bigint,
    for_user_id bigint,
    updated_by_id bigint,
    amount double precision,
    available boolean,
    available_amount double precision,
    created_at timestamp,
    custom_fields jsonb,
    description text,
    end_date timestamp,
    start_date timestamp,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (available_amount_currency_id) REFERENCES currency(id),
    FOREIGN KEY (created_by_id) REFERENCES "user"(id),
    FOREIGN KEY (currency_id) REFERENCES currency(id),
    FOREIGN KEY (for_user_id) REFERENCES "user"(id),
    FOREIGN KEY (updated_by_id) REFERENCES "user"(id)
);

CREATE TABLE quote_request_business_group_mapping (
    business_group_id bigint,
    quote_request_id bigint,
    PRIMARY KEY (business_group_id, quote_request_id),
    FOREIGN KEY (business_group_id) REFERENCES business_group(id),
    FOREIGN KEY (quote_request_id) REFERENCES quote_request(id)
);

CREATE TABLE expense_per_diem_deduction (
    id bigint,
    expense_per_diem_config_id bigint,
    created_at timestamp,
    custom_fields jsonb,
    effective_date timestamp,
    enabled boolean,
    expense_per_diem_deduction_type_id bigint,
    label text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (expense_per_diem_config_id) REFERENCES expense_per_diem_config(id)
);

CREATE TABLE registered_company (
    id bigint,
    authorized_person_address text,
    authorized_person_name text,
    authorized_person_vat_id text,
    chairman_of_the_board text,
    commercial_register_number text,
    company_registration_number text,
    company_type text,
    country_id bigint,
    court_of_registration text,
    created_at timestamp,
    custom_fields jsonb,
    date_of_registration timestamp,
    legal_type text,
    liable_company text,
    license_number text,
    liquidation_remark text,
    liquidator_name text,
    managing_directors text,
    "name" text,
    permit_date text,
    permit_number text,
    place_of_registration text,
    register_legal_entities text,
    registered_seat text,
    registration_authority text,
    share_capital text,
    sole_registration_code text,
    tax_regime text,
    unique_shareholder text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE user_group_membership (
    id bigint,
    user_group_id bigint,
    user_id bigint,
    created_at timestamp,
    custom_fields jsonb,
    owner boolean,
    participant boolean,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (user_group_id) REFERENCES user_group(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE supplier_business_group_mapping (
    business_group_id bigint,
    supplier_id bigint,
    PRIMARY KEY (business_group_id, supplier_id),
    FOREIGN KEY (business_group_id) REFERENCES business_group(id),
    FOREIGN KEY (supplier_id) REFERENCES supplier(id)
);

CREATE TABLE cp_payment (
    id bigint,
    created_by_id bigint,
    pay_from_account_id bigint,
    pay_from_currency_id bigint,
    pay_to_account_id bigint,
    pay_to_currency_id bigint,
    reporting_currency_id bigint,
    updated_by_id bigint,
    created_at timestamp,
    custom_fields jsonb,
    digital_check_check_number text,
    digital_check_id bigint,
    digital_check_status text,
    error_text text,
    exchange_rate double precision,
    exported boolean,
    external_ref_id bigint,
    last_exported_at timestamp,
    line_num bigint,
    pay_from_total double precision,
    pay_to_total double precision,
    payment_batch_description text,
    payment_batch_id bigint,
    payment_batch_status text,
    released_at timestamp,
    reporting_pay_from_total double precision,
    reporting_pay_to_total double precision,
    "status" text,
    updated_at timestamp,
    -- payee_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_id) REFERENCES "user"(id),
    FOREIGN KEY (pay_from_account_id) REFERENCES cp_account(id),
    FOREIGN KEY (pay_from_currency_id) REFERENCES currency(id),
    FOREIGN KEY (pay_to_account_id) REFERENCES cp_account(id),
    FOREIGN KEY (pay_to_currency_id) REFERENCES currency(id),
    FOREIGN KEY (reporting_currency_id) REFERENCES currency(id),
    FOREIGN KEY (updated_by_id) REFERENCES "user"(id)
);

CREATE TABLE address_tax_registration_relation (
    address_id bigint,
    tax_registration_id bigint,
    PRIMARY KEY (address_id, tax_registration_id),
    FOREIGN KEY (address_id) REFERENCES address(id),
    FOREIGN KEY (tax_registration_id) REFERENCES tax_registration(id)
);

CREATE TABLE remit_to_address_tax_registration_mapping (
    remit_to_address_id bigint,
    tax_registration_id bigint,
    PRIMARY KEY (remit_to_address_id, tax_registration_id),
    FOREIGN KEY (remit_to_address_id) REFERENCES remit_to_address(id),
    FOREIGN KEY (tax_registration_id) REFERENCES tax_registration(id)
);

CREATE TABLE user_address (
    id bigint,
    active boolean,
    attention text,
    business_group_name text,
    city text,
    country_id bigint,
    created_at timestamp,
    created_by_id bigint,
    custom_fields jsonb,
    external_src_name text,
    external_src_ref text,
    local_tax_number text,
    location_code text,
    "name" text,
    postal_code text,
    "state" text,
    state_iso_code text,
    street_1 text,
    street_2 text,
    street_3 text,
    street_4 text,
    updated_at timestamp,
    updated_by_id bigint,
    vat_country_id bigint,
    vat_number text,
    PRIMARY KEY (id)
);

CREATE TABLE contract_type (
    id bigint,
    active boolean,
    created_at timestamp,
    created_by_id bigint,
    custom_fields jsonb,
    description text,
    "name" text,
    updated_at timestamp,
    updated_by_id bigint,
    PRIMARY KEY (id)
);

CREATE TABLE inventory_organization_warehouse_mapping (
    inventory_organization_id bigint,
    warehouse_id bigint,
    PRIMARY KEY (inventory_organization_id, warehouse_id),
    FOREIGN KEY (inventory_organization_id) REFERENCES inventory_organization(id),
    FOREIGN KEY (warehouse_id) REFERENCES warehouse(id)
);

CREATE TABLE user_account_group_mapping (
    account_group_id bigint,
    user_id bigint,
    PRIMARY KEY (account_group_id, user_id),
    FOREIGN KEY (account_group_id) REFERENCES account_group(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE expense_trip_mileage_allocation (
    id bigint,
    expense_trip_mileage_id bigint,
    allocation_applied_distance_distance text,
    allocation_applied_distance_unit text,
    allocation_applied_rate_amount text,
    allocation_applied_rate_currency_code text,
    created_at timestamp,
    custom_fields jsonb,
    expense_mileage_rate_type_id bigint,
    updated_at timestamp,
    PRIMARY KEY (id, expense_trip_mileage_id),
    FOREIGN KEY (expense_trip_mileage_id) REFERENCES expense_trip_mileage(id)
);

CREATE TABLE upload_error (
    id bigint,
    created_at timestamp,
    created_by_id bigint,
    custom_fields jsonb,
    field_errors jsonb,
    field_with_error text,
    first_column text,
    "row" bigint,
    "type" text,
    updated_at timestamp,
    updated_by_id bigint,
    "value" text,
    PRIMARY KEY (id)
);

CREATE TABLE expense_trip_mileage (
    id bigint,
    created_at timestamp,
    custom_fields jsonb,
    expense_mileage_region_id bigint,
    expense_mileage_vehicle_type_id bigint,
    original_distance text,
    passenger_count bigint,
    total_distance text,
    total_distance_unit text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE supplier_contact_mapping (
    contact_id bigint,
    supplier_id bigint,
    PRIMARY KEY (contact_id, supplier_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (supplier_id) REFERENCES supplier(id)
);

CREATE TABLE tax_rate_type (
    id bigint,
    active boolean,
    country_id bigint,
    created_at timestamp,
    created_by_id bigint,
    custom_fields jsonb,
    description text,
    effective_date timestamp,
    expiration_date timestamp,
    updated_at timestamp,
    updated_by_id bigint,
    PRIMARY KEY (id)
);

CREATE TABLE approver_group_user_mapping (
    approver_id bigint,
    user_id bigint,
    PRIMARY KEY (approver_id, user_id),
    FOREIGN KEY (approver_id) REFERENCES approver(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE expense_line_mileage (
    id bigint,
    created_at timestamp,
    custom_fields jsonb,
    description text,
    distance double precision,
    distance_unit text,
    end_address text,
    expense_mileage_region_id bigint,
    expense_mileage_vehicle_type_id bigint,
    "name" text,
    passenger_count bigint,
    round_trip boolean,
    start_address text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE order_line_allocation (
    id bigint,
    order_line_id bigint,
    account_id bigint,
    amount double precision,
    created_at timestamp,
    created_by_id bigint,
    custom_fields jsonb,
    pct double precision,
    updated_at timestamp,
    updated_by_id bigint,
    PRIMARY KEY (id),
    FOREIGN KEY (order_line_id) REFERENCES order_line(id)
);

CREATE TABLE invoice_line (
    id bigint,
    invoice_header_id bigint,
    order_line_commodity_id bigint,
    order_line_id bigint,
    account_id bigint,
    accounting_total double precision,
    accounting_total_currency_id bigint,
    billing_note text,
    bulk_price_id bigint,
    category text,
    commodity_id bigint,
    company_uom text,
    contract_id bigint,
    created_at timestamp,
    created_by_id bigint,
    currency_id bigint,
    custom_fields jsonb,
    customs_declaration_number text,
    deductibility text,
    delivery_note_number text,
    description text,
    discount_amount double precision,
    end_date text,
    handling_distribution_total double precision,
    hsn_sac_code text,
    line_num bigint,
    line_type text,
    match_reference text,
    misc_distribution_total double precision,
    net_weight double precision,
    order_header_num text,
    order_line_num text,
    order_line_source_part_num text,
    original_date_of_supply text,
    period_id bigint,
    po_number text,
    price double precision,
    price_per_uom double precision,
    property_tax_account text,
    quantity double precision,
    shipping_distribution_total double precision,
    source_part_num text,
    start_date text,
    "status" text,
    subcategory text,
    tax_amount double precision,
    tax_amount_engine text,
    tax_code_id bigint,
    tax_description text,
    tax_distribution_total double precision,
    tax_location text,
    tax_rate text,
    tax_supply_date timestamp,
    total double precision,
    "type" text,
    unspsc text,
    uom_id bigint,
    updated_at timestamp,
    updated_by_id bigint,
    weight_uom_id bigint,
    PRIMARY KEY (id, invoice_header_id),
    FOREIGN KEY (invoice_header_id) REFERENCES invoice_header(id),
    FOREIGN KEY (order_line_commodity_id) REFERENCES commodity(id),
    FOREIGN KEY (order_line_id) REFERENCES order_line(id)
);

CREATE TABLE warehouse_location (
    id bigint,
    warehouse_id bigint,
    aisle text,
    bin text,
    created_at timestamp,
    created_by_id bigint,
    custom_fields jsonb,
    "level" text,
    "name" text,
    updated_at timestamp,
    updated_by_id bigint,
    warehouse_name text,
    PRIMARY KEY (id),
    FOREIGN KEY (warehouse_id) REFERENCES warehouse(id)
);

CREATE TABLE expense_report_preapproval (
    id bigint,
    expense_report_id bigint,
    amount double precision,
    created_at timestamp,
    currency_id bigint,
    custom_fields jsonb,
    expense_preapproval_id bigint,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (expense_report_id) REFERENCES expense_report(id)
);

CREATE TABLE budget_line (
    id bigint,
    amount double precision,
    created_at timestamp,
    created_by_id bigint,
    currency_id bigint,
    custom_fields jsonb,
    description text,
    error_on_overrun boolean,
    notes text,
    overrun_calculation bigint,
    owner_id bigint,
    owner_is_approver bigint,
    period_id bigint,
    remaining double precision,
    remaining_budget double precision,
    segment_1 text,
    segment_10 text,
    segment_11 text,
    segment_12 text,
    segment_13 text,
    segment_14 text,
    segment_15 text,
    segment_16 text,
    segment_17 text,
    segment_18 text,
    segment_19 text,
    segment_2 text,
    segment_20 text,
    segment_3 text,
    segment_4 text,
    segment_5 text,
    segment_6 text,
    segment_7 text,
    segment_8 text,
    segment_9 text,
    updated_at timestamp,
    updated_by_id bigint,
    PRIMARY KEY (id)
);

CREATE TABLE dispute_reason (
    id bigint,
    invoice_header_id bigint,
    code text,
    created_at timestamp,
    created_by_id bigint,
    custom_fields jsonb,
    description text,
    updated_at timestamp,
    updated_by_id bigint,
    PRIMARY KEY (id, invoice_header_id),
    FOREIGN KEY (invoice_header_id) REFERENCES invoice_header(id)
);

CREATE TABLE invoice_header (
    id bigint,
    abandon_reason_id bigint,
    account_type_id bigint,
    advance_payment_received_amount double precision,
    amount_due double precision,
    bill_to_address_id bigint,
    buyer_tax_registration_id bigint,
    canceled boolean,
    cash_accounting_scheme_reference text,
    channel text,
    clearance_document text,
    comments text,
    compliant boolean,
    confirmation text,
    contract_id bigint,
    coupa_accelerate_status text,
    created_at timestamp,
    created_by_id bigint,
    credit_note_differences_with_original_invoice double precision,
    credit_reason text,
    currency_id bigint,
    custom_fields jsonb,
    customer_accounting_tax double precision,
    customs_declaration_date timestamp,
    customs_declaration_number text,
    customs_office text,
    date_of_discovery_of_facts_decisive_for_correction timestamp,
    date_received timestamp,
    delivery_date timestamp,
    delivery_number text,
    destination_country_id bigint,
    discount_amount double precision,
    discount_due_date timestamp,
    discount_percent double precision,
    dispute_method text,
    document_type text,
    early_payment_provisions text,
    exchange_rate double precision,
    exported boolean,
    folio_number text,
    form_of_payment text,
    gross_total double precision,
    handling_amount double precision,
    image_scan text,
    image_scan_url text,
    inbox_name text,
    internal_note text,
    invoice_date timestamp,
    invoice_from_address_id bigint,
    invoice_number text,
    issuance_place text,
    last_exported_at text,
    late_payment_penalties text,
    legal_destination_country_id bigint,
    line_level_taxation boolean,
    lock_version_key bigint,
    margin_scheme text,
    misc_amount double precision,
    net_due_date text,
    origin_country_id bigint,
    origin_currency_gross double precision,
    origin_currency_net double precision,
    original_invoice_date timestamp,
    original_invoice_number text,
    paid boolean,
    payment_channel text,
    payment_date timestamp,
    payment_method text,
    payment_notes text,
    payment_order_reference text,
    payment_term_id bigint,
    remit_to_address_id bigint,
    requested_by_id bigint,
    reverse_charge_reference text,
    self_billing_reference text,
    sender_email text,
    series text,
    ship_from_address_id bigint,
    ship_to_address_id bigint,
    shipping_amount double precision,
    shipping_term_id bigint,
    show_tax_information boolean,
    "status" text,
    supplier_created text,
    supplier_id bigint,
    supplier_note text,
    supplier_remit_to_id bigint,
    supplier_tax_registration_id bigint,
    supplier_total double precision,
    tax_amount double precision,
    tax_amount_engine text,
    tax_code_id bigint,
    tax_due_to_supplier double precision,
    tax_rate text,
    taxes_in_origin_country_currency double precision,
    tolerance_failures text,
    total_with_taxes double precision,
    type_of_receipt text,
    type_of_relationship text,
    updated_at timestamp,
    updated_by_id bigint,
    use_of_invoice text,
    withholding_tax_override double precision,
    PRIMARY KEY (id)
);

CREATE TABLE expense_report_approval_mapping (
    approval_id bigint,
    expense_report_id bigint,
    PRIMARY KEY (approval_id, expense_report_id),
    FOREIGN KEY (approval_id) REFERENCES approval(id),
    FOREIGN KEY (expense_report_id) REFERENCES expense_report(id)
);

CREATE TABLE supplier_address (
    id bigint,
    active boolean,
    attention text,
    business_group_name text,
    city text,
    country_id bigint,
    created_at timestamp,
    created_by_id bigint,
    custom_fields jsonb,
    external_src_name text,
    external_src_ref text,
    local_tax_number text,
    location_code text,
    "name" text,
    postal_code text,
    "state" text,
    state_iso_code text,
    street_1 text,
    street_2 text,
    street_3 text,
    street_4 text,
    updated_at timestamp,
    updated_by_id bigint,
    vat_country_id bigint,
    vat_number text,
    PRIMARY KEY (id)
);

CREATE TABLE matching_allocation (
    id bigint,
    asn_line_id bigint,
    inventory_transaction_id bigint,
    invoice_line_id bigint,
    order_line_id bigint,
    uom_id bigint,
    amount double precision,
    created_at timestamp,
    custom_fields jsonb,
    inventory_transaction_match_reference text,
    invoice_line_total double precision,
    manual_match bigint,
    quantity double precision,
    "status" text,
    status_reason text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (asn_line_id) REFERENCES asn_line(id),
    FOREIGN KEY (inventory_transaction_id) REFERENCES inventory_transaction(id),
    FOREIGN KEY (invoice_line_id) REFERENCES invoice_line(id),
    FOREIGN KEY (order_line_id) REFERENCES order_line(id),
    FOREIGN KEY (uom_id) REFERENCES unit_of_measure(id)
);

CREATE TABLE expense_per_diem_time_range_condition (
    id bigint,
    conjunction text,
    created_at timestamp,
    custom_fields jsonb,
    end_after timestamp,
    end_before timestamp,
    start_after timestamp,
    start_before timestamp,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE inventory_transaction (
    id bigint,
    account_id bigint,
    asn_header_id bigint,
    asn_line_id bigint,
    barcode text,
    created_at timestamp,
    created_by_id bigint,
    currency_id bigint,
    custom_fields jsonb,
    exported boolean,
    from_warehouse_id bigint,
    from_warehouse_location_id bigint,
    inspection_code_id bigint,
    item_id bigint,
    last_exported_at timestamp,
    match_reference text,
    order_line_id bigint,
    price double precision,
    quantity double precision,
    receipt_id bigint,
    receipts_batch_id bigint,
    received_weight double precision,
    rfid_tag text,
    soft_close_for_receiving boolean,
    "status" text,
    to_warehouse_id bigint,
    to_warehouse_location_id bigint,
    total double precision,
    transaction_date timestamp,
    "type" text,
    uom_id bigint,
    updated_at timestamp,
    -- adjustment_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE enterprise (
    id bigint,
    active_flag boolean,
    code text,
    created_at timestamp,
    created_by_id bigint,
    custom_fields jsonb,
    description text,
    "name" text,
    system_flag boolean,
    tax_coding_enabled text,
    updated_at timestamp,
    updated_by_id bigint,
    vendor_remit_to_required text,
    PRIMARY KEY (id)
);

CREATE TABLE expense_policy (
    id bigint,
    active boolean,
    allow_divisor boolean,
    allow_divisor_end_date boolean,
    allow_itemization boolean,
    created_at timestamp,
    created_by_id bigint,
    custom_fields jsonb,
    divisor_end_name text,
    divisor_start_name text,
    divisor_uom_name text,
    limit_amount double precision,
    limit_type text,
    requires_receipt boolean,
    restrict_itemization_categories boolean,
    summary text,
    text text,
    updated_at timestamp,
    updated_by_id bigint,
    PRIMARY KEY (id)
);

CREATE TABLE order_header_attachment_mapping (
    attachment_id bigint,
    order_header_id bigint,
    PRIMARY KEY (attachment_id, order_header_id),
    FOREIGN KEY (attachment_id) REFERENCES attachment(id),
    FOREIGN KEY (order_header_id) REFERENCES order_header(id)
);

CREATE TABLE supplier (
    id bigint,
    account_number text,
    allow_change_requests boolean,
    allow_csp_access_without_two_factor text,
    allow_cxml_invoicing boolean,
    allow_inv_choose_billing_account boolean,
    allow_inv_from_connect boolean,
    allow_inv_no_backing_doc_from_connect boolean,
    allow_inv_unbacked_lines_from_connect boolean,
    buyer_hold boolean,
    commodity_id bigint,
    corporate_url text,
    coupa_connect_secret text,
    created_at timestamp,
    created_by_id bigint,
    custom_fields jsonb,
    cxml_domain text,
    cxml_http_password text,
    cxml_http_username text,
    cxml_identity text,
    cxml_invoice_buyer_domain text,
    cxml_invoice_buyer_identity text,
    cxml_invoice_secret text,
    cxml_invoice_supplier_domain text,
    cxml_invoice_supplier_identity text,
    cxml_protocol text,
    cxml_secret text,
    cxml_ssl_version text,
    cxml_supplier_domain text,
    cxml_supplier_identity text,
    cxml_url text,
    default_locale text,
    disable_cert_verify boolean,
    display_name text,
    duns text,
    enterprise_id bigint,
    hold_invoices_for_ap_review boolean,
    invoice_matching_level text,
    "name" text,
    number text,
    on_hold boolean,
    parent_id bigint,
    payment_method text,
    payment_term_id bigint,
    po_change_method text,
    po_email text,
    po_method text,
    primary_address_id bigint,
    primary_contact_id bigint,
    savings_pct double precision,
    send_invoices_to_approvals boolean,
    shipping_term_id bigint,
    "status" text,
    storefront_url text,
    tax_code_id bigint,
    tax_id text,
    updated_at timestamp,
    updated_by_id bigint,
    website text,
    PRIMARY KEY (id)
);

CREATE TABLE supplier_address_mapping (
    address_id bigint,
    supplier_id bigint,
    PRIMARY KEY (address_id, supplier_id),
    FOREIGN KEY (address_id) REFERENCES address(id),
    FOREIGN KEY (supplier_id) REFERENCES supplier(id)
);

CREATE TABLE tax_registration (
    id bigint,
    active boolean,
    country_id bigint,
    created_at timestamp,
    created_by_id bigint,
    custom_fields jsonb,
    local boolean,
    number text,
    owner_id bigint,
    owner_type text,
    updated_at timestamp,
    updated_by_id bigint,
    PRIMARY KEY (id)
);

CREATE TABLE supplier_information (
    id bigint,
    commodity_id text,
    currency_id bigint,
    default_commodity_id bigint,
    payment_term_id bigint,
    shipping_term_id bigint,
    supplier_id bigint,
    tax_code_id bigint,
    user_id bigint,
    allow_cxml_invoicing boolean,
    allow_inv_choose_billing_account boolean,
    allow_inv_from_connect boolean,
    allow_inv_no_backing_doc_from_connect boolean,
    allow_inv_unbacked_lines_from_connect boolean,
    backend_system_catalog text,
    backend_system_invoicing text,
    buyer_hold boolean,
    buyer_id bigint,
    classification_detail jsonb,
    "comment" text,
    comment_source text,
    country_of_operation_id bigint,
    created_at timestamp,
    created_by_id bigint,
    custom_fields jsonb,
    cxml_domain text,
    cxml_http_username text,
    cxml_identity text,
    cxml_protocol text,
    cxml_secret text,
    cxml_ssl_version text,
    cxml_supplier_domain text,
    cxml_supplier_identity text,
    cxml_url text,
    default_invoice_email text,
    disable_cert_verify boolean,
    display_name text,
    diversities jsonb,
    duns_number text,
    duplicate_exists boolean,
    enterprise_detail jsonb,
    estimated_spend_amount double precision,
    fed_reportable boolean,
    federal_tax_num text,
    goods_services_provided text,
    govt_agency_interaction text,
    govt_agency_interaction_indicator boolean,
    govt_allegation_fraud_bribery text,
    govt_allegation_fraud_bribery_indicator boolean,
    hold_invoices_for_ap_review boolean,
    hold_payment text,
    hold_payment_indicator boolean,
    inbound_invoice_domain text,
    inco_terms text,
    income_type text,
    industry text,
    insurance_detail jsonb,
    intl_other_explanation text,
    intl_tax_classification text,
    intl_tax_num text,
    invoice_amount_limit text,
    invoice_inbound_emails text,
    invoice_matching_level text,
    last_exported_at text,
    logo_content_type text,
    logo_file_name text,
    logo_file_size bigint,
    logo_updated_at timestamp,
    minority_designation_id bigint,
    minority_indicator boolean,
    minority_type_id bigint,
    "name" text,
    one_time_supplier boolean,
    organization_type text,
    parent_company_name text,
    pay_group text,
    payment_terms_id bigint,
    po_change_method text,
    po_email text,
    po_method text,
    policy_for_bribery_corruption text,
    policy_for_bribery_corruption_indicator boolean,
    preferred_currency_id bigint,
    preferred_language_id bigint,
    risk_detail jsonb,
    savings_pct double precision,
    scope_three_emissions boolean,
    send_invoices_to_approvals boolean,
    separate_remit_to boolean,
    "status" text,
    supplier_name text,
    supplier_number text,
    supplier_region text,
    tax_classification text,
    tax_detail jsonb,
    tax_exempt_other_explanation text,
    tax_region text,
    third_party_interaction text,
    third_party_interaction_indicator boolean,
    updated_at timestamp,
    updated_by_id bigint,
    website text,
    PRIMARY KEY (id),
    FOREIGN KEY (commodity_id) REFERENCES commodity(id),
    FOREIGN KEY (currency_id) REFERENCES currency(id),
    FOREIGN KEY (default_commodity_id) REFERENCES commodity(id),
    FOREIGN KEY (payment_term_id) REFERENCES payment_term(id),
    FOREIGN KEY (shipping_term_id) REFERENCES shipping_term(id),
    FOREIGN KEY (supplier_id) REFERENCES supplier(id),
    FOREIGN KEY (tax_code_id) REFERENCES tax_code(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE inventory_transaction_valuation (
    id bigint,
    inventory_transaction_id bigint,
    custom_fields jsonb,
    price double precision,
    quantity double precision,
    uom_id bigint,
    PRIMARY KEY (id),
    FOREIGN KEY (inventory_transaction_id) REFERENCES inventory_transaction(id)
);

CREATE TABLE order_pad_line (
    id bigint,
    order_pad_id bigint,
    supplier_id bigint,
    amount double precision,
    created_at timestamp,
    created_by_id bigint,
    custom_fields jsonb,
    item_id bigint,
    key_item boolean,
    order_amount_method text,
    order_pad_section_id bigint,
    par_level double precision,
    "position" bigint,
    updated_at timestamp,
    updated_by_id bigint,
    PRIMARY KEY (id, order_pad_id),
    FOREIGN KEY (order_pad_id) REFERENCES order_pad(id),
    FOREIGN KEY (supplier_id) REFERENCES supplier(id)
);

CREATE TABLE order_pad_section (
    id bigint,
    created_at timestamp,
    custom_fields jsonb,
    "name" text,
    "position" bigint,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE item (
    id bigint,
    active boolean,
    allow_partial_quantity boolean,
    commodity_id bigint,
    connect_item_id bigint,
    consumption_quantity bigint,
    consumption_uom_id bigint,
    created_at timestamp,
    created_by_id bigint,
    custom_fields jsonb,
    description text,
    external_image_url text,
    image_url text,
    inventory_lot_tracking_enabled boolean,
    item_number text,
    item_type text,
    manufacturer_name text,
    manufacturer_part_number text,
    "name" text,
    net_weight double precision,
    net_weight_uom_id bigint,
    pack_qty double precision,
    pack_uom_id bigint,
    pack_weight double precision,
    receive_catch_weight boolean,
    receiving_form_id bigint,
    reorder_point double precision,
    require_asset_tag boolean,
    require_inspection boolean,
    storage_quantity bigint,
    storage_uom_id bigint,
    uom_id bigint,
    updated_at timestamp,
    updated_by_id bigint,
    use_pack_weight boolean,
    PRIMARY KEY (id)
);

CREATE TABLE expense_policy_violation (
    id bigint,
    expense_report_id bigint,
    created_at timestamp,
    created_by_id bigint,
    custom_fields jsonb,
    limit_exceeded double precision,
    receipt_missing boolean,
    updated_at timestamp,
    updated_by_id bigint,
    PRIMARY KEY (id),
    FOREIGN KEY (expense_report_id) REFERENCES expense_report(id)
);

CREATE TABLE user_group_user_mapping (
    user_group_id bigint,
    user_id bigint,
    PRIMARY KEY (user_group_id, user_id),
    FOREIGN KEY (user_group_id) REFERENCES user_group(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE approver (
    id bigint,
    approval_id bigint,
    active boolean,
    approver_type text,
    can_approve boolean,
    created_at timestamp,
    created_by_id bigint,
    description text,
    mention_name text,
    "name" text,
    "open" boolean,
    "type" text,
    updated_at timestamp,
    updated_by_id bigint,
    PRIMARY KEY (id, approval_id),
    FOREIGN KEY (approval_id) REFERENCES approval(id)
);

CREATE TABLE account_validation_rule (
    id bigint,
    account_type_id bigint,
    active boolean,
    created_at timestamp,
    created_by_id bigint,
    custom_fields jsonb,
    description text,
    error_message text,
    "name" text,
    segment_10_condition text,
    segment_10_max text,
    segment_11_condition text,
    segment_11_max text,
    segment_11_min text,
    segment_12_condition text,
    segment_12_max text,
    segment_12_min text,
    segment_13_condition text,
    segment_13_max text,
    segment_13_min text,
    segment_14_condition text,
    segment_14_max text,
    segment_14_min text,
    segment_15_condition text,
    segment_15_max text,
    segment_15_min text,
    segment_16_condition text,
    segment_16_max text,
    segment_16_min text,
    segment_17_condition text,
    segment_17_max text,
    segment_17_min text,
    segment_18_condition text,
    segment_18_max text,
    segment_18_min text,
    segment_19_condition text,
    segment_19_max text,
    segment_19_min text,
    segment_1_condition text,
    segment_1_max text,
    segment_1_min text,
    segment_20_condition text,
    segment_20_max text,
    segment_20_min text,
    segment_2_condition text,
    segment_2_max text,
    segment_2_min text,
    segment_3_condition text,
    segment_3_max text,
    segment_3_min text,
    segment_4_condition text,
    segment_4_max text,
    segment_4_min text,
    segment_5_condition text,
    segment_5_max text,
    segment_5_min text,
    segment_6_condition text,
    segment_6_max text,
    segment_6_min text,
    segment_7_condition text,
    segment_7_max text,
    segment_7_min text,
    segment_8_condition text,
    segment_8_max text,
    segment_8_min text,
    segment_9_condition text,
    segment_9_max text,
    segment_9_min text,
    updated_at timestamp,
    updated_by_id bigint,
    PRIMARY KEY (id)
);

CREATE TABLE payment (
    id bigint,
    amount_paid double precision,
    check_number text,
    created_at timestamp,
    created_by_id bigint,
    custom_fields jsonb,
    notes text,
    payable_id bigint,
    payable_type text,
    payment_date timestamp,
    updated_at timestamp,
    updated_by_id bigint,
    PRIMARY KEY (id)
);

CREATE TABLE user_can_expense_for_mapping (
    can_expense_for_id bigint,
    user_id bigint,
    PRIMARY KEY (can_expense_for_id, user_id),
    FOREIGN KEY (can_expense_for_id) REFERENCES "user"(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE reason_insight (
    id bigint,
    code text,
    created_at timestamp,
    created_by_id bigint,
    custom_fields jsonb,
    description text,
    reason_type text,
    updated_at timestamp,
    updated_by_id bigint,
    PRIMARY KEY (id)
);

CREATE TABLE user_role_mapping (
    role_id bigint,
    user_id bigint,
    PRIMARY KEY (role_id, user_id),
    FOREIGN KEY (role_id) REFERENCES "role"(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE order_line_asset_tag_mapping (
    asset_tag_id bigint,
    order_line_id bigint,
    PRIMARY KEY (asset_tag_id, order_line_id),
    FOREIGN KEY (asset_tag_id) REFERENCES asset_tag(id),
    FOREIGN KEY (order_line_id) REFERENCES order_line(id)
);

CREATE TABLE supplier_information_artifact (
    id bigint,
    supplier_information_id bigint,
    supplier_id bigint,
    artifact_meta_type text,
    artifact_type text,
    created_at timestamp,
    created_by_id bigint,
    description text,
    effective_date timestamp,
    expiry_date timestamp,
    "type" text,
    updated_at timestamp,
    updated_by_id bigint,
    PRIMARY KEY (id, supplier_information_id),
    FOREIGN KEY (supplier_information_id) REFERENCES supplier_information(id),
    FOREIGN KEY (supplier_id) REFERENCES supplier(id)
);

CREATE TABLE data_file_source (
    id bigint,
    created_at timestamp,
    created_by_id bigint,
    custom_fields jsonb,
    end_time timestamp,
    file_content_type text,
    file_file_name text,
    file_file_size text,
    integration_id bigint,
    integration_run_id bigint,
    progress bigint,
    records_count bigint,
    records_created bigint,
    records_updated bigint,
    result_text text,
    source_for text,
    start_time timestamp,
    "status" text,
    "type" text,
    updated_at timestamp,
    updated_by_id bigint,
    upload_error_count bigint,
    PRIMARY KEY (id)
);

CREATE TABLE business_group (
    id bigint,
    created_at timestamp,
    created_by_id bigint,
    custom_fields jsonb,
    description text,
    "name" text,
    updated_at timestamp,
    updated_by_id bigint,
    PRIMARY KEY (id)
);

CREATE TABLE expense_mileage_rate_type (
    id bigint,
    created_at timestamp,
    custom_fields jsonb,
    "name" text,
    rate_type text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE withholding_tax_line (
    id bigint,
    invoice_line_id bigint,
    amount double precision,
    base double precision,
    basis double precision,
    code text,
    code_id bigint,
    created_at timestamp,
    created_by_id bigint,
    custom_fields jsonb,
    kind_of_factor text,
    nature_of_tax text,
    rate double precision,
    supplier_rate double precision,
    tax_code_id bigint,
    taxable_amount double precision,
    "type" text,
    updated_at timestamp,
    updated_by_id bigint,
    withholding_amount double precision,
    PRIMARY KEY (id),
    FOREIGN KEY (invoice_line_id) REFERENCES invoice_line(id)
);

CREATE TABLE quote_request_lot (
    id bigint,
    custom_fields jsonb,
    expected_quantity bigint,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE bulk_price (
    id bigint,
    conversion_denominator double precision,
    conversion_numerator double precision,
    custom_fields jsonb,
    price double precision,
    qty double precision,
    uom_id bigint,
    PRIMARY KEY (id)
);

CREATE TABLE supplier_remit_to (
    id bigint,
    city text,
    company_registration_number text,
    country_id bigint,
    created_at timestamp,
    custom_fields jsonb,
    disclosure text,
    "name" text,
    postal_code text,
    preferred_language text,
    registered_company_id bigint,
    "state" text,
    street_1 text,
    street_2 text,
    supplier_name text,
    tax_number text,
    tax_prefix text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE inventory_transaction_asset_tag_mapping (
    asset_tag_id bigint,
    inventory_transaction_id bigint,
    PRIMARY KEY (asset_tag_id, inventory_transaction_id),
    FOREIGN KEY (asset_tag_id) REFERENCES asset_tag(id),
    FOREIGN KEY (inventory_transaction_id) REFERENCES inventory_transaction(id)
);

CREATE TABLE form (
    id bigint,
    quote_request_id bigint,
    created_at timestamp,
    created_by_id bigint,
    custom_fields jsonb,
    form_type text,
    "name" text,
    "status" text,
    updated_at timestamp,
    updated_by_id bigint,
    PRIMARY KEY (id),
    FOREIGN KEY (quote_request_id) REFERENCES quote_request(id)
);

CREATE TABLE integration (
    id bigint,
    business_object text,
    code text,
    created_at timestamp,
    custom_fields jsonb,
    direction text,
    end_system text,
    end_system_type text,
    integration_type text,
    "name" text,
    standard boolean,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE quote_supplier (
    id bigint,
    quote_request_id bigint,
    contact_name text,
    created_at timestamp,
    created_by_id bigint,
    custom_fields jsonb,
    display_name text,
    email text,
    "name" text,
    supplier_id bigint,
    updated_at timestamp,
    updated_by_id bigint,
    PRIMARY KEY (id),
    FOREIGN KEY (quote_request_id) REFERENCES quote_request(id)
);

CREATE TABLE inventory_transaction_attachment_mapping (
    attachment_id bigint,
    inventory_transaction_id bigint,
    PRIMARY KEY (attachment_id, inventory_transaction_id),
    FOREIGN KEY (attachment_id) REFERENCES attachment(id),
    FOREIGN KEY (inventory_transaction_id) REFERENCES inventory_transaction(id)
);

CREATE TABLE budget_line_adjustment (
    id bigint,
    budget_line_id bigint,
    accounting_total double precision,
    adjuster_id bigint,
    adjuster_type text,
    adjustment_amount double precision,
    amount double precision,
    budget_remaining double precision,
    created_at timestamp,
    created_by_id bigint,
    currency_id bigint,
    description text,
    price double precision,
    quantity double precision,
    reason text,
    PRIMARY KEY (id),
    FOREIGN KEY (budget_line_id) REFERENCES budget_line(id)
);

CREATE TABLE payment_partner (
    id bigint,
    created_by_id bigint,
    currency_id bigint,
    support_contact_id bigint,
    updated_by_id bigint,
    code text,
    created_at timestamp,
    custom_fields jsonb,
    description text,
    is_active boolean,
    is_default boolean,
    is_deleted boolean,
    issuing_bank text,
    "name" text,
    payment_partner_type text,
    "type" text,
    updated_at timestamp,
    -- config_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_id) REFERENCES "user"(id),
    FOREIGN KEY (currency_id) REFERENCES currency(id),
    FOREIGN KEY (support_contact_id) REFERENCES contact(id),
    FOREIGN KEY (updated_by_id) REFERENCES "user"(id)
);

CREATE TABLE user_working_warehouse_mapping (
    user_id bigint,
    warehouse_id bigint,
    PRIMARY KEY (user_id, warehouse_id),
    FOREIGN KEY (user_id) REFERENCES "user"(id),
    FOREIGN KEY (warehouse_id) REFERENCES warehouse(id)
);

CREATE TABLE commodity_translation (
    id bigint,
    commodity_id bigint,
    created_at timestamp,
    custom_fields jsonb,
    locale text,
    "name" text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE supplier_information_contact_mapping (
    contact_id bigint,
    supplier_information_id bigint,
    PRIMARY KEY (contact_id, supplier_information_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (supplier_information_id) REFERENCES supplier_information(id)
);

CREATE TABLE warehouse (
    id bigint,
    address_id bigint,
    active_flag boolean,
    created_at timestamp,
    created_by_id bigint,
    currency_id bigint,
    custom_fields jsonb,
    description text,
    "name" text,
    updated_at timestamp,
    updated_by_id bigint,
    warehouse_type_id bigint,
    PRIMARY KEY (id),
    FOREIGN KEY (address_id) REFERENCES address(id)
);

CREATE TABLE quote_request_attachment (
    id bigint,
    quote_request_id bigint,
    allow_to_respond boolean,
    custom_fields jsonb,
    instruction text,
    "name" text,
    response_required boolean,
    PRIMARY KEY (id),
    FOREIGN KEY (quote_request_id) REFERENCES quote_request(id)
);

CREATE TABLE expense_mileage_tier_rule (
    id bigint,
    expense_mileage_config_id bigint,
    created_at timestamp,
    custom_fields jsonb,
    distance_range_start bigint,
    expense_mileage_rate_type_id bigint,
    "name" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (expense_mileage_config_id) REFERENCES expense_mileage_config(id)
);

CREATE TABLE quote_request_line (
    id bigint,
    commodity_id bigint,
    quote_request_id bigint,
    quote_request_lot_id bigint,
    creatable_form_id bigint,
    creatable_form_type text,
    created_at timestamp,
    created_by_id bigint,
    custom_fields jsonb,
    description text,
    extra_line_attribute_id bigint,
    need_by_date text,
    price_amount double precision,
    price_currency_id bigint,
    quantity double precision,
    reporting_price_amount double precision,
    "type" text,
    uom_id bigint,
    updated_at timestamp,
    updated_by_id bigint,
    weight bigint,
    PRIMARY KEY (id),
    FOREIGN KEY (commodity_id) REFERENCES commodity(id),
    FOREIGN KEY (quote_request_id) REFERENCES quote_request(id),
    FOREIGN KEY (quote_request_lot_id) REFERENCES quote_request_lot(id)
);

CREATE TABLE tax_line (
    id bigint,
    charge_id bigint,
    invoice_line_id bigint,
    amount double precision,
    base double precision,
    code text,
    code_id bigint,
    created_at timestamp,
    created_by_id bigint,
    custom_fields jsonb,
    description text,
    kind_of_factor text,
    nature_of_tax text,
    rate double precision,
    supplier_rate double precision,
    tax_code_id bigint,
    taxable_amount double precision,
    "type" text,
    updated_at timestamp,
    updated_by_id bigint,
    withholding_amount double precision,
    PRIMARY KEY (id),
    FOREIGN KEY (charge_id) REFERENCES charge(id),
    FOREIGN KEY (invoice_line_id) REFERENCES invoice_line(id)
);

CREATE TABLE requisition_header_approval_mapping (
    approval_id bigint,
    requisition_header_id bigint,
    PRIMARY KEY (approval_id, requisition_header_id),
    FOREIGN KEY (approval_id) REFERENCES approval(id),
    FOREIGN KEY (requisition_header_id) REFERENCES requisition_header(id)
);

CREATE TABLE "role" (
    id bigint,
    created_at timestamp,
    created_by_id bigint,
    custom_fields jsonb,
    description text,
    "name" text,
    omnipotent boolean,
    system_role boolean,
    updated_at timestamp,
    updated_by_id bigint,
    PRIMARY KEY (id)
);

CREATE TABLE invoice_header_approval_mapping (
    approval_id bigint,
    invoice_header_id bigint,
    PRIMARY KEY (approval_id, invoice_header_id),
    FOREIGN KEY (approval_id) REFERENCES approval(id),
    FOREIGN KEY (invoice_header_id) REFERENCES invoice_header(id)
);

CREATE TABLE tax_code (
    id bigint,
    active boolean,
    code text,
    country_id bigint,
    created_at timestamp,
    created_by_id bigint,
    custom_fields jsonb,
    description text,
    effective_date timestamp,
    percentage double precision,
    tax_rate_id bigint,
    updated_at timestamp,
    updated_by_id bigint,
    PRIMARY KEY (id)
);

CREATE TABLE expense_line_tax (
    id bigint,
    expense_line_id bigint,
    amount double precision,
    country_id bigint,
    created_at timestamp,
    created_by_id bigint,
    currency_id bigint,
    custom_fields jsonb,
    std_amount double precision,
    tax_code_id bigint,
    updated_at timestamp,
    updated_by_id bigint,
    PRIMARY KEY (id),
    FOREIGN KEY (expense_line_id) REFERENCES expense_line(id)
);

CREATE TABLE contract (
    id bigint,
    amended_contract_type text,
    auto_extend_end_date_for_renewal boolean,
    clma_id bigint,
    consent text,
    contract_owner_id bigint,
    contract_type_custom_field_1 text,
    contract_type_custom_field_10 text,
    contract_type_custom_field_2 text,
    contract_type_custom_field_3 text,
    contract_type_custom_field_4 text,
    contract_type_custom_field_5 text,
    contract_type_custom_field_6 text,
    contract_type_custom_field_7 text,
    contract_type_custom_field_8 text,
    contract_type_custom_field_9 text,
    contract_type_id bigint,
    created_at timestamp,
    created_by_id bigint,
    currency_id bigint,
    current_approval_id bigint,
    custom_fields jsonb,
    default_account_id bigint,
    department_id bigint,
    description text,
    end_date timestamp,
    execution_date timestamp,
    external_contract_id text,
    fill_with_counterparty boolean,
    is_default boolean,
    legal_agreement_url text,
    length_of_notice_unit text,
    length_of_notice_value text,
    master_contract_id bigint,
    max_commit double precision,
    maximum_value double precision,
    min_commit double precision,
    minimum_value double precision,
    "name" text,
    no_of_renewals text,
    number text,
    order_window_tz text,
    parent_id bigint,
    payment_term_id bigint,
    po_message text,
    preferred boolean,
    proxy_supplier_id bigint,
    published_date text,
    quote_response_id bigint,
    renewal_length_unit text,
    renewal_length_value text,
    requisition_message text,
    savings_pct double precision,
    shipping_term_id bigint,
    "source" text,
    source_id text,
    source_type text,
    start_date timestamp,
    "status" text,
    stop_spend_based_on_max_value text,
    strict_invoicing_rules boolean,
    submitter_id bigint,
    supplier_account text,
    supplier_id bigint,
    supplier_invoiceable boolean,
    term_type text,
    terminated boolean,
    termination_notice text,
    termination_notice_length_unit text,
    termination_notice_length_value text,
    terms text,
    "type" text,
    updated_at timestamp,
    updated_by_id bigint,
    use_online_signing boolean,
    use_order_window boolean,
    used_for_buying boolean,
    version bigint,
    whose_paper text,
    -- contractDetail_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE "comment" (
    id bigint,
    created_by_id bigint,
    commentable_id bigint,
    commentable_type text,
    comments text,
    created_at timestamp,
    custom_fields jsonb,
    reason_code text,
    to_supplier boolean,
    "type" text,
    updated_at timestamp,
    updated_by_id bigint,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_id) REFERENCES "user"(id)
);

CREATE TABLE receipt (
    id bigint,
    created_at timestamp,
    created_by_id bigint,
    currency_id bigint,
    custom_fields jsonb,
    exported boolean,
    quantity double precision,
    receipt_date timestamp,
    receivable text,
    receivable_id bigint,
    receivable_type text,
    total double precision,
    unit_price double precision,
    uom_id bigint,
    updated_at timestamp,
    updated_by_id bigint,
    PRIMARY KEY (id)
);

CREATE TABLE asn_header (
    id bigint,
    asn_number text,
    bill_of_landing text,
    container text,
    created_at timestamp,
    created_by_id bigint,
    custom_fields jsonb,
    delivery_date timestamp,
    export_flag boolean,
    gross_weight double precision,
    packing_slip text,
    ship_date text,
    ship_method text,
    ship_note text,
    ship_to_address_id bigint,
    ship_to_user_id bigint,
    ship_to_warehouse_id bigint,
    standard_carrier_alpha_code text,
    "status" text,
    supplier_id bigint,
    tracking_number text,
    trailer text,
    uom text,
    updated_at timestamp,
    updated_by_id bigint,
    PRIMARY KEY (id)
);

CREATE TABLE user_expenses_delegated_to_mapping (
    expenses_delgated_to_id bigint,
    user_id bigint,
    PRIMARY KEY (expenses_delgated_to_id, user_id),
    FOREIGN KEY (expenses_delgated_to_id) REFERENCES "user"(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE unit_of_measure (
    id bigint,
    active boolean,
    allowable_precision bigint,
    code text,
    created_at timestamp,
    created_by_id bigint,
    custom_fields jsonb,
    "name" text,
    updated_at timestamp,
    updated_by_id bigint,
    PRIMARY KEY (id)
);

CREATE TABLE inventory_organization (
    id bigint,
    user_id bigint,
    created_at timestamp,
    currency_id bigint,
    custom_fields jsonb,
    fulfillment_type text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE punchout_site (
    id bigint,
    created_by_id bigint,
    updated_by_id bigint,
    contract_id bigint,
    created_at timestamp,
    custom_fields jsonb,
    disable_cert_verify boolean,
    domain text,
    identity text,
    is_from_coupa_checkout boolean,
    "name" text,
    protocol text,
    secret text,
    sender_domain text,
    sender_identity text,
    ssl_version text,
    supplier_id bigint,
    supports_edit boolean,
    supports_inspect boolean,
    updated_at timestamp,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_id) REFERENCES "user"(id),
    FOREIGN KEY (updated_by_id) REFERENCES "user"(id)
);

CREATE TABLE expense_trip_segment (
    id bigint,
    expense_trip_mileage_id bigint,
    created_at timestamp,
    custom_fields jsonb,
    end_at timestamp,
    end_location text,
    end_location_id text,
    is_travel_segment boolean,
    segment_type text,
    start_at timestamp,
    start_location text,
    start_location_id text,
    updated_at timestamp,
    PRIMARY KEY (id, expense_trip_mileage_id),
    FOREIGN KEY (expense_trip_mileage_id) REFERENCES expense_trip_mileage(id)
);

CREATE TABLE lookup_business_group_mapping (
    business_group_id bigint,
    lookup_id bigint,
    PRIMARY KEY (business_group_id, lookup_id),
    FOREIGN KEY (business_group_id) REFERENCES business_group(id),
    FOREIGN KEY (lookup_id) REFERENCES lookup(id)
);

CREATE TABLE expense_per_diem_rule (
    id bigint,
    expense_per_diem_config_id bigint,
    created_at timestamp,
    custom_fields jsonb,
    effective_date timestamp,
    enabled boolean,
    end_after timestamp,
    end_before timestamp,
    expense_per_diem_rate_type_id bigint,
    expense_per_diem_time_range_condition_id bigint,
    hours double precision,
    label text,
    rank bigint,
    rate_frequency text,
    rate_location_type text,
    rate_logic bigint,
    rate_percentage double precision,
    rule_type text,
    start_after timestamp,
    start_before timestamp,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (expense_per_diem_config_id) REFERENCES expense_per_diem_config(id)
);

CREATE TABLE supplier_risk_aware_feed (
    id bigint,
    created_at timestamp,
    custom_fields jsonb,
    number_field_01 double precision,
    number_field_02 double precision,
    number_field_03 double precision,
    number_field_04 double precision,
    number_field_05 double precision,
    number_field_06 double precision,
    number_field_07 double precision,
    number_field_08 double precision,
    number_field_09 double precision,
    number_field_10 double precision,
    supplier_id bigint,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE order_header (
    id bigint,
    acknowledged_at text,
    acknowledged_flag boolean,
    change_type text,
    coupa_accelerate_status text,
    created_at timestamp,
    created_by_id bigint,
    currency_id bigint,
    custom_fields jsonb,
    exported boolean,
    internal_revision bigint,
    invoice_stop boolean,
    last_exported_at timestamp,
    payment_method text,
    payment_term_id bigint,
    pcard_id bigint,
    po_number text,
    price_hidden boolean,
    requester_id bigint,
    requisition_header_id bigint,
    ship_to_address_id bigint,
    ship_to_attention text,
    ship_to_user_id bigint,
    shipping_term_id bigint,
    "status" text,
    supplier_id bigint,
    transmission_emails text,
    transmission_method_override text,
    transmission_status text,
    "type" text,
    updated_at timestamp,
    updated_by_id bigint,
    version bigint,
    PRIMARY KEY (id)
);

CREATE TABLE quote_request_user (
    id bigint,
    quote_request_id bigint,
    user_id bigint,
    attitude text,
    custom_fields jsonb,
    PRIMARY KEY (id),
    FOREIGN KEY (quote_request_id) REFERENCES quote_request(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE order_line_attribute (
    id bigint,
    order_line_id bigint,
    created_at timestamp,
    created_by_id bigint,
    custom_fields jsonb,
    end_date timestamp,
    start_date timestamp,
    updated_at timestamp,
    updated_by_id bigint,
    work_confirmer_email text,
    PRIMARY KEY (id),
    FOREIGN KEY (order_line_id) REFERENCES order_line(id)
);

CREATE TABLE contract_template_business_group_mapping (
    business_group_id bigint,
    contract_template_id bigint,
    PRIMARY KEY (business_group_id, contract_template_id),
    FOREIGN KEY (business_group_id) REFERENCES business_group(id),
    FOREIGN KEY (contract_template_id) REFERENCES contract_party(id)
);

CREATE TABLE integration_history_record (
    id bigint,
    integration_run_id bigint,
    inventory_transaction_id bigint,
    invoice_header_id bigint,
    order_header_id bigint,
    contact_alert_type text,
    created_at timestamp,
    created_by_id bigint,
    creation_method text,
    custom_fields jsonb,
    document_id bigint,
    document_revision bigint,
    document_status text,
    document_type text,
    external_id text,
    integration_id bigint,
    resolved boolean,
    "status" text,
    updated_at timestamp,
    updated_by_id bigint,
    PRIMARY KEY (id),
    FOREIGN KEY (integration_run_id) REFERENCES integration_run(id),
    FOREIGN KEY (inventory_transaction_id) REFERENCES inventory_transaction(id),
    FOREIGN KEY (invoice_header_id) REFERENCES invoice_header(id),
    FOREIGN KEY (order_header_id) REFERENCES order_header(id)
);

CREATE TABLE attachment (
    id bigint,
    created_at timestamp,
    custom_fields jsonb,
    file_url text,
    intent text,
    linked_to text,
    text text,
    "type" text,
    updated_at timestamp,
    url text,
    PRIMARY KEY (id)
);
