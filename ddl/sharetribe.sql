CREATE TABLE listing_availability_plan (
    _fivetran_id text,
    listing_id text,
    day_of_week text,
    end_time text,
    seat text,
    start_time text,
    PRIMARY KEY (_fivetran_id, listing_id),
    FOREIGN KEY (listing_id) REFERENCES listing(id)
);

CREATE TABLE listing (
    id text,
    marketplace_id text,
    availability_plan_type text,
    created_at text,
    deleted text,
    description text,
    geolocation_lat text,
    geolocation_lng text,
    meta_data jsonb,
    pivate_data jsonb,
    price_amount text,
    price_currency text,
    public_data jsonb,
    relationships_author_id text,
    relationships_marketplace_id text,
    relationships_stock_id text,
    relationships_stock_quantity text,
    "state" text,
    title text,
    PRIMARY KEY (id),
    FOREIGN KEY (marketplace_id) REFERENCES marketplace(id)
);

CREATE TABLE availability_exception (
    id text,
    listing_id text,
    ends text,
    seat text,
    "start" text,
    PRIMARY KEY (id),
    FOREIGN KEY (listing_id) REFERENCES listing(id)
);

CREATE TABLE transaction_line_item_include (
    "index" text,
    transaction_id text,
    transaction_line_item_index text,
    "value" text,
    PRIMARY KEY ("index", transaction_id, transaction_line_item_index),
    FOREIGN KEY (transaction_id) REFERENCES transaction_line_item(transaction_id),
    FOREIGN KEY (transaction_line_item_index) REFERENCES transaction_line_item("index")
);

CREATE TABLE transaction_line_item (
    "index" text,
    transaction_id text,
    code text,
    line_total_amount text,
    line_total_currency text,
    quantity text,
    reversal text,
    seat text,
    unit text,
    unit_price_amount text,
    unit_price_currency text,
    PRIMARY KEY ("index", transaction_id),
    FOREIGN KEY (transaction_id) REFERENCES "transaction"(id)
);

CREATE TABLE transaction_transition (
    "index" text,
    transaction_id text,
    by text,
    created_at text,
    transition text,
    PRIMARY KEY ("index", transaction_id),
    FOREIGN KEY (transaction_id) REFERENCES "transaction"(id)
);

CREATE TABLE "transaction" (
    id text,
    customer_id text,
    listing_id text,
    marketplace_id text,
    provider_id text,
    attributes_created_at text,
    attributes_last_transition text,
    attributes_last_transitioned_at text,
    attributes_meta_data jsonb,
    attributes_payin_total_amount text,
    attributes_payin_total_currency text,
    attributes_payout_total_amount text,
    attributes_payout_total_currency text,
    attributes_process_name text,
    attributes_process_version text,
    attributes_protected_data jsonb,
    relationships_customer_id text,
    relationships_listing_id text,
    relationships_marketplace_id text,
    relationships_provider_id text,
    relationships_stock_reservation jsonb,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES users(id),
    FOREIGN KEY (listing_id) REFERENCES listing(id),
    FOREIGN KEY (marketplace_id) REFERENCES marketplace(id),
    FOREIGN KEY (provider_id) REFERENCES users(id)
);

CREATE TABLE stock_reservation (
    id text,
    transaction_id text,
    quantity text,
    "state" text,
    PRIMARY KEY (id, transaction_id),
    FOREIGN KEY (transaction_id) REFERENCES "transaction"(id)
);

CREATE TABLE message (
    id text,
    transaction_id text,
    attributes_content text,
    attributes_created_at text,
    PRIMARY KEY (id, transaction_id),
    FOREIGN KEY (transaction_id) REFERENCES "transaction"(id)
);

CREATE TABLE review (
    id text,
    transaction_id text,
    attributes_content text,
    attributes_created_at text,
    attributes_deleted text,
    attributes_rating text,
    attributes_state text,
    attributes_type text,
    PRIMARY KEY (id, transaction_id),
    FOREIGN KEY (transaction_id) REFERENCES "transaction"(id)
);

CREATE TABLE booking (
    id text,
    transaction_id text,
    attributes_display_end text,
    attributes_display_start text,
    attributes_end text,
    attributes_seat text,
    attributes_start text,
    attributes_state text,
    PRIMARY KEY (id, transaction_id),
    FOREIGN KEY (transaction_id) REFERENCES "transaction"(id)
);

CREATE TABLE marketplace (
    id text,
    description text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE event (
    id text,
    marketplace_id text,
    attributes_created_at text,
    attributes_event_type text,
    attributes_marketplace_id text,
    attributes_previous_value jsonb,
    attributes_resource jsonb,
    attributes_resource_id text,
    attributes_resource_type text,
    attributes_sequence_id text,
    attributes_source text,
    audit_data_admin_id text,
    audit_data_client_id text,
    audit_data_request_id text,
    audit_data_user_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (marketplace_id) REFERENCES marketplace(id)
);

CREATE TABLE user_identity_provider (
    idp_id text,
    users_id text,
    user_identity text,
    PRIMARY KEY (idp_id, users_id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    marketplace_id text,
    attributes_banned text,
    attributes_created_at text,
    attributes_deleted text,
    attributes_email text,
    attributes_email_verified text,
    attributes_pending_email text,
    attributes_stripe_connected text,
    profile_abbreviated_name text,
    profile_bio text,
    profile_display_name text,
    profile_first_name text,
    profile_last_name text,
    profile_private_data jsonb,
    profile_profile_commission_rate text,
    profile_protected_data jsonb,
    profile_public_data jsonb,
    relationships_marketplace_id text,
    relationships_stripe_account_id text,
    relationships_stripe_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (marketplace_id) REFERENCES marketplace(id)
);
