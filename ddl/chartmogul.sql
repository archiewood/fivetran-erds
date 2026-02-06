CREATE TABLE data_source (
    uuid text,
    created_at text,
    "name" text,
    "status" text,
    systems text,
    PRIMARY KEY (uuid)
);

CREATE TABLE plan_group (
    uuid text,
    "name" text,
    plans_count bigint,
    PRIMARY KEY (uuid)
);

CREATE TABLE plan (
    uuid text,
    data_source_uuid text,
    external_id text,
    interval_count bigint,
    interval_unit text,
    "name" text,
    PRIMARY KEY (uuid),
    FOREIGN KEY (data_source_uuid) REFERENCES data_source(uuid)
);

CREATE TABLE mrr_churn_rate (
    "date" text,
    mrr_churn_rate double precision,
    percentage_change double precision,
    PRIMARY KEY ("date")
);

CREATE TABLE account (
    _fivetran_id text,
    currency text,
    "name" text,
    time_zone text,
    week_start_on text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE annualized_run_rate (
    "date" text,
    arr bigint,
    percentage_change double precision,
    PRIMARY KEY ("date")
);

CREATE TABLE customer_data_source_uuids (
    customer_uuid text,
    data_source_uuid text,
    PRIMARY KEY (customer_uuid, data_source_uuid),
    FOREIGN KEY (customer_uuid) REFERENCES customer(uuid),
    FOREIGN KEY (data_source_uuid) REFERENCES data_source(uuid)
);

CREATE TABLE customer_attribute_tag (
    tags text,
    customer_uuid text,
    PRIMARY KEY (tags, customer_uuid),
    FOREIGN KEY (customer_uuid) REFERENCES customer(uuid)
);

CREATE TABLE customer_external_ids (
    external_id text,
    customer_uuid text,
    PRIMARY KEY (external_id, customer_uuid),
    FOREIGN KEY (customer_uuid) REFERENCES customer(uuid)
);

CREATE TABLE customer (
    uuid text,
    data_source_uuid text,
    address_address_zip text,
    address_city text,
    address_country text,
    address_state text,
    arr bigint,
    attributes_clearbit_company_category_industry text,
    attributes_clearbit_company_category_industry_group text,
    attributes_clearbit_company_category_sector text,
    attributes_clearbit_company_category_sub_industry text,
    attributes_clearbit_company_domain text,
    attributes_clearbit_company_legal_name text,
    attributes_clearbit_company_metrics_alexa_global_rank bigint,
    attributes_clearbit_company_metrics_employees bigint,
    attributes_clearbit_company_metrics_google_rank bigint,
    attributes_clearbit_company_metrics_market_cap text,
    attributes_clearbit_company_metrics_raised bigint,
    attributes_clearbit_company_name text,
    attributes_clearbit_company_url text,
    attributes_clearbit_person_employment_name text,
    attributes_clearbit_person_name_full_name text,
    attributes_stripe_coupon boolean,
    attributes_stripe_uid bigint,
    billing_system_type text,
    billing_system_url text,
    chartmogul_url text,
    city text,
    company text,
    country text,
    currency text,
    currency_sign text,
    customer_since text,
    email text,
    external_id text,
    free_trial_started_at text,
    id bigint,
    lead_created_at text,
    mrr bigint,
    "name" text,
    "state" text,
    "status" text,
    zip text,
    -- custom_* (dynamic column),
    PRIMARY KEY (uuid),
    FOREIGN KEY (data_source_uuid) REFERENCES data_source(uuid)
);

CREATE TABLE customer_churn_rate (
    "date" text,
    customer_churn_rate double precision,
    percentage_change double precision,
    PRIMARY KEY ("date")
);

CREATE TABLE plan_in_plan_group (
    plan_group_uuid text,
    uuid text,
    data_source_uuid text,
    external_id text,
    interval_count bigint,
    interval_unit text,
    "name" text,
    PRIMARY KEY (plan_group_uuid, uuid),
    FOREIGN KEY (plan_group_uuid) REFERENCES plan_group(uuid),
    FOREIGN KEY (uuid) REFERENCES plan(uuid),
    FOREIGN KEY (data_source_uuid) REFERENCES data_source(uuid)
);

CREATE TABLE customer_count (
    "date" text,
    customers bigint,
    percentage_change double precision,
    PRIMARY KEY ("date")
);

CREATE TABLE customer_lifetime_value (
    "date" text,
    ltv bigint,
    percentage_change double precision,
    PRIMARY KEY ("date")
);

CREATE TABLE cancellation_date (
    cancellation_date text,
    subscription_uuid text,
    PRIMARY KEY (cancellation_date, subscription_uuid),
    FOREIGN KEY (subscription_uuid) REFERENCES subscription(uuid)
);

CREATE TABLE subscription (
    uuid text,
    customer_uuid text,
    data_source_uuid text,
    plan_uuid text,
    external_id text,
    subscription_set_external_id text,
    PRIMARY KEY (uuid, customer_uuid),
    FOREIGN KEY (customer_uuid) REFERENCES customer(uuid),
    FOREIGN KEY (data_source_uuid) REFERENCES data_source(uuid),
    FOREIGN KEY (plan_uuid) REFERENCES plan(uuid)
);

CREATE TABLE average_sale_price (
    "date" text,
    asp bigint,
    percentage_change double precision,
    PRIMARY KEY ("date")
);

CREATE TABLE invoice_line_item (
    uuid text,
    data_source_uuid text,
    invoice_uuid text,
    plan_uuid text,
    subscription_uuid text,
    account_code text,
    amount_in_cents bigint,
    discount_amount_in_cents bigint,
    discount_code text,
    discount_description text,
    event_order bigint,
    external_id text,
    prorated boolean,
    proration_type text,
    quantity bigint,
    service_period_end text,
    service_period_start text,
    subscription_external_id text,
    subscription_set_external_id text,
    tax_amount_in_cents bigint,
    transaction_fees_currency text,
    transaction_fees_in_cents bigint,
    "type" text,
    PRIMARY KEY (uuid),
    FOREIGN KEY (data_source_uuid) REFERENCES data_source(uuid),
    FOREIGN KEY (invoice_uuid) REFERENCES invoice(uuid),
    FOREIGN KEY (plan_uuid) REFERENCES plan(uuid),
    FOREIGN KEY (subscription_uuid) REFERENCES subscription(uuid)
);

CREATE TABLE invoice_transaction (
    uuid text,
    invoice_uuid text,
    amount_in_cent bigint,
    "date" text,
    external_id text,
    "result" text,
    transaction_fees_currency text,
    transaction_fees_in_cent bigint,
    "type" text,
    PRIMARY KEY (uuid),
    FOREIGN KEY (invoice_uuid) REFERENCES invoice(uuid)
);

CREATE TABLE invoice (
    uuid text,
    customer_uuid text,
    currency text,
    "date" text,
    due_date text,
    external_id text,
    PRIMARY KEY (uuid),
    FOREIGN KEY (customer_uuid) REFERENCES customer(uuid)
);

CREATE TABLE average_revenue_per_account (
    "date" text,
    arpa bigint,
    percentage_change double precision,
    PRIMARY KEY ("date")
);

CREATE TABLE metric_subscription (
    id bigint,
    customer_uuid text,
    arr bigint,
    billing_cycle text,
    billing_cycle_count bigint,
    currency text,
    currency_sign text,
    end_date text,
    external_id text,
    mrr bigint,
    plan text,
    quantity bigint,
    start_date text,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_uuid) REFERENCES customer(uuid)
);

CREATE TABLE monthly_recurring_revenue (
    "date" text,
    mrr bigint,
    mrr_churn bigint,
    mrr_contraction bigint,
    mrr_expansion bigint,
    mrr_new_business bigint,
    mrr_reactivation bigint,
    percentage_change double precision,
    PRIMARY KEY ("date")
);

CREATE TABLE subscription_event (
    id bigint,
    data_source_uuid text,
    amount_in_cents text,
    created_at text,
    currency text,
    data_source_customer_external_id text,
    effective_date text,
    errors jsonb,
    event_date text,
    event_type text,
    external_id text,
    plan_external_id text,
    quantity text,
    retracted_event_id text,
    subscription_external_id text,
    subscription_set_external_id text,
    tax_amount_in_cents bigint,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (data_source_uuid) REFERENCES data_source(uuid)
);

CREATE TABLE activity (
    uuid text,
    customer_uuid text,
    active_subscription_quantity text,
    activity_mrr text,
    activity_mrr_movement text,
    billing_connector_uuid text,
    currency text,
    customer_external_id text,
    customer_name text,
    "date" text,
    description text,
    plan_external_id text,
    subscription_external_id text,
    "type" text,
    PRIMARY KEY (uuid),
    FOREIGN KEY (customer_uuid) REFERENCES customer(uuid)
);
