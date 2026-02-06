CREATE TABLE payment_order_detail_item (
    sku text,
    payment_id text,
    categories jsonb,
    estimated_shipment_date text,
    image_url text,
    "name" text,
    page_url text,
    price text,
    price_currency text,
    quantity text,
    PRIMARY KEY (sku, payment_id),
    FOREIGN KEY (payment_id) REFERENCES payment(id)
);

CREATE TABLE payment_order_detail_discount (
    "index" text,
    payment_id text,
    discount_amount text,
    discount_amount_currency text,
    display_name text,
    PRIMARY KEY ("index", payment_id),
    FOREIGN KEY (payment_id) REFERENCES payment(id)
);

CREATE TABLE payment_refund (
    refund_id text,
    payment_id text,
    refund_amount text,
    refund_amount_currency text,
    refund_merchant_reference text,
    refunded_at text,
    request_id text,
    PRIMARY KEY (refund_id, payment_id),
    FOREIGN KEY (payment_id) REFERENCES payment(id)
);

CREATE TABLE payment_event (
    id text,
    payment_id text,
    created text,
    event_amount text,
    event_amount_currency text,
    expires text,
    payment_event_merchant_reference text,
    "type" text,
    PRIMARY KEY (id, payment_id),
    FOREIGN KEY (payment_id) REFERENCES payment(id)
);

CREATE TABLE payment (
    id text,
    billing_area_1 text,
    billing_area_2 text,
    billing_country_code text,
    billing_line_1 text,
    billing_line_2 text,
    billing_name text,
    billing_phone_number text,
    billing_postcode text,
    billing_region text,
    consumer_email text,
    consumer_given_name text,
    consumer_phone_number text,
    consumer_surname text,
    courier_name text,
    courier_priority text,
    courier_shipped_at text,
    courier_tracking text,
    created text,
    merchant_reference text,
    open_to_capture_amount text,
    open_to_capture_amount_currency text,
    original_amount text,
    original_amount_currency text,
    payment_state text,
    shipping_amount text,
    shipping_amount_currency text,
    shipping_area_1 text,
    shipping_area_2 text,
    shipping_country_code text,
    shipping_line_1 text,
    shipping_line_2 text,
    shipping_name text,
    shipping_phone_number text,
    shipping_postcode text,
    shipping_region text,
    "status" text,
    tax_amount text,
    tax_amount_currency text,
    token text,
    PRIMARY KEY (id)
);
