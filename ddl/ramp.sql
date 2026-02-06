CREATE TABLE business_entity_account (
    "index" text,
    business_entity_id text,
    bank_account_id text,
    classification text,
    created_at text,
    external_id text,
    external_name text,
    internal_id text,
    usage_type text,
    PRIMARY KEY ("index", business_entity_id),
    FOREIGN KEY (business_entity_id) REFERENCES business_entity(id)
);

CREATE TABLE business_entity_location (
    business_entity_id text,
    location_id text,
    PRIMARY KEY (business_entity_id, location_id),
    FOREIGN KEY (business_entity_id) REFERENCES business_entity(id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE business_entity (
    id text,
    connected_subsidiary_external_id text,
    connected_subsidiary_id text,
    connected_subsidiary_name text,
    currency text,
    is_primary text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE balance (
    _fivetran_id text,
    available_card_limit double precision,
    available_flex_limit double precision,
    balance_including_pending double precision,
    card_balance_excluding_pending double precision,
    card_balance_including_pending double precision,
    card_limit double precision,
    flex_balance double precision,
    flex_limit double precision,
    float_balance_excluding_pending double precision,
    global_limit double precision,
    max_balance double precision,
    next_billing_date text,
    prev_billing_date text,
    statement_balance double precision,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE spend_program_allowed_category (
    "index" text,
    spend_program_id text,
    allowed_category text,
    PRIMARY KEY ("index", spend_program_id),
    FOREIGN KEY (spend_program_id) REFERENCES spend_program(id)
);

CREATE TABLE spend_program_allowed_vendor (
    "index" text,
    spend_program_id text,
    allowed_vendor text,
    PRIMARY KEY ("index", spend_program_id),
    FOREIGN KEY (spend_program_id) REFERENCES spend_program(id)
);

CREATE TABLE spend_program_blocked_category (
    "index" text,
    spend_program_id text,
    blocked_category text,
    PRIMARY KEY ("index", spend_program_id),
    FOREIGN KEY (spend_program_id) REFERENCES spend_program(id)
);

CREATE TABLE spend_program_blocked_vendor (
    "index" text,
    spend_program_id text,
    blocked_vendor text,
    PRIMARY KEY ("index", spend_program_id),
    FOREIGN KEY (spend_program_id) REFERENCES spend_program(id)
);

CREATE TABLE spend_program (
    id text,
    description text,
    display_name text,
    icon text,
    is_shareable text,
    issue_physical_card_if_needed text,
    limit_amount text,
    limit_currency_code text,
    permitted_spend_type_primary_card_enabled text,
    permitted_spend_type_reimbursements_enabled text,
    restriction_auto_lock_date text,
    restriction_interval text,
    restriction_next_interval_reset text,
    restriction_start_of_interval text,
    temporary_limit_amount text,
    temporary_limit_currency_code text,
    transaction_amount_limit_amount text,
    transaction_amount_limit_currency_code text,
    PRIMARY KEY (id)
);

CREATE TABLE reimbursement_receipt (
    receipt_id text,
    reimbursement_id text,
    PRIMARY KEY (receipt_id, reimbursement_id),
    FOREIGN KEY (reimbursement_id) REFERENCES reimbursement(id)
);

CREATE TABLE reimbursement_accouting_field_selection (
    id text,
    reimbursement_id text,
    category_external_id text,
    category_id text,
    category_name text,
    category_type text,
    external_id text,
    "name" text,
    "type" text,
    PRIMARY KEY (id, reimbursement_id),
    FOREIGN KEY (reimbursement_id) REFERENCES reimbursement(id)
);

CREATE TABLE reimbursement_attendees (
    "index" text,
    reimbursement_id text,
    user_id text,
    "name" text,
    PRIMARY KEY ("index", reimbursement_id),
    FOREIGN KEY (reimbursement_id) REFERENCES reimbursement(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE reimbursement_line_item_accounting_field_selection (
    id text,
    reimbursement_id text,
    reimbursement_line_item_index text,
    category_external_id text,
    category_id text,
    category_name text,
    category_type text,
    external_id text,
    "name" text,
    "type" text,
    PRIMARY KEY (id, reimbursement_id, reimbursement_line_item_index),
    FOREIGN KEY (reimbursement_id) REFERENCES reimbursement_line_item(reimbursement_id),
    FOREIGN KEY (reimbursement_line_item_index) REFERENCES reimbursement_line_item("index")
);

CREATE TABLE reimbursement_line_item (
    "index" text,
    reimbursement_id text,
    amount_amount text,
    amount_currency_code text,
    PRIMARY KEY ("index", reimbursement_id),
    FOREIGN KEY (reimbursement_id) REFERENCES reimbursement(id)
);

CREATE TABLE reimbursement (
    id text,
    merchant_id text,
    user_id text,
    amount double precision,
    created_at text,
    currency text,
    direction text,
    distance text,
    entity_id text,
    memo text,
    merchant text,
    original_reimbursement_amount text,
    original_reimbursement_currency_code text,
    payee_amount text,
    payee_currency_code text,
    spend_limit_id text,
    "state" text,
    submitted_at text,
    synced_at text,
    transaction_date text,
    trip_id text,
    "type" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (merchant_id) REFERENCES merchant(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE bill_accounting_field_selection (
    id text,
    bill_id text,
    category_info_external_id text,
    category_info_id text,
    category_info_name text,
    category_info_type text,
    external_code text,
    external_id text,
    "name" text,
    PRIMARY KEY (id, bill_id),
    FOREIGN KEY (bill_id) REFERENCES bill(id)
);

CREATE TABLE bill_inventory_line_item_accounting_field_selection (
    id text,
    bill_id text,
    bill_inventory_line_item_index text,
    category_info_external_id text,
    category_info_id text,
    category_info_name text,
    category_info_type text,
    external_code text,
    external_id text,
    "name" text,
    PRIMARY KEY (id, bill_id, bill_inventory_line_item_index),
    FOREIGN KEY (bill_id) REFERENCES bill_inventory_line_item(bill_id),
    FOREIGN KEY (bill_inventory_line_item_index) REFERENCES bill_inventory_line_item("index")
);

CREATE TABLE bill_inventory_line_item (
    "index" text,
    bill_id text,
    amount text,
    amount_currency_code text,
    memo text,
    unit_price_amount text,
    unit_price_currency_code text,
    unit_quantity text,
    PRIMARY KEY ("index", bill_id),
    FOREIGN KEY (bill_id) REFERENCES bill(id)
);

CREATE TABLE bill_invoice_url (
    "index" text,
    bill_id text,
    invoice_url text,
    PRIMARY KEY ("index", bill_id),
    FOREIGN KEY (bill_id) REFERENCES bill(id)
);

CREATE TABLE bill_line_item_accounting_field_selection (
    id text,
    bill_id text,
    bill_line_item_index text,
    category_info_external_id text,
    category_info_id text,
    category_info_name text,
    category_info_type text,
    external_code text,
    external_id text,
    "name" text,
    PRIMARY KEY (id, bill_id, bill_line_item_index),
    FOREIGN KEY (bill_id) REFERENCES bill_line_item(bill_id),
    FOREIGN KEY (bill_line_item_index) REFERENCES bill_line_item("index")
);

CREATE TABLE bill_line_item (
    "index" text,
    bill_id text,
    amount text,
    amount_currency_code text,
    memo text,
    PRIMARY KEY ("index", bill_id),
    FOREIGN KEY (bill_id) REFERENCES bill(id)
);

CREATE TABLE bill (
    id text,
    entity_id text,
    vendor_contact_id text,
    vendor_id text,
    accounting_date text,
    accounting_sync_date text,
    amount text,
    amount_currency_code text,
    approval_status text,
    archived_at text,
    bill_owner_first_name text,
    bill_owner_id text,
    bill_owner_last_name text,
    created_at text,
    deep_link_url text,
    due_at text,
    fx_conversion_rate text,
    invoice_number text,
    issued_at text,
    memo text,
    paid_at text,
    payment_amount text,
    payment_amount_currency_code text,
    payment_date text,
    payment_details_spend_limit_id text,
    payment_details_transaction_ids jsonb,
    payment_effective_date text,
    payment_method text,
    payment_traceid text,
    payment_traceid_descriptor text,
    posting_date text,
    remote_id text,
    "status" text,
    sync_status text,
    vendor_memo text,
    vendor_remote_code text,
    vendor_remote_id text,
    vendor_remote_name text,
    PRIMARY KEY (id),
    FOREIGN KEY (entity_id) REFERENCES business_entity(id),
    FOREIGN KEY (vendor_contact_id) REFERENCES vendor_contact(contact_id),
    FOREIGN KEY (vendor_id) REFERENCES vendor(id)
);

CREATE TABLE merchant (
    id text,
    is_auto_approved text,
    "name" text,
    sk_category_name text,
    PRIMARY KEY (id)
);

CREATE TABLE user_custom_field (
    "index" text,
    user_id text,
    "name" text,
    "value" text,
    PRIMARY KEY ("index", user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    business_id text,
    department_id text,
    location_id text,
    email text,
    employee_id text,
    first_name text,
    is_manager boolean,
    last_name text,
    manager_id text,
    phone text,
    "role" text,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (business_id) REFERENCES business(id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE purchase_order_accounting_field_selection (
    id text,
    purchase_order_id text,
    category_info_external_id text,
    category_info_id text,
    category_info_name text,
    category_info_type text,
    external_code text,
    external_id text,
    "name" text,
    PRIMARY KEY (id, purchase_order_id),
    FOREIGN KEY (purchase_order_id) REFERENCES purchase_order(id)
);

CREATE TABLE purchase_order_transaction (
    "index" text,
    purchase_order_id text,
    transaction_id text,
    PRIMARY KEY ("index", purchase_order_id),
    FOREIGN KEY (purchase_order_id) REFERENCES purchase_order(id),
    FOREIGN KEY (transaction_id) REFERENCES "transaction"(id)
);

CREATE TABLE purchase_order_bill (
    "index" text,
    purchase_order_id text,
    bill_id text,
    PRIMARY KEY ("index", purchase_order_id),
    FOREIGN KEY (purchase_order_id) REFERENCES purchase_order(id),
    FOREIGN KEY (bill_id) REFERENCES bill(id)
);

CREATE TABLE purchase_order_line_item_accounting_field_selection (
    id text,
    purchase_order_id text,
    purchase_order_line_item_id text,
    category_info_external_id text,
    category_info_id text,
    category_info_name text,
    category_info_type text,
    external_code text,
    external_id text,
    "name" text,
    PRIMARY KEY (id, purchase_order_id, purchase_order_line_item_id),
    FOREIGN KEY (purchase_order_id) REFERENCES purchase_order_line_item(purchase_order_id),
    FOREIGN KEY (purchase_order_line_item_id) REFERENCES purchase_order_line_item(id)
);

CREATE TABLE purchase_order_line_item (
    id text,
    purchase_order_id text,
    amount text,
    amount_currency_code text,
    description text,
    remote_id text,
    unit_price_amount text,
    unit_price_currency_code text,
    unit_quantity text,
    PRIMARY KEY (id, purchase_order_id),
    FOREIGN KEY (purchase_order_id) REFERENCES purchase_order(id)
);

CREATE TABLE purchase_order (
    id text,
    entity_id text,
    user_id text,
    vendor_id text,
    amount text,
    amount_currency_code text,
    archived_at text,
    billing_status text,
    created_at text,
    creation_source text,
    memo text,
    "name" text,
    net_payment_terms text,
    owner_id text,
    promise_date text,
    purchase_order_number text,
    receipt_status text,
    spend_end_date text,
    spend_request_id text,
    spend_start_date text,
    spend_total_amount text,
    spend_total_currency_code text,
    three_way_match_enabled text,
    PRIMARY KEY (id),
    FOREIGN KEY (entity_id) REFERENCES business_entity(id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (vendor_id) REFERENCES vendor(id)
);

CREATE TABLE receipt (
    id text,
    transaction_id text,
    user_id text,
    created_at text,
    receipt_url text,
    PRIMARY KEY (id),
    FOREIGN KEY (transaction_id) REFERENCES "transaction"(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE card_spending_restriction_category (
    category_code text,
    card_id text,
    PRIMARY KEY (category_code, card_id),
    FOREIGN KEY (card_id) REFERENCES card(id)
);

CREATE TABLE card_spending_restriction_blocked_category (
    blocked_category_code text,
    card_id text,
    PRIMARY KEY (blocked_category_code, card_id),
    FOREIGN KEY (card_id) REFERENCES card(id)
);

CREATE TABLE card (
    id text,
    cardholder_id text,
    created_at text,
    display_name text,
    expiration text,
    fulfillment_fulfillment_status text,
    fulfillment_shipping_date timestamp,
    fulfillment_shipping_eta timestamp,
    fulfillment_shipping_recipient_address_address_1 text,
    fulfillment_shipping_recipient_address_city text,
    fulfillment_shipping_recipient_address_country text,
    fulfillment_shipping_recipient_address_first_name text,
    fulfillment_shipping_recipient_address_last_name text,
    fulfillment_shipping_recipient_address_postal_code text,
    fulfillment_shipping_recipient_address_state text,
    fulfillment_shipping_tracking_url text,
    has_program_overidden boolean,
    is_physical boolean,
    last_four text,
    spending_restrictions_amount double precision,
    spending_restrictions_auto_lock_date timestamp,
    spending_restrictions_interval text,
    spending_restrictions_suspended boolean,
    spending_restrictions_transaction_amount_limit double precision,
    "state" text,
    PRIMARY KEY (id),
    FOREIGN KEY (cardholder_id) REFERENCES users(id)
);

CREATE TABLE vendor_contact (
    contact_id text,
    vendor_id text,
    PRIMARY KEY (contact_id, vendor_id),
    FOREIGN KEY (vendor_id) REFERENCES vendor(id)
);

CREATE TABLE vendor (
    id text,
    accounting_vendor_remote_id text,
    address_city text,
    address_country text,
    address_line_1 text,
    address_line_2 text,
    address_postal_code text,
    address_state text,
    billing_frequency text,
    country text,
    created_at text,
    description text,
    federal_tax_classification text,
    is_active text,
    is_deletable text,
    merchant_id text,
    "name" text,
    name_legal text,
    owner_id text,
    sk_category_id text,
    sk_category_name text,
    "state" text,
    tax_address_city text,
    tax_address_country text,
    tax_address_line_1 text,
    tax_address_line_2 text,
    tax_address_postal_code text,
    tax_address_state text,
    total_spend_all_time_amount text,
    total_spend_all_time_currency_code text,
    total_spend_all_time_minor_unit_conversion_rate text,
    total_spend_last_30_days_amount text,
    total_spend_last_30_days_currency_code text,
    total_spend_last_30_days_minor_unit_conversion_rate text,
    total_spend_last_365_days_amount text,
    total_spend_last_365_days_currency_code text,
    total_spend_last_365_days_minor_unit_conversion_rate text,
    total_spend_ytd_amount text,
    total_spend_ytd_currency_code text,
    total_spend_ytd_minor_unit_conversion_rate text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE department (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE limit_card (
    card_id text,
    limit_id text,
    is_ap_card text,
    via_new_product_or_service text,
    PRIMARY KEY (card_id, limit_id),
    FOREIGN KEY (card_id) REFERENCES card(id),
    FOREIGN KEY (limit_id) REFERENCES limits(id)
);

CREATE TABLE limit_category_whitelist (
    "index" text,
    limit_id text,
    category_whitelist text,
    PRIMARY KEY ("index", limit_id),
    FOREIGN KEY (limit_id) REFERENCES limits(id)
);

CREATE TABLE limit_allowed_category (
    "index" text,
    limit_id text,
    allowed_category text,
    PRIMARY KEY ("index", limit_id),
    FOREIGN KEY (limit_id) REFERENCES limits(id)
);

CREATE TABLE limit_vendor_blacklist (
    "index" text,
    limit_id text,
    vendor_blacklist text,
    PRIMARY KEY ("index", limit_id),
    FOREIGN KEY (limit_id) REFERENCES limits(id)
);

CREATE TABLE limit_users (
    limit_id text,
    user_id text,
    PRIMARY KEY (limit_id, user_id),
    FOREIGN KEY (limit_id) REFERENCES limits(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE limits (
    id text,
    spend_program_id text,
    suspension_acting_user_id text,
    balance_cleared_amount text,
    balance_cleared_currency_code text,
    balance_pending_amount text,
    balance_pending_currency_code text,
    balance_total_amount text,
    balance_total_currency_code text,
    created_at text,
    display_name text,
    entity_id text,
    has_program_overridden text,
    is_shareable text,
    limit_amount text,
    limit_currency_code text,
    permitted_spend_type_primary_card_enabled text,
    permitted_spend_type_reimbursements_enabled text,
    restriction_auto_lock_date text,
    restriction_interval text,
    restriction_next_interval_reset text,
    restriction_start_of_interval_date text,
    "state" text,
    suspension_inserted_at text,
    suspension_suspended_by_ramp text,
    temporary_limit_amount text,
    temporary_limit_currency_code text,
    transaction_amount_limit_amount text,
    transaction_amount_limit_currency_code text,
    PRIMARY KEY (id),
    FOREIGN KEY (spend_program_id) REFERENCES spend_program(id),
    FOREIGN KEY (suspension_acting_user_id) REFERENCES users(id)
);

CREATE TABLE business (
    id text,
    active boolean,
    billing_address_address_1 text,
    billing_address_city text,
    billing_address_country text,
    billing_address_postal_code text,
    billing_address_state text,
    business_name_legal text,
    business_name_on_card text,
    created_time timestamp,
    enforce_sso boolean,
    initial_approved_limit double precision,
    is_integrated_with_slack boolean,
    is_reimbursements_enabled boolean,
    limit_locked boolean,
    phone text,
    website text,
    PRIMARY KEY (id)
);

CREATE TABLE location (
    id text,
    entity_id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE transaction_accounting_category (
    "index" text,
    transaction_id text,
    category_id text,
    category_name text,
    tracking_category_remote_id text,
    tracking_category_remote_name text,
    tracking_category_remote_type text,
    PRIMARY KEY ("index", transaction_id),
    FOREIGN KEY (transaction_id) REFERENCES "transaction"(id)
);

CREATE TABLE transaction_policy_violation (
    "index" text,
    transaction_id text,
    created_at timestamp,
    id text,
    memo text,
    "type" text,
    PRIMARY KEY ("index", transaction_id),
    FOREIGN KEY (transaction_id) REFERENCES "transaction"(id)
);

CREATE TABLE transaction_accounting_field_selection (
    id text,
    transaction_id text,
    category_external_id text,
    category_id text,
    category_name text,
    category_type text,
    external_id text,
    "name" text,
    "type" text,
    PRIMARY KEY (id, transaction_id),
    FOREIGN KEY (transaction_id) REFERENCES "transaction"(id)
);

CREATE TABLE transaction_attendees (
    "index" text,
    transaction_id text,
    user_id text,
    "name" text,
    PRIMARY KEY ("index", transaction_id),
    FOREIGN KEY (transaction_id) REFERENCES "transaction"(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE transaction_line_item_accounting_field_selection (
    id text,
    transaction_line_item_index text,
    transaction_line_item_transaction_id text,
    category_external_id text,
    category_id text,
    category_name text,
    category_type text,
    external_id text,
    "name" text,
    "type" text,
    PRIMARY KEY (id, transaction_line_item_index, transaction_line_item_transaction_id),
    FOREIGN KEY (transaction_line_item_index) REFERENCES transaction_line_item("index"),
    FOREIGN KEY (transaction_line_item_transaction_id) REFERENCES transaction_line_item(transaction_id)
);

CREATE TABLE transaction_line_item (
    "index" text,
    transaction_id text,
    amount_amount text,
    amount_currency_code text,
    converted_amount text,
    converted_currency_code text,
    PRIMARY KEY ("index", transaction_id),
    FOREIGN KEY (transaction_id) REFERENCES "transaction"(id)
);

CREATE TABLE transaction_merchant_receipt (
    "index" text,
    transaction_id text,
    commodity_code text,
    description text,
    discount text,
    quantity text,
    tax text,
    total text,
    unit_cost text,
    PRIMARY KEY ("index", transaction_id),
    FOREIGN KEY (transaction_id) REFERENCES "transaction"(id)
);

CREATE TABLE transaction_dispute (
    id text,
    transaction_id text,
    created_at timestamp,
    memo text,
    "type" text,
    PRIMARY KEY (id, transaction_id),
    FOREIGN KEY (transaction_id) REFERENCES "transaction"(id)
);

CREATE TABLE "transaction" (
    id text,
    card_holder_department_id text,
    card_holder_location_id text,
    card_holder_user_id text,
    card_id text,
    spend_program_id text,
    amount double precision,
    currency_code text,
    entity_id text,
    memo text,
    merchant_category_code text,
    merchant_category_code_description text,
    merchant_data_auto_rental text,
    merchant_data_flight text,
    merchant_data_fuel text,
    merchant_data_lodging text,
    merchant_data_reference text,
    merchant_descriptor text,
    merchant_id text,
    merchant_location_city text,
    merchant_location_country text,
    merchant_location_postal_code text,
    merchant_location_state text,
    merchant_name text,
    original_transaction_amount_amount text,
    original_transaction_amount_currency_code text,
    receipts jsonb,
    settlement_date text,
    sk_category_id text,
    sk_category_name text,
    "state" text,
    synced_at text,
    trip_id text,
    trip_name text,
    user_transaction_time text,
    PRIMARY KEY (id),
    FOREIGN KEY (card_holder_department_id) REFERENCES department(id),
    FOREIGN KEY (card_holder_location_id) REFERENCES location(id),
    FOREIGN KEY (card_holder_user_id) REFERENCES users(id),
    FOREIGN KEY (card_id) REFERENCES card(id),
    FOREIGN KEY (spend_program_id) REFERENCES spend_program(id)
);
