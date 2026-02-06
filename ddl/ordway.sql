CREATE TABLE statement (
    statement_id text,
    customer_id text,
    company_id text,
    created_by text,
    created_date text,
    end_date text,
    integer text,
    start_date text,
    statement_date text,
    template_id text,
    updated_by text,
    updated_date text,
    url text,
    PRIMARY KEY (statement_id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE credit_line_item (
    line_no text,
    credit_id text,
    product_id text,
    credit_account text,
    description text,
    effective_price text,
    line_tax text,
    product_name text,
    quantity text,
    tax_override text,
    taxable text,
    unit_price text,
    PRIMARY KEY (line_no, credit_id),
    FOREIGN KEY (credit_id) REFERENCES credit(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE credit_subtotal (
    _fivetran_id text,
    credit_id text,
    subtotal_name text,
    "value" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (credit_id) REFERENCES credit(id)
);

CREATE TABLE credit_invoice (
    credit_id text,
    id text,
    amount_applied text,
    created_by text,
    created_date text,
    updated_by text,
    updated_date text,
    PRIMARY KEY (credit_id, id),
    FOREIGN KEY (credit_id) REFERENCES credit(id),
    FOREIGN KEY (id) REFERENCES invoice(id)
);

CREATE TABLE credit_custom_field (
    "name" text,
    credit_id text,
    "value" text,
    PRIMARY KEY ("name", credit_id),
    FOREIGN KEY (credit_id) REFERENCES credit(id)
);

CREATE TABLE credit (
    id text,
    customer_id text,
    applied_amount text,
    auto_apply text,
    billing_contact_address_1 text,
    billing_contact_address_2 text,
    billing_contact_city text,
    billing_contact_country text,
    billing_contact_county text,
    billing_contact_department text,
    billing_contact_display_name text,
    billing_contact_email text,
    billing_contact_first_name text,
    billing_contact_job_title text,
    billing_contact_last_name text,
    billing_contact_mobile text,
    billing_contact_notes text,
    billing_contact_phone text,
    billing_contact_state text,
    billing_contact_zip text,
    conversion_rate text,
    created_by text,
    created_date text,
    credit_amount text,
    credit_date text,
    credit_tax text,
    credit_type text,
    currency text,
    gl_account text,
    l_grouping_for_calculations text,
    notes text,
    reference_number text,
    refunds jsonb,
    reversed_on text,
    shipping_contact_address_1 text,
    shipping_contact_address_2 text,
    shipping_contact_city text,
    shipping_contact_country text,
    shipping_contact_county text,
    shipping_contact_department text,
    shipping_contact_display_name text,
    shipping_contact_email text,
    shipping_contact_first_name text,
    shipping_contact_job_title text,
    shipping_contact_last_name text,
    shipping_contact_mobile text,
    shipping_contact_notes text,
    shipping_contact_phone text,
    shipping_contact_state text,
    shipping_contact_zip text,
    "status" text,
    subtotal text,
    unapplied_amount text,
    updated_by text,
    updated_date timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE revenue_rule_custom_field (
    "name" text,
    revenue_rule_id text,
    "value" text,
    PRIMARY KEY ("name", revenue_rule_id),
    FOREIGN KEY (revenue_rule_id) REFERENCES revenue_rule(id)
);

CREATE TABLE revenue_rule (
    id text,
    created_by text,
    created_date text,
    "name" text,
    posting_day text,
    posting_method text,
    recognition_method text,
    recognition_schedule_period text,
    recognition_term text,
    "status" text,
    updated_by text,
    updated_date text,
    PRIMARY KEY (id)
);

CREATE TABLE plan_charge_transaction_posting_entries (
    _fivetran_id text,
    plan_charge_id text,
    plan_id text,
    credit_account text,
    debit_account text,
    transaction_type text,
    PRIMARY KEY (_fivetran_id, plan_charge_id, plan_id),
    FOREIGN KEY (plan_charge_id) REFERENCES plan_charge(id),
    FOREIGN KEY (plan_id) REFERENCES plan_charge(plan_id)
);

CREATE TABLE plan_charge_tier (
    _fivetran_id text,
    plan_charge_id text,
    plan_id text,
    ending_unit text,
    price text,
    starting_unit text,
    tier text,
    "type" text,
    PRIMARY KEY (_fivetran_id, plan_charge_id, plan_id),
    FOREIGN KEY (plan_charge_id) REFERENCES plan_charge(id),
    FOREIGN KEY (plan_id) REFERENCES plan_charge(plan_id)
);

CREATE TABLE plan_charge_custom_field (
    "name" text,
    plan_charge_id text,
    plan_id text,
    "value" text,
    PRIMARY KEY ("name", plan_charge_id, plan_id),
    FOREIGN KEY (plan_charge_id) REFERENCES plan_charge(id),
    FOREIGN KEY (plan_id) REFERENCES plan_charge(plan_id)
);

CREATE TABLE plan_charge (
    id text,
    plan_id text,
    product_id text,
    revenue_rule_id text,
    auto_refill_prepayment_units text,
    backcharge_current_period text,
    billing_day text,
    billing_period text,
    billing_period_start_alignment text,
    charge_billing_date text,
    charge_inherited_product text,
    dealhub_name text,
    defaults_from_product text,
    description text,
    effective_date text,
    included_units text,
    line_no text,
    list_price text,
    "name" text,
    original_type text,
    prepaid_units_enable text,
    prepaid_units_expiry text,
    prepayment_amount text,
    prepayment_periods text,
    pricing_model text,
    recognition_start_date text,
    refill_prepaid_units_for text,
    refill_qty text,
    refund_units_on_cancel text,
    salesforce_charge_id text,
    salesforce_id text,
    timing text,
    transaction_price text,
    "type" text,
    unit_of_measure text,
    unused_prepayment_units text,
    PRIMARY KEY (id, plan_id),
    FOREIGN KEY (plan_id) REFERENCES plan(id),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (revenue_rule_id) REFERENCES revenue_rule(id)
);

CREATE TABLE plan_custom_field (
    "name" text,
    plan_id text,
    "value" text,
    PRIMARY KEY ("name", plan_id),
    FOREIGN KEY (plan_id) REFERENCES plan(id)
);

CREATE TABLE plan (
    id text,
    created_by text,
    created_date text,
    description text,
    discount_tiers text,
    historical_zuora_id text,
    "name" text,
    public_url text,
    salesforce_id text,
    "status" text,
    updated_by text,
    updated_date timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE product_transaction_posting_entry (
    _fivetran_id text,
    product_id text,
    credit_account text,
    debit_account text,
    transaction_type text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE product_custom_field (
    "name" text,
    product_id text,
    "value" text,
    PRIMARY KEY ("name", product_id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE product (
    id text,
    revenue_rule_id text,
    country text,
    created_by text,
    created_date text,
    currency text,
    description text,
    location_id text,
    "name" text,
    price text,
    primary_tag text,
    product_code text,
    recognition_start_date text,
    region text,
    salesforce_id text,
    show_revenue_schedules text,
    sku text,
    "status" text,
    taxable text,
    updated_by text,
    updated_date text,
    PRIMARY KEY (id),
    FOREIGN KEY (revenue_rule_id) REFERENCES revenue_rule(id)
);

CREATE TABLE orders_line_item_custom_field (
    "name" text,
    orders_line_item_line_no text,
    orders_line_item_orders_id text,
    "value" text,
    PRIMARY KEY ("name", orders_line_item_line_no, orders_line_item_orders_id),
    FOREIGN KEY (orders_line_item_line_no) REFERENCES orders_line_item(line_no),
    FOREIGN KEY (orders_line_item_orders_id) REFERENCES orders_line_item(orders_id)
);

CREATE TABLE orders_line_item (
    line_no text,
    orders_id text,
    product_id text,
    description text,
    discount text,
    effective_price text,
    product_name text,
    quantity text,
    unit_price text,
    PRIMARY KEY (line_no, orders_id),
    FOREIGN KEY (orders_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE orders_custom_field (
    "name" text,
    orders_id text,
    "value" text,
    PRIMARY KEY ("name", orders_id),
    FOREIGN KEY (orders_id) REFERENCES orders(id)
);

CREATE TABLE orders (
    id text,
    coupon_code text,
    customer_id text,
    invoice_id text,
    bill_contact_id text,
    company_name text,
    created_by text,
    created_date text,
    currency text,
    notes text,
    order_amount text,
    order_date text,
    payment_terms text,
    separate_invoice text,
    shipping_contact_id text,
    "status" text,
    updated_by text,
    updated_date timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (coupon_code) REFERENCES coupon(code),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id)
);

CREATE TABLE refund (
    id text,
    credit_id text,
    customer_id text,
    invoice_id text,
    payment_id text,
    created_by text,
    created_date text,
    currency text,
    notes text,
    reference_number text,
    refund_amount text,
    refund_date text,
    refund_status text,
    refund_type text,
    updated_by text,
    updated_date timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (credit_id) REFERENCES credit(id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id),
    FOREIGN KEY (payment_id) REFERENCES payments(id)
);

CREATE TABLE chart_of_account_custom_field (
    "name" text,
    chart_of_account_code text,
    "value" text,
    PRIMARY KEY ("name", chart_of_account_code),
    FOREIGN KEY (chart_of_account_code) REFERENCES chart_of_account(code)
);

CREATE TABLE chart_of_account (
    code text,
    account_type text,
    created_by text,
    created_date text,
    description text,
    "name" text,
    parent_account text,
    "status" text,
    sub_type text,
    updated_by text,
    updated_date timestamp,
    PRIMARY KEY (code)
);

CREATE TABLE payments_run (
    id text,
    created_by text,
    currency text,
    failure_count text,
    filter_options jsonb,
    payments_failed_value text,
    payments_success_value text,
    payments_total_value text,
    refunds_failed_value text,
    refunds_success_value text,
    refunds_total_value text,
    "status" text,
    success_count text,
    target_date text,
    updated_by text,
    PRIMARY KEY (id)
);

CREATE TABLE billing_run (
    id text,
    charge_type text,
    created_by text,
    created_date text,
    currency text,
    customer_filter_options text,
    filter_options jsonb,
    invoice_date text,
    invoices_count text,
    invoices_total text,
    "status" text,
    subscription_filter_options jsonb,
    target_date text,
    updated_by text,
    updated_date timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE subscription_plan_transaction_posting_entries (
    _fivetran_id text,
    subscription_id text,
    subscription_plan_id text,
    subscription_plan_index text,
    subscription_version text,
    credit_account text,
    debit_account text,
    transaction_type text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (subscription_id) REFERENCES subscription_plan(subscription_id),
    FOREIGN KEY (subscription_plan_id) REFERENCES subscription_plan(id),
    FOREIGN KEY (subscription_plan_index) REFERENCES subscription_plan("index"),
    FOREIGN KEY (subscription_version) REFERENCES subscription_plan(subscription_version)
);

CREATE TABLE subscription_plan_custom_field (
    "name" text,
    subscription_id text,
    subscription_plan_index text,
    subscription_version text,
    subscription_plan_id text,
    "value" text,
    PRIMARY KEY ("name", subscription_id, subscription_plan_index, subscription_version),
    FOREIGN KEY (subscription_id) REFERENCES subscription_plan(subscription_id),
    FOREIGN KEY (subscription_plan_index) REFERENCES subscription_plan("index"),
    FOREIGN KEY (subscription_version) REFERENCES subscription_plan(subscription_version),
    FOREIGN KEY (subscription_plan_id) REFERENCES subscription_plan(id)
);

CREATE TABLE subscription_plan (
    "index" text,
    id text,
    subscription_id text,
    subscription_version text,
    charge_id text,
    product_id text,
    revenue_rule_id text,
    revenue_schedule_id text,
    backcharge_current_period text,
    billing_day text,
    billing_period text,
    billing_period_start_alignment text,
    billing_schedule_id text,
    charge_billing_date text,
    charge_end_date text,
    charge_start_date text,
    charge_timing text,
    charge_type text,
    completion_date text,
    current_period_end_date text,
    current_period_start_date text,
    defaults_from_plan text,
    discount text,
    discount_tiers text,
    effective_date text,
    effective_price text,
    included_units text,
    l_grouping_for_calculations text,
    list_price text,
    list_price_base text,
    original_type text,
    override_renewal_increment_percent text,
    prepayment_enabled text,
    price_base text,
    pricing_model text,
    product_code text,
    prorate_partial_periods text,
    quantity text,
    recognition_start_date text,
    refund_units_on_cancel text,
    region text,
    remove_units_on_cancel text,
    renewal_increment_percent text,
    rewards_discount_eligible text,
    salesforce_id text,
    subscription_line_id text,
    transaction_price text,
    true_up_eligible text,
    unit_of_measure text,
    updated_transaction_price text,
    PRIMARY KEY ("index", id, subscription_id, subscription_version),
    FOREIGN KEY (id) REFERENCES plan(id),
    FOREIGN KEY (subscription_id) REFERENCES subscription(id),
    FOREIGN KEY (subscription_version) REFERENCES subscription(version),
    FOREIGN KEY (charge_id) REFERENCES plan_charge(id),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (revenue_rule_id) REFERENCES revenue_rule(id),
    FOREIGN KEY (revenue_schedule_id) REFERENCES revenue_schedule(id)
);

CREATE TABLE subscription_custom_field (
    "name" text,
    subscription_id text,
    subscription_version text,
    "value" text,
    PRIMARY KEY ("name", subscription_id, subscription_version),
    FOREIGN KEY (subscription_id) REFERENCES subscription(id),
    FOREIGN KEY (subscription_version) REFERENCES subscription(version)
);

CREATE TABLE subscription (
    id text,
    version text,
    customer_id text,
    auto_renew text,
    bill_contact_id text,
    bill_contact_sf_id text,
    billing_start_date text,
    cancellation_date text,
    cancellation_type text,
    cmrr text,
    contract_effective_date text,
    contract_term text,
    coupon_code text,
    created_by text,
    created_date text,
    currency text,
    current_term_end_date text,
    current_term_start_date text,
    customer_salesforce_id text,
    defer_start_date text,
    discounted_cmrr text,
    historical_zuora_id text,
    min_commited_value text,
    min_commited_value_docv text,
    min_commited_value_idv text,
    min_commited_value_kyb text,
    min_commited_value_mobile_id text,
    min_commited_value_utility_id text,
    min_commited_value_watchlist text,
    min_commitment_end_date text,
    min_commitment_end_date_docv text,
    min_commitment_end_date_idv text,
    min_commitment_end_date_kyb text,
    min_commitment_end_date_mobile_id text,
    min_commitment_end_date_utility_id text,
    min_commitment_end_date_watchlist text,
    mrr text,
    notes text,
    order_placed_at text,
    payment_terms text,
    renewal_increment_percent text,
    renewal_term text,
    salesforce_id text,
    separate_invoice text,
    service_start_date text,
    shipping_contact_id text,
    shipping_contact_sf_id text,
    "status" text,
    tcv text,
    updated_by text,
    updated_date timestamp,
    version_type text,
    PRIMARY KEY (id, version),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE billing_schedule_line_custom_field (
    "name" text,
    billing_schedule_line_id text,
    "value" text,
    PRIMARY KEY ("name", billing_schedule_line_id),
    FOREIGN KEY (billing_schedule_line_id) REFERENCES billing_schedule_line(id)
);

CREATE TABLE billing_schedule_line (
    id text,
    billing_schedule_id text,
    amount text,
    charge_ready_date text,
    created_by text,
    created_date text,
    description text,
    discount text,
    end_date text,
    expired_units text,
    invoiced text,
    l_grouping_for_calculations text,
    line_type text,
    list_price text,
    list_price_base text,
    quantity text,
    start_date text,
    unit_price text,
    unused_prepayment_units text,
    updated_by text,
    updated_date text,
    usages jsonb,
    PRIMARY KEY (id, billing_schedule_id),
    FOREIGN KEY (billing_schedule_id) REFERENCES billing_schedule(id)
);

CREATE TABLE billing_schedule_custom_field (
    "name" text,
    billing_schedule_id text,
    "value" text,
    PRIMARY KEY ("name", billing_schedule_id),
    FOREIGN KEY (billing_schedule_id) REFERENCES billing_schedule(id)
);

CREATE TABLE billing_schedule (
    id text,
    charge_id text,
    customer_id text,
    product_id text,
    subscription_id text,
    created_by text,
    created_date text,
    currency text,
    end_date text,
    key_metrics_amount_invoiced text,
    key_metrics_annual_contract_revenue text,
    key_metrics_monthly_recurring_revenue text,
    key_metrics_total_contract_revenue text,
    start_date text,
    updated_by text,
    updated_date timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (charge_id) REFERENCES plan_charge(id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (subscription_id) REFERENCES subscription(id)
);

CREATE TABLE coupon (
    id text,
    code text,
    created_by text,
    created_date text,
    criteria_value text,
    discount_criteria text,
    discount_type text,
    discount_value text,
    display_text text,
    duration_period text,
    expiration_date text,
    "status" text,
    trial_type text,
    trial_value text,
    updated_by text,
    updated_date text,
    usage_count text,
    usage_limit text,
    PRIMARY KEY (id)
);

CREATE TABLE revenue_schedule_line (
    _fivetran_id text,
    revenue_schedule_id text,
    amount text,
    currency text,
    custom_fields jsonb,
    exchange_rate text,
    financial_period text,
    period_revenue text,
    posted text,
    posting_date text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (revenue_schedule_id) REFERENCES revenue_schedule(id)
);

CREATE TABLE revenue_schedule (
    id text,
    charge_id text,
    customer_id text,
    plan_id text,
    product_id text,
    charge_timing text,
    created_by text,
    created_date text,
    end_date text,
    recognized_revenue text,
    source_transaction text,
    start_date text,
    total_revenue text,
    unrecognized_revenue text,
    updated_by text,
    updated_date timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (charge_id) REFERENCES plan_charge(id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (plan_id) REFERENCES plan(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE customer_contact_custom_field (
    "name" text,
    customer_contact_customer_id text,
    customer_contact_id text,
    "value" text,
    PRIMARY KEY ("name", customer_contact_customer_id, customer_contact_id),
    FOREIGN KEY (customer_contact_customer_id) REFERENCES customer_contact(customer_id),
    FOREIGN KEY (customer_contact_id) REFERENCES customer_contact(id)
);

CREATE TABLE customer_contact (
    id text,
    customer_id text,
    address_1 text,
    address_2 text,
    city text,
    country text,
    county text,
    created_by text,
    created_date text,
    department text,
    display_name text,
    email text,
    first_name text,
    is_unrelated_contact text,
    job_title text,
    last_name text,
    mobile text,
    notes text,
    phone text,
    salesforce_id text,
    "state" text,
    updated_by text,
    updated_date text,
    zip text,
    PRIMARY KEY (id, customer_id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE customer_custom_field (
    "name" text,
    customer_id text,
    "value" text,
    PRIMARY KEY ("name", customer_id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE customer (
    id text,
    ach_enabled text,
    auto_pay text,
    balance text,
    banking_info text,
    billing_batch text,
    billing_contact_email text,
    billing_contact_id text,
    billing_cycle_day text,
    child_customers text,
    cmrr text,
    created_by text,
    created_date text,
    credit_enabled text,
    cumulative_rewards text,
    currency text,
    customer_type text,
    description text,
    discount_amt text,
    discount_month text,
    discount_tiers text,
    discount_tiers_docv text,
    discount_tiers_idv text,
    discount_tiers_kyb text,
    discount_tiers_mobile_id text,
    discount_tiers_utility_id text,
    discount_tiers_watchlist text,
    discounted_cmrr text,
    edit_auto_pay text,
    email text,
    email_preference text,
    flat_discount_percent text,
    flat_discount_percent_docv text,
    flat_discount_percent_idv text,
    flat_discount_percent_kyb text,
    flat_discount_percent_mobile_id text,
    flat_discount_percent_utility_id text,
    flat_discount_percent_watchlist text,
    historical_zuora_id text,
    last_day_previous_month text,
    "name" text,
    open_invoices_url text,
    participating_in_rewards_discount text,
    participating_in_true_up text,
    pay_now_url text,
    payment_gateway_id text,
    payment_terms text,
    print text,
    print_preference text,
    salesforce_id text,
    shipping_contact_email text,
    shipping_contact_id text,
    "status" text,
    suspended text,
    tax_exempt text,
    true_up_start_date text,
    update_payment_method_url text,
    updated_by text,
    updated_date timestamp,
    vip text,
    website text,
    zero_balance_needed text,
    PRIMARY KEY (id)
);

CREATE TABLE payments_invoice (
    id text,
    payments_id text,
    amount_applied text,
    created_by text,
    created_date text,
    updated_by text,
    updated_date text,
    PRIMARY KEY (id, payments_id),
    FOREIGN KEY (id) REFERENCES invoice(id),
    FOREIGN KEY (payments_id) REFERENCES payments(id)
);

CREATE TABLE payments_refund (
    id text,
    payments_id text,
    amount_applied text,
    created_by text,
    created_date text,
    updated_by text,
    updated_date text,
    PRIMARY KEY (id, payments_id),
    FOREIGN KEY (id) REFERENCES refund(id),
    FOREIGN KEY (payments_id) REFERENCES payments(id)
);

CREATE TABLE payments_custom_field (
    "name" text,
    payments_id text,
    "value" text,
    PRIMARY KEY ("name", payments_id),
    FOREIGN KEY (payments_id) REFERENCES payments(id)
);

CREATE TABLE payments (
    id text,
    customer_id text,
    payment_run_id text,
    applied_amount text,
    auto_apply text,
    conversion_rate text,
    created_by text,
    created_date text,
    currency text,
    email_status text,
    failed_attempt text,
    failure_reason text,
    fee_amount text,
    gl_account text,
    notes text,
    opt jsonb,
    payment_amount text,
    payment_date text,
    payment_method text,
    payment_type text,
    reference_number text,
    refunded_amount text,
    retried_attempts text,
    "status" text,
    unapplied_amount text,
    updated_by text,
    updated_date timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (payment_run_id) REFERENCES payments_run(id)
);

CREATE TABLE journal_entry_custom_field (
    "name" text,
    journal_entry_journal_id text,
    journal_entry_line_no text,
    "value" text,
    PRIMARY KEY ("name", journal_entry_journal_id, journal_entry_line_no),
    FOREIGN KEY (journal_entry_journal_id) REFERENCES journal_entry(journal_id),
    FOREIGN KEY (journal_entry_line_no) REFERENCES journal_entry(line_no)
);

CREATE TABLE journal_entry (
    line_no text,
    journal_id text,
    customer_id text,
    account text,
    credit text,
    customer_name text,
    debit text,
    description text,
    PRIMARY KEY (line_no, journal_id),
    FOREIGN KEY (journal_id) REFERENCES journal(id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE journal (
    id text,
    conversion_rate text,
    created_by text,
    created_date text,
    "date" text,
    description text,
    source_id text,
    source_type text,
    transaction_amount text,
    transaction_currency text,
    updated_by text,
    updated_date timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE invoice_line_item_tax_line (
    _fivetran_id text,
    invoice_line_item_line_no text,
    "name" text,
    "value" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (invoice_line_item_line_no) REFERENCES invoice_line_item(line_no)
);

CREATE TABLE invoice_line_item_custom_field (
    "name" text,
    invoice_line_item_invoice_id text,
    invoice_line_item_line_no text,
    "value" text,
    PRIMARY KEY ("name", invoice_line_item_invoice_id, invoice_line_item_line_no),
    FOREIGN KEY (invoice_line_item_invoice_id) REFERENCES invoice_line_item(invoice_id),
    FOREIGN KEY (invoice_line_item_line_no) REFERENCES invoice_line_item(line_no)
);

CREATE TABLE invoice_line_item (
    line_no text,
    invoice_id text,
    charge_id text,
    customer_id text,
    plan_id text,
    product_id text,
    subscription_id text,
    subscription_line_id text,
    applied_tiers jsonb,
    charge_type text,
    description text,
    discount text,
    effective_price text,
    end_date text,
    included_quantity text,
    line_tax text,
    list_price text,
    list_price_base text,
    quantity text,
    start_date text,
    taxable text,
    unit_price text,
    PRIMARY KEY (line_no, invoice_id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id),
    FOREIGN KEY (charge_id) REFERENCES plan_charge(id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (plan_id) REFERENCES plan(id),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (subscription_id) REFERENCES subscription(id),
    FOREIGN KEY (subscription_line_id) REFERENCES subscription_plan(subscription_line_id)
);

CREATE TABLE invoice_subtotal (
    _fivetran_id text,
    invoice_id text,
    subtotal_name text,
    "value" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id)
);

CREATE TABLE invoice_custom_field (
    "name" text,
    invoice_id text,
    "value" text,
    PRIMARY KEY ("name", invoice_id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id)
);

CREATE TABLE invoice (
    id text,
    customer_id text,
    balance text,
    billing_contact_address_1 text,
    billing_contact_address_2 text,
    billing_contact_city text,
    billing_contact_country text,
    billing_contact_county text,
    billing_contact_department text,
    billing_contact_display_name text,
    billing_contact_email text,
    billing_contact_first_name text,
    billing_contact_job_title text,
    billing_contact_last_name text,
    billing_contact_mobile text,
    billing_contact_phone text,
    billing_contact_state text,
    billing_contact_zip text,
    billing_run_id text,
    created_by text,
    created_date text,
    credits jsonb,
    currency text,
    discount_display_name text,
    due_date text,
    emailed text,
    end_date text,
    exchange_rate text,
    invoice_amount text,
    invoice_date text,
    invoice_tax text,
    notes text,
    paid_amount text,
    payment_term_id text,
    payment_terms text,
    payments jsonb,
    refunds jsonb,
    shipping_contact_address_1 text,
    shipping_contact_address_2 text,
    shipping_contact_city text,
    shipping_contact_country text,
    shipping_contact_county text,
    shipping_contact_department text,
    shipping_contact_display_name text,
    shipping_contact_email text,
    shipping_contact_first_name text,
    shipping_contact_job_title text,
    shipping_contact_last_name text,
    shipping_contact_mobile text,
    shipping_contact_phone text,
    shipping_contact_state text,
    shipping_contact_zip text,
    start_date text,
    "status" text,
    subtotal text,
    updated_by text,
    updated_date timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE usage_custom_field (
    "name" text,
    usage_id text,
    "value" text,
    PRIMARY KEY ("name", usage_id),
    FOREIGN KEY (usage_id) REFERENCES usage(id)
);

CREATE TABLE usage (
    id text,
    charge_id text,
    customer_id text,
    subscription_id text,
    subscription_line_id text,
    created_by text,
    created_date text,
    currency text,
    "date" text,
    description text,
    error_message text,
    invoiced text,
    l_grouping_for_calculations text,
    quantity text,
    "status" text,
    unit_of_measure text,
    updated_by text,
    updated_date text,
    PRIMARY KEY (id),
    FOREIGN KEY (charge_id) REFERENCES plan_charge(id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (subscription_id) REFERENCES subscription(id),
    FOREIGN KEY (subscription_line_id) REFERENCES subscription_plan(subscription_line_id)
);

CREATE TABLE payments_method (
    id text,
    customer_id text,
    customer_payment_gateway_id text,
    account_holder_name text,
    account_number text,
    country text,
    cvc text,
    defaults text,
    expiry text,
    payment_method_id text,
    payment_type text,
    "status" text,
    "type" text,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (customer_payment_gateway_id) REFERENCES customer(payment_gateway_id)
);

CREATE TABLE customer_note (
    id text,
    customer_id text,
    company_id text,
    created_at text,
    description text,
    file_upload_content_type text,
    file_upload_file_name text,
    file_upload_file_size text,
    file_upload_updated_at text,
    has_versions text,
    title text,
    updated_at text,
    user_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);
