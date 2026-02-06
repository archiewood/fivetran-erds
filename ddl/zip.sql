CREATE TABLE gl_account_subsidiary (
    gl_account_id text,
    subsidiary_id text,
    PRIMARY KEY (gl_account_id, subsidiary_id),
    FOREIGN KEY (gl_account_id) REFERENCES gl_account(id),
    FOREIGN KEY (subsidiary_id) REFERENCES subsidiary(id)
);

CREATE TABLE gl_account (
    id text,
    active text,
    currency text,
    external_id text,
    "name" text,
    number text,
    "source" text,
    sub_type text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE user_group (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE agreement_attachment (
    id text,
    agreement_id text,
    "name" text,
    "type" text,
    url text,
    PRIMARY KEY (id, agreement_id),
    FOREIGN KEY (agreement_id) REFERENCES agreement(id)
);

CREATE TABLE agreement_request (
    agreement_id text,
    request_id text,
    PRIMARY KEY (agreement_id, request_id),
    FOREIGN KEY (agreement_id) REFERENCES agreement(id),
    FOREIGN KEY (request_id) REFERENCES request(id)
);

CREATE TABLE agreement_purchase_order (
    agreement_id text,
    purchase_order_id text,
    PRIMARY KEY (agreement_id, purchase_order_id),
    FOREIGN KEY (agreement_id) REFERENCES agreement(id),
    FOREIGN KEY (purchase_order_id) REFERENCES purchase_order(id)
);

CREATE TABLE agreement_subsidiary (
    agreement_id text,
    subsidiary_id text,
    PRIMARY KEY (agreement_id, subsidiary_id),
    FOREIGN KEY (agreement_id) REFERENCES agreement(id),
    FOREIGN KEY (subsidiary_id) REFERENCES subsidiary(id)
);

CREATE TABLE agreement_category (
    id text,
    agreement_id text,
    "name" text,
    "status" text,
    "type" text,
    PRIMARY KEY (id, agreement_id),
    FOREIGN KEY (agreement_id) REFERENCES agreement(id)
);

CREATE TABLE agreement_subcategory (
    id text,
    agreement_id text,
    "name" text,
    "status" text,
    "type" text,
    PRIMARY KEY (id, agreement_id),
    FOREIGN KEY (agreement_id) REFERENCES agreement(id)
);

CREATE TABLE agreement_renewal_stakeholder (
    agreement_id text,
    id text,
    PRIMARY KEY (agreement_id, id),
    FOREIGN KEY (agreement_id) REFERENCES agreement(id),
    FOREIGN KEY (id) REFERENCES users(id)
);

CREATE TABLE agreement (
    id text,
    department_id text,
    original_request_id text,
    renewal_workflow_id text,
    vendor_id text,
    amount text,
    attributes jsonb,
    auto_renews text,
    child_requests jsonb,
    currency text,
    display_renewal_status text,
    end_date text,
    execution_date text,
    "name" text,
    number text,
    opt_out_date text,
    renewal_alert_date text,
    renewal_date text,
    renewal_stakeholder_queues jsonb,
    renewal_status text,
    start_date text,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (original_request_id) REFERENCES request(id),
    FOREIGN KEY (renewal_workflow_id) REFERENCES workflow(id),
    FOREIGN KEY (vendor_id) REFERENCES vendor(id)
);

CREATE TABLE subsidiary (
    id text,
    address_country text,
    address_locality text,
    address_postcode text,
    address_region text,
    display_name text,
    external_ids jsonb,
    is_active text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE subsidiary_line (
    "index" text,
    subsidiary_id text,
    line text,
    PRIMARY KEY ("index", subsidiary_id)
);

CREATE TABLE workflow (
    id text,
    "name" text,
    "status" text,
    PRIMARY KEY (id)
);

CREATE TABLE user_attribute (
    id text,
    user_id text,
    config_id text,
    data text,
    integration_data jsonb,
    "name" text,
    PRIMARY KEY (id, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE user_user_group (
    user_group_id text,
    user_id text,
    PRIMARY KEY (user_group_id, user_id),
    FOREIGN KEY (user_group_id) REFERENCES user_group(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE user_manager (
    manager_id text,
    user_id text,
    PRIMARY KEY (manager_id, user_id),
    FOREIGN KEY (manager_id) REFERENCES users(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE user_role (
    role_id text,
    user_id text,
    PRIMARY KEY (role_id, user_id),
    FOREIGN KEY (role_id) REFERENCES "role"(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE user_external_data (
    id text,
    user_id text,
    "source" text,
    PRIMARY KEY (id, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    department_id text,
    subsidiary_id text,
    email text,
    first_name text,
    is_active text,
    last_name text,
    sso_enforced text,
    PRIMARY KEY (id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (subsidiary_id) REFERENCES subsidiary(id)
);

CREATE TABLE "role" (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE vendor_external_data (
    "index" text,
    vendor_id text,
    id text,
    "source" text,
    PRIMARY KEY ("index", vendor_id),
    FOREIGN KEY (vendor_id) REFERENCES vendor(id)
);

CREATE TABLE vendor_contact (
    id text,
    vendor_id text,
    email text,
    "name" text,
    phone text,
    title text,
    PRIMARY KEY (id, vendor_id),
    FOREIGN KEY (vendor_id) REFERENCES vendor(id)
);

CREATE TABLE vendor_subsidiary (
    subsidiary_id text,
    vendor_id text,
    PRIMARY KEY (subsidiary_id, vendor_id),
    FOREIGN KEY (subsidiary_id) REFERENCES subsidiary(id),
    FOREIGN KEY (vendor_id) REFERENCES vendor(id)
);

CREATE TABLE vendor_currency (
    currency_id text,
    vendor_id text,
    PRIMARY KEY (currency_id, vendor_id),
    FOREIGN KEY (currency_id) REFERENCES currency(id),
    FOREIGN KEY (vendor_id) REFERENCES vendor(id)
);

CREATE TABLE vendor_category (
    id text,
    vendor_id text,
    "name" text,
    PRIMARY KEY (id, vendor_id),
    FOREIGN KEY (vendor_id) REFERENCES vendor(id)
);

CREATE TABLE vendor_attribute (
    id text,
    vendor_id text,
    config_id text,
    data text,
    "name" text,
    PRIMARY KEY (id, vendor_id),
    FOREIGN KEY (vendor_id) REFERENCES vendor(id)
);

CREATE TABLE vendor_address_line (
    "index" text,
    vendor_id text,
    lines text,
    PRIMARY KEY ("index", vendor_id),
    FOREIGN KEY (vendor_id) REFERENCES vendor(id)
);

CREATE TABLE vendor (
    id text,
    department_id text,
    address_country text,
    address_locality text,
    address_postcode text,
    address_region text,
    alternate_name text,
    alternate_name_usage text,
    created_at text,
    currency text,
    description text,
    duns_number text,
    external_id text,
    last_reviewed_at text,
    legal_name text,
    "name" text,
    po_email text,
    primary_phone text,
    primary_phone_country text,
    remittance_email text,
    risk text,
    "status" text,
    tax_id_number text,
    tax_id_type text,
    tier text,
    updated_at timestamp,
    vat_number text,
    website_link text,
    PRIMARY KEY (id),
    FOREIGN KEY (department_id) REFERENCES department(id)
);

CREATE TABLE currency_external_data (
    id text,
    currency_id text,
    "source" text,
    PRIMARY KEY (id, currency_id),
    FOREIGN KEY (currency_id) REFERENCES currency(id)
);

CREATE TABLE currency (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE department (
    id text,
    display_name text,
    external_ids jsonb,
    hide_in_zip text,
    is_active text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE lookup (
    id text,
    display_name_fields jsonb,
    filters jsonb,
    integration_key text,
    integration_name text,
    "name" text,
    settings_fields text,
    show_in_zip text,
    PRIMARY KEY (id)
);

CREATE TABLE approval_task (
    id text,
    approval_id text,
    complete_time text,
    description text,
    "name" text,
    "status" text,
    PRIMARY KEY (id, approval_id),
    FOREIGN KEY (approval_id) REFERENCES approval(id)
);

CREATE TABLE approval (
    id text,
    assignee_id text,
    request_id text,
    requester_id text,
    complete_time text,
    config_type text,
    display_status text,
    due_date text,
    "name" text,
    node_type text,
    parent_queue_id text,
    parent_queue_level text,
    parent_queue_name text,
    queue_id text,
    queue_level text,
    queue_name text,
    sla_hours text,
    start_time timestamp,
    "status" text,
    total_pause_time_seconds text,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (assignee_id) REFERENCES users(id),
    FOREIGN KEY (request_id) REFERENCES request(id),
    FOREIGN KEY (requester_id) REFERENCES users(id)
);

CREATE TABLE vendor_credit_line_item (
    id text,
    vendor_credit_id text,
    department_id text,
    expense_category_id text,
    gl_code_id text,
    item_account_id text,
    location_id text,
    currency text,
    description text,
    end_date text,
    "name" text,
    quantity text,
    rate text,
    secondary_line_type text,
    start_date text,
    total text,
    "type" text,
    PRIMARY KEY (id, vendor_credit_id),
    FOREIGN KEY (vendor_credit_id) REFERENCES vendor_credit(id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (expense_category_id) REFERENCES expense_category(_fivetran_id),
    FOREIGN KEY (gl_code_id) REFERENCES gl_account(id),
    FOREIGN KEY (item_account_id) REFERENCES item_account(id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE vendor_credit (
    id text,
    department_id text,
    location_id text,
    subsidiary_id text,
    vendor_id text,
    amount text,
    applied_invoices jsonb,
    credit_id text,
    currency text,
    "date" text,
    description text,
    number text,
    PRIMARY KEY (id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (location_id) REFERENCES location(id),
    FOREIGN KEY (subsidiary_id) REFERENCES subsidiary(id),
    FOREIGN KEY (vendor_id) REFERENCES vendor(id)
);

CREATE TABLE lookup_option (
    id text,
    lookup_id text,
    "key" text,
    "name" text,
    show_in_zip text,
    PRIMARY KEY (id),
    FOREIGN KEY (lookup_id) REFERENCES lookup(id)
);

CREATE TABLE location_external_data (
    id text,
    location_id text,
    "source" text,
    PRIMARY KEY (id, location_id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE location (
    id text,
    "name" text,
    "status" text,
    PRIMARY KEY (id)
);

CREATE TABLE item_account_subsidiary (
    id text,
    item_account_id text,
    PRIMARY KEY (id, item_account_id),
    FOREIGN KEY (id) REFERENCES subsidiary(id),
    FOREIGN KEY (item_account_id) REFERENCES item_account(id)
);

CREATE TABLE item_account (
    id text,
    active text,
    external_id text,
    "name" text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE queue_owner (
    queue_owner_id text,
    _fivetran_id text,
    PRIMARY KEY (queue_owner_id, _fivetran_id),
    FOREIGN KEY (_fivetran_id) REFERENCES queue(_fivetran_id)
);

CREATE TABLE queue_member (
    queue_member_id text,
    _fivetran_id text,
    PRIMARY KEY (queue_member_id, _fivetran_id),
    FOREIGN KEY (_fivetran_id) REFERENCES queue(_fivetran_id)
);

CREATE TABLE queue_purchase_request_workflows_condition (
    "index" text,
    _fivetran_id text,
    attribute text,
    clause_operation text,
    condition_clause_value text,
    condition_group text,
    condition_number text,
    condition_operation text,
    currency text,
    PRIMARY KEY ("index", _fivetran_id),
    FOREIGN KEY (_fivetran_id) REFERENCES queue(_fivetran_id)
);

CREATE TABLE queue_po_change_order_workflows_condition (
    "index" text,
    _fivetran_id text,
    attribute text,
    clause_operation text,
    condition_clause_value text,
    condition_group text,
    condition_number text,
    condition_operation text,
    currency text,
    PRIMARY KEY ("index", _fivetran_id),
    FOREIGN KEY (_fivetran_id) REFERENCES queue(_fivetran_id)
);

CREATE TABLE queue_bill_approvals_and_invoice_assignment_condition (
    "index" text,
    _fivetran_id text,
    attribute text,
    clause_operation text,
    condition_clause_value text,
    condition_group text,
    condition_number text,
    condition_operation text,
    currency text,
    PRIMARY KEY ("index", _fivetran_id),
    FOREIGN KEY (_fivetran_id) REFERENCES queue(_fivetran_id)
);

CREATE TABLE queue_payout_approvals_condition (
    "index" text,
    _fivetran_id text,
    attribute text,
    clause_operation text,
    condition_clause_value text,
    condition_group text,
    condition_number text,
    condition_operation text,
    currency text,
    PRIMARY KEY ("index", _fivetran_id),
    FOREIGN KEY (_fivetran_id) REFERENCES queue(_fivetran_id)
);

CREATE TABLE queue (
    _fivetran_id text,
    default_assignee text,
    queue_id text,
    all_members_can_view_approval text,
    all_members_will_receive_approval_notification text,
    assignment_logic text,
    description text,
    group_email text,
    "name" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (default_assignee) REFERENCES users(id),
    FOREIGN KEY (queue_id) REFERENCES approval(queue_id)
);

CREATE TABLE purchase_order_attribute (
    id text,
    purchase_order_id text,
    config_id text,
    data text,
    integration_data jsonb,
    "name" text,
    PRIMARY KEY (id, purchase_order_id),
    FOREIGN KEY (purchase_order_id) REFERENCES purchase_order(id)
);

CREATE TABLE purchase_order_change (
    id text,
    purchase_order_id text,
    PRIMARY KEY (id, purchase_order_id),
    FOREIGN KEY (purchase_order_id) REFERENCES purchase_order(id)
);

CREATE TABLE purchase_order_line_item_attribute (
    id text,
    purchase_order_id text,
    config_id text,
    data text,
    integration_data_id text,
    integration_data_key text,
    integration_data_name text,
    integration_data_type text,
    "name" text,
    PRIMARY KEY (id, purchase_order_id),
    FOREIGN KEY (purchase_order_id) REFERENCES purchase_order(id)
);

CREATE TABLE purchase_order_line_item (
    id text,
    purchase_order_id text,
    department_id text,
    expense_category_id text,
    gl_code_id text,
    item_account_id text,
    location_id text,
    currency text,
    description text,
    end_date text,
    "name" text,
    quantity text,
    rate text,
    secondary_line_type text,
    start_date text,
    total text,
    "type" text,
    PRIMARY KEY (id, purchase_order_id),
    FOREIGN KEY (purchase_order_id) REFERENCES purchase_order(id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (expense_category_id) REFERENCES expense_category(_fivetran_id),
    FOREIGN KEY (gl_code_id) REFERENCES gl_account(id),
    FOREIGN KEY (item_account_id) REFERENCES item_account(id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE purchase_order_invoice (
    invoice_id text,
    purchase_order_id text,
    PRIMARY KEY (invoice_id, purchase_order_id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id),
    FOREIGN KEY (purchase_order_id) REFERENCES purchase_order(id)
);

CREATE TABLE purchase_order (
    id text,
    created_by_id text,
    department_id text,
    location_id text,
    original_request_id text,
    requester_id text,
    subsidiary_id text,
    vendor_id text,
    agreement_number text,
    amount_billed text,
    category_category_type text,
    category_id text,
    category_name text,
    category_status text,
    created_at text,
    currency text,
    description text,
    end_date text,
    external_id text,
    number text,
    payment_frequency text,
    payment_method text,
    payment_terms text,
    "source" text,
    start_date text,
    "status" text,
    subcategory_category_type text,
    subcategory_id text,
    subcategory_name text,
    subcategory_status text,
    subcategory_type text,
    total_amount text,
    version_number text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_id) REFERENCES users(id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (location_id) REFERENCES location(id),
    FOREIGN KEY (original_request_id) REFERENCES request(id),
    FOREIGN KEY (requester_id) REFERENCES users(id),
    FOREIGN KEY (subsidiary_id) REFERENCES subsidiary(id),
    FOREIGN KEY (vendor_id) REFERENCES vendor(id)
);

CREATE TABLE request_attribute (
    id text,
    request_id text,
    config_id text,
    data jsonb,
    integration_data_id text,
    integration_data_key text,
    integration_data_name text,
    integration_data_type text,
    "name" text,
    PRIMARY KEY (id, request_id),
    FOREIGN KEY (request_id) REFERENCES request(id)
);

CREATE TABLE request_attachment (
    id text,
    request_id text,
    attributes jsonb,
    "comment" text,
    execution_date text,
    expire_date text,
    "name" text,
    renewal_date text,
    "status" text,
    "type" text,
    updated_at text,
    url text,
    PRIMARY KEY (id, request_id),
    FOREIGN KEY (request_id) REFERENCES request(id)
);

CREATE TABLE request_external_data (
    id text,
    request_id text,
    external_link text,
    external_object_type text,
    "source" text,
    PRIMARY KEY (id, request_id),
    FOREIGN KEY (request_id) REFERENCES request(id)
);

CREATE TABLE request_price_line_item_attribute (
    id text,
    request_id text,
    request_price_detail_line_item_id text,
    config_id text,
    data text,
    integration_data_id text,
    integration_data_key text,
    integration_data_name text,
    integration_data_type text,
    "name" text,
    PRIMARY KEY (id, request_id, request_price_detail_line_item_id),
    FOREIGN KEY (request_id) REFERENCES request_price_detail_line_item(request_id),
    FOREIGN KEY (request_price_detail_line_item_id) REFERENCES request_price_detail_line_item(id)
);

CREATE TABLE request_price_detail_line_item (
    id text,
    request_id text,
    department_id text,
    expense_category_id text,
    gl_code_id text,
    item_account_id text,
    location_id text,
    currency text,
    description text,
    end_date text,
    "name" text,
    quantity text,
    rate text,
    secondary_line_type text,
    start_date text,
    total text,
    "type" text,
    PRIMARY KEY (id, request_id),
    FOREIGN KEY (request_id) REFERENCES request(id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (expense_category_id) REFERENCES expense_category(_fivetran_id),
    FOREIGN KEY (gl_code_id) REFERENCES gl_account(id),
    FOREIGN KEY (item_account_id) REFERENCES item_account(id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE request_price_detail_saving_line_item (
    id text,
    request_id text,
    amount text,
    currency text,
    description text,
    recognition_end_date text,
    recognition_frequency text,
    recognition_start_date text,
    saving_line_item_type text,
    PRIMARY KEY (id, request_id),
    FOREIGN KEY (request_id) REFERENCES request(id)
);

CREATE TABLE request (
    id text,
    department_id text,
    owner_id text,
    purchase_order_id text,
    requester_id text,
    subsidiary_id text,
    vendor_id text,
    workflow_id text,
    amount_usd text,
    canceled_at text,
    category_id text,
    category_name text,
    completed_at text,
    created_at text,
    description text,
    external_id text,
    initiated_at text,
    link text,
    "name" text,
    number text,
    price_detail_currency text,
    price_detail_end_date text,
    price_detail_execution_date text,
    price_detail_id text,
    price_detail_renewal_date text,
    price_detail_saving_line_items text,
    price_detail_start_date text,
    price_detail_total text,
    price_detail_total_usd text,
    "status" text,
    subcategory_id text,
    subcategory_name text,
    PRIMARY KEY (id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (owner_id) REFERENCES users(id),
    FOREIGN KEY (purchase_order_id) REFERENCES purchase_order(id),
    FOREIGN KEY (requester_id) REFERENCES users(id),
    FOREIGN KEY (subsidiary_id) REFERENCES subsidiary(id),
    FOREIGN KEY (vendor_id) REFERENCES vendor(id),
    FOREIGN KEY (workflow_id) REFERENCES workflow(id)
);

CREATE TABLE audit_log (
    id text,
    user_id text,
    accessed_from text,
    data jsonb,
    description text,
    event_type text,
    timestamps text,
    user_ip_address text,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE invoice_applied_vendor_credit (
    id text,
    invoice_id text,
    currency_id text,
    amount text,
    credit_id text,
    "date" text,
    external_id text,
    number text,
    PRIMARY KEY (id, invoice_id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id),
    FOREIGN KEY (currency_id) REFERENCES currency(id)
);

CREATE TABLE invoice_purchase_order (
    invoice_id text,
    purchase_order_id text,
    PRIMARY KEY (invoice_id, purchase_order_id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id),
    FOREIGN KEY (purchase_order_id) REFERENCES purchase_order(id)
);

CREATE TABLE invoice_payout (
    invoice_id text,
    payout_id text,
    PRIMARY KEY (invoice_id, payout_id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id),
    FOREIGN KEY (payout_id) REFERENCES payout(id)
);

CREATE TABLE invoice_line_item_attribute (
    id text,
    invoice_id text,
    invoice_line_item_id text,
    config_id text,
    data text,
    integration_data text,
    "name" text,
    PRIMARY KEY (id, invoice_id, invoice_line_item_id),
    FOREIGN KEY (invoice_id) REFERENCES invoice_line_item(invoice_id),
    FOREIGN KEY (invoice_line_item_id) REFERENCES invoice_line_item(id)
);

CREATE TABLE invoice_line_item_tax_code (
    id text,
    invoice_id text,
    invoice_line_item_id text,
    PRIMARY KEY (id, invoice_id, invoice_line_item_id),
    FOREIGN KEY (id) REFERENCES tax_code(id),
    FOREIGN KEY (invoice_id) REFERENCES invoice_line_item(invoice_id),
    FOREIGN KEY (invoice_line_item_id) REFERENCES invoice_line_item(id)
);

CREATE TABLE invoice_line_item (
    id text,
    invoice_id text,
    department_id text,
    expense_category_id text,
    gl_code_id text,
    item_account_id text,
    location_id text,
    amortization_schedule_end_date text,
    amortization_schedule_name text,
    amortization_schedule_start_date text,
    currency text,
    description text,
    end_date text,
    matched_purchase_order_line_item_id text,
    "name" text,
    quantity text,
    rate text,
    secondary_line_type text,
    start_date text,
    total text,
    "type" text,
    PRIMARY KEY (id, invoice_id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (expense_category_id) REFERENCES expense_category(_fivetran_id),
    FOREIGN KEY (gl_code_id) REFERENCES gl_account(id),
    FOREIGN KEY (item_account_id) REFERENCES item_account(id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE invoice_payment_method_external_data (
    id text,
    invoice_id text,
    "source" text,
    PRIMARY KEY (id, invoice_id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id)
);

CREATE TABLE invoice_approval (
    "index" text,
    invoice_id text,
    id text,
    PRIMARY KEY ("index", invoice_id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id),
    FOREIGN KEY (id) REFERENCES approval(id)
);

CREATE TABLE invoice (
    id text,
    department_id text,
    location_id text,
    payment_method_id text,
    subsidiary_id text,
    vendor_id text,
    amount text,
    attributes jsonb,
    created_at text,
    currency text,
    description text,
    due_date text,
    external_id text,
    invoice_date text,
    misc_amount text,
    number text,
    payment_terms jsonb,
    posting_period_id text,
    posting_period_name text,
    shipping_amount text,
    "source" text,
    "status" text,
    tax_amount text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (location_id) REFERENCES location(id),
    FOREIGN KEY (payment_method_id) REFERENCES payment_method(id),
    FOREIGN KEY (subsidiary_id) REFERENCES subsidiary(id),
    FOREIGN KEY (vendor_id) REFERENCES vendor(id)
);

CREATE TABLE payment_method_external_data (
    id text,
    payment_method_id text,
    payment_method_invoice_id text,
    "source" text,
    PRIMARY KEY (id, payment_method_id, payment_method_invoice_id),
    FOREIGN KEY (payment_method_id) REFERENCES payment_method(id),
    FOREIGN KEY (payment_method_invoice_id) REFERENCES payment_method(invoice_id)
);

CREATE TABLE payment_method (
    id text,
    invoice_id text,
    vendor_id text,
    country text,
    is_approved text,
    is_deleted text,
    is_deleted_by_vendor text,
    payment_file_format_id text,
    payment_file_format_name text,
    payment_method text,
    updated_at text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id, invoice_id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id),
    FOREIGN KEY (vendor_id) REFERENCES vendor(id)
);

CREATE TABLE tax_code (
    id text,
    active text,
    city text,
    country text,
    county text,
    description text,
    display_name text,
    external_data jsonb,
    external_id text,
    "name" text,
    rate text,
    "state" text,
    tax_code_type text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE payout (
    id text,
    invoice_id text,
    subsidiary_id text,
    vendor_id text,
    account_id text,
    account_name text,
    currency text,
    fx_rate text,
    paid_on_date text,
    payment_provider_creation_time text,
    reference_id text,
    PRIMARY KEY (id, invoice_id),
    FOREIGN KEY (invoice_id) REFERENCES invoice_payout(invoice_id),
    FOREIGN KEY (subsidiary_id) REFERENCES subsidiary(id),
    FOREIGN KEY (vendor_id) REFERENCES vendor(id)
);

CREATE TABLE expense_category_subsidiary (
    _fivetran_id text,
    subsidiary_id text,
    PRIMARY KEY (_fivetran_id, subsidiary_id),
    FOREIGN KEY (_fivetran_id) REFERENCES expense_category(_fivetran_id),
    FOREIGN KEY (subsidiary_id) REFERENCES subsidiary(id)
);

CREATE TABLE expense_category (
    _fivetran_id text,
    gl_code_id text,
    active text,
    description text,
    "name" text,
    "source" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (gl_code_id) REFERENCES gl_account(id)
);
