CREATE TABLE invoice_payment (
    number text,
    amount text,
    booked text,
    currency text,
    currency_rate text,
    currency_unit text,
    invoice_number text,
    last_modified text,
    payment_date text,
    "source" text,
    url text,
    write_off_exist text,
    PRIMARY KEY (number)
);

CREATE TABLE voucher (
    number text,
    series text,
    "year" text,
    approval_state text,
    "comment" text,
    description text,
    reference_number text,
    reference_type text,
    transaction_date text,
    url text,
    PRIMARY KEY (number, series, "year")
);

CREATE TABLE contract (
    document_number text,
    customer_number text,
    continuous text,
    contract_length text,
    currency text,
    invoice_interval text,
    invoice_remaining text,
    last_invoice_date text,
    period_end text,
    period_start text,
    "status" text,
    template_number text,
    total text,
    url text,
    PRIMARY KEY (document_number),
    FOREIGN KEY (customer_number) REFERENCES customer(number)
);

CREATE TABLE project (
    number text,
    description text,
    end_date text,
    project_leader text,
    start_date text,
    "status" text,
    url text,
    PRIMARY KEY (number)
);

CREATE TABLE tax_reduction (
    id text,
    approved_amount text,
    customer_name text,
    reference_document_type text,
    reference_number text,
    social_urity_number text,
    url text,
    PRIMARY KEY (id)
);

CREATE TABLE article (
    number text,
    description text,
    disposable_quantity text,
    ean text,
    housework text,
    last_modified text,
    purchase_price text,
    quantity_in_stock text,
    reserved_quantity text,
    sales_price text,
    stock_place text,
    stock_value text,
    unit text,
    url text,
    vat text,
    webshop_article text,
    PRIMARY KEY (number)
);

CREATE TABLE offer (
    document_number text,
    customer_number text,
    cancelled text,
    currency text,
    last_modified text,
    offer_date text,
    project text,
    sent text,
    total text,
    url text,
    PRIMARY KEY (document_number),
    FOREIGN KEY (customer_number) REFERENCES customer(number)
);

CREATE TABLE price_list (
    code text,
    "comment" text,
    description text,
    pre_selected text,
    url text,
    PRIMARY KEY (code)
);

CREATE TABLE absence_transaction (
    id text,
    cause_code text,
    cost_center text,
    "date" text,
    employee_id text,
    extent text,
    holiday_entitling text,
    hours jsonb,
    project text,
    url text,
    PRIMARY KEY (id)
);

CREATE TABLE voucher_connection_file (
    id text,
    voucher_number text,
    voucher_series text,
    description text,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (voucher_number) REFERENCES voucher(number),
    FOREIGN KEY (voucher_series) REFERENCES voucher(series)
);

CREATE TABLE supplier (
    number text,
    active text,
    address_1 text,
    address_2 text,
    bank_account_number text,
    bg text,
    bic text,
    city text,
    cost_center text,
    country_code text,
    currency text,
    disable_payment_file text,
    email text,
    iban text,
    "name" text,
    organisation_number text,
    pg text,
    phone text,
    pre_defined_account text,
    project text,
    terms_of_payment text,
    url text,
    zip_code text,
    PRIMARY KEY (number)
);

CREATE TABLE orders (
    document_number text,
    customer_number text,
    cancelled text,
    currency text,
    delivery_date text,
    external_invoice_reference_1 text,
    external_invoice_reference_2 text,
    last_modified text,
    order_date text,
    order_type text,
    project text,
    sent text,
    total text,
    url text,
    PRIMARY KEY (document_number),
    FOREIGN KEY (customer_number) REFERENCES customer(number)
);

CREATE TABLE invoice (
    _fivetran_id text,
    customer_number text,
    voucher_number text,
    balance text,
    booked text,
    cancelled text,
    cost_center text,
    currency text,
    currency_rate text,
    currency_unit text,
    document_number text,
    due_date text,
    external_invoice_reference_1 text,
    external_invoice_reference_2 text,
    final_pay_date text,
    invoice_date text,
    invoice_type text,
    last_modified text,
    nox_finans text,
    ocr text,
    project text,
    sent text,
    terms_of_payment text,
    total text,
    url text,
    way_of_delivery text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (customer_number) REFERENCES customer(number),
    FOREIGN KEY (voucher_number) REFERENCES voucher(number)
);

CREATE TABLE supplier_invoice_voucher (
    series text,
    "year" text,
    number text,
    supplier_number text,
    PRIMARY KEY (series, "year", number, supplier_number),
    FOREIGN KEY (number) REFERENCES voucher(number),
    FOREIGN KEY (supplier_number) REFERENCES supplier_invoice(supplier_number)
);

CREATE TABLE supplier_invoice (
    number text,
    supplier_number text,
    authorizer_name text,
    balance text,
    booked text,
    cancel text,
    cost_center text,
    credit text,
    currency text,
    currency_rate text,
    currency_unit text,
    due_date text,
    external_invoice_number text,
    external_invoice_series text,
    final_pay_date text,
    invoice_date text,
    invoice_number text,
    project text,
    total text,
    url text,
    PRIMARY KEY (number, supplier_number),
    FOREIGN KEY (supplier_number) REFERENCES supplier(number)
);

CREATE TABLE asset (
    id text,
    acquisition_date text,
    acquisition_value text,
    depreciated_to text,
    depreciation_final text,
    description text,
    number text,
    "status" text,
    status_id text,
    "type" text,
    type_id text,
    url text,
    PRIMARY KEY (id)
);

CREATE TABLE account (
    number text,
    active text,
    balance_brought_forward text,
    cost_center text,
    cost_center_settings text,
    description text,
    last_modified text,
    project text,
    project_settings text,
    sru text,
    url text,
    vat_code text,
    "year" text,
    PRIMARY KEY (number)
);

CREATE TABLE supplier_invoice_payment (
    number text,
    amount text,
    booked text,
    currency text,
    currency_rate text,
    currency_unit text,
    invoice_number text,
    last_modified text,
    payment_date text,
    "source" text,
    url text,
    write_off_exist text,
    PRIMARY KEY (number)
);

CREATE TABLE customer (
    number text,
    address_1 text,
    address_2 text,
    city text,
    email text,
    last_modified text,
    "name" text,
    organisation_number text,
    phone text,
    url text,
    zip_code text,
    PRIMARY KEY (number)
);
