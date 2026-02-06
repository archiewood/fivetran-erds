-- Custom Fields
-- Custom Fields are supported for tables in Salesforce Commerce and will be available as c_*  in the tables.

CREATE TABLE category (
    catalog_id text,
    id text,
    parent_category_id text,
    creation_date timestamp,
    last_modified timestamp,
    online boolean,
    "position" integer,
    PRIMARY KEY (catalog_id, id),
    FOREIGN KEY (id) REFERENCES catalog(id),
    FOREIGN KEY (parent_category_id) REFERENCES category(catalog_id)
);

CREATE TABLE custom_object_attribute_definition (
    id text,
    creation_date timestamp,
    description jsonb,
    display_name jsonb,
    effective_id text,
    externally_defined boolean,
    externally_managed boolean,
    field_height integer,
    field_length integer,
    "key" boolean,
    last_modified timestamp,
    link text,
    localizable boolean,
    mandatory boolean,
    max_value double precision,
    min_length integer,
    min_value double precision,
    multi_value_type boolean,
    object_type text,
    order_required boolean,
    queryable boolean,
    read_only boolean,
    regular_expression text,
    requires_encoding boolean,
    scale integer,
    searchable boolean,
    set_value_type boolean,
    site_specific boolean,
    system boolean,
    unit jsonb,
    value_type text,
    visible boolean,
    -- default_value_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE customer (
    id text,
    birthday text,
    company_name text,
    creation_date timestamp,
    credentials_enabled boolean,
    credentials_locked boolean,
    credentials_login text,
    credentials_password_question text,
    customer_no text,
    email text,
    fax text,
    first_name text,
    gender integer,
    job_title text,
    last_login_time timestamp,
    last_modified timestamp,
    last_name text,
    last_visit_time timestamp,
    phone_business text,
    phone_home text,
    phone_mobile text,
    preferred_locale text,
    previous_login_time timestamp,
    previous_visit_time timestamp,
    primary_address_address_1 text,
    primary_address_address_2 text,
    primary_address_city text,
    primary_address_company_name text,
    primary_address_country_code text,
    primary_address_creation_date timestamp,
    primary_address_etag text,
    primary_address_first_name text,
    primary_address_full_name text,
    primary_address_id text,
    primary_address_job_title text,
    primary_address_last_modified timestamp,
    primary_address_last_name text,
    primary_address_phone text,
    primary_address_post_box text,
    primary_address_postal_code text,
    primary_address_salutation text,
    primary_address_second_name text,
    primary_address_state_code text,
    primary_address_suffix text,
    primary_address_suite text,
    primary_address_title text,
    salutation text,
    second_name text,
    suffix text,
    title text,
    PRIMARY KEY (id)
);

CREATE TABLE order_payment_instrument (
    order_id text,
    payment_instrument_id text,
    authorization_status integer,
    authorization_status_code text,
    authorization_status_message text,
    masked_gift_certificate_code text,
    payment_transaction_amount double precision,
    payment_transaction_id text,
    PRIMARY KEY (order_id, payment_instrument_id),
    FOREIGN KEY (order_id) REFERENCES orders_history(last_modified),
    FOREIGN KEY (payment_instrument_id) REFERENCES payment_instrument(payment_instrument_id)
);

CREATE TABLE order_billing_address (
    order_id text,
    address_1 text,
    city text,
    country_code text,
    first_name text,
    full_name text,
    last_name text,
    phone text,
    postal_code text,
    state_code text,
    PRIMARY KEY (order_id),
    FOREIGN KEY (order_id) REFERENCES orders_history(last_modified)
);

CREATE TABLE promotion_ab_test (
    "status" text,
    ab_test_id text,
    promotion_id text,
    PRIMARY KEY ("status", ab_test_id, promotion_id),
    FOREIGN KEY (ab_test_id) REFERENCES ab_test(id),
    FOREIGN KEY (promotion_id) REFERENCES promotion(id)
);

CREATE TABLE order_shipment_address (
    order_id text,
    shipment_id text,
    address_1 text,
    city text,
    country_code text,
    first_name text,
    full_name text,
    last_name text,
    phone text,
    postal_code text,
    state_code text,
    PRIMARY KEY (order_id, shipment_id),
    FOREIGN KEY (order_id) REFERENCES orders_history(last_modified),
    FOREIGN KEY (shipment_id) REFERENCES order_shipment(shipment_id)
);

CREATE TABLE custom_object_attribute_group (
    id text,
    attribute_definitions_count integer,
    creation_date timestamp,
    description jsonb,
    display_name jsonb,
    internal boolean,
    last_modified timestamp,
    link text,
    object_type text,
    "position" double precision,
    PRIMARY KEY (id)
);

CREATE TABLE inventory_list (
    id text,
    assigned_sites jsonb,
    creation_date timestamp,
    default_in_stock boolean,
    description text,
    last_modified timestamp,
    on_order_inventory_enabled boolean,
    use_bundle_inventory_only boolean,
    PRIMARY KEY (id)
);

CREATE TABLE campaign_promotion (
    "status" text,
    campaign_id text,
    promotion_id text,
    PRIMARY KEY ("status", campaign_id, promotion_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (promotion_id) REFERENCES promotion(id)
);

-- Product Table Additional Fields
-- localized_tax_class_id_
-- name_
-- online_flag_
-- page_description_
-- page_keywords_
-- page_title_
-- searchable_
-- valid_from_
-- valid_to_*
CREATE TABLE product (
    id text,
    master_id text,
    owning_catalog_id text,
    primary_category_id text,
    brand text,
    classification_category_catalog_id text,
    classification_category_category_id text,
    creation_date timestamp,
    default_variant_id text,
    ean text,
    last_modified timestamp,
    long_description_default_markup text,
    long_description_default_source text,
    manufacturer_name text,
    manufacturer_sku text,
    price double precision,
    price_currency text,
    price_per_unit double precision,
    short_description_default_markup text,
    short_description_default_source text,
    tax_class_id text,
    unit text,
    unit_measure text,
    unit_quantity double precision,
    upc text,
    -- type_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (master_id) REFERENCES product(id),
    FOREIGN KEY (owning_catalog_id) REFERENCES catalog(id),
    FOREIGN KEY (primary_category_id) REFERENCES primary_category(product_id)
);

CREATE TABLE assigned_category (
    catalog_id text,
    category_id text,
    product_id text,
    PRIMARY KEY (catalog_id, category_id, product_id),
    FOREIGN KEY (catalog_id) REFERENCES catalog(id),
    FOREIGN KEY (category_id) REFERENCES category(catalog_id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

-- Item_Id
-- The value of item_id will be either order->OrderNo, product_item->item_id, shipping_item->item_id depending on from which level the price Adjustment data is fetched.
-- Price_Adjustment_Type
-- The value of price_adjustment_type will be either ORDER,PRODUCT_ITEM or SHIPPING_ITEM depending on from which level the price Adjustment data is fetched.
CREATE TABLE price_adjustment (
    item_id text,
    price_adjustment_id text,
    campaign_id text,
    order_id text,
    promotion_id text,
    ab_test_segment_segment_id text,
    ab_test_segment_test_id text,
    base_price double precision,
    coupon_code text,
    created_by text,
    creation_date timestamp,
    custom boolean,
    gross_price double precision,
    item_text text,
    last_modified timestamp,
    manual boolean,
    net_price double precision,
    price_adjustment_type text,
    reason_code text,
    tax double precision,
    tax_basis double precision,
    -- applied_discount_* (dynamic column),
    PRIMARY KEY (item_id, price_adjustment_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (order_id) REFERENCES orders_history(last_modified),
    FOREIGN KEY (promotion_id) REFERENCES promotion(id)
);

CREATE TABLE gift_certificate (
    id text,
    order_id text,
    amount_currency_mnemonic text,
    amount_value double precision,
    balance_currency_mnemonic text,
    balance_value double precision,
    creation_date timestamp,
    description text,
    enabled boolean,
    last_modified timestamp,
    masked_gift_certificate_code text,
    message text,
    recipient_email text,
    recipient_name text,
    sender_name text,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (order_id) REFERENCES orders_history(last_modified)
);

CREATE TABLE coupon_redemption (
    coupon_id text,
    order_id text,
    code text,
    creation_date timestamp,
    customer_email text,
    PRIMARY KEY (coupon_id, order_id),
    FOREIGN KEY (coupon_id) REFERENCES coupon(id),
    FOREIGN KEY (order_id) REFERENCES orders_history(last_modified)
);

CREATE TABLE product_variant (
    master_product_id text,
    product_id text,
    PRIMARY KEY (master_product_id, product_id)
);

CREATE TABLE order_product_item (
    item_id text,
    order_id text,
    product_id text,
    shipment_id text,
    shipping_item_id text,
    adjusted_tax double precision,
    base_price double precision,
    bonus_product_line_item boolean,
    gift boolean,
    gross_price double precision,
    item_text text,
    net_price double precision,
    "position" double precision,
    price_after_item_discount double precision,
    price_after_order_discount double precision,
    product_name text,
    quantity double precision,
    tax double precision,
    tax_basis double precision,
    tax_rate double precision,
    PRIMARY KEY (item_id, order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders_history(last_modified),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (shipment_id) REFERENCES order_shipment(shipment_id),
    FOREIGN KEY (shipping_item_id) REFERENCES order_shipping_item(item_id)
);

CREATE TABLE ab_test (
    id text,
    description text,
    enabled boolean,
    schedule_end_date timestamp,
    schedule_start_date timestamp,
    segment_description text,
    segment_id text,
    PRIMARY KEY (id)
);

CREATE TABLE promotion_tag (
    id text,
    promotion_id text,
    PRIMARY KEY (id, promotion_id),
    FOREIGN KEY (promotion_id) REFERENCES promotion(id)
);

CREATE TABLE inventory_list_record (
    "index" integer,
    inventory_list_id text,
    product_id text,
    allocation_amount double precision,
    allocation_reset_date timestamp,
    ats double precision,
    creation_date timestamp,
    in_stock_date timestamp,
    inventory_turnover double precision,
    last_modified timestamp,
    perpetual_flag boolean,
    pre_order_back_order_allocation double precision,
    pre_order_back_order_handling text,
    product_name text,
    quantity_on_order double precision,
    stock_level double precision,
    PRIMARY KEY ("index", inventory_list_id),
    FOREIGN KEY (inventory_list_id) REFERENCES inventory_list(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE campaign_coupon (
    campaign_id text,
    coupon_id text,
    PRIMARY KEY (campaign_id, coupon_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (coupon_id) REFERENCES coupon(id)
);

CREATE TABLE shared_product_option_value (
    id text,
    product_option_id text,
    link text,
    option_prices jsonb,
    sku_extension text,
    "value" jsonb,
    PRIMARY KEY (id, product_option_id),
    FOREIGN KEY (product_option_id) REFERENCES shared_product_option(catalog_id)
);

CREATE TABLE order_shipment (
    shipment_id text,
    shipment_no text,
    order_id text,
    adjusted_merchandize_total_tax double precision,
    adjusted_shipping_total_tax double precision,
    gift boolean,
    merchandize_total_tax double precision,
    product_sub_total double precision,
    product_total double precision,
    shipment_total double precision,
    shipping_method_id text,
    shipping_status text,
    shipping_total double precision,
    shipping_total_tax double precision,
    tax_total double precision,
    PRIMARY KEY (shipment_id, shipment_no, order_id),
    FOREIGN KEY (order_id) REFERENCES orders_history(last_modified)
);

CREATE TABLE shared_product_option (
    id text,
    catalog_id text,
    custom_name jsonb,
    default_product_option_value text,
    description jsonb,
    link text,
    "name" text,
    selected_option_value text,
    shared boolean,
    sorting_mode text,
    -- image_* (dynamic column),
    PRIMARY KEY (id, catalog_id),
    FOREIGN KEY (catalog_id) REFERENCES catalog(id)
);

CREATE TABLE customer_group (
    id text,
    creation_date timestamp,
    description text,
    last_modified timestamp,
    link text,
    rule_description text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE orders_history (
    id text,
    last_modified timestamp,
    customer_id text,
    adjusted_merchandize_total_tax double precision,
    adjusted_shipping_total_tax double precision,
    cancel_code text,
    confirmation_status text,
    created_by text,
    creation_date timestamp,
    currency text,
    customer_is_guest boolean,
    export_status text,
    invoice_no text,
    merchandize_total_tax double precision,
    order_total double precision,
    payment_status text,
    place_date timestamp,
    product_sub_total double precision,
    product_total double precision,
    remote_host text,
    shipping_status text,
    shipping_total double precision,
    shipping_total_tax double precision,
    site_id text,
    "status" text,
    tax_total double precision,
    taxation text,
    PRIMARY KEY (id, last_modified),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE campaign (
    id text,
    coupons jsonb,
    creation_date timestamp,
    description text,
    enabled boolean,
    end_date timestamp,
    last_modified timestamp,
    site_id text,
    start_date timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE campaign_customer_group (
    campaign_id text,
    customer_group_id text,
    PRIMARY KEY (campaign_id, customer_group_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (customer_group_id) REFERENCES customer_group(id)
);

CREATE TABLE assignment (
    campaign_id text,
    promotion_id text,
    rank integer,
    schedule_end_date timestamp,
    schedule_start_date timestamp,
    PRIMARY KEY (campaign_id, promotion_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (promotion_id) REFERENCES promotion(id)
);

CREATE TABLE customer_address (
    "index" bigint,
    customer_no text,
    address_1 text,
    address_2 text,
    city text,
    company_name text,
    country_code text,
    creation_date timestamp,
    etag text,
    first_name text,
    full_name text,
    id text,
    job_title text,
    last_modified timestamp,
    last_name text,
    phone text,
    post_box text,
    postal_code text,
    salutation text,
    second_name text,
    state_code text,
    suffix text,
    suite text,
    title text,
    PRIMARY KEY ("index", customer_no),
    FOREIGN KEY (customer_no) REFERENCES customer(customer_no)
);

CREATE TABLE source_code_group (
    id text,
    active boolean,
    active_indirect_location_type text,
    cookie_duration integer,
    creation_date timestamp,
    description text,
    enabled boolean,
    end_time timestamp,
    inactive_redirect_location_type text,
    last_modified timestamp,
    start_time timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE catalog (
    id text,
    assigned_product_count integer,
    category_count integer,
    creation_date timestamp,
    last_modified timestamp,
    online boolean,
    owned_product_count integer,
    recommendation_count integer,
    root_category text,
    PRIMARY KEY (id)
);

CREATE TABLE store (
    id text,
    address_1 text,
    address_2 text,
    city text,
    country_code text,
    creation_date timestamp,
    email text,
    fax text,
    inventory_id text,
    last_modified timestamp,
    latitude text,
    longitude text,
    "name" text,
    phone text,
    pos_enabled boolean,
    postal_code text,
    state_code text,
    store_locator_enabled text,
    PRIMARY KEY (id)
);

CREATE TABLE primary_category (
    catalog_id text,
    category_id text,
    product_id text,
    PRIMARY KEY (catalog_id, category_id, product_id),
    FOREIGN KEY (catalog_id) REFERENCES catalog(id),
    FOREIGN KEY (category_id) REFERENCES category(catalog_id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE promotion (
    id text,
    archived boolean,
    creation_date timestamp,
    currency_code text,
    disable_globally_excluded boolean,
    enabled boolean,
    exclusivity text,
    last_modified timestamp,
    promotion_class text,
    site_id text,
    PRIMARY KEY (id)
);

CREATE TABLE order_shipping_item (
    item_id text,
    shipment_id text,
    adjusted_tax double precision,
    base_price double precision,
    gross_price double precision,
    item_text text,
    net_price double precision,
    order_id text,
    price_after_item_discount double precision,
    tax double precision,
    tax_basis double precision,
    tax_rate double precision,
    "type" text,
    PRIMARY KEY (item_id, shipment_id),
    FOREIGN KEY (shipment_id) REFERENCES order_shipment(shipment_id)
);

CREATE TABLE campaign_source_code_group (
    campaign_id text,
    source_code_group_id text,
    PRIMARY KEY (campaign_id, source_code_group_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (source_code_group_id) REFERENCES source_code_group(id)
);

CREATE TABLE custom_object (
    key_property text,
    key_value text,
    object_type text,
    creation_date timestamp,
    last_modified timestamp,
    PRIMARY KEY (key_property, key_value, object_type)
);

CREATE TABLE payment_instrument (
    payment_instrument_id text,
    bank_routing_number text,
    payment_method text,
    -- payment_card* (dynamic column),
    PRIMARY KEY (payment_instrument_id)
);

CREATE TABLE gift_certificate_transaction (
    "index" integer,
    gift_certificate_id text,
    order_id text,
    amount_currency_mnemonic text,
    amount_value double precision,
    "timestamp" timestamp,
    type_code text,
    PRIMARY KEY ("index", gift_certificate_id),
    FOREIGN KEY (gift_certificate_id) REFERENCES gift_certificate(id),
    FOREIGN KEY (order_id) REFERENCES orders_history(last_modified)
);

CREATE TABLE coupon (
    id text,
    creation_date timestamp,
    description text,
    enabled boolean,
    exported_code_count integer,
    last_modified timestamp,
    redemption_count integer,
    redemption_limits_per_code integer,
    redemption_limits_per_customer integer,
    single_code text,
    system_codes_config_code_prefix text,
    system_codes_config_number_of_codes integer,
    total_codes_count integer,
    "type" text,
    PRIMARY KEY (id)
);
