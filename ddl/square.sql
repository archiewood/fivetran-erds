CREATE TABLE order_service_charge (
    uid text,
    order_id text,
    catalog_object_id text,
    amount_money_amount bigint,
    amount_money_currency text,
    applied_money_amount bigint,
    applied_money_currency text,
    calculation_money text,
    "name" text,
    percentage double precision,
    taxable boolean,
    total_money_amount bigint,
    total_money_currency text,
    total_tax_money_amount bigint,
    total_tax_money_currency text,
    PRIMARY KEY (uid, order_id),
    FOREIGN KEY (order_id) REFERENCES "order"(id),
    FOREIGN KEY (catalog_object_id) REFERENCES catalog_object(id)
);

CREATE TABLE loyalty_reward (
    id text,
    loyalty_account_id text,
    order_id text,
    reward_tier_id text,
    created_at timestamp,
    points integer,
    redeemed_at timestamp,
    "status" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (loyalty_account_id) REFERENCES loyalty_account(id),
    FOREIGN KEY (order_id) REFERENCES "order"(id),
    FOREIGN KEY (reward_tier_id) REFERENCES loyalty_program_reward_tier(id)
);

CREATE TABLE payment (
    id text,
    customer_id text,
    location_id text,
    order_id text,
    amount_money_amount bigint,
    amount_money_currency text,
    app_fee_money_amount bigint,
    app_fee_money_currency text,
    buyer_email_address text,
    created_at timestamp,
    delay_action text,
    delay_duration text,
    delayed_until text,
    employee_id text,
    note text,
    receipt_number text,
    receipt_url text,
    reference_id text,
    refunded_money_amount bigint,
    refunded_money_currency text,
    source_type text,
    "status" text,
    tip_money_amount bigint,
    tip_money_currency text,
    total_money_amount bigint,
    total_money_currency text,
    updated_at timestamp,
    -- billing_address_* (dynamic column),
    -- shipping_address_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (location_id) REFERENCES location(id),
    FOREIGN KEY (order_id) REFERENCES "order"(id)
);

CREATE TABLE loyalty_account (
    id text,
    customer_id text,
    program_id text,
    balance integer,
    created_at timestamp,
    enrolled_at timestamp,
    lifetime_points integer,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (program_id) REFERENCES loyalty_program(id)
);

CREATE TABLE vendor (
    id text,
    account_number text,
    created_at timestamp,
    "name" text,
    note text,
    "status" text,
    updated_at timestamp,
    version integer,
    -- address_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE catalog_item_tax (
    item_id text,
    tax_id text,
    PRIMARY KEY (item_id, tax_id),
    FOREIGN KEY (item_id) REFERENCES catalog_item(id),
    FOREIGN KEY (tax_id) REFERENCES catalog_tax(id)
);

CREATE TABLE employee_wage (
    id text,
    employee_id text,
    hourly_rate_amount bigint,
    hourly_rate_currency text,
    title text,
    PRIMARY KEY (id),
    FOREIGN KEY (employee_id) REFERENCES employee(id)
);

CREATE TABLE catalog_modifier (
    id text,
    "name" text,
    price_money_amount bigint,
    price_money_currency text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES catalog_object(id)
);

CREATE TABLE inventory_count_history (
    calculated_at text,
    catalog_object_id text,
    location_id text,
    catalog_object_type text,
    quantity text,
    "state" text,
    PRIMARY KEY (calculated_at, catalog_object_id, location_id),
    FOREIGN KEY (catalog_object_id) REFERENCES catalog_object(id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE order_line_item_modifier (
    uid text,
    order_id text,
    catalog_object_id text,
    order_line_item_id text,
    base_price_amount bigint,
    base_price_currency text,
    "name" text,
    total_price_amount bigint,
    total_price_currency text,
    PRIMARY KEY (uid, order_id),
    FOREIGN KEY (order_id) REFERENCES "order"(id),
    FOREIGN KEY (catalog_object_id) REFERENCES catalog_object(id),
    FOREIGN KEY (order_line_item_id) REFERENCES order_line_item(uid)
);

CREATE TABLE invoice_recipient (
    invoice_id text,
    customer_id text,
    tax_ids_eu_vat text,
    PRIMARY KEY (invoice_id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE catalog_item_modifier_list_info (
    item_id text,
    modifier_list_id text,
    enabled boolean,
    max_selected_modifiers integer,
    min_selected_modifiers integer,
    PRIMARY KEY (item_id, modifier_list_id),
    FOREIGN KEY (item_id) REFERENCES catalog_item(id),
    FOREIGN KEY (modifier_list_id) REFERENCES catalog_modifier_list(id)
);

CREATE TABLE order_fulfillment (
    _fivetran_id text,
    order_id text,
    "state" text,
    "type" text,
    -- pickup_detail_* (dynamic column),
    PRIMARY KEY (_fivetran_id, order_id),
    FOREIGN KEY (order_id) REFERENCES "order"(id)
);

CREATE TABLE invoice (
    id text,
    location_id text,
    order_id text,
    subscription_id text,
    created_at timestamp,
    delivery_method text,
    description text,
    invoice_number text,
    next_payment_amount bigint,
    next_payment_currency text,
    payment_conditions text,
    public_url text,
    sale_or_service_date text,
    scheduled_at timestamp,
    "status" text,
    store_payment_method_enabled boolean,
    timezone text,
    title text,
    updated_at timestamp,
    version integer,
    -- accepted_payment_method_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (location_id) REFERENCES location(id),
    FOREIGN KEY (order_id) REFERENCES "order"(id),
    FOREIGN KEY (subscription_id) REFERENCES subscription(id)
);

CREATE TABLE order_return_service_charge (
    uid text,
    catalog_object_id text,
    source_service_charge_uid text,
    amount_money_amount bigint,
    amount_money_currency text,
    applied_money_amount bigint,
    applied_money_currency text,
    calculation_phase text,
    "name" text,
    percentage double precision,
    taxable boolean,
    total_money_amount bigint,
    total_money_currency text,
    total_tax_money_amount bigint,
    total_tax_money_currency text,
    PRIMARY KEY (uid),
    FOREIGN KEY (catalog_object_id) REFERENCES catalog_object(id),
    FOREIGN KEY (source_service_charge_uid) REFERENCES "order"(id)
);

CREATE TABLE order_return_tax (
    uid text,
    catalog_object_id text,
    order_return_id text,
    source_tax_uid text,
    applied_money_amount bigint,
    applied_money_currency text,
    "name" text,
    percentage double precision,
    scope text,
    "type" text,
    PRIMARY KEY (uid),
    FOREIGN KEY (catalog_object_id) REFERENCES catalog_object(id),
    FOREIGN KEY (order_return_id) REFERENCES order_return(uid),
    FOREIGN KEY (source_tax_uid) REFERENCES order_line_item_tax(uid)
);

CREATE TABLE subscription_event_phase (
    id text,
    subscription_event_id text,
    order_template_id text,
    ordinal integer,
    plan_phase_uid text,
    PRIMARY KEY (id, subscription_event_id),
    FOREIGN KEY (subscription_event_id) REFERENCES subscription_event(subscription_id)
);

CREATE TABLE catalog_discount (
    id text,
    amount_money_amount bigint,
    amount_money_currency text,
    discount_type text,
    label_color text,
    "name" text,
    percentage double precision,
    pin_required boolean,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES catalog_object(id)
);

CREATE TABLE order_line_item_discount (
    uid text,
    order_id text,
    catalog_object_id text,
    amount_money_amount bigint,
    amount_money_currency text,
    applied_money_amount bigint,
    applied_money_currency text,
    "name" text,
    percentage double precision,
    scope text,
    "type" text,
    PRIMARY KEY (uid, order_id),
    FOREIGN KEY (order_id) REFERENCES "order"(id),
    FOREIGN KEY (catalog_object_id) REFERENCES catalog_object(id)
);

CREATE TABLE dispute_evidence (
    id text,
    dispute_id text,
    evidence_filename text,
    evidence_filetype text,
    evidence_type text,
    uploaded_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (dispute_id) REFERENCES dispute(id)
);

CREATE TABLE catalog_category (
    id text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES catalog_object(id)
);

CREATE TABLE catalog_modifier_in_catalog_modifier_list (
    modifier_id text,
    modifier_list_id text,
    PRIMARY KEY (modifier_id, modifier_list_id),
    FOREIGN KEY (modifier_id) REFERENCES catalog_modifier(id),
    FOREIGN KEY (modifier_list_id) REFERENCES catalog_modifier_list(id)
);

CREATE TABLE device_code (
    id text,
    location_id text,
    code text,
    created_at timestamp,
    device_id text,
    "name" text,
    pair_by timestamp,
    paired_at timestamp,
    product_type text,
    "status" text,
    status_changed_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE subscription_phase (
    id text,
    subscription_id text,
    order_template_id text,
    ordinal integer,
    plan_phase_uid text,
    PRIMARY KEY (id, subscription_id),
    FOREIGN KEY (subscription_id) REFERENCES subscription(id)
);

CREATE TABLE vendor_contact (
    id text,
    vendor_id text,
    email_address text,
    "name" text,
    ordinal integer,
    phone_number text,
    removed boolean,
    PRIMARY KEY (id, vendor_id),
    FOREIGN KEY (vendor_id) REFERENCES vendor(id)
);

CREATE TABLE catalog_item_variation (
    id text,
    item_id text,
    inventory_alert_threshold integer,
    inventory_alert_type text,
    "name" text,
    ordinal integer,
    price_money_amount bigint,
    price_money_currency text,
    pricing_type text,
    service_duration integer,
    sku text,
    track_inventory boolean,
    upc text,
    user_data text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES catalog_object(id),
    FOREIGN KEY (item_id) REFERENCES catalog_item(id)
);

CREATE TABLE shift (
    id text,
    employee_id text,
    location_id text,
    created_at timestamp,
    end_at timestamp,
    start_at timestamp,
    "status" text,
    team_member_id text,
    timezone text,
    updated_at timestamp,
    version integer,
    wage_hourly_rateamount bigint,
    wage_hourly_ratecurrency text,
    wage_title text,
    PRIMARY KEY (id),
    FOREIGN KEY (employee_id) REFERENCES employee(id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE location_capability (
    capability text,
    location_id text,
    PRIMARY KEY (capability, location_id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE cash_drawer (
    id text,
    location_id text,
    closed_at timestamp,
    closed_cash_money_amount bigint,
    closed_cash_money_currency text,
    description text,
    ended_at timestamp,
    expected_cash_money_amount bigint,
    expected_cash_money_currency text,
    opened_at timestamp,
    opened_cash_money_amount bigint,
    opened_cash_money_currency text,
    "state" text,
    PRIMARY KEY (id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE custom_attribute_definition (
    "key" text,
    created_at timestamp,
    description text,
    "name" text,
    "schema" jsonb,
    updated_at timestamp,
    version integer,
    visibility text,
    PRIMARY KEY ("key")
);

CREATE TABLE cash_drawer_event (
    id text,
    cash_drawer_id text,
    created_at timestamp,
    description text,
    event_money_amount bigint,
    event_money_currency text,
    event_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (cash_drawer_id) REFERENCES cash_drawer(id)
);

CREATE TABLE catalog_item (
    id text,
    abbreviation text,
    available_electronically boolean,
    available_for_pickup boolean,
    available_online boolean,
    category_id text,
    description text,
    image_url text,
    label_color text,
    "name" text,
    product_type text,
    skip_modifier_screen boolean,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES catalog_object(id)
);

CREATE TABLE bank_account (
    id text,
    location_id text,
    account_number_suffix text,
    account_type text,
    bank_name text,
    country text,
    creditable boolean,
    currency text,
    debit_mandate_reference_id text,
    debitable boolean,
    fingerprint text,
    holder_name text,
    primary_bank_identification_number text,
    reference_id text,
    secondary_bank_identification_number text,
    "status" text,
    version integer,
    PRIMARY KEY (id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE payment_processing_fee (
    "index" bigint,
    payment_id text,
    amount bigint,
    currency text,
    effective_at timestamp,
    "type" text,
    PRIMARY KEY ("index", payment_id),
    FOREIGN KEY (payment_id) REFERENCES payment(id)
);

CREATE TABLE order_return (
    uid text,
    source_order_id text,
    PRIMARY KEY (uid, source_order_id),
    FOREIGN KEY (source_order_id) REFERENCES "order"(id)
);

CREATE TABLE employee (
    id text,
    created_at timestamp,
    first_name text,
    last_name text,
    "status" text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE item_variation_location_override (
    item_variation_id text,
    location_id text,
    inventory_alert_threshold integer,
    inventory_alert_type text,
    price_money_amount bigint,
    price_money_currency text,
    pricing_type text,
    track_inventory boolean,
    PRIMARY KEY (item_variation_id, location_id),
    FOREIGN KEY (item_variation_id) REFERENCES catalog_item_variation(id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE subscription_action_phase (
    id text,
    subscription_action_id text,
    new_plan_variation_id text,
    order_template_id text,
    ordinal integer,
    plan_phase_uid text,
    PRIMARY KEY (id, subscription_action_id),
    FOREIGN KEY (subscription_action_id) REFERENCES subscription_action(subscription_id)
);

CREATE TABLE loyalty_program_accrual_rule (
    id integer,
    program_id text,
    accrual_type text,
    catalog_object_id text,
    points integer,
    spend_amount bigint,
    spend_currency text,
    visit_minimum_amount bigint,
    visit_minimum_currency text,
    PRIMARY KEY (id, program_id),
    FOREIGN KEY (program_id) REFERENCES loyalty_program(id)
);

CREATE TABLE dispute (
    id text,
    disputed_payment_id text,
    location_id text,
    amount_money_amount bigint,
    amount_money_currency text,
    brand_dispute_id text,
    card_brand text,
    created_at timestamp,
    dispute_id text,
    due_at timestamp,
    reason text,
    reported_date timestamp,
    "state" text,
    updated_at timestamp,
    version integer,
    PRIMARY KEY (id),
    FOREIGN KEY (disputed_payment_id) REFERENCES payment(id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE refund (
    id text,
    location_id text,
    order_id text,
    payment_id text,
    tender_id text,
    transaction_id text,
    amount_amount bigint,
    amount_currency text,
    created_at timestamp,
    processing_fee_amount bigint,
    processing_fee_currency text,
    reason text,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (location_id) REFERENCES location(id),
    FOREIGN KEY (order_id) REFERENCES "order"(id),
    FOREIGN KEY (payment_id) REFERENCES payment(id),
    FOREIGN KEY (tender_id) REFERENCES tender("index"),
    FOREIGN KEY (transaction_id) REFERENCES "transaction"(id)
);

CREATE TABLE gift_card_activity (
    gift_card_id text,
    id text,
    adjust_decrement_activity_amount bigint,
    adjust_decrement_activity_currency text,
    adjust_decrement_activity_reason text,
    adjust_increment_activity_amount bigint,
    adjust_increment_activity_currency text,
    adjust_increment_activity_reason text,
    block_activity_reason text,
    clear_balance_activity_reason text,
    created_at timestamp,
    deactivate_activity_reason text,
    gift_card_balance_amount bigint,
    gift_card_balance_currency text,
    gift_card_gan text,
    import_activity_amount bigint,
    import_activity_currency text,
    import_reversal_activity_amount bigint,
    import_reversal_activity_currency text,
    location_id text,
    transfer_balance_from_activity_amount bigint,
    transfer_balance_from_activity_currency text,
    transfer_balance_from_activity_transfer_to_gift_card_id text,
    transfer_balance_to_activity_amount bigint,
    transfer_balance_to_activity_currency text,
    transfer_balance_to_activity_transfer_from_gift_card_id text,
    "type" text,
    unblock_activity_reason text,
    unlinked_activity_refund_activity_amount bigint,
    unlinked_activity_refund_activity_currency text,
    unlinked_activity_refund_activity_payment_id text,
    unlinked_activity_refund_activity_reference_id text,
    -- activate_activity_* (dynamic column),
    -- load_activity_* (dynamic column),
    -- redeem_activity_* (dynamic column),
    -- refund_activity_* (dynamic column),
    PRIMARY KEY (gift_card_id, id)
);

CREATE TABLE additional_refund_recipient (
    location_id text,
    refund_id text,
    amount_amount bigint,
    amount_currency text,
    description text,
    receivable_id text,
    PRIMARY KEY (location_id, refund_id),
    FOREIGN KEY (location_id) REFERENCES location(id),
    FOREIGN KEY (refund_id) REFERENCES refund(id)
);

CREATE TABLE loyalty_account_mapping (
    id text,
    account_id text,
    created_at timestamp,
    "type" text,
    "value" text,
    PRIMARY KEY (id, account_id),
    FOREIGN KEY (account_id) REFERENCES loyalty_account(id)
);

CREATE TABLE catalog_tax (
    id text,
    applies_to_custom_amounts boolean,
    calculation_phase text,
    enabled boolean,
    inclusion_type text,
    "name" text,
    percentage double precision,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES catalog_object(id)
);

CREATE TABLE subscription (
    id text,
    customer_id text,
    location_id text,
    canceled_date text,
    card_id text,
    charged_through_date text,
    created_at timestamp,
    plan_variation_id text,
    price_override_amount bigint,
    price_override_currency text,
    start_date text,
    "status" text,
    subscription_source_name text,
    tax_percentage double precision,
    timezone text,
    version integer,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES location(id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE subscription_event (
    id text,
    subscription_id text,
    effective_date text,
    plan_variation_id text,
    subscription_event_info_code text,
    subscription_event_info_detail text,
    subscription_event_type text,
    PRIMARY KEY (id, subscription_id),
    FOREIGN KEY (subscription_id) REFERENCES subscription(id)
);

CREATE TABLE employee_location (
    employee_id text,
    location_id text,
    PRIMARY KEY (employee_id, location_id),
    FOREIGN KEY (employee_id) REFERENCES employee(id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE order_return_line_item (
    uid text,
    catalog_object_id text,
    order_return_id text,
    source_line_item_uid text,
    base_price_money_amount bigint,
    base_price_money_currency text,
    gross_return_money_amount bigint,
    gross_return_money_currency text,
    "name" text,
    note text,
    quantity text,
    quantity_measurement_area_unit text,
    quantity_measurement_custom_unit_abbrevation text,
    quantity_measurement_custom_unit_name text,
    quantity_measurement_generic_unit text,
    quantity_measurement_length_unit text,
    quantity_measurement_volume_unit text,
    quantity_measurement_weight_unit text,
    quantity_precision integer,
    total_discount_money_amount bigint,
    total_discount_money_currency text,
    total_money_amount bigint,
    total_money_currency text,
    total_tax_money_amount bigint,
    total_tax_money_currency text,
    variation_name text,
    variation_total_price_money_amount bigint,
    variation_total_price_money_currency text,
    PRIMARY KEY (uid),
    FOREIGN KEY (catalog_object_id) REFERENCES catalog_object(id),
    FOREIGN KEY (order_return_id) REFERENCES order_return(uid),
    FOREIGN KEY (source_line_item_uid) REFERENCES order_line_item(uid)
);

CREATE TABLE "transaction" (
    id text,
    location_id text,
    order_id text,
    client_id text,
    created_at timestamp,
    product text,
    reference_id text,
    -- shipping_address_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (location_id) REFERENCES location(id),
    FOREIGN KEY (order_id) REFERENCES "order"(id)
);

CREATE TABLE order_line_item (
    uid text,
    order_id text,
    catalog_object_id text,
    base_price_amount bigint,
    base_price_currency text,
    gross_sales_amount bigint,
    gross_sales_currency text,
    "name" text,
    note text,
    quantity double precision,
    total_amount bigint,
    total_currency text,
    total_discount_amount bigint,
    total_discount_currency text,
    total_tax_amount bigint,
    total_tax_currency text,
    variation_name text,
    PRIMARY KEY (uid, order_id),
    FOREIGN KEY (order_id) REFERENCES "order"(id),
    FOREIGN KEY (catalog_object_id) REFERENCES catalog_item_variation(id)
);

CREATE TABLE customer_group_info (
    id text,
    customer_id text,
    "name" text,
    PRIMARY KEY (id, customer_id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE invoice_payment_request (
    uid text,
    invoice_id text,
    automatic_payment_source text,
    card_id text,
    computed_amount bigint,
    computed_currency text,
    due_date text,
    fixed_amount_requested_amount bigint,
    fixed_amount_requested_currency text,
    percentage_requested text,
    request_type text,
    rounding_adjustment_included_amount bigint,
    rounding_adjustment_included_currency text,
    tipping_enabled boolean,
    total_completed_amount bigint,
    total_completed_currency text,
    PRIMARY KEY (uid, invoice_id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id)
);

CREATE TABLE gift_card_customer (
    customer_id text,
    gift_card_id text,
    PRIMARY KEY (customer_id, gift_card_id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (gift_card_id) REFERENCES gift_card(id)
);

CREATE TABLE invoice_custom_field (
    label text,
    invoice_id text,
    placement text,
    "value" text,
    PRIMARY KEY (label, invoice_id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id)
);

CREATE TABLE catalog_v_1_id (
    catalog_v_1_id text,
    id text,
    location_id text,
    PRIMARY KEY (catalog_v_1_id, id, location_id),
    FOREIGN KEY (id) REFERENCES catalog_object(id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE loyalty_program_reward_tier (
    id text,
    program_id text,
    created_at timestamp,
    "name" text,
    points integer,
    pricing_rule_catalog_version bigint,
    pricing_rule_object_id text,
    -- definition_* (dynamic column),
    PRIMARY KEY (id, program_id),
    FOREIGN KEY (program_id) REFERENCES loyalty_program(id)
);

CREATE TABLE order_line_item_tax (
    uid text,
    order_id text,
    catalog_object_id text,
    applied_money_amount bigint,
    applied_money_currency text,
    "name" text,
    percentage double precision,
    scope text,
    "type" text,
    PRIMARY KEY (uid, order_id),
    FOREIGN KEY (order_id) REFERENCES "order"(id),
    FOREIGN KEY (catalog_object_id) REFERENCES catalog_object(id)
);

CREATE TABLE merchant (
    id text,
    main_location_id text,
    business_name text,
    country text,
    created_at timestamp,
    currency text,
    language_code text,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (main_location_id) REFERENCES location(id)
);

CREATE TABLE "order" (
    id text,
    location_id text,
    closed_at timestamp,
    created_at timestamp,
    customer_id text,
    order_source_name text,
    reference_id text,
    rounding_adjustment_amount_money_amount bigint,
    rounding_adjustment_amount_money_currency text,
    rounding_adjustment_name text,
    rounding_adjustment_uid text,
    "state" text,
    total_discount_amount bigint,
    total_discount_currency text,
    total_money_amount bigint,
    total_money_currency text,
    total_service_charge_amount bigint,
    total_service_charge_currency text,
    total_tax_amount bigint,
    total_tax_currency text,
    updated_at timestamp,
    -- net_amount_* (dynamic column),
    -- return_amount_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE workweek_history (
    id text,
    updated_at timestamp,
    created_at timestamp,
    start_of_day_local_time text,
    start_of_week text,
    version bigint,
    PRIMARY KEY (id, updated_at)
);

CREATE TABLE customer (
    id text,
    birthday text,
    company_name text,
    created_at timestamp,
    creation_source text,
    email_address text,
    family_name text,
    given_name text,
    nickname text,
    note text,
    phone_number text,
    preferences_email_unsubscribed boolean,
    reference_id text,
    updated_at timestamp,
    -- address_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE card_payment_details (
    payment_id text,
    card_id text,
    application_cryptogram text,
    application_identifier text,
    application_name text,
    auth_result_code text,
    avs_status text,
    cvv_status text,
    entry_method text,
    refund_requires_card_presence boolean,
    statement_description text,
    "status" text,
    tip_money_device_id text,
    tip_money_device_name text,
    verification_method text,
    verification_results text,
    PRIMARY KEY (payment_id),
    FOREIGN KEY (payment_id) REFERENCES payment(id),
    FOREIGN KEY (card_id) REFERENCES card(id)
);

CREATE TABLE break_type (
    id text,
    location_id text,
    break_name text,
    created_at timestamp,
    expected_duration text,
    is_paid boolean,
    updated_at timestamp,
    version bigint,
    PRIMARY KEY (id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE gift_card (
    id text,
    balance_amount bigint,
    balance_currency text,
    created_at timestamp,
    gan text,
    gan_source text,
    "state" text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE catalog_modifier_list (
    id text,
    "name" text,
    selection_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES catalog_object(id)
);

CREATE TABLE catalog_modifier_override (
    item_id text,
    modifier_id text,
    modifier_list_id text,
    on_by_default boolean,
    PRIMARY KEY (item_id, modifier_id, modifier_list_id),
    FOREIGN KEY (item_id) REFERENCES catalog_item(id),
    FOREIGN KEY (modifier_id) REFERENCES catalog_modifier(id),
    FOREIGN KEY (modifier_list_id) REFERENCES catalog_item_modifier_list_info(item_id)
);

CREATE TABLE invoice_payment_reminder (
    uid text,
    payment_request_id text,
    message text,
    relative_scheduled_days integer,
    sent_at timestamp,
    "status" text,
    PRIMARY KEY (uid, payment_request_id),
    FOREIGN KEY (payment_request_id) REFERENCES invoice_payment_request(invoice_id)
);

CREATE TABLE card (
    id text,
    card_brand text,
    card_type text,
    cardholder_name text,
    exp_month integer,
    exp_year integer,
    fingerprint text,
    last_4 text,
    prepaid_type text,
    -- billing_address_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE subscription_action (
    id text,
    subscription_id text,
    effective_date text,
    new_plan_variation_id text,
    "type" text,
    PRIMARY KEY (id, subscription_id),
    FOREIGN KEY (subscription_id) REFERENCES subscription(id)
);

CREATE TABLE location_custom_attribute (
    "key" text,
    location_id text,
    created_at timestamp,
    updated_at timestamp,
    "value" text,
    version integer,
    visibility text,
    PRIMARY KEY ("key", location_id),
    FOREIGN KEY ("key") REFERENCES custom_attribute_definition("key"),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE tender (
    "index" bigint,
    order_id text,
    location_id text,
    transaction_id text,
    amount_amount bigint,
    amount_currency text,
    card_details_card_brand text,
    card_details_entry_method text,
    card_details_fingerprint text,
    card_details_last_4 text,
    card_details_status text,
    cash_details_buyer_tender_amount bigint,
    cash_details_buyer_tender_currency text,
    cash_details_change_back_amount bigint,
    cash_details_change_back_currency text,
    created_at timestamp,
    customer_id text,
    note text,
    processing_fee_amount bigint,
    processing_fee_currency text,
    tender_id text,
    tip_amount bigint,
    tip_currency text,
    "type" text,
    PRIMARY KEY ("index", order_id),
    FOREIGN KEY (order_id) REFERENCES "order"(id),
    FOREIGN KEY (location_id) REFERENCES location(id),
    FOREIGN KEY (transaction_id) REFERENCES "transaction"(id)
);

CREATE TABLE catalog_object (
    id text,
    absent_at_location_ids jsonb,
    is_deleted boolean,
    present_at_all_locations boolean,
    present_at_location_ids jsonb,
    "type" text,
    updated_at timestamp,
    version bigint,
    PRIMARY KEY (id)
);

CREATE TABLE customer_card (
    card_id text,
    customer_id text,
    PRIMARY KEY (card_id, customer_id),
    FOREIGN KEY (card_id) REFERENCES card(id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE order_return_discount (
    uid text,
    catalog_object_id text,
    order_return_id text,
    source_discount_uid text,
    amount_money_amount bigint,
    amount_money_currency text,
    applied_money_amount bigint,
    applied_money_currency text,
    "name" text,
    percentage double precision,
    scope text,
    "type" text,
    PRIMARY KEY (uid),
    FOREIGN KEY (catalog_object_id) REFERENCES catalog_object(id),
    FOREIGN KEY (order_return_id) REFERENCES order_return(uid),
    FOREIGN KEY (source_discount_uid) REFERENCES order_line_item_discount(uid)
);

CREATE TABLE merchant_custom_attribute (
    "key" text,
    merchant_id text,
    created_at timestamp,
    updated_at timestamp,
    "value" text,
    version integer,
    visibility text,
    PRIMARY KEY ("key", merchant_id),
    FOREIGN KEY ("key") REFERENCES custom_attribute_definition("key"),
    FOREIGN KEY (merchant_id) REFERENCES merchant(id)
);

CREATE TABLE location (
    id text,
    business_name text,
    country text,
    created_at timestamp,
    currency text,
    language_code text,
    merchant_id text,
    "name" text,
    phone_number text,
    "status" text,
    timezone text,
    "type" text,
    website_url text,
    -- address_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE loyalty_program (
    id text,
    created_at timestamp,
    expiration_policy_expiration_duration text,
    location_ids jsonb,
    "status" text,
    terminology_one text,
    terminology_other text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE order_return_line_item_modifier (
    uid text,
    catalog_object_id text,
    order_return_line_item_id text,
    source_modifier_uid text,
    base_price_amount bigint,
    base_price_currency text,
    "name" text,
    total_price_amount bigint,
    total_price_currency text,
    PRIMARY KEY (uid),
    FOREIGN KEY (catalog_object_id) REFERENCES catalog_object(id),
    FOREIGN KEY (order_return_line_item_id) REFERENCES order_return_line_item(uid),
    FOREIGN KEY (source_modifier_uid) REFERENCES order_line_item_modifier(uid)
);

CREATE TABLE shift_break (
    id text,
    shift_id text,
    break_type_id text,
    end_at timestamp,
    expected_duration text,
    is_paid boolean,
    "name" text,
    start_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (shift_id) REFERENCES shift(id)
);

CREATE TABLE additional_tender_recipient (
    "index" bigint,
    location_id text,
    tender_id text,
    amount_amount bigint,
    amount_currency text,
    description text,
    receivable_id text,
    PRIMARY KEY ("index", location_id, tender_id),
    FOREIGN KEY (location_id) REFERENCES location(id),
    FOREIGN KEY (tender_id) REFERENCES tender("index")
);
