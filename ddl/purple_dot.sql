CREATE TABLE waitlist_variant (
    "index" text,
    waitlist_id text,
    available text,
    buy_size text,
    committed text,
    sku text,
    variant_id text,
    PRIMARY KEY ("index", waitlist_id),
    FOREIGN KEY (waitlist_id) REFERENCES waitlist(id)
);

CREATE TABLE waitlist (
    id text,
    availability_product_available text,
    availability_product_buy_size text,
    availability_product_committed text,
    availability_product_id text,
    created_at text,
    earliest_ship_date text,
    labels jsonb,
    latest_ship_date text,
    launch_date text,
    "state" text,
    updated_at_min text,
    PRIMARY KEY (id)
);

CREATE TABLE pre_order_count_unit_sku (
    sku text,
    at_time text,
    canceled_units text,
    exported_units text,
    open_units text,
    PRIMARY KEY (sku)
);

CREATE TABLE fullfillement_order_line_item_tax (
    "index" text,
    fulfillment_order_id text,
    fulfillment_order_line_item_index text,
    price text,
    rate text,
    title text,
    PRIMARY KEY ("index", fulfillment_order_id, fulfillment_order_line_item_index),
    FOREIGN KEY (fulfillment_order_id) REFERENCES fulfillment_order(id),
    FOREIGN KEY (fulfillment_order_line_item_index) REFERENCES fulfillment_order_line_item("index")
);

CREATE TABLE fulfillment_order_line_item (
    "index" text,
    fulfillment_order_id text,
    id text,
    "name" text,
    price text,
    product_id text,
    quantity text,
    sku text,
    taxable text,
    total text,
    total_discount text,
    variant_id text,
    PRIMARY KEY ("index", fulfillment_order_id),
    FOREIGN KEY (fulfillment_order_id) REFERENCES fulfillment_order(id)
);

CREATE TABLE fullfillement_order_shipping_line_tax (
    "index" text,
    fulfillment_order_id text,
    fulfillment_order_shipping_line_index text,
    price text,
    rate text,
    title text,
    PRIMARY KEY ("index", fulfillment_order_id, fulfillment_order_shipping_line_index),
    FOREIGN KEY (fulfillment_order_id) REFERENCES fulfillment_order(id),
    FOREIGN KEY (fulfillment_order_shipping_line_index) REFERENCES fulfillment_order_shipping_line("index")
);

CREATE TABLE fulfillment_order_shipping_line (
    "index" text,
    fulfillment_order_id text,
    code text,
    id text,
    price text,
    title text,
    total text,
    PRIMARY KEY ("index", fulfillment_order_id),
    FOREIGN KEY (fulfillment_order_id) REFERENCES fulfillment_order(id)
);

CREATE TABLE fulfillment_order (
    id text,
    created_at timestamp,
    currency text,
    customer_default_address_address_1 text,
    customer_default_address_address_2 text,
    customer_default_address_city text,
    customer_default_address_country text,
    customer_default_address_country_code text,
    customer_default_address_first_name text,
    customer_default_address_last_name text,
    customer_default_address_phone text,
    customer_default_address_postal_code text,
    customer_default_address_province_code text,
    customer_email text,
    customer_external_id text,
    customer_first_name text,
    customer_last_name text,
    customer_tags jsonb,
    note text,
    purchased_at text,
    reference text,
    shipping_address_address_1 text,
    shipping_address_address_2 text,
    shipping_address_city text,
    shipping_address_country text,
    shipping_address_country_code text,
    shipping_address_first_name text,
    shipping_address_last_name text,
    shipping_address_phone text,
    shipping_address_postal_code text,
    shipping_address_province_code text,
    subtotal_price text,
    tax_included text,
    total_discounts text,
    total_price text,
    total_tax text,
    PRIMARY KEY (id)
);

CREATE TABLE pre_order_line_item_tax (
    "index" text,
    pre_order_id text,
    pre_order_line_item_index text,
    inclusive text,
    price text,
    rate text,
    title text,
    PRIMARY KEY ("index", pre_order_id, pre_order_line_item_index),
    FOREIGN KEY (pre_order_id) REFERENCES pre_order(id),
    FOREIGN KEY (pre_order_line_item_index) REFERENCES pre_order_line_item("index")
);

CREATE TABLE pre_order_line_item (
    "index" text,
    pre_order_id text,
    cancelled text,
    cancelled_at text,
    discount_allocations jsonb,
    earliest_ship_date text,
    id text,
    latest_ship_date text,
    "name" text,
    price text,
    product_id text,
    quantity text,
    shopify_line_item_id text,
    sku text,
    taxable text,
    total text,
    total_discount text,
    unit_price text,
    unit_total text,
    variant_id text,
    PRIMARY KEY ("index", pre_order_id),
    FOREIGN KEY (pre_order_id) REFERENCES pre_order(id)
);

CREATE TABLE pre_order_tax_line (
    "index" text,
    pre_order_id text,
    price text,
    rate text,
    title text,
    PRIMARY KEY ("index", pre_order_id),
    FOREIGN KEY (pre_order_id) REFERENCES pre_order(id)
);

CREATE TABLE pre_order_shipping_line_discount_allocation (
    "index" text,
    pre_order_id text,
    pre_order_shipping_line_index text,
    amount text,
    discount_application_index text,
    PRIMARY KEY ("index", pre_order_id, pre_order_shipping_line_index),
    FOREIGN KEY (pre_order_id) REFERENCES pre_order(id),
    FOREIGN KEY (pre_order_shipping_line_index) REFERENCES pre_order_shipping_line("index")
);

CREATE TABLE pre_order_shipping_line_tax (
    "index" text,
    pre_order_id text,
    pre_order_shipping_line_index text,
    inclusive text,
    price text,
    rate text,
    title text,
    PRIMARY KEY ("index", pre_order_id, pre_order_shipping_line_index),
    FOREIGN KEY (pre_order_id) REFERENCES pre_order(id),
    FOREIGN KEY (pre_order_shipping_line_index) REFERENCES pre_order_shipping_line("index")
);

CREATE TABLE pre_order_shipping_line_item (
    "index" text,
    pre_order_id text,
    pre_order_shipping_line_index text,
    line_item_id text,
    PRIMARY KEY ("index", pre_order_id, pre_order_shipping_line_index),
    FOREIGN KEY (pre_order_id) REFERENCES pre_order(id),
    FOREIGN KEY (pre_order_shipping_line_index) REFERENCES pre_order_shipping_line("index")
);

CREATE TABLE pre_order_shipping_line (
    "index" text,
    pre_order_id text,
    code text,
    price text,
    title text,
    total text,
    PRIMARY KEY ("index", pre_order_id),
    FOREIGN KEY (pre_order_id) REFERENCES pre_order(id)
);

CREATE TABLE pre_order_exported_line_item (
    "index" text,
    pre_order_exported_index text,
    pre_order_id text,
    id text,
    line_item_id text,
    PRIMARY KEY ("index", pre_order_exported_index, pre_order_id),
    FOREIGN KEY (pre_order_exported_index) REFERENCES pre_order_exported("index"),
    FOREIGN KEY (pre_order_id) REFERENCES pre_order(id)
);

CREATE TABLE pre_order_exported (
    "index" text,
    pre_order_id text,
    created_at text,
    id text,
    order_number text,
    "type" text,
    PRIMARY KEY ("index", pre_order_id),
    FOREIGN KEY (pre_order_id) REFERENCES pre_order(id)
);

CREATE TABLE pre_order (
    id text,
    cancel_reason text,
    cancelled_at text,
    created_at text,
    currency text,
    customer_email text,
    customer_external_id text,
    discount_applications jsonb,
    discount_codes jsonb,
    email text,
    number text,
    reference text,
    shipping_address_address_1 text,
    shipping_address_address_2 text,
    shipping_address_city text,
    shipping_address_country text,
    shipping_address_country_code text,
    shipping_address_first_name text,
    shipping_address_last_name text,
    shipping_address_phone text,
    shipping_address_postal_code text,
    shipping_address_province_code text,
    subtotal_price text,
    tax_included text,
    total_discounts text,
    total_price text,
    total_refunded text,
    total_tax text,
    updated_at_min text,
    PRIMARY KEY (id)
);
