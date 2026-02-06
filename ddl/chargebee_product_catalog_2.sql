CREATE TABLE hosted_page_transaction (
    hosted_page_id text,
    transaction_id text,
    PRIMARY KEY (hosted_page_id, transaction_id),
    FOREIGN KEY (hosted_page_id) REFERENCES hosted_page(id),
    FOREIGN KEY (transaction_id) REFERENCES "transaction"(id)
);

CREATE TABLE hosted_page (
    id text,
    customer_id text,
    created_at text,
    embed text,
    expires_at text,
    object text,
    resource_version text,
    "state" text,
    "type" text,
    updated_at timestamp,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE item_family (
    id text,
    channel text,
    description text,
    "name" text,
    resource_version text,
    "status" text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE gift_timeline (
    _fivetran_id text,
    gift_id text,
    occurred_at text,
    "status" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (gift_id) REFERENCES gift(id)
);

CREATE TABLE gift (
    id text,
    gift_receiver text,
    gift_receiver_subscription_id text,
    gifter_customer_id text,
    gifter_invoice_id text,
    auto_claim text,
    claim_expiry_date text,
    gift_receiver_email text,
    gift_receiver_first_name text,
    gift_receiver_last_name text,
    gifter_note text,
    gifter_signature text,
    no_expiry text,
    resource_version text,
    scheduled_at text,
    "status" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (gift_receiver) REFERENCES customer(id),
    FOREIGN KEY (gift_receiver_subscription_id) REFERENCES subscription(id),
    FOREIGN KEY (gifter_customer_id) REFERENCES customer(id),
    FOREIGN KEY (gifter_invoice_id) REFERENCES invoice(id)
);

CREATE TABLE customer_referral_url (
    _fivetran_id text,
    customer_id text,
    external_customer_id text,
    created_at text,
    deleted text,
    referral_account_id text,
    referral_campaign_id text,
    referral_external_campaign_id text,
    referral_sharing_url text,
    referral_system text,
    updated_at text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (external_customer_id) REFERENCES customer(id)
);

CREATE TABLE customer_contact (
    id text,
    customer_id text,
    deleted text,
    email text,
    enabled text,
    first_name text,
    label text,
    last_name text,
    phone text,
    send_account_email text,
    send_billing_email text,
    PRIMARY KEY (id, customer_id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE customer_balance (
    _fivetran_id text,
    customer_id text,
    currency_code text,
    deleted text,
    excess_payments text,
    promotional_credits text,
    refundable_credits text,
    unbilled_charges text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE customer_entity_identifier (
    id text,
    customer_id text,
    deleted text,
    scheme text,
    standard text,
    "value" text,
    PRIMARY KEY (id, customer_id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE customer_metadata (
    "name" text,
    customer_id text,
    "value" text,
    PRIMARY KEY ("name", customer_id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE customer (
    id text,
    backup_payment_source_id text,
    primary_payment_source_id text,
    relationship_invoice_owner_id text,
    relationship_parent_id text,
    relationship_payment_owner_id text,
    allow_direct_debit text,
    auto_close_invoices text,
    auto_collection text,
    billing_address_city text,
    billing_address_company text,
    billing_address_country text,
    billing_address_email text,
    billing_address_first_name text,
    billing_address_last_name text,
    billing_address_line_1 text,
    billing_address_line_2 text,
    billing_address_line_3 text,
    billing_address_object text,
    billing_address_phone text,
    billing_address_state text,
    billing_address_state_code text,
    billing_address_validation_status text,
    billing_address_zip text,
    billing_date text,
    billing_date_mode text,
    billing_day_of_week text,
    billing_day_of_week_mode text,
    business_customer_without_vat_number text,
    business_entity_id text,
    channel text,
    child_account_access_portal_download_invoices text,
    child_account_access_portal_edit_subscriptions text,
    child_account_access_send_invoice_emails text,
    child_account_access_send_payment_emails text,
    child_account_access_send_subscription_emails text,
    client_profile_id text,
    company text,
    consolidated_invoicing text,
    created_at text,
    created_from_ip text,
    customer_type text,
    deleted text,
    email text,
    entity_code text,
    excess_payments text,
    exempt_number text,
    exemption_details jsonb,
    first_name text,
    fraud_flag text,
    invoice_notes text,
    is_location_valid text,
    last_name text,
    locale text,
    net_term_days text,
    offline_payment_method text,
    parent_account_access_portal_download_child_invoices text,
    parent_account_access_portal_edit_child_subscriptions text,
    parent_account_access_send_invoice_emails text,
    parent_account_access_send_payment_emails text,
    parent_account_access_send_subscription_emails text,
    payment_method_gateway text,
    payment_method_gateway_account_id text,
    payment_method_object text,
    payment_method_reference_id text,
    payment_method_status text,
    payment_method_type text,
    phone text,
    pii_cleared text,
    preferred_currency_code text,
    promotional_credits text,
    refundable_credits text,
    registered_for_gst text,
    resource_version text,
    taxability text,
    unbilled_charges text,
    updated_at text,
    use_default_hierarchy_settings text,
    vat_number text,
    vat_number_prefix text,
    vat_number_status text,
    vat_number_validated_time text,
    -- meta_data_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (backup_payment_source_id) REFERENCES payment_source(id),
    FOREIGN KEY (primary_payment_source_id) REFERENCES payment_source(id),
    FOREIGN KEY (relationship_invoice_owner_id) REFERENCES customer(id),
    FOREIGN KEY (relationship_parent_id) REFERENCES customer(id),
    FOREIGN KEY (relationship_payment_owner_id) REFERENCES invoice(id)
);

CREATE TABLE applicable_item (
    applicable_item_id text,
    item_id text,
    PRIMARY KEY (applicable_item_id, item_id),
    FOREIGN KEY (applicable_item_id) REFERENCES item(id),
    FOREIGN KEY (item_id) REFERENCES item(id)
);

CREATE TABLE item_metadata (
    "name" text,
    item_id text,
    "value" text,
    PRIMARY KEY ("name", item_id),
    FOREIGN KEY (item_id) REFERENCES item(id)
);

CREATE TABLE item (
    id text,
    item_family_id text,
    archived_at text,
    channel text,
    description text,
    enabled_for_checkout text,
    enabled_in_portal text,
    external_name text,
    gift_claim_redirect_url text,
    included_in_mrr text,
    is_giftable text,
    is_shippable text,
    item_applicability text,
    metered text,
    "name" text,
    redirect_url text,
    resource_version text,
    "status" text,
    "type" text,
    unit text,
    updated_at text,
    usage_calculation text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (item_family_id) REFERENCES item_family(id)
);

CREATE TABLE attached_item (
    id text,
    item_id text,
    parent_item_id text,
    billing_cycles text,
    channel text,
    charge_on_event text,
    charge_once text,
    created_at text,
    quantity text,
    quantity_in_decimal text,
    resource_version text,
    "status" text,
    "type" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (item_id) REFERENCES item(id),
    FOREIGN KEY (parent_item_id) REFERENCES item(id)
);

CREATE TABLE transaction_invoice (
    invoice_id text,
    transaction_id text,
    applied_amount text,
    applied_at text,
    PRIMARY KEY (invoice_id, transaction_id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id),
    FOREIGN KEY (transaction_id) REFERENCES "transaction"(id)
);

CREATE TABLE transaction_linked_payment (
    linked_payment_id text,
    transaction_id text,
    linked_payments_id text,
    PRIMARY KEY (linked_payment_id, transaction_id),
    FOREIGN KEY (transaction_id) REFERENCES "transaction"(id),
    FOREIGN KEY (linked_payments_id) REFERENCES "transaction"(id)
);

CREATE TABLE transaction_linked_credit_note (
    credit_note_id text,
    transaction_id text,
    applied_amount text,
    applied_at text,
    PRIMARY KEY (credit_note_id, transaction_id),
    FOREIGN KEY (credit_note_id) REFERENCES credit_note(id),
    FOREIGN KEY (transaction_id) REFERENCES "transaction"(id)
);

CREATE TABLE transaction_refund (
    refunded_transaction_id text,
    transaction_id text,
    transaction_amount text,
    transaction_date text,
    transaction_status text,
    PRIMARY KEY (refunded_transaction_id, transaction_id),
    FOREIGN KEY (refunded_transaction_id) REFERENCES "transaction"(id),
    FOREIGN KEY (transaction_id) REFERENCES "transaction"(id)
);

CREATE TABLE "transaction" (
    id text,
    customer_id text,
    payment_source_id text,
    reference_authorization_id text,
    reference_transaction_id text,
    refunded_transaction_id text,
    reversal_transaction_id text,
    subscription_id text,
    amount text,
    amount_capturable text,
    amount_unused text,
    authorization_reason text,
    currency_code text,
    "date" text,
    deleted text,
    error_code text,
    error_text text,
    exchange_rate text,
    fraud_flag text,
    fraud_reason text,
    gateway text,
    gateway_account_id text,
    id_at_gateway text,
    initiator_type text,
    issuer_identification_number text,
    last_4 text,
    masked_card_number text,
    merchant_reference_id text,
    payment_method text,
    payment_method_details text,
    reference_number text,
    resource_version text,
    settled_at text,
    "status" text,
    three_d_secure text,
    "type" text,
    updated_at text,
    voided_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (payment_source_id) REFERENCES payment_source(id),
    FOREIGN KEY (reference_authorization_id) REFERENCES "transaction"(id),
    FOREIGN KEY (reference_transaction_id) REFERENCES "transaction"(id),
    FOREIGN KEY (refunded_transaction_id) REFERENCES "transaction"(id),
    FOREIGN KEY (reversal_transaction_id) REFERENCES "transaction"(id),
    FOREIGN KEY (subscription_id) REFERENCES subscription(id)
);

CREATE TABLE differential_price_tier (
    _fivetran_id text,
    differential_price_id text,
    ending_unit text,
    price text,
    starting_unit text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (differential_price_id) REFERENCES differential_price(id)
);

CREATE TABLE differential_price_parent_period (
    _fivetran_id text,
    differential_price_id text,
    period jsonb,
    period_unit text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (differential_price_id) REFERENCES differential_price(id)
);

CREATE TABLE differential_price (
    id text,
    item_price_id text,
    parent_item_id text,
    created_at text,
    currency_code text,
    modified_at text,
    price text,
    price_in_decimal text,
    resource_version text,
    "status" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (item_price_id) REFERENCES item_price(id),
    FOREIGN KEY (parent_item_id) REFERENCES item(id)
);

CREATE TABLE subscription_renewal_estimate_invoice_line_item (
    id text,
    subscription_estimate_id text,
    customer_id text,
    subscription_id text,
    amount text,
    date_from text,
    date_to text,
    description text,
    discount_amount text,
    entity_id text,
    entity_type text,
    is_taxed text,
    item_level_discount_amount text,
    object text,
    pricing_model text,
    quantity text,
    tax_amount text,
    unit_amount text,
    PRIMARY KEY (id, subscription_estimate_id),
    FOREIGN KEY (subscription_estimate_id) REFERENCES subscription_renewal_estimate(subscription_estimate_id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (subscription_id) REFERENCES subscription(id)
);

CREATE TABLE subscription_renewal_estimate (
    subscription_estimate_id text,
    invoice_estimate_customer_id text,
    created_at text,
    invoice_estimate_amount_due text,
    invoice_estimate_amount_paid text,
    invoice_estimate_credits_applied text,
    invoice_estimate_currency_code text,
    invoice_estimate_line_item_discounts jsonb,
    invoice_estimate_line_item_taxes jsonb,
    invoice_estimate_object text,
    invoice_estimate_price_type text,
    invoice_estimate_recurring text,
    invoice_estimate_round_off_amount text,
    invoice_estimate_sub_total text,
    invoice_estimate_taxes jsonb,
    invoice_estimate_total text,
    object text,
    subscription_estimate_currency_code text,
    subscription_estimate_next_billing_at text,
    subscription_estimate_object text,
    subscription_estimate_pause_date text,
    subscription_estimate_resume_date text,
    subscription_estimate_status text,
    subscription_estimate_trial_end_action text,
    PRIMARY KEY (subscription_estimate_id),
    FOREIGN KEY (subscription_estimate_id) REFERENCES subscription(id),
    FOREIGN KEY (invoice_estimate_customer_id) REFERENCES customer(id)
);

CREATE TABLE "comment" (
    id text,
    added_by text,
    created_at text,
    entity_id text,
    entity_type text,
    notes text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE subscription_charged_item_price (
    item_price_id text,
    subscription_id text,
    deleted text,
    last_charged_at text,
    PRIMARY KEY (item_price_id, subscription_id),
    FOREIGN KEY (item_price_id) REFERENCES item_price(id),
    FOREIGN KEY (subscription_id) REFERENCES subscription(id)
);

CREATE TABLE subscription_item_price (
    item_price_id text,
    subscription_id text,
    item_type text,
    amount text,
    amount_in_decimal text,
    billing_cycles text,
    billing_period text,
    billing_period_unit text,
    charge_on_event text,
    charge_on_option text,
    charge_once text,
    deleted text,
    free_quantity text,
    free_quantity_in_decimal text,
    object text,
    proration_type text,
    quantity text,
    quantity_in_decimal text,
    service_period_days text,
    trial_end text,
    unit_price text,
    unit_price_in_decimal text,
    usage_accumulation_reset_frequency text,
    PRIMARY KEY (item_price_id, subscription_id),
    FOREIGN KEY (item_price_id) REFERENCES item_price(id),
    FOREIGN KEY (subscription_id) REFERENCES subscription(id),
    FOREIGN KEY (item_type) REFERENCES item(id)
);

CREATE TABLE subscription_coupon (
    coupon_id text,
    subscription_id text,
    coupon_code text,
    applied_count text,
    apply_till text,
    deleted text,
    PRIMARY KEY (coupon_id, subscription_id),
    FOREIGN KEY (coupon_id) REFERENCES coupon(id),
    FOREIGN KEY (subscription_id) REFERENCES subscription(id),
    FOREIGN KEY (coupon_code) REFERENCES coupon_code(code)
);

CREATE TABLE subscription_discount (
    id text,
    subscription_id text,
    amount text,
    applied_count text,
    apply_on text,
    apply_till text,
    coupon_id text,
    created_at text,
    currency_code text,
    deleted text,
    duration_type text,
    included_in_mrr text,
    "index" text,
    invoice_name text,
    item_price_id text,
    percentage text,
    period text,
    period_unit text,
    "type" text,
    PRIMARY KEY (id, subscription_id),
    FOREIGN KEY (subscription_id) REFERENCES subscription(id)
);

CREATE TABLE subscription_item_tier_price (
    item_price_id text,
    subscription_id text,
    deleted text,
    ending_unit text,
    ending_unit_in_decimal text,
    "index" text,
    starting_unit text,
    starting_unit_in_decimal text,
    PRIMARY KEY (item_price_id, subscription_id),
    FOREIGN KEY (item_price_id) REFERENCES item_price(id),
    FOREIGN KEY (subscription_id) REFERENCES subscription(id)
);

CREATE TABLE subscription_metadata (
    "name" text,
    subscription_id text,
    "value" text,
    PRIMARY KEY ("name", subscription_id),
    FOREIGN KEY (subscription_id) REFERENCES subscription(id)
);

CREATE TABLE subscription (
    id text,
    business_entity_id text,
    contract_term_business_entity_id text,
    contract_term_subscription_id text,
    customer_id text,
    payment_source_id text,
    activated_at text,
    active_id text,
    auto_close_invoice text,
    auto_collection text,
    base_currency_code text,
    billing_period text,
    billing_period_unit text,
    cancel_reason text,
    cancel_reason_code text,
    cancel_schedule_created_at text,
    cancel_scheduled_at text,
    cancelled_at text,
    changes_scheduled_at text,
    channel text,
    contract_term_billing_cycle_on_renewal text,
    create_pending_invoice text,
    created_at text,
    created_from_ip text,
    currency_code text,
    current_term_end text,
    current_term_start text,
    deleted text,
    due_invoices_count text,
    due_since text,
    exchange_rate text,
    free_period text,
    free_period_unit text,
    has_scheduled_advance_invoices text,
    has_scheduled_changes text,
    invoice_notes text,
    monthly_recurring_revenue text,
    net_term_days text,
    next_billing_at text,
    override_relationship text,
    pause_date text,
    plan_amount_in_decimal text,
    plan_free_quantity_in_decimal text,
    plan_quantity_in_decimal text,
    plan_unit_price_in_decimal text,
    po_number text,
    referral_info_account_id text,
    referral_info_campaign_id text,
    referral_info_coupon_code text,
    referral_info_destination_url text,
    referral_info_external_campaign_id text,
    referral_info_external_reference_id text,
    referral_info_friend_offer_type text,
    referral_info_notify_referral_system text,
    referral_info_post_purchase_widget_enabled text,
    referral_info_referral_code text,
    referral_info_referral_system text,
    referral_info_referrer_id text,
    referral_info_referrer_reward_type text,
    referral_info_reward_status text,
    remaining_billing_cycles text,
    resource_version text,
    resume_date text,
    shipping_address_city text,
    shipping_address_company text,
    shipping_address_country text,
    shipping_address_email text,
    shipping_address_first_name text,
    shipping_address_index text,
    shipping_address_last_name text,
    shipping_address_line_1 text,
    shipping_address_line_2 text,
    shipping_address_line_3 text,
    shipping_address_object text,
    shipping_address_phone text,
    shipping_address_state text,
    shipping_address_state_code text,
    shipping_address_validation_status text,
    shipping_address_zip text,
    start_date text,
    started_at text,
    "status" text,
    total_dues text,
    trial_end text,
    trial_end_action text,
    trial_start text,
    updated_at text,
    -- meta_data_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (business_entity_id) REFERENCES customer(id),
    FOREIGN KEY (contract_term_business_entity_id) REFERENCES subscription(id),
    FOREIGN KEY (contract_term_subscription_id) REFERENCES subscription(id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (payment_source_id) REFERENCES payment_source(id)
);

CREATE TABLE credit_note_invoice_allocation (
    credit_note_id text,
    invoice_id text,
    allocated_at text,
    PRIMARY KEY (credit_note_id, invoice_id),
    FOREIGN KEY (credit_note_id) REFERENCES credit_note(id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id)
);

CREATE TABLE credit_note_line_item (
    line_item_id text,
    credit_note_id text,
    customer_id text,
    reference_line_item_id text,
    subscription_id text,
    amount text,
    amount_in_decimal text,
    date_from text,
    date_to text,
    description text,
    discount_amount text,
    entity_description text,
    entity_id text,
    entity_type text,
    is_taxed text,
    item_level_discount_amount text,
    object text,
    pricing_model text,
    quantity text,
    quantity_in_decimal text,
    tax_amount text,
    tax_exempt_reason text,
    tax_rate text,
    unit_amount text,
    unit_amount_in_decimal text,
    PRIMARY KEY (line_item_id),
    FOREIGN KEY (credit_note_id) REFERENCES credit_note(id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (reference_line_item_id) REFERENCES invoice_line_item(line_item_id),
    FOREIGN KEY (subscription_id) REFERENCES subscription(id)
);

CREATE TABLE credit_note_line_item_tax (
    _fivetran_id text,
    credit_note_id text,
    line_item_id text,
    is_non_compliance_tax text,
    is_partial_tax_applied text,
    local_currency_code text,
    tax_amount text,
    tax_amount_in_local_currency text,
    tax_juris_code text,
    tax_juris_name text,
    tax_juris_type text,
    tax_name text,
    tax_rate text,
    taxable_amount text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (credit_note_id) REFERENCES credit_note(id),
    FOREIGN KEY (line_item_id) REFERENCES credit_note_line_item(line_item_id)
);

CREATE TABLE credit_note_line_item_discount (
    _fivetran_id text,
    credit_note_id text,
    line_item_id text,
    discount_amount text,
    discount_type text,
    entity_id text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (credit_note_id) REFERENCES credit_note(id),
    FOREIGN KEY (line_item_id) REFERENCES credit_note_line_item(line_item_id)
);

CREATE TABLE credit_note_line_item_tier (
    _fivetran_id text,
    credit_note_id text,
    line_item_id text,
    ending_unit text,
    ending_unit_in_decimal text,
    quantity_used text,
    quantity_used_in_decimal text,
    starting_unit text,
    starting_unit_in_decimal text,
    unit_amount text,
    unit_amount_in_decimal text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (credit_note_id) REFERENCES credit_note(id),
    FOREIGN KEY (line_item_id) REFERENCES credit_note_line_item(line_item_id)
);

CREATE TABLE credit_note_tax (
    _fivetran_id text,
    credit_note_id text,
    amount text,
    description text,
    "name" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (credit_note_id) REFERENCES credit_note(id)
);

CREATE TABLE credit_note_linked_refund (
    credit_note_id text,
    transaction_id text,
    applied_amount text,
    applied_at text,
    refund_reason_code text,
    PRIMARY KEY (credit_note_id, transaction_id),
    FOREIGN KEY (credit_note_id) REFERENCES credit_note(id),
    FOREIGN KEY (transaction_id) REFERENCES "transaction"(id)
);

CREATE TABLE credit_note_linked_tax_withheld_refund (
    id text,
    credit_note_id text,
    amount text,
    "date" text,
    description text,
    reference_number text,
    PRIMARY KEY (id),
    FOREIGN KEY (credit_note_id) REFERENCES credit_note(id)
);

CREATE TABLE credit_note_discount (
    _fivetran_id text,
    coupon_set_code text,
    credit_note_id text,
    line_item_id text,
    amount text,
    description text,
    discount_type text,
    entity_id text,
    entity_type text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (coupon_set_code) REFERENCES coupon(id),
    FOREIGN KEY (credit_note_id) REFERENCES credit_note(id),
    FOREIGN KEY (line_item_id) REFERENCES credit_note_line_item(line_item_id)
);

CREATE TABLE credit_note (
    id text,
    customer_id text,
    reference_invoice_id text,
    subscription_id text,
    amount_allocated text,
    amount_available text,
    amount_refunded text,
    base_currency_code text,
    channel text,
    create_reason_code text,
    currency_code text,
    "date" text,
    deleted text,
    exchange_rate text,
    fractional_correction text,
    local_currency_code text,
    object text,
    price_type text,
    reason_code text,
    refunded_at text,
    resource_version text,
    round_off_amount text,
    "status" text,
    sub_total text,
    sub_total_in_local_currency text,
    total text,
    total_in_local_currency text,
    "type" text,
    updated_at text,
    vat_number text,
    vat_number_prefix text,
    voided_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (reference_invoice_id) REFERENCES invoice(id),
    FOREIGN KEY (subscription_id) REFERENCES subscription(id)
);

CREATE TABLE coupon_code (
    code text,
    coupon_id text,
    coupon_set_id text,
    "status" text,
    PRIMARY KEY (code),
    FOREIGN KEY (coupon_id) REFERENCES coupon(id),
    FOREIGN KEY (coupon_set_id) REFERENCES coupon_set(id)
);

CREATE TABLE event_webhook (
    id text,
    event_id text,
    webhook_status text,
    PRIMARY KEY (id, event_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE event_metadata (
    "name" text,
    event_id text,
    "value" text,
    PRIMARY KEY ("name", event_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE event (
    id text,
    api_version text,
    event_type text,
    occurred_at text,
    origin_user text,
    "source" text,
    users text,
    webhook_status text,
    PRIMARY KEY (id)
);

CREATE TABLE contract_term (
    id text,
    subscription_id text,
    action_at_term_end text,
    billing_cycle text,
    cancellation_cutoff_period text,
    contract_end text,
    contract_start text,
    created_at text,
    remaining_billing_cycles text,
    "status" text,
    total_contract_value text,
    total_contract_value_before_tax text,
    PRIMARY KEY (id, subscription_id),
    FOREIGN KEY (subscription_id) REFERENCES subscription(id)
);

CREATE TABLE resent_order (
    _fivetran_id text,
    order_id text,
    amount text,
    reason text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (order_id) REFERENCES orders(id)
);

CREATE TABLE order_line_item (
    line_item_id text,
    invoice_id text,
    invoice_line_item_id text,
    order_id text,
    amount text,
    amount_adjusted text,
    amount_paid text,
    description text,
    discount_amount text,
    entity_id text,
    entity_type text,
    fulfillment_amount text,
    fulfillment_quantity text,
    is_shippable text,
    item_level_discount_amount text,
    refundable_credits text,
    refundable_credits_issued text,
    sku text,
    "status" text,
    tax_amount text,
    unit_price text,
    PRIMARY KEY (line_item_id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id),
    FOREIGN KEY (invoice_line_item_id) REFERENCES invoice_line_item(line_item_id),
    FOREIGN KEY (order_id) REFERENCES orders(id)
);

CREATE TABLE order_line_item_tax (
    _fivetran_id text,
    line_item_id text,
    order_id text,
    is_non_compliance_tax text,
    is_partial_tax_applied text,
    local_currency_code text,
    tax_amount text,
    tax_amount_in_local_currency text,
    tax_juris_code text,
    tax_juris_name text,
    tax_juris_type text,
    tax_name text,
    tax_rate text,
    taxable_amount text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (line_item_id) REFERENCES order_line_item(line_item_id),
    FOREIGN KEY (order_id) REFERENCES orders(id)
);

CREATE TABLE order_line_item_discount (
    _fivetran_id text,
    line_item_id text,
    order_id text,
    discount_amount text,
    discount_type text,
    entity_id text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (line_item_id) REFERENCES order_line_item(line_item_id),
    FOREIGN KEY (order_id) REFERENCES orders(id)
);

CREATE TABLE order_linked_credit_note (
    id text,
    order_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES credit_note(id),
    FOREIGN KEY (order_id) REFERENCES orders(id)
);

CREATE TABLE orders (
    id text,
    customer_id text,
    gift_id text,
    invoice_id text,
    original_order_id text,
    subscription_id text,
    amount_adjusted text,
    amount_paid text,
    batch_id text,
    billing_address_city text,
    billing_address_company text,
    billing_address_country text,
    billing_address_email text,
    billing_address_first_name text,
    billing_address_last_name text,
    billing_address_line_1 text,
    billing_address_line_2 text,
    billing_address_line_3 text,
    billing_address_phone text,
    billing_address_state text,
    billing_address_state_code text,
    billing_address_validation_status text,
    billing_address_zip text,
    cancellation_reason text,
    cancelled_at text,
    created_at text,
    created_by text,
    currency_code text,
    deleted text,
    delivered_at text,
    discount text,
    document_number text,
    fulfillment_status text,
    gift_note text,
    invoice_round_off_amount text,
    is_gifted text,
    is_resent text,
    note text,
    object text,
    order_date text,
    order_type text,
    paid_on text,
    payment_status text,
    price_type text,
    reference_id text,
    refundable_credits text,
    refundable_credits_issued text,
    resend_reason text,
    resent_status text,
    resource_version text,
    rounding_adjustement text,
    shipment_carrier text,
    shipped_at text,
    shipping_address_city text,
    shipping_address_company text,
    shipping_address_country text,
    shipping_address_email text,
    shipping_address_first_name text,
    shipping_address_last_name text,
    shipping_address_line_1 text,
    shipping_address_line_2 text,
    shipping_address_line_3 text,
    shipping_address_phone text,
    shipping_address_state text,
    shipping_address_state_code text,
    shipping_address_validation_status text,
    shipping_address_zip text,
    shipping_cut_off_date text,
    shipping_date text,
    "status" text,
    status_update_at text,
    sub_total text,
    tax text,
    total text,
    tracking_id text,
    tracking_url text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (gift_id) REFERENCES gift(id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id),
    FOREIGN KEY (original_order_id) REFERENCES orders(id),
    FOREIGN KEY (subscription_id) REFERENCES subscription(id)
);

CREATE TABLE invoice_issued_credit_note (
    credit_note_id text,
    invoice_id text,
    PRIMARY KEY (credit_note_id, invoice_id),
    FOREIGN KEY (credit_note_id) REFERENCES credit_note(id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id)
);

CREATE TABLE invoice_adjustment_credit_note (
    credit_note_id text,
    invoice_id text,
    PRIMARY KEY (credit_note_id, invoice_id),
    FOREIGN KEY (credit_note_id) REFERENCES credit_note(id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id)
);

CREATE TABLE invoice_dunning_attempt (
    _fivetran_id text,
    invoice_id text,
    transaction_id text,
    attempt text,
    created_at text,
    dunning_type text,
    transaction_amount text,
    transaction_status text,
    PRIMARY KEY (_fivetran_id, invoice_id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id),
    FOREIGN KEY (transaction_id) REFERENCES "transaction"(id)
);

CREATE TABLE invoice_applied_credit (
    credit_note_id text,
    invoice_id text,
    applied_amount text,
    applied_at text,
    PRIMARY KEY (credit_note_id, invoice_id),
    FOREIGN KEY (credit_note_id) REFERENCES credit_note(id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id)
);

CREATE TABLE invoice_line_item (
    line_item_id text,
    invoice_id text,
    customer_id text,
    subscription_id text,
    amount text,
    amount_in_decimal text,
    date_from text,
    date_to text,
    deleted text,
    description text,
    discount_amount text,
    entity_description text,
    entity_id text,
    entity_type text,
    is_taxed text,
    item_level_discount_amount text,
    object text,
    pricing_model text,
    quantity text,
    quantity_in_decimal text,
    tax_amount text,
    tax_exempt_reason text,
    tax_rate text,
    unit_amount text,
    unit_amount_in_decimal text,
    PRIMARY KEY (line_item_id, invoice_id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (subscription_id) REFERENCES subscription(id)
);

CREATE TABLE invoice_line_item_tax (
    _fivetran_id text,
    invoice_id text,
    line_item_id text,
    is_non_compliance_tax text,
    is_partial_tax_applied text,
    local_currency_code text,
    tax_amount text,
    tax_amount_in_local_currency text,
    tax_juris_code text,
    tax_juris_name text,
    tax_juris_type text,
    tax_name text,
    tax_rate text,
    taxable_amount text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id),
    FOREIGN KEY (line_item_id) REFERENCES invoice_line_item(line_item_id)
);

CREATE TABLE invoice_line_item_discount (
    _fivetran_id text,
    invoice_id text,
    line_item_id text,
    discount_amount text,
    discount_type text,
    entity_id text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id),
    FOREIGN KEY (line_item_id) REFERENCES invoice_line_item(line_item_id)
);

CREATE TABLE invoice_line_item_tier (
    _fivetran_id text,
    invoice_id text,
    line_item_id text,
    ending_unit text,
    ending_unit_in_decimal text,
    quantity_used text,
    quantity_used_in_decimal text,
    starting_unit text,
    starting_unit_in_decimal text,
    unit_amount text,
    unit_amount_in_decimal text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id),
    FOREIGN KEY (line_item_id) REFERENCES invoice_line_item(line_item_id)
);

CREATE TABLE invoice_tax (
    _fivetran_id text,
    invoice_id text,
    amount text,
    description text,
    "name" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id)
);

CREATE TABLE invoice_discount (
    _fivetran_id text,
    invoice_id text,
    line_item_id text,
    amount text,
    coupon_set_code text,
    discount_type text,
    entity_id text,
    entity_type text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id),
    FOREIGN KEY (line_item_id) REFERENCES invoice_line_item(line_item_id)
);

CREATE TABLE invoice_note (
    _fivetran_id text,
    invoice_id text,
    entity_id text,
    entity_type text,
    note text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id)
);

CREATE TABLE invoice_linked_tax_withheld_refund (
    id text,
    invoice_id text,
    amount text,
    "date" text,
    description text,
    reference_number text,
    PRIMARY KEY (id, invoice_id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id)
);

CREATE TABLE invoice_linked_order (
    invoice_id text,
    order_id text,
    PRIMARY KEY (invoice_id, order_id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id),
    FOREIGN KEY (order_id) REFERENCES orders(id)
);

CREATE TABLE invoice_linked_payment (
    invoice_id text,
    transaction_id text,
    applied_amount text,
    applied_at text,
    transaction_amount text,
    transaction_date text,
    transaction_status text,
    PRIMARY KEY (invoice_id, transaction_id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id),
    FOREIGN KEY (transaction_id) REFERENCES "transaction"(id)
);

CREATE TABLE invoice (
    id text,
    customer_id text,
    subscription_id text,
    amount_adjusted text,
    amount_due text,
    amount_paid text,
    amount_to_collect text,
    billing_address_city text,
    billing_address_company text,
    billing_address_country text,
    billing_address_email text,
    billing_address_first_name text,
    billing_address_last_name text,
    billing_address_line_1 text,
    billing_address_line_2 text,
    billing_address_line_3 text,
    billing_address_object text,
    billing_address_phone text,
    billing_address_state text,
    billing_address_state_code text,
    billing_address_validation_status text,
    billing_address_zip text,
    channel text,
    credits_applied text,
    currency_code text,
    "date" text,
    deleted text,
    due_date text,
    dunning_status text,
    einvoice_id text,
    einvoice_message text,
    einvoice_status text,
    exchange_rate text,
    expected_payment_date text,
    first_invoice text,
    generated_at text,
    has_advance_charges text,
    is_gifted text,
    local_currency_code text,
    net_term_days text,
    new_sales_amount text,
    next_retry_at text,
    paid_at text,
    payment_owner text,
    po_number text,
    price_type text,
    recurring text,
    resource_version text,
    round_off_amount text,
    shipping_address_city text,
    shipping_address_company text,
    shipping_address_country text,
    shipping_address_email text,
    shipping_address_first_name text,
    shipping_address_last_name text,
    shipping_address_line_1 text,
    shipping_address_line_2 text,
    shipping_address_line_3 text,
    shipping_address_object text,
    shipping_address_phone text,
    shipping_address_state text,
    shipping_address_state_code text,
    shipping_address_validation_status text,
    shipping_address_zip text,
    "status" text,
    sub_total text,
    sub_total_in_local_currency text,
    tax text,
    term_finalized text,
    total text,
    total_in_local_currency text,
    updated_at text,
    vat_number text,
    vat_number_prefix text,
    void_reason_code text,
    voided_at text,
    write_off_amount text,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (subscription_id) REFERENCES subscription(id)
);

CREATE TABLE payment_source_mandate (
    id text,
    payment_source_id text,
    subscription_id text,
    created_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (payment_source_id) REFERENCES payment_source(id),
    FOREIGN KEY (subscription_id) REFERENCES subscription(id)
);

CREATE TABLE payment_source (
    id text,
    customer_id text,
    amazon_payment_agreement_id text,
    amazon_payment_email text,
    bank_account_account_holder_type text,
    bank_account_account_type text,
    bank_account_bank_name text,
    bank_account_echeck_type text,
    bank_account_email text,
    bank_account_first_name text,
    bank_account_last_4 text,
    bank_account_last_name text,
    bank_account_mandate_id text,
    bank_account_name_on_account text,
    business_entity_id text,
    card_billing_addr_1 text,
    card_billing_addr_2 text,
    card_billing_city text,
    card_billing_country text,
    card_billing_state text,
    card_billing_state_code text,
    card_billing_zip text,
    card_brand text,
    card_expiry_month text,
    card_expiry_year text,
    card_first_name text,
    card_funding_type text,
    card_iin text,
    card_last_4 text,
    card_last_name text,
    card_masked_number text,
    card_object text,
    created_at text,
    deleted text,
    gateway text,
    gateway_account_id text,
    ip_address text,
    issuing_country text,
    paypal_agreement_id text,
    paypal_email text,
    reference_id text,
    resource_version text,
    "status" text,
    "type" text,
    updated_at text,
    upi_vpa text,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE coupon_applicable_item_price (
    coupon_id text,
    coupon_item_constraint_type text,
    coupon_item_constraints text,
    item_price_id text,
    PRIMARY KEY (coupon_id, coupon_item_constraint_type, coupon_item_constraints, item_price_id),
    FOREIGN KEY (coupon_id) REFERENCES coupon(id),
    FOREIGN KEY (coupon_item_constraint_type) REFERENCES coupon_item_constraint(item_type),
    FOREIGN KEY (coupon_item_constraints) REFERENCES coupon_item_constraint(constraints),
    FOREIGN KEY (item_price_id) REFERENCES item_price(id)
);

CREATE TABLE coupon_item_constraint (
    constraints text,
    coupon_id text,
    item_type text,
    PRIMARY KEY (constraints, coupon_id, item_type),
    FOREIGN KEY (coupon_id) REFERENCES coupon(id),
    FOREIGN KEY (item_type) REFERENCES item("type")
);

CREATE TABLE coupon_applicable_item_family (
    coupon_id text,
    coupon_item_constraint_criteria_index text,
    item_family_id text,
    coupon_item_constraint_criteria_item_type text,
    PRIMARY KEY (coupon_id, coupon_item_constraint_criteria_index, item_family_id),
    FOREIGN KEY (coupon_id) REFERENCES coupon(id),
    FOREIGN KEY (coupon_item_constraint_criteria_index) REFERENCES coupon_item_constraint_criteria("index"),
    FOREIGN KEY (item_family_id) REFERENCES item_family(id)
);

CREATE TABLE coupon_applicable_price_period (
    item_price_period text,
    coupon_id text,
    coupon_item_constraint_criteria_index text,
    PRIMARY KEY (item_price_period, coupon_id, coupon_item_constraint_criteria_index),
    FOREIGN KEY (coupon_id) REFERENCES coupon(id),
    FOREIGN KEY (coupon_item_constraint_criteria_index) REFERENCES coupon_item_constraint_criteria("index")
);

CREATE TABLE coupon_item_constraint_criteria (
    "index" text,
    coupon_id text,
    item_type text,
    currencies jsonb,
    PRIMARY KEY ("index", coupon_id),
    FOREIGN KEY (coupon_id) REFERENCES coupon(id),
    FOREIGN KEY (item_type) REFERENCES item("type")
);

CREATE TABLE coupon_metadata (
    "name" text,
    coupon_id text,
    "value" text,
    PRIMARY KEY ("name", coupon_id),
    FOREIGN KEY (coupon_id) REFERENCES coupon(id)
);

CREATE TABLE coupon (
    id text,
    apply_on text,
    archived_at text,
    created_at text,
    currency_code text,
    discount_amount text,
    discount_percentage text,
    discount_type text,
    duration_type text,
    invoice_name text,
    invoice_notes text,
    max_redemptions text,
    "name" text,
    period text,
    period_unit text,
    redemptions text,
    resource_version text,
    "status" text,
    updated_at text,
    valid_till text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE coupon_set (
    id text,
    coupon_id text,
    archived_count text,
    "name" text,
    redeemed_count text,
    total_count text,
    PRIMARY KEY (id),
    FOREIGN KEY (coupon_id) REFERENCES coupon(id)
);

CREATE TABLE item_price_tier (
    _fivetran_id text,
    item_price_id text,
    ending_unit text,
    price text,
    starting_unit text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (item_price_id) REFERENCES item_price(id)
);

CREATE TABLE item_price_metadata (
    "name" text,
    item_price_id text,
    "value" text,
    PRIMARY KEY ("name", item_price_id),
    FOREIGN KEY (item_price_id) REFERENCES item_price(id)
);

CREATE TABLE item_price (
    id text,
    item_family_id text,
    item_id text,
    accounting_detail_accounting_category_1 text,
    accounting_detail_accounting_category_2 text,
    accounting_detail_accounting_category_3 text,
    accounting_detail_accounting_category_4 text,
    accounting_detail_accounting_code text,
    accounting_detail_sku text,
    archived_at text,
    billing_cycles text,
    channel text,
    created_at text,
    currency_code text,
    description text,
    external_name text,
    free_quantity text,
    free_quantity_in_decimal text,
    invoice_notes text,
    is_taxable text,
    "name" text,
    period text,
    period_unit text,
    price text,
    price_in_decimal text,
    pricing_model text,
    resource_version text,
    shipping_period text,
    shipping_period_unit text,
    show_description_in_invoices text,
    show_description_in_quotes text,
    "status" text,
    tax_detail_avalara_sale_type text,
    tax_detail_avalara_service_type text,
    tax_detail_avalara_tax_code text,
    tax_detail_avalara_transaction_type text,
    tax_detail_hsn_code text,
    tax_detail_tax_profile_id text,
    tax_detail_taxjar_product_code text,
    trial_end_action text,
    trial_period text,
    trial_period_unit text,
    updated_at text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (item_family_id) REFERENCES item_family(id),
    FOREIGN KEY (item_id) REFERENCES item(id)
);

CREATE TABLE quote_line_item (
    id text,
    quote_id text,
    customer_id text,
    reference_line_item_id text,
    subscription_id text,
    amount text,
    amount_in_decimal text,
    date_from text,
    date_to text,
    description text,
    discount_amount text,
    entity_description text,
    entity_id text,
    entity_type text,
    is_taxed text,
    item_level_discount_amount text,
    object text,
    pricing_model text,
    quantity text,
    quantity_in_decimal text,
    tax_amount text,
    tax_exempt_reason text,
    tax_rate text,
    unit_amount text,
    unit_amount_in_decimal text,
    PRIMARY KEY (id, quote_id),
    FOREIGN KEY (quote_id) REFERENCES quote(id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (reference_line_item_id) REFERENCES quote_line_item(id),
    FOREIGN KEY (subscription_id) REFERENCES subscription(id)
);

CREATE TABLE quote_discount (
    "index" text,
    quote_id text,
    line_item_id text,
    amount text,
    coupon_set_code text,
    description text,
    discount_percentage text,
    discount_type text,
    entity_id text,
    entity_type text,
    object text,
    PRIMARY KEY ("index", quote_id),
    FOREIGN KEY (quote_id) REFERENCES quote(id),
    FOREIGN KEY (line_item_id) REFERENCES quote_line_item(id)
);

CREATE TABLE quote_note (
    "index" text,
    quote_id text,
    note text,
    PRIMARY KEY ("index", quote_id),
    FOREIGN KEY (quote_id) REFERENCES quote(id)
);

CREATE TABLE quote_line_item_tax (
    "index" text,
    quote_id text,
    line_item_id text,
    date_from text,
    date_to text,
    is_non_compliance_tax text,
    is_partial_tax_applied text,
    local_currency_code text,
    object text,
    prorated_taxable_amount text,
    tax_amount text,
    tax_amount_in_local_currency text,
    tax_juris_code text,
    tax_juris_name text,
    tax_juris_type text,
    tax_name text,
    tax_rate text,
    taxable_amount text,
    PRIMARY KEY ("index", quote_id),
    FOREIGN KEY (quote_id) REFERENCES quote(id),
    FOREIGN KEY (line_item_id) REFERENCES quote_line_item(id)
);

CREATE TABLE quote_line_item_discount (
    "index" text,
    quote_id text,
    coupon_id text,
    line_item_id text,
    discount_amount text,
    discount_type text,
    object text,
    PRIMARY KEY ("index", quote_id),
    FOREIGN KEY (quote_id) REFERENCES quote(id),
    FOREIGN KEY (coupon_id) REFERENCES coupon(id),
    FOREIGN KEY (line_item_id) REFERENCES quote_line_item(id)
);

CREATE TABLE quote_line_item_tier (
    "index" text,
    quote_id text,
    line_item_id text,
    ending_unit text,
    ending_unit_in_decimal text,
    object text,
    quantity_used text,
    quantity_used_in_decimal text,
    starting_unit text,
    starting_unit_in_decimal text,
    unit_amount text,
    unit_amount_in_decimal text,
    PRIMARY KEY ("index", quote_id),
    FOREIGN KEY (quote_id) REFERENCES quote(id),
    FOREIGN KEY (line_item_id) REFERENCES quote_line_item(id)
);

CREATE TABLE quote_tax (
    "index" text,
    quote_id text,
    amount text,
    description text,
    "name" text,
    object text,
    PRIMARY KEY ("index", quote_id),
    FOREIGN KEY (quote_id) REFERENCES quote(id)
);

CREATE TABLE quote (
    id text,
    customer_id text,
    invoice_id text,
    subscription_id text,
    amount_due text,
    amount_paid text,
    billing_address_city text,
    billing_address_company text,
    billing_address_country text,
    billing_address_email text,
    billing_address_first_name text,
    billing_address_last_name text,
    billing_address_line_1 text,
    billing_address_line_2 text,
    billing_address_line_3 text,
    billing_address_object text,
    billing_address_phone text,
    billing_address_state text,
    billing_address_state_code text,
    billing_address_validation_status text,
    billing_address_zip text,
    business_entity_id text,
    charge_on_acceptance text,
    contract_term_end text,
    contract_term_start text,
    contract_term_termination_fee text,
    credits_applied text,
    currency_code text,
    "date" text,
    deleted text,
    discounts text,
    "name" text,
    object text,
    operation_type text,
    po_number text,
    price_type text,
    resource_version text,
    shipping_address_city text,
    shipping_address_company text,
    shipping_address_country text,
    shipping_address_email text,
    shipping_address_first_name text,
    shipping_address_index text,
    shipping_address_last_name text,
    shipping_address_line_1 text,
    shipping_address_line_2 text,
    shipping_address_line_3 text,
    shipping_address_object text,
    shipping_address_phone text,
    shipping_address_state text,
    shipping_address_state_code text,
    shipping_address_validation_status text,
    shipping_address_zip text,
    "status" text,
    sub_total text,
    tax_category text,
    taxes text,
    total text,
    total_payable text,
    updated_at text,
    valid_till text,
    vat_number text,
    vat_number_prefix text,
    version text,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id),
    FOREIGN KEY (subscription_id) REFERENCES subscription(id)
);

CREATE TABLE quote_subscription_item (
    "index" text,
    fivetran_id text,
    billing_cycles text,
    item_price_id text,
    item_type text,
    object text,
    quantity text,
    quantity_in_decimal text,
    unit_price text,
    unit_price_in_decimal text,
    PRIMARY KEY ("index", fivetran_id),
    FOREIGN KEY (fivetran_id) REFERENCES quote_subscription(_fivetran_id)
);

CREATE TABLE quote_subscription_item_tier (
    "index" text,
    fivetran_id text,
    ending_unit text,
    ending_unit_in_decimal text,
    item_price_id text,
    object text,
    price text,
    price_in_decimal text,
    starting_unit text,
    starting_unit_in_decimal text,
    PRIMARY KEY ("index", fivetran_id),
    FOREIGN KEY (fivetran_id) REFERENCES quote_subscription(_fivetran_id)
);

CREATE TABLE quote_subscription_discount (
    "index" text,
    fivetran_id text,
    apply_on text,
    created_at text,
    duration_type text,
    id text,
    invoice_name text,
    item_price_id text,
    object text,
    percentage text,
    "type" text,
    PRIMARY KEY ("index", fivetran_id),
    FOREIGN KEY (fivetran_id) REFERENCES quote_subscription(_fivetran_id)
);

CREATE TABLE quote_subscription_addon (
    "index" text,
    fivetran_id text,
    amount text,
    amount_in_decimal text,
    id text,
    proration_type text,
    quantity text,
    quantity_in_decimal text,
    remaining_billing_cycles text,
    trial_end text,
    unit_price text,
    unit_price_in_decimal text,
    PRIMARY KEY ("index", fivetran_id),
    FOREIGN KEY (fivetran_id) REFERENCES quote_subscription(_fivetran_id)
);

CREATE TABLE quote_subscription_event_based_addon (
    "index" text,
    fivetran_id text,
    charge_once text,
    id text,
    on_event text,
    quantity text,
    quantity_in_decimal text,
    unit_price text,
    unit_price_in_decimal text,
    PRIMARY KEY ("index", fivetran_id),
    FOREIGN KEY (fivetran_id) REFERENCES quote_subscription(_fivetran_id)
);

CREATE TABLE quote_subscription_coupon (
    id text,
    fivetran_id text,
    object text,
    PRIMARY KEY (id, fivetran_id),
    FOREIGN KEY (fivetran_id) REFERENCES quote_subscription(_fivetran_id)
);

CREATE TABLE quote_subscription (
    _fivetran_id text,
    auto_collection text,
    billing_period text,
    billing_period_unit text,
    change_option text,
    changes_scheduled_at text,
    contract_term_billing_cycle_on_renewal text,
    id text,
    object text,
    plan_id text,
    plan_quantity text,
    plan_quantity_in_decimal text,
    plan_unit_price text,
    plan_unit_price_in_decimal text,
    po_number text,
    quoted_contract_term_action_at_term_end text,
    quoted_contract_term_billing_cycle text,
    quoted_contract_term_cancellation_cutoff_period text,
    quoted_contract_term_contract_end text,
    quoted_contract_term_contract_start text,
    quoted_contract_term_object text,
    quoted_contract_term_total_contract_value text,
    remaining_billing_cycles text,
    setup_fee text,
    start_date text,
    trial_end text,
    PRIMARY KEY (_fivetran_id)
);
