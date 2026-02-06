CREATE TABLE refund (
    id text,
    payment_id text,
    amount_currency text,
    amount_value text,
    external_transaction_id text,
    refunded_on text,
    PRIMARY KEY (id),
    FOREIGN KEY (payment_id) REFERENCES payment(id)
);

CREATE TABLE fee_refund (
    id text,
    processing_fee_id text,
    amount_currency text,
    amount_gateway_currency text,
    amount_gateway_currency_value text,
    amount_value text,
    exchange_rate text,
    external_transaction_id text,
    refunded_on text,
    PRIMARY KEY (id),
    FOREIGN KEY (processing_fee_id) REFERENCES processing_fee(id)
);

CREATE TABLE processing_fee (
    id text,
    payment_id text,
    amount_currency text,
    amount_gateway_currency text,
    amount_gateway_currency_value text,
    amount_value text,
    exchange_rate text,
    net_amount_currency text,
    net_amount_gateway_currency text,
    net_amount_gateway_currency_value text,
    net_amount_value text,
    refunded_amount_currency text,
    refunded_amount_gateway_currency text,
    refunded_amount_gateway_currency_value text,
    refunded_amount_value text,
    PRIMARY KEY (id),
    FOREIGN KEY (payment_id) REFERENCES payment(id)
);

CREATE TABLE payment (
    id text,
    transaction_id text,
    amount_currency text,
    amount_value text,
    credit_card_type text,
    external_customer_id text,
    external_transaction_id text,
    external_transaction_properties jsonb,
    gift_card_id text,
    net_amount_currency text,
    net_amount_value text,
    paid_on text,
    provider text,
    refunded_amount_currency text,
    refunded_amount_value text,
    PRIMARY KEY (id),
    FOREIGN KEY (transaction_id) REFERENCES "transaction"(id)
);

CREATE TABLE sale_line_item_tax (
    _fivetran_id text,
    sale_line_item_id text,
    amount_currency text,
    amount_value text,
    jurisdiction text,
    "name" text,
    rate text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (sale_line_item_id) REFERENCES sale_line_item(id)
);

CREATE TABLE sale_line_item (
    id text,
    transaction_id text,
    discount_amount_currency text,
    discount_amount_value text,
    total_currency text,
    total_net_sales_currency text,
    total_net_sales_value text,
    total_sales_currency text,
    total_sales_value text,
    total_value text,
    PRIMARY KEY (id),
    FOREIGN KEY (transaction_id) REFERENCES "transaction"(id)
);

CREATE TABLE discount (
    _fivetran_id text,
    transaction_id text,
    amount_currency text,
    amount_value text,
    description text,
    "name" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (transaction_id) REFERENCES "transaction"(id)
);

CREATE TABLE shipping_line_item_tax (
    _fivetran_id text,
    shipping_line_item_id text,
    amount_currency text,
    amount_value text,
    description text,
    "name" text,
    rate text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (shipping_line_item_id) REFERENCES shipping_line_item(id)
);

CREATE TABLE shipping_line_item (
    id text,
    transaction_id text,
    amount_currency text,
    amount_value text,
    description text,
    discount_amount_currency text,
    discount_amount_value text,
    net_amount_currency text,
    net_amount_value text,
    PRIMARY KEY (id),
    FOREIGN KEY (transaction_id) REFERENCES "transaction"(id)
);

CREATE TABLE "transaction" (
    id text,
    customer_email text,
    sales_order_id text,
    created_on text,
    modified_on text,
    payment_gateway_error text,
    sale_order_id text,
    total_currency text,
    total_net_payment_currency text,
    total_net_payment_value text,
    total_net_sales_currency text,
    total_net_sales_value text,
    total_net_shipping_currency text,
    total_net_shipping_value text,
    total_sales_currency text,
    total_sales_value text,
    total_taxes_currency text,
    total_taxes_value text,
    total_value text,
    voided text,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_email) REFERENCES profile(email),
    FOREIGN KEY (sales_order_id) REFERENCES orders(id)
);

CREATE TABLE store_page (
    id text,
    is_enabled text,
    title text,
    PRIMARY KEY (id)
);

CREATE TABLE profile (
    id text,
    accepts_marketing text,
    address_address_1 text,
    address_address_2 text,
    address_city text,
    address_country_code text,
    address_first_name text,
    address_last_name text,
    address_phone text,
    address_postal_code text,
    address_state text,
    created_on timestamp,
    email text,
    first_name text,
    has_account text,
    is_customer text,
    last_name text,
    transactions_summary_donation_count text,
    transactions_summary_first_donation_submitted_on text,
    transactions_summary_first_order_submitted_on text,
    transactions_summary_last_donation_submitted_on text,
    transactions_summary_last_order_submitted_on text,
    transactions_summary_order_count text,
    transactions_summary_total_donation_amount_currency text,
    transactions_summary_total_donation_amount_value text,
    transactions_summary_total_order_amount_currency text,
    transactions_summary_total_order_amount_value text,
    transactions_summary_total_refund_amount_currency text,
    transactions_summary_total_refund_amount_value text,
    PRIMARY KEY (id)
);

CREATE TABLE inventory (
    variant_id text,
    descriptor text,
    is_unlimited text,
    quantity text,
    sku text,
    PRIMARY KEY (variant_id),
    FOREIGN KEY (variant_id) REFERENCES variant(id)
);

CREATE TABLE image (
    id text,
    product_id text,
    alt_text text,
    available_formats jsonb,
    original_size_height text,
    original_size_width text,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE variant (
    id text,
    image_id text,
    product_id text,
    attributes_flavor text,
    image_available_formats jsonb,
    image_original_size_height text,
    image_original_size_width text,
    image_title text,
    image_url text,
    pricing_base_price_currency text,
    pricing_base_price_value text,
    pricing_on_sale text,
    pricing_sale_price_currency text,
    pricing_sale_price_value text,
    shipping_measurements_dimensions_height text,
    shipping_measurements_dimensions_length text,
    shipping_measurements_dimensions_unit text,
    shipping_measurements_dimensions_width text,
    shipping_measurements_weight_unit text,
    shipping_measurements_weight_value text,
    sku text,
    stock_quantity text,
    stock_unlimited text,
    PRIMARY KEY (id),
    FOREIGN KEY (image_id) REFERENCES image(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE product (
    id text,
    store_page_id text,
    created_on text,
    description text,
    is_visible text,
    modified_on text,
    "name" text,
    seo_options_description text,
    seo_options_title text,
    tags jsonb,
    "type" text,
    url text,
    url_slug text,
    variant_attributes jsonb,
    PRIMARY KEY (id),
    FOREIGN KEY (store_page_id) REFERENCES store_page(id)
);

CREATE TABLE fulfillment (
    _fivetran_id text,
    orders_id text,
    carrier_name text,
    service text,
    ship_date text,
    tracking_number text,
    tracking_url text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (orders_id) REFERENCES orders(id)
);

CREATE TABLE form_submission (
    _fivetran_id text,
    orders_id text,
    label text,
    "value" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (orders_id) REFERENCES orders(id)
);

CREATE TABLE discount_line (
    _fivetran_id text,
    orders_id text,
    amount_currency text,
    amount_value text,
    description text,
    "name" text,
    promo_code text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (orders_id) REFERENCES orders(id)
);

CREATE TABLE shipping_line (
    _fivetran_id text,
    orders_id text,
    amount_currency text,
    amount_value text,
    method text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (orders_id) REFERENCES orders(id)
);

CREATE TABLE internal_note (
    content text,
    orders_id text,
    PRIMARY KEY (content),
    FOREIGN KEY (orders_id) REFERENCES orders(id)
);

CREATE TABLE variant_option (
    _fivetran_id text,
    line_item_id text,
    option_name text,
    "value" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (line_item_id) REFERENCES line_item(id)
);

CREATE TABLE customization (
    _fivetran_id text,
    line_item_id text,
    label text,
    "value" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (line_item_id) REFERENCES line_item(id)
);

CREATE TABLE line_item (
    id text,
    orders_id text,
    product_id text,
    variant_id text,
    line_item_type text,
    product_name text,
    quantity text,
    sku text,
    unit_price_paid_currency text,
    unit_price_paid_value text,
    PRIMARY KEY (id),
    FOREIGN KEY (orders_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (variant_id) REFERENCES variant(id)
);

CREATE TABLE orders (
    id text,
    customer_email text,
    billing_address_address_1 text,
    billing_address_address_2 text,
    billing_address_city text,
    billing_address_country_code text,
    billing_address_first_name text,
    billing_address_last_name text,
    billing_address_phone text,
    billing_address_postal_code text,
    billing_address_state text,
    channel text,
    channel_name text,
    created_on text,
    discount_total_currency text,
    discount_total_value text,
    external_order_reference text,
    fulfilled_on text,
    fulfillment_status text,
    grand_total_currency text,
    grand_total_value text,
    modified_on text,
    order_number text,
    price_tax_interpretation text,
    refunded_total_currency text,
    refunded_total_value text,
    shipping_address_address_1 text,
    shipping_address_address_2 text,
    shipping_address_city text,
    shipping_address_country_code text,
    shipping_address_first_name text,
    shipping_address_last_name text,
    shipping_address_phone text,
    shipping_address_postal_code text,
    shipping_address_state text,
    shipping_total_currency text,
    shipping_total_value text,
    subtotal_currency text,
    subtotal_value text,
    tax_total_currency text,
    tax_total_value text,
    test_mode text,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_email) REFERENCES profile(email)
);
