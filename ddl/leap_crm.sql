CREATE TABLE sub_contractor_additional_phone (
    "index" text,
    sub_contractor_id text,
    ext text,
    label text,
    phone text,
    PRIMARY KEY ("index", sub_contractor_id),
    FOREIGN KEY (sub_contractor_id) REFERENCES sub_contractor(id)
);

CREATE TABLE sub_contractor_trade (
    id text,
    sub_contractor_id text,
    PRIMARY KEY (id, sub_contractor_id),
    FOREIGN KEY (id) REFERENCES company_trade(id),
    FOREIGN KEY (sub_contractor_id) REFERENCES sub_contractor(id)
);

CREATE TABLE sub_contractor_work_type (
    id text,
    sub_contractor_id text,
    trade_id text,
    color text,
    "name" text,
    PRIMARY KEY (id, sub_contractor_id),
    FOREIGN KEY (sub_contractor_id) REFERENCES sub_contractor(id),
    FOREIGN KEY (trade_id) REFERENCES company_trade(id)
);

CREATE TABLE sub_contractor (
    id text,
    address text,
    address_line_1 text,
    city text,
    color text,
    company_name text,
    country_code text,
    country_currency_name text,
    country_currency_symbol text,
    country_id text,
    country_name text,
    country_phone_code text,
    created_at text,
    email text,
    first_name text,
    group_id text,
    is_active text,
    last_name text,
    note text,
    profile_pic text,
    rating text,
    state_code text,
    state_country_id text,
    state_id text,
    state_name text,
    updated_at text,
    zip text,
    PRIMARY KEY (id)
);

CREATE TABLE referral (
    id text,
    created_at text,
    "name" text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE supplier (
    id text,
    created_at text,
    "name" text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE division (
    id text,
    address text,
    address_country_code text,
    address_country_id text,
    address_country_name text,
    address_id text,
    address_line_1 text,
    address_state_code text,
    address_state_id text,
    address_state_name text,
    city text,
    color text,
    email text,
    lat text,
    long text,
    "name" text,
    phone text,
    phone_ext text,
    zip text,
    PRIMARY KEY (id)
);

CREATE TABLE item_category (
    id text,
    created_at text,
    is_default text,
    locked text,
    "name" text,
    slug text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE schedule_trade (
    id text,
    schedule_id text,
    PRIMARY KEY (id, schedule_id),
    FOREIGN KEY (id) REFERENCES company_trade(id),
    FOREIGN KEY (schedule_id) REFERENCES schedule(id)
);

CREATE TABLE schedule_work_crew_note (
    id text,
    schedule_id text,
    job_id text,
    note text,
    PRIMARY KEY (id, schedule_id),
    FOREIGN KEY (schedule_id) REFERENCES schedule(id),
    FOREIGN KEY (job_id) REFERENCES job(id)
);

CREATE TABLE schedule_reminder (
    id text,
    schedule_id text,
    minutes text,
    "type" text,
    PRIMARY KEY (id, schedule_id),
    FOREIGN KEY (schedule_id) REFERENCES schedule(id)
);

CREATE TABLE schedule_work_type (
    id text,
    schedule_id text,
    trade_id text,
    color text,
    "name" text,
    PRIMARY KEY (id, schedule_id),
    FOREIGN KEY (schedule_id) REFERENCES schedule(id),
    FOREIGN KEY (trade_id) REFERENCES company_trade(id)
);

CREATE TABLE schedule_sub_contractor (
    id text,
    schedule_id text,
    PRIMARY KEY (id, schedule_id),
    FOREIGN KEY (id) REFERENCES sub_contractor(id),
    FOREIGN KEY (schedule_id) REFERENCES schedule(id)
);

CREATE TABLE schedule_representative (
    id text,
    schedule_id text,
    PRIMARY KEY (id, schedule_id),
    FOREIGN KEY (id) REFERENCES users(id),
    FOREIGN KEY (schedule_id) REFERENCES schedule(id)
);

CREATE TABLE schedule (
    id text,
    created_by text,
    customer_id text,
    job_id text,
    modified_by text,
    created_at text,
    description text,
    end_date_time text,
    full_day text,
    is_completed text,
    is_recurring text,
    occurence text,
    "repeat" text,
    series_id text,
    start_date_time text,
    subject_edited text,
    title text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (job_id) REFERENCES job(id),
    FOREIGN KEY (modified_by) REFERENCES users(id)
);

CREATE TABLE company_trade_work_type (
    id text,
    company_trade_id text,
    color text,
    "name" text,
    PRIMARY KEY (id, company_trade_id),
    FOREIGN KEY (company_trade_id) REFERENCES company_trade(id)
);

CREATE TABLE company_trade_sub_attribute (
    id text,
    company_trade_attribute_id text,
    company_trade_id text,
    locked text,
    "name" text,
    slug text,
    unit_display_name text,
    unit_id text,
    unit_name text,
    PRIMARY KEY (id, company_trade_attribute_id, company_trade_id),
    FOREIGN KEY (company_trade_attribute_id) REFERENCES company_trade_attribute(id),
    FOREIGN KEY (company_trade_id) REFERENCES company_trade(id)
);

CREATE TABLE company_trade_attribute (
    id text,
    company_trade_id text,
    locked text,
    "name" text,
    slug text,
    PRIMARY KEY (id, company_trade_id),
    FOREIGN KEY (company_trade_id) REFERENCES company_trade(id)
);

CREATE TABLE company_trade (
    id text,
    color text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE payment_method (
    id text,
    label text,
    method text,
    quickbook_id text,
    PRIMARY KEY (id)
);

CREATE TABLE workflow_stage (
    id text,
    code text,
    color text,
    created_at_date text,
    created_at_timezone text,
    created_at_timezone_type text,
    description text,
    jobs_count text,
    locked text,
    "name" text,
    "position" text,
    updated_at_date text,
    updated_at_timezone text,
    updated_at_timezone_type text,
    workflow_id text,
    PRIMARY KEY (id)
);

CREATE TABLE user_role (
    "index" text,
    user_id text,
    "name" text,
    PRIMARY KEY ("index", user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    active text,
    added_date text,
    admin_privilege text,
    color text,
    company text,
    company_id text,
    company_name text,
    email text,
    first_name text,
    group_id text,
    group_name text,
    last_name text,
    profile_pic text,
    PRIMARY KEY (id)
);

CREATE TABLE appointment_job (
    appointment_id text,
    id text,
    PRIMARY KEY (appointment_id, id),
    FOREIGN KEY (appointment_id) REFERENCES appointment(id),
    FOREIGN KEY (id) REFERENCES job(id)
);

CREATE TABLE appointment_reminder (
    id text,
    appointment_id text,
    minutes text,
    "type" text,
    PRIMARY KEY (id, appointment_id),
    FOREIGN KEY (appointment_id) REFERENCES appointment(id)
);

CREATE TABLE appointment_attendee (
    appointment_id text,
    id text,
    PRIMARY KEY (appointment_id, id),
    FOREIGN KEY (appointment_id) REFERENCES appointment(id),
    FOREIGN KEY (id) REFERENCES users(id)
);

CREATE TABLE appointment (
    id text,
    customer_id text,
    user_id text,
    by_day jsonb,
    created_at text,
    description text,
    end_date_time text,
    full_day text,
    "interval" text,
    is_completed text,
    is_recurring text,
    lat text,
    location text,
    location_type text,
    long text,
    occurence text,
    "repeat" text,
    "result" jsonb,
    result_option_id text,
    series_id text,
    start_date_time text,
    title text,
    until_date text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE customer_contact (
    id text,
    customer_id text,
    first_name text,
    last_name text,
    PRIMARY KEY (id, customer_id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE customer_phone (
    "index" text,
    customer_id text,
    ext text,
    label text,
    number text,
    PRIMARY KEY ("index", customer_id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE customer (
    id text,
    rep_id text,
    additional_emails jsonb,
    address text,
    address_country_code text,
    address_country_currency_name text,
    address_country_currency_symbol text,
    address_country_id text,
    address_country_name text,
    address_country_phone_code text,
    address_id text,
    address_line_1 text,
    address_state_code text,
    address_state_id text,
    address_state_name text,
    appointment_required text,
    billing_address text,
    billing_address_line_1 text,
    billing_city text,
    billing_country_code text,
    billing_country_currency_name text,
    billing_country_currency_symbol text,
    billing_country_id text,
    billing_country_name text,
    billing_country_phone_code text,
    billing_id text,
    billing_lat text,
    billing_long text,
    billing_state_code text,
    billing_state_id text,
    billing_state_name text,
    billing_zip text,
    call_center_rep text,
    call_center_rep_type text,
    call_required text,
    canvasser text,
    canvasser_type text,
    city text,
    company_name text,
    created_at text,
    deleted_at text,
    email text,
    first_name text,
    is_commercial text,
    last_name text,
    lat text,
    long text,
    management_company text,
    note text,
    property_name text,
    referred_by_note text,
    referred_by_type text,
    updated_at text,
    zip text,
    PRIMARY KEY (id),
    FOREIGN KEY (rep_id) REFERENCES users(id)
);

CREATE TABLE job_representative (
    id text,
    job_id text,
    PRIMARY KEY (id, job_id),
    FOREIGN KEY (id) REFERENCES users(id),
    FOREIGN KEY (job_id) REFERENCES job(id)
);

CREATE TABLE job_sub_contractor (
    id text,
    job_id text,
    PRIMARY KEY (id, job_id),
    FOREIGN KEY (id) REFERENCES sub_contractor(id),
    FOREIGN KEY (job_id) REFERENCES job(id)
);

CREATE TABLE job_trade (
    id text,
    job_id text,
    PRIMARY KEY (id, job_id),
    FOREIGN KEY (id) REFERENCES company_trade(id),
    FOREIGN KEY (job_id) REFERENCES job(id)
);

CREATE TABLE job_work_type (
    id text,
    job_id text,
    trade_id text,
    color text,
    "name" text,
    PRIMARY KEY (id, job_id),
    FOREIGN KEY (job_id) REFERENCES job(id),
    FOREIGN KEY (trade_id) REFERENCES company_trade(id)
);

CREATE TABLE job (
    id text,
    created_by text,
    customer_id text,
    division_id text,
    address text,
    address_country_code text,
    address_country_currency_name text,
    address_country_currency_symbol text,
    address_country_id text,
    address_country_name text,
    address_country_phone_code text,
    address_id text,
    address_line_1 text,
    address_state_code text,
    address_state_id text,
    address_state_name text,
    alt_id text,
    appointment_required text,
    archived text,
    awarded_date text,
    call_required text,
    city text,
    completion_date text,
    contact_same_as_customer text,
    contract_signed_date text,
    created_at text,
    created_date text,
    current_stage_code text,
    current_stage_color text,
    current_stage_name text,
    deleted_at text,
    description text,
    duration text,
    hover_job_id text,
    insurance text,
    lat text,
    lead_number text,
    long text,
    multi_job text,
    "name" text,
    number text,
    other_trade_type_description text,
    same_as_customer_address text,
    stage_last_modified text,
    tax_rate text,
    updated_at text,
    zip text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (division_id) REFERENCES division(id)
);

CREATE TABLE vendor_bill_attactment (
    id text,
    job_id text,
    vendor_bill_id text,
    meta text,
    mime_type text,
    "name" text,
    parent_id text,
    "size" text,
    url text,
    PRIMARY KEY (id, job_id, vendor_bill_id),
    FOREIGN KEY (job_id) REFERENCES vendor_bill(job_id),
    FOREIGN KEY (vendor_bill_id) REFERENCES vendor_bill(id)
);

CREATE TABLE vendor_bill_vendor (
    id text,
    job_id text,
    vendor_bill_id text,
    display_name text,
    first_name text,
    last_name text,
    origin text,
    PRIMARY KEY (id, job_id, vendor_bill_id),
    FOREIGN KEY (job_id) REFERENCES vendor_bill(job_id),
    FOREIGN KEY (vendor_bill_id) REFERENCES vendor_bill(id)
);

CREATE TABLE vendor_bill_line (
    id text,
    job_id text,
    vendor_bill_id text,
    account_id text,
    description text,
    quantity text,
    rate text,
    PRIMARY KEY (id, job_id, vendor_bill_id),
    FOREIGN KEY (job_id) REFERENCES vendor_bill(job_id),
    FOREIGN KEY (vendor_bill_id) REFERENCES vendor_bill(id)
);

CREATE TABLE vendor_bill (
    id text,
    job_id text,
    address text,
    bill_date text,
    bill_number text,
    created_at text,
    due_date text,
    file_paths text,
    note text,
    origin text,
    tax_amount text,
    total_amount text,
    updated_at text,
    PRIMARY KEY (id, job_id),
    FOREIGN KEY (job_id) REFERENCES job(id)
);

CREATE TABLE job_note (
    id text,
    job_id text,
    created_by text,
    modified_by text,
    created_at text,
    note text,
    stage_code text,
    updated_at text,
    PRIMARY KEY (id, job_id),
    FOREIGN KEY (job_id) REFERENCES job(id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (modified_by) REFERENCES users(id)
);

CREATE TABLE financial_summary (
    _fivetran_id text,
    job_id text,
    total_amount_owed text,
    total_change_order_amount text,
    total_credit_amount text,
    total_job_price text,
    total_job_revenue text,
    total_payment_received text,
    total_refund_amount text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (job_id) REFERENCES job(id)
);

CREATE TABLE payment_history (
    id text,
    job_id text,
    customer_id text,
    cancel_note text,
    canceled text,
    "date" text,
    echeque_number text,
    method text,
    payment text,
    ref_id text,
    ref_to text,
    reference_number text,
    serial_number text,
    "status" text,
    unapplied_amount text,
    PRIMARY KEY (id, job_id),
    FOREIGN KEY (job_id) REFERENCES job(id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE invoice_line (
    "index" text,
    invoice_id text,
    job_id text,
    trade_id text,
    amount text,
    description text,
    is_chargeable text,
    product_id text,
    quantity text,
    trade_name text,
    work_type_color text,
    work_type_id text,
    work_type_name text,
    PRIMARY KEY ("index", invoice_id, job_id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id),
    FOREIGN KEY (job_id) REFERENCES invoice(job_id),
    FOREIGN KEY (trade_id) REFERENCES company_trade(id)
);

CREATE TABLE invoice_custom_tax (
    id text,
    invoice_id text,
    job_id text,
    created_at text,
    tax_rate text,
    title text,
    updated_at text,
    PRIMARY KEY (id, invoice_id, job_id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id),
    FOREIGN KEY (job_id) REFERENCES invoice(job_id)
);

CREATE TABLE invoice (
    id text,
    job_id text,
    customer_id text,
    amount text,
    created_at text,
    "date" text,
    description text,
    due_date text,
    file_paths text,
    file_size text,
    invoice_number text,
    last_updated_origin text,
    "name" text,
    note text,
    open_balance text,
    origin text,
    "status" text,
    tax_rate text,
    taxable_amount text,
    title text,
    total_amount text,
    "type" text,
    unit_number text,
    updated_at text,
    PRIMARY KEY (id, job_id),
    FOREIGN KEY (job_id) REFERENCES job(id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE workflow_history (
    id text,
    job_id text,
    modified_by text,
    completed_date text,
    created_at text,
    stage text,
    start_date text,
    updated_at text,
    PRIMARY KEY (id, job_id),
    FOREIGN KEY (job_id) REFERENCES job(id),
    FOREIGN KEY (modified_by) REFERENCES users(id)
);
