CREATE TABLE card_transaction_metadata (
    custom_name text,
    primary_card_account_transaction_id text,
    custom_value text,
    PRIMARY KEY (custom_name, primary_card_account_transaction_id),
    FOREIGN KEY (primary_card_account_transaction_id) REFERENCES primary_card_account_transaction(id)
);

CREATE TABLE primary_card_account_transaction (
    id text,
    card_id text,
    amount text,
    currency text,
    description text,
    initiated_at_date text,
    merchant_category_code text,
    posted_at_date text,
    raw_descriptor text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (card_id) REFERENCES card(id)
);

CREATE TABLE cash_account_statement (
    id text,
    cash_account_id text,
    end_balance_amount text,
    end_balance_currency text,
    period_end_date text,
    period_start_date text,
    start_balance_amount text,
    start_balance_currency text,
    PRIMARY KEY (id),
    FOREIGN KEY (cash_account_id) REFERENCES cash_account(id)
);

CREATE TABLE cash_account (
    id text,
    account_number text,
    available_balance_amount text,
    available_balance_currency text,
    current_balance_amount text,
    current_balance_currency text,
    is_primary text,
    "name" text,
    routing_number text,
    "status" text,
    PRIMARY KEY (id)
);

CREATE TABLE primary_card_account_statement (
    id text,
    end_balance_amount text,
    end_balance_currency text,
    period_end_date text,
    period_start_date text,
    start_balance_amount text,
    start_balance_currency text,
    PRIMARY KEY (id)
);

CREATE TABLE user_metadata (
    custom_name text,
    users_id text,
    custom_value text,
    PRIMARY KEY (custom_name, users_id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    department_id text,
    location_id text,
    manager_id text,
    email text,
    first_name text,
    last_name text,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (location_id) REFERENCES location(id),
    FOREIGN KEY (manager_id) REFERENCES users(id)
);

CREATE TABLE referral_account (
    id text,
    referral_id text,
    application_status text,
    created_at timestamp,
    domestic_account_type text,
    domestic_bank_account_number text,
    domestic_bank_address text,
    domestic_bank_name text,
    domestic_bank_routing_number text,
    domestic_beneficiary_address text,
    domestic_beneficiary_name text,
    international_account_type text,
    international_bank_address text,
    international_bank_name text,
    international_beneficiary_address text,
    international_beneficiary_name text,
    international_special_instructions text,
    international_swift_account_number text,
    international_swift_bank_number text,
    PRIMARY KEY (id),
    FOREIGN KEY (referral_id) REFERENCES referral(id)
);

CREATE TABLE referral (
    id text,
    customer_email text,
    expires_at text,
    referral_signup_url text,
    "status" text,
    PRIMARY KEY (id)
);

CREATE TABLE transfer (
    id text,
    counterparty_account_number text,
    counterparty_deposit_account_id text,
    counterparty_id text,
    counterparty_payment_instrument_id text,
    creator_id text,
    originating_account_id text,
    amount text,
    cancellation_reason text,
    counterparty_external_memo text,
    counterparty_fed_reference_number text,
    counterparty_type text,
    created_at text,
    currency text,
    description text,
    display_name text,
    estimated_delivery_date text,
    originating_account_type text,
    payment_type text,
    process_date text,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (counterparty_account_number) REFERENCES referral_account(international_swift_account_number),
    FOREIGN KEY (counterparty_deposit_account_id) REFERENCES referral_account(id),
    FOREIGN KEY (counterparty_id) REFERENCES vendor(id),
    FOREIGN KEY (counterparty_payment_instrument_id) REFERENCES vendor_payment_account(payment_instrument_id),
    FOREIGN KEY (creator_id) REFERENCES users(id),
    FOREIGN KEY (originating_account_id) REFERENCES referral_account(id)
);

CREATE TABLE card_account (
    id text,
    account_limit_amount text,
    account_limit_currency text,
    available_balance_amount text,
    available_balance_currency text,
    current_balance_amount text,
    current_balance_currency text,
    current_statement_end_date text,
    current_statement_start_date text,
    "status" text,
    PRIMARY KEY (id)
);

CREATE TABLE cash_account_transaction (
    id text,
    transfer_id text,
    amount text,
    currency text,
    description text,
    initiated_at_date text,
    posted_at_date text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (transfer_id) REFERENCES transfer(id)
);

CREATE TABLE vendor_payment_account (
    payment_instrument_id text,
    vendor_id text,
    account_class text,
    account_number text,
    account_type text,
    address_city text,
    address_country text,
    address_line_1 text,
    address_line_2 text,
    address_phone_number text,
    address_postal_code text,
    address_state text,
    beneficiary_bank_name text,
    iban text,
    mailing_city text,
    mailing_country text,
    mailing_line_1 text,
    mailing_line_2 text,
    mailing_phone_number text,
    mailing_postal_code text,
    mailing_state text,
    recipient_name text,
    routing_number text,
    swift_code text,
    "type" text,
    PRIMARY KEY (payment_instrument_id, vendor_id),
    FOREIGN KEY (vendor_id) REFERENCES vendor(id)
);

CREATE TABLE vendor (
    id text,
    company_name text,
    email text,
    phone text,
    PRIMARY KEY (id)
);

CREATE TABLE location (
    id text,
    description text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE department (
    id text,
    description text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE card_metadata (
    custom_name text,
    card_id text,
    custom_value text,
    PRIMARY KEY (custom_name, card_id),
    FOREIGN KEY (card_id) REFERENCES card(id)
);

CREATE TABLE card (
    id text,
    owner_user_id text,
    billing_city text,
    billing_country text,
    billing_line_1 text,
    billing_line_2 text,
    billing_phone_number text,
    billing_postal_code text,
    billing_state text,
    limit_type text,
    lock_after_date text,
    mailing_city text,
    mailing_country text,
    mailing_line_1 text,
    mailing_line_2 text,
    mailing_phone_number text,
    mailing_postal_code text,
    mailing_state text,
    "name" text,
    owner_type text,
    reason text,
    spend_available_amount text,
    spend_available_currency text,
    spend_duration text,
    spend_limit_amount text,
    spend_limit_currency text,
    "status" text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (owner_user_id) REFERENCES users(id)
);

CREATE TABLE expense_reviewer (
    expense_id text,
    id text,
    department_id text,
    location_id text,
    first_name text,
    last_name text,
    PRIMARY KEY (expense_id, id),
    FOREIGN KEY (expense_id) REFERENCES expense(id),
    FOREIGN KEY (id) REFERENCES users(id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE expense_custom_field (
    "key" text,
    expense_id text,
    data jsonb,
    data_type text,
    value_type text,
    PRIMARY KEY ("key", expense_id),
    FOREIGN KEY (expense_id) REFERENCES expense(id)
);

CREATE TABLE expense (
    id text,
    department_id text,
    location_id text,
    payment_instrument_id text,
    user_id text,
    address_city text,
    address_coordinates_latitude text,
    address_coordinates_longitude text,
    address_country text,
    address_line_1 text,
    address_line_2 text,
    address_postal_code text,
    address_state text,
    address_timezone text,
    approved_at text,
    billing_amount text,
    billing_currency text,
    billing_entity_id text,
    budget_amount text,
    budget_currency text,
    budget_id text,
    budget_name text,
    category text,
    completion_date text,
    expense_type text,
    exported_at text,
    integration_billing_entity_id text,
    integration_spending_entity_id text,
    memo text,
    merchant_country text,
    merchant_id text,
    merchant_mcc text,
    merchant_raw_descriptor text,
    original_amount text,
    original_currency text,
    payment_id text,
    payment_instrument_type text,
    payment_posted_at text,
    payment_status text,
    purchased_amount text,
    purchased_at text,
    purchased_currency text,
    receipts jsonb,
    repayment_initiated_by_department_id text,
    repayment_initiated_by_first_name text,
    repayment_initiated_by_id text,
    repayment_initiated_by_last_name text,
    repayment_initiated_by_location_id text,
    repayment_initiation_date text,
    review_approved_at text,
    review_approver_department_id text,
    review_approver_first_name text,
    review_approver_id text,
    review_approver_last_name text,
    review_approver_location_id text,
    review_compliance_status text,
    review_copilot_approver_department_id text,
    review_copilot_approver_first_name text,
    review_copilot_approver_id text,
    review_copilot_approver_last_name text,
    review_copilot_approver_location_id text,
    reviewer_status text,
    spending_entity_billing_address_city text,
    spending_entity_billing_address_country text,
    spending_entity_billing_address_line_1 text,
    spending_entity_billing_address_line_2 text,
    spending_entity_billing_address_phone_number text,
    spending_entity_billing_address_postal_code text,
    spending_entity_billing_address_state text,
    spending_entity_created_at text,
    spending_entity_display_name text,
    spending_entity_id text,
    spending_entity_is_default text,
    spending_entity_status text,
    "status" text,
    status_reason text,
    submitted_at text,
    trip_id text,
    updated_at timestamp,
    usd_equivalent_amount text,
    usd_equivalent_currency text,
    PRIMARY KEY (id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (location_id) REFERENCES location(id),
    FOREIGN KEY (payment_instrument_id) REFERENCES vendor_payment_account(payment_instrument_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);
