CREATE TABLE one_time_add_on (
    id text,
    subscription_id text,
    variant_id text,
    quantity text,
    PRIMARY KEY (id, subscription_id),
    FOREIGN KEY (subscription_id) REFERENCES subscription(id),
    FOREIGN KEY (variant_id) REFERENCES product_variant(id)
);

CREATE TABLE subscription_gift (
    id text,
    subscription_id text,
    created_at text,
    email text,
    gift_to text,
    is_opened text,
    is_prepaid text,
    message text,
    number_of_deliveries text,
    updated_at text,
    PRIMARY KEY (id, subscription_id),
    FOREIGN KEY (subscription_id) REFERENCES subscription(id)
);

CREATE TABLE subscription_recipient (
    id text,
    subscription_id text,
    PRIMARY KEY (id, subscription_id),
    FOREIGN KEY (id) REFERENCES subscriber(id),
    FOREIGN KEY (subscription_id) REFERENCES subscription(id)
);

CREATE TABLE subscription_custom_attribute (
    "key" text,
    subscription_id text,
    "value" text,
    PRIMARY KEY ("key", subscription_id),
    FOREIGN KEY (subscription_id) REFERENCES subscription(id)
);

CREATE TABLE subscription (
    id text,
    subscriber_id text,
    billing_address_1 text,
    billing_address_2 text,
    billing_cadence_count text,
    billing_cadence_unit text,
    billing_city text,
    billing_country text,
    billing_first_name text,
    billing_last_name text,
    billing_province text,
    billing_zip text,
    cancel_date text,
    cancel_reason text,
    created_at text,
    currency_code text,
    delivery_address_1 text,
    delivery_address_2 text,
    delivery_cadence_count text,
    delivery_cadence_unit text,
    delivery_city text,
    delivery_company text,
    delivery_country text,
    delivery_first_name text,
    delivery_last_name text,
    delivery_phone text,
    delivery_price text,
    delivery_province text,
    delivery_shipping_option text,
    delivery_zip text,
    external_id text,
    friendly_id text,
    is_prepaid text,
    next_billing_date text,
    next_delivery_date text,
    payment_method_brand text,
    payment_method_email text,
    payment_method_expiry_month text,
    payment_method_expiry_year text,
    payment_method_external_id text,
    payment_method_last_4_digit text,
    payment_method_name text,
    payment_method_type text,
    purchase_date text,
    "status" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (subscriber_id) REFERENCES subscriber(id)
);

CREATE TABLE billing_attempt (
    id text,
    order_id text,
    subscription_id text,
    created_at text,
    error_code text,
    error_msg text,
    external_id text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (subscription_id) REFERENCES subscription(id)
);

CREATE TABLE subscription_discount_code (
    id text,
    subscription_id text,
    code text,
    created_at text,
    discount_code_external_id text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (subscription_id) REFERENCES subscription(id)
);

CREATE TABLE subscription_line (
    id text,
    subscription_id text,
    subscription_offer_option_id text,
    variant_id text,
    created_at text,
    current_price text,
    custom_attribute text,
    external_id text,
    quantity text,
    selling_plan_id text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (subscription_id) REFERENCES subscription(id),
    FOREIGN KEY (subscription_offer_option_id) REFERENCES product_subscription_offer_option(id),
    FOREIGN KEY (variant_id) REFERENCES product_variant(id)
);

CREATE TABLE base_order_line_item (
    id text,
    base_order_id text,
    variant_id text,
    created_at text,
    current_price text,
    is_add_on_one_time text,
    quantity text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (base_order_id) REFERENCES base_order(id),
    FOREIGN KEY (variant_id) REFERENCES product_variant(id)
);

CREATE TABLE entry_point_visibility (
    "index" text,
    swap_and_add_on_option_id text,
    entry_point_visibility text,
    PRIMARY KEY ("index", swap_and_add_on_option_id),
    FOREIGN KEY (swap_and_add_on_option_id) REFERENCES swap_and_add_on_option(id)
);

CREATE TABLE variant_entry_point_visibility (
    variant_external_id text,
    swap_and_add_on_option_id text,
    entry_point_visibility jsonb,
    PRIMARY KEY (variant_external_id, swap_and_add_on_option_id),
    FOREIGN KEY (swap_and_add_on_option_id) REFERENCES swap_and_add_on_option(id)
);

CREATE TABLE swap_and_add_on_option (
    id text,
    product_id text,
    subscription_offer_id text,
    created_at text,
    one_time_add_on_discount text,
    one_time_add_on_discount_modifier_type text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (subscription_offer_id) REFERENCES product_subscription_offer(id)
);

CREATE TABLE product_variant (
    id text,
    product_id text,
    current_price text,
    external_id text,
    sku text,
    variant_title text,
    PRIMARY KEY (id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE product_subscription_offer (
    id text,
    created_at text,
    description text,
    external_id text,
    "name" text,
    "status" text,
    "type" text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE product_subscription_offer_option (
    id text,
    product_subscription_offer_id text,
    archived text,
    billing_cadence_count text,
    billing_cadence_unit text,
    created_at text,
    delivery_cadence_count text,
    delivery_cadence_unit text,
    discount text,
    discount_modifier text,
    external_id text,
    "name" text,
    "type" text,
    updated_at text,
    PRIMARY KEY (id, product_subscription_offer_id),
    FOREIGN KEY (product_subscription_offer_id) REFERENCES product_subscription_offer(id)
);

CREATE TABLE product (
    id text,
    subscription_offer_id text,
    created_at text,
    description text,
    external_id text,
    image_url text,
    product_title text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (subscription_offer_id) REFERENCES product_subscription_offer(id)
);

CREATE TABLE orders (
    id text,
    base_order_id text,
    subscriber_id text,
    charged_amount text,
    created_at text,
    currency_code text,
    delivery_amount text,
    external_id text,
    is_skipped text,
    purchase_date text,
    scheduled_date text,
    "status" text,
    subscription_charged_amount text,
    tax text,
    "type" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (base_order_id) REFERENCES base_order(id),
    FOREIGN KEY (subscriber_id) REFERENCES subscriber(id)
);

CREATE TABLE order_line_item (
    id text,
    order_id text,
    subscription_id text,
    variant_id text,
    created_at text,
    discount_allocation_total_amount text,
    external_id text,
    price_total text,
    price_total_discounted text,
    price_total_tax_with_discounts text,
    product_title text,
    quantity text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (subscription_id) REFERENCES subscription(id),
    FOREIGN KEY (variant_id) REFERENCES product_variant(id)
);

CREATE TABLE base_order (
    id text,
    subscription_contract_id text,
    created_at text,
    currency_code text,
    is_skipped text,
    scheduled_date text,
    sequence_number text,
    "status" text,
    "type" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (subscription_contract_id) REFERENCES subscription(id)
);

CREATE TABLE subscriber (
    id text,
    created_at text,
    email text,
    external_id text,
    first_name text,
    last_name text,
    phone text,
    phone_country_code text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE subscription_activity (
    id text,
    subscription_id text,
    created_at text,
    description text,
    event_timestamp text,
    "type" text,
    updated_at text,
    users text,
    PRIMARY KEY (id),
    FOREIGN KEY (subscription_id) REFERENCES subscription(id)
);
