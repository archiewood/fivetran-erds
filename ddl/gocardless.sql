CREATE TABLE payment (
    id text,
    links_creditor text,
    links_installment_schedule text,
    links_mandate text,
    links_payout text,
    links_subscription text,
    amount double precision,
    amount_refunded double precision,
    charge_date text,
    created_at timestamp,
    currency text,
    description text,
    fx_estimated_exchange_rate text,
    fx_exchange_rate double precision,
    fx_fx_amount double precision,
    fx_fx_currency text,
    metadata text,
    reference text,
    retry_if_possible boolean,
    "status" text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (links_creditor) REFERENCES creditor(id),
    FOREIGN KEY (links_installment_schedule) REFERENCES installment_schedule(id),
    FOREIGN KEY (links_mandate) REFERENCES mandate(id),
    FOREIGN KEY (links_payout) REFERENCES payout(id),
    FOREIGN KEY (links_subscription) REFERENCES subscription(id)
);

CREATE TABLE billing_request_template (
    id text,
    authorisation_url text,
    created_at timestamp,
    mandate_request_currency text,
    mandate_request_metadata text,
    mandate_request_scheme text,
    mandate_request_verify text,
    metadata text,
    "name" text,
    payment_request_amount text,
    payment_request_currency text,
    payment_request_description text,
    payment_request_metadata text,
    payment_request_scheme text,
    redirect_uri text,
    updated_at timestamp,
    -- custom_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE event_customer_notification (
    id text,
    event_id text,
    deadline timestamp,
    mandatory boolean,
    "type" text,
    PRIMARY KEY (id, event_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE event (
    id text,
    links_billing_request text,
    links_creditor text,
    links_customer text,
    links_customer_bank_account text,
    links_installment_schedule text,
    links_mandate text,
    links_mandate_request_mandate text,
    links_new_customer_bank_account text,
    links_new_mandate text,
    links_payment text,
    links_payment_request_payment text,
    links_payout text,
    links_previous_customer_bank_account text,
    links_subscription text,
    "action" text,
    created_at timestamp,
    details_bank_account_id text,
    details_cause text,
    details_currency text,
    details_description text,
    details_not_retrieved_reason text,
    details_origin text,
    details_property text,
    details_reason_code text,
    details_scheme text,
    details_will_attempt_retry text,
    links_bank_authorisation text,
    links_billing_request_flow text,
    links_organisation text,
    links_parent_event text,
    links_payer_authorisation text,
    links_refund text,
    resource_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (links_billing_request) REFERENCES billing_request(id),
    FOREIGN KEY (links_creditor) REFERENCES creditor(id),
    FOREIGN KEY (links_customer) REFERENCES customer(id),
    FOREIGN KEY (links_customer_bank_account) REFERENCES customer_bank_account(id),
    FOREIGN KEY (links_installment_schedule) REFERENCES installment_schedule(id),
    FOREIGN KEY (links_mandate) REFERENCES mandate(id),
    FOREIGN KEY (links_mandate_request_mandate) REFERENCES mandate(id),
    FOREIGN KEY (links_new_customer_bank_account) REFERENCES customer_bank_account(id),
    FOREIGN KEY (links_new_mandate) REFERENCES mandate(id),
    FOREIGN KEY (links_payment) REFERENCES payment(id),
    FOREIGN KEY (links_payment_request_payment) REFERENCES payment(id),
    FOREIGN KEY (links_payout) REFERENCES payout(id),
    FOREIGN KEY (links_previous_customer_bank_account) REFERENCES customer_bank_account(id),
    FOREIGN KEY (links_subscription) REFERENCES subscription(id)
);

CREATE TABLE creditor_scheme_identifier (
    _fivetran_id text,
    creditor_id text,
    address_line_1 text,
    address_line_2 text,
    address_line_3 text,
    can_specify_mandate_reference boolean,
    city text,
    country_code text,
    currency text,
    email text,
    minimum_advance_notice text,
    "name" text,
    phone_number text,
    postal_code text,
    reference text,
    region text,
    scheme text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (creditor_id) REFERENCES creditor(id)
);

CREATE TABLE creditor (
    id text,
    links_default_aud_payout_account text,
    links_default_dkk_payout_account text,
    links_default_eur_payout_account text,
    links_default_gbp_payout_account text,
    links_default_nzd_payout_account text,
    links_default_sek_payout_account text,
    links_default_usd_payout_account text,
    activated boolean,
    address_line_1 text,
    address_line_2 text,
    address_line_3 text,
    can_create_refunds boolean,
    city text,
    country_code text,
    created_at timestamp,
    custom_payment_pages_enabled boolean,
    fx_payout_currency text,
    logo_url text,
    mandate_imports_enabled boolean,
    merchant_responsible_for_notifications boolean,
    "name" text,
    postal_code text,
    region text,
    verification_status text,
    PRIMARY KEY (id),
    FOREIGN KEY (links_default_aud_payout_account) REFERENCES creditor_bank_account(id),
    FOREIGN KEY (links_default_dkk_payout_account) REFERENCES creditor_bank_account(id),
    FOREIGN KEY (links_default_eur_payout_account) REFERENCES creditor_bank_account(id),
    FOREIGN KEY (links_default_gbp_payout_account) REFERENCES creditor_bank_account(id),
    FOREIGN KEY (links_default_nzd_payout_account) REFERENCES creditor_bank_account(id),
    FOREIGN KEY (links_default_sek_payout_account) REFERENCES creditor_bank_account(id),
    FOREIGN KEY (links_default_usd_payout_account) REFERENCES creditor_bank_account(id)
);

CREATE TABLE customer (
    id text,
    address_line_1 text,
    address_line_2 text,
    address_line_3 text,
    city text,
    company_name text,
    country_code text,
    created_at text,
    danish_identity_number text,
    email text,
    family_name text,
    given_name text,
    language text,
    metadata text,
    phone_number text,
    postal_code text,
    region text,
    swedish_identity_number text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE installment_schedule (
    id text,
    links_customer text,
    links_mandate text,
    created_at timestamp,
    currency text,
    metadata text,
    "name" text,
    payment_errors text,
    "status" text,
    total_amount text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (links_customer) REFERENCES customer(id),
    FOREIGN KEY (links_mandate) REFERENCES mandate(id)
);

CREATE TABLE refund (
    id text,
    links_mandate text,
    links_payment text,
    amount double precision,
    created_at timestamp,
    currency text,
    fx_estimated_exchange_rate text,
    fx_exchange_rate double precision,
    fx_fx_amount double precision,
    fx_fx_currency text,
    metadata text,
    reference text,
    "status" text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (links_mandate) REFERENCES mandate(id),
    FOREIGN KEY (links_payment) REFERENCES payment(id)
);

CREATE TABLE billing_request_complete_action (
    complete_action text,
    billing_request_action_index text,
    billing_request_id text,
    PRIMARY KEY (complete_action, billing_request_action_index, billing_request_id),
    FOREIGN KEY (billing_request_action_index) REFERENCES billing_request_action("index"),
    FOREIGN KEY (billing_request_id) REFERENCES billing_request(id)
);

CREATE TABLE billing_request_require_action (
    require_action text,
    billing_request_action_index text,
    billing_request_id text,
    PRIMARY KEY (require_action, billing_request_action_index, billing_request_id),
    FOREIGN KEY (billing_request_action_index) REFERENCES billing_request_action("index"),
    FOREIGN KEY (billing_request_id) REFERENCES billing_request(id)
);

CREATE TABLE billing_request_action (
    "index" text,
    billing_request_id text,
    available_currencies text,
    bank_authorisation text,
    required boolean,
    "status" text,
    "type" text,
    PRIMARY KEY ("index", billing_request_id),
    FOREIGN KEY (billing_request_id) REFERENCES billing_request(id)
);

CREATE TABLE billing_request (
    id text,
    links_creditor text,
    links_customer text,
    links_customer_bank_account text,
    links_mandate_request_mandate text,
    links_payment_request_payment text,
    created_at timestamp,
    creditor_name text,
    fallback_enabled boolean,
    links_bank_authorisation text,
    links_customer_billing_detail text,
    links_mandate_request text,
    links_organisation text,
    mandate_request_currency text,
    mandate_request_metadata text,
    mandate_request_scheme text,
    mandate_request_verify text,
    metadata text,
    payment_request_amount double precision,
    payment_request_app_fee bigint,
    payment_request_currency text,
    payment_request_description text,
    payment_request_metadata text,
    payment_request_scheme text,
    "status" text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (links_creditor) REFERENCES creditor(id),
    FOREIGN KEY (links_customer) REFERENCES customer(id),
    FOREIGN KEY (links_customer_bank_account) REFERENCES customer_bank_account(id),
    FOREIGN KEY (links_mandate_request_mandate) REFERENCES mandate(id),
    FOREIGN KEY (links_payment_request_payment) REFERENCES payment(id)
);

CREATE TABLE institution (
    id text,
    country_code text,
    icon_url text,
    logo_url text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE payout (
    id text,
    links_creditor text,
    links_creditor_bank_account text,
    amount double precision,
    arrival_date text,
    created_at timestamp,
    currency text,
    deducted_fees double precision,
    fx_estimated_exchange_rate text,
    fx_exchange_rate double precision,
    fx_fx_amount double precision,
    fx_fx_currency text,
    metadata text,
    payout_type text,
    reference text,
    "status" text,
    tax_currency text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (links_creditor) REFERENCES creditor(id),
    FOREIGN KEY (links_creditor_bank_account) REFERENCES creditor_bank_account(id)
);

CREATE TABLE block (
    id text,
    active boolean,
    block_type text,
    created_at timestamp,
    reason_description text,
    reason_type text,
    resource_reference text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE subscription_upcoming_payment (
    _fivetran_id text,
    subscription_id text,
    amount double precision,
    charge_date text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (subscription_id) REFERENCES subscription(id)
);

CREATE TABLE subscription (
    id text,
    links_mandate text,
    amount double precision,
    app_fee text,
    count integer,
    created_at timestamp,
    currency text,
    day_of_month integer,
    earliest_charge_date_after_resume text,
    end_date text,
    "interval" integer,
    interval_unit text,
    metadata text,
    "month" text,
    "name" text,
    payment_reference text,
    retry_if_possible boolean,
    start_date text,
    "status" text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (links_mandate) REFERENCES mandate(id)
);

CREATE TABLE currency_exchange_rate (
    _fivetran_id text,
    rate text,
    "source" text,
    target text,
    "time" timestamp,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE tax_rate (
    id text,
    end_date text,
    jurisdiction text,
    start_date text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE customer_bank_account (
    id text,
    links_customer text,
    account_holder_name text,
    account_number_ending text,
    account_type text,
    bank_name text,
    country_code text,
    created_at timestamp,
    currency text,
    email text,
    enabled boolean,
    metadata text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (links_customer) REFERENCES customer(id)
);

CREATE TABLE creditor_bank_account (
    id text,
    links_creditor text,
    account_holder_name text,
    account_number_ending text,
    account_type text,
    bank_name text,
    country_code text,
    created_at timestamp,
    currency text,
    enabled boolean,
    metadata text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (links_creditor) REFERENCES creditor(id)
);

CREATE TABLE mandate (
    id text,
    links_creditor text,
    links_customer text,
    links_customer_bank_account text,
    links_mandate text,
    created_at text,
    metadata text,
    next_possible_charge_date text,
    payments_require_approval boolean,
    reference text,
    scheme text,
    "status" text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (links_creditor) REFERENCES creditor(id),
    FOREIGN KEY (links_customer) REFERENCES customer(id),
    FOREIGN KEY (links_customer_bank_account) REFERENCES customer_bank_account(id),
    FOREIGN KEY (links_mandate) REFERENCES mandate(id)
);

CREATE TABLE payout_item (
    _fivetran_id text,
    payment_id text,
    payout_id text,
    tax_rate_id text,
    amount double precision,
    currency text,
    destination_amount double precision,
    destination_currency text,
    exchange_rate double precision,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (payment_id) REFERENCES payment(id),
    FOREIGN KEY (payout_id) REFERENCES payout(id),
    FOREIGN KEY (tax_rate_id) REFERENCES tax_rate(id)
);
