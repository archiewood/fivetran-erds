CREATE TABLE app_setting_user (
    setting_key text,
    content text,
    self text,
    PRIMARY KEY (setting_key)
);

CREATE TABLE customer_location (
    customer_number text,
    delivery_location_number integer,
    address text,
    barred boolean,
    city text,
    country text,
    postal_code text,
    self text,
    sort_key integer,
    terms_of_delivery text,
    PRIMARY KEY (customer_number, delivery_location_number)
);

CREATE TABLE order_draft (
    order_number integer,
    customer_number integer,
    delivery_location_number integer,
    payment_terms_number integer,
    attentioncustomer_contact_number integer,
    attentionself text,
    cost_price_in_base_currency text,
    currency text,
    "date" text,
    due_date text,
    exchange_rate text,
    gross_amount text,
    gross_amount_in_base_currency text,
    heading text,
    margin_in_base_currency text,
    margin_percentage text,
    net_amount text,
    net_amount_in_base_currency text,
    project_number text,
    recipient_address text,
    recipient_city text,
    recipient_country text,
    recipient_cvr text,
    recipient_ean text,
    recipient_name text,
    recipient_nem_handel_type text,
    recipient_public_entry_number text,
    recipient_zip text,
    referencescustomer_contact_number integer,
    referencesself text,
    remainder text,
    remainder_in_base_currency text,
    rounding_amount text,
    sales_personemployee_number integer,
    sales_personself text,
    self text,
    sent text,
    soapid text,
    text_line_1 text,
    text_line_2 text,
    vat_amount text,
    vendoremployee_number integer,
    vendorself text,
    PRIMARY KEY (order_number),
    FOREIGN KEY (customer_number) REFERENCES customer(number),
    FOREIGN KEY (delivery_location_number) REFERENCES customer_location(delivery_location_number),
    FOREIGN KEY (payment_terms_number) REFERENCES payment_term(payment_terms_number)
);

CREATE TABLE layout (
    layout_number integer,
    deleted text,
    "name" text,
    self text,
    PRIMARY KEY (layout_number)
);

CREATE TABLE vat_account (
    vat_code text,
    vat_type_number integer,
    account_number integer,
    barred text,
    "name" text,
    rate_percentage text,
    self text,
    PRIMARY KEY (vat_code),
    FOREIGN KEY (vat_type_number) REFERENCES vat_type(vat_type_number)
);

CREATE TABLE order_sent (
    order_number integer,
    customer_number integer,
    delivery_location_number integer,
    payment_terms_number integer,
    attentioncustomer_contact_number integer,
    attentionself text,
    cost_price_in_base_currency text,
    currency text,
    "date" text,
    due_date text,
    exchange_rate text,
    gross_amount text,
    gross_amount_in_base_currency text,
    heading text,
    margin_in_base_currency text,
    margin_percentage text,
    net_amount text,
    net_amount_in_base_currency text,
    project_number text,
    recipient_address text,
    recipient_city text,
    recipient_country text,
    recipient_cvr text,
    recipient_ean text,
    recipient_name text,
    recipient_nem_handel_type text,
    recipient_public_entry_number text,
    recipient_zip text,
    referencescustomer_contact_number integer,
    referencesself text,
    remainder text,
    remainder_in_base_currency text,
    rounding_amount text,
    sales_personemployee_number integer,
    sales_personself text,
    self text,
    sent text,
    soapid text,
    text_line_1 text,
    text_line_2 text,
    vat_amount text,
    vendoremployee_number integer,
    vendorself text,
    PRIMARY KEY (order_number),
    FOREIGN KEY (customer_number) REFERENCES customer(number),
    FOREIGN KEY (delivery_location_number) REFERENCES customer_location(delivery_location_number),
    FOREIGN KEY (payment_terms_number) REFERENCES payment_term(payment_terms_number)
);

CREATE TABLE customer_contact (
    contact_number integer,
    customer_number text,
    deleted boolean,
    e_invoice_id text,
    email text,
    email_notifications jsonb,
    "name" text,
    notes text,
    phone text,
    self text,
    sort_key text,
    PRIMARY KEY (contact_number)
);

CREATE TABLE department (
    department_number text,
    percentage text,
    self text,
    PRIMARY KEY (department_number)
);

CREATE TABLE department_distribution (
    departmental_distribution_number integer,
    barred boolean,
    distribution_type text,
    "name" text,
    self text,
    PRIMARY KEY (departmental_distribution_number)
);

CREATE TABLE supplier (
    supplier_number integer,
    layout_number integer,
    payment_terms_number integer,
    supplier_group_number integer,
    vat_zone_number integer,
    account_number integer,
    address text,
    bank_account text,
    city text,
    contacts text,
    corporate_identification_number text,
    creditor_id text,
    currency text,
    default_invoice_text text,
    employee_number integer,
    "name" text,
    phone text,
    self text,
    supplier_contact_number integer,
    zip text,
    PRIMARY KEY (supplier_number),
    FOREIGN KEY (layout_number) REFERENCES layout(layout_number),
    FOREIGN KEY (payment_terms_number) REFERENCES payment_term(payment_terms_number),
    FOREIGN KEY (supplier_group_number) REFERENCES supplier_group(supplier_group_number),
    FOREIGN KEY (vat_zone_number) REFERENCES vat_zone(vat_zone_number)
);

CREATE TABLE accounting_year_period (
    period_number text,
    closed boolean,
    entries text,
    from_date text,
    self text,
    to_date text,
    totals text,
    "year" text,
    PRIMARY KEY (period_number)
);

CREATE TABLE order_archived (
    order_number integer,
    customer_number integer,
    delivery_location_number integer,
    payment_terms_number integer,
    attentioncustomer_contact_number integer,
    attentionself text,
    cost_price_in_base_currency text,
    currency text,
    "date" text,
    due_date text,
    exchange_rate text,
    gross_amount text,
    gross_amount_in_base_currency text,
    heading text,
    margin_in_base_currency text,
    margin_percentage text,
    net_amount text,
    net_amount_in_base_currency text,
    project_number text,
    recipient_address text,
    recipient_city text,
    recipient_country text,
    recipient_cvr text,
    recipient_ean text,
    recipient_name text,
    recipient_nem_handel_type text,
    recipient_public_entry_number text,
    recipient_zip text,
    referencescustomer_contact_number integer,
    referencesself text,
    remainder text,
    remainder_in_base_currency text,
    rounding_amount text,
    sales_personemployee_number integer,
    sales_personself text,
    self text,
    sent text,
    soapid text,
    text_line_1 text,
    text_line_2 text,
    vat_amount text,
    vendoremployee_number integer,
    vendorself text,
    PRIMARY KEY (order_number),
    FOREIGN KEY (customer_number) REFERENCES customer(number),
    FOREIGN KEY (delivery_location_number) REFERENCES customer_location(delivery_location_number),
    FOREIGN KEY (payment_terms_number) REFERENCES payment_term(payment_terms_number)
);

CREATE TABLE account (
    account_number integer,
    account_type text,
    accounting_years text,
    balance text,
    barred boolean,
    block_direct_entries boolean,
    contra_account_account_number integer,
    contra_account_self text,
    debit_credit text,
    draft_balance integer,
    from_account_number integer,
    "name" text,
    self text,
    to_account_number integer,
    total_from_account_account_number integer,
    total_from_account_self text,
    vat_code text,
    PRIMARY KEY (account_number)
);

CREATE TABLE product (
    product_number integer,
    departmental_distribution_number integer,
    product_group_number text,
    unit_number text,
    available integer,
    bar_code text,
    barred boolean,
    cost_price text,
    distribution_type text,
    gross_weight integer,
    in_stock integer,
    invoices_booked text,
    invoices_drafts text,
    invoices_self text,
    last_updated timestamp,
    "name" text,
    net_weight integer,
    ordered_by_customers integer,
    ordered_from_suppliers integer,
    package_volume integer,
    recommended_cost_price integer,
    recommended_price text,
    sales_price text,
    self text,
    PRIMARY KEY (product_number),
    FOREIGN KEY (departmental_distribution_number) REFERENCES department_distribution(departmental_distribution_number),
    FOREIGN KEY (product_group_number) REFERENCES product_group(product_group_number),
    FOREIGN KEY (unit_number) REFERENCES unit(unit_number)
);

CREATE TABLE journal_customer_invoice (
    customer_number text,
    journal_journal_number integer,
    self text,
    PRIMARY KEY (customer_number, journal_journal_number),
    FOREIGN KEY (customer_number) REFERENCES customer(number),
    FOREIGN KEY (journal_journal_number) REFERENCES journal(journal_number)
);

CREATE TABLE customer (
    number integer,
    customer_contact_number integer,
    delivery_location_number integer,
    employee_number integer,
    group_number integer,
    layout_number integer,
    payment_terms_number integer,
    vat_zone_number integer,
    attention_contact_number integer,
    balance text,
    barred text,
    contacts text,
    corporate_identification_number text,
    credit_limit text,
    currency text,
    due_amount text,
    e_invoicing_disabled_by_default boolean,
    ean text,
    last_updated text,
    p_number text,
    public_entry_number text,
    self text,
    telephone_and_fax_number text,
    templates_invoice text,
    templates_invoice_line text,
    totals_booked text,
    totals_drafts text,
    totals_self text,
    vat_number text,
    website text,
    PRIMARY KEY (number),
    FOREIGN KEY (customer_contact_number) REFERENCES customer_contact(contact_number),
    FOREIGN KEY (delivery_location_number) REFERENCES customer_location(delivery_location_number),
    FOREIGN KEY (employee_number) REFERENCES employee(employee_number),
    FOREIGN KEY (group_number) REFERENCES customer_group(customer_group_number),
    FOREIGN KEY (layout_number) REFERENCES layout(layout_number),
    FOREIGN KEY (payment_terms_number) REFERENCES payment_term(payment_terms_number),
    FOREIGN KEY (vat_zone_number) REFERENCES vat_zone(vat_zone_number)
);

CREATE TABLE currency (
    code text,
    iso_number text,
    "name" text,
    self text,
    PRIMARY KEY (code)
);

CREATE TABLE unit (
    unit_number integer,
    "name" text,
    products text,
    self text,
    PRIMARY KEY (unit_number)
);

CREATE TABLE vat_type (
    vat_type_number integer,
    "name" text,
    self text,
    PRIMARY KEY (vat_type_number)
);

CREATE TABLE product_group (
    product_group_number integer,
    account_number integer,
    "name" text,
    products text,
    sales_accounts text,
    self text,
    PRIMARY KEY (product_group_number),
    FOREIGN KEY (account_number) REFERENCES account(account_number)
);

CREATE TABLE accounting_year_period_entry (
    entry_number integer,
    accounting_year_period_period_number text,
    accounting_year_year text,
    account_number integer,
    booked_invoice_number integer,
    departmental_distribution_number integer,
    payment_type_number integer,
    supplier_number integer,
    unit_1_number integer,
    unit_2_number integer,
    vat_code text,
    amount text,
    amount_in_base_currency text,
    cost_type_number integer,
    currency text,
    customer integer,
    "date" text,
    due_date text,
    entry_type text,
    invoice_number text,
    project_number integer,
    quantity_1 text,
    quantity_2 text,
    remainder double precision,
    remainder_in_base_currency double precision,
    self text,
    supplier_invoice_number text,
    text text,
    voucher_number text,
    PRIMARY KEY (entry_number, accounting_year_period_period_number, accounting_year_year),
    FOREIGN KEY (accounting_year_period_period_number) REFERENCES accounting_year_period(period_number),
    FOREIGN KEY (accounting_year_year) REFERENCES accounting_year("year"),
    FOREIGN KEY (account_number) REFERENCES account(account_number),
    FOREIGN KEY (booked_invoice_number) REFERENCES invoice_booked(booked_invoice_number),
    FOREIGN KEY (departmental_distribution_number) REFERENCES department_distribution(departmental_distribution_number),
    FOREIGN KEY (payment_type_number) REFERENCES payment_term(payment_terms_number),
    FOREIGN KEY (supplier_number) REFERENCES supplier(supplier_number),
    FOREIGN KEY (unit_1_number) REFERENCES unit(unit_number),
    FOREIGN KEY (unit_2_number) REFERENCES unit(unit_number),
    FOREIGN KEY (vat_code) REFERENCES vat_account(vat_code)
);

CREATE TABLE employee (
    employee_number integer,
    barred boolean,
    booked_invoices text,
    customers text,
    draft_invoices text,
    email text,
    group_number integer,
    "name" text,
    phone text,
    self text,
    PRIMARY KEY (employee_number)
);

CREATE TABLE journal (
    journal_number integer,
    entries text,
    maximum_voucher_number integer,
    minimum_voucher_number integer,
    "name" text,
    self text,
    vouchers text,
    PRIMARY KEY (journal_number)
);

CREATE TABLE payment_term (
    payment_terms_number integer,
    cardcustomer_number text,
    cardself text,
    days_of_credit text,
    "name" text,
    payment_terms_type text,
    percentage_for_prepaid_amount text,
    percentage_for_remainder_amount text,
    prepaidaccount_number text,
    prepaidself text,
    remainderaccount_number text,
    remainderself text,
    self text,
    PRIMARY KEY (payment_terms_number)
);

CREATE TABLE customer_template_invoice (
    customer_number integer,
    delivery_location_number integer,
    currency text,
    "date" text,
    due_date text,
    exchange_rate text,
    recipientcustomer_contact_number text,
    recipientself text,
    referencescustomer_contact_number integer,
    referencesself text,
    PRIMARY KEY (customer_number),
    FOREIGN KEY (customer_number) REFERENCES invoice_booked(booked_invoice_number),
    FOREIGN KEY (delivery_location_number) REFERENCES customer_location(delivery_location_number)
);

CREATE TABLE accounting_year (
    "year" text,
    closed boolean,
    entries text,
    from_date text,
    periods text,
    self text,
    to_date text,
    totals text,
    vouchers text,
    PRIMARY KEY ("year")
);

CREATE TABLE payment_type (
    payment_type_number integer,
    "name" text,
    self text,
    PRIMARY KEY (payment_type_number)
);

CREATE TABLE invoice_sent (
    id integer,
    booked_invoice_number integer,
    created_by text,
    creation_date text,
    recipient_ean text,
    recipient_mobile_phone text,
    recipient_name text,
    self text,
    send_by text,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (booked_invoice_number) REFERENCES invoice_booked(booked_invoice_number)
);

CREATE TABLE invoice_draft (
    draft_invoice_number integer,
    customer_number text,
    delivery_location_number text,
    payment_terms_number text,
    attentioncustomer_contact_number integer,
    attentionself text,
    cost_price_in_base_currency text,
    currency text,
    "date" text,
    due_date text,
    exchange_rate text,
    gross_amount text,
    gross_amount_in_base_currency text,
    heading text,
    margin_in_base_currency text,
    margin_percentage text,
    net_amount text,
    net_amount_in_base_currency text,
    project_number text,
    recipient_address text,
    recipient_city text,
    recipient_country text,
    recipient_cvr text,
    recipient_ean text,
    recipient_name text,
    recipient_nem_handel_type text,
    recipient_public_entry_number text,
    recipient_zip text,
    referencescustomer_contact_number integer,
    referencesself text,
    remainder text,
    remainder_in_base_currency text,
    rounding_amount text,
    sales_personemployee_number integer,
    sales_personself text,
    self text,
    sent text,
    soapid text,
    text_line_1 text,
    text_line_2 text,
    vat_amount text,
    vendoremployee_number integer,
    vendorself text,
    PRIMARY KEY (draft_invoice_number),
    FOREIGN KEY (customer_number) REFERENCES customer(number),
    FOREIGN KEY (delivery_location_number) REFERENCES customer_location(delivery_location_number),
    FOREIGN KEY (payment_terms_number) REFERENCES payment_term(payment_terms_number)
);

CREATE TABLE vat_zone (
    vat_zone_number integer,
    enabled_for_customer boolean,
    enabled_for_supplier boolean,
    "name" text,
    self text,
    PRIMARY KEY (vat_zone_number)
);

CREATE TABLE customer_group (
    customer_group_number integer,
    account_number integer,
    customers text,
    layout_number text,
    "name" text,
    self text,
    PRIMARY KEY (customer_group_number),
    FOREIGN KEY (account_number) REFERENCES account(account_number)
);

CREATE TABLE required_module (
    module_number integer,
    app_role_role_number integer,
    self text,
    PRIMARY KEY (module_number, app_role_role_number),
    FOREIGN KEY (app_role_role_number) REFERENCES app_role(role_number)
);

CREATE TABLE app_role (
    role_number integer,
    "name" text,
    PRIMARY KEY (role_number)
);

CREATE TABLE product_sales_price (
    price text,
    currency_code text,
    product_number integer,
    self text,
    PRIMARY KEY (price),
    FOREIGN KEY (currency_code) REFERENCES currency(code),
    FOREIGN KEY (product_number) REFERENCES product(product_number)
);

CREATE TABLE supplier_group (
    supplier_group_number integer,
    account_number text,
    "name" text,
    self text,
    PRIMARY KEY (supplier_group_number),
    FOREIGN KEY (account_number) REFERENCES account(account_number)
);

CREATE TABLE app_setting_agreement (
    setting_key text,
    content text,
    self text,
    PRIMARY KEY (setting_key),
    FOREIGN KEY (setting_key) REFERENCES app_setting_user(setting_key)
);

CREATE TABLE invoice_booked (
    booked_invoice_number integer,
    customer_number integer,
    delivery_location_number integer,
    payment_terms_number integer,
    attentioncustomer_contact_number integer,
    attentionself text,
    currency text,
    "date" text,
    due_date text,
    exchange_rate text,
    gross_amount text,
    gross_amount_in_base_currency text,
    heading text,
    net_amount text,
    net_amount_in_base_currency text,
    project_number text,
    recipient_address text,
    recipient_city text,
    recipient_country text,
    recipient_cvr text,
    recipient_ean text,
    recipient_name text,
    recipient_nem_handel_type text,
    recipient_public_entry_number text,
    recipient_zip text,
    referencescustomer_contact_number integer,
    referencesself text,
    remainder text,
    remainder_in_base_currency text,
    rounding_amount text,
    sales_personemployee_number integer,
    sales_personself text,
    self text,
    sent text,
    text_line_1 text,
    text_line_2 text,
    vat_amount text,
    vendoremployee_number integer,
    vendorself text,
    PRIMARY KEY (booked_invoice_number),
    FOREIGN KEY (customer_number) REFERENCES customer(number),
    FOREIGN KEY (delivery_location_number) REFERENCES customer_location(delivery_location_number),
    FOREIGN KEY (payment_terms_number) REFERENCES payment_term(payment_terms_number)
);

CREATE TABLE customer_template_invoice_line (
    product_number text,
    customer_number integer,
    description text,
    self text,
    PRIMARY KEY (product_number, customer_number),
    FOREIGN KEY (customer_number) REFERENCES customer(number)
);
