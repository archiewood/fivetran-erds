CREATE TABLE statement_enriched_item (
    "index" text,
    statement_account_id text,
    statement_period text,
    assignee text,
    product_tag jsonb,
    transaction_aust_amount text,
    transaction_aust_charge text,
    transaction_aust_extra text,
    transaction_booking_ref text,
    transaction_card_name text,
    transaction_card_number text,
    transaction_date text,
    transaction_docket text,
    transaction_driver_abn text,
    transaction_driver_id text,
    transaction_fare text,
    transaction_from_address text,
    transaction_gst text,
    transaction_levy_amount text,
    transaction_levy_authority text,
    transaction_local_amount text,
    transaction_local_fare text,
    transaction_merchant text,
    transaction_product text,
    transaction_rate_type text,
    transaction_rrn text,
    transaction_service_fee text,
    transaction_service_fee_rate text,
    transaction_taxi text,
    transaction_time text,
    transaction_to_address text,
    transaction_total_amount text,
    transaction_trans_number text,
    transaction_trip_uid text,
    trip_comment text,
    trip_tag jsonb,
    PRIMARY KEY ("index", statement_account_id, statement_period),
    FOREIGN KEY (statement_account_id) REFERENCES statement(account_id),
    FOREIGN KEY (statement_period) REFERENCES statement(period)
);

CREATE TABLE statement (
    period text,
    account_id text,
    account_fee text,
    balance_brought_forward text,
    credit_adjustment text,
    debit_adjustment text,
    due_date text,
    enriched_order jsonb,
    from_date text,
    gov_levy text,
    gst_amount text,
    invoice_number text,
    issue_date text,
    overdue text,
    payment_received text,
    period_total text,
    previous_balance text,
    service_fee text,
    statement_period text,
    taxi_fare text,
    to_date text,
    trip_number text,
    PRIMARY KEY (period, account_id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE traveller_role (
    "role" text,
    traveller_id text,
    PRIMARY KEY ("role", traveller_id),
    FOREIGN KEY (traveller_id) REFERENCES traveller(id)
);

CREATE TABLE traveller_tag_profile (
    id text,
    traveller_id text,
    category_id text,
    PRIMARY KEY (id, traveller_id),
    FOREIGN KEY (traveller_id) REFERENCES traveller(id),
    FOREIGN KEY (category_id) REFERENCES category(id)
);

CREATE TABLE traveller (
    id text,
    account_id text,
    email text,
    first_name text,
    last_name text,
    pay_on_account_permission text,
    phone_number text,
    user_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE digital_fast_card_order (
    id text,
    account_id text,
    assignee text,
    cancelled_trip text,
    delivery_address text,
    delivery_method text,
    expiry text,
    order_date text,
    order_user_id text,
    original_trip text,
    pan text,
    seq text,
    spending_limit text,
    spending_limit_frequency text,
    "status" text,
    tags text,
    used_trip text,
    valid_from text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE "transaction" (
    id text,
    account_id text,
    billing_period text,
    drop_off_address text,
    drop_off_date_time text,
    fare text,
    gst text,
    kilometre text,
    order_id text,
    pickup_address text,
    pickup_date_time text,
    product_type text,
    receipt_number text,
    route jsonb,
    service_fee text,
    taxi text,
    ticket_number text,
    transaction_date text,
    trip_tag jsonb,
    -- extra_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE account (
    id text,
    account_status text,
    billing_period jsonb,
    dfc_max_fare_limit text,
    "name" text,
    tag_visible text,
    trip_tag_config_allow_new_tag_addition text,
    trip_tag_config_categories_required text,
    trip_tag_config_comments_required text,
    trip_tag_config_traveller_trip_tagging_enabled text,
    PRIMARY KEY (id)
);

CREATE TABLE digital_pass_order (
    id text,
    account_id text,
    assignee text,
    cancelled_by text,
    cancelled_date text,
    cancelled_trip text,
    created_by text,
    delivery_address text,
    delivery_method text,
    expiry text,
    fare_limit text,
    original_trip text,
    "status" text,
    tags jsonb,
    ticket_number text,
    used_trip text,
    valid_from text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE inventory_fastcard (
    id text,
    account_id text,
    assignee_email text,
    assignee_name text,
    expiry_date text,
    name_on_card text,
    receipt_email text,
    valid_from text,
    PRIMARY KEY (id, account_id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE category_tag (
    id text,
    account_id text,
    category_id text,
    description text,
    PRIMARY KEY (id, account_id, category_id),
    FOREIGN KEY (account_id) REFERENCES category(account_id),
    FOREIGN KEY (category_id) REFERENCES category(id)
);

CREATE TABLE category (
    id text,
    account_id text,
    "name" text,
    PRIMARY KEY (id, account_id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE inventory_flexi_fastcard (
    id text,
    account_id text,
    assignee_email text,
    assignee_name text,
    expiry_date text,
    name_on_card text,
    receipt_email text,
    valid_from text,
    PRIMARY KEY (id, account_id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE inventory_eticket (
    id text,
    account_id text,
    assignee_email text,
    assignee_name text,
    expiry_date text,
    name_on_card text,
    receipt_email text,
    valid_from text,
    PRIMARY KEY (id, account_id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);
