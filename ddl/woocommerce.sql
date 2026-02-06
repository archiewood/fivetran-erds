CREATE TABLE shipping_zone_location (
    code text,
    shipping_zone_id text,
    "type" text,
    PRIMARY KEY (code, shipping_zone_id),
    FOREIGN KEY (shipping_zone_id) REFERENCES shipping_zone(id)
);

CREATE TABLE system_status_tool (
    id text,
    "action" text,
    confirm text,
    description text,
    message text,
    "name" text,
    success text,
    PRIMARY KEY (id)
);

CREATE TABLE product_review (
    id text,
    product_id text,
    date_created text,
    date_created_gmt text,
    rating text,
    review text,
    reviewer text,
    reviewer_avatar_urls_24 text,
    reviewer_avatar_urls_48 text,
    reviewer_avatar_urls_96 text,
    reviewer_email text,
    "status" text,
    verified text,
    PRIMARY KEY (id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE attribute_term (
    id text,
    attribute_id text,
    count text,
    description text,
    menu_order text,
    "name" text,
    slug text,
    PRIMARY KEY (id),
    FOREIGN KEY (attribute_id) REFERENCES attribute(id)
);

CREATE TABLE tax_class (
    slug text,
    "name" text,
    PRIMARY KEY (slug)
);

CREATE TABLE product_download (
    id text,
    product_id text,
    file text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE product_attribute_option (
    "option" text,
    product_attribute_id text,
    product_attribute_index text,
    product_id text,
    PRIMARY KEY ("option", product_attribute_id, product_attribute_index, product_id),
    FOREIGN KEY (product_attribute_id) REFERENCES product_attribute(id),
    FOREIGN KEY (product_attribute_index) REFERENCES product_attribute("index"),
    FOREIGN KEY (product_id) REFERENCES product_attribute(product_id)
);

CREATE TABLE product_attribute (
    id text,
    "index" text,
    product_id text,
    "name" text,
    "position" text,
    variation text,
    visible text,
    PRIMARY KEY (id, "index", product_id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE product_image (
    id text,
    product_id text,
    alt text,
    date_created text,
    date_created_gmt text,
    date_modified text,
    date_modified_gmt text,
    "name" text,
    src text,
    PRIMARY KEY (id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE product_category (
    category_id text,
    product_id text,
    PRIMARY KEY (category_id, product_id),
    FOREIGN KEY (category_id) REFERENCES category(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE product_metadata (
    "index" text,
    product_id text,
    id text,
    "key" text,
    "value" jsonb,
    PRIMARY KEY ("index", product_id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE product_related_product_id (
    related_product_id text,
    product_id text,
    PRIMARY KEY (related_product_id, product_id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE product_tag (
    product_id text,
    tag_id text,
    PRIMARY KEY (product_id, tag_id),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (tag_id) REFERENCES tags(id)
);

CREATE TABLE product_default_attribute (
    id text,
    product_id text,
    "name" text,
    "option" text,
    PRIMARY KEY (id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE product (
    id text,
    shipping_class_id text,
    average_rating text,
    backordered text,
    backorders text,
    backorders_allowed text,
    button_text text,
    catalog_visibility text,
    cross_sell_ids jsonb,
    date_created text,
    date_created_gmt text,
    date_modified text,
    date_modified_gmt text,
    date_on_sale_from text,
    date_on_sale_from_gmt text,
    date_on_sale_to text,
    date_on_sale_to_gmt text,
    description text,
    dimensions_height text,
    dimensions_length text,
    dimensions_width text,
    download_expiry text,
    download_limit text,
    downloadable text,
    external_url text,
    featured text,
    grouped_products jsonb,
    manage_stock text,
    menu_order text,
    "name" text,
    on_sale text,
    parent_id text,
    permalink text,
    price text,
    price_html text,
    purchasable text,
    purchase_note text,
    rating_count text,
    regular_price text,
    reviews_allowed text,
    sale_price text,
    shipping_class text,
    shipping_required text,
    shipping_taxable text,
    short_description text,
    sku text,
    slug text,
    sold_individually text,
    "status" text,
    stock_quantity text,
    stock_status text,
    tax_class text,
    tax_status text,
    total_sales text,
    "type" text,
    upsell_ids jsonb,
    variations jsonb,
    virtual text,
    weight text,
    PRIMARY KEY (id),
    FOREIGN KEY (shipping_class_id) REFERENCES product_shipping_class(id)
);

CREATE TABLE order_metadata (
    "index" text,
    order_id text,
    id text,
    "key" text,
    "value" jsonb,
    PRIMARY KEY ("index", order_id),
    FOREIGN KEY (order_id) REFERENCES orders(id)
);

CREATE TABLE order_line_item_tax (
    id text,
    order_id text,
    order_line_item_id text,
    compound text,
    label text,
    rate_code text,
    rate_id text,
    shipping_tax_total text,
    subtotal text,
    tax_total text,
    total text,
    PRIMARY KEY (id, order_id, order_line_item_id),
    FOREIGN KEY (order_id) REFERENCES order_line_item(order_id),
    FOREIGN KEY (order_line_item_id) REFERENCES order_line_item(id)
);

CREATE TABLE order_line_item_metadata (
    "index" text,
    order_id text,
    order_line_item_id text,
    id text,
    "key" text,
    "value" jsonb,
    PRIMARY KEY ("index", order_id, order_line_item_id),
    FOREIGN KEY (order_id) REFERENCES order_line_item(order_id),
    FOREIGN KEY (order_line_item_id) REFERENCES order_line_item(id)
);

CREATE TABLE order_line_item (
    id text,
    order_id text,
    product_id text,
    variation_id text,
    "name" text,
    price text,
    quantity text,
    sku text,
    subtotal text,
    subtotal_tax text,
    tax_class text,
    total text,
    total_tax text,
    PRIMARY KEY (id, order_id),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (variation_id) REFERENCES product_variation(id)
);

CREATE TABLE order_refund (
    order_id text,
    refund_id text,
    PRIMARY KEY (order_id, refund_id),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (refund_id) REFERENCES refund(id)
);

CREATE TABLE order_tax_line (
    id text,
    order_id text,
    compound text,
    label text,
    meta_data jsonb,
    rate_code text,
    rate_id text,
    shipping_tax_total text,
    tax_total text,
    PRIMARY KEY (id),
    FOREIGN KEY (order_id) REFERENCES orders(id)
);

CREATE TABLE order_shipping_line (
    id text,
    order_id text,
    meta_data jsonb,
    method_id text,
    method_title text,
    taxes jsonb,
    total text,
    total_tax text,
    PRIMARY KEY (id),
    FOREIGN KEY (order_id) REFERENCES orders(id)
);

CREATE TABLE order_fee_line (
    id text,
    order_id text,
    "name" text,
    tax_class text,
    tax_status text,
    taxes jsonb,
    total text,
    total_tax text,
    PRIMARY KEY (id),
    FOREIGN KEY (order_id) REFERENCES orders(id)
);

CREATE TABLE order_coupon_line (
    id text,
    order_id text,
    code text,
    discount text,
    discount_tax text,
    PRIMARY KEY (id),
    FOREIGN KEY (order_id) REFERENCES orders(id)
);

CREATE TABLE orders (
    id text,
    customer_id text,
    billing_address_1 text,
    billing_address_2 text,
    billing_city text,
    billing_company text,
    billing_country text,
    billing_email text,
    billing_first_name text,
    billing_last_name text,
    billing_phone text,
    billing_postcode text,
    billing_state text,
    cart_hash text,
    cart_tax text,
    created_via text,
    currency text,
    customer_ip_address text,
    customer_note text,
    customer_user_agent text,
    date_completed text,
    date_completed_gmt text,
    date_created text,
    date_created_gmt text,
    date_modified text,
    date_modified_gmt text,
    date_paid text,
    date_paid_gmt text,
    discount_tax text,
    discount_total text,
    number text,
    order_key text,
    parent_id text,
    payment_method text,
    payment_method_title text,
    prices_include_tax text,
    shipping_address_1 text,
    shipping_address_2 text,
    shipping_city text,
    shipping_company text,
    shipping_country text,
    shipping_first_name text,
    shipping_last_name text,
    shipping_postcode text,
    shipping_state text,
    shipping_tax text,
    shipping_total text,
    "status" text,
    total text,
    total_tax text,
    transaction_id text,
    version text,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE continent_country_state (
    code text,
    continent_country_code text,
    "name" text,
    PRIMARY KEY (code),
    FOREIGN KEY (continent_country_code) REFERENCES continent_country(code)
);

CREATE TABLE continent_country (
    code text,
    continent_code text,
    currency_code text,
    currency_pos text,
    decimal_sep text,
    dimension_unit text,
    "name" text,
    num_decimals text,
    thousand_sep text,
    weight_unit text,
    PRIMARY KEY (code),
    FOREIGN KEY (continent_code) REFERENCES continent(code)
);

CREATE TABLE continent (
    code text,
    "name" text,
    PRIMARY KEY (code)
);

CREATE TABLE customer_metadata (
    "index" text,
    customer_id text,
    id text,
    "key" text,
    "value" jsonb,
    PRIMARY KEY ("index", customer_id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE customer (
    id text,
    avatar_url text,
    billing_address_1 text,
    billing_address_2 text,
    billing_city text,
    billing_company text,
    billing_country text,
    billing_email text,
    billing_first_name text,
    billing_last_name text,
    billing_phone text,
    billing_postcode text,
    billing_state text,
    date_created text,
    date_created_gmt text,
    date_modified text,
    date_modified_gmt text,
    email text,
    first_name text,
    is_paying_customer text,
    last_name text,
    "role" text,
    shipping_address_1 text,
    shipping_address_2 text,
    shipping_city text,
    shipping_company text,
    shipping_country text,
    shipping_first_name text,
    shipping_last_name text,
    shipping_postcode text,
    shipping_state text,
    username text,
    PRIMARY KEY (id)
);

CREATE TABLE product_shipping_class (
    id text,
    count text,
    description text,
    "name" text,
    slug text,
    PRIMARY KEY (id)
);

CREATE TABLE payment_gateway_method_support (
    method_support text,
    payment_gateway_id text,
    PRIMARY KEY (method_support, payment_gateway_id),
    FOREIGN KEY (payment_gateway_id) REFERENCES payment_gateway(id)
);

CREATE TABLE payment_gateway_setting (
    id text,
    payment_gateway_id text,
    custom_option jsonb,
    defaults text,
    description text,
    label text,
    placeholder text,
    tip text,
    "type" text,
    "value" text,
    PRIMARY KEY (id, payment_gateway_id),
    FOREIGN KEY (payment_gateway_id) REFERENCES payment_gateway(id)
);

CREATE TABLE payment_gateway (
    id text,
    connection_url text,
    description text,
    enabled text,
    method_description text,
    method_title text,
    needs_setup text,
    orders text,
    post_install_scripts jsonb,
    required_settings_keys jsonb,
    settings_url text,
    setup_help_text text,
    title text,
    PRIMARY KEY (id)
);

CREATE TABLE refund_metadata (
    "index" text,
    refund_id text,
    id text,
    "key" text,
    "value" jsonb,
    PRIMARY KEY ("index", refund_id),
    FOREIGN KEY (refund_id) REFERENCES refund(id)
);

CREATE TABLE refund_line_item_tax (
    id text,
    refund_id text,
    refund_line_item_id text,
    refund_total text,
    subtotal text,
    total text,
    PRIMARY KEY (id, refund_id, refund_line_item_id),
    FOREIGN KEY (refund_id) REFERENCES refund_line_item(refund_id),
    FOREIGN KEY (refund_line_item_id) REFERENCES refund_line_item(id)
);

CREATE TABLE refund_line_item (
    id text,
    refund_id text,
    product_id text,
    variation_id text,
    "name" text,
    price text,
    quantity text,
    sku text,
    subtotal text,
    subtotal_tax text,
    tax_class text,
    total text,
    total_tax text,
    PRIMARY KEY (id, refund_id),
    FOREIGN KEY (refund_id) REFERENCES refund(id),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (variation_id) REFERENCES product_variation(id)
);

CREATE TABLE refund (
    id text,
    order_id text,
    amount text,
    api_refund text,
    date_created text,
    date_created_gmt text,
    reason text,
    refunded_by text,
    refunded_payment text,
    PRIMARY KEY (id),
    FOREIGN KEY (order_id) REFERENCES orders(id)
);

CREATE TABLE attribute (
    id text,
    has_archives text,
    "name" text,
    order_by text,
    slug text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE order_note (
    id text,
    order_id text,
    added_by_user text,
    author text,
    customer_note text,
    date_created text,
    date_created_gmt text,
    note text,
    PRIMARY KEY (id),
    FOREIGN KEY (order_id) REFERENCES orders(id)
);

CREATE TABLE shipping_zone_method_setting (
    id text,
    instance_id text,
    defaults text,
    description text,
    label text,
    options text,
    placeholder text,
    tip text,
    "type" text,
    "value" text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id, instance_id),
    FOREIGN KEY (instance_id) REFERENCES shipping_zone_method(instance_id)
);

CREATE TABLE shipping_zone_method (
    instance_id text,
    method_id text,
    shipping_zone_id text,
    enabled text,
    method_description text,
    method_title text,
    orders text,
    title text,
    PRIMARY KEY (instance_id),
    FOREIGN KEY (method_id) REFERENCES shipping_method(id),
    FOREIGN KEY (shipping_zone_id) REFERENCES shipping_zone(id)
);

CREATE TABLE tags (
    id text,
    count text,
    description text,
    "name" text,
    slug text,
    PRIMARY KEY (id)
);

CREATE TABLE category (
    id text,
    count text,
    description text,
    display text,
    image_alt text,
    image_date_created text,
    image_date_created_gmt text,
    image_date_modified text,
    image_date_modified_gmt text,
    image_id text,
    image_name text,
    image_src text,
    menu_order text,
    "name" text,
    parent text,
    slug text,
    PRIMARY KEY (id)
);

CREATE TABLE currency (
    code text,
    "name" text,
    symbol text,
    PRIMARY KEY (code)
);

CREATE TABLE report (
    slug text,
    description text,
    PRIMARY KEY (slug)
);

CREATE TABLE product_variation_attribute (
    id text,
    product_variation_id text,
    "name" text,
    "option" text,
    PRIMARY KEY (id),
    FOREIGN KEY (product_variation_id) REFERENCES product_variation(id)
);

CREATE TABLE product_variation_metadata (
    "index" text,
    product_variation_id text,
    id text,
    "key" text,
    "value" jsonb,
    PRIMARY KEY ("index", product_variation_id),
    FOREIGN KEY (product_variation_id) REFERENCES product_variation(id)
);

CREATE TABLE product_variation_download (
    id text,
    product_variation_id text,
    file text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (product_variation_id) REFERENCES product_variation(id)
);

CREATE TABLE product_variation (
    id text,
    product_id text,
    shipping_class_id text,
    backordered text,
    backorders text,
    backorders_allowed text,
    date_created text,
    date_created_gmt text,
    date_modified text,
    date_modified_gmt text,
    date_on_sale_from text,
    date_on_sale_from_gmt text,
    date_on_sale_to text,
    date_on_sale_to_gmt text,
    description text,
    dimension_height text,
    dimension_length text,
    dimension_width text,
    download_expiry text,
    download_limit text,
    downloadable text,
    image_alt text,
    image_date_created text,
    image_date_created_gmt text,
    image_date_modified text,
    image_date_modified_gmt text,
    image_id text,
    image_name text,
    image_src text,
    manage_stock text,
    menu_order text,
    on_sale text,
    permalink text,
    price text,
    purchasable text,
    regular_price text,
    sale_price text,
    shipping_class text,
    sku text,
    "status" text,
    stock_quantity text,
    stock_status text,
    tax_class text,
    tax_status text,
    virtual text,
    weight text,
    PRIMARY KEY (id),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (shipping_class_id) REFERENCES product_shipping_class(id)
);

CREATE TABLE shipping_method (
    id text,
    description text,
    title text,
    PRIMARY KEY (id)
);

CREATE TABLE coupon_metadata (
    "index" text,
    coupon_id text,
    id text,
    "key" text,
    "value" jsonb,
    PRIMARY KEY ("index", coupon_id),
    FOREIGN KEY (coupon_id) REFERENCES coupon(id)
);

CREATE TABLE coupon (
    id text,
    amount text,
    code text,
    date_created text,
    date_created_gmt text,
    date_expires text,
    date_expires_gmt text,
    date_modified text,
    date_modified_gmt text,
    description text,
    discount_type text,
    email_restrictions jsonb,
    exclude_sale_items text,
    excluded_product_categories jsonb,
    excluded_product_ids jsonb,
    free_shipping text,
    individual_use text,
    limit_usage_to_x_items text,
    maximum_amount text,
    minimum_amount text,
    product_categories jsonb,
    product_ids jsonb,
    usage_count text,
    usage_limit text,
    usage_limit_per_user text,
    used_by jsonb,
    PRIMARY KEY (id)
);

CREATE TABLE tax_rate_postcode (
    postcode text,
    tax_rate_id text,
    PRIMARY KEY (postcode, tax_rate_id),
    FOREIGN KEY (tax_rate_id) REFERENCES tax_rate(id)
);

CREATE TABLE tax_rate_city (
    city text,
    tax_rate_id text,
    PRIMARY KEY (city, tax_rate_id),
    FOREIGN KEY (tax_rate_id) REFERENCES tax_rate(id)
);

CREATE TABLE tax_rate (
    id text,
    class text,
    city text,
    compound text,
    country text,
    "name" text,
    orders text,
    postcode text,
    priority text,
    rate text,
    shipping text,
    "state" text,
    PRIMARY KEY (id),
    FOREIGN KEY (class) REFERENCES tax_class(slug)
);

CREATE TABLE shipping_zone (
    id text,
    "name" text,
    orders text,
    PRIMARY KEY (id)
);
