CREATE TABLE invoice_discount (
    id text,
    invoice_id text,
    coupon_id text,
    customer_id text,
    invoice_item_id text,
    subscription_id text,
    checkout_session text,
    "end" timestamp,
    promotion_code text,
    "start" timestamp,
    PRIMARY KEY (id, invoice_id),
    FOREIGN KEY (coupon_id) REFERENCES coupon(id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (invoice_item_id) REFERENCES invoice_item(id),
    FOREIGN KEY (subscription_id) REFERENCES subscription_history(id)
);

CREATE TABLE "transaction" (
    id text,
    authorization_id text,
    balance_transaction_id text,
    card_id text,
    dispute_id text,
    amount bigint,
    cardholder text,
    created timestamp,
    currency text,
    livemode boolean,
    metadata jsonb,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (authorization_id) REFERENCES authorization(id),
    FOREIGN KEY (balance_transaction_id) REFERENCES balance_transaction(id),
    FOREIGN KEY (card_id) REFERENCES card(id),
    FOREIGN KEY (dispute_id) REFERENCES dispute(id)
);

CREATE TABLE ideal (
    payment_method_id text,
    bank text,
    bic text,
    PRIMARY KEY (payment_method_id),
    FOREIGN KEY (payment_method_id) REFERENCES payment_method(id)
);

CREATE TABLE cash_balance_transaction (
    id text,
    customer_id text,
    adjusted_for_overdraft_balance_transaction text,
    adjusted_for_overdraft_linked_transaction text,
    applied_to_payment_intent text,
    created timestamp,
    currency text,
    ending_balance bigint,
    funded_bank_transfer_eu_bank_transfer_bic text,
    funded_bank_transfer_eu_bank_transfer_iban_last_4 text,
    funded_bank_transfer_eu_bank_transfer_sender_name text,
    funded_bank_transfer_gb_bank_transfer_account_number_last_4 text,
    funded_bank_transfer_gb_bank_transfer_sender_name text,
    funded_bank_transfer_gb_bank_transfer_sort_code text,
    funded_bank_transfer_jp_bank_transfer_sender_bank text,
    funded_bank_transfer_jp_bank_transfer_sender_branch text,
    funded_bank_transfer_jp_bank_transfer_sender_name text,
    funded_bank_transfer_reference text,
    funded_bank_transfer_type text,
    funded_bank_transfer_us_bank_transfer_network text,
    funded_bank_transfer_us_bank_transfer_sender_name text,
    livemode boolean,
    net_amount bigint,
    refunded_from_payment_refund text,
    transferred_to_balance_transaction text,
    "type" text,
    unapplied_from_payment_intent text,
    PRIMARY KEY (id, customer_id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE invoice_line_item_proration_details_credited_item (
    credited_invoice_line_item_id text,
    invoice_id text,
    invoice_line_item text,
    credited_invoice_id text,
    PRIMARY KEY (credited_invoice_line_item_id, invoice_id, invoice_line_item),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id),
    FOREIGN KEY (invoice_line_item) REFERENCES invoice_line_item(unique_id)
);

CREATE TABLE customer_discount (
    customer_id text,
    id text,
    coupon_id text,
    invoice_id text,
    invoice_item_id text,
    subscription_id text,
    checkout_session text,
    "end" timestamp,
    promotion_code text,
    "start" timestamp,
    PRIMARY KEY (customer_id, id),
    FOREIGN KEY (coupon_id) REFERENCES coupon(id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id),
    FOREIGN KEY (invoice_item_id) REFERENCES invoice_item(id),
    FOREIGN KEY (subscription_id) REFERENCES subscription_history(id)
);

CREATE TABLE credit_note_line_item_tax_rate (
    credit_note_id text,
    credit_note_line_item_id text,
    tax_rate_id text,
    PRIMARY KEY (credit_note_id, credit_note_line_item_id, tax_rate_id),
    FOREIGN KEY (credit_note_id) REFERENCES credit_note(id),
    FOREIGN KEY (credit_note_line_item_id) REFERENCES credit_note_line_item(id),
    FOREIGN KEY (tax_rate_id) REFERENCES tax_rate(id)
);

CREATE TABLE upcoming_invoice_line_item_tax_rate (
    subscription_id text,
    tax_rate_id text,
    upcoming_invoice_line_item_id text,
    PRIMARY KEY (subscription_id, tax_rate_id, upcoming_invoice_line_item_id),
    FOREIGN KEY (subscription_id) REFERENCES subscription_history(id),
    FOREIGN KEY (tax_rate_id) REFERENCES tax_rate(id),
    FOREIGN KEY (upcoming_invoice_line_item_id) REFERENCES upcoming_invoice_line_item(id)
);

CREATE TABLE authorization (
    id text,
    card_id text,
    amount bigint,
    amount_details_atm_fee double precision,
    approved boolean,
    authorization_method text,
    cardholder text,
    created timestamp,
    currency text,
    held_amount bigint,
    held_currency text,
    is_held_amount_controllable boolean,
    livemode boolean,
    metadata jsonb,
    pending_authorized_amount bigint,
    pending_held_amount bigint,
    "status" text,
    wallet_provider text,
    -- merchant_data_* (dynamic column),
    -- verification_data_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (card_id) REFERENCES card(id)
);

CREATE TABLE "source" (
    id text,
    connected_account_id text,
    customer_id text,
    amount bigint,
    code_verificationattempts_remaining bigint,
    code_verificationstatus text,
    created timestamp,
    currency text,
    flow text,
    livemode boolean,
    metadata jsonb,
    statement_descriptor text,
    "status" text,
    "type" text,
    usage text,
    -- owner_* (dynamic column),
    -- receiver_* (dynamic column),
    -- redirect_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (connected_account_id) REFERENCES account(id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE upcoming_invoice_custom_field (
    "name" text,
    subscription text,
    "value" text,
    PRIMARY KEY ("name", subscription),
    FOREIGN KEY (subscription) REFERENCES subscription_history(id)
);

CREATE TABLE setup_intent (
    id text,
    customer_id text,
    on_behalf_of text,
    payment_method_id text,
    application text,
    cancellation_reason text,
    created timestamp,
    description text,
    livemode boolean,
    mandate text,
    metadata jsonb,
    single_use_mandate text,
    "status" text,
    usage text,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (on_behalf_of) REFERENCES account(id),
    FOREIGN KEY (payment_method_id) REFERENCES payment_method(id)
);

CREATE TABLE shipping_rate (
    id text,
    active boolean,
    amount integer,
    created timestamp,
    currency text,
    delivery_estimate_maximum_unit text,
    delivery_estimate_maximum_value integer,
    delivery_estimate_minimum_unit text,
    delivery_estimate_minimum_value integer,
    display_name text,
    livemode boolean,
    tax_behavior text,
    tax_code text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE bank_account (
    id text,
    connected_account_id text,
    customer_id text,
    account text,
    account_holder_name text,
    account_holder_type text,
    bank_name text,
    country text,
    currency text,
    fingerprint text,
    is_deleted boolean,
    last_4 text,
    metadata jsonb,
    routing_number text,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (connected_account_id) REFERENCES account(id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE dispute (
    id text,
    charge_id text,
    connected_account_id text,
    amount bigint,
    balance_transaction text,
    created timestamp,
    currency text,
    is_charge_refundable boolean,
    livemode boolean,
    metadata jsonb,
    reason text,
    "status" text,
    -- evidence_* (dynamic column),
    -- evidence_details_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (charge_id) REFERENCES charge(id),
    FOREIGN KEY (connected_account_id) REFERENCES account(id)
);

CREATE TABLE tier (
    "index" integer,
    id text,
    flat_amount bigint,
    flat_amount_decimal text,
    unit_amount bigint,
    unit_amount_decimal text,
    up_to bigint,
    PRIMARY KEY ("index", id),
    FOREIGN KEY (id) REFERENCES plan(id)
);

CREATE TABLE checkout_session_shipping_option (
    checkout_session_id text,
    shipping_rate_id text,
    shipping_amount integer,
    PRIMARY KEY (checkout_session_id, shipping_rate_id),
    FOREIGN KEY (checkout_session_id) REFERENCES checkout_session(id),
    FOREIGN KEY (shipping_rate_id) REFERENCES shipping_rate(id)
);

CREATE TABLE price_currency_option (
    currency text,
    price_id text,
    custom_unit_amount_maximum bigint,
    custom_unit_amount_minimum bigint,
    custom_unit_amount_preset bigint,
    tax_behavior text,
    unit_amount bigint,
    unit_amount_decimal text,
    PRIMARY KEY (currency, price_id),
    FOREIGN KEY (price_id) REFERENCES price(id)
);

CREATE TABLE invoice_custom_field (
    "name" text,
    invoice_id text,
    "value" text,
    PRIMARY KEY ("name", invoice_id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id)
);

CREATE TABLE attribute (
    "name" text,
    id text,
    "value" text,
    PRIMARY KEY ("name", id),
    FOREIGN KEY (id) REFERENCES sku(id)
);

CREATE TABLE payment_method (
    id text,
    customer_id text,
    created timestamp,
    livemode boolean,
    metadata jsonb,
    "type" text,
    -- billing_detail_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE plan (
    id text,
    product_id text,
    active boolean,
    aggregate_usage text,
    amount bigint,
    billing_scheme text,
    created timestamp,
    currency text,
    "interval" text,
    interval_count bigint,
    is_deleted boolean,
    livemode boolean,
    metadata jsonb,
    nickname text,
    tiers_mode text,
    transform_usage_divide_by integer,
    transform_usage_round text,
    trial_period_days integer,
    usage_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE au_becs_debit (
    payment_method_id text,
    bsb_number text,
    fingerprint text,
    last_4 text,
    PRIMARY KEY (payment_method_id),
    FOREIGN KEY (payment_method_id) REFERENCES payment_method(id)
);

CREATE TABLE order_return (
    id text,
    refund_id text,
    amount bigint,
    created timestamp,
    currency text,
    livemode boolean,
    order_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (refund_id) REFERENCES refund(id)
);

CREATE TABLE charge_payment_method_details (
    payment_method_type text,
    charge_id text,
    "value" jsonb,
    PRIMARY KEY (payment_method_type, charge_id),
    FOREIGN KEY (charge_id) REFERENCES charge(id)
);

CREATE TABLE quote_tax_rate (
    quote_id text,
    tax_rate_id text,
    PRIMARY KEY (quote_id, tax_rate_id),
    FOREIGN KEY (quote_id) REFERENCES quote(id),
    FOREIGN KEY (tax_rate_id) REFERENCES tax_rate(id)
);

CREATE TABLE topup (
    id text,
    balance_transaction_id text,
    source_id text,
    amount bigint,
    created timestamp,
    currency text,
    description text,
    expected_availability_date timestamp,
    failure_code text,
    failure_message text,
    livemode boolean,
    metadata jsonb,
    statement_descriptor text,
    "status" text,
    transfer_group text,
    PRIMARY KEY (id),
    FOREIGN KEY (balance_transaction_id) REFERENCES balance_transaction(id),
    FOREIGN KEY (source_id) REFERENCES "source"(id)
);

CREATE TABLE checkout_session_line_item_tax_rate (
    checkout_session_line_item_id text,
    tax_rate_id text,
    amount integer,
    PRIMARY KEY (checkout_session_line_item_id, tax_rate_id),
    FOREIGN KEY (checkout_session_line_item_id) REFERENCES checkout_session_line_item(id),
    FOREIGN KEY (tax_rate_id) REFERENCES tax_rate(id)
);

CREATE TABLE order_return_item (
    "index" integer,
    order_return_id text,
    discount_id text,
    sku_id text,
    amount bigint,
    currency text,
    description text,
    quantity bigint,
    "type" text,
    PRIMARY KEY ("index", order_return_id),
    FOREIGN KEY (order_return_id) REFERENCES order_return(id),
    FOREIGN KEY (discount_id) REFERENCES discount(id),
    FOREIGN KEY (sku_id) REFERENCES sku(id)
);

CREATE TABLE subscription_history (
    id text,
    customer_id text,
    default_payment_method_id text,
    default_source_id text,
    latest_invoice_id text,
    pending_setup_intent_id text,
    application_fee_percent double precision,
    billing text,
    billing_cycle_anchor timestamp,
    billing_threshold_amount_gte bigint,
    billing_threshold_reset_billing_cycle_anchor boolean,
    cancel_at timestamp,
    cancel_at_period_end boolean,
    canceled_at timestamp,
    cancellation_details_comment text,
    cancellation_details_feedback text,
    cancellation_details_reason text,
    collection_method text,
    created timestamp,
    current_period_end timestamp,
    current_period_start timestamp,
    days_until_due bigint,
    ended_at timestamp,
    livemode boolean,
    metadata jsonb,
    pause_collection_behavior text,
    pause_collection_resumes_at timestamp,
    quantity bigint,
    "start" timestamp,
    start_date timestamp,
    "status" text,
    tax_percent double precision,
    trial_end timestamp,
    trial_start timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (default_payment_method_id) REFERENCES payment_method(id),
    FOREIGN KEY (default_source_id) REFERENCES "source"(id),
    FOREIGN KEY (latest_invoice_id) REFERENCES invoice(id),
    FOREIGN KEY (pending_setup_intent_id) REFERENCES setup_intent(id)
);

CREATE TABLE setup_attempt (
    id text,
    setup_intent_id text,
    default_payment_method_id text,
    on_behalf_of text,
    application text,
    created timestamp,
    livemode boolean,
    "status" text,
    usage text,
    -- setup_error_* (dynamic column),
    PRIMARY KEY (id, setup_intent_id),
    FOREIGN KEY (setup_intent_id) REFERENCES setup_intent(id),
    FOREIGN KEY (default_payment_method_id) REFERENCES payment_method(id),
    FOREIGN KEY (on_behalf_of) REFERENCES account(id)
);

CREATE TABLE cardholder (
    id text,
    billing_address_city text,
    billing_address_country text,
    billing_address_line_1 text,
    billing_address_line_2 text,
    billing_address_postal_code text,
    billing_address_state text,
    billing_name text,
    created timestamp,
    email text,
    is_default boolean,
    livemode boolean,
    metadata jsonb,
    "name" text,
    phone_number text,
    "status" text,
    "type" text,
    -- spending_controls_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE credit_note_line_item (
    id text,
    credit_note_id text,
    amount bigint,
    amount_excluding_tax bigint,
    description text,
    invoice_line_item text,
    livemode boolean,
    quantity bigint,
    "type" text,
    unit_amount bigint,
    unit_amount_decimal text,
    unit_amount_excluding_tax text,
    PRIMARY KEY (id, credit_note_id),
    FOREIGN KEY (credit_note_id) REFERENCES credit_note(id)
);

CREATE TABLE customer_balance_transaction (
    id text,
    customer_id text,
    invoice_id text,
    amount bigint,
    created timestamp,
    credit_note text,
    currency text,
    description text,
    ending_balance bigint,
    livemode boolean,
    metadata jsonb,
    "type" text,
    PRIMARY KEY (id, customer_id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id)
);

CREATE TABLE sepa_debit (
    payment_method_id text,
    bank_code text,
    branch_code text,
    country text,
    fingerprint text,
    last_4 text,
    PRIMARY KEY (payment_method_id),
    FOREIGN KEY (payment_method_id) REFERENCES payment_method(id)
);

CREATE TABLE subscription_discount (
    id text,
    subscription_id text,
    coupon_id text,
    customer_id text,
    invoice_id text,
    invoice_item_id text,
    checkout_session text,
    "end" timestamp,
    promotion_code text,
    "start" timestamp,
    PRIMARY KEY (id, subscription_id),
    FOREIGN KEY (coupon_id) REFERENCES coupon(id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id),
    FOREIGN KEY (invoice_item_id) REFERENCES invoice_item(id)
);

CREATE TABLE card (
    id text,
    account_id text,
    connected_account_id text,
    customer_id text,
    address_city text,
    address_country text,
    address_line_1 text,
    address_line_1_check text,
    address_line_2 text,
    address_state text,
    address_zip text,
    address_zip_check text,
    brand text,
    country text,
    created timestamp,
    currency text,
    cvc_check text,
    description text,
    dynamic_last_4 text,
    exp_month integer,
    exp_year integer,
    fingerprint text,
    funding text,
    iin text,
    is_deleted boolean,
    issuer text,
    last_4 text,
    metadata jsonb,
    "name" text,
    network text,
    recipient text,
    three_d_secure text,
    tokenization_method text,
    wallet_type text,
    -- three_d_secure_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (connected_account_id) REFERENCES account(id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE issuing_card (
    id text,
    cardholder_id text,
    connected_account_id text,
    brand text,
    cancellation_reason text,
    created timestamp,
    currency text,
    exp_month integer,
    exp_year integer,
    last_4 text,
    livemode boolean,
    metadata jsonb,
    "name" text,
    number text,
    replaced_by text,
    replacement_for text,
    replacement_reason text,
    "status" text,
    "type" text,
    -- shipping_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (cardholder_id) REFERENCES cardholder(id),
    FOREIGN KEY (connected_account_id) REFERENCES account(id)
);

CREATE TABLE fee (
    "index" integer,
    balance_transaction_id text,
    connected_account_id text,
    amount bigint,
    application text,
    currency text,
    description text,
    "type" text,
    PRIMARY KEY ("index", balance_transaction_id),
    FOREIGN KEY (balance_transaction_id) REFERENCES balance_transaction(id),
    FOREIGN KEY (connected_account_id) REFERENCES account(id)
);

CREATE TABLE coupon_product (
    coupon_id text,
    product_id text,
    PRIMARY KEY (coupon_id, product_id),
    FOREIGN KEY (coupon_id) REFERENCES coupon(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE invoice_line_item_tax_rate (
    invoice_id text,
    invoice_line_item text,
    tax_rate_id text,
    PRIMARY KEY (invoice_id, invoice_line_item, tax_rate_id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id),
    FOREIGN KEY (invoice_line_item) REFERENCES invoice_line_item(unique_id),
    FOREIGN KEY (tax_rate_id) REFERENCES tax_rate(id)
);

CREATE TABLE application_fee_refund (
    id text,
    application_fee_id text,
    balance_transaction_id text,
    amount bigint,
    created timestamp,
    currency text,
    metadata jsonb,
    PRIMARY KEY (id, application_fee_id),
    FOREIGN KEY (application_fee_id) REFERENCES application_fee(id),
    FOREIGN KEY (balance_transaction_id) REFERENCES balance_transaction(id)
);

CREATE TABLE credit_note (
    id text,
    customer_balance_transaction_id text,
    customer_id text,
    invoice_id text,
    refund_id text,
    amount bigint,
    amount_shipping bigint,
    created timestamp,
    currency text,
    effective_at timestamp,
    livemode boolean,
    memo text,
    metadata jsonb,
    number text,
    out_of_band_amount bigint,
    pdf text,
    reason text,
    "status" text,
    subtotal bigint,
    subtotal_excluding_tax bigint,
    total bigint,
    total_excluding_tax bigint,
    "type" text,
    voided_at timestamp,
    -- shipping_cost_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (customer_balance_transaction_id) REFERENCES customer_balance_transaction(id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id),
    FOREIGN KEY (refund_id) REFERENCES refund(id)
);

CREATE TABLE file_link (
    id text,
    file_id text,
    created timestamp,
    expired boolean,
    expires_at timestamp,
    livemode boolean,
    metadata jsonb,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (file_id) REFERENCES file(id)
);

CREATE TABLE early_fraud_warning (
    id text,
    charge_id text,
    actionable boolean,
    created timestamp,
    fraud_type text,
    livemode boolean,
    PRIMARY KEY (id),
    FOREIGN KEY (charge_id) REFERENCES charge(id)
);

CREATE TABLE sku (
    id text,
    product_id text,
    active boolean,
    created timestamp,
    currency text,
    image text,
    inventory_quantity integer,
    inventory_type text,
    inventory_value text,
    is_deleted boolean,
    livemode boolean,
    metadata jsonb,
    price double precision,
    updated timestamp,
    -- package_dimensions_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE invoice_account_tax_id (
    id text,
    invoice_id text,
    PRIMARY KEY (id, invoice_id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id)
);

CREATE TABLE checkout_session_payment_method (
    payment_method_type text,
    checkout_session_id text,
    PRIMARY KEY (payment_method_type, checkout_session_id),
    FOREIGN KEY (checkout_session_id) REFERENCES checkout_session(id)
);

CREATE TABLE subscription_tax_rate (
    subscription_id text,
    tax_rate_id text,
    PRIMARY KEY (subscription_id, tax_rate_id),
    FOREIGN KEY (subscription_id) REFERENCES subscription_history(id),
    FOREIGN KEY (tax_rate_id) REFERENCES tax_rate(id)
);

CREATE TABLE quote_line_item (
    id text,
    quote_id text,
    price_id text,
    amount_subtotal bigint,
    amount_tax bigint,
    amount_total bigint,
    currency text,
    description text,
    quantity bigint,
    PRIMARY KEY (id, quote_id),
    FOREIGN KEY (quote_id) REFERENCES quote(id),
    FOREIGN KEY (price_id) REFERENCES price(id)
);

CREATE TABLE file (
    id text,
    created timestamp,
    filename text,
    purpose text,
    "size" bigint,
    title text,
    "type" text,
    url text,
    PRIMARY KEY (id)
);

CREATE TABLE payment_intent (
    id text,
    connected_account_id text,
    customer_id text,
    last_payment_error_charge_id text,
    last_payment_error_source_id text,
    on_behalf_of text,
    payment_method_id text,
    source_id text,
    transfer_data_destination text,
    amount bigint,
    amount_capturable bigint,
    amount_received bigint,
    application text,
    application_fee_amount bigint,
    canceled_at timestamp,
    cancellation_reason text,
    capture_method text,
    confirmation_method text,
    created timestamp,
    currency text,
    description text,
    last_payment_error_code text,
    last_payment_error_decline_code text,
    last_payment_error_doc_url text,
    last_payment_error_message text,
    last_payment_error_param text,
    last_payment_error_type text,
    livemode boolean,
    metadata jsonb,
    payment_method_types jsonb,
    receipt_email text,
    statement_descriptor text,
    "status" text,
    transfer_group text,
    PRIMARY KEY (id),
    FOREIGN KEY (connected_account_id) REFERENCES account(id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (last_payment_error_charge_id) REFERENCES charge(id),
    FOREIGN KEY (last_payment_error_source_id) REFERENCES "source"(id),
    FOREIGN KEY (on_behalf_of) REFERENCES account(id),
    FOREIGN KEY (payment_method_id) REFERENCES payment_method(id),
    FOREIGN KEY (source_id) REFERENCES "source"(id),
    FOREIGN KEY (transfer_data_destination) REFERENCES account(id)
);

CREATE TABLE price (
    id text,
    invoice_item_id text,
    product_id text,
    active boolean,
    billing_scheme text,
    created timestamp,
    currency text,
    is_deleted boolean,
    livemode boolean,
    lookup_key text,
    metadata jsonb,
    nickname text,
    tiers_mode text,
    transform_quantity_divide_by integer,
    transform_quantity_round text,
    "type" text,
    unit_amount bigint,
    unit_amount_decimal text,
    -- recurring_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (invoice_item_id) REFERENCES invoice_item(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE usage_record (
    id text,
    subscription_item_id text,
    invoice_id text,
    livemode boolean,
    period_end bigint,
    period_start bigint,
    "timestamp" timestamp,
    total_usage bigint,
    PRIMARY KEY (id, subscription_item_id),
    FOREIGN KEY (subscription_item_id) REFERENCES subscription_item(id)
);

CREATE TABLE application_fee (
    id text,
    account_id text,
    balance_transaction_id text,
    charge_id text,
    originating_transaction text,
    amount bigint,
    amount_refunded bigint,
    application text,
    created timestamp,
    currency text,
    livemode boolean,
    refunded boolean,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (balance_transaction_id) REFERENCES balance_transaction(id),
    FOREIGN KEY (charge_id) REFERENCES charge(id),
    FOREIGN KEY (originating_transaction) REFERENCES charge(id)
);

CREATE TABLE tax_amount (
    "index" integer,
    "type" text,
    type_id text,
    tax_rate_id text,
    amount bigint,
    inclusive boolean,
    taxability_reason text,
    taxable_amount bigint,
    PRIMARY KEY ("index", "type", type_id),
    FOREIGN KEY (tax_rate_id) REFERENCES tax_rate(id)
);

CREATE TABLE upcoming_invoice_line_item_proration_details_credited_item (
    invoice_line_item text,
    subscription_id text,
    upcoming_invoice_line_item_id text,
    invoice text,
    PRIMARY KEY (invoice_line_item, subscription_id, upcoming_invoice_line_item_id),
    FOREIGN KEY (subscription_id) REFERENCES subscription_history(id),
    FOREIGN KEY (upcoming_invoice_line_item_id) REFERENCES upcoming_invoice_line_item(id)
);

CREATE TABLE refund (
    id text,
    balance_transaction_id text,
    charge_id text,
    connected_account_id text,
    failure_balance_transaction_id text,
    payment_intent_id text,
    amount bigint,
    created timestamp,
    currency text,
    description text,
    failure_reason text,
    metadata jsonb,
    reason text,
    receipt_number text,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (balance_transaction_id) REFERENCES balance_transaction(id),
    FOREIGN KEY (charge_id) REFERENCES charge(id),
    FOREIGN KEY (connected_account_id) REFERENCES account(id),
    FOREIGN KEY (failure_balance_transaction_id) REFERENCES balance_transaction(id),
    FOREIGN KEY (payment_intent_id) REFERENCES payment_intent(id)
);

CREATE TABLE upcoming_invoice (
    subscription_id text,
    charge_id text,
    customer_id text,
    default_payment_method_id text,
    default_source_id text,
    payment_intent_id text,
    account_country text,
    account_name text,
    amount_due bigint,
    amount_paid bigint,
    amount_remaining bigint,
    amount_shipping integer,
    application text,
    application_fee_amount bigint,
    attempt_count bigint,
    attempted boolean,
    auto_advance boolean,
    automatic_tax_enabled boolean,
    automatic_tax_liability_account text,
    automatic_tax_liability_type text,
    automatic_tax_status text,
    billing_reason text,
    collection_method text,
    created timestamp,
    currency text,
    description text,
    due_date timestamp,
    ending_balance bigint,
    footer text,
    from_invoice_action text,
    from_invoice_invoice text,
    hosted_invoice_url text,
    invoice_pdf text,
    latest_revision text,
    livemode boolean,
    metadata jsonb,
    next_payment_attempt timestamp,
    number text,
    on_behalf_of text,
    paid boolean,
    paid_out_of_band boolean,
    payment_settings_default_mandate text,
    payment_settings_payment_method_options_acss_debit_mandate_options_transaction_type text,
    payment_settings_payment_method_options_acss_debit_verification_method text,
    payment_settings_payment_method_options_bancontact_preferred_language text,
    payment_settings_payment_method_options_card_installments_enabled boolean,
    payment_settings_payment_method_options_card_request_three_d_secure text,
    payment_settings_payment_method_options_customer_balance_bank_transfer_eu_bank_transfer_country text,
    payment_settings_payment_method_options_customer_balance_bank_transfer_type text,
    payment_settings_payment_method_options_customer_balance_funding_type text,
    payment_settings_payment_method_options_us_bank_account_financial_connections_permissions jsonb,
    payment_settings_payment_method_options_us_bank_account_financial_connections_prefetch jsonb,
    payment_settings_payment_method_options_us_bank_account_verification_method text,
    payment_settings_payment_method_types jsonb,
    period_end timestamp,
    period_start timestamp,
    post_payment_credit_notes_amount integer,
    pre_payment_credit_notes_amount integer,
    quote text,
    receipt_number text,
    rendering_amount_tax_display text,
    rendering_pdf_page_size text,
    starting_balance bigint,
    statement_descriptor text,
    "status" text,
    subscription_proration_date integer,
    subtotal bigint,
    subtotal_excluding_tax bigint,
    tax bigint,
    tax_percent numeric,
    test_clock text,
    threshold_reason_amount_gte bigint,
    total bigint,
    total_excluding_tax bigint,
    transfer_data_amount integer,
    transfer_data_destination text,
    webhooks_delivered_at timestamp,
    -- last_finalization_error_* (dynamic column),
    -- shipping_* (dynamic column),
    -- shipping_cost_* (dynamic column),
    -- status_transitions_* (dynamic column),
    PRIMARY KEY (subscription_id),
    FOREIGN KEY (subscription_id) REFERENCES subscription_history(id),
    FOREIGN KEY (charge_id) REFERENCES charge(id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (default_payment_method_id) REFERENCES payment_method(id),
    FOREIGN KEY (default_source_id) REFERENCES "source"(id),
    FOREIGN KEY (payment_intent_id) REFERENCES payment_intent(id)
);

CREATE TABLE account (
    id text,
    individual_id text,
    business_type text,
    charges_enabled boolean,
    country text,
    created timestamp,
    default_currency text,
    details_submitted boolean,
    email text,
    is_deleted boolean,
    metadata jsonb,
    payouts_enabled boolean,
    tos_acceptance_date timestamp,
    tos_acceptance_ip text,
    tos_acceptance_user_agent text,
    "type" text,
    -- business_profile_* (dynamic column),
    -- capabilities_* (dynamic column),
    -- company_* (dynamic column),
    -- requirements_* (dynamic column),
    -- settings_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (individual_id) REFERENCES person(id)
);

CREATE TABLE customer (
    id text,
    bank_account_id text,
    default_card_id text,
    source_id text,
    account_balance bigint,
    balance bigint,
    created timestamp,
    currency text,
    delinquent boolean,
    description text,
    email text,
    invoice_prefix text,
    invoice_settings_default_payment_method text,
    invoice_settings_footer text,
    is_deleted boolean,
    livemode boolean,
    metadata jsonb,
    "name" text,
    phone text,
    tax_exempt text,
    tax_info_tax_id text,
    tax_info_type text,
    tax_info_verification_status text,
    tax_info_verification_verified_name text,
    -- address_* (dynamic column),
    -- shipping_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (bank_account_id) REFERENCES bank_account(id),
    FOREIGN KEY (default_card_id) REFERENCES card(id),
    FOREIGN KEY (source_id) REFERENCES "source"(id)
);

CREATE TABLE invoice (
    id text,
    charge_id text,
    customer_id text,
    default_payment_method_id text,
    default_source_id text,
    payment_intent_id text,
    subscription_id text,
    account_country text,
    account_name text,
    amount_due bigint,
    amount_paid bigint,
    amount_remaining bigint,
    amount_shipping bigint,
    application text,
    application_fee_amount bigint,
    attempt_count bigint,
    attempted boolean,
    auto_advance boolean,
    automatic_tax_enabled boolean,
    automatic_tax_status text,
    billing_reason text,
    collection_method text,
    created timestamp,
    currency text,
    description text,
    due_date timestamp,
    effective_at timestamp,
    ending_balance bigint,
    footer text,
    from_invoice_action text,
    from_invoice_invoice text,
    hosted_invoice_url text,
    invoice_pdf text,
    is_deleted boolean,
    latest_revision text,
    livemode boolean,
    metadata jsonb,
    next_payment_attempt timestamp,
    number text,
    on_behalf_of text,
    paid boolean,
    paid_out_of_band boolean,
    payment_settings_default_mandate text,
    payment_settings_payment_method_options_acss_debit_mandate_options_transaction_type text,
    payment_settings_payment_method_options_acss_debit_verification_method text,
    payment_settings_payment_method_options_bancontact_preferred_language text,
    payment_settings_payment_method_options_card_installments_enabled boolean,
    payment_settings_payment_method_options_card_request_three_d_secure text,
    payment_settings_payment_method_options_customer_balance_bank_transfer_eu_bank_transfer_country text,
    payment_settings_payment_method_options_customer_balance_bank_transfer_type text,
    payment_settings_payment_method_options_customer_balance_funding_type text,
    payment_settings_payment_method_options_us_bank_account_financial_connections_filters_account_subcategories jsonb,
    payment_settings_payment_method_options_us_bank_account_financial_connections_permissions jsonb,
    payment_settings_payment_method_options_us_bank_account_financial_connections_prefetch jsonb,
    payment_settings_payment_method_options_us_bank_account_verification_method text,
    payment_settings_payment_method_types jsonb,
    period_end timestamp,
    period_start timestamp,
    post_payment_credit_notes_amount integer,
    pre_payment_credit_notes_amount integer,
    receipt_number text,
    rendering_amount_tax_display text,
    rendering_pdf_page_size text,
    starting_balance bigint,
    statement_descriptor text,
    "status" text,
    subscription_proration_date integer,
    subtotal bigint,
    subtotal_excluding_tax bigint,
    tax bigint,
    tax_percent numeric,
    test_clock text,
    threshold_reason_amount_gte bigint,
    total bigint,
    total_excluding_tax bigint,
    webhooks_delivered_at timestamp,
    -- last_finalization_error_* (dynamic column),
    -- shipping_cost_* (dynamic column),
    -- shipping_details_* (dynamic column),
    -- status_transitions_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (charge_id) REFERENCES charge(id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (default_payment_method_id) REFERENCES payment_method(id),
    FOREIGN KEY (default_source_id) REFERENCES "source"(id),
    FOREIGN KEY (payment_intent_id) REFERENCES payment_intent(id),
    FOREIGN KEY (subscription_id) REFERENCES subscription_history(id)
);

CREATE TABLE review (
    id text,
    charge_id text,
    payment_intent_id text,
    billing_zip text,
    closed_reason text,
    created timestamp,
    ip_address text,
    livemode boolean,
    "open" boolean,
    opened_reason text,
    reason text,
    -- ip_address_location_* (dynamic column),
    -- session_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (charge_id) REFERENCES charge(id),
    FOREIGN KEY (payment_intent_id) REFERENCES payment_intent(id)
);

CREATE TABLE phase_plan (
    end_date timestamp,
    start_date timestamp,
    plan_id text,
    subscription_schedule_id text,
    quantity bigint,
    PRIMARY KEY (end_date, start_date, plan_id, subscription_schedule_id),
    FOREIGN KEY (plan_id) REFERENCES plan(id),
    FOREIGN KEY (subscription_schedule_id) REFERENCES subscription_schedule(id)
);

CREATE TABLE discount (
    id text,
    "type" text,
    type_id text,
    checkout_session_id text,
    checkout_session_line_item_id text,
    coupon_id text,
    credit_note_line_item_id text,
    customer_id text,
    invoice_id text,
    invoice_item_id text,
    subscription_id text,
    amount bigint,
    "end" timestamp,
    promotion_code text,
    "start" timestamp,
    PRIMARY KEY (id, "type", type_id),
    FOREIGN KEY (checkout_session_id) REFERENCES checkout_session(id),
    FOREIGN KEY (checkout_session_line_item_id) REFERENCES checkout_session_line_item(id),
    FOREIGN KEY (coupon_id) REFERENCES coupon(id),
    FOREIGN KEY (credit_note_line_item_id) REFERENCES credit_note_line_item(id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id),
    FOREIGN KEY (invoice_item_id) REFERENCES invoice_item(id),
    FOREIGN KEY (subscription_id) REFERENCES subscription_history(id)
);

CREATE TABLE cash_balance (
    customer_id text,
    available jsonb,
    livemode boolean,
    settings_reconciliation_mode text,
    settings_using_merchant_default boolean,
    PRIMARY KEY (customer_id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE upcoming_invoice_line_item (
    id text,
    subscription_id text,
    customer_id text,
    plan_id text,
    price_id text,
    subscription_item_id text,
    amount bigint,
    currency text,
    description text,
    discountable boolean,
    invoice_item_id text,
    livemode boolean,
    metadata jsonb,
    period_end timestamp,
    period_start timestamp,
    proration boolean,
    quantity bigint,
    "type" text,
    PRIMARY KEY (id, subscription_id),
    FOREIGN KEY (subscription_id) REFERENCES subscription_history(id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (plan_id) REFERENCES plan(id),
    FOREIGN KEY (price_id) REFERENCES price(id),
    FOREIGN KEY (subscription_item_id) REFERENCES subscription_item(id)
);

CREATE TABLE upcoming_invoice_account_tax_id (
    id text,
    subscription_id text,
    PRIMARY KEY (id, subscription_id),
    FOREIGN KEY (subscription_id) REFERENCES subscription_history(id)
);

CREATE TABLE product (
    id text,
    active boolean,
    caption text,
    created timestamp,
    description text,
    is_deleted boolean,
    livemode boolean,
    metadata jsonb,
    "name" text,
    shippable boolean,
    statement_descriptor text,
    "type" text,
    unit_label text,
    updated timestamp,
    url text,
    -- package_dimensions_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE promotion_code (
    id text,
    coupon_id text,
    customer_id text,
    active boolean,
    code text,
    created timestamp,
    expires_at timestamp,
    first_time_transaction boolean,
    livemode boolean,
    max_redemptions bigint,
    metadata jsonb,
    minimum_amount integer,
    minimum_amount_currency text,
    times_redeemed bigint,
    PRIMARY KEY (id),
    FOREIGN KEY (coupon_id) REFERENCES coupon(id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE checkout_session_line_item (
    id text,
    checkout_session_id text,
    price_id text,
    amount_discount bigint,
    amount_subtotal double precision,
    amount_tax bigint,
    amount_total double precision,
    currency text,
    description text,
    object text,
    quantity bigint,
    PRIMARY KEY (id, checkout_session_id),
    FOREIGN KEY (checkout_session_id) REFERENCES checkout_session(id),
    FOREIGN KEY (price_id) REFERENCES price(id)
);

CREATE TABLE phase (
    end_date timestamp,
    start_date timestamp,
    subscription_schedule_id text,
    application_fee_percent double precision,
    billing_thresholds_amount_gte bigint,
    billing_thresholds_reset_billing_cycle_anchor boolean,
    collection_method text,
    coupon_id text,
    default_payment_method text,
    invoice_settings_days_until_due bigint,
    tax_percent double precision,
    trial_end timestamp,
    PRIMARY KEY (end_date, start_date, subscription_schedule_id),
    FOREIGN KEY (subscription_schedule_id) REFERENCES subscription_schedule(id)
);

CREATE TABLE transfer_reversal (
    id text,
    transfer_id text,
    balance_transaction_id text,
    source_refund_id text,
    amount bigint,
    created timestamp,
    currency text,
    destination_payment_refund text,
    metadata jsonb,
    PRIMARY KEY (id, transfer_id),
    FOREIGN KEY (transfer_id) REFERENCES transfer(id),
    FOREIGN KEY (balance_transaction_id) REFERENCES balance_transaction(id),
    FOREIGN KEY (source_refund_id) REFERENCES refund(id)
);

CREATE TABLE person (
    id text,
    account text,
    created timestamp,
    dob_day integer,
    dob_month integer,
    dob_year integer,
    email text,
    first_name text,
    first_name_kana text,
    first_name_kanji text,
    gender text,
    id_number_provided boolean,
    is_deleted boolean,
    last_name text,
    last_name_kana text,
    last_name_kanji text,
    maiden_name text,
    phone text,
    ssn_last_4_provided boolean,
    -- address_* (dynamic column),
    -- address_kana_* (dynamic column),
    -- address_kanji_* (dynamic column),
    -- relationship_* (dynamic column),
    -- verification_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (account) REFERENCES account(id)
);

CREATE TABLE issuing_transaction (
    id text,
    authorization_id text,
    balance_transaction text,
    card text,
    cardholder text,
    dispute text,
    amount bigint,
    amount_details jsonb,
    created timestamp,
    currency text,
    livemode boolean,
    merchant_amount bigint,
    merchant_currency text,
    merchant_data jsonb,
    metadata jsonb,
    object text,
    "type" text,
    wallets text,
    PRIMARY KEY (id),
    FOREIGN KEY (authorization_id) REFERENCES authorization(id),
    FOREIGN KEY (balance_transaction) REFERENCES balance_transaction(id),
    FOREIGN KEY (card) REFERENCES card(id),
    FOREIGN KEY (cardholder) REFERENCES cardholder(id),
    FOREIGN KEY (dispute) REFERENCES dispute(id)
);

CREATE TABLE transfer (
    id text,
    balance_transaction_id text,
    destination text,
    source_transaction text,
    source_transaction_id text,
    amount bigint,
    amount_reversed bigint,
    created timestamp,
    currency text,
    description text,
    destination_payment text,
    destination_payment_id text,
    livemode boolean,
    metadata jsonb,
    reversed boolean,
    source_type text,
    transfer_group text,
    PRIMARY KEY (id),
    FOREIGN KEY (balance_transaction_id) REFERENCES balance_transaction(id),
    FOREIGN KEY (destination) REFERENCES account(id),
    FOREIGN KEY (source_transaction) REFERENCES charge(id),
    FOREIGN KEY (source_transaction_id) REFERENCES charge(id)
);

CREATE TABLE payment_method_card (
    payment_method_id text,
    charge_id text,
    brand text,
    description text,
    fingerprint text,
    funding text,
    three_d_secure_usage_supported boolean,
    "type" text,
    wallet_type text,
    PRIMARY KEY (payment_method_id),
    FOREIGN KEY (payment_method_id) REFERENCES payment_method(id),
    FOREIGN KEY (charge_id) REFERENCES charge(id)
);

CREATE TABLE payout_balance_transaction (
    balance_transaction_id text,
    payout_id text,
    PRIMARY KEY (balance_transaction_id, payout_id),
    FOREIGN KEY (balance_transaction_id) REFERENCES balance_transaction(id),
    FOREIGN KEY (payout_id) REFERENCES payout(id)
);

CREATE TABLE checkout_session_shipping_address_allowed_countries (
    allowed_country_code text,
    checkout_session_id text,
    PRIMARY KEY (allowed_country_code, checkout_session_id),
    FOREIGN KEY (checkout_session_id) REFERENCES checkout_session(id)
);

CREATE TABLE payout (
    id text,
    balance_transaction_id text,
    connected_account_id text,
    destination_bank_account_id text,
    destination_card_id text,
    failure_balance_transaction_id text,
    amount bigint,
    arrival_date timestamp,
    automatic boolean,
    created timestamp,
    currency text,
    description text,
    failure_code text,
    failure_message text,
    livemode boolean,
    metadata jsonb,
    method text,
    reconciliation_status text,
    source_type text,
    statement_descriptor text,
    "status" text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (balance_transaction_id) REFERENCES balance_transaction(id),
    FOREIGN KEY (connected_account_id) REFERENCES account(id),
    FOREIGN KEY (destination_bank_account_id) REFERENCES bank_account(id),
    FOREIGN KEY (destination_card_id) REFERENCES card(id),
    FOREIGN KEY (failure_balance_transaction_id) REFERENCES balance_transaction(id)
);

CREATE TABLE charge (
    id text,
    balance_transaction_id text,
    bank_account_id text,
    card_id text,
    connected_account_id text,
    customer_id text,
    destination text,
    invoice_id text,
    on_behalf_of text,
    payment_intent_id text,
    payment_method_id text,
    source_id text,
    source_transfer text,
    transfer_data_destination text,
    transfer_id text,
    amount bigint,
    amount_refunded bigint,
    application text,
    application_fee_amount bigint,
    calculated_statement_descriptor text,
    captured boolean,
    created timestamp,
    currency text,
    description text,
    failure_code text,
    failure_message text,
    fraud_details_stripe_report text,
    fraud_details_user_report text,
    livemode boolean,
    metadata jsonb,
    paid boolean,
    receipt_email text,
    receipt_number text,
    receipt_url text,
    refunded boolean,
    statement_descriptor text,
    "status" text,
    transfer_group text,
    -- billing_detail_* (dynamic column),
    -- outcome_* (dynamic column),
    -- shipping_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (balance_transaction_id) REFERENCES balance_transaction(id),
    FOREIGN KEY (bank_account_id) REFERENCES bank_account(id),
    FOREIGN KEY (card_id) REFERENCES card(id),
    FOREIGN KEY (connected_account_id) REFERENCES account(id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (destination) REFERENCES account(id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id),
    FOREIGN KEY (on_behalf_of) REFERENCES account(id),
    FOREIGN KEY (payment_intent_id) REFERENCES payment_intent(id),
    FOREIGN KEY (payment_method_id) REFERENCES payment_method(id),
    FOREIGN KEY (source_id) REFERENCES "source"(id),
    FOREIGN KEY (source_transfer) REFERENCES transfer(id),
    FOREIGN KEY (transfer_data_destination) REFERENCES account(id),
    FOREIGN KEY (transfer_id) REFERENCES transfer(id)
);

CREATE TABLE checkout_session (
    id text,
    customer_id text,
    payment_intent_id text,
    setup_intent_id text,
    subscription_id text,
    after_expiration_allow_promotion_codes boolean,
    after_expiration_enabled boolean,
    after_expiration_expires_at timestamp,
    after_expiration_url text,
    allow_promotion_codes boolean,
    automatic_tax_enabled boolean,
    automatic_tax_status text,
    billing_address_collection text,
    cancel_url text,
    client_reference_id text,
    consent_collection_promotions text,
    consent_promotions text,
    currency text,
    expires_at timestamp,
    livemode boolean,
    locale text,
    metadata jsonb,
    mode text,
    object text,
    payment_link text,
    payment_status text,
    phone_number_collection_enabled boolean,
    recovered_from text,
    shipping_city text,
    shipping_country text,
    shipping_line_1 text,
    shipping_line_2 text,
    shipping_name text,
    shipping_postal_code text,
    shipping_state text,
    "status" text,
    submit_type text,
    success_url text,
    tax_id_collection_enabled boolean,
    url text,
    -- payment_method_options_* (dynamic column),
    -- shipping_rate_* (dynamic column),
    -- total_details_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (payment_intent_id) REFERENCES payment_intent(id),
    FOREIGN KEY (setup_intent_id) REFERENCES setup_intent(id),
    FOREIGN KEY (subscription_id) REFERENCES subscription_history(id)
);

CREATE TABLE quote_computed_upfront_line_item (
    id text,
    quote_id text,
    price_id text,
    amount_subtotal bigint,
    amount_tax bigint,
    amount_total bigint,
    currency text,
    description text,
    quantity bigint,
    PRIMARY KEY (id, quote_id),
    FOREIGN KEY (quote_id) REFERENCES quote(id),
    FOREIGN KEY (price_id) REFERENCES price(id)
);

CREATE TABLE upcoming_invoice_tax_rate (
    subscription text,
    tax_rate_id text,
    PRIMARY KEY (subscription, tax_rate_id),
    FOREIGN KEY (subscription) REFERENCES subscription_history(id),
    FOREIGN KEY (tax_rate_id) REFERENCES tax_rate(id)
);

CREATE TABLE quote (
    id text,
    customer_id text,
    invoice_id text,
    subscription_id text,
    subscription_schedule_id text,
    amount_subtotal bigint,
    amount_total bigint,
    application text,
    application_fee_amount bigint,
    application_fee_percent double precision,
    automatic_tax_enabled boolean,
    automatic_tax_liability_account text,
    automatic_tax_liability_type text,
    automatic_tax_status text,
    collection_method text,
    computed_recurring_amount_subtotal bigint,
    computed_recurring_amount_total bigint,
    computed_recurring_interval text,
    computed_recurring_interval_count bigint,
    computed_recurring_total_details_amount_discount bigint,
    computed_recurring_total_details_amount_shipping bigint,
    computed_recurring_total_details_amount_tax bigint,
    computed_upfront_amount_subtotal bigint,
    computed_upfront_amount_total bigint,
    computed_upfront_total_details_amount_discount bigint,
    computed_upfront_total_details_amount_shipping bigint,
    computed_upfront_total_details_amount_tax bigint,
    created timestamp,
    currency text,
    description text,
    expires_at timestamp,
    footer text,
    from_quote_is_revision boolean,
    from_quote_quote text,
    header text,
    invoice_settings_days_until_due bigint,
    invoice_settings_issuer_account text,
    invoice_settings_issuer_type text,
    livemode boolean,
    metadata jsonb,
    number text,
    on_behalf_of text,
    "status" text,
    status_transitions_accepted_at timestamp,
    status_transitions_canceled_at timestamp,
    status_transitions_finalized_at timestamp,
    test_clock text,
    transfer_data_amount bigint,
    transfer_data_amount_percent double precision,
    transfer_data_destination text,
    -- subscription_data_* (dynamic column),
    -- total_details_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id),
    FOREIGN KEY (subscription_id) REFERENCES subscription_history(id),
    FOREIGN KEY (subscription_schedule_id) REFERENCES subscription_schedule(id)
);

CREATE TABLE fpx (
    payment_method_id text,
    bank text,
    PRIMARY KEY (payment_method_id),
    FOREIGN KEY (payment_method_id) REFERENCES payment_method(id)
);

CREATE TABLE customer_tax (
    id text,
    customer_id text,
    owner_account_id text,
    owner_customer_id text,
    country text,
    created timestamp,
    livemode boolean,
    object text,
    owner_type text,
    "type" text,
    "value" text,
    verification_status text,
    verification_verified_address text,
    verification_verified_name text,
    PRIMARY KEY (id, customer_id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (owner_account_id) REFERENCES account(id),
    FOREIGN KEY (owner_customer_id) REFERENCES customer(id)
);

CREATE TABLE invoice_tax_rate (
    invoice_id text,
    tax_rate_id text,
    PRIMARY KEY (invoice_id, tax_rate_id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id),
    FOREIGN KEY (tax_rate_id) REFERENCES tax_rate(id)
);

CREATE TABLE checkout_session_line_item_discount (
    discount_id text,
    checkout_session_line_item_id text,
    coupon_id text,
    customer_id text,
    invoice_id text,
    invoice_item_id text,
    subscription_id text,
    amount bigint,
    checkout_session text,
    "end" timestamp,
    promotion_code text,
    "start" timestamp,
    PRIMARY KEY (discount_id, checkout_session_line_item_id),
    FOREIGN KEY (checkout_session_line_item_id) REFERENCES checkout_session_line_item(id),
    FOREIGN KEY (coupon_id) REFERENCES coupon(id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id),
    FOREIGN KEY (invoice_item_id) REFERENCES invoice_item(id),
    FOREIGN KEY (subscription_id) REFERENCES subscription_history(id)
);

CREATE TABLE invoice_line_item (
    unique_id text,
    invoice_id text,
    plan_id text,
    price_id text,
    subscription_id text,
    subscription_item_id text,
    amount bigint,
    amount_excluding_tax bigint,
    currency text,
    description text,
    discountable boolean,
    id text,
    invoice_item_id text,
    livemode boolean,
    metadata jsonb,
    period_end timestamp,
    period_start timestamp,
    proration boolean,
    quantity bigint,
    "type" text,
    unit_amount_excluding_tax text,
    PRIMARY KEY (unique_id, invoice_id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id),
    FOREIGN KEY (plan_id) REFERENCES plan(id),
    FOREIGN KEY (price_id) REFERENCES price(id),
    FOREIGN KEY (subscription_id) REFERENCES subscription_history(id),
    FOREIGN KEY (subscription_item_id) REFERENCES subscription_item(id)
);

CREATE TABLE tax_rate (
    id text,
    active boolean,
    created timestamp,
    description text,
    display_name text,
    inclusive boolean,
    jurisdiction text,
    livemode boolean,
    metadata jsonb,
    percentage double precision,
    PRIMARY KEY (id)
);

CREATE TABLE invoice_item_tax_rate (
    invoice_item_id text,
    tax_rate_id text,
    PRIMARY KEY (invoice_item_id, tax_rate_id),
    FOREIGN KEY (invoice_item_id) REFERENCES invoice_item(id),
    FOREIGN KEY (tax_rate_id) REFERENCES tax_rate(id)
);

CREATE TABLE subscription_item (
    id text,
    subscription_id text,
    plan_id text,
    billing_thresholds_amount_gte bigint,
    billing_thresholds_reset_billing_cycle_anchor boolean,
    created timestamp,
    current_period_end timestamp,
    current_period_start timestamp,
    metadata jsonb,
    quantity bigint,
    PRIMARY KEY (id, subscription_id),
    FOREIGN KEY (subscription_id) REFERENCES subscription_history(id),
    FOREIGN KEY (plan_id) REFERENCES plan(id)
);

CREATE TABLE checkout_session_tax_rate (
    checkout_session_id text,
    tax_rate_id text,
    amount integer,
    PRIMARY KEY (checkout_session_id, tax_rate_id),
    FOREIGN KEY (checkout_session_id) REFERENCES checkout_session(id),
    FOREIGN KEY (tax_rate_id) REFERENCES tax_rate(id)
);

CREATE TABLE balance_transaction (
    id text,
    connected_account_id text,
    payout_id text,
    amount bigint,
    available_on timestamp,
    created timestamp,
    currency text,
    description text,
    exchange_rate double precision,
    fee bigint,
    net bigint,
    reporting_category text,
    "source" text,
    "status" text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (connected_account_id) REFERENCES account(id),
    FOREIGN KEY (payout_id) REFERENCES payout(id)
);

CREATE TABLE apple_pay_domain (
    id text,
    connected_account_id text,
    created timestamp,
    domain_name text,
    livemode boolean,
    PRIMARY KEY (id),
    FOREIGN KEY (connected_account_id) REFERENCES account(id)
);

CREATE TABLE issuing_dispute (
    id text,
    connected_account_id text,
    evidence_fraudlent_uncategorized_file text,
    evidence_other_uncategorized_file text,
    amount bigint,
    created timestamp,
    currency text,
    evidence_fraudlent_dispute_explanation text,
    evidence_other_dispute_explanation text,
    livemode boolean,
    metadata jsonb,
    reason text,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (connected_account_id) REFERENCES account(id),
    FOREIGN KEY (evidence_fraudlent_uncategorized_file) REFERENCES file(id),
    FOREIGN KEY (evidence_other_uncategorized_file) REFERENCES file(id)
);

CREATE TABLE dispute_balance_transaction (
    balance_transaction_id text,
    dispute_id text,
    PRIMARY KEY (balance_transaction_id, dispute_id),
    FOREIGN KEY (balance_transaction_id) REFERENCES balance_transaction(id),
    FOREIGN KEY (dispute_id) REFERENCES dispute(id)
);

CREATE TABLE coupon (
    id text,
    amount_off bigint,
    created timestamp,
    currency text,
    duration text,
    duration_in_months bigint,
    is_deleted boolean,
    livemode boolean,
    max_redemptions bigint,
    metadata jsonb,
    "name" text,
    percent_off double precision,
    redeem_by timestamp,
    times_redeemed bigint,
    valid boolean,
    PRIMARY KEY (id)
);

CREATE TABLE invoice_item (
    id text,
    customer_id text,
    invoice_id text,
    plan_id text,
    price_id text,
    subscription_id text,
    subscription_item_id text,
    amount bigint,
    currency text,
    "date" timestamp,
    description text,
    discountable boolean,
    is_deleted boolean,
    livemode boolean,
    metadata jsonb,
    period_end bigint,
    period_start bigint,
    proration boolean,
    quantity bigint,
    test_clock text,
    unit_amount bigint,
    unit_amount_decimal text,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id),
    FOREIGN KEY (plan_id) REFERENCES plan(id),
    FOREIGN KEY (price_id) REFERENCES price(id),
    FOREIGN KEY (subscription_id) REFERENCES subscription_history(id),
    FOREIGN KEY (subscription_item_id) REFERENCES subscription_item(id)
);

CREATE TABLE subscription_schedule (
    id text,
    customer_id text,
    subscription_id text,
    canceled_at timestamp,
    completed_at timestamp,
    created timestamp,
    current_phase_end_date timestamp,
    current_phase_start_date timestamp,
    end_behavior text,
    livemode boolean,
    metadata jsonb,
    released_at timestamp,
    released_subscription text,
    "status" text,
    -- default_settings_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (subscription_id) REFERENCES subscription_history(id)
);
