CREATE TABLE reports_aggregated_by_campaign (
    _fivetran_id text,
    advertiser_id text,
    publisher_id text,
    campaign text,
    commission_amount_approved text,
    commission_amount_bonus text,
    commission_amount_declined text,
    commission_amount_pending text,
    commission_amount_total text,
    "date" text,
    end_date text,
    publisher_name text,
    quantity_approved text,
    quantity_bonus text,
    quantity_click text,
    quantity_declined text,
    quantity_pending text,
    quantity_total text,
    sale_amount_approved text,
    sale_amount_bonus text,
    sale_amount_declined text,
    sale_amount_pending text,
    sale_amount_total text,
    start_date text,
    PRIMARY KEY (_fivetran_id, advertiser_id),
    FOREIGN KEY (advertiser_id) REFERENCES advertiser_account(id),
    FOREIGN KEY (publisher_id) REFERENCES publisher(id)
);

CREATE TABLE sales_region (
    "index" text,
    publisher_id text,
    sales_region text,
    PRIMARY KEY ("index", publisher_id),
    FOREIGN KEY (publisher_id) REFERENCES publisher(id)
);

CREATE TABLE publisher (
    id text,
    advertiser_account_id text,
    "name" text,
    primary_region text,
    primary_type text,
    PRIMARY KEY (id, advertiser_account_id),
    FOREIGN KEY (advertiser_account_id) REFERENCES advertiser_account(id)
);

CREATE TABLE advertiser_account (
    id text,
    account_name text,
    account_type text,
    user_role text,
    PRIMARY KEY (id)
);

CREATE TABLE basket_product (
    product_id text,
    transaction_id text,
    category text,
    commission_group_code text,
    product_name text,
    quantity text,
    sku_code text,
    unit_price text,
    PRIMARY KEY (product_id, transaction_id),
    FOREIGN KEY (transaction_id) REFERENCES "transaction"(id)
);

CREATE TABLE tracked_part (
    "index" text,
    transaction_id text,
    transaction_part_commission_group_id text,
    amount text,
    code text,
    currency text,
    PRIMARY KEY ("index", transaction_id, transaction_part_commission_group_id),
    FOREIGN KEY (transaction_id) REFERENCES transaction_part(transaction_id),
    FOREIGN KEY (transaction_part_commission_group_id) REFERENCES transaction_part(commission_group_id)
);

CREATE TABLE transaction_part (
    commission_group_id text,
    transaction_id text,
    advertiser_cost text,
    amount text,
    commission_amount text,
    commission_group_code text,
    commission_group_name text,
    PRIMARY KEY (commission_group_id, transaction_id),
    FOREIGN KEY (transaction_id) REFERENCES "transaction"(id)
);

CREATE TABLE custom_parameter (
    "key" text,
    transaction_id text,
    "value" text,
    PRIMARY KEY ("key", transaction_id),
    FOREIGN KEY (transaction_id) REFERENCES "transaction"(id)
);

CREATE TABLE "transaction" (
    id text,
    advertiser_id text,
    publisher_id text,
    advertiser_cost_amount text,
    advertiser_cost_currency text,
    advertiser_country text,
    amend_reason text,
    amended text,
    campaign text,
    click_date text,
    click_device text,
    click_ref text,
    commission_amount text,
    commission_currency text,
    commission_sharing_publisher_id text,
    commission_sharing_selected_rate_publisher_id text,
    commission_status text,
    customer_acquisition text,
    customer_country text,
    decline_reason text,
    ip_hash text,
    lapse_time text,
    network_fee_amount text,
    network_fee_currency text,
    old_commission_amount text,
    old_sale_amount text,
    order_ref text,
    original_sale_amount text,
    paid_to_publisher text,
    payment_id text,
    publisher_url text,
    sale_amount text,
    sale_currency text,
    site_name text,
    tracked_amount text,
    tracked_currency text,
    transaction_date text,
    transaction_device text,
    transaction_query_id text,
    "type" text,
    url text,
    validation_date text,
    voucher_code text,
    voucher_code_used text,
    PRIMARY KEY (id),
    FOREIGN KEY (advertiser_id) REFERENCES advertiser_account(id),
    FOREIGN KEY (publisher_id) REFERENCES publisher(id)
);

CREATE TABLE reports_aggregated_by_creative (
    _fivetran_id text,
    advertiser_id text,
    publisher_id text,
    advertiser_name text,
    bonus_commission text,
    bonus_number text,
    bonus_value text,
    click text,
    confirmed_commission text,
    confirmed_number text,
    confirmed_value text,
    creative_id text,
    creative_name text,
    currency text,
    declined_commission text,
    declined_number text,
    declined_value text,
    impression text,
    pending_commission text,
    pending_number text,
    pending_value text,
    publisher_name text,
    region text,
    tag_name text,
    total_commission text,
    total_number text,
    total_value text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (advertiser_id) REFERENCES advertiser_account(id),
    FOREIGN KEY (publisher_id) REFERENCES publisher(id)
);

CREATE TABLE reports_aggregated_by_publisher (
    _fivetran_id text,
    advertiser_id text,
    publisher_id text,
    advertiser_name text,
    bonus_commission text,
    bonus_number text,
    bonus_value text,
    click text,
    confirmed_commission text,
    confirmed_number text,
    confirmed_value text,
    currency text,
    declined_commission text,
    declined_number text,
    declined_value text,
    impression text,
    pending_commission text,
    pending_number text,
    pending_value text,
    publisher_name text,
    region text,
    tags jsonb,
    total_commission text,
    total_number text,
    total_value text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (advertiser_id) REFERENCES advertiser_account(id),
    FOREIGN KEY (publisher_id) REFERENCES publisher(id)
);
