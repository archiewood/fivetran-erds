CREATE TABLE order_delivery_tracking_code (
    tracking_code text,
    order_delivery_id text,
    PRIMARY KEY (tracking_code, order_delivery_id),
    FOREIGN KEY (order_delivery_id) REFERENCES order_delivery(id)
);

CREATE TABLE order_delivery_calculated_tax (
    _fivetran_id text,
    order_delivery_id text,
    extensions jsonb,
    price text,
    tax text,
    tax_rate text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (order_delivery_id) REFERENCES order_delivery(id)
);

CREATE TABLE order_delivery_tax_rule (
    _fivetran_id text,
    order_delivery_id text,
    extensions jsonb,
    percentage text,
    tax_rate text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (order_delivery_id) REFERENCES order_delivery(id)
);

CREATE TABLE order_delivery_custom_field (
    "name" text,
    order_delivery_id text,
    "value" text,
    PRIMARY KEY ("name", order_delivery_id),
    FOREIGN KEY (order_delivery_id) REFERENCES order_delivery(id)
);

CREATE TABLE order_delivery_translated_custom_field (
    "name" text,
    order_delivery_id text,
    "value" text,
    PRIMARY KEY ("name", order_delivery_id),
    FOREIGN KEY (order_delivery_id) REFERENCES order_delivery(id)
);

CREATE TABLE order_delivery (
    id text,
    order_id text,
    shipping_method_id text,
    shipping_order_address_id text,
    api_alias text,
    created_at text,
    shipping_costs_extensions jsonb,
    shipping_costs_list_price text,
    shipping_costs_quantity text,
    shipping_costs_reference_price text,
    shipping_costs_regulation_price text,
    shipping_costs_total_price text,
    shipping_costs_unit_price text,
    shipping_date_ear_liest text,
    shipping_date_latest text,
    shipping_order_address_version_id text,
    state_id text,
    updated_at text,
    version_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (shipping_method_id) REFERENCES shipping_method(id),
    FOREIGN KEY (shipping_order_address_id) REFERENCES order_address(id)
);

CREATE TABLE delivery_time_custom_field (
    "name" text,
    delivery_time_id text,
    "value" text,
    PRIMARY KEY ("name", delivery_time_id),
    FOREIGN KEY (delivery_time_id) REFERENCES delivery_time(id)
);

CREATE TABLE delivery_time_translated_custom_field (
    "name" text,
    delivery_time_id text,
    "value" text,
    PRIMARY KEY ("name", delivery_time_id),
    FOREIGN KEY (delivery_time_id) REFERENCES delivery_time(id)
);

CREATE TABLE delivery_time (
    id text,
    api_alias text,
    created_at text,
    maximum text,
    minimum text,
    "name" text,
    unit text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE property_group_custom_field (
    "name" text,
    property_group_id text,
    "value" text,
    PRIMARY KEY ("name", property_group_id),
    FOREIGN KEY (property_group_id) REFERENCES property_group(id)
);

CREATE TABLE property_group_translated_custom_field (
    "name" text,
    property_group_id text,
    "value" text,
    PRIMARY KEY ("name", property_group_id),
    FOREIGN KEY (property_group_id) REFERENCES property_group(id)
);

CREATE TABLE property_group (
    id text,
    api_alias text,
    created_at text,
    description text,
    display_type text,
    filterable text,
    "name" text,
    "position" text,
    sorting_type text,
    translated_description text,
    translated_name text,
    translated_position text,
    updated_at text,
    visible_on_product_detail_page text,
    PRIMARY KEY (id)
);

CREATE TABLE order_line_item_property (
    property_id text,
    order_line_item_id text,
    PRIMARY KEY (property_id, order_line_item_id),
    FOREIGN KEY (order_line_item_id) REFERENCES order_line_item(id)
);

CREATE TABLE order_line_item_option (
    option_id text,
    order_line_item_id text,
    PRIMARY KEY (option_id, order_line_item_id),
    FOREIGN KEY (order_line_item_id) REFERENCES order_line_item(id)
);

CREATE TABLE order_line_item_stream (
    stream_id text,
    order_line_item_id text,
    PRIMARY KEY (stream_id, order_line_item_id),
    FOREIGN KEY (order_line_item_id) REFERENCES order_line_item(id)
);

CREATE TABLE order_line_item_tag (
    tag_id text,
    object_id text,
    PRIMARY KEY (tag_id, object_id),
    FOREIGN KEY (object_id) REFERENCES order_line_item(id)
);

CREATE TABLE order_line_item_category (
    category_id text,
    order_line_item_id text,
    PRIMARY KEY (category_id, order_line_item_id),
    FOREIGN KEY (order_line_item_id) REFERENCES order_line_item(id)
);

CREATE TABLE order_line_item_payload_option_custom_field (
    "name" text,
    order_line_item_payload_option_index text,
    order_line_item_payload_option_order_line_item_id text,
    "value" text,
    PRIMARY KEY ("name", order_line_item_payload_option_index, order_line_item_payload_option_order_line_item_id),
    FOREIGN KEY (order_line_item_payload_option_index) REFERENCES order_line_item_payload_option("index"),
    FOREIGN KEY (order_line_item_payload_option_order_line_item_id) REFERENCES order_line_item_payload_option(order_line_item_id)
);

CREATE TABLE order_line_item_payload_option (
    "index" text,
    order_line_item_id text,
    groups text,
    "option" text,
    PRIMARY KEY ("index", order_line_item_id),
    FOREIGN KEY (order_line_item_id) REFERENCES order_line_item(id)
);

CREATE TABLE order_line_item_calculated_tax (
    _fivetran_id text,
    order_line_item_id text,
    extensions jsonb,
    price text,
    tax text,
    tax_rate text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (order_line_item_id) REFERENCES order_line_item(id)
);

CREATE TABLE order_line_item_tax_rule (
    _fivetran_id text,
    order_line_item_id text,
    extensions jsonb,
    percentage text,
    tax_rate text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (order_line_item_id) REFERENCES order_line_item(id)
);

CREATE TABLE order_line_item_custom_field (
    "name" text,
    order_line_item_id text,
    "value" text,
    PRIMARY KEY ("name", order_line_item_id),
    FOREIGN KEY (order_line_item_id) REFERENCES order_line_item(id)
);

CREATE TABLE order_line_item (
    id text,
    order_id text,
    parent_id text,
    payload_tax_id text,
    product_id text,
    promotion_id text,
    api_alias text,
    cover_id text,
    created_at text,
    description text,
    good text,
    identifier text,
    label text,
    parent_version_id text,
    payload_created_at text,
    payload_custom_field text,
    payload_features jsonb,
    payload_is_close_out text,
    payload_is_new text,
    payload_manufacturer_id text,
    payload_mark_as_top_seller text,
    payload_parent_id text,
    payload_product_number text,
    payload_purchase_prices text,
    payload_releasedate text,
    payload_stock text,
    "position" text,
    price_definition_extensions jsonb,
    price_definition_is_calculated text,
    price_definition_list_price text,
    price_definition_price text,
    price_definition_quantity text,
    price_definition_reference_price_definition text,
    price_definition_regulation_price text,
    price_definition_type text,
    price_extensions jsonb,
    price_list_price text,
    price_quantity text,
    price_reference_price text,
    price_regulation_price text,
    price_total_price text,
    price_unit_price text,
    product_version_id text,
    quantity text,
    referenced_id text,
    removable text,
    stackable text,
    total_price text,
    "type" text,
    unit_price text,
    updated_at text,
    version_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (parent_id) REFERENCES order_line_item(id),
    FOREIGN KEY (payload_tax_id) REFERENCES tax(id),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (promotion_id) REFERENCES promotion(id)
);

CREATE TABLE customer_tag (
    tag_id text,
    customer_id text,
    PRIMARY KEY (tag_id, customer_id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE customer_vat (
    vat_id text,
    customer_id text,
    PRIMARY KEY (vat_id, customer_id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE customer_custom_field (
    "name" text,
    customer_id text,
    "value" text,
    PRIMARY KEY ("name", customer_id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE customer (
    id text,
    default_billing_address_id text,
    default_payment_method_id text,
    default_shipping_address_id text,
    group_id text,
    language_id text,
    sales_channel_id text,
    active text,
    affiliate_code text,
    api_alias text,
    auto_increment text,
    birthday text,
    bound_sales_channel_id text,
    campaign_code text,
    company text,
    created_at text,
    created_by_id text,
    customer_number text,
    double_opt_in_confirm_date text,
    double_opt_in_email_sent_date text,
    double_opt_in_registration text,
    email text,
    first_login text,
    first_name text,
    guest text,
    hash text,
    last_login text,
    last_name text,
    last_order_date text,
    last_payment_method_id text,
    news_letter text,
    order_count text,
    order_total_amount text,
    remote_address text,
    requested_group_id text,
    salutation_id text,
    title text,
    updated_at text,
    updated_by_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (default_billing_address_id) REFERENCES customer_address(id),
    FOREIGN KEY (default_payment_method_id) REFERENCES payment_method(id),
    FOREIGN KEY (default_shipping_address_id) REFERENCES customer_address(id),
    FOREIGN KEY (group_id) REFERENCES customer_group(id),
    FOREIGN KEY (language_id) REFERENCES languages(id),
    FOREIGN KEY (sales_channel_id) REFERENCES sales_channel(id)
);

CREATE TABLE promotion_discount (
    id text,
    promotion_id text,
    api_alias text,
    applier_key text,
    consider_advanced_rules text,
    created_at text,
    maximum_value text,
    picker_key text,
    scope text,
    sorter_key text,
    "type" text,
    updated_at text,
    usage_key text,
    "value" text,
    PRIMARY KEY (id),
    FOREIGN KEY (promotion_id) REFERENCES promotion(id)
);

CREATE TABLE order_transaction_calculated_tax (
    _fivetran_id text,
    order_transaction_id text,
    extensions jsonb,
    price text,
    tax text,
    tax_rate text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (order_transaction_id) REFERENCES order_transaction(id)
);

CREATE TABLE order_transaction_tax_rule (
    _fivetran_id text,
    order_transaction_id text,
    extensions jsonb,
    percentage text,
    tax_rate text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (order_transaction_id) REFERENCES order_transaction(id)
);

CREATE TABLE order_transaction_custom_field (
    "name" text,
    order_transaction_id text,
    "value" text,
    PRIMARY KEY ("name", order_transaction_id),
    FOREIGN KEY (order_transaction_id) REFERENCES order_transaction(id)
);

CREATE TABLE order_transaction (
    id text,
    order_id text,
    payment_method_id text,
    shipping_method_id text,
    state_id text,
    amount_list_price text,
    amount_quantity text,
    amount_reference_price text,
    amount_regulation_price text,
    amount_total_price text,
    amount_unit_extensions jsonb,
    amount_unit_price text,
    api_alias text,
    created_at text,
    updated_at text,
    version_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (payment_method_id) REFERENCES payment_method(id),
    FOREIGN KEY (shipping_method_id) REFERENCES shipping_method(id),
    FOREIGN KEY (state_id) REFERENCES state_machine_state(id)
);

CREATE TABLE payment_method_custom_field (
    "name" text,
    payment_method_id text,
    "value" text,
    PRIMARY KEY ("name", payment_method_id),
    FOREIGN KEY (payment_method_id) REFERENCES payment_method(id)
);

CREATE TABLE payment_method_translated_custom_field (
    "name" text,
    payment_method_id text,
    "value" text,
    PRIMARY KEY ("name", payment_method_id),
    FOREIGN KEY (payment_method_id) REFERENCES payment_method(id)
);

CREATE TABLE payment_method (
    id text,
    availability_rule_id text,
    media_id text,
    active text,
    after_order_enabled text,
    api_alias text,
    asynchronous text,
    created_at text,
    description text,
    distinguishable_name text,
    formatted_handler_identifier text,
    handler_identifier text,
    "name" text,
    plugin_id text,
    "position" text,
    prepared text,
    refundable text,
    synchronous text,
    translated_description text,
    translated_distinguishable_name text,
    translated_name text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (availability_rule_id) REFERENCES rule(id),
    FOREIGN KEY (media_id) REFERENCES media(id)
);

CREATE TABLE user_custom_field (
    "name" text,
    users_id text,
    "value" text,
    PRIMARY KEY ("name", users_id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    active text,
    "admin" text,
    api_alias text,
    avatar_id text,
    created_at text,
    email text,
    first_name text,
    last_name text,
    last_updated_password_at text,
    locale_id text,
    timezone text,
    title text,
    updated_at text,
    username text,
    PRIMARY KEY (id)
);

CREATE TABLE order_customer_vat (
    vat_id text,
    order_customer_id text,
    PRIMARY KEY (vat_id, order_customer_id),
    FOREIGN KEY (order_customer_id) REFERENCES order_customer(id)
);

CREATE TABLE order_customer_custom_field (
    "name" text,
    order_customer_id text,
    "value" text,
    PRIMARY KEY ("name", order_customer_id),
    FOREIGN KEY (order_customer_id) REFERENCES order_customer(id)
);

CREATE TABLE order_customer (
    id text,
    customer_id text,
    order_id text,
    api_alias text,
    company text,
    created_at text,
    customer_number text,
    email text,
    first_name text,
    last_name text,
    remote_address text,
    salutation_id text,
    title text,
    updated_at text,
    version_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (order_id) REFERENCES orders(id)
);

CREATE TABLE customer_address_custom_field (
    "name" text,
    customer_address_id text,
    "value" text,
    PRIMARY KEY ("name", customer_address_id),
    FOREIGN KEY (customer_address_id) REFERENCES customer_address(id)
);

CREATE TABLE customer_address (
    id text,
    customer_id text,
    additional_address_line_1 text,
    additional_address_line_2 text,
    api_alias text,
    city text,
    company text,
    country_id text,
    country_state_id text,
    created_at text,
    department text,
    first_name text,
    last_name text,
    phone_number text,
    salutation_id text,
    street text,
    title text,
    updated_at text,
    zip_code text,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE analytics (
    id text,
    active text,
    anonymize_ip text,
    api_alias text,
    created_at text,
    track_orders text,
    tracking_id text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE sales_channel_payment_method (
    payment_method_id text,
    sales_channel_id text,
    PRIMARY KEY (payment_method_id, sales_channel_id),
    FOREIGN KEY (payment_method_id) REFERENCES payment_method(id),
    FOREIGN KEY (sales_channel_id) REFERENCES sales_channel(id)
);

CREATE TABLE promotion_sales_channel_custom_field (
    "name" text,
    sales_channel_id text,
    "value" text,
    PRIMARY KEY ("name", sales_channel_id),
    FOREIGN KEY (sales_channel_id) REFERENCES sales_channel(id)
);

CREATE TABLE promotion_sales_channel_translated_custom_field (
    "name" text,
    sales_channel_id text,
    "value" text,
    PRIMARY KEY ("name", sales_channel_id),
    FOREIGN KEY (sales_channel_id) REFERENCES sales_channel(id)
);

CREATE TABLE sales_channel (
    id text,
    analytics_id text,
    country_id text,
    currency_id text,
    customer_group_id text,
    footer_category_id text,
    language_id text,
    navigation_category_id text,
    payment_method_id text,
    service_category_id text,
    shipping_method_id text,
    access_key text,
    active text,
    api_alias text,
    configuration text,
    created_at text,
    footer_category_version_id text,
    home_cms_page_id text,
    home_cms_page_version_id text,
    home_enabled text,
    home_keywords text,
    home_meta_description text,
    home_meta_title text,
    home_name text,
    home_slot_config text,
    hreflang_active text,
    hreflang_default_domain_id text,
    mail_header_footer_id text,
    maintenance text,
    maintenance_ip_white_list text,
    "name" text,
    navigation_category_depth text,
    navigation_category_version_id text,
    service_category_version_id text,
    short_name text,
    tax_calculation_type text,
    translated_home_enabled text,
    translated_home_keywords text,
    translated_home_meta_description text,
    translated_home_meta_title text,
    translated_home_name text,
    translated_home_slot_config text,
    translated_name text,
    type_id text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (analytics_id) REFERENCES analytics(id),
    FOREIGN KEY (country_id) REFERENCES country(id),
    FOREIGN KEY (currency_id) REFERENCES currency(id),
    FOREIGN KEY (customer_group_id) REFERENCES customer_group(id),
    FOREIGN KEY (footer_category_id) REFERENCES category(id),
    FOREIGN KEY (language_id) REFERENCES languages(id),
    FOREIGN KEY (navigation_category_id) REFERENCES category(id),
    FOREIGN KEY (payment_method_id) REFERENCES payment_method(id),
    FOREIGN KEY (service_category_id) REFERENCES category(id),
    FOREIGN KEY (shipping_method_id) REFERENCES shipping_method(id)
);

CREATE TABLE category_breadcrumb (
    breadcrumb text,
    category_id text,
    PRIMARY KEY (breadcrumb, category_id),
    FOREIGN KEY (category_id) REFERENCES category(id)
);

CREATE TABLE category_custom_field (
    "name" text,
    category_id text,
    "value" text,
    PRIMARY KEY ("name", category_id),
    FOREIGN KEY (category_id) REFERENCES category(id)
);

CREATE TABLE category (
    id text,
    after_category_id text,
    media_id text,
    parent_id text,
    active text,
    after_category_version_id text,
    api_alias text,
    auto_increment text,
    child_count text,
    cms_page_id text,
    cms_page_version_id text,
    created_at text,
    description text,
    display_nested_products text,
    external_link text,
    internal_link text,
    keywords text,
    "level" text,
    link_new_tab text,
    link_type text,
    meta_description text,
    meta_title text,
    "name" text,
    parent_version_id text,
    "path" text,
    product_assignment_type text,
    product_stream_id text,
    slot_config jsonb,
    translated_description text,
    translated_external_link text,
    translated_internal_link text,
    translated_keywords text,
    translated_link_new_tab text,
    translated_link_type text,
    translated_meta_description text,
    translated_meta_title text,
    translated_name text,
    translated_slot_config jsonb,
    "type" text,
    updated_at text,
    version_id text,
    visible text,
    PRIMARY KEY (id),
    FOREIGN KEY (after_category_id) REFERENCES category(id),
    FOREIGN KEY (media_id) REFERENCES media(id),
    FOREIGN KEY (parent_id) REFERENCES category(id)
);

CREATE TABLE language_custom_field (
    "name" text,
    languages_id text,
    "value" text,
    PRIMARY KEY ("name", languages_id),
    FOREIGN KEY (languages_id) REFERENCES languages(id)
);

CREATE TABLE languages (
    id text,
    parent_id text,
    api_alias text,
    created_at text,
    locale_id text,
    "name" text,
    translation_code_id text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (parent_id) REFERENCES languages(id)
);

CREATE TABLE manufacturer_custom_field (
    "name" text,
    manufacturer_id text,
    "value" text,
    PRIMARY KEY ("name", manufacturer_id),
    FOREIGN KEY (manufacturer_id) REFERENCES manufacturer(id)
);

CREATE TABLE manufacturer_transalated_custom_field (
    "name" text,
    manufacturer_id text,
    "value" text,
    PRIMARY KEY ("name", manufacturer_id),
    FOREIGN KEY (manufacturer_id) REFERENCES manufacturer(id)
);

CREATE TABLE manufacturer (
    id text,
    media_id text,
    apia_lias text,
    created_at text,
    description text,
    link text,
    "name" text,
    translated_description text,
    translated_name text,
    updated_at text,
    version_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (media_id) REFERENCES media(id)
);

CREATE TABLE shipping_method_custom_field (
    "name" text,
    shipping_method_id text,
    "value" text,
    PRIMARY KEY ("name", shipping_method_id),
    FOREIGN KEY (shipping_method_id) REFERENCES shipping_method(id)
);

CREATE TABLE shipping_method_translated_custom_field (
    "name" text,
    shipping_method_id text,
    "value" text,
    PRIMARY KEY ("name", shipping_method_id),
    FOREIGN KEY (shipping_method_id) REFERENCES shipping_method(id)
);

CREATE TABLE shipping_method (
    id text,
    availability_rule_id text,
    delivery_time_id text,
    media_id text,
    tax_id text,
    active text,
    api_alias text,
    created_at text,
    description text,
    "name" text,
    "position" text,
    tax_type text,
    tracking_url text,
    translated_description text,
    translated_name text,
    translated_trackingurl text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (availability_rule_id) REFERENCES rule(id),
    FOREIGN KEY (delivery_time_id) REFERENCES delivery_time(id),
    FOREIGN KEY (media_id) REFERENCES media(id),
    FOREIGN KEY (tax_id) REFERENCES tax(id)
);

CREATE TABLE order_address_custom_field (
    "name" text,
    order_address_id text,
    "value" text,
    PRIMARY KEY ("name", order_address_id),
    FOREIGN KEY (order_address_id) REFERENCES order_address(id)
);

CREATE TABLE order_address (
    id text,
    order_id text,
    additional_address_line_1 text,
    additional_address_line_2 text,
    api_alias text,
    city text,
    company text,
    country_id text,
    country_state_id text,
    created_at text,
    department text,
    first_name text,
    last_name text,
    phone_number text,
    salutation_id text,
    street text,
    title text,
    updated_at text,
    vat_id text,
    version_id text,
    zip_code text,
    PRIMARY KEY (id),
    FOREIGN KEY (order_id) REFERENCES orders(id)
);

CREATE TABLE tax_custom_field (
    "name" text,
    tax_id text,
    "value" text,
    PRIMARY KEY ("name", tax_id),
    FOREIGN KEY (tax_id) REFERENCES tax(id)
);

CREATE TABLE tax (
    id text,
    api_alias text,
    created_at text,
    "name" text,
    "position" text,
    tax_rate text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE country_custom_field (
    "name" text,
    country_id text,
    "value" text,
    PRIMARY KEY ("name", country_id),
    FOREIGN KEY (country_id) REFERENCES country(id)
);

CREATE TABLE country_translated_custom_field (
    "name" text,
    country_id text,
    "value" text,
    PRIMARY KEY ("name", country_id),
    FOREIGN KEY (country_id) REFERENCES country(id)
);

CREATE TABLE country (
    id text,
    company_tax_currency_id text,
    customer_tax_currency_id text,
    active text,
    advanced_postal_code_pattern text,
    api_alias text,
    check_advanced_postal_code_pattern text,
    check_postal_code_pattern text,
    check_vatid_pattern text,
    company_tax_amount text,
    company_tax_enabled text,
    company_tax_extensions jsonb,
    company_tax_free text,
    created_at text,
    customer_tax_amount text,
    customer_tax_enabled text,
    customer_tax_extensions jsonb,
    default_postal_code_pattern text,
    display_state_in_registration text,
    force_state_in_registration text,
    iso text,
    iso_3 text,
    "name" text,
    "position" text,
    postal_code_required text,
    shippingavailable text,
    tax_free text,
    translated_name text,
    updated_at text,
    vat_id_pattern text,
    vat_id_required text,
    PRIMARY KEY (id),
    FOREIGN KEY (company_tax_currency_id) REFERENCES currency(id),
    FOREIGN KEY (customer_tax_currency_id) REFERENCES currency(id)
);

CREATE TABLE product_property (
    property_id text,
    product_id text,
    PRIMARY KEY (property_id, product_id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE product_option (
    option_id text,
    product_id text,
    PRIMARY KEY (option_id, product_id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE product_stream (
    stream_id text,
    product_id text,
    PRIMARY KEY (stream_id, product_id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE product_tag (
    tag_id text,
    product_id text,
    PRIMARY KEY (tag_id, product_id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE product_category (
    category_id text,
    product_id text,
    PRIMARY KEY (category_id, product_id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE product_attribute_price (
    "index" text,
    product_id text,
    currency_id text,
    extensions jsonb,
    gross text,
    linked text,
    list_price text,
    net text,
    percentage text,
    regulation_price text,
    PRIMARY KEY ("index", product_id),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (currency_id) REFERENCES currency(id)
);

CREATE TABLE product_attribute_cheapest_price (
    "index" text,
    product_id text,
    currency_id text,
    extensions jsonb,
    gross text,
    linked text,
    list_price text,
    net text,
    percentage text,
    regulation_price text,
    PRIMARY KEY ("index", product_id),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (currency_id) REFERENCES currency(id)
);

CREATE TABLE product_custom_field (
    "name" text,
    product_id text,
    "value" text,
    PRIMARY KEY ("name", product_id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE product_translated_custom_field (
    "name" text,
    product_id text,
    "value" text,
    PRIMARY KEY ("name", product_id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE product (
    id text,
    delivery_time_id text,
    manufacturer_id text,
    parent_id text,
    tax_id text,
    active text,
    api_alias text,
    auto_increment text,
    available text,
    available_stock text,
    canonical_product_id text,
    category_tree text,
    cheapest_price_extensions jsonb,
    cheapest_price_hasrange text,
    cheapest_price_parentid text,
    cheapest_price_purchase text,
    cheapest_price_reference text,
    cheapest_price_rule_id text,
    cheapest_price_unit_id text,
    cheapest_price_variant_id text,
    child_count text,
    cms_page_id text,
    cms_page_version_id text,
    configurator_group_config text,
    cover_id text,
    created_at text,
    custom_field_set_selection_active text,
    custom_search_keywords text,
    description text,
    display_group text,
    display_parent text,
    ean text,
    feature_set_id text,
    height text,
    is_closeout text,
    keywords text,
    length text,
    main_variant_id text,
    manufacturer_number text,
    mark_as_to_pseller text,
    maximum_purchase text,
    meta_description text,
    meta_title text,
    minimum_purchase text,
    "name" text,
    pack_unit text,
    pack_unit_plural text,
    parent_version_id text,
    product_manufacturer_version_id text,
    product_media_version_id text,
    product_number text,
    purchase_prices text,
    purchase_steps text,
    purchase_unit text,
    rating_average text,
    reference_unit text,
    release_date text,
    restock_time text,
    sales text,
    shipping_free text,
    slot_config text,
    stock text,
    translated_custom_search_keywords text,
    translated_description text,
    translated_keywords text,
    translated_meta_description text,
    translated_metatitle text,
    translated_name text,
    translated_pack_unit text,
    translated_pack_unit_plural text,
    translated_slot_config text,
    unit_id text,
    updated_at text,
    variant_listing_config text,
    variant_restrictions text,
    version_id text,
    weight text,
    width text,
    PRIMARY KEY (id),
    FOREIGN KEY (delivery_time_id) REFERENCES delivery_time(id),
    FOREIGN KEY (manufacturer_id) REFERENCES manufacturer(id),
    FOREIGN KEY (parent_id) REFERENCES product(id),
    FOREIGN KEY (tax_id) REFERENCES tax(id)
);

CREATE TABLE order_calculated_tax (
    _fivetran_id text,
    order_id text,
    extensions jsonb,
    price text,
    tax text,
    tax_rate text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (order_id) REFERENCES orders(id)
);

CREATE TABLE order_tax_rule (
    _fivetran_id text,
    order_id text,
    extensions jsonb,
    percentage text,
    tax_rate text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (order_id) REFERENCES orders(id)
);

CREATE TABLE order_rule (
    order_id text,
    rule_id text,
    PRIMARY KEY (order_id, rule_id),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (rule_id) REFERENCES rule(id)
);

CREATE TABLE order_custom_field (
    "name" text,
    orders_id text,
    "value" text,
    PRIMARY KEY ("name", orders_id),
    FOREIGN KEY (orders_id) REFERENCES orders(id)
);

CREATE TABLE orders (
    id text,
    billing_address_id text,
    currency_id text,
    language_id text,
    order_customer_id text,
    sales_channel_id text,
    state_id text,
    affiliate_code text,
    amount_net text,
    amount_total text,
    api_alias text,
    auto_increment text,
    billing_address_version_id text,
    campaign_code text,
    created_at text,
    created_by_id text,
    currency_factor text,
    customer_comment text,
    deep_link_code text,
    item_rounding_decimals text,
    item_rounding_extension jsonb,
    item_rounding_interval text,
    item_rounding_roundfor_net text,
    order_date text,
    order_date_time text,
    order_number text,
    position_price text,
    price_extensions jsonb,
    price_net_price text,
    price_position_price text,
    price_raw_total text,
    price_tax_status text,
    price_total_price text,
    shipping_costs_list_price text,
    shipping_costs_quantity text,
    shipping_costs_reference_price text,
    shipping_costs_regulation_price text,
    shipping_costs_total_price text,
    shipping_costs_unit_price text,
    shipping_total text,
    tax_status text,
    total_rounding_decimals text,
    total_rounding_extensions jsonb,
    total_rounding_interval text,
    total_rounding_roundfornet text,
    updated_at text,
    updated_by_id text,
    version_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (billing_address_id) REFERENCES customer_address(id),
    FOREIGN KEY (currency_id) REFERENCES currency(id),
    FOREIGN KEY (language_id) REFERENCES languages(id),
    FOREIGN KEY (order_customer_id) REFERENCES order_customer(id),
    FOREIGN KEY (sales_channel_id) REFERENCES sales_channel(id),
    FOREIGN KEY (state_id) REFERENCES state_machine_state(id)
);

CREATE TABLE media_flag (
    flag text,
    media_id text,
    PRIMARY KEY (flag, media_id),
    FOREIGN KEY (media_id) REFERENCES media(id)
);

CREATE TABLE media_custom_field (
    "name" text,
    media_id text,
    "value" text,
    PRIMARY KEY ("name", media_id),
    FOREIGN KEY (media_id) REFERENCES media(id)
);

CREATE TABLE media_metadata (
    "name" text,
    media_id text,
    "value" text,
    PRIMARY KEY ("name", media_id),
    FOREIGN KEY (media_id) REFERENCES media(id)
);

CREATE TABLE media_translated_custom_field (
    "name" text,
    media_id text,
    "value" text,
    PRIMARY KEY ("name", media_id),
    FOREIGN KEY (media_id) REFERENCES media(id)
);

CREATE TABLE media (
    id text,
    media_folder_id text,
    user_id text,
    alt text,
    api_alias text,
    created_at text,
    file_extension text,
    file_name text,
    file_size text,
    has_file text,
    media_type_extensions jsonb,
    media_type_name text,
    mime_type text,
    private text,
    title text,
    translated_alt text,
    translated_title text,
    updated_at text,
    uploaded_at text,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (media_folder_id) REFERENCES media_folder(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE state_machine_state_custom_field (
    "name" text,
    state_machine_state_id text,
    "value" text,
    PRIMARY KEY ("name", state_machine_state_id),
    FOREIGN KEY (state_machine_state_id) REFERENCES state_machine_state(id)
);

CREATE TABLE state_machine_state_translated_custom_field (
    "name" text,
    state_machine_state_id text,
    "value" text,
    PRIMARY KEY ("name", state_machine_state_id),
    FOREIGN KEY (state_machine_state_id) REFERENCES state_machine_state(id)
);

CREATE TABLE state_machine_state (
    id text,
    state_machine_id text,
    api_alias text,
    created_at text,
    "name" text,
    technical_name text,
    translated_name text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (state_machine_id) REFERENCES state_machine(id)
);

CREATE TABLE customer_group_custom_field (
    "name" text,
    customer_group_id text,
    "value" text,
    PRIMARY KEY ("name", customer_group_id),
    FOREIGN KEY (customer_group_id) REFERENCES customer_group(id)
);

CREATE TABLE customer_group_translated_custom_field (
    "name" text,
    customer_group_id text,
    "value" text,
    PRIMARY KEY ("name", customer_group_id),
    FOREIGN KEY (customer_group_id) REFERENCES customer_group(id)
);

CREATE TABLE customer_group (
    id text,
    api_alias text,
    created_at text,
    display_gross text,
    "name" text,
    registration_active text,
    registration_introduction text,
    registration_only_company_registration text,
    registration_seo_meta_description text,
    registration_title text,
    translated_name text,
    translated_registration_only_company_registration text,
    translated_registration_seo_meta_description text,
    translated_registration_title text,
    translated_registrationin_troduction text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE state_machine_custom_field (
    "name" text,
    state_machine_id text,
    "value" text,
    PRIMARY KEY ("name", state_machine_id),
    FOREIGN KEY (state_machine_id) REFERENCES state_machine(id)
);

CREATE TABLE state_machine_translated_custom_field (
    "name" text,
    state_machine_id text,
    "value" text,
    PRIMARY KEY ("name", state_machine_id),
    FOREIGN KEY (state_machine_id) REFERENCES state_machine(id)
);

CREATE TABLE state_machine (
    id text,
    initial_state_id text,
    api_alias text,
    created_at text,
    "name" text,
    technical_name text,
    translated_name text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (initial_state_id) REFERENCES state_machine_state(id)
);

CREATE TABLE product_media_custom_field (
    "name" text,
    product_media_id text,
    "value" text,
    PRIMARY KEY ("name", product_media_id),
    FOREIGN KEY (product_media_id) REFERENCES product_media(id)
);

CREATE TABLE product_media (
    id text,
    media_id text,
    product_id text,
    api_alias text,
    created_at text,
    "position" text,
    product_version_id text,
    updated_at text,
    version_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (media_id) REFERENCES media(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE rule_custom_field (
    "name" text,
    rule_id text,
    "value" text,
    PRIMARY KEY ("name", rule_id),
    FOREIGN KEY (rule_id) REFERENCES rule(id)
);

CREATE TABLE rule (
    id text,
    api_alias text,
    created_at text,
    description text,
    invalid text,
    module_types text,
    "name" text,
    priority text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE currency_custom_field (
    "name" text,
    currency_id text,
    "value" text,
    PRIMARY KEY ("name", currency_id),
    FOREIGN KEY (currency_id) REFERENCES currency(id)
);

CREATE TABLE currency_translated_custom_field (
    "name" text,
    currency_id text,
    "value" text,
    PRIMARY KEY ("name", currency_id),
    FOREIGN KEY (currency_id) REFERENCES currency(id)
);

CREATE TABLE currency (
    id text,
    api_alias text,
    created_at text,
    factor text,
    is_system_default text,
    iso_code text,
    item_rounding_decimals text,
    item_rounding_extensions jsonb,
    item_rounding_interval text,
    item_rounding_roundfornet text,
    "name" text,
    "position" text,
    short_name text,
    symbol text,
    tax_free_from text,
    total_rounding_decimals text,
    total_rounding_extensions jsonb,
    total_rounding_interval text,
    total_rounding_roundfornet text,
    translated_name text,
    translated_short_name text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE media_folder_custom_field (
    "name" text,
    media_folder_id text,
    "value" text,
    PRIMARY KEY ("name", media_folder_id),
    FOREIGN KEY (media_folder_id) REFERENCES media_folder(id)
);

CREATE TABLE media_folder (
    id text,
    parent_id text,
    api_alias text,
    child_count text,
    configuration_id text,
    created_at text,
    default_folder_id text,
    "name" text,
    "path" text,
    updated_at text,
    use_parent_configuration text,
    PRIMARY KEY (id),
    FOREIGN KEY (parent_id) REFERENCES media_folder(id)
);

CREATE TABLE promotion_sales_channel (
    id text,
    promotion_id text,
    sales_channel_id text,
    api_alias text,
    created_at text,
    priority text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (promotion_id) REFERENCES promotion(id),
    FOREIGN KEY (sales_channel_id) REFERENCES sales_channel(id)
);

CREATE TABLE promotion_exclusion (
    exclusion_id text,
    promotion_id text,
    PRIMARY KEY (exclusion_id, promotion_id),
    FOREIGN KEY (promotion_id) REFERENCES promotion(id)
);

CREATE TABLE promotion_custom_field (
    "name" text,
    promotion_id text,
    "value" text,
    PRIMARY KEY ("name", promotion_id),
    FOREIGN KEY (promotion_id) REFERENCES promotion(id)
);

CREATE TABLE promotion_translated_custom_field (
    "name" text,
    promotion_id text,
    "value" text,
    PRIMARY KEY ("name", promotion_id),
    FOREIGN KEY (promotion_id) REFERENCES promotion(id)
);

CREATE TABLE promotion_order_per_customer (
    order_per_customer text,
    promotion_id text,
    count text,
    PRIMARY KEY (order_per_customer, promotion_id),
    FOREIGN KEY (promotion_id) REFERENCES promotion(id)
);

CREATE TABLE promotion (
    id text,
    product_id text,
    active text,
    api_alias text,
    code text,
    created_at text,
    customer_restriction text,
    exclusive text,
    individual_code_pattern text,
    maximum_redemptions_global text,
    maximum_redemptions_per_customer text,
    "name" text,
    order_count text,
    prevent_combination text,
    priority text,
    translated_name text,
    updated_at text,
    use_codes text,
    use_individual_codes text,
    use_set_groups text,
    valid_from text,
    valid_until text,
    PRIMARY KEY (id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);
