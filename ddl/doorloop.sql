CREATE TABLE vendor_bill_line (
    id text,
    vendor_bill_id text,
    account_id text,
    linked_resource_id text,
    property_id text,
    unit_id text,
    amount text,
    balance text,
    memo text,
    PRIMARY KEY (id, vendor_bill_id),
    FOREIGN KEY (vendor_bill_id) REFERENCES vendor_bill(id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (linked_resource_id) REFERENCES property(id),
    FOREIGN KEY (property_id) REFERENCES property(id),
    FOREIGN KEY (unit_id) REFERENCES unit(id)
);

CREATE TABLE vendor_bill (
    id text,
    created_by_id text,
    updated_by_id text,
    vendor_id text,
    batch text,
    created_at text,
    "date" text,
    due_date text,
    memo text,
    reference text,
    register jsonb,
    total_amount text,
    total_balance text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_id) REFERENCES users(id),
    FOREIGN KEY (updated_by_id) REFERENCES users(id),
    FOREIGN KEY (vendor_id) REFERENCES vendor(id)
);

CREATE TABLE lease_reversed_payment_line (
    id text,
    lease_reversed_payment_id text,
    account_id text,
    amount text,
    balance text,
    memo text,
    PRIMARY KEY (id, lease_reversed_payment_id),
    FOREIGN KEY (lease_reversed_payment_id) REFERENCES lease_reversed_payment(id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE lease_reversed_payment (
    id text,
    lease_id text,
    lease_payment_id text,
    batch text,
    created_at text,
    "date" text,
    deposit_status text,
    memo text,
    processor_fee text,
    reference text,
    register jsonb,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (lease_id) REFERENCES lease(id),
    FOREIGN KEY (lease_payment_id) REFERENCES lease_payment(id)
);

CREATE TABLE report_cash_flow_statement (
    _fivetran_id text,
    account_id text,
    parent_account_id text,
    abs_total_with_sub_accounts text,
    group_by text,
    root_account text,
    total text,
    total_with_sub_accounts text,
    "type" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (parent_account_id) REFERENCES account(id)
);

CREATE TABLE owner_email (
    "index" text,
    owner_id text,
    address text,
    "type" text,
    PRIMARY KEY ("index", owner_id),
    FOREIGN KEY (owner_id) REFERENCES owner(id)
);

CREATE TABLE owner_phone (
    "index" text,
    owner_id text,
    number text,
    "type" text,
    PRIMARY KEY ("index", owner_id),
    FOREIGN KEY (owner_id) REFERENCES owner(id)
);

CREATE TABLE owner (
    id text,
    created_by_id text,
    updated_by_id text,
    active text,
    company text,
    company_name text,
    created_at text,
    date_of_birth text,
    federal_tax_info_address_city text,
    federal_tax_info_address_country text,
    federal_tax_info_address_for_1099_same_as_primary_address text,
    federal_tax_info_address_latitude text,
    federal_tax_info_address_longitude text,
    federal_tax_info_address_street_1 text,
    federal_tax_info_address_street_2 text,
    federal_tax_info_address_zip text,
    federal_tax_info_payer_id text,
    federal_tax_info_payer_name text,
    first_name text,
    full_name text,
    gender text,
    job_title text,
    last_name text,
    management_end_date text,
    management_start_date text,
    middle_name text,
    "name" text,
    notes text,
    picture_url text,
    portal_info_allow_access text,
    portal_info_login_email text,
    portal_info_mobile_phone text,
    primary_address_city text,
    primary_address_country text,
    primary_address_latitude text,
    primary_address_longitude text,
    primary_address_street_1 text,
    primary_address_street_2 text,
    primary_address_zip text,
    properties jsonb,
    timezone text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_id) REFERENCES users(id),
    FOREIGN KEY (updated_by_id) REFERENCES users(id)
);

CREATE TABLE default_account_for (
    "index" text,
    account_id text,
    account_action text,
    PRIMARY KEY ("index", account_id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE account (
    id text,
    created_by_id text,
    updated_by_id text,
    active text,
    cash_flow_activity text,
    class text,
    created_at text,
    description text,
    fully_qualified_name text,
    "name" text,
    system_account text,
    "type" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_id) REFERENCES users(id),
    FOREIGN KEY (updated_by_id) REFERENCES users(id)
);

CREATE TABLE lease_charge_line (
    id text,
    lease_charge_id text,
    account_id text,
    amount text,
    balance text,
    memo text,
    PRIMARY KEY (id, lease_charge_id),
    FOREIGN KEY (lease_charge_id) REFERENCES lease_charge(id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE lease_charge (
    id text,
    created_by_id text,
    lease_id text,
    updated_by_id text,
    batch text,
    created_at text,
    "date" text,
    last_late_fees_processed_date text,
    memo text,
    recurring_transaction text,
    reference text,
    register jsonb,
    total_amount text,
    total_balance text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_id) REFERENCES users(id),
    FOREIGN KEY (lease_id) REFERENCES lease(id),
    FOREIGN KEY (updated_by_id) REFERENCES users(id)
);

CREATE TABLE task_assigned_to_user (
    assigned_to_user_id text,
    task_id text,
    PRIMARY KEY (assigned_to_user_id, task_id),
    FOREIGN KEY (assigned_to_user_id) REFERENCES users(id),
    FOREIGN KEY (task_id) REFERENCES task(id)
);

CREATE TABLE task (
    id text,
    created_by_id text,
    linked_resource_id text,
    property_id text,
    requested_by_owner_id text,
    requested_by_tenant_id text,
    requested_by_user_id text,
    unit_id text,
    updated_by_id text,
    vendor_bill_id text,
    vendor_id text,
    work_order_assigned_vendor_id text,
    work_order_vendor_bill_id text,
    completed_at text,
    created_at text,
    date_type text,
    description text,
    due_date text,
    entry_notes text,
    entry_permission text,
    notify_assignees text,
    notify_tenant text,
    priority text,
    reference text,
    "status" text,
    subject text,
    "type" text,
    updated_at text,
    work_order_approved_by_owner text,
    work_order_billed text,
    work_order_instructions_to_vendor text,
    work_order_vendor_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_id) REFERENCES users(id),
    FOREIGN KEY (linked_resource_id) REFERENCES unit(id),
    FOREIGN KEY (property_id) REFERENCES property(id),
    FOREIGN KEY (requested_by_owner_id) REFERENCES owner(id),
    FOREIGN KEY (requested_by_tenant_id) REFERENCES tenant(id),
    FOREIGN KEY (requested_by_user_id) REFERENCES users(id),
    FOREIGN KEY (unit_id) REFERENCES unit(id),
    FOREIGN KEY (updated_by_id) REFERENCES users(id),
    FOREIGN KEY (vendor_bill_id) REFERENCES vendor_bill(id),
    FOREIGN KEY (vendor_id) REFERENCES vendor(id),
    FOREIGN KEY (work_order_assigned_vendor_id) REFERENCES vendor(id),
    FOREIGN KEY (work_order_vendor_bill_id) REFERENCES vendor_bill(id)
);

CREATE TABLE unit_picture (
    "index" text,
    unit_id text,
    rank text,
    url text,
    PRIMARY KEY ("index", unit_id),
    FOREIGN KEY (unit_id) REFERENCES unit(id)
);

CREATE TABLE unit_amenity (
    "index" text,
    unit_id text,
    amenity text,
    PRIMARY KEY ("index", unit_id),
    FOREIGN KEY (unit_id) REFERENCES unit(id)
);

CREATE TABLE unit (
    id text,
    created_by_id text,
    property_id text,
    updated_by_id text,
    active text,
    active_listing text,
    address_city text,
    address_country text,
    address_latitude text,
    address_longitude text,
    address_same_as_property text,
    address_street_1 text,
    address_street_2 text,
    address_zip text,
    batch text,
    baths text,
    beds text,
    created_at text,
    description text,
    in_eviction text,
    listing_contact text,
    listing_date_available text,
    listing_deposit text,
    listing_lease_length text,
    listing_listing text,
    listing_rent text,
    market_rent text,
    "name" text,
    "size" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_id) REFERENCES users(id),
    FOREIGN KEY (property_id) REFERENCES property(id),
    FOREIGN KEY (updated_by_id) REFERENCES users(id)
);

CREATE TABLE property_owner (
    "index" text,
    property_id text,
    user_id text,
    ownership_percentage text,
    PRIMARY KEY ("index", property_id),
    FOREIGN KEY (property_id) REFERENCES property(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE property_picture (
    file_id text,
    property_id text,
    rank text,
    url text,
    PRIMARY KEY (file_id, property_id),
    FOREIGN KEY (property_id) REFERENCES property(id)
);

CREATE TABLE property_amenity (
    "index" text,
    property_id text,
    amenity text,
    PRIMARY KEY ("index", property_id),
    FOREIGN KEY (property_id) REFERENCES property(id)
);

CREATE TABLE property_setting (
    "name" text,
    property_id text,
    "value" text,
    PRIMARY KEY ("name", property_id),
    FOREIGN KEY (property_id) REFERENCES property(id)
);

CREATE TABLE property (
    id text,
    created_by_id text,
    updated_by_id text,
    active text,
    address_city text,
    address_country text,
    address_latitude text,
    address_longitude text,
    address_street_1 text,
    address_street_2 text,
    address_zip text,
    batch text,
    class text,
    created_at text,
    description text,
    "name" text,
    num_active_units text,
    "type" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_id) REFERENCES users(id),
    FOREIGN KEY (updated_by_id) REFERENCES users(id)
);

CREATE TABLE report_rent_roll_picture (
    id text,
    _fivetran_id text,
    file text,
    rank text,
    url text,
    PRIMARY KEY (id, _fivetran_id),
    FOREIGN KEY (_fivetran_id) REFERENCES report_rent_roll(_fivetran_id)
);

CREATE TABLE report_rent_roll (
    _fivetran_id text,
    lease_id text,
    next_lease_id text,
    property_id text,
    unit_id text,
    active text,
    baths text,
    beds text,
    end_date text,
    last_payment_amount text,
    last_payment_date text,
    last_returned_payment_amount text,
    last_returned_payment_date text,
    market_rent text,
    occupied text,
    renewal_stage text,
    rent_per_size text,
    rollover_to_at_will text,
    "size" text,
    "start" text,
    term text,
    total_balance_due text,
    total_deposits_held text,
    total_recurring_charges text,
    total_recurring_credits text,
    total_recurring_payments text,
    total_recurring_rent text,
    -- custom_* (dynamic column),
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (lease_id) REFERENCES lease(id),
    FOREIGN KEY (next_lease_id) REFERENCES lease(id),
    FOREIGN KEY (property_id) REFERENCES property(id),
    FOREIGN KEY (unit_id) REFERENCES unit(id)
);

CREATE TABLE user_email (
    "index" text,
    user_id text,
    address text,
    "type" text,
    PRIMARY KEY ("index", user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE user_phone (
    "index" text,
    user_id text,
    number text,
    "type" text,
    PRIMARY KEY ("index", user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    created_by_id text,
    updated_by_id text,
    active text,
    bank_accounts jsonb,
    company text,
    company_name text,
    created_at text,
    date_of_birth text,
    first_name text,
    full_name text,
    gender text,
    invitation_last_sent_at text,
    job_title text,
    last_name text,
    last_seen_at text,
    login_email text,
    middle_name text,
    "name" text,
    notes text,
    owner text,
    picture_url text,
    primary_address_city text,
    primary_address_country text,
    primary_address_latitude text,
    primary_address_longitude text,
    primary_address_street_1 text,
    primary_address_street_2 text,
    primary_address_zip text,
    properties jsonb,
    property_groups jsonb,
    "role" text,
    "status" text,
    timezone text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_id) REFERENCES users(id),
    FOREIGN KEY (updated_by_id) REFERENCES users(id)
);

CREATE TABLE communication_clicked_at (
    "index" text,
    communication_id text,
    clicked_at text,
    PRIMARY KEY ("index", communication_id),
    FOREIGN KEY (communication_id) REFERENCES communication(id)
);

CREATE TABLE communication_opened_at (
    "index" text,
    communication_id text,
    opened_at text,
    PRIMARY KEY ("index", communication_id),
    FOREIGN KEY (communication_id) REFERENCES communication(id)
);

CREATE TABLE communication_bcc (
    communication_id text,
    linked_to_id text,
    address text,
    display_name text,
    PRIMARY KEY (communication_id, linked_to_id),
    FOREIGN KEY (communication_id) REFERENCES communication(id),
    FOREIGN KEY (linked_to_id) REFERENCES users(id)
);

CREATE TABLE communication_cc (
    communication_id text,
    linked_to_id text,
    address text,
    display_name text,
    PRIMARY KEY (communication_id, linked_to_id),
    FOREIGN KEY (communication_id) REFERENCES communication(id),
    FOREIGN KEY (linked_to_id) REFERENCES users(id)
);

CREATE TABLE communication_to (
    communication_id text,
    linked_to_id text,
    address text,
    display_name text,
    PRIMARY KEY (communication_id, linked_to_id),
    FOREIGN KEY (communication_id) REFERENCES communication(id),
    FOREIGN KEY (linked_to_id) REFERENCES users(id)
);

CREATE TABLE communication (
    id text,
    announcement text,
    body_html text,
    body_preview text,
    bounced_at text,
    created_at text,
    external_id text,
    from_address text,
    from_display_name text,
    from_linked_to_type text,
    sent_at text,
    "status" text,
    subject text,
    thread_id text,
    "type" text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE report_balance_sheet_summary (
    _fivetran_id text,
    account_id text,
    parent_account_id text,
    abs_total_with_sub_accounts text,
    group_by text,
    root_account text,
    total text,
    total_with_sub_accounts text,
    "type" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (parent_account_id) REFERENCES account(id)
);

CREATE TABLE report_profit_and_loss_summary (
    _fivetran_id text,
    account_id text,
    parent_account_id text,
    abs_total_with_sub_accounts text,
    group_by text,
    root_account text,
    total text,
    total_with_sub_accounts text,
    "type" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (parent_account_id) REFERENCES account(id)
);

CREATE TABLE lease_credit_line (
    id text,
    lease_credit_id text,
    account_id text,
    amount text,
    balance text,
    memo text,
    PRIMARY KEY (id, lease_credit_id),
    FOREIGN KEY (lease_credit_id) REFERENCES lease_credit(id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE lease_credit (
    id text,
    created_by_id text,
    lease_id text,
    updated_by_id text,
    batch text,
    created_at text,
    "date" text,
    memo text,
    reference text,
    register jsonb,
    total_amount text,
    total_balance text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_id) REFERENCES users(id),
    FOREIGN KEY (lease_id) REFERENCES lease(id),
    FOREIGN KEY (updated_by_id) REFERENCES users(id)
);

CREATE TABLE lease_tenant_unit (
    lease_tenant_id text,
    unit_id text,
    PRIMARY KEY (lease_tenant_id, unit_id),
    FOREIGN KEY (lease_tenant_id) REFERENCES lease_tenant(id),
    FOREIGN KEY (unit_id) REFERENCES unit(id)
);

CREATE TABLE lease_tenant (
    id text,
    lease_id text,
    property_id text,
    tenant_id text,
    move_in_at text,
    move_out_at text,
    move_out_notice_at text,
    "name" text,
    portal_enabled text,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (lease_id) REFERENCES lease(id),
    FOREIGN KEY (property_id) REFERENCES property(id),
    FOREIGN KEY (tenant_id) REFERENCES tenant(id)
);

CREATE TABLE note_tag (
    "index" text,
    note_id text,
    tags text,
    PRIMARY KEY ("index", note_id),
    FOREIGN KEY (note_id) REFERENCES note(id)
);

CREATE TABLE note (
    id text,
    linked_resource_id text,
    body text,
    created_at text,
    created_by text,
    linked_resource_type text,
    title text,
    PRIMARY KEY (id),
    FOREIGN KEY (linked_resource_id) REFERENCES task(id)
);

CREATE TABLE portfolio_property (
    portfolio_id text,
    property_id text,
    PRIMARY KEY (portfolio_id, property_id),
    FOREIGN KEY (portfolio_id) REFERENCES portfolio(id),
    FOREIGN KEY (property_id) REFERENCES property(id)
);

CREATE TABLE portfolio (
    id text,
    created_by_id text,
    updated_by_id text,
    created_at text,
    "name" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_id) REFERENCES users(id),
    FOREIGN KEY (updated_by_id) REFERENCES users(id)
);

CREATE TABLE vendor_credit_line (
    id text,
    vendor_credit_id text,
    account_id text,
    linked_resource_id text,
    amount text,
    balance text,
    memo text,
    PRIMARY KEY (id, vendor_credit_id),
    FOREIGN KEY (vendor_credit_id) REFERENCES vendor_credit(id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (linked_resource_id) REFERENCES property(id)
);

CREATE TABLE vendor_credit (
    id text,
    vendor_id text,
    batch text,
    "date" text,
    due_date text,
    memo text,
    reference text,
    total_amount text,
    total_balance text,
    PRIMARY KEY (id),
    FOREIGN KEY (vendor_id) REFERENCES vendor(id)
);

CREATE TABLE tenant_dependant (
    "index" text,
    tenant_id text,
    date_of_birth text,
    first_name text,
    last_name text,
    middle_name text,
    relationship text,
    PRIMARY KEY ("index", tenant_id),
    FOREIGN KEY (tenant_id) REFERENCES tenant(id)
);

CREATE TABLE tenant_email (
    "index" text,
    tenant_id text,
    address text,
    "type" text,
    PRIMARY KEY ("index", tenant_id),
    FOREIGN KEY (tenant_id) REFERENCES tenant(id)
);

CREATE TABLE tenant_emergency_contact (
    "index" text,
    tenant_id text,
    email text,
    "name" text,
    phone text,
    relationship text,
    PRIMARY KEY ("index", tenant_id),
    FOREIGN KEY (tenant_id) REFERENCES tenant(id)
);

CREATE TABLE tenant_pet (
    "index" text,
    tenant_id text,
    age text,
    breed text,
    color text,
    gender text,
    is_service_animal text,
    is_spayed_or_neutered text,
    "name" text,
    notes text,
    "type" text,
    weight text,
    PRIMARY KEY ("index", tenant_id),
    FOREIGN KEY (tenant_id) REFERENCES tenant(id)
);

CREATE TABLE tenant_phone (
    "index" text,
    tenant_id text,
    number text,
    "type" text,
    PRIMARY KEY ("index", tenant_id),
    FOREIGN KEY (tenant_id) REFERENCES tenant(id)
);

CREATE TABLE tenant_prospect_info_interest (
    property_id text,
    tenant_id text,
    unit_id text,
    PRIMARY KEY (property_id, tenant_id, unit_id),
    FOREIGN KEY (property_id) REFERENCES property(id),
    FOREIGN KEY (tenant_id) REFERENCES tenant(id),
    FOREIGN KEY (unit_id) REFERENCES unit(id)
);

CREATE TABLE tenant_vehicle (
    "index" text,
    tenant_id text,
    color text,
    license_platae text,
    make text,
    model text,
    notes text,
    "state" text,
    "year" text,
    PRIMARY KEY ("index", tenant_id),
    FOREIGN KEY (tenant_id) REFERENCES tenant(id)
);

CREATE TABLE tenant_unit (
    tenant_id text,
    unit_id text,
    PRIMARY KEY (tenant_id, unit_id),
    FOREIGN KEY (tenant_id) REFERENCES tenant(id),
    FOREIGN KEY (unit_id) REFERENCES unit(id)
);

CREATE TABLE tenant (
    id text,
    created_by_id text,
    updated_by_id text,
    batch text,
    company text,
    company_name text,
    created_at text,
    date_of_birth text,
    first_name text,
    gender text,
    job_title text,
    last_name text,
    middle_name text,
    "name" text,
    notes text,
    picture_url text,
    portal_info_allow_access text,
    portal_info_invitation_last_sent_at text,
    portal_info_last_seen_at text,
    portal_info_login_email text,
    portal_info_mobile_phone text,
    portal_info_status text,
    primary_address_city text,
    primary_address_country text,
    primary_address_latitude text,
    primary_address_longitude text,
    primary_address_street_1 text,
    primary_address_street_2 text,
    primary_address_zip text,
    prospect_info_assigned_to_user text,
    prospect_info_campaign_content text,
    prospect_info_campaign_medium text,
    prospect_info_campaign_name text,
    prospect_info_campaign_source text,
    prospect_info_campaign_term text,
    prospect_info_credit_score text,
    prospect_info_expected_move_in_date text,
    prospect_info_lead_source text,
    prospect_info_max_rent text,
    prospect_info_min_bathrooms text,
    prospect_info_min_bedrooms text,
    prospect_info_monthly_income text,
    prospect_info_next_task_date text,
    prospect_info_status text,
    timezone text,
    "type" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_id) REFERENCES users(id),
    FOREIGN KEY (updated_by_id) REFERENCES users(id)
);

CREATE TABLE lease_payment_linked_charge (
    "index" text,
    lease_payment_id text,
    account_id text,
    amount text,
    linked_transaction text,
    linked_transaction_line text,
    PRIMARY KEY ("index", lease_payment_id),
    FOREIGN KEY (lease_payment_id) REFERENCES lease_payment(id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE lease_payment_e_pay (
    "name" text,
    lease_payment_id text,
    "value" text,
    PRIMARY KEY ("name", lease_payment_id),
    FOREIGN KEY (lease_payment_id) REFERENCES lease_payment(id)
);

CREATE TABLE lease_payment (
    id text,
    created_by_id text,
    deposit_to_account_id text,
    lease_id text,
    received_from_tenant_id text,
    updated_by_id text,
    amount_applied_to_charges text,
    amount_applied_to_credits text,
    amount_not_applied_to_charges text,
    amount_received text,
    auto_apply_payment_on_charges text,
    auto_deposit text,
    check_info jsonb,
    created_at text,
    deposit_entry text,
    deposit_status text,
    is_files_shared_with_tenant text,
    linked_credits jsonb,
    payment_method text,
    reference text,
    register jsonb,
    reversed_payment text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_id) REFERENCES users(id),
    FOREIGN KEY (deposit_to_account_id) REFERENCES tenant(id),
    FOREIGN KEY (lease_id) REFERENCES lease(id),
    FOREIGN KEY (received_from_tenant_id) REFERENCES tenant(id),
    FOREIGN KEY (updated_by_id) REFERENCES users(id)
);

CREATE TABLE lease_unit (
    lease_id text,
    unit_id text,
    PRIMARY KEY (lease_id, unit_id),
    FOREIGN KEY (lease_id) REFERENCES lease(id),
    FOREIGN KEY (unit_id) REFERENCES unit(id)
);

CREATE TABLE lease_renewal_history (
    "index" text,
    lease_id text,
    unit_id text,
    new_rent text,
    previous_rent text,
    renewal_date text,
    PRIMARY KEY ("index", lease_id),
    FOREIGN KEY (lease_id) REFERENCES lease(id),
    FOREIGN KEY (unit_id) REFERENCES unit(id)
);

CREATE TABLE lease_setting (
    "name" text,
    lease_id text,
    "value" text,
    PRIMARY KEY ("name", lease_id),
    FOREIGN KEY (lease_id) REFERENCES lease(id)
);

CREATE TABLE lease (
    id text,
    created_by_id text,
    property_id text,
    updated_by_id text,
    created_at text,
    ends text,
    evicton_pending text,
    last_late_fees_processed_date text,
    "name" text,
    notes text,
    proof_of_insurance_required text,
    recurring_rent_frequency text,
    reference text,
    renewal_stage text,
    rollover_to_at_will text,
    "start" text,
    "status" text,
    term text,
    total_balance_due text,
    total_deposits_held text,
    total_recurring_charges text,
    total_recurring_credits text,
    total_recurring_payments text,
    total_recurring_rent text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_id) REFERENCES users(id),
    FOREIGN KEY (property_id) REFERENCES property(id),
    FOREIGN KEY (updated_by_id) REFERENCES users(id)
);

CREATE TABLE expense_line (
    id text,
    expense_id text,
    account_id text,
    linked_resource_id text,
    property_id text,
    amount text,
    balance text,
    PRIMARY KEY (id, expense_id),
    FOREIGN KEY (expense_id) REFERENCES expense(id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (linked_resource_id) REFERENCES property(id),
    FOREIGN KEY (property_id) REFERENCES property(id)
);

CREATE TABLE expense_register (
    "index" text,
    expense_id text,
    cleared text,
    plaid_transaction text,
    PRIMARY KEY ("index", expense_id),
    FOREIGN KEY (expense_id) REFERENCES expense(id)
);

CREATE TABLE expense (
    id text,
    created_by_id text,
    updated_by_id text,
    batch text,
    check_info jsonb,
    created_at text,
    "date" text,
    memo text,
    pay_from_account text,
    pay_to_resource_id text,
    pay_to_resource_type text,
    payment_method text,
    recurring_transaction text,
    reference text,
    register jsonb,
    total_amount text,
    total_balance text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_id) REFERENCES users(id),
    FOREIGN KEY (updated_by_id) REFERENCES users(id)
);

CREATE TABLE vendor_email (
    "index" text,
    vendor_id text,
    address text,
    "type" text,
    PRIMARY KEY ("index", vendor_id),
    FOREIGN KEY (vendor_id) REFERENCES vendor(id)
);

CREATE TABLE vendor_phone (
    "index" text,
    vendor_id text,
    number text,
    "type" text,
    PRIMARY KEY ("index", vendor_id),
    FOREIGN KEY (vendor_id) REFERENCES vendor(id)
);

CREATE TABLE vendor_property (
    property_id text,
    vendor_id text,
    PRIMARY KEY (property_id, vendor_id),
    FOREIGN KEY (property_id) REFERENCES property(id),
    FOREIGN KEY (vendor_id) REFERENCES vendor(id)
);

CREATE TABLE vendor (
    id text,
    created_by_id text,
    updated_by_id text,
    active text,
    balance text,
    company text,
    company_name text,
    created_at text,
    date_of_birth text,
    federal_tax_info_address_city text,
    federal_tax_info_address_country text,
    federal_tax_info_address_for_1099_same_as_primary_address text,
    federal_tax_info_address_latitude text,
    federal_tax_info_address_longitude text,
    federal_tax_info_address_street_1 text,
    federal_tax_info_address_street_2 text,
    federal_tax_info_address_zip text,
    federal_tax_info_payer_id text,
    federal_tax_info_payer_name text,
    first_name text,
    full_name text,
    gender text,
    insurance_info_coverage text,
    insurance_info_effective_date text,
    insurance_info_expiration_date text,
    insurance_info_policy_number text,
    insurance_info_provider text,
    job_title text,
    last_name text,
    management_end_date text,
    management_start_date text,
    middle_name text,
    "name" text,
    notes text,
    picture_url text,
    primary_address_city text,
    primary_address_country text,
    primary_address_latitude text,
    primary_address_longitude text,
    primary_address_street_1 text,
    primary_address_street_2 text,
    primary_address_zip text,
    timezone text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_id) REFERENCES users(id),
    FOREIGN KEY (updated_by_id) REFERENCES users(id)
);
