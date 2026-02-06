CREATE TABLE matter_custom_attribute (
    "index" text,
    matter_id text,
    "name" text,
    "value" text,
    PRIMARY KEY ("index", matter_id),
    FOREIGN KEY (matter_id) REFERENCES matter(id)
);

CREATE TABLE matter_internal_user (
    "index" text,
    matter_id text,
    internal_matter_user text,
    PRIMARY KEY ("index", matter_id),
    FOREIGN KEY (matter_id) REFERENCES matter(id)
);

CREATE TABLE matter (
    id text,
    budget text,
    category text,
    change_timestamp text,
    closed_date text,
    country text,
    country_name text,
    currency text,
    department text,
    description text,
    entity text,
    internal_matter_lead_user text,
    is_open text,
    iso_code text,
    lead_outside_counsel_username text,
    open_date text,
    ref text,
    region_name text,
    remove_excluded_internal_matter_participants text,
    remove_excluded_vendors text,
    PRIMARY KEY (id)
);

CREATE TABLE paysite (
    id text,
    vendor_ref text,
    active text,
    billing_legal_entity text,
    billing_legal_entity_code text,
    code text,
    currency text,
    vendor_office_ref text,
    PRIMARY KEY (id),
    FOREIGN KEY (vendor_ref) REFERENCES vendor(ref)
);

CREATE TABLE invoice_summary (
    id text,
    vendor_ref text,
    adjustments text,
    approved_gross_total text,
    blended_tax_rate text,
    currency_details_customer_default_currency_fx_rate text,
    currency_details_customer_default_currency_iso_code text,
    currency_details_matter_currency_fx_rate text,
    currency_details_matter_currency_iso_code text,
    currency_iso_code text,
    "date" text,
    discount text,
    expenses text,
    exposure_percentage text,
    fees_total text,
    group_id text,
    matter_ref text,
    number text,
    original_gross_total text,
    po_number text,
    "status" text,
    status_change_timestamp text,
    tax_total text,
    PRIMARY KEY (id),
    FOREIGN KEY (vendor_ref) REFERENCES vendor(ref)
);

CREATE TABLE allocation (
    _fivetran_id text,
    active text,
    "name" text,
    order_number text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE tax_rate (
    _fivetran_id text,
    code text,
    jurisdiction_iso_code text,
    percentage text,
    type_name text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE trading_entity (
    id text,
    city text,
    code text,
    country text,
    enabled text,
    "name" text,
    "state" text,
    street text,
    tax_id text,
    zip text,
    PRIMARY KEY (id)
);

CREATE TABLE vendor (
    id text,
    ref text,
    contact_email text,
    firm_name text,
    "name" text,
    payment_method text,
    preferred_flag text,
    PRIMARY KEY (id, ref)
);

CREATE TABLE account_payable_batch (
    id text,
    created text,
    creator_email text,
    creator_id text,
    customer_batch_id text,
    customer_id text,
    recipient_email text,
    recipient_id text,
    text text,
    PRIMARY KEY (id)
);

CREATE TABLE vendor_office (
    id text,
    vendor_ref text,
    address_city text,
    address_postal_code text,
    address_state text,
    address_street_and_building text,
    admin_user_email text,
    admin_user_forename text,
    admin_user_surname text,
    bank_account_name text,
    bank_account_no text,
    bank_address text,
    bank_iban text,
    bank_name text,
    bank_sort_code text,
    bank_swift_or_bic text,
    country text,
    country_iso_code text,
    "name" text,
    office_vendor_id text,
    payment_method text,
    ref text,
    tax_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (vendor_ref) REFERENCES vendor(ref)
);

CREATE TABLE user_role (
    "index" text,
    user_id text,
    "role" text,
    PRIMARY KEY ("index", user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    active text,
    department text,
    email text,
    employee_level text,
    employee_number text,
    first_name text,
    full_name text,
    last_name text,
    manager text,
    "schema" jsonb,
    username text,
    PRIMARY KEY (id)
);

CREATE TABLE resource (
    _fivetran_id text,
    attributes jsonb,
    endpoint text,
    id text,
    "name" text,
    "schema" text,
    PRIMARY KEY (_fivetran_id)
);
