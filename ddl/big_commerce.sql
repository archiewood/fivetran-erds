CREATE TABLE consignment_line_item (
    id text,
    consignment_id text,
    PRIMARY KEY (id, consignment_id),
    FOREIGN KEY (consignment_id) REFERENCES consignment(id)
);

CREATE TABLE consignment_discount (
    id text,
    consignment_id text,
    PRIMARY KEY (id, consignment_id),
    FOREIGN KEY (consignment_id) REFERENCES consignment(id)
);

CREATE TABLE consignment_coupon_discount (
    code text,
    consignment_id text,
    amount double precision,
    PRIMARY KEY (code, consignment_id),
    FOREIGN KEY (consignment_id) REFERENCES consignment(id)
);

CREATE TABLE consignment_shipping_option (
    id text,
    consignment_id text,
    cost double precision,
    description text,
    image_url text,
    is_recommended boolean,
    transit_time text,
    "type" text,
    PRIMARY KEY (id, consignment_id),
    FOREIGN KEY (consignment_id) REFERENCES consignment(id)
);

CREATE TABLE consignment_billing_address_custom_field (
    field_id text,
    consignment_id text,
    field_value text,
    PRIMARY KEY (field_id, consignment_id),
    FOREIGN KEY (consignment_id) REFERENCES consignment(id)
);

CREATE TABLE consignment (
    id text,
    checkout_id text,
    address_1 text,
    address_2 text,
    city text,
    company text,
    country text,
    country_code text,
    email text,
    first_name text,
    handling_cost double precision,
    last_name text,
    phone text,
    postal_code text,
    selected_shipping_option_cost double precision,
    selected_shipping_option_description text,
    selected_shipping_option_id text,
    selected_shipping_option_image_url text,
    selected_shipping_option_transit_time text,
    selected_shipping_option_type text,
    shipping_cost double precision,
    state_or_province text,
    state_or_province_code text,
    PRIMARY KEY (id, checkout_id),
    FOREIGN KEY (checkout_id) REFERENCES checkout(id)
);

CREATE TABLE checkout_billing_address_custom_field (
    field_id text,
    checkout_id text,
    field_value text,
    PRIMARY KEY (field_id, checkout_id),
    FOREIGN KEY (checkout_id) REFERENCES checkout(id)
);

CREATE TABLE tax (
    "name" text,
    checkout_id text,
    amount double precision,
    PRIMARY KEY ("name", checkout_id),
    FOREIGN KEY (checkout_id) REFERENCES checkout(id)
);

CREATE TABLE applied_coupon (
    id text,
    checkout_id text,
    code text,
    coupon_type integer,
    discounted_amount double precision,
    display_name text,
    PRIMARY KEY (id, checkout_id),
    FOREIGN KEY (checkout_id) REFERENCES checkout(id)
);

CREATE TABLE applied_gift_certificate (
    code text,
    checkout_id text,
    balance double precision,
    purchase_date timestamp,
    remaining double precision,
    used double precision,
    PRIMARY KEY (code, checkout_id),
    FOREIGN KEY (checkout_id) REFERENCES checkout(id)
);

CREATE TABLE checkout (
    id text,
    cart_id text,
    order_id text,
    billing_address_address_1 text,
    billing_address_address_2 text,
    billing_address_city text,
    billing_address_company text,
    billing_address_country text,
    billing_address_country_code text,
    billing_address_email text,
    billing_address_first_name text,
    billing_address_id text,
    billing_address_last_name text,
    billing_address_phone text,
    billing_address_postal_code text,
    billing_address_state_or_province text,
    billing_address_state_or_province_code text,
    billing_addressaddress_1 text,
    billing_addressaddress_2 text,
    billing_addresscity text,
    billing_addresscompany text,
    billing_addresscountry text,
    billing_addresscountry_code text,
    billing_addressemail text,
    billing_addressfirst_name text,
    billing_addressid text,
    billing_addresslast_name text,
    billing_addressphone text,
    billing_addresspostal_code text,
    billing_addressstate_or_province text,
    billing_addressstate_or_province_code text,
    created_time text,
    customer_message text,
    gift_wrapping_cost_total double precision,
    grand_total double precision,
    handling_cost_total double precision,
    is_store_credit_applied boolean,
    outstanding_balance integer,
    shipping_cost_total double precision,
    sub_total double precision,
    tax_total double precision,
    updated_time text,
    PRIMARY KEY (id),
    FOREIGN KEY (cart_id) REFERENCES cart(id),
    FOREIGN KEY (order_id) REFERENCES orders(id)
);

CREATE TABLE tax_class (
    id text,
    date_created timestamp,
    date_modified timestamp,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE product_channel_assignment (
    channel_id bigint,
    product_id bigint,
    PRIMARY KEY (channel_id, product_id),
    FOREIGN KEY (channel_id) REFERENCES channel(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE price_list_bulk_pricing (
    "index" bigint,
    price_list_record_fivetran_id text,
    amount bigint,
    quantity_max bigint,
    quantity_min bigint,
    "type" text,
    PRIMARY KEY ("index", price_list_record_fivetran_id),
    FOREIGN KEY (price_list_record_fivetran_id) REFERENCES price_list_record(_fivetran_id)
);

CREATE TABLE price_list_record (
    _fivetran_id text,
    id text,
    product_id bigint,
    variant_id bigint,
    calculated_price double precision,
    currency text,
    date_created timestamp,
    date_modified timestamp,
    map_price double precision,
    price double precision,
    price_list_id bigint,
    retail_price double precision,
    sale_price double precision,
    sku text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (id) REFERENCES price_list(id),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (variant_id) REFERENCES product_variant(id)
);

CREATE TABLE store_blog_tag (
    tags text,
    post_id bigint,
    PRIMARY KEY (tags, post_id),
    FOREIGN KEY (post_id) REFERENCES store_blog_post(id)
);

CREATE TABLE store_blog_post (
    id bigint,
    author text,
    body text,
    "date" text,
    is_published boolean,
    meta_description text,
    meta_keywords text,
    preview_url text,
    published_date_iso_8601 timestamp,
    summary text,
    thumbnail_path text,
    timezone text,
    timezone_type text,
    title text,
    PRIMARY KEY (id)
);

CREATE TABLE wishlist_item (
    id bigint,
    wishlist_id bigint,
    product_id bigint,
    variant_id bigint,
    PRIMARY KEY (id, wishlist_id),
    FOREIGN KEY (wishlist_id) REFERENCES wishlist(id),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (variant_id) REFERENCES product_variant(id)
);

CREATE TABLE wishlist (
    id bigint,
    customer_id bigint,
    is_public boolean,
    "name" text,
    token text,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE contextual_filter (
    category_id bigint,
    channel_id bigint,
    enabled_filter_id text,
    PRIMARY KEY (category_id, channel_id, enabled_filter_id),
    FOREIGN KEY (category_id) REFERENCES category_tree(category_id),
    FOREIGN KEY (channel_id) REFERENCES channel(id),
    FOREIGN KEY (enabled_filter_id) REFERENCES enabled_filter(id)
);

CREATE TABLE category_setting (
    _fivetran_id text,
    category_tree_depth integer,
    default_product_sort text,
    listing_mode text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE placement (
    uuid text,
    channel_id bigint,
    widget_id text,
    date_created timestamp,
    date_modified timestamp,
    entity_id text,
    region text,
    sort_order bigint,
    "status" text,
    template_file text,
    PRIMARY KEY (uuid),
    FOREIGN KEY (channel_id) REFERENCES channel(id),
    FOREIGN KEY (widget_id) REFERENCES widget(uuid)
);

CREATE TABLE customer_setting (
    _fivetran_id text,
    ask_shopper_for_tracking_consent boolean,
    default_customer_group_id bigint,
    guest_customer_group_id bigint,
    policy_url text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE site_route (
    id bigint,
    site_id bigint,
    matching text,
    route text,
    "type" text,
    PRIMARY KEY (id, site_id),
    FOREIGN KEY (site_id) REFERENCES site(id)
);

CREATE TABLE cart_coupon (
    id text,
    cart_id text,
    code text,
    coupon_type bigint,
    discounted_amount double precision,
    PRIMARY KEY (id, cart_id),
    FOREIGN KEY (cart_id) REFERENCES cart(id)
);

CREATE TABLE cart_discount (
    id text,
    cart_id text,
    discounted_amount double precision,
    PRIMARY KEY (id, cart_id),
    FOREIGN KEY (cart_id) REFERENCES cart(id)
);

CREATE TABLE cart_custom_item (
    id text,
    cart_id text,
    extended_list_price bigint,
    list_price bigint,
    "name" text,
    quantity bigint,
    sku text,
    PRIMARY KEY (id, cart_id),
    FOREIGN KEY (cart_id) REFERENCES cart(id)
);

CREATE TABLE digital_line_item_option (
    name_id bigint,
    digital_item_id text,
    "name" text,
    "value" text,
    value_id bigint,
    PRIMARY KEY (name_id, digital_item_id),
    FOREIGN KEY (digital_item_id) REFERENCES cart_digital_item(id)
);

CREATE TABLE digital_line_item_discount (
    id bigint,
    digital_item_id text,
    discounted_amount double precision,
    PRIMARY KEY (id, digital_item_id),
    FOREIGN KEY (digital_item_id) REFERENCES cart_digital_item(id)
);

CREATE TABLE cart_digital_item (
    id text,
    cart_id text,
    product_id bigint,
    variant_id bigint,
    brand text,
    coupon_amount bigint,
    discount_amount double precision,
    extended_list_price bigint,
    extended_sale_price bigint,
    image_url text,
    is_taxable boolean,
    list_price bigint,
    "name" text,
    parent_id text,
    quantity bigint,
    sale_price bigint,
    sku text,
    url text,
    PRIMARY KEY (id, cart_id),
    FOREIGN KEY (cart_id) REFERENCES cart(id),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (variant_id) REFERENCES product_variant(id)
);

CREATE TABLE physical_line_item_option (
    name_id bigint,
    physical_item_id text,
    "name" text,
    "value" text,
    value_id bigint,
    PRIMARY KEY (name_id, physical_item_id),
    FOREIGN KEY (physical_item_id) REFERENCES cart_physical_item(id)
);

CREATE TABLE physical_line_item_discount (
    id text,
    physical_item_id text,
    discounted_amount double precision,
    PRIMARY KEY (id, physical_item_id),
    FOREIGN KEY (physical_item_id) REFERENCES cart_physical_item(id)
);

CREATE TABLE cart_physical_item (
    id text,
    cart_id text,
    product_id bigint,
    variant_id bigint,
    brand text,
    coupon_amount bigint,
    discount_amount double precision,
    extended_list_price bigint,
    extended_sale_price bigint,
    gift_wrapping_amount double precision,
    gift_wrapping_message text,
    gift_wrapping_name text,
    image_url text,
    is_shipping_required boolean,
    is_taxable boolean,
    list_price bigint,
    "name" text,
    parent_id bigint,
    quantity bigint,
    sale_price bigint,
    sku text,
    url text,
    PRIMARY KEY (id, cart_id),
    FOREIGN KEY (cart_id) REFERENCES cart(id),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (variant_id) REFERENCES product_variant(id)
);

CREATE TABLE cart_gift_certificate_item (
    id text,
    cart_id text,
    amount bigint,
    is_taxable boolean,
    message text,
    "name" text,
    recipient_email text,
    recipient_name text,
    sender_email text,
    sender_name text,
    PRIMARY KEY (id, cart_id),
    FOREIGN KEY (cart_id) REFERENCES cart(id)
);

CREATE TABLE cart (
    id text,
    channel_id bigint,
    currency_code text,
    customer_id bigint,
    base_amount double precision,
    cart_amount double precision,
    created_time timestamp,
    discount_amount double precision,
    email text,
    locale text,
    parent_id text,
    tax_included boolean,
    updated_time timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (channel_id) REFERENCES channel(id),
    FOREIGN KEY (currency_code) REFERENCES currency(currency_code),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE store_profile_setting (
    _fivetran_id text,
    store_address text,
    store_address_type text,
    store_email text,
    store_name text,
    store_phone text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE email_template_translation (
    "index" bigint,
    email_template_type_id text,
    keys jsonb,
    locale text,
    PRIMARY KEY ("index", email_template_type_id),
    FOREIGN KEY (email_template_type_id) REFERENCES email_template(type_id)
);

CREATE TABLE email_template (
    type_id text,
    body text,
    subject text,
    PRIMARY KEY (type_id)
);

CREATE TABLE category_metafield (
    id bigint,
    category_id bigint,
    date_created timestamp,
    date_modified timestamp,
    description text,
    "key" text,
    namespace text,
    permission_set text,
    resource_id bigint,
    resource_type text,
    "value" text,
    PRIMARY KEY (id, category_id),
    FOREIGN KEY (category_id) REFERENCES category_tree(category_id)
);

CREATE TABLE search_setting (
    _fivetran_id text,
    content_product_sort text,
    default_product_sort text,
    product_filtering_enabled boolean,
    search_suggest boolean,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE site_url (
    url text,
    site_id bigint,
    created_at timestamp,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (url, site_id),
    FOREIGN KEY (site_id) REFERENCES site(id)
);

CREATE TABLE site (
    id bigint,
    channel_id bigint,
    created_at timestamp,
    is_checkout_url_customized boolean,
    ssl_status text,
    updated_at timestamp,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (channel_id) REFERENCES channel(id)
);

CREATE TABLE theme_variation (
    uuid text,
    theme_id text,
    description text,
    external_id text,
    "name" text,
    PRIMARY KEY (uuid, theme_id),
    FOREIGN KEY (theme_id) REFERENCES theme(uuid)
);

CREATE TABLE theme (
    uuid text,
    is_private boolean,
    "name" text,
    PRIMARY KEY (uuid)
);

CREATE TABLE banner (
    id bigint,
    content text,
    date_created timestamp,
    date_from text,
    date_to text,
    date_type text,
    item_id text,
    location text,
    "name" text,
    page text,
    visible text,
    PRIMARY KEY (id)
);

CREATE TABLE store (
    id text,
    account_uuid text,
    address text,
    admin_email text,
    checkout_type text,
    control_panel_base_url text,
    country text,
    currency text,
    currency_symbol text,
    currency_symbol_location text,
    decimal_places integer,
    decimal_separator text,
    default_channel_id bigint,
    default_site_id bigint,
    dimension_decimal_places integer,
    dimension_decimal_token text,
    dimension_thousands_token text,
    dimension_units text,
    domain text,
    facebook_catalog_id text,
    first_name text,
    graphql_storefront_api_enabled boolean,
    industry text,
    is_price_entered_with_tax boolean,
    languages text,
    last_name text,
    logo_url text,
    multi_storefront_enabled boolean,
    "name" text,
    order_email text,
    phone text,
    plan_is_trial boolean,
    plan_level text,
    plan_name text,
    secure_url text,
    shopper_consent_tracking_enabled boolean,
    sitewidehttps_enabled boolean,
    "status" text,
    stencil_enabled boolean,
    store_id bigint,
    thousands_separator text,
    timezone_display text,
    timezone_dst_correction boolean,
    timezone_dst_offset integer,
    timezone_export text,
    timezone_extended_display text,
    timezone_name text,
    timezone_raw_offset integer,
    weight_units text,
    wishlists_enabled boolean,
    PRIMARY KEY (id)
);

CREATE TABLE shipping_zone_location (
    id bigint,
    shipping_zone_id bigint,
    country_iso_2 text,
    state_iso_2 text,
    zip text,
    PRIMARY KEY (id, shipping_zone_id),
    FOREIGN KEY (shipping_zone_id) REFERENCES shipping_zone(id)
);

CREATE TABLE shipping_zone (
    id bigint,
    enabled boolean,
    free_shipping_enabled boolean,
    free_shipping_exclude_fixed_shipping_products boolean,
    free_shipping_minimum_sub_total double precision,
    handling_fees_display_separately boolean,
    handling_fees_fixed_surcharge double precision,
    handling_fees_percentage_surcharge double precision,
    "name" text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE price_list (
    id bigint,
    active boolean,
    date_created timestamp,
    date_modified timestamp,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE security_setting (
    _fivetran_id text,
    csp_header_enabled text,
    csp_header_value boolean,
    hsts_enabled boolean,
    hsts_include_preload boolean,
    hsts_include_subdomains boolean,
    hsts_max_age text,
    x_frame_options_header_allowed_url text,
    x_frame_options_header_enabled boolean,
    x_frame_options_header_setting text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE enabled_filter (
    id text,
    collapsed_by_default boolean,
    display_name text,
    display_product_count boolean,
    is_enabled boolean,
    items_to_show integer,
    sort_by text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE country_state (
    id bigint,
    country_id bigint,
    "state" text,
    state_abbreviation text,
    PRIMARY KEY (id, country_id),
    FOREIGN KEY (country_id) REFERENCES country(id)
);

CREATE TABLE category_tree_meta_keyword (
    meta_keyword_id text,
    category_id bigint,
    PRIMARY KEY (meta_keyword_id, category_id),
    FOREIGN KEY (category_id) REFERENCES category_tree(category_id)
);

CREATE TABLE category_tree (
    category_id bigint,
    category_uuid text,
    default_product_sort text,
    description text,
    image_url text,
    is_customized boolean,
    is_visible boolean,
    layout_file text,
    meta_description text,
    "name" text,
    page_title text,
    parent_id bigint,
    "path" text,
    search_keywords text,
    sort_order bigint,
    tree_id bigint,
    views bigint,
    PRIMARY KEY (category_id)
);

CREATE TABLE price_list_assignment (
    id bigint,
    price_list_id bigint,
    channel_id bigint,
    customer_group_id bigint,
    PRIMARY KEY (id, price_list_id),
    FOREIGN KEY (price_list_id) REFERENCES price_list(id),
    FOREIGN KEY (channel_id) REFERENCES channel(id),
    FOREIGN KEY (customer_group_id) REFERENCES customer_group(id)
);

CREATE TABLE country (
    id bigint,
    country text,
    country_iso_2 text,
    country_iso_3 text,
    state_resource text,
    state_url text,
    PRIMARY KEY (id)
);

CREATE TABLE locale_setting (
    _fivetran_id text,
    default_shopper_language text,
    shopper_language_selection_method text,
    store_country text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE email_setting (
    _fivetran_id text,
    abandoned_cart_email boolean,
    account_details_changed_email boolean,
    combined_order_status_email boolean,
    create_account_email boolean,
    create_guest_account_email boolean,
    gift_certificate_email boolean,
    invoice_email boolean,
    order_message_notification_email boolean,
    product_review_email boolean,
    return_confirmation_email boolean,
    return_statuschange_email boolean,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE gift_certificate (
    id bigint,
    customer_id bigint,
    order_id bigint,
    amount double precision,
    balance double precision,
    code text,
    expiry_date timestamp,
    from_email text,
    from_name text,
    message text,
    purchase_date timestamp,
    "status" text,
    template text,
    to_email text,
    to_name text,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (order_id) REFERENCES orders(id)
);

CREATE TABLE robot_setting (
    _fivetran_id text,
    robots_txt_ssl text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE brand_metafield (
    id bigint,
    brand_id bigint,
    date_created timestamp,
    date_modified timestamp,
    description text,
    "key" text,
    namespace text,
    permission_set text,
    resource_id bigint,
    resource_type text,
    "value" text,
    PRIMARY KEY (id, brand_id),
    FOREIGN KEY (brand_id) REFERENCES brand(id)
);

CREATE TABLE brand_meta_keyword (
    meta_keyword_id text,
    brand_id bigint,
    PRIMARY KEY (meta_keyword_id, brand_id),
    FOREIGN KEY (brand_id) REFERENCES brand(id)
);

CREATE TABLE brand (
    id bigint,
    custom_url text,
    custom_url_is_customized boolean,
    image_url text,
    meta_description text,
    "name" text,
    page_title text,
    search_keywords text,
    PRIMARY KEY (id)
);

CREATE TABLE storefront_product_setting (
    _fivetran_id text,
    default_preorder_message text,
    show_add_to_cart_link boolean,
    show_add_to_cart_qty_box boolean,
    show_add_to_wishlist boolean,
    show_breadcrumbs_product_pages text,
    show_product_brand boolean,
    show_product_price boolean,
    show_product_rating boolean,
    show_product_shipping boolean,
    show_product_sku boolean,
    show_product_weight boolean,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE product_custom_information (
    product_id bigint,
    commodity_description text,
    country_of_origin text,
    hs_codes jsonb,
    international_shipping boolean,
    PRIMARY KEY (product_id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE customer_group_category_access (
    customer_group_id bigint,
    "type" text,
    category_id bigint,
    PRIMARY KEY (customer_group_id, "type", category_id),
    FOREIGN KEY (category_id) REFERENCES category_tree(category_id)
);

CREATE TABLE customer_group_discount_rule (
    "type" text,
    customer_group_id bigint,
    price_list_id bigint,
    amount text,
    method text,
    PRIMARY KEY ("type", customer_group_id),
    FOREIGN KEY (customer_group_id) REFERENCES customer_group(id),
    FOREIGN KEY (price_list_id) REFERENCES price_list(id)
);

CREATE TABLE customer_group (
    id bigint,
    is_default boolean,
    is_group_for_guests boolean,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE shipping_zone_method (
    id bigint,
    shipping_zone_id bigint,
    enabled boolean,
    fixed_surcharge bigint,
    is_fallback boolean,
    "name" text,
    settings jsonb,
    "type" text,
    PRIMARY KEY (id, shipping_zone_id),
    FOREIGN KEY (shipping_zone_id) REFERENCES shipping_zone(id)
);

CREATE TABLE status_setting (
    _fivetran_id text,
    down_for_maintenance_message text,
    prelaunch_message text,
    prelaunch_password text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE redirect (
    id bigint,
    site_id bigint,
    from_path text,
    to_entity_id bigint,
    to_type text,
    to_url text,
    PRIMARY KEY (id),
    FOREIGN KEY (site_id) REFERENCES site(id)
);

CREATE TABLE catalog_variant_option_value (
    id bigint,
    variant_id bigint,
    label text,
    option_display_name text,
    option_id bigint,
    PRIMARY KEY (id, variant_id),
    FOREIGN KEY (variant_id) REFERENCES catalog_variant(id)
);

CREATE TABLE catalog_variant (
    id bigint,
    product_id bigint,
    bin_picking_number text,
    calculated_price double precision,
    cost_price double precision,
    depth double precision,
    fixed_cost_shipping_price double precision,
    height double precision,
    inventory_level bigint,
    inventory_warning_level bigint,
    is_free_shipping boolean,
    price double precision,
    purchasing_disabled boolean,
    purchasing_disabled_message text,
    retail_price double precision,
    sale_price double precision,
    sku text,
    sku_id bigint,
    upc text,
    weight double precision,
    width double precision,
    PRIMARY KEY (id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE channel_enabled_currency (
    enabled_currency text,
    channel_id bigint,
    PRIMARY KEY (enabled_currency, channel_id),
    FOREIGN KEY (channel_id) REFERENCES channel_currency_assignment(channel_id)
);

CREATE TABLE channel_currency_assignment (
    channel_id bigint,
    default_currency text,
    PRIMARY KEY (channel_id),
    FOREIGN KEY (channel_id) REFERENCES channel(id)
);

CREATE TABLE catalog_variant_metafield (
    id bigint,
    catalog_variant_id bigint,
    date_created timestamp,
    date_modified timestamp,
    description text,
    "key" text,
    namespace text,
    owner_client_id text,
    permission_set text,
    product_id bigint,
    resource_id bigint,
    resource_type text,
    "value" text,
    PRIMARY KEY (id, catalog_variant_id),
    FOREIGN KEY (catalog_variant_id) REFERENCES catalog_variant(id)
);

CREATE TABLE order_status (
    id bigint,
    custom_label text,
    "name" text,
    order_id bigint,
    system_description text,
    system_label text,
    PRIMARY KEY (id)
);

CREATE TABLE order_refund_item (
    item_id bigint,
    item_type text,
    order_refund_id bigint,
    quantity bigint,
    reason text,
    requested_amount double precision,
    PRIMARY KEY (item_id, item_type, order_refund_id),
    FOREIGN KEY (order_refund_id) REFERENCES order_refund(id)
);

CREATE TABLE order_refund_payment (
    id bigint,
    order_refund_id bigint,
    amount double precision,
    declined_message text,
    is_declined boolean,
    offlines boolean,
    provider_id text,
    PRIMARY KEY (id, order_refund_id),
    FOREIGN KEY (order_refund_id) REFERENCES order_refund(id)
);

CREATE TABLE order_refund (
    id bigint,
    order_id bigint,
    created timestamp,
    reason text,
    total_amount double precision,
    total_tax bigint,
    user_id bigint,
    uses_merchant_override_values boolean,
    PRIMARY KEY (id, order_id),
    FOREIGN KEY (order_id) REFERENCES orders(id)
);

CREATE TABLE custom_template_association (
    id bigint,
    channel_id bigint,
    date_created timestamp,
    date_modified timestamp,
    entity_id bigint,
    entity_type text,
    file_name text,
    is_valid boolean,
    PRIMARY KEY (id),
    FOREIGN KEY (channel_id) REFERENCES channel(id)
);

CREATE TABLE widget (
    uuid text,
    channel_id text,
    date_created timestamp,
    date_modified timestamp,
    description text,
    icon_name text,
    "name" text,
    version_uuid text,
    widget_configuration jsonb,
    widget_template_id text,
    PRIMARY KEY (uuid),
    FOREIGN KEY (channel_id) REFERENCES channel(id)
);

CREATE TABLE currency (
    id integer,
    auto_update boolean,
    country_iso_2 text,
    currency_code text,
    currency_exchange_rate double precision,
    decimal_places integer,
    decimal_token text,
    enabled boolean,
    is_default boolean,
    is_transactional boolean,
    last_updated timestamp,
    "name" text,
    thousands_token text,
    token text,
    token_location text,
    PRIMARY KEY (id)
);

CREATE TABLE seo_setting (
    _fivetran_id text,
    meta_description text,
    meta_keywords text,
    page_title text,
    www_redirect text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE widget_template (
    uuid text,
    current_version_uuid text,
    date_created timestamp,
    date_modified timestamp,
    icon_name text,
    kind text,
    "name" text,
    storefront_api_query text,
    template text,
    PRIMARY KEY (uuid)
);

CREATE TABLE coupon_entity (
    coupon_id bigint,
    entity_id bigint,
    entity_type text,
    PRIMARY KEY (coupon_id, entity_id)
);

CREATE TABLE coupon_country_restriction (
    country_id text,
    coupon_id bigint,
    PRIMARY KEY (country_id, coupon_id),
    FOREIGN KEY (country_id) REFERENCES country(id),
    FOREIGN KEY (coupon_id) REFERENCES coupon(id)
);

CREATE TABLE coupon_state_restriction (
    "index" bigint,
    coupon_id bigint,
    country text,
    "state" text,
    PRIMARY KEY ("index", coupon_id),
    FOREIGN KEY (coupon_id) REFERENCES coupon(id)
);

CREATE TABLE coupon_zip_restriction (
    "index" bigint,
    coupon_id bigint,
    country text,
    zip text,
    PRIMARY KEY ("index", coupon_id),
    FOREIGN KEY (coupon_id) REFERENCES coupon(id)
);

CREATE TABLE coupon (
    id bigint,
    amount text,
    code text,
    date_created timestamp,
    enabled boolean,
    expires text,
    max_uses bigint,
    max_uses_per_customer bigint,
    min_purchase text,
    "name" text,
    num_uses bigint,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE available_filter (
    id text,
    "name" text,
    product_count bigint,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE customer_address_form_field (
    "name" text,
    customer_address_id text,
    "value" jsonb,
    PRIMARY KEY ("name", customer_address_id),
    FOREIGN KEY (customer_address_id) REFERENCES customer_address(id)
);

CREATE TABLE customer_address (
    id text,
    customer_id bigint,
    address_1 text,
    address_2 text,
    address_type text,
    city text,
    company text,
    country text,
    country_code text,
    first_name text,
    last_name text,
    phone text,
    postal_code text,
    state_or_province text,
    PRIMARY KEY (id, customer_id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE customer_form_field (
    "name" text,
    customer_id bigint,
    "value" jsonb,
    PRIMARY KEY ("name", customer_id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE customer_store_credit (
    "index" bigint,
    customer_id bigint,
    amount double precision,
    PRIMARY KEY ("index", customer_id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE customer_channel (
    channel_id bigint,
    customer_id bigint,
    PRIMARY KEY (channel_id, customer_id),
    FOREIGN KEY (channel_id) REFERENCES channel(id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE customer_attribute_value (
    id bigint,
    customer_id bigint,
    attribute_id bigint,
    attribute_value text,
    date_created timestamp,
    date_modified timestamp,
    PRIMARY KEY (id, customer_id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE customer (
    id bigint,
    customer_group_id bigint,
    origin_channel_id bigint,
    accepts_product_review_abandoned_cart_emails boolean,
    address_count bigint,
    attribute_count bigint,
    company text,
    date_created timestamp,
    date_modified timestamp,
    email text,
    first_name text,
    force_password_reset boolean,
    last_name text,
    notes text,
    phone text,
    registration_ip_address text,
    tax_exempt_category text,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_group_id) REFERENCES customer_group(id),
    FOREIGN KEY (origin_channel_id) REFERENCES channel(id)
);

CREATE TABLE channel_app (
    id bigint,
    channel_id bigint,
    PRIMARY KEY (id, channel_id),
    FOREIGN KEY (channel_id) REFERENCES channel(id)
);

CREATE TABLE channel (
    id bigint,
    date_created timestamp,
    date_modified timestamp,
    external_id text,
    icon_url text,
    is_enabled boolean,
    is_listable_from_ui boolean,
    is_visible boolean,
    "name" text,
    platform text,
    "status" text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE subscriber (
    id bigint,
    channel_id bigint,
    order_id bigint,
    date_created timestamp,
    date_modified timestamp,
    email text,
    first_name text,
    last_name text,
    "source" text,
    PRIMARY KEY (id),
    FOREIGN KEY (channel_id) REFERENCES channel(id),
    FOREIGN KEY (order_id) REFERENCES orders(id)
);

CREATE TABLE product_image (
    id bigint,
    product_id bigint,
    date_created timestamp,
    description text,
    image_file text,
    is_thumbnail boolean,
    sort_order bigint,
    standard_url text,
    thumbnail_url text,
    tiny_url text,
    PRIMARY KEY (id, product_id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE product_bulk_pricing_rule (
    id bigint,
    product_id bigint,
    amount bigint,
    quantity_max bigint,
    quantity_min bigint,
    "type" text,
    PRIMARY KEY (id, product_id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE product_custom_field (
    id bigint,
    product_id bigint,
    "name" text,
    "value" text,
    PRIMARY KEY (id, product_id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE product_modifier_value (
    id bigint,
    product_modifier_id bigint,
    product_id bigint,
    image_url text,
    is_default boolean,
    label text,
    option_id bigint,
    price_adjuster text,
    price_adjuster_value bigint,
    purchasing_disabled_message text,
    purchasing_disabled_status boolean,
    sort_order bigint,
    weight_adjuster text,
    weight_adjuster_value bigint,
    PRIMARY KEY (id, product_modifier_id),
    FOREIGN KEY (product_modifier_id) REFERENCES product_modifier(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE product_modifier (
    id bigint,
    product_id bigint,
    config jsonb,
    display_name text,
    "name" text,
    required boolean,
    sort_order bigint,
    "type" text,
    PRIMARY KEY (id, product_id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE product_variant (
    id bigint,
    product_id bigint,
    bin_picking_number text,
    calculated_price double precision,
    calculated_weight bigint,
    cost_price double precision,
    depth double precision,
    fixed_cost_shipping_price double precision,
    height double precision,
    inventory_level bigint,
    inventory_warning_level bigint,
    is_free_shipping boolean,
    mpn text,
    price double precision,
    purchasing_disabled boolean,
    purchasing_disabled_message text,
    retail_price double precision,
    sale_price bigint,
    sku text,
    sku_id bigint,
    upc text,
    weight double precision,
    width double precision,
    PRIMARY KEY (id, product_id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE product_video (
    id text,
    product_id bigint,
    description text,
    length text,
    sort_order bigint,
    title text,
    "type" text,
    PRIMARY KEY (id, product_id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE product_meta_keyword (
    meta_keyword_id text,
    product_id bigint,
    PRIMARY KEY (meta_keyword_id, product_id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE related_product (
    related_product_id bigint,
    product_id bigint,
    PRIMARY KEY (related_product_id, product_id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE product_option (
    id bigint,
    product_id bigint,
    display_name text,
    option_value_id bigint,
    option_value_is_default boolean,
    option_value_label text,
    option_value_sort_order bigint,
    sort_order bigint,
    "type" text,
    PRIMARY KEY (id, product_id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE product_gift_wrapping_option (
    gift_wrapping_option_id bigint,
    product_id bigint,
    PRIMARY KEY (gift_wrapping_option_id, product_id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE product_category (
    category_id bigint,
    product_id bigint,
    PRIMARY KEY (category_id, product_id),
    FOREIGN KEY (category_id) REFERENCES category_tree(category_id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE product (
    id bigint,
    base_variant_id bigint,
    brand_id bigint,
    tax_class_id bigint,
    availability text,
    availability_description text,
    bin_picking_number text,
    brand_name text,
    calculated_price double precision,
    "condition" text,
    cost_price double precision,
    custom_url text,
    custom_url_is_customized boolean,
    date_created timestamp,
    date_modified timestamp,
    depth double precision,
    description text,
    fixed_cost_shipping_price double precision,
    gift_wrapping_options_type text,
    gtin text,
    height double precision,
    inventory_level bigint,
    inventory_tracking text,
    inventory_warning_level bigint,
    is_condition_shown boolean,
    is_featured boolean,
    is_free_shipping boolean,
    is_preorder_hidden boolean,
    is_preorder_only boolean,
    is_price_hidden boolean,
    is_visible boolean,
    layout_file text,
    map_price double precision,
    meta_description text,
    mpn text,
    "name" text,
    open_graph_description text,
    open_graph_title text,
    open_graph_type text,
    open_graph_use_image boolean,
    open_graph_use_meta_description boolean,
    open_graph_use_product_name boolean,
    option_set_display text,
    option_set_id bigint,
    order_quantity_maximum bigint,
    order_quantity_minimum bigint,
    page_title text,
    preorder_message text,
    preorder_release_date text,
    price double precision,
    price_hidden_label text,
    product_tax_code text,
    retail_price double precision,
    reviews_count bigint,
    reviews_rating_sum double precision,
    sale_price double precision,
    search_keywords text,
    sku text,
    sort_order bigint,
    total_sold bigint,
    "type" text,
    upc text,
    view_count bigint,
    warranty text,
    weight double precision,
    width double precision,
    PRIMARY KEY (id),
    FOREIGN KEY (base_variant_id) REFERENCES product_variant(id),
    FOREIGN KEY (brand_id) REFERENCES brand(id),
    FOREIGN KEY (tax_class_id) REFERENCES tax_class(id)
);

CREATE TABLE order_billing_address_form_field (
    "name" text,
    order_id bigint,
    "value" jsonb,
    PRIMARY KEY ("name", order_id),
    FOREIGN KEY (order_id) REFERENCES orders(id)
);

CREATE TABLE orders (
    id bigint,
    cart_id text,
    channel_id bigint,
    currency_id bigint,
    customer_id bigint,
    payment_provider_id text,
    status_id bigint,
    base_handling_cost double precision,
    base_shipping_cost double precision,
    base_wrapping_cost double precision,
    city text,
    company text,
    country text,
    country_iso_2 text,
    coupon_discount double precision,
    coupon_resource text,
    coupon_url text,
    currency_code text,
    currency_exchange_rate double precision,
    customer_locale text,
    customer_message text,
    date_created timestamp,
    date_modified timestamp,
    date_shipped timestamp,
    default_currency_code text,
    default_currency_id bigint,
    discount_amount double precision,
    ebay_order_id text,
    email text,
    external_id text,
    external_merchant_id text,
    external_source text,
    first_name text,
    geoip_country text,
    geoip_country_iso_2 text,
    gift_certificate_amount double precision,
    handling_cost_ex_tax double precision,
    handling_cost_inc_tax double precision,
    handling_cost_tax double precision,
    handling_cost_tax_class_id bigint,
    ip_address text,
    ip_address_v_6 text,
    is_deleted boolean,
    is_email_opt_in boolean,
    items_shipped bigint,
    items_total bigint,
    last_name text,
    order_is_digital boolean,
    order_source text,
    payment_method text,
    payment_status text,
    phone text,
    product_resource text,
    product_url text,
    refunded_amount double precision,
    shipping_address_count bigint,
    shipping_addressresource text,
    shipping_addressurl text,
    shipping_cost_ex_tax double precision,
    shipping_cost_inc_tax double precision,
    shipping_cost_tax double precision,
    shipping_cost_tax_class_id bigint,
    staff_notes text,
    "state" text,
    "status" text,
    store_credit_amount double precision,
    store_default_currency_code text,
    store_default_to_transactional_exchange_rate text,
    street_1 text,
    street_2 text,
    subtotal_ex_tax double precision,
    subtotal_inc_tax double precision,
    subtotal_tax double precision,
    tax_provider_id text,
    total_ex_tax double precision,
    total_inc_tax double precision,
    wrapping_cost_ex_tax double precision,
    wrapping_cost_inc_tax double precision,
    wrapping_cost_tax double precision,
    wrapping_cost_tax_class_id bigint,
    zip text,
    PRIMARY KEY (id),
    FOREIGN KEY (cart_id) REFERENCES cart(id),
    FOREIGN KEY (channel_id) REFERENCES channel(id),
    FOREIGN KEY (currency_id) REFERENCES currency(id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (payment_provider_id) REFERENCES order_transaction(gateway_transaction_id),
    FOREIGN KEY (status_id) REFERENCES order_status(id)
);

CREATE TABLE order_product_discount (
    id text,
    order_product_id bigint,
    amount text,
    code text,
    "name" text,
    target text,
    PRIMARY KEY (id, order_product_id),
    FOREIGN KEY (order_product_id) REFERENCES order_product(id)
);

CREATE TABLE order_product_option (
    id bigint,
    order_product_id bigint,
    display_name text,
    display_name_customer text,
    display_name_merchant text,
    display_style text,
    display_value text,
    display_value_customer text,
    display_value_merchant text,
    "name" text,
    option_id bigint,
    product_option_id bigint,
    "type" text,
    "value" text,
    PRIMARY KEY (id, order_product_id),
    FOREIGN KEY (order_product_id) REFERENCES order_product(id)
);

CREATE TABLE order_product (
    id bigint,
    order_id bigint,
    product_id bigint,
    order_address_id bigint,
    variant_id bigint,
    base_cost_price text,
    base_price text,
    base_total text,
    base_wrapping_cost text,
    bin_picking_number text,
    cost_price_ex_tax double precision,
    cost_price_inc_tax double precision,
    cost_price_tax double precision,
    ebay_item_id text,
    ebay_transaction_id text,
    event_date timestamp,
    event_name text,
    external_id text,
    fixed_shipping_cost text,
    is_bundled_product boolean,
    is_refunded boolean,
    "name" text,
    name_customer text,
    name_merchant text,
    option_set_id bigint,
    parent_order_product_id bigint,
    price_ex_tax double precision,
    price_inc_tax double precision,
    price_tax double precision,
    quantity bigint,
    quantity_shipped bigint,
    refunded_amount text,
    return_id bigint,
    sku text,
    total_ex_tax double precision,
    total_inc_tax double precision,
    total_tax double precision,
    "type" text,
    upc text,
    weight text,
    wrapping_cost_ex_tax double precision,
    wrapping_cost_inc_tax double precision,
    wrapping_cost_tax double precision,
    wrapping_message text,
    wrapping_name text,
    PRIMARY KEY (id, order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (order_address_id) REFERENCES order_shipping_address(id),
    FOREIGN KEY (variant_id) REFERENCES product_variant(id)
);

CREATE TABLE order_shipment_item (
    "index" bigint,
    shipment_id bigint,
    order_product_id bigint,
    product_id bigint,
    quantity bigint,
    PRIMARY KEY ("index", shipment_id),
    FOREIGN KEY (shipment_id) REFERENCES order_shipment(id),
    FOREIGN KEY (order_product_id) REFERENCES order_product(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE order_shipment (
    id bigint,
    order_id bigint,
    customer_id bigint,
    order_address_id bigint,
    city text,
    comments text,
    company text,
    country text,
    country_iso_2 text,
    date_created timestamp,
    email text,
    first_name text,
    last_name text,
    phone text,
    shipping_method text,
    shipping_provider text,
    "state" text,
    street_1 text,
    street_2 text,
    tracking_carrier text,
    tracking_link text,
    tracking_number text,
    zip text,
    PRIMARY KEY (id, order_id),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (order_address_id) REFERENCES order_shipping_address(id)
);

CREATE TABLE order_shipping_address_quote (
    id bigint,
    shipping_address_id bigint,
    carrier_code text,
    method_id bigint,
    provider_code text,
    rate_code text,
    rate_id text,
    shipping_provider_id text,
    timestamps text,
    uuid text,
    PRIMARY KEY (id, shipping_address_id),
    FOREIGN KEY (shipping_address_id) REFERENCES order_shipping_address(id)
);

CREATE TABLE order_shipping_address_form_field (
    "name" text,
    shipping_address_id bigint,
    "value" jsonb,
    PRIMARY KEY ("name", shipping_address_id),
    FOREIGN KEY (shipping_address_id) REFERENCES order_shipping_address(id)
);

CREATE TABLE order_shipping_address (
    id bigint,
    order_id bigint,
    shipping_zone_id bigint,
    base_cost double precision,
    base_handling_cost double precision,
    city text,
    company text,
    cost_ex_tax double precision,
    cost_inc_tax double precision,
    cost_tax double precision,
    cost_tax_class_id bigint,
    country text,
    country_iso_2 text,
    email text,
    first_name text,
    handling_cost_ex_tax double precision,
    handling_cost_inc_tax double precision,
    handling_cost_tax double precision,
    handling_cost_tax_class_id bigint,
    items_shipped bigint,
    items_total bigint,
    last_name text,
    phone text,
    shipping_method text,
    shipping_quotes_resource text,
    shipping_quotes_url text,
    shipping_zone_name text,
    "state" text,
    street_1 text,
    street_2 text,
    zip text,
    PRIMARY KEY (id, order_id),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (shipping_zone_id) REFERENCES shipping_zone(id)
);

CREATE TABLE order_coupon (
    id bigint,
    order_id bigint,
    coupon_id bigint,
    amount double precision,
    code text,
    discount double precision,
    "type" bigint,
    PRIMARY KEY (id, order_id),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (coupon_id) REFERENCES coupon(id)
);

CREATE TABLE order_transaction (
    id bigint,
    order_id bigint,
    amount double precision,
    avs_result_code text,
    avs_result_message text,
    avs_result_postal_match text,
    avs_result_street_match text,
    card_expiry_month integer,
    card_expiry_year integer,
    card_iin text,
    card_last_4 text,
    card_type text,
    currency text,
    custom_payment_method text,
    cvv_result_code text,
    cvv_result_message text,
    date_created timestamp,
    display_name text,
    event text,
    fraud_review boolean,
    gateway text,
    gateway_transaction_id text,
    gift_certificate_code text,
    gift_certificate_original_balance double precision,
    gift_certificate_remaining_balance double precision,
    gift_certificate_starting_balance double precision,
    gift_certificate_status text,
    method text,
    payment_instrument_token text,
    payment_method_id text,
    reference_transaction_id bigint,
    "status" text,
    store_credit_remaining_balance double precision,
    test boolean,
    PRIMARY KEY (id, order_id),
    FOREIGN KEY (order_id) REFERENCES orders(id)
);

CREATE TABLE payment_method_stored_instrument (
    "index" bigint,
    payment_method_id text,
    brand text,
    expiry_month integer,
    expiry_year integer,
    is_default boolean,
    issuer_identification_number integer,
    last_4 text,
    "type" text,
    PRIMARY KEY ("index", payment_method_id),
    FOREIGN KEY (payment_method_id) REFERENCES payment_method(id)
);

CREATE TABLE payment_method_supported_instrument (
    "index" text,
    payment_method_id text,
    instrument_type text,
    verification_value_required text,
    PRIMARY KEY ("index", payment_method_id),
    FOREIGN KEY (payment_method_id) REFERENCES payment_method(id)
);

CREATE TABLE payment_method (
    id text,
    "name" text,
    test_mode boolean,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE order_metafield (
    id bigint,
    order_id bigint,
    created_at timestamp,
    description text,
    "key" text,
    namespace text,
    permission_set text,
    resource_id text,
    resource_type text,
    updated_at timestamp,
    "value" text,
    PRIMARY KEY (id, order_id),
    FOREIGN KEY (order_id) REFERENCES orders(id)
);

CREATE TABLE order_tax (
    id bigint,
    order_id bigint,
    order_address_id bigint,
    order_product_id bigint,
    tax_class_id bigint,
    class text,
    line_amount double precision,
    line_item_type text,
    "name" text,
    priority bigint,
    priority_amount double precision,
    rate double precision,
    tax_rate_id bigint,
    PRIMARY KEY (id, order_id),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (order_address_id) REFERENCES order_shipping_address(id),
    FOREIGN KEY (order_product_id) REFERENCES order_product(id),
    FOREIGN KEY (tax_class_id) REFERENCES tax_class(id)
);

CREATE TABLE order_message (
    id bigint,
    order_id bigint,
    customer_id bigint,
    date_created timestamp,
    is_flagged boolean,
    message text,
    staff_id bigint,
    "status" text,
    subject text,
    "type" text,
    PRIMARY KEY (id, order_id),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE customer_allow_consent (
    customer_id bigint,
    "index" bigint,
    allow text,
    updated_at timestamp,
    PRIMARY KEY (customer_id, "index")
);

CREATE TABLE customer_deny_consent (
    customer_id bigint,
    "index" bigint,
    deny text,
    updated_at timestamp,
    PRIMARY KEY (customer_id, "index")
);

CREATE TABLE product_review (
    id bigint,
    product_id bigint,
    date_created timestamp,
    date_modified timestamp,
    date_reviewed timestamp,
    email text,
    "name" text,
    rating integer,
    "status" text,
    text text,
    title text,
    PRIMARY KEY (id, product_id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE product_metafield (
    id bigint,
    product_id bigint,
    date_created timestamp,
    date_modified timestamp,
    description text,
    "key" text,
    namespace text,
    permission_set text,
    resource_id bigint,
    resource_type text,
    "value" text,
    PRIMARY KEY (id, product_id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE product_variant_options_value (
    id bigint,
    product_variant_option_id bigint,
    product_id bigint,
    is_default boolean,
    label text,
    sort_order bigint,
    PRIMARY KEY (id, product_variant_option_id),
    FOREIGN KEY (product_variant_option_id) REFERENCES product_variant_option(id),
    FOREIGN KEY (product_id) REFERENCES product_variant_option(product_id)
);

CREATE TABLE product_variant_option (
    id bigint,
    product_id bigint,
    config_checkbox_label text,
    config_checked_by_default boolean,
    config_date_earliest_value text,
    config_date_latest_value text,
    config_date_limit_mode text,
    config_date_limited boolean,
    config_default_value text,
    config_file_max_size integer,
    config_file_types_mode text,
    config_number_highest_value integer,
    config_number_integers_only boolean,
    config_number_limit_mode text,
    config_number_limited boolean,
    config_number_lowest_value integer,
    config_product_list_adjusts_inventory boolean,
    config_product_list_adjusts_pricing boolean,
    config_product_list_shipping_calc text,
    config_text_characters_limited boolean,
    config_text_lines_limited boolean,
    config_text_max_length integer,
    config_text_max_lines integer,
    config_text_min_length integer,
    display_name text,
    "name" text,
    option_id bigint,
    option_is_default boolean,
    option_label text,
    option_sort_order bigint,
    sort_order bigint,
    "type" text,
    PRIMARY KEY (id, product_id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE product_complex_rule_condition (
    "index" bigint,
    product_complex_rule_id bigint,
    modifier_id bigint,
    modifier_value_id bigint,
    variant_id bigint,
    combination_id bigint,
    id bigint,
    PRIMARY KEY ("index", product_complex_rule_id),
    FOREIGN KEY (product_complex_rule_id) REFERENCES product_complex_rule(id),
    FOREIGN KEY (modifier_id) REFERENCES product_modifier(id),
    FOREIGN KEY (modifier_value_id) REFERENCES product_modifier_value(id),
    FOREIGN KEY (variant_id) REFERENCES product_variant(id)
);

CREATE TABLE product_complex_rule (
    id bigint,
    product_id bigint,
    enabled boolean,
    image_url text,
    price_adjuster text,
    price_adjuster_value bigint,
    purchasing_disabled boolean,
    purchasing_disabled_message text,
    purchasing_hidden boolean,
    sort_order bigint,
    stop boolean,
    weight_adjuster text,
    weight_adjuster_value bigint,
    PRIMARY KEY (id, product_id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE product_variant_metafield (
    id bigint,
    product_variant_id bigint,
    product_id bigint,
    date_created timestamp,
    date_modified timestamp,
    description text,
    "key" text,
    namespace text,
    permission_set text,
    resource_id bigint,
    resource_type text,
    "value" text,
    PRIMARY KEY (id, product_variant_id),
    FOREIGN KEY (product_variant_id) REFERENCES product_variant(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE channel_variant (
    channel_id bigint,
    channel_listing_id bigint,
    product_id bigint,
    variant_id bigint,
    date_created timestamp,
    date_modified timestamp,
    description text,
    external_id text,
    "name" text,
    "state" text,
    PRIMARY KEY (channel_id, channel_listing_id),
    FOREIGN KEY (channel_id) REFERENCES channel(id),
    FOREIGN KEY (channel_listing_id) REFERENCES channel_listing(listing_id),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (variant_id) REFERENCES product_variant(id)
);

CREATE TABLE channel_listing (
    listing_id bigint,
    channel_id bigint,
    product_id bigint,
    date_created timestamp,
    date_modified timestamp,
    description text,
    external_id text,
    "name" text,
    "state" text,
    PRIMARY KEY (listing_id, channel_id),
    FOREIGN KEY (channel_id) REFERENCES channel(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE customer_setting_per_channel (
    _fivetran_id text,
    channel_id bigint,
    allow_global_logins text,
    ask_shopper_for_tracking_consent boolean,
    default_customer_group_id bigint,
    guest_customer_group_id bigint,
    policy_url text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (channel_id) REFERENCES channel(id)
);

CREATE TABLE channel_active_theme (
    active_theme_uuid text,
    channel_id bigint,
    active_theme_version_uuid text,
    active_theme_configuration_uuid text,
    saved_theme_configuration_uuid text,
    PRIMARY KEY (active_theme_uuid, channel_id),
    FOREIGN KEY (channel_id) REFERENCES channel(id),
    FOREIGN KEY (active_theme_version_uuid) REFERENCES theme_variation(uuid)
);
