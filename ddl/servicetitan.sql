CREATE TABLE form_submission_owner (
    id text,
    form_submission_id text,
    "type" text,
    PRIMARY KEY (id, form_submission_id),
    FOREIGN KEY (form_submission_id) REFERENCES form_submission(id)
);

CREATE TABLE form_submission_unit_sub_unit (
    id text,
    form_submission_id text,
    form_submission_unit_section_id text,
    attachments jsonb,
    "comment" text,
    "name" text,
    "option" text,
    "type" text,
    "value" text,
    values jsonb,
    PRIMARY KEY (id, form_submission_id, form_submission_unit_section_id),
    FOREIGN KEY (form_submission_id) REFERENCES form_submission_unit_section(form_submission_id),
    FOREIGN KEY (form_submission_unit_section_id) REFERENCES form_submission_unit_section(id)
);

CREATE TABLE form_submission_unit_section (
    id text,
    form_submission_id text,
    attachments jsonb,
    "comment" text,
    description text,
    "name" text,
    "option" text,
    "type" text,
    "value" text,
    values jsonb,
    PRIMARY KEY (id, form_submission_id),
    FOREIGN KEY (form_submission_id) REFERENCES form_submission(id)
);

CREATE TABLE form_submission (
    id text,
    created_by_id text,
    form_id text,
    form_name text,
    "status" text,
    submitted_on text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_id) REFERENCES employee(id)
);

CREATE TABLE booking (
    id text,
    business_unit_id text,
    campaign_id text,
    job_id text,
    job_type_id text,
    active text,
    address_city text,
    address_country text,
    address_state text,
    address_street text,
    address_unit text,
    address_zip text,
    booking_provider_id text,
    created_on text,
    customer_type jsonb,
    dismissing_reason_id text,
    external_id text,
    is_first_time_client text,
    is_send_confirmation_email text,
    modified_on timestamp,
    "name" text,
    priority text,
    "source" text,
    "start" text,
    "status" text,
    summary text,
    uploaded_image jsonb,
    PRIMARY KEY (id),
    FOREIGN KEY (business_unit_id) REFERENCES business_unit(id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (job_id) REFERENCES job(id),
    FOREIGN KEY (job_type_id) REFERENCES job_type(id)
);

CREATE TABLE project_status (
    id text,
    modified_on timestamp,
    "name" text,
    orders text,
    PRIMARY KEY (id)
);

CREATE TABLE project (
    id text,
    customer_id text,
    location_id text,
    status_id text,
    sub_status_id text,
    active text,
    actual_completion_date text,
    business_unit_ids jsonb,
    created_on text,
    job_id jsonb,
    modified_on timestamp,
    "name" text,
    number text,
    project_manager_id jsonb,
    project_type_id text,
    start_date text,
    "status" text,
    sub_status text,
    summary text,
    target_completion_date text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (location_id) REFERENCES location(id),
    FOREIGN KEY (status_id) REFERENCES project_status(id),
    FOREIGN KEY (sub_status_id) REFERENCES project_sub_status(id)
);

CREATE TABLE appointment (
    id text,
    customer_id text,
    job_id text,
    active text,
    appointment_number text,
    arrival_window_end text,
    arrival_window_start text,
    created_by_id text,
    created_on text,
    ends text,
    is_confirmed text,
    modified_on timestamp,
    special_instruction text,
    "start" text,
    "status" text,
    unused text,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (job_id) REFERENCES job(id)
);

CREATE TABLE employee (
    id text,
    business_unit_id text,
    aad_user_id text,
    active text,
    created_on text,
    custom_fields jsonb,
    email text,
    login_name text,
    modified_on timestamp,
    "name" text,
    "role" text,
    role_id jsonb,
    user_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (business_unit_id) REFERENCES business_unit(id)
);

CREATE TABLE job_canceled_log (
    id text,
    created_by_id text,
    job_id text,
    reason_id text,
    active text,
    created_on text,
    memo text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_id) REFERENCES employee(id),
    FOREIGN KEY (job_id) REFERENCES job(id),
    FOREIGN KEY (reason_id) REFERENCES job_cancel_reason(id)
);

CREATE TABLE zone_zip (
    "index" text,
    zone_id text,
    zip text,
    PRIMARY KEY ("index", zone_id),
    FOREIGN KEY (zone_id) REFERENCES "zone"(id)
);

CREATE TABLE zone_city (
    "index" text,
    zone_id text,
    city text,
    PRIMARY KEY ("index", zone_id),
    FOREIGN KEY (zone_id) REFERENCES "zone"(id)
);

CREATE TABLE zone_territory_number (
    "index" text,
    zone_id text,
    territory_number text,
    PRIMARY KEY ("index", zone_id),
    FOREIGN KEY (zone_id) REFERENCES "zone"(id)
);

CREATE TABLE zone_locn_number (
    "index" text,
    zone_id text,
    locn_number text,
    PRIMARY KEY ("index", zone_id),
    FOREIGN KEY (zone_id) REFERENCES "zone"(id)
);

CREATE TABLE zone_service_day (
    "index" text,
    zone_id text,
    service_day text,
    PRIMARY KEY ("index", zone_id),
    FOREIGN KEY (zone_id) REFERENCES "zone"(id)
);

CREATE TABLE zone_business_unit (
    "index" text,
    zone_id text,
    business_unit text,
    PRIMARY KEY ("index", zone_id),
    FOREIGN KEY (zone_id) REFERENCES "zone"(id)
);

CREATE TABLE zone_technician (
    "index" text,
    zone_id text,
    technician text,
    PRIMARY KEY ("index", zone_id),
    FOREIGN KEY (zone_id) REFERENCES "zone"(id)
);

CREATE TABLE "zone" (
    id text,
    created_by text,
    active text,
    created_on text,
    modified_on text,
    "name" text,
    service_days_enabled text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES employee(id)
);

CREATE TABLE estimate_item (
    id text,
    estimate_id text,
    created_on text,
    description text,
    item_group_name text,
    item_group_root_id text,
    membership_type_id text,
    modified_on text,
    qty text,
    sku_account text,
    sku_display_name text,
    sku_general_ledger_account_id text,
    sku_general_ledger_account_name text,
    sku_id text,
    sku_modified_on text,
    sku_name text,
    sku_sold_hours text,
    sku_type text,
    total text,
    total_cost text,
    unit_cost text,
    unit_rate text,
    PRIMARY KEY (id, estimate_id),
    FOREIGN KEY (estimate_id) REFERENCES estimate(id)
);

CREATE TABLE estimate_external_link (
    "index" text,
    estimate_id text,
    "name" text,
    url text,
    PRIMARY KEY ("index", estimate_id),
    FOREIGN KEY (estimate_id) REFERENCES estimate(id)
);

CREATE TABLE estimate (
    id text,
    business_unit_id text,
    customer_id text,
    job_id text,
    location_id text,
    project_id text,
    active text,
    business_unit_name text,
    created_on text,
    modified_on timestamp,
    "name" text,
    sold_by text,
    sold_on text,
    status_name text,
    status_value text,
    subtotal text,
    summary text,
    PRIMARY KEY (id),
    FOREIGN KEY (business_unit_id) REFERENCES business_unit(id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (job_id) REFERENCES job(id),
    FOREIGN KEY (location_id) REFERENCES location(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE campaign_cost (
    id text,
    campaign_id text,
    daily_cost text,
    "month" text,
    "year" text,
    PRIMARY KEY (id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id)
);

CREATE TABLE payment_applied_to (
    applied_id text,
    applied_by text,
    payment_id text,
    applied_amount text,
    applied_on text,
    applied_to text,
    PRIMARY KEY (applied_id),
    FOREIGN KEY (applied_by) REFERENCES employee(login_name),
    FOREIGN KEY (payment_id) REFERENCES payment(id)
);

CREATE TABLE payment (
    id text,
    created_by text,
    customer_id text,
    active text,
    auth_code text,
    batch_id text,
    batch_name text,
    batch_number text,
    check_number text,
    created_on text,
    "date" text,
    general_ledger_account_detail_type text,
    general_ledger_account_id text,
    general_ledger_account_name text,
    general_ledger_account_number text,
    general_ledger_account_type text,
    memo text,
    modified_on timestamp,
    reference_number text,
    sync_status text,
    total text,
    "type" text,
    type_id text,
    unapplied_amount text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES employee(login_name),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE job_cancel_reason (
    id text,
    active text,
    created_on text,
    modified_on text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE task_priority (
    "name" text,
    PRIMARY KEY ("name")
);

CREATE TABLE task_resolution_type (
    "name" text,
    PRIMARY KEY ("name")
);

CREATE TABLE task_status (
    "name" text,
    PRIMARY KEY ("name")
);

CREATE TABLE task_type (
    id text,
    active text,
    excluded_task_resolution_id jsonb,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE task_source (
    id text,
    active text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE task_resolution (
    id text,
    active text,
    excluded_task_type_id jsonb,
    "name" text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE call_reason (
    id text,
    active text,
    created_on text,
    is_lead text,
    modified_on text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE appointment_assignment (
    id text,
    technician_id text,
    appointment_id text,
    job_id text,
    active text,
    assigned_by_id text,
    assigned_on text,
    is_paused text,
    "status" text,
    technician_name text,
    PRIMARY KEY (id, technician_id),
    FOREIGN KEY (technician_id) REFERENCES technician(id),
    FOREIGN KEY (appointment_id) REFERENCES appointment(id),
    FOREIGN KEY (job_id) REFERENCES job(id)
);

CREATE TABLE job_hold_reason (
    id text,
    active text,
    created_on text,
    modified_on timestamp,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE campaign_category (
    id text,
    active text,
    created_on text,
    "name" text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE business_unit (
    id text,
    account_code text,
    acknowledgement_paragraph text,
    active text,
    address_city text,
    address_country text,
    address_state text,
    address_street text,
    address_unit text,
    address_zip text,
    authorization_paragraph text,
    concept_code text,
    corporate_contract_number text,
    created_on text,
    currency text,
    default_tax_rate text,
    email text,
    franchise_id text,
    invoice_header text,
    invoice_message text,
    material_sku text,
    modified_on timestamp,
    "name" text,
    official_name text,
    phone_number text,
    quickbooks_class text,
    tenant_account_code text,
    tenant_concept_code text,
    tenant_franchise_id text,
    tenant_id text,
    tenant_modified_on text,
    tenant_name text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE invoice_item (
    id text,
    business_unit_id text,
    invoice_id text,
    active text,
    asset_account_detail_type text,
    asset_account_id text,
    asset_account_name text,
    asset_account_number text,
    asset_account_type text,
    cost text,
    cost_of_sale_account_detail_type text,
    cost_of_sale_account_id text,
    cost_of_sale_account_name text,
    cost_of_sale_account_number text,
    cost_of_sale_account_type text,
    description text,
    display_name text,
    general_ledger_account_detail_type text,
    general_ledger_account_id text,
    general_ledger_account_name text,
    general_ledger_account_number text,
    general_ledger_account_type text,
    inventory text,
    inventory_location text,
    item_group_name text,
    item_group_root_id text,
    membership_type_id text,
    modified_on timestamp,
    orders text,
    price text,
    quantity text,
    service_date text,
    sku_id text,
    sku_name text,
    sold_hours text,
    taxable text,
    total text,
    total_cost text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (business_unit_id) REFERENCES business_unit(id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id)
);

CREATE TABLE purchase_order_item_serial_number (
    id text,
    purchase_order_id text,
    purchase_order_item_id text,
    number text,
    PRIMARY KEY (id, purchase_order_id, purchase_order_item_id),
    FOREIGN KEY (purchase_order_id) REFERENCES purchase_order_item(purchase_order_id),
    FOREIGN KEY (purchase_order_item_id) REFERENCES purchase_order_item(id)
);

CREATE TABLE purchase_order_item (
    id text,
    purchase_order_id text,
    budget_code_id text,
    chargeable text,
    cost text,
    created_on text,
    description text,
    modified_on text,
    quantity text,
    quantity_received text,
    sku_code text,
    sku_id text,
    sku_name text,
    sku_type text,
    "status" text,
    total text,
    vendor_part_number text,
    PRIMARY KEY (id, purchase_order_id),
    FOREIGN KEY (purchase_order_id) REFERENCES purchase_order(id)
);

CREATE TABLE purchase_order_custom_field (
    "index" text,
    purchase_order_id text,
    "name" text,
    type_id text,
    "value" text,
    PRIMARY KEY ("index", purchase_order_id),
    FOREIGN KEY (purchase_order_id) REFERENCES purchase_order(id)
);

CREATE TABLE purchase_order (
    id text,
    business_unit_id text,
    invoice_id text,
    job_id text,
    project_id text,
    technician_id text,
    active text,
    batch_id text,
    budget_code_id text,
    created_on text,
    "date" text,
    inventory_location_id text,
    modified_on text,
    number text,
    received_on text,
    required_on text,
    sent_on text,
    ship_to_city text,
    ship_to_country text,
    ship_to_state text,
    ship_to_street text,
    ship_to_unit text,
    ship_to_zip text,
    shipping text,
    "status" text,
    summary text,
    tax text,
    total text,
    type_id text,
    vendor_document_number text,
    vendor_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (business_unit_id) REFERENCES business_unit(id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id),
    FOREIGN KEY (job_id) REFERENCES job(id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (technician_id) REFERENCES technician(id)
);

CREATE TABLE timesheet_code (
    id text,
    active text,
    applicable_employee_type text,
    code text,
    created_on text,
    custom_hourly_rate text,
    description text,
    hourly_rate text,
    modified_on text,
    rate_multiplier text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE payroll_adjustment (
    id text,
    employee_id text,
    invoice_id text,
    active text,
    activity_code_id text,
    amount text,
    created_on text,
    employee_type text,
    hours text,
    memo text,
    modified_on text,
    posted_on text,
    rate text,
    PRIMARY KEY (id),
    FOREIGN KEY (employee_id) REFERENCES employee(id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id)
);

CREATE TABLE campaign_phone_number (
    phone_number text,
    campaign_id text,
    PRIMARY KEY (phone_number, campaign_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id)
);

CREATE TABLE campaign (
    id text,
    category_id text,
    active text,
    business_unit text,
    category_active text,
    category_name text,
    created_on text,
    medium text,
    modified_on timestamp,
    "name" text,
    other_medium text,
    other_source text,
    "source" text,
    PRIMARY KEY (id),
    FOREIGN KEY (category_id) REFERENCES campaign_category(id)
);

CREATE TABLE payroll (
    id text,
    employee_id text,
    active text,
    burden_rate text,
    created_on text,
    employee_type text,
    ended_on text,
    manager_approved_on text,
    modified_on text,
    started_on text,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (employee_id) REFERENCES employee(id)
);

CREATE TABLE job (
    id text,
    booking_id text,
    business_unit_id text,
    campaign_id text,
    created_by_id text,
    customer_id text,
    first_appointment_id text,
    job_type_id text,
    last_appointment_id text,
    location_id text,
    project_id text,
    active text,
    appointment_count text,
    completed_on text,
    created_from_estimate_id text,
    created_on text,
    customer_po text,
    estimate_id jsonb,
    invoice_id text,
    job_generated_lead_source_employee_id text,
    job_generated_lead_source_job_id text,
    job_number text,
    job_status text,
    lead_call_id text,
    membership_id text,
    modified_on timestamp,
    no_charge text,
    notifications_enabled text,
    partner_lead_call_id text,
    priority text,
    recall_for_id text,
    sold_by_id text,
    summary text,
    tag_type_id jsonb,
    total text,
    warranty_id text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (booking_id) REFERENCES booking(id),
    FOREIGN KEY (business_unit_id) REFERENCES business_unit(id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (created_by_id) REFERENCES employee(id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (first_appointment_id) REFERENCES appointment(id),
    FOREIGN KEY (job_type_id) REFERENCES job_type(id),
    FOREIGN KEY (last_appointment_id) REFERENCES appointment(id),
    FOREIGN KEY (location_id) REFERENCES location(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE job_type_skill (
    "index" text,
    job_type_id text,
    skill text,
    PRIMARY KEY ("index", job_type_id),
    FOREIGN KEY (job_type_id) REFERENCES job_type(id)
);

CREATE TABLE job_type_business_unit_id (
    "index" text,
    job_type_id text,
    id text,
    PRIMARY KEY ("index", job_type_id),
    FOREIGN KEY (job_type_id) REFERENCES job_type(id),
    FOREIGN KEY (id) REFERENCES business_unit(id)
);

CREATE TABLE job_type (
    id text,
    active text,
    class text,
    duration text,
    enforce_recurring_service_event_selection text,
    invoice_signature_required text,
    modified_on timestamp,
    "name" text,
    no_charge text,
    priority text,
    sold_threshold text,
    summary text,
    tag_type_id jsonb,
    -- custom_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE tag_type (
    id text,
    active text,
    allow_to_use_on_timesheet_activity text,
    code text,
    color text,
    created_on text,
    importance jsonb,
    is_conversion_opportunity text,
    modified_on text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE membership (
    id text,
    business_unit_id text,
    created_by_id text,
    customer_id text,
    location_id text,
    membership_type_id text,
    activated_by_id text,
    activated_from_id text,
    active text,
    billing_frequency text,
    billing_template_id text,
    cancellation_balance_invoice_id text,
    cancellation_date text,
    cancellation_invoice_id text,
    created_on text,
    customer_po text,
    duration text,
    follow_up_custom_status_id text,
    follow_up_on text,
    follow_up_status text,
    from_date text,
    import_id text,
    initial_deferred_revenue text,
    memo text,
    modified_on text,
    next_scheduled_bill_date text,
    payment_method_id text,
    payment_type_id text,
    recurring_location_id text,
    renewal_billing_frequency text,
    renewal_duration text,
    renewal_membership_task_id text,
    renewed_by_id text,
    sold_by_id text,
    "status" text,
    to_date text,
    PRIMARY KEY (id),
    FOREIGN KEY (business_unit_id) REFERENCES business_unit(id),
    FOREIGN KEY (created_by_id) REFERENCES employee(id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (location_id) REFERENCES location(id),
    FOREIGN KEY (membership_type_id) REFERENCES membership_type(id)
);

CREATE TABLE job_split (
    id text,
    job_id text,
    technician_id text,
    active text,
    created_on text,
    modified_on timestamp,
    split text,
    PRIMARY KEY (id),
    FOREIGN KEY (job_id) REFERENCES job(id),
    FOREIGN KEY (technician_id) REFERENCES technician(id)
);

CREATE TABLE membership_type_billing_duration (
    "index" text,
    membership_type_id text,
    billing_frequency jsonb,
    duration text,
    PRIMARY KEY ("index", membership_type_id),
    FOREIGN KEY (membership_type_id) REFERENCES membership_type(id)
);

CREATE TABLE membership_type (
    id text,
    created_by_id text,
    active text,
    auto_calculate_invoice_template text,
    billing_template_id text,
    created_on text,
    discount_mode jsonb,
    display_name text,
    import_id text,
    location_target jsonb,
    modified_on text,
    "name" text,
    revenue_recognition_mode jsonb,
    show_membership_saving text,
    use_membership_pricing_table text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_id) REFERENCES employee(id)
);

CREATE TABLE technician (
    id text,
    business_unit_id text,
    aad_user_id text,
    active text,
    burden_rate text,
    created_on text,
    custom_fields jsonb,
    daily_goal text,
    email text,
    home_city text,
    home_country text,
    home_latitude text,
    home_longitude text,
    home_state text,
    home_street text,
    home_street_address text,
    home_unit text,
    home_zip text,
    is_managed_tech text,
    login_name text,
    main_zone_id text,
    modified_on timestamp,
    "name" text,
    phone_number text,
    role_id jsonb,
    team text,
    user_id text,
    zone_id jsonb,
    PRIMARY KEY (id),
    FOREIGN KEY (business_unit_id) REFERENCES business_unit(id)
);

CREATE TABLE team (
    id text,
    created_by text,
    active text,
    created_on text,
    modified_on text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES employee(id)
);

CREATE TABLE customer_contact (
    id text,
    customer_id text,
    active text,
    memo text,
    modified_on timestamp,
    phone_settings_do_not_text text,
    phone_settings_phone_number text,
    "type" text,
    "value" text,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE lead (
    id text,
    booking_id text,
    business_unit_id text,
    call_id text,
    campaign_id text,
    created_by_id text,
    customer_id text,
    job_type_id text,
    location_id text,
    active text,
    call_reason_id text,
    capture_source text,
    created_on text,
    dismissing_reason_id text,
    follow_up_date text,
    lead_city text,
    lead_country text,
    lead_customer_name text,
    lead_email text,
    lead_phone text,
    lead_state text,
    lead_street text,
    lead_unit text,
    lead_url text,
    lead_zip text,
    manual_call_id text,
    modified_on timestamp,
    priority text,
    "status" text,
    summary text,
    tag_type_id jsonb,
    PRIMARY KEY (id),
    FOREIGN KEY (booking_id) REFERENCES booking(id),
    FOREIGN KEY (business_unit_id) REFERENCES business_unit(id),
    FOREIGN KEY (call_id) REFERENCES "call"(id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (created_by_id) REFERENCES employee(id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (job_type_id) REFERENCES job_type(id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE non_job_appointment (
    id text,
    created_by_id text,
    technician_id text,
    active text,
    all_day text,
    clear_dispatch_board text,
    clear_technician_view text,
    created_on text,
    duration text,
    "name" text,
    remove_technician_from_capacity_planning text,
    "start" text,
    summary text,
    timesheet_code_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_id) REFERENCES employee(id),
    FOREIGN KEY (technician_id) REFERENCES technician(id)
);

CREATE TABLE "call" (
    id text,
    lead_call_id text,
    business_unit_id text,
    campaign_id text,
    job_number text,
    lead_call_customer_id text,
    lead_call_reason_id text,
    project_id text,
    lead_call_active text,
    lead_call_agent_external_id text,
    lead_call_agent_id text,
    lead_call_agent_name text,
    lead_call_call_type text,
    lead_call_created_by text,
    lead_call_created_on text,
    lead_call_direction text,
    lead_call_duration text,
    lead_call_from text,
    lead_call_modified_on text,
    lead_call_reason text,
    lead_call_received_on text,
    lead_call_recording_url text,
    lead_call_to text,
    lead_call_voice_mail_url text,
    type_id text,
    type_modified_on text,
    type_name text,
    PRIMARY KEY (id, lead_call_id),
    FOREIGN KEY (business_unit_id) REFERENCES business_unit(id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (job_number) REFERENCES job(id),
    FOREIGN KEY (lead_call_customer_id) REFERENCES customer(id),
    FOREIGN KEY (lead_call_reason_id) REFERENCES call_reason(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE timesheet (
    id text,
    appointment_id text,
    job_id text,
    technician_id text,
    active text,
    arrived_on text,
    canceled_on text,
    created_on text,
    dispatched_on text,
    done_on text,
    modified_on text,
    PRIMARY KEY (id),
    FOREIGN KEY (appointment_id) REFERENCES appointment(id),
    FOREIGN KEY (job_id) REFERENCES job(id),
    FOREIGN KEY (technician_id) REFERENCES technician(id)
);

CREATE TABLE inventory_bill_item (
    orders text,
    sku_id text,
    inventory_bill_id text,
    asset_account_detail_type text,
    asset_account_id text,
    asset_account_name text,
    asset_account_number text,
    asset_account_type text,
    budget_code_id text,
    cost text,
    cost_of_sale_account_detail_type text,
    cost_of_sale_account_id text,
    cost_of_sale_account_name text,
    cost_of_sale_account_number text,
    cost_of_sale_account_type text,
    description text,
    general_ledger_account_detail_type text,
    general_ledger_account_id text,
    general_ledger_account_name text,
    general_ledger_account_number text,
    general_ledger_account_type text,
    id text,
    inventory_location text,
    "name" text,
    quantity text,
    receipt_item_id text,
    serial_number text,
    sku_code text,
    sku_type text,
    PRIMARY KEY (orders, sku_id, inventory_bill_id),
    FOREIGN KEY (inventory_bill_id) REFERENCES inventory_bill(id)
);

CREATE TABLE inventory_bill (
    id text,
    business_unit_id text,
    created_by text,
    job_id text,
    active text,
    batch_id text,
    batch_name text,
    batch_number text,
    bill_amount text,
    bill_date text,
    budget_code_id text,
    created_on text,
    due_date text,
    job_number text,
    modified_on text,
    post_date text,
    purchase_order_id text,
    reference_number text,
    ship_to_city text,
    ship_to_country text,
    ship_to_description text,
    ship_to_state text,
    ship_to_street text,
    ship_to_unit text,
    ship_to_zip text,
    shipping_amount text,
    summary text,
    sync_status text,
    tax_amount text,
    tax_zone text,
    term_name text,
    vendor_id text,
    vendor_name text,
    vendor_number text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (business_unit_id) REFERENCES business_unit(id),
    FOREIGN KEY (created_by) REFERENCES employee("name"),
    FOREIGN KEY (job_id) REFERENCES job(id)
);

CREATE TABLE project_sub_status (
    id text,
    status_id text,
    modified_on timestamp,
    "name" text,
    orders text,
    PRIMARY KEY (id),
    FOREIGN KEY (status_id) REFERENCES project_status(id)
);

CREATE TABLE location (
    id text,
    customer_id text,
    created_by_id text,
    zone_id text,
    active text,
    address_city text,
    address_country text,
    address_latitude text,
    address_longitude text,
    address_state text,
    address_street text,
    address_unit text,
    address_zip text,
    created_on text,
    merged_to_id text,
    modified_on timestamp,
    "name" text,
    tag_type_id jsonb,
    tax_zone_id text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id, customer_id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (created_by_id) REFERENCES employee(id),
    FOREIGN KEY (zone_id) REFERENCES "zone"(id)
);

CREATE TABLE invoice (
    id text,
    business_unit_id text,
    customer_id text,
    employee_id text,
    job_id text,
    location_id text,
    project_id text,
    active text,
    adjustment_to_id text,
    balance text,
    batch_id text,
    batch_name text,
    batch_number text,
    commission_eligibility_date text,
    created_by text,
    created_on text,
    custom_fields jsonb,
    deposited_on text,
    due_date text,
    employee_modified_on text,
    invoice_date text,
    invoice_type_id text,
    invoice_type_name text,
    items text,
    job_type text,
    modified_on timestamp,
    reference_number text,
    royalty_date text,
    royalty_memo text,
    royalty_sent_on text,
    royalty_status text,
    sales_tax text,
    sales_tax_code_id text,
    sales_tax_code_name text,
    sales_tax_code_rate text,
    sub_total text,
    summary text,
    sync_status text,
    term_name text,
    total text,
    PRIMARY KEY (id),
    FOREIGN KEY (business_unit_id) REFERENCES business_unit(id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (employee_id) REFERENCES employee(id),
    FOREIGN KEY (job_id) REFERENCES job(id),
    FOREIGN KEY (location_id) REFERENCES location(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE location_contact (
    id text,
    location_id text,
    active text,
    created_on text,
    memo text,
    modified_on timestamp,
    phone_settings_do_not_text text,
    phone_settings_phone_number text,
    preference text,
    "type" text,
    "value" text,
    PRIMARY KEY (id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE customer (
    id text,
    created_by_id text,
    active text,
    balance text,
    created_on text,
    do_not_mail text,
    do_not_service text,
    merged_to_id text,
    modified_on timestamp,
    "name" text,
    tag_type_id jsonb,
    "type" text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_id) REFERENCES employee(id)
);
