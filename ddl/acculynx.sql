CREATE TABLE contact_email_address (
    id text,
    contact_id text,
    address text,
    is_primary text,
    "type" text,
    PRIMARY KEY (id, contact_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE contact_phone_number (
    id text,
    contact_id text,
    ext text,
    is_primary text,
    number text,
    "type" text,
    PRIMARY KEY (id, contact_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE contact (
    id text,
    billing_address_city text,
    billing_address_country_abbreviation text,
    billing_address_country_id text,
    billing_address_country_name text,
    billing_address_state_abbreviation text,
    billing_address_state_id text,
    billing_address_state_name text,
    billing_address_street_1 text,
    billing_address_street_2 text,
    billing_address_zip_code text,
    company_name text,
    cross_reference text,
    first_name text,
    last_name text,
    mailing_address_city text,
    mailing_address_country_abbreviation text,
    mailing_address_country_id text,
    mailing_address_country_name text,
    mailing_address_state_abbreviation text,
    mailing_address_state_id text,
    mailing_address_state_name text,
    mailing_address_street_1 text,
    mailing_address_street_2 text,
    mailing_address_zip_code text,
    salutation text,
    PRIMARY KEY (id)
);

CREATE TABLE estimate_section_item (
    id text,
    estimate_id text,
    estimate_section_id text,
    description text,
    estimate_unit text,
    fixed_price text,
    labour_cost text,
    material_cost text,
    measurement_quantity text,
    "name" text,
    order_quantity text,
    order_unit text,
    override_name text,
    price text,
    quantity text,
    selected_unit text,
    total_price text,
    "type" text,
    unit_coversion text,
    waste text,
    PRIMARY KEY (id, estimate_id, estimate_section_id),
    FOREIGN KEY (estimate_id) REFERENCES estimate_section(estimate_id),
    FOREIGN KEY (estimate_section_id) REFERENCES estimate_section(id)
);

CREATE TABLE estimate_section (
    id text,
    estimate_id text,
    created_by_id text,
    modified_by_id text,
    created_date text,
    description text,
    modified_date text,
    profit_margin_rate text,
    profit_margin_total text,
    section_financial_overhead_rate text,
    section_financial_overhead_total text,
    section_financial_profit_rate text,
    section_financial_profit_total text,
    section_financial_tax_rate text,
    section_financial_tax_total text,
    section_financial_total_cost text,
    section_financial_total_price text,
    title text,
    PRIMARY KEY (id, estimate_id),
    FOREIGN KEY (estimate_id) REFERENCES estimate(id),
    FOREIGN KEY (created_by_id) REFERENCES users(id),
    FOREIGN KEY (modified_by_id) REFERENCES users(id)
);

CREATE TABLE company_setting (
    company_id text,
    has_insurance text,
    "name" text,
    time_zone_info_adjusted_utc_offset text,
    time_zone_info_base_utc_offset text,
    time_zone_info_daylight_name text,
    time_zone_info_name text,
    time_zone_info_supports_daylight_saving text,
    PRIMARY KEY (company_id)
);

CREATE TABLE calendar_appointment (
    end_date text,
    id text,
    start_date text,
    calendar_id text,
    all_day text,
    event_type text,
    job_name text,
    location text,
    notes text,
    title text,
    PRIMARY KEY (end_date, id, start_date, calendar_id),
    FOREIGN KEY (calendar_id) REFERENCES calendar(id)
);

CREATE TABLE calendar (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE users (
    id text,
    display_name text,
    email text,
    employee_id text,
    first_name text,
    initial text,
    last_name text,
    mobile_phone text,
    phone text,
    role_id text,
    role_name text,
    "status" text,
    PRIMARY KEY (id)
);

CREATE TABLE company_lead_source_child (
    id text,
    lead_source_id text,
    "name" text,
    PRIMARY KEY (id, lead_source_id),
    FOREIGN KEY (lead_source_id) REFERENCES company_lead_source(id)
);

CREATE TABLE company_lead_source (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE estimate (
    id text,
    created_by_id text,
    job_id text,
    modified_by_id text,
    created_date text,
    description text,
    estimate_number text,
    financial_overhead_rate text,
    financial_overhead_total text,
    financial_profit_rate text,
    financial_profit_total text,
    financial_tax_rate text,
    financial_tax_total text,
    financial_total_cost text,
    financial_total_price text,
    is_primary text,
    modified_date text,
    note text,
    profit_margin_rate text,
    profit_margin_total text,
    title text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_id) REFERENCES users(id),
    FOREIGN KEY (job_id) REFERENCES job(id),
    FOREIGN KEY (modified_by_id) REFERENCES users(id)
);

CREATE TABLE job_contact_email_address (
    id text,
    job_contact_id text,
    job_id text,
    PRIMARY KEY (id, job_contact_id, job_id),
    FOREIGN KEY (job_contact_id) REFERENCES job_contact(id),
    FOREIGN KEY (job_id) REFERENCES job_contact(job_id)
);

CREATE TABLE job_contact_phone_number (
    id text,
    job_contact_id text,
    job_id text,
    PRIMARY KEY (id, job_contact_id, job_id),
    FOREIGN KEY (job_contact_id) REFERENCES job_contact(id),
    FOREIGN KEY (job_id) REFERENCES job_contact(job_id)
);

CREATE TABLE job_contact (
    id text,
    job_id text,
    contact_guid text,
    is_primary text,
    relation_to_primary text,
    PRIMARY KEY (id, job_id),
    FOREIGN KEY (id) REFERENCES contact(id),
    FOREIGN KEY (job_id) REFERENCES job(id)
);

CREATE TABLE job_trade_type (
    id text,
    job_id text,
    "name" text,
    PRIMARY KEY (id, job_id),
    FOREIGN KEY (job_id) REFERENCES job(id)
);

CREATE TABLE job (
    id text,
    lead_source_id text,
    created_date text,
    current_milestone text,
    geo_location_latitude text,
    geo_location_longitude text,
    job_category_id text,
    job_category_name text,
    job_name text,
    job_number text,
    lead_dead_reason text,
    location_address_city text,
    location_address_country_abbreviation text,
    location_address_country_id text,
    location_address_country_name text,
    location_address_state_abbreviation text,
    location_address_state_id text,
    location_address_state_name text,
    location_address_street_1 text,
    location_address_street_2 text,
    location_address_zip_code text,
    milestone_date text,
    modified_date timestamp,
    work_type_id text,
    work_type_name text,
    work_type_system_default text,
    PRIMARY KEY (id),
    FOREIGN KEY (lead_source_id) REFERENCES company_lead_source(id)
);

CREATE TABLE lead_history (
    _fivetran_id text,
    job_id text,
    "action" text,
    created_by_id text,
    created_by_link text,
    "date" text,
    lead_dead_reason text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (job_id) REFERENCES job(id)
);

CREATE TABLE financial_worksheet (
    id text,
    financial_id text,
    job_id text,
    PRIMARY KEY (id, financial_id, job_id),
    FOREIGN KEY (financial_id) REFERENCES financial(id),
    FOREIGN KEY (job_id) REFERENCES financial(job_id)
);

CREATE TABLE financial_amendment (
    id text,
    financial_id text,
    job_id text,
    PRIMARY KEY (id, financial_id, job_id),
    FOREIGN KEY (financial_id) REFERENCES financial(id),
    FOREIGN KEY (job_id) REFERENCES financial(job_id)
);

CREATE TABLE financial (
    id text,
    job_id text,
    approved_job_value text,
    balance_due text,
    worksheet_id text,
    worksheet_section_total_change_order_total text,
    worksheet_section_total_discount_total text,
    worksheet_section_total_financial_total text,
    worksheet_section_total_insurance_claim_total text,
    worksheet_section_total_supplement_total text,
    worksheet_section_total_upgrade_total text,
    worksheet_section_total_work_not_doing_total text,
    PRIMARY KEY (id, job_id),
    FOREIGN KEY (job_id) REFERENCES job(id)
);

CREATE TABLE milestone_history (
    _fivetran_id text,
    job_id text,
    "date" text,
    "name" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (job_id) REFERENCES job(id)
);

CREATE TABLE invoice_section_item (
    id text,
    invoice_id text,
    invoice_section_id text,
    job_id text,
    parent_item_id text,
    hierarchy_sort_order text,
    item_name text,
    line_item_assignment text,
    price text,
    total_price text,
    PRIMARY KEY (id, invoice_id, invoice_section_id, job_id),
    FOREIGN KEY (invoice_id) REFERENCES invoice_section(invoice_id),
    FOREIGN KEY (invoice_section_id) REFERENCES invoice_section(id),
    FOREIGN KEY (job_id) REFERENCES invoice_section(job_id),
    FOREIGN KEY (parent_item_id) REFERENCES invoice_section_item(id)
);

CREATE TABLE invoice_section (
    id text,
    invoice_id text,
    job_id text,
    invoice_worksheet_section_type text,
    total_price text,
    PRIMARY KEY (id, invoice_id, job_id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id),
    FOREIGN KEY (job_id) REFERENCES invoice(job_id)
);

CREATE TABLE invoice (
    id text,
    job_id text,
    balance_due text,
    created_date text,
    current_invoice_state text,
    due_date text,
    invoice_date text,
    invoice_name text,
    invoice_number text,
    invoice_sequence text,
    recording_classification text,
    recording_status text,
    sort_index text,
    total_price text,
    PRIMARY KEY (id, job_id),
    FOREIGN KEY (job_id) REFERENCES job(id)
);
