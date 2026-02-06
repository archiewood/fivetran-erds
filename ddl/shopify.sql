CREATE TABLE search_submitted_event (
    event_id text,
    event_client_id text,
    event_timestamp timestamp,
    query text,
    PRIMARY KEY (event_id)
);

CREATE TABLE order_discount_code (
    "index" bigint,
    order_id bigint,
    code text,
    PRIMARY KEY ("index", order_id),
    FOREIGN KEY (order_id) REFERENCES "order"(id)
);

CREATE TABLE collection_rule (
    "index" bigint,
    collection_id bigint,
    columns text,
    "condition" text,
    relation text,
    PRIMARY KEY ("index", collection_id),
    FOREIGN KEY (collection_id) REFERENCES collection(id)
);

CREATE TABLE inventory_quantity (
    id bigint,
    "name" text,
    inventory_item_id bigint,
    inventory_level_id bigint,
    quantity integer,
    updated_at timestamp,
    PRIMARY KEY (id, "name", inventory_item_id, inventory_level_id),
    FOREIGN KEY (inventory_item_id) REFERENCES inventory_item(id),
    FOREIGN KEY (inventory_level_id) REFERENCES inventory_level(id)
);

CREATE TABLE customer_tax_exemption (
    "index" bigint,
    customer_id bigint,
    tax_exemption text,
    PRIMARY KEY ("index", customer_id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE media_error (
    "index" integer,
    media_id bigint,
    code text,
    details text,
    message text,
    PRIMARY KEY ("index", media_id),
    FOREIGN KEY (media_id) REFERENCES media(id)
);

CREATE TABLE media_image (
    media_id bigint,
    mime_type text,
    original_source_file_size integer,
    original_source_url text,
    -- image_* (dynamic column),
    PRIMARY KEY (media_id),
    FOREIGN KEY (media_id) REFERENCES media(id)
);

CREATE TABLE dispute (
    id bigint,
    order_id bigint,
    amount double precision,
    currency_code text,
    evidence_due_by timestamp,
    evidence_sent_on timestamp,
    finalized_on timestamp,
    initiated_at timestamp,
    network_reason_code text,
    reason text,
    "status" text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (order_id) REFERENCES "order"(id)
);

CREATE TABLE order_risk_fact (
    "index" integer,
    order_id bigint,
    order_risk_assessment_index integer,
    description text,
    sentiment text,
    PRIMARY KEY ("index", order_id, order_risk_assessment_index),
    FOREIGN KEY (order_id) REFERENCES "order"(id),
    FOREIGN KEY (order_risk_assessment_index) REFERENCES order_risk_assessment("index")
);

CREATE TABLE company_location (
    id bigint,
    company_id bigint,
    created_at timestamp,
    currency text,
    external_id text,
    has_timeline_comment boolean,
    locale text,
    "name" text,
    note text,
    phone text,
    tax_settings_tax_exempt boolean,
    tax_settings_tax_registration_id text,
    total_spent_amount double precision,
    total_spent_currency_code text,
    updated_at timestamp,
    -- billing_address_* (dynamic column),
    -- buyer_exp_config_* (dynamic column),
    -- shipping_address_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (company_id) REFERENCES company(id)
);

CREATE TABLE customer (
    id bigint,
    last_order_id bigint,
    can_delete boolean,
    created_at timestamp,
    currency text,
    data_sale_opt_out boolean,
    display_name text,
    email text,
    email_marketing_consent_opt_in_level text,
    email_marketing_consent_state text,
    email_marketing_consent_updated_at timestamp,
    first_name text,
    last_name text,
    lifetime_duration text,
    locale text,
    multipass_identifier text,
    note text,
    number_of_orders bigint,
    phone text,
    product_subscriber_status text,
    "state" text,
    statistics_predicted_spend_tier text,
    tax_exempt boolean,
    total_spent double precision,
    updated_at timestamp,
    valid_email_address boolean,
    verified_email boolean,
    -- image_* (dynamic column),
    -- sms_marketing_consent_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (last_order_id) REFERENCES "order"(id)
);

CREATE TABLE checkout_transaction_event (
    "index" bigint,
    event_id text,
    amount double precision,
    currency_code text,
    gateway text,
    payment_method_name text,
    payment_method_type text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES checkout_event(event_id)
);

CREATE TABLE fulfillment_service (
    id text,
    shop_id bigint,
    location_id bigint,
    callback_url text,
    fulfillment_orders_opt_in boolean,
    handle text,
    inventory_management boolean,
    permits_sku_sharing boolean,
    service_name text,
    tracking_support boolean,
    "type" text,
    PRIMARY KEY (id, shop_id),
    FOREIGN KEY (shop_id) REFERENCES shop(id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE collection_viewed_product_variant_event (
    event_id text,
    product_variant_id bigint,
    PRIMARY KEY (event_id, product_variant_id),
    FOREIGN KEY (event_id) REFERENCES collection_viewed_event(event_id),
    FOREIGN KEY (product_variant_id) REFERENCES product_variant(id)
);

CREATE TABLE discount_customer_segment_selection (
    discount_id bigint,
    discount_type text,
    "index" integer,
    segment_id bigint,
    PRIMARY KEY (discount_id, discount_type, "index"),
    FOREIGN KEY (segment_id) REFERENCES customer_segment(id)
);

CREATE TABLE cart_line_event (
    "index" bigint,
    event_id text,
    merchandise_id text,
    cost_amount double precision,
    cost_currency_code text,
    quantity integer,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES cart_viewed_event(event_id),
    FOREIGN KEY (merchandise_id) REFERENCES product_variant(id)
);

CREATE TABLE sale (
    id bigint,
    sales_agreement_id bigint,
    action_type text,
    line_item_id bigint,
    line_type text,
    quantity integer,
    total_amount_pres_amount double precision,
    total_amount_pres_currency_code text,
    total_amount_shop_amount double precision,
    total_amount_shop_currency_code text,
    total_discount_amount_after_taxes_pres_amount double precision,
    total_discount_amount_after_taxes_pres_currency_code text,
    total_discount_amount_after_taxes_shop_amount double precision,
    total_discount_amount_after_taxes_shop_currency_code text,
    total_discount_amount_before_taxes_pres_amount double precision,
    total_discount_amount_before_taxes_pres_currency_code text,
    total_discount_amount_before_taxes_shop_amount double precision,
    total_discount_amount_before_taxes_shop_currency_code text,
    total_tax_amount_pres_amount double precision,
    total_tax_amount_pres_currency_code text,
    total_tax_amount_shop_amount double precision,
    total_tax_amount_shop_currency_code text,
    PRIMARY KEY (id, sales_agreement_id),
    FOREIGN KEY (sales_agreement_id) REFERENCES sales_agreement(id)
);

CREATE TABLE order_line_custom_attribute (
    "key" text,
    order_line_id bigint,
    "value" text,
    PRIMARY KEY ("key", order_line_id),
    FOREIGN KEY (order_line_id) REFERENCES order_line(id)
);

CREATE TABLE app (
    id bigint,
    catalog_id bigint,
    app_store_app_url text,
    app_store_developer_url text,
    description text,
    developer_name text,
    developer_type text,
    embedded boolean,
    features jsonb,
    handle text,
    install_url text,
    is_post_purchase_app_in_use boolean,
    previously_installed boolean,
    pricing_details text,
    pricing_details_summary text,
    privacy_policy_url text,
    published boolean,
    shopify_developed boolean,
    title text,
    uninstall_message text,
    -- banner_* (dynamic column),
    -- icon_* (dynamic column),
    PRIMARY KEY (id, catalog_id),
    FOREIGN KEY (catalog_id) REFERENCES catalog(id)
);

CREATE TABLE checkout_event (
    event_id text,
    buyer_accepts_email_marketing boolean,
    buyer_accepts_sms_marketing boolean,
    currency_code text,
    discounts_amount double precision,
    discounts_currency_code text,
    email text,
    event_client_id text,
    event_name text,
    event_timestamp timestamp,
    localization_country_iso_code text,
    localization_language_iso_code text,
    localization_market_handle text,
    localization_market_id bigint,
    order_customer_id bigint,
    order_customer_is_first_order boolean,
    order_id bigint,
    phone text,
    shipping_line_price_amount double precision,
    shipping_line_price_currency_code text,
    sms_marketing_phone text,
    subtotal_price_amount double precision,
    subtotal_price_currency_code text,
    token text,
    total_price_amount double precision,
    total_price_currency_code text,
    total_tax_amount double precision,
    total_tax_currency_code text,
    -- billing_address_* (dynamic column),
    -- shipping_address_* (dynamic column),
    PRIMARY KEY (event_id)
);

CREATE TABLE media_warning (
    "index" integer,
    media_id bigint,
    code text,
    message text,
    PRIMARY KEY ("index", media_id),
    FOREIGN KEY (media_id) REFERENCES media(id)
);

CREATE TABLE collection (
    id bigint,
    applied_disjunctively boolean,
    description text,
    description_html text,
    feedback_summary text,
    handle text,
    products_count integer,
    products_count_precision text,
    seo_description text,
    seo_title text,
    sort_order text,
    template_suffix text,
    title text,
    updated_at timestamp,
    -- image_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE discount_code_app (
    id bigint,
    app_discount_type_app_id bigint,
    app_discount_type_app_bridge_create_path text,
    app_discount_type_app_bridge_details_path text,
    app_discount_type_app_key text,
    app_discount_type_description text,
    app_discount_type_discount_class text,
    app_discount_type_function_id text,
    app_discount_type_target_type text,
    app_discount_type_title text,
    applies_on_one_time_purchase boolean,
    applies_on_subscription boolean,
    applies_once_per_customer boolean,
    async_usage_count bigint,
    codes_count_count integer,
    codes_count_precision text,
    combines_with_order_discounts boolean,
    combines_with_product_discounts boolean,
    combines_with_shipping_discounts boolean,
    created_at timestamp,
    customer_selection_all_customers boolean,
    discount_class text,
    discount_id bigint,
    ends_at timestamp,
    has_timeline_comment boolean,
    recurring_cycle_limit bigint,
    starts_at timestamp,
    "status" text,
    title text,
    total_sales_amount double precision,
    total_sales_currency_code text,
    updated_at timestamp,
    usage_limit bigint,
    -- error_history_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (app_discount_type_app_id) REFERENCES app(id)
);

CREATE TABLE "transaction" (
    id bigint,
    order_id bigint,
    parent_id bigint,
    refund_id bigint,
    staff_member_id bigint,
    account_number text,
    amount_rounding_set_pres_amount double precision,
    amount_rounding_set_pres_currency_code text,
    amount_rounding_set_shop_amount double precision,
    amount_rounding_set_shop_currency_code text,
    amount_set_pres_amount double precision,
    amount_set_pres_currency_code text,
    amount_set_shop_amount double precision,
    amount_set_shop_currency_code text,
    authorization_code text,
    authorization_expires_at timestamp,
    created_at timestamp,
    error_code text,
    extended_authorization_expires_at timestamp,
    formatted_gateway text,
    gateway text,
    kind text,
    manual_payment_gateway boolean,
    manually_capturable boolean,
    maximum_refundable_amount double precision,
    maximum_refundable_currency_code text,
    multi_capturable boolean,
    processed_at timestamp,
    receipt_json jsonb,
    refund_set_acquirer_reference_number text,
    settlement_currency text,
    settlement_currency_rate double precision,
    standard_authorization_expires_at timestamp,
    "status" text,
    test boolean,
    total_unsettled_set_pres_amount double precision,
    total_unsettled_set_pres_currency_code text,
    total_unsettled_set_shop_amount double precision,
    total_unsettled_set_shop_currency_code text,
    -- payment_* (dynamic column),
    -- payment_icon_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (order_id) REFERENCES "order"(id),
    FOREIGN KEY (parent_id) REFERENCES "transaction"(id),
    FOREIGN KEY (refund_id) REFERENCES refund(id),
    FOREIGN KEY (staff_member_id) REFERENCES staff_member(id)
);

CREATE TABLE company (
    id bigint,
    main_contact_id bigint,
    created_at timestamp,
    default_role_id bigint,
    default_role_name text,
    default_role_note text,
    external_id text,
    has_timeline_comment boolean,
    "name" text,
    note text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (main_contact_id) REFERENCES company_contact(id)
);

CREATE TABLE fulfillment_order_line_item (
    id bigint,
    fulfillment_order_id bigint,
    inventory_item_id bigint,
    order_line_item_id bigint,
    product_variant_id bigint,
    product_title text,
    remaining_quantity integer,
    requires_shipping boolean,
    sku text,
    total_quantity integer,
    variant_title text,
    vendor text,
    weight_unit text,
    weight_value double precision,
    -- image_* (dynamic column),
    PRIMARY KEY (id, fulfillment_order_id),
    FOREIGN KEY (fulfillment_order_id) REFERENCES fulfillment_order(id),
    FOREIGN KEY (inventory_item_id) REFERENCES inventory_item(id),
    FOREIGN KEY (order_line_item_id) REFERENCES order_line(id),
    FOREIGN KEY (product_variant_id) REFERENCES product_variant(id)
);

CREATE TABLE discount_allocation (
    "index" bigint,
    order_line_id bigint,
    discount_application_index bigint,
    allocated_amount_set_pres_amount double precision,
    allocated_amount_set_pres_currency_code text,
    allocated_amount_set_shop_amount double precision,
    allocated_amount_set_shop_currency_code text,
    PRIMARY KEY ("index", order_line_id),
    FOREIGN KEY (order_line_id) REFERENCES order_line(id),
    FOREIGN KEY (discount_application_index) REFERENCES discount_application("index")
);

CREATE TABLE abandoned_checkout_tax_line (
    "index" bigint,
    checkout_id bigint,
    channel_liable boolean,
    price_set_pres_amount double precision,
    price_set_pres_currency_code text,
    price_set_shop_amount double precision,
    price_set_shop_currency_code text,
    rate double precision,
    rate_percentage double precision,
    "source" text,
    title text,
    PRIMARY KEY ("index", checkout_id),
    FOREIGN KEY (checkout_id) REFERENCES abandoned_checkout(id)
);

CREATE TABLE fulfillment_tracking_info (
    "index" bigint,
    fulfillment_id bigint,
    company text,
    number text,
    url text,
    PRIMARY KEY ("index", fulfillment_id),
    FOREIGN KEY (fulfillment_id) REFERENCES fulfillment(id)
);

CREATE TABLE media_file_error (
    "index" integer,
    media_id bigint,
    code text,
    details text,
    message text,
    PRIMARY KEY ("index", media_id),
    FOREIGN KEY (media_id) REFERENCES media(id)
);

CREATE TABLE media_source (
    "index" integer,
    media_id bigint,
    file_size integer,
    format text,
    height integer,
    mime_type text,
    url text,
    width integer,
    PRIMARY KEY ("index", media_id),
    FOREIGN KEY (media_id) REFERENCES media(id)
);

CREATE TABLE collection_viewed_event (
    event_id text,
    collection_id text,
    event_client_id text,
    event_timestamp timestamp,
    title text,
    PRIMARY KEY (event_id)
);

CREATE TABLE discount_code_bxgy (
    id bigint,
    applies_once_per_customer boolean,
    async_usage_count integer,
    codes_count integer,
    codes_precision text,
    combines_with_order_discounts boolean,
    combines_with_product_discounts boolean,
    combines_with_shipping_discounts boolean,
    created_at timestamp,
    customer_selection_all_customers boolean,
    discount_class text,
    ends_at timestamp,
    has_timeline_comment boolean,
    starts_at timestamp,
    "status" text,
    summary text,
    title text,
    total_sales_amount double precision,
    total_sales_currency_code text,
    updated_at timestamp,
    usage_limit bigint,
    uses_per_order_limit integer,
    -- customer_buys_* (dynamic column),
    -- customer_gets_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE balance_transaction (
    id bigint,
    associated_order_id bigint,
    associated_payout_id bigint,
    source_order_transaction_id bigint,
    adjustment_reason text,
    amount double precision,
    currency_code text,
    fee_amount double precision,
    fee_currency_code text,
    net_amount double precision,
    net_currency_code text,
    source_id bigint,
    source_type text,
    test boolean,
    transaction_date timestamp,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (associated_order_id) REFERENCES "order"(id),
    FOREIGN KEY (associated_payout_id) REFERENCES payout(id),
    FOREIGN KEY (source_order_transaction_id) REFERENCES "transaction"(id)
);

CREATE TABLE gift_card (
    id bigint,
    customer_id bigint,
    order_id bigint,
    recipient_attributes_recipient_id bigint,
    balance_amount double precision,
    balance_currency_code text,
    created_at timestamp,
    deactivated_at timestamp,
    enabled boolean,
    expires_on text,
    initial_value_amount double precision,
    initial_value_currency_code text,
    last_characters text,
    masked_code text,
    note text,
    recipient_attributes_message text,
    recipient_attributes_preferred_name text,
    recipient_attributes_send_notification_at timestamp,
    template_suffix text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (order_id) REFERENCES "order"(id),
    FOREIGN KEY (recipient_attributes_recipient_id) REFERENCES customer(id)
);

CREATE TABLE refund_shipping_line (
    id bigint,
    refund_id bigint,
    subtotal_amount_set_pres_amount double precision,
    subtotal_amount_set_pres_currency_code text,
    subtotal_amount_set_shop_amount double precision,
    subtotal_amount_set_shop_currency_code text,
    tax_amount_set_pres_amount double precision,
    tax_amount_set_pres_currency_code text,
    tax_amount_set_shop_amount double precision,
    tax_amount_set_shop_currency_code text,
    -- shipping_line_* (dynamic column),
    PRIMARY KEY (id, refund_id),
    FOREIGN KEY (refund_id) REFERENCES refund(id)
);

CREATE TABLE sales_agreement (
    id bigint,
    app_id bigint,
    order_id bigint,
    refund_id bigint,
    return_id bigint,
    user_id bigint,
    happened_at timestamp,
    reason text,
    PRIMARY KEY (id),
    FOREIGN KEY (app_id) REFERENCES app(id),
    FOREIGN KEY (order_id) REFERENCES "order"(id),
    FOREIGN KEY (refund_id) REFERENCES refund(id),
    FOREIGN KEY (return_id) REFERENCES "return"(id),
    FOREIGN KEY (user_id) REFERENCES staff_member(id)
);

CREATE TABLE order_risk_summary (
    order_id bigint,
    recommendation text,
    PRIMARY KEY (order_id),
    FOREIGN KEY (order_id) REFERENCES "order"(id)
);

CREATE TABLE product_added_to_cart_event (
    event_id text,
    merchandise_id text,
    cost_amount double precision,
    cost_currency_code text,
    event_client_id text,
    event_timestamp timestamp,
    quantity integer,
    PRIMARY KEY (event_id),
    FOREIGN KEY (merchandise_id) REFERENCES product_variant(id)
);

CREATE TABLE discount_customer_gets_collection (
    discount_id bigint,
    discount_resource text,
    collection_id bigint,
    PRIMARY KEY (discount_id, discount_resource, collection_id),
    FOREIGN KEY (collection_id) REFERENCES collection(id)
);

CREATE TABLE refund (
    id bigint,
    order_id bigint,
    return_id bigint,
    staff_member_id bigint,
    created_at timestamp,
    note text,
    total_refunded_set_pres_amount double precision,
    total_refunded_set_pres_currency_code text,
    total_refunded_set_shop_amount double precision,
    total_refunded_set_shop_currency_code text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (order_id) REFERENCES "order"(id),
    FOREIGN KEY (return_id) REFERENCES "return"(id),
    FOREIGN KEY (staff_member_id) REFERENCES staff_member(id)
);

CREATE TABLE external_video (
    media_id bigint,
    embed_url text,
    host text,
    origin_url text,
    PRIMARY KEY (media_id),
    FOREIGN KEY (media_id) REFERENCES media(id)
);

CREATE TABLE product_option_value (
    id bigint,
    product_option_id bigint,
    has_variants boolean,
    linked_metafield_value text,
    "name" text,
    PRIMARY KEY (id, product_option_id),
    FOREIGN KEY (product_option_id) REFERENCES product_option(id)
);

CREATE TABLE company_location_tax_exemption (
    tax_exemption text,
    company_location_id bigint,
    PRIMARY KEY (tax_exemption, company_location_id),
    FOREIGN KEY (company_location_id) REFERENCES company_location(id)
);

CREATE TABLE cart_viewed_event (
    event_id text,
    cart_id text,
    cost_amount double precision,
    cost_currency_code text,
    event_client_id text,
    event_timestamp timestamp,
    total_quantity integer,
    PRIMARY KEY (event_id)
);

CREATE TABLE order_tag (
    "index" bigint,
    order_id bigint,
    "value" text,
    PRIMARY KEY ("index", order_id),
    FOREIGN KEY (order_id) REFERENCES "order"(id)
);

CREATE TABLE product_variant_media (
    media_id bigint,
    product_variant_id bigint,
    PRIMARY KEY (media_id, product_variant_id),
    FOREIGN KEY (media_id) REFERENCES media(id),
    FOREIGN KEY (product_variant_id) REFERENCES product_variant(id)
);

CREATE TABLE discount_code_basic (
    id bigint,
    applies_once_per_customer boolean,
    async_usage_count integer,
    codes_count integer,
    codes_precision text,
    combines_with_order_discounts boolean,
    combines_with_product_discounts boolean,
    combines_with_shipping_discounts boolean,
    created_at timestamp,
    customer_selection_all_customers boolean,
    discount_class text,
    ends_at timestamp,
    has_timeline_comment boolean,
    minimum_requirement_greater_than_or_equal_to_quantity integer,
    minimum_requirement_gte_subtotal_amount double precision,
    minimum_requirement_gte_subtotal_currency_code text,
    recurring_cycle_limit integer,
    short_summary text,
    starts_at timestamp,
    "status" text,
    summary text,
    title text,
    total_sales_amount double precision,
    total_sales_currency_code text,
    updated_at timestamp,
    usage_limit bigint,
    -- customer_gets_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE search_result_product_variant_event (
    event_id text,
    product_variant_id text,
    PRIMARY KEY (event_id, product_variant_id),
    FOREIGN KEY (event_id) REFERENCES search_submitted_event(event_id),
    FOREIGN KEY (product_variant_id) REFERENCES product_variant(id)
);

CREATE TABLE product_variant (
    id bigint,
    product_id bigint,
    inventory_item_id bigint,
    available_for_sale boolean,
    barcode text,
    compare_at_price text,
    created_at timestamp,
    display_name text,
    inventory_policy text,
    inventory_quantity integer,
    legacy_resource_id bigint,
    metafield jsonb,
    "position" integer,
    price double precision,
    requires_components boolean,
    sellable_online_quantity integer,
    sku text,
    tax_code text,
    taxable boolean,
    title text,
    updated_at timestamp,
    PRIMARY KEY (id, product_id),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (inventory_item_id) REFERENCES inventory_item(id)
);

CREATE TABLE draft_order_custom_attribute (
    "key" text,
    draft_order_id bigint,
    "value" text,
    PRIMARY KEY ("key", draft_order_id),
    FOREIGN KEY (draft_order_id) REFERENCES draft_order(id)
);

CREATE TABLE order_shipping_tax_line (
    "index" bigint,
    order_shipping_line_id bigint,
    channel_liable boolean,
    price_set_pres_amount double precision,
    price_set_pres_currency_code text,
    price_set_shop_amount double precision,
    price_set_shop_currency_code text,
    rate double precision,
    rate_percentage double precision,
    "source" text,
    title text,
    PRIMARY KEY ("index", order_shipping_line_id),
    FOREIGN KEY (order_shipping_line_id) REFERENCES order_shipping_line(id)
);

CREATE TABLE media (
    id bigint,
    alt text,
    created_at timestamp,
    file_status text,
    media_content_type text,
    preview_image_alt_text text,
    preview_image_height bigint,
    preview_image_id bigint,
    preview_image_url text,
    preview_image_width bigint,
    preview_status text,
    "status" text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE discount_automatic_bxgy (
    id bigint,
    async_usage_count bigint,
    combines_with_order_discounts boolean,
    combines_with_product_discounts boolean,
    combines_with_shipping_discounts boolean,
    created_at timestamp,
    discount_class text,
    ends_at timestamp,
    starts_at timestamp,
    "status" text,
    summary text,
    title text,
    updated_at timestamp,
    uses_per_order_limit bigint,
    -- customer_buys_* (dynamic column),
    -- customer_gets_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE company_location_catalog (
    catalog_id bigint,
    company_location_id bigint,
    PRIMARY KEY (catalog_id, company_location_id),
    FOREIGN KEY (catalog_id) REFERENCES catalog(id),
    FOREIGN KEY (company_location_id) REFERENCES company_location(id)
);

CREATE TABLE location (
    id bigint,
    fulfillment_service_id bigint,
    activatable boolean,
    address_1 text,
    address_2 text,
    address_verified boolean,
    city text,
    country text,
    country_code text,
    created_at timestamp,
    deactivatable boolean,
    deactivated_at timestamp,
    deletable boolean,
    fulfills_online_orders boolean,
    has_active_inventory boolean,
    has_unfulfilled_orders boolean,
    is_active boolean,
    is_fulfillment_service boolean,
    latitude double precision,
    local_pickup_settings_instructions text,
    local_pickup_settings_pickup_time text,
    longitude double precision,
    "name" text,
    phone text,
    province text,
    province_code text,
    ships_inventory boolean,
    updated_at timestamp,
    zip text,
    PRIMARY KEY (id),
    FOREIGN KEY (fulfillment_service_id) REFERENCES fulfillment_service(id)
);

CREATE TABLE company_contact (
    id bigint,
    company_id bigint,
    customer_id bigint,
    created_at timestamp,
    is_main_contact boolean,
    locale text,
    title text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE refund_line_item (
    id bigint,
    location_id bigint,
    order_line_id bigint,
    refund_id bigint,
    price_set_pres_amount double precision,
    price_set_pres_currency_code text,
    price_set_shop_amount double precision,
    price_set_shop_currency_code text,
    quantity double precision,
    restock_type text,
    restocked boolean,
    subtotal_set_pres_amount double precision,
    subtotal_set_pres_currency_code text,
    subtotal_set_shop_amount double precision,
    subtotal_set_shop_currency_code text,
    total_tax_set_pres_amount double precision,
    total_tax_set_pres_currency_code text,
    total_tax_set_shop_amount double precision,
    total_tax_set_shop_currency_code text,
    PRIMARY KEY (id),
    FOREIGN KEY (location_id) REFERENCES location(id),
    FOREIGN KEY (order_line_id) REFERENCES order_line(id),
    FOREIGN KEY (refund_id) REFERENCES refund(id)
);

CREATE TABLE metafield (
    id bigint,
    owner_id bigint,
    created_at timestamp,
    description text,
    "key" text,
    namespace text,
    owner_resource text,
    "type" text,
    updated_at timestamp,
    "value" text,
    PRIMARY KEY (id, owner_id)
);

CREATE TABLE product_media (
    media_id bigint,
    product_id bigint,
    PRIMARY KEY (media_id, product_id),
    FOREIGN KEY (media_id) REFERENCES media(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE marketing_event (
    id bigint,
    app_id bigint,
    channel_handle text,
    description text,
    ended_at timestamp,
    manage_url text,
    marketing_channel_type text,
    preview_url text,
    remote_id text,
    scheduled_to_end_at timestamp,
    source_and_medium text,
    started_at timestamp,
    "type" text,
    utm_campaign text,
    utm_medium text,
    utm_source text,
    PRIMARY KEY (id),
    FOREIGN KEY (app_id) REFERENCES app(id)
);

CREATE TABLE product_publication (
    product_id bigint,
    publication_id bigint,
    PRIMARY KEY (product_id, publication_id),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (publication_id) REFERENCES publication(id)
);

CREATE TABLE alert_displayed_event (
    event_id text,
    event_client_id text,
    event_timestamp timestamp,
    message text,
    target text,
    "type" text,
    "value" text,
    PRIMARY KEY (event_id)
);

CREATE TABLE cart_attribute_event (
    "key" text,
    event_id text,
    "value" text,
    PRIMARY KEY ("key", event_id),
    FOREIGN KEY (event_id) REFERENCES cart_viewed_event(event_id)
);

CREATE TABLE discount_customer_buys_product (
    discount_id bigint,
    discount_resource text,
    product_id bigint,
    PRIMARY KEY (discount_id, discount_resource, product_id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE discount_customer_buys_collection (
    discount_id bigint,
    discount_resource text,
    collection_id bigint,
    PRIMARY KEY (discount_id, discount_resource, collection_id),
    FOREIGN KEY (collection_id) REFERENCES collection(id)
);

CREATE TABLE fulfillment_line_item (
    id bigint,
    fulfillment_id bigint,
    order_line_id bigint,
    product_id bigint,
    product_variant_id bigint,
    discounted_total_set_pres_amount double precision,
    discounted_total_set_pres_currency_code text,
    discounted_total_set_shop_amount double precision,
    discounted_total_set_shop_currency_code text,
    original_total_set_pres_amount double precision,
    original_total_set_pres_currency_code text,
    original_total_set_shop_amount double precision,
    original_total_set_shop_currency_code text,
    quantity integer,
    PRIMARY KEY (id, fulfillment_id),
    FOREIGN KEY (fulfillment_id) REFERENCES fulfillment(id),
    FOREIGN KEY (order_line_id) REFERENCES order_line(id),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (product_variant_id) REFERENCES product_variant(id)
);

CREATE TABLE tender_transaction (
    id bigint,
    order_id bigint,
    user_id bigint,
    amount double precision,
    currency_code text,
    payment_method text,
    processed_at timestamp,
    remote_reference text,
    test boolean,
    transaction_details_credit_card_company text,
    transaction_details_credit_card_number text,
    PRIMARY KEY (id),
    FOREIGN KEY (order_id) REFERENCES "order"(id),
    FOREIGN KEY (user_id) REFERENCES staff_member(id)
);

CREATE TABLE discount_redeem_code (
    discount_id bigint,
    discount_type text,
    id bigint,
    created_by_id bigint,
    code text,
    created_by_description text,
    created_by_title text,
    PRIMARY KEY (discount_id, discount_type, id),
    FOREIGN KEY (created_by_id) REFERENCES app(id)
);

CREATE TABLE publication (
    id bigint,
    catalog_id bigint,
    auto_publish boolean,
    supports_future_publishing boolean,
    PRIMARY KEY (id),
    FOREIGN KEY (catalog_id) REFERENCES catalog(id)
);

CREATE TABLE checkout_line_item_event (
    id text,
    event_id text,
    final_line_price_amount double precision,
    final_line_price_currency_code text,
    quantity integer,
    selling_plan_allocation_id bigint,
    selling_plan_allocation_name text,
    title text,
    variant_id bigint,
    PRIMARY KEY (id, event_id),
    FOREIGN KEY (event_id) REFERENCES checkout_event(event_id)
);

CREATE TABLE abandoned_checkout_line (
    "index" bigint,
    checkout_id bigint,
    product_id bigint,
    variant_id bigint,
    discounted_total_price_set_pres_amount double precision,
    discounted_total_price_set_pres_currency_code text,
    discounted_total_price_set_shop_amount double precision,
    discounted_total_price_set_shop_currency_code text,
    discounted_total_price_with_code_pres_amount double precision,
    discounted_total_price_with_code_pres_currency_code text,
    discounted_total_price_with_code_shop_amount double precision,
    discounted_total_price_with_code_shop_currency_code text,
    discounted_unit_price_set_pres_amount double precision,
    discounted_unit_price_set_pres_currency_code text,
    discounted_unit_price_set_shop_amount double precision,
    discounted_unit_price_set_shop_currency_code text,
    discounted_unit_price_with_code_pres_amount double precision,
    discounted_unit_price_with_code_pres_currency_code text,
    discounted_unit_price_with_code_shop_amount double precision,
    discounted_unit_price_with_code_shop_currency_code text,
    original_total_price_set_pres_amount double precision,
    original_total_price_set_pres_currency_code text,
    original_total_price_set_shop_amount double precision,
    original_total_price_set_shop_currency_code text,
    original_unit_price_set_pres_amount double precision,
    original_unit_price_set_pres_currency_code text,
    original_unit_price_set_shop_amount double precision,
    original_unit_price_set_shop_currency_code text,
    quantity bigint,
    sku text,
    title text,
    variant_title text,
    -- image_* (dynamic column),
    PRIMARY KEY ("index", checkout_id),
    FOREIGN KEY (checkout_id) REFERENCES abandoned_checkout(id),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (variant_id) REFERENCES product_variant(id)
);

CREATE TABLE payout (
    id bigint,
    issued_at timestamp,
    net_amount double precision,
    net_currency_code text,
    "status" text,
    transaction_type text,
    -- business_entity_* (dynamic column),
    -- summary_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE discount_automatic_app (
    id bigint,
    app_discount_type_app_id bigint,
    app_discount_type_app_bridge_create_path text,
    app_discount_type_app_bridge_details_path text,
    app_discount_type_app_key text,
    app_discount_type_description text,
    app_discount_type_discount_class text,
    app_discount_type_function_id text,
    app_discount_type_target_type text,
    app_discount_type_title text,
    applies_on_one_time_purchase boolean,
    applies_on_subscription boolean,
    async_usage_count bigint,
    combines_with_order_discounts boolean,
    combines_with_product_discounts boolean,
    combines_with_shipping_discounts boolean,
    created_at timestamp,
    discount_class text,
    discount_id bigint,
    ends_at timestamp,
    recurring_cycle_limit bigint,
    starts_at timestamp,
    "status" text,
    title text,
    updated_at timestamp,
    -- error_history_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (app_discount_type_app_id) REFERENCES app(id)
);

CREATE TABLE discount_code_free_shipping (
    id bigint,
    applies_on_one_time_purchase boolean,
    applies_on_subscription boolean,
    applies_once_per_customer boolean,
    async_usage_count integer,
    codes_count integer,
    codes_precision text,
    combines_with_order_discounts boolean,
    combines_with_product_discounts boolean,
    combines_with_shipping_discounts boolean,
    created_at timestamp,
    customer_selection_all_customers boolean,
    destination_selection_all_countries boolean,
    destination_selection_include_rest_of_world boolean,
    discount_class text,
    ends_at timestamp,
    has_timeline_comment boolean,
    maximum_shipping_price_amount double precision,
    maximum_shipping_price_currency_code text,
    minimum_requirement_greater_than_or_equal_to_quantity integer,
    minimum_requirement_gte_subtotal_amount double precision,
    minimum_requirement_gte_subtotal_currency_code text,
    recurring_cycle_limit integer,
    short_summary text,
    starts_at timestamp,
    "status" text,
    summary text,
    title text,
    total_sales_amount double precision,
    total_sales_currency_code text,
    updated_at timestamp,
    usage_limit bigint,
    PRIMARY KEY (id)
);

CREATE TABLE bundle_component_option_selection (
    "index" bigint,
    bundle_component_index bigint,
    product_id bigint,
    component_option_id bigint,
    parent_option_id bigint,
    values jsonb,
    PRIMARY KEY ("index", bundle_component_index, product_id),
    FOREIGN KEY (bundle_component_index) REFERENCES bundle_component("index"),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (component_option_id) REFERENCES product_option(id),
    FOREIGN KEY (parent_option_id) REFERENCES product_option(id)
);

CREATE TABLE adjustment_order (
    balance_transaction_id bigint,
    id bigint,
    amount double precision,
    currency_code text,
    link text,
    PRIMARY KEY (balance_transaction_id, id),
    FOREIGN KEY (balance_transaction_id) REFERENCES balance_transaction(id),
    FOREIGN KEY (id) REFERENCES "transaction"(id)
);

CREATE TABLE product_variant_option_value (
    option_value_id bigint,
    variant_id bigint,
    PRIMARY KEY (option_value_id, variant_id),
    FOREIGN KEY (option_value_id) REFERENCES product_option_value(id),
    FOREIGN KEY (variant_id) REFERENCES product_variant(id)
);

CREATE TABLE customer_address (
    id bigint,
    customer_id bigint,
    address_1 text,
    address_2 text,
    city text,
    company text,
    coordinates_validated boolean,
    country text,
    country_code text,
    first_name text,
    is_default boolean,
    last_name text,
    latitude text,
    longitude text,
    "name" text,
    phone text,
    province text,
    province_code text,
    timezone text,
    validation_result_summary text,
    zip text,
    PRIMARY KEY (id, customer_id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE shop (
    id bigint,
    account_owner_id bigint,
    checkout_api_supported boolean,
    contact_email text,
    countries_in_shipping_zones_country_codes jsonb,
    countries_in_shipping_zones_include_rest_of_world boolean,
    created_at timestamp,
    currency_code text,
    customer_accounts text,
    description text,
    email text,
    enabled_presentment_currencies jsonb,
    iana_timezone text,
    marketing_sms_consent_enabled_at_checkout boolean,
    myshopify_domain text,
    "name" text,
    order_number_format_prefix text,
    order_number_format_suffix text,
    password_enabled boolean,
    payment_settings_supported_digital_wallets jsonb,
    plan_display_name text,
    plan_partner_development boolean,
    plan_shopify_plus boolean,
    rich_text_editor_url text,
    setup_required boolean,
    ships_to_countries jsonb,
    shop_owner_name text,
    tax_shipping boolean,
    taxes_included boolean,
    timezone_abbreviation text,
    timezone_offset text,
    timezone_offset_minutes integer,
    transactional_sms_disabled boolean,
    unit_system text,
    updated_at timestamp,
    url text,
    weight_unit text,
    -- billing_address_* (dynamic column),
    -- currency_formats_* (dynamic column),
    -- customer_accounts_* (dynamic column),
    -- features_* (dynamic column),
    -- primary_domain_* (dynamic column),
    -- resource_limits_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (account_owner_id) REFERENCES staff_member(id)
);

CREATE TABLE discount_customer_selection (
    discount_id bigint,
    discount_type text,
    "index" integer,
    customer_id bigint,
    PRIMARY KEY (discount_id, discount_type, "index"),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE "order" (
    id bigint,
    customer_id bigint,
    location_id bigint,
    purchasing_entity_company_contact_id bigint,
    purchasing_entity_company_id bigint,
    purchasing_entity_customer_id bigint,
    staff_member_id bigint,
    app_icon_alt_text text,
    app_icon_height bigint,
    app_icon_id bigint,
    app_icon_url text,
    app_icon_width bigint,
    app_id bigint,
    app_name text,
    can_mark_as_paid boolean,
    can_notify_customer boolean,
    cancel_reason text,
    cancellation_staff_note text,
    cancelled_at timestamp,
    capturable boolean,
    cart_discount_amount_set_pres_amount double precision,
    cart_discount_amount_set_pres_currency_code text,
    cart_discount_amount_set_shop_amount double precision,
    cart_discount_amount_set_shop_currency_code text,
    channel_information_channel_definition_channel_name text,
    channel_information_channel_definition_handle text,
    channel_information_channel_definition_id bigint,
    channel_information_channel_definition_is_marketplace boolean,
    channel_information_channel_definition_sub_channel_name text,
    channel_information_channel_definition_svg_icon text,
    channel_information_channel_id bigint,
    channel_information_id bigint,
    client_ip text,
    closed boolean,
    closed_at timestamp,
    confirmation_number text,
    confirmed boolean,
    created_at timestamp,
    currency_code text,
    current_cart_discount_amount_set_pres_amount double precision,
    current_cart_discount_amount_set_pres_currency_code text,
    current_cart_discount_amount_set_shop_amount double precision,
    current_cart_discount_amount_set_shop_currency_code text,
    current_shipping_price_set_pres_amount double precision,
    current_shipping_price_set_pres_currency_code text,
    current_shipping_price_set_shop_amount double precision,
    current_shipping_price_set_shop_currency_code text,
    current_subtotal_line_items_quantity bigint,
    current_subtotal_price_set_pres_amount double precision,
    current_subtotal_price_set_pres_currency_code text,
    current_subtotal_price_set_shop_amount double precision,
    current_subtotal_price_set_shop_currency_code text,
    current_total_additional_fees_set_pres_amount double precision,
    current_total_additional_fees_set_pres_currency_code text,
    current_total_additional_fees_set_shop_amount double precision,
    current_total_additional_fees_set_shop_currency_code text,
    current_total_discounts_set_pres_amount double precision,
    current_total_discounts_set_pres_currency_code text,
    current_total_discounts_set_shop_amount double precision,
    current_total_discounts_set_shop_currency_code text,
    current_total_duties_set_pres_amount double precision,
    current_total_duties_set_pres_currency_code text,
    current_total_duties_set_shop_amount double precision,
    current_total_duties_set_shop_currency_code text,
    current_total_price_set_pres_amount double precision,
    current_total_price_set_pres_currency_code text,
    current_total_price_set_shop_amount double precision,
    current_total_price_set_shop_currency_code text,
    current_total_tax_set_pres_amount double precision,
    current_total_tax_set_pres_currency_code text,
    current_total_tax_set_shop_amount double precision,
    current_total_tax_set_shop_currency_code text,
    current_total_weight bigint,
    customer_accepts_marketing boolean,
    customer_journey_summary_customer_order_index bigint,
    customer_journey_summary_days_to_conversion bigint,
    customer_journey_summary_ready boolean,
    customer_locale text,
    discount_code text,
    display_financial_status text,
    display_fulfillment_status text,
    duties_included boolean,
    edited boolean,
    email text,
    estimated_taxes boolean,
    fulfillable boolean,
    fully_paid boolean,
    has_timeline_comment boolean,
    merchant_editable boolean,
    merchant_editable_errors jsonb,
    merchant_of_record_app_icon_alt_text text,
    merchant_of_record_app_icon_height bigint,
    merchant_of_record_app_icon_id bigint,
    merchant_of_record_app_icon_url text,
    merchant_of_record_app_icon_width bigint,
    merchant_of_record_app_id bigint,
    merchant_of_record_app_name text,
    "name" text,
    net_payment_set_pres_amount double precision,
    net_payment_set_pres_currency_code text,
    net_payment_set_shop_amount double precision,
    net_payment_set_shop_currency_code text,
    note text,
    original_total_additional_fees_set_pres_amount double precision,
    original_total_additional_fees_set_pres_currency_code text,
    original_total_additional_fees_set_shop_amount double precision,
    original_total_additional_fees_set_shop_currency_code text,
    original_total_duties_set_pres_amount double precision,
    original_total_duties_set_pres_currency_code text,
    original_total_duties_set_shop_amount double precision,
    original_total_duties_set_shop_currency_code text,
    original_total_price_set_pres_amount double precision,
    original_total_price_set_pres_currency_code text,
    original_total_price_set_shop_amount double precision,
    original_total_price_set_shop_currency_code text,
    payment_gateway_names jsonb,
    phone text,
    po_number text,
    presentment_currency_code text,
    processed_at timestamp,
    refund_discrepancy_set_pres_amount double precision,
    refund_discrepancy_set_pres_currency_code text,
    refund_discrepancy_set_shop_amount double precision,
    refund_discrepancy_set_shop_currency_code text,
    refundable boolean,
    registered_source_url text,
    requires_shipping boolean,
    restockable boolean,
    return_status text,
    shopify_protect_eligibility_status text,
    shopify_protect_status text,
    source_identifier text,
    source_name text,
    status_page_url text,
    subtotal_line_items_quantity bigint,
    subtotal_price_set_pres_amount double precision,
    subtotal_price_set_pres_currency_code text,
    subtotal_price_set_shop_amount double precision,
    subtotal_price_set_shop_currency_code text,
    tax_exempt boolean,
    taxes_included boolean,
    test boolean,
    total_capturable_set_pres_amount double precision,
    total_capturable_set_pres_currency_code text,
    total_capturable_set_shop_amount double precision,
    total_capturable_set_shop_currency_code text,
    total_cash_rounding_adj_payment_set_pres_amount double precision,
    total_cash_rounding_adj_payment_set_pres_currency_code text,
    total_cash_rounding_adj_payment_set_shop_amount double precision,
    total_cash_rounding_adj_payment_set_shop_currency_code text,
    total_cash_rounding_adj_refund_set_pres_amount double precision,
    total_cash_rounding_adj_refund_set_pres_currency_code text,
    total_cash_rounding_adj_refund_set_shop_amount double precision,
    total_cash_rounding_adj_refund_set_shop_currency_code text,
    total_discounts_set_pres_amount double precision,
    total_discounts_set_pres_currency_code text,
    total_discounts_set_shop_amount double precision,
    total_discounts_set_shop_currency_code text,
    total_outstanding_set_pres_amount double precision,
    total_outstanding_set_pres_currency_code text,
    total_outstanding_set_shop_amount double precision,
    total_outstanding_set_shop_currency_code text,
    total_price_set_pres_amount double precision,
    total_price_set_pres_currency_code text,
    total_price_set_shop_amount double precision,
    total_price_set_shop_currency_code text,
    total_received_set_pres_amount double precision,
    total_received_set_pres_currency_code text,
    total_received_set_shop_amount double precision,
    total_received_set_shop_currency_code text,
    total_refunded_set_pres_amount double precision,
    total_refunded_set_pres_currency_code text,
    total_refunded_set_shop_amount double precision,
    total_refunded_set_shop_currency_code text,
    total_refunded_shipping_set_pres_amount double precision,
    total_refunded_shipping_set_pres_currency_code text,
    total_refunded_shipping_set_shop_amount double precision,
    total_refunded_shipping_set_shop_currency_code text,
    total_shipping_price_set_pres_amount double precision,
    total_shipping_price_set_pres_currency_code text,
    total_shipping_price_set_shop_amount double precision,
    total_shipping_price_set_shop_currency_code text,
    total_tax_set_pres_amount double precision,
    total_tax_set_pres_currency_code text,
    total_tax_set_shop_amount double precision,
    total_tax_set_shop_currency_code text,
    total_tip_received_set_pres_amount double precision,
    total_tip_received_set_pres_currency_code text,
    total_tip_received_set_shop_amount double precision,
    total_tip_received_set_shop_currency_code text,
    total_weight bigint,
    unpaid boolean,
    updated_at timestamp,
    -- billing_address_* (dynamic column),
    -- display_address_* (dynamic column),
    -- merchant_business_entity_* (dynamic column),
    -- shipping_address_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (location_id) REFERENCES location(id),
    FOREIGN KEY (purchasing_entity_company_contact_id) REFERENCES company_contact(id),
    FOREIGN KEY (purchasing_entity_company_id) REFERENCES company(id),
    FOREIGN KEY (purchasing_entity_customer_id) REFERENCES customer(id),
    FOREIGN KEY (staff_member_id) REFERENCES staff_member(id)
);

CREATE TABLE product_option (
    id bigint,
    product_id bigint,
    linked_metafield_key text,
    linked_metafield_namespace text,
    "name" text,
    "position" bigint,
    values jsonb,
    PRIMARY KEY (id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE checkout_delivery_option_event (
    "index" bigint,
    event_id text,
    cost_after_discounts_amount double precision,
    cost_after_discounts_currency_code text,
    cost_amount double precision,
    cost_currency_code text,
    description text,
    handle text,
    title text,
    "type" text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES checkout_event(event_id)
);

CREATE TABLE catalog (
    id bigint,
    "status" text,
    title text,
    -- price_list_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE discount_automatic_free_shipping (
    id bigint,
    applies_on_one_time_purchase boolean,
    applies_on_subscription boolean,
    async_usage_count bigint,
    combines_with_order_discounts boolean,
    combines_with_product_discounts boolean,
    combines_with_shipping_discounts boolean,
    created_at timestamp,
    destination_selection_all_countries boolean,
    destination_selection_include_rest_of_world boolean,
    discount_class text,
    ends_at timestamp,
    has_timeline_comment boolean,
    maximum_shipping_price_amount double precision,
    maximum_shipping_price_currency_code text,
    minimum_requirement_greater_than_or_equal_to_quantity integer,
    minimum_requirement_gte_subtotal_amount double precision,
    minimum_requirement_gte_subtotal_currency_code text,
    recurring_cycle_limit bigint,
    short_summary text,
    starts_at timestamp,
    "status" text,
    summary text,
    title text,
    total_sales_amount double precision,
    total_sales_currency_code text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE ui_extension_errored_event (
    event_id text,
    api_version text,
    app_id bigint,
    app_name text,
    app_version text,
    event_client_id text,
    event_timestamp timestamp,
    extension_name text,
    extension_target text,
    message text,
    placement_reference text,
    trace text,
    "type" text,
    PRIMARY KEY (event_id)
);

CREATE TABLE staff_member (
    id bigint,
    account_type text,
    active boolean,
    email text,
    exists boolean,
    first_name text,
    initials jsonb,
    is_shop_owner boolean,
    last_name text,
    locale text,
    "name" text,
    phone text,
    -- avatar_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE "return" (
    id bigint,
    order_id bigint,
    decline_note text,
    decline_reason text,
    "name" text,
    return_shipping_fees jsonb,
    "status" text,
    total_quantity integer,
    PRIMARY KEY (id, order_id),
    FOREIGN KEY (order_id) REFERENCES "order"(id)
);

CREATE TABLE abandoned_checkout (
    id bigint,
    customer_id bigint,
    abandoned_checkout_url text,
    completed_at timestamp,
    created_at timestamp,
    "name" text,
    note text,
    subtotal_price_set_pres_amount double precision,
    subtotal_price_set_pres_currency_code text,
    subtotal_price_set_shop_amount double precision,
    subtotal_price_set_shop_currency_code text,
    taxes_included boolean,
    total_discount_set_pres_amount double precision,
    total_discount_set_pres_currency_code text,
    total_discount_set_shop_amount double precision,
    total_discount_set_shop_currency_code text,
    total_duties_set_pres_amount double precision,
    total_duties_set_pres_currency_code text,
    total_duties_set_shop_amount double precision,
    total_duties_set_shop_currency_code text,
    total_line_items_price_set_pres_amount double precision,
    total_line_items_price_set_pres_currency_code text,
    total_line_items_price_set_shop_amount double precision,
    total_line_items_price_set_shop_currency_code text,
    total_price_set_pres_amount double precision,
    total_price_set_pres_currency_code text,
    total_price_set_shop_amount double precision,
    total_price_set_shop_currency_code text,
    total_tax_set_pres_amount double precision,
    total_tax_set_pres_currency_code text,
    total_tax_set_shop_amount double precision,
    total_tax_set_shop_currency_code text,
    updated_at timestamp,
    -- billing_address_* (dynamic column),
    -- shipping_address_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE discount_shareable_url (
    discount_id bigint,
    discount_type text,
    "index" integer,
    target_type text,
    title text,
    url text,
    -- target_item_image_* (dynamic column),
    PRIMARY KEY (discount_id, discount_type, "index")
);

CREATE TABLE checkout_line_item_property_event (
    "key" text,
    checkout_line_item_id text,
    event_id text,
    "value" text,
    PRIMARY KEY ("key", checkout_line_item_id, event_id),
    FOREIGN KEY (checkout_line_item_id) REFERENCES checkout_line_item_event(event_id),
    FOREIGN KEY (event_id) REFERENCES checkout_event(event_id)
);

CREATE TABLE fulfillment_order (
    id bigint,
    order_id bigint,
    assigned_location_id bigint,
    destination_location_id bigint,
    assigned_location_address_1 text,
    assigned_location_address_2 text,
    assigned_location_city text,
    assigned_location_country_code text,
    assigned_location_name text,
    assigned_location_phone text,
    assigned_location_province text,
    assigned_location_zip text,
    channel_id bigint,
    created_at timestamp,
    destination_address_1 text,
    destination_address_2 text,
    destination_city text,
    destination_company text,
    destination_country_code text,
    destination_email text,
    destination_first_name text,
    destination_id bigint,
    destination_last_name text,
    destination_phone text,
    destination_province text,
    destination_zip text,
    fulfill_at timestamp,
    fulfill_by timestamp,
    international_duties_incoterm text,
    order_name text,
    order_processed_at timestamp,
    request_status text,
    "status" text,
    supported_actions jsonb,
    updated_at timestamp,
    -- delivery_method_* (dynamic column),
    PRIMARY KEY (id, order_id),
    FOREIGN KEY (order_id) REFERENCES "order"(id),
    FOREIGN KEY (assigned_location_id) REFERENCES location(id),
    FOREIGN KEY (destination_location_id) REFERENCES location(id)
);

CREATE TABLE fulfillment_event (
    id bigint,
    fulfillment_id bigint,
    address_1 text,
    city text,
    country text,
    created_at timestamp,
    estimated_delivery_at timestamp,
    happened_at timestamp,
    latitude text,
    longitude text,
    message text,
    province text,
    "status" text,
    zip text,
    PRIMARY KEY (id),
    FOREIGN KEY (fulfillment_id) REFERENCES fulfillment(id)
);

CREATE TABLE abandoned_checkout_discount_code (
    "index" bigint,
    checkout_id bigint,
    code text,
    PRIMARY KEY ("index", checkout_id),
    FOREIGN KEY (checkout_id) REFERENCES abandoned_checkout(id)
);

CREATE TABLE order_adjustment (
    id bigint,
    refund_id bigint,
    amount_set_pres_amount double precision,
    amount_set_pres_currency_code text,
    amount_set_shop_amount double precision,
    amount_set_shop_currency_code text,
    reason text,
    tax_amount_set_pres_amount double precision,
    tax_amount_set_pres_currency_code text,
    tax_amount_set_shop_amount double precision,
    tax_amount_set_shop_currency_code text,
    PRIMARY KEY (id),
    FOREIGN KEY (refund_id) REFERENCES refund(id)
);

CREATE TABLE order_shipping_line (
    id bigint,
    order_id bigint,
    carrier_identifier text,
    code text,
    current_discounted_price_set_pres_amount double precision,
    current_discounted_price_set_pres_currency_code text,
    current_discounted_price_set_shop_amount double precision,
    current_discounted_price_set_shop_currency_code text,
    custom boolean,
    delivery_category text,
    discounted_price_set_pres_amount double precision,
    discounted_price_set_pres_currency_code text,
    discounted_price_set_shop_amount double precision,
    discounted_price_set_shop_currency_code text,
    is_removed boolean,
    original_price_set_pres_amount double precision,
    original_price_set_pres_currency_code text,
    original_price_set_shop_amount double precision,
    original_price_set_shop_currency_code text,
    phone text,
    shipping_rate_handle text,
    "source" text,
    title text,
    PRIMARY KEY (id, order_id),
    FOREIGN KEY (order_id) REFERENCES "order"(id)
);

CREATE TABLE discount_customer_buys_product_variant (
    discount_id bigint,
    discount_resource text,
    product_variant_id bigint,
    PRIMARY KEY (discount_id, discount_resource, product_variant_id),
    FOREIGN KEY (product_variant_id) REFERENCES product_variant(id)
);

CREATE TABLE page_viewed_event (
    event_id text,
    context_document_location_href text,
    context_document_location_search text,
    event_client_id text,
    event_timestamp timestamp,
    PRIMARY KEY (event_id)
);

CREATE TABLE draft_order_tax_line (
    "index" bigint,
    draft_order_id bigint,
    channel_liable boolean,
    price_set_pres_amount double precision,
    price_set_pres_currency_code text,
    price_set_shop_amount double precision,
    price_set_shop_currency_code text,
    rate double precision,
    rate_percentage double precision,
    "source" text,
    title text,
    PRIMARY KEY ("index", draft_order_id),
    FOREIGN KEY (draft_order_id) REFERENCES draft_order(id)
);

CREATE TABLE bundle_component_variant (
    bundle_component_index bigint,
    component_variant_id bigint,
    product_id bigint,
    PRIMARY KEY (bundle_component_index, component_variant_id, product_id),
    FOREIGN KEY (bundle_component_index) REFERENCES bundle_component("index"),
    FOREIGN KEY (component_variant_id) REFERENCES product_variant(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE checkout_discount_application_event (
    "index" bigint,
    event_id text,
    allocation_method text,
    target_selection text,
    target_type text,
    title text,
    "type" text,
    value_amount double precision,
    value_currency_code text,
    value_percentage double precision,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES checkout_event(event_id)
);

CREATE TABLE discount_destination_selection_country (
    discount_id bigint,
    discount_type text,
    "index" integer,
    country_code text,
    PRIMARY KEY (discount_id, discount_type, "index")
);

CREATE TABLE order_line (
    id bigint,
    order_id bigint,
    product_id bigint,
    staff_member_id bigint,
    variant_id bigint,
    current_quantity bigint,
    discounted_total_set_pres_amount double precision,
    discounted_total_set_pres_currency_code text,
    discounted_total_set_shop_amount double precision,
    discounted_total_set_shop_currency_code text,
    discounted_unit_price_after_all_disc_set_pres_amount double precision,
    discounted_unit_price_after_all_disc_set_pres_currency_code text,
    discounted_unit_price_after_all_disc_set_shop_amount double precision,
    discounted_unit_price_after_all_disc_set_shop_currency_code text,
    discounted_unit_price_set_pres_amount double precision,
    discounted_unit_price_set_pres_currency_code text,
    discounted_unit_price_set_shop_amount double precision,
    discounted_unit_price_set_shop_currency_code text,
    is_gift_card boolean,
    merchant_editable boolean,
    "name" text,
    non_fulfillable_quantity bigint,
    original_total_set_pres_amount double precision,
    original_total_set_pres_currency_code text,
    original_total_set_shop_amount double precision,
    original_total_set_shop_currency_code text,
    original_unit_price_set_pres_amount double precision,
    original_unit_price_set_pres_currency_code text,
    original_unit_price_set_shop_amount double precision,
    original_unit_price_set_shop_currency_code text,
    quantity bigint,
    refundable_quantity bigint,
    requires_shipping boolean,
    restockable boolean,
    selling_plan_id bigint,
    selling_plan_name text,
    sku text,
    taxable boolean,
    title text,
    total_discount_set_pres_amount double precision,
    total_discount_set_pres_currency_code text,
    total_discount_set_shop_amount double precision,
    total_discount_set_shop_currency_code text,
    unfulfilled_discounted_total_set_pres_amount double precision,
    unfulfilled_discounted_total_set_pres_currency_code text,
    unfulfilled_discounted_total_set_shop_amount double precision,
    unfulfilled_discounted_total_set_shop_currency_code text,
    unfulfilled_original_total_set_pres_amount double precision,
    unfulfilled_original_total_set_pres_currency_code text,
    unfulfilled_original_total_set_shop_amount double precision,
    unfulfilled_original_total_set_shop_currency_code text,
    unfulfilled_quantity bigint,
    variant_title text,
    vendor text,
    -- image_* (dynamic column),
    -- line_item_group_* (dynamic column),
    PRIMARY KEY (id, order_id),
    FOREIGN KEY (order_id) REFERENCES "order"(id),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (staff_member_id) REFERENCES staff_member(id),
    FOREIGN KEY (variant_id) REFERENCES product_variant(id)
);

CREATE TABLE inventory_level (
    id bigint,
    inventory_item_id bigint,
    location_id bigint,
    can_deactivate boolean,
    created_at timestamp,
    deactivation_alert text,
    updated_at timestamp,
    PRIMARY KEY (id, inventory_item_id, location_id),
    FOREIGN KEY (inventory_item_id) REFERENCES inventory_item(id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE return_line_item (
    id bigint,
    return_id bigint,
    order_line_id bigint,
    customer_note text,
    quantity integer,
    refundable_quantity integer,
    refunded_quantity integer,
    return_reason text,
    return_reason_note text,
    PRIMARY KEY (id, return_id),
    FOREIGN KEY (return_id) REFERENCES "return"(id),
    FOREIGN KEY (order_line_id) REFERENCES order_line(id)
);

CREATE TABLE draft_order_line (
    id bigint,
    draft_order_id bigint,
    fulfillment_service_id text,
    product_id bigint,
    variant_id bigint,
    approximate_discounted_unit_price_set_pres_amount double precision,
    approximate_discounted_unit_price_set_pres_currency_code text,
    approximate_discounted_unit_price_set_shop_amount double precision,
    approximate_discounted_unit_price_set_shop_currency_code text,
    custom boolean,
    discounted_total_set_pres_amount double precision,
    discounted_total_set_pres_currency_code text,
    discounted_total_set_shop_amount double precision,
    discounted_total_set_shop_currency_code text,
    is_gift_card boolean,
    "name" text,
    original_total_set_pres_amount double precision,
    original_total_set_pres_currency_code text,
    original_total_set_shop_amount double precision,
    original_total_set_shop_currency_code text,
    original_unit_price_set_pres_amount double precision,
    original_unit_price_set_pres_currency_code text,
    original_unit_price_set_shop_amount double precision,
    original_unit_price_set_shop_currency_code text,
    original_unit_price_with_amount double precision,
    original_unit_price_with_currency_code text,
    price_override_amount double precision,
    price_override_currency_code text,
    quantity bigint,
    requires_shipping boolean,
    sku text,
    taxable boolean,
    title text,
    total_discount_set_pres_amount double precision,
    total_discount_set_pres_currency_code text,
    total_discount_set_shop_amount double precision,
    total_discount_set_shop_currency_code text,
    variant_title text,
    vendor text,
    weight_unit text,
    weight_value double precision,
    -- applied_discount_* (dynamic column),
    -- image_* (dynamic column),
    PRIMARY KEY (id, draft_order_id),
    FOREIGN KEY (draft_order_id) REFERENCES draft_order(id),
    FOREIGN KEY (fulfillment_service_id) REFERENCES fulfillment_service(id),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (variant_id) REFERENCES product_variant(id)
);

CREATE TABLE return_shipping_fee (
    id bigint,
    return_id bigint,
    amount_set_presentment_money_amount double precision,
    amount_set_presentment_money_currency_code text,
    amount_set_shop_money_amount double precision,
    amount_set_shop_money_currency_code text,
    PRIMARY KEY (id, return_id),
    FOREIGN KEY (return_id) REFERENCES "return"(id)
);

CREATE TABLE checkout_attribute_event (
    "key" text,
    event_id text,
    "value" text,
    PRIMARY KEY ("key", event_id),
    FOREIGN KEY (event_id) REFERENCES checkout_event(event_id)
);

CREATE TABLE product_removed_from_cart_event (
    event_id text,
    merchandise_id text,
    cost_amount double precision,
    cost_currency_code text,
    event_client_id text,
    event_timestamp timestamp,
    quantity integer,
    PRIMARY KEY (event_id),
    FOREIGN KEY (merchandise_id) REFERENCES product_variant(id)
);

CREATE TABLE product_tag (
    "index" bigint,
    product_id bigint,
    "value" text,
    PRIMARY KEY ("index", product_id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE order_risk_assessment (
    "index" integer,
    order_id bigint,
    provider bigint,
    risk_level text,
    PRIMARY KEY ("index", order_id),
    FOREIGN KEY (order_id) REFERENCES "order"(id)
);

CREATE TABLE discount_customer_gets_product (
    discount_id bigint,
    discount_resource text,
    product_id bigint,
    PRIMARY KEY (discount_id, discount_resource, product_id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE draft_order_line_custom_attribute (
    "key" text,
    draft_order_line_id bigint,
    draft_order_id bigint,
    "value" text,
    PRIMARY KEY ("key", draft_order_line_id),
    FOREIGN KEY (draft_order_line_id) REFERENCES draft_order_line(id),
    FOREIGN KEY (draft_order_id) REFERENCES draft_order(id)
);

CREATE TABLE customer_visit (
    id bigint,
    order_id bigint,
    landing_page text,
    landing_page_html text,
    occurred_at timestamp,
    referral_code text,
    referral_info_html text,
    referrer_url text,
    "source" text,
    source_description text,
    source_type text,
    "type" text,
    -- utm_parameters_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (order_id) REFERENCES "order"(id)
);

CREATE TABLE discount_automatic_basic (
    id bigint,
    async_usage_count bigint,
    combines_with_order_discounts boolean,
    combines_with_product_discounts boolean,
    combines_with_shipping_discounts boolean,
    created_at timestamp,
    discount_class text,
    ends_at timestamp,
    minimum_requirement_greater_than_or_equal_to_quantity integer,
    minimum_requirement_gte_subtotal_amount double precision,
    minimum_requirement_gte_subtotal_currency_code text,
    recurring_cycle_limit bigint,
    short_summary text,
    starts_at timestamp,
    "status" text,
    summary text,
    title text,
    updated_at timestamp,
    -- customer_gets_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE discount_application (
    "index" bigint,
    order_id bigint,
    allocation_method text,
    code text,
    description text,
    target_selection text,
    target_type text,
    title text,
    "type" text,
    value_amount double precision,
    value_currency_code text,
    value_percentage double precision,
    PRIMARY KEY ("index", order_id),
    FOREIGN KEY (order_id) REFERENCES "order"(id)
);

CREATE TABLE fulfillment_order_fulfillment_hold (
    id bigint,
    fulfillment_order_id bigint,
    display_reason text,
    handle text,
    held_by_requesting_app boolean,
    reason text,
    reason_notes text,
    PRIMARY KEY (id, fulfillment_order_id),
    FOREIGN KEY (fulfillment_order_id) REFERENCES fulfillment_order(id)
);

CREATE TABLE inventory_item (
    id bigint,
    country_code_of_origin text,
    created_at timestamp,
    duplicate_sku_count integer,
    harmonized_system_code text,
    inventory_history_url text,
    legacy_resource_id bigint,
    measurement_id bigint,
    measurement_weight_unit text,
    measurement_weight_value text,
    province_code_of_origin text,
    requires_shipping boolean,
    sku text,
    tracked boolean,
    tracked_editable_locked boolean,
    tracked_editable_reason text,
    unit_cost_amount double precision,
    unit_cost_currency_code text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE product (
    id bigint,
    compare_at_price_range_max_variant_compare_at_price_amount double precision,
    compare_at_price_range_max_variant_compare_at_price_currency_code text,
    compare_at_price_range_min_variant_compare_at_price_amount double precision,
    compare_at_price_range_min_variant_compare_at_price_currency_code text,
    created_at timestamp,
    description text,
    description_html text,
    featured_media_id bigint,
    gift_card_template_suffix text,
    handle text,
    has_only_default_variant boolean,
    has_out_of_stock_variants boolean,
    has_variants_that_requires_components boolean,
    is_gift_card boolean,
    legacy_resource_id bigint,
    max_variant_price_amount double precision,
    max_variant_price_currency_code text,
    metafield jsonb,
    min_variant_price_amount double precision,
    min_variant_price_currency_code text,
    online_store_preview_url text,
    product_type text,
    published_at timestamp,
    requires_selling_plan boolean,
    seo_description text,
    seo_title text,
    "status" text,
    template_suffix text,
    title text,
    total_inventory bigint,
    tracks_inventory boolean,
    updated_at timestamp,
    vendor text,
    -- category_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE order_line_tax_line (
    "index" bigint,
    order_line_id bigint,
    channel_liable boolean,
    price_set_pres_amount double precision,
    price_set_pres_currency_code text,
    price_set_shop_amount double precision,
    price_set_shop_currency_code text,
    rate double precision,
    rate_percentage double precision,
    "source" text,
    title text,
    PRIMARY KEY ("index", order_line_id),
    FOREIGN KEY (order_line_id) REFERENCES order_line(id)
);

CREATE TABLE draft_order (
    id bigint,
    customer_id bigint,
    order_id bigint,
    purchasing_entity_company_contact_id bigint,
    purchasing_entity_company_id bigint,
    purchasing_entity_customer_id bigint,
    accept_automatic_discounts boolean,
    all_variant_prices_overridden boolean,
    allow_discount_codes_in_checkout boolean,
    any_variant_prices_overridden boolean,
    completed_at timestamp,
    created_at timestamp,
    currency_code text,
    email text,
    has_timeline_comment boolean,
    invoice_email_template_subject text,
    invoice_sent_at timestamp,
    invoice_url text,
    line_items_subtotal_price_pres_amount double precision,
    line_items_subtotal_price_pres_currency_code text,
    line_items_subtotal_price_shop_amount double precision,
    line_items_subtotal_price_shop_currency_code text,
    "name" text,
    note text,
    phone text,
    po_number text,
    presentment_currency_code text,
    ready boolean,
    reserve_inventory_until timestamp,
    "status" text,
    subtotal_price_set_pres_amount double precision,
    subtotal_price_set_pres_currency_code text,
    subtotal_price_set_shop_amount double precision,
    subtotal_price_set_shop_currency_code text,
    tax_exempt boolean,
    taxes_included boolean,
    total_discounts_set_pres_amount double precision,
    total_discounts_set_pres_currency_code text,
    total_discounts_set_shop_amount double precision,
    total_discounts_set_shop_currency_code text,
    total_line_items_price_set_pres_amount double precision,
    total_line_items_price_set_pres_currency_code text,
    total_line_items_price_set_shop_amount double precision,
    total_line_items_price_set_shop_currency_code text,
    total_price_set_pres_amount double precision,
    total_price_set_pres_currency_code text,
    total_price_set_shop_amount double precision,
    total_price_set_shop_currency_code text,
    total_quantity_of_line_items bigint,
    total_shipping_price_set_pres_amount double precision,
    total_shipping_price_set_pres_currency_code text,
    total_shipping_price_set_shop_amount double precision,
    total_shipping_price_set_shop_currency_code text,
    total_tax_set_pres_amount double precision,
    total_tax_set_pres_currency_code text,
    total_tax_set_shop_amount double precision,
    total_tax_set_shop_currency_code text,
    total_weight bigint,
    updated_at timestamp,
    visible_to_customer boolean,
    -- applied_discount_* (dynamic column),
    -- billing_address_* (dynamic column),
    -- shipping_address_* (dynamic column),
    -- shipping_line_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (order_id) REFERENCES "order"(id),
    FOREIGN KEY (purchasing_entity_company_contact_id) REFERENCES company_contact(id),
    FOREIGN KEY (purchasing_entity_company_id) REFERENCES company(id),
    FOREIGN KEY (purchasing_entity_customer_id) REFERENCES customer(id)
);

CREATE TABLE product_viewed_event (
    event_id text,
    product_variant_id bigint,
    event_client_id text,
    event_timestamp timestamp,
    PRIMARY KEY (event_id),
    FOREIGN KEY (product_variant_id) REFERENCES product_variant(id)
);

CREATE TABLE model_3_d (
    media_id bigint,
    bounding_box_size_x double precision,
    bounding_box_size_y double precision,
    bounding_box_size_z double precision,
    file_name text,
    -- original_source_* (dynamic column),
    PRIMARY KEY (media_id),
    FOREIGN KEY (media_id) REFERENCES media(id)
);

CREATE TABLE customer_tag (
    "index" bigint,
    customer_id bigint,
    "value" text,
    PRIMARY KEY ("index", customer_id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE order_custom_attribute (
    "key" text,
    order_id bigint,
    "value" text,
    PRIMARY KEY ("key", order_id),
    FOREIGN KEY (order_id) REFERENCES "order"(id)
);

CREATE TABLE discount_customer_gets_product_variant (
    discount_id bigint,
    discount_resource text,
    product_variant_id bigint,
    PRIMARY KEY (discount_id, discount_resource, product_variant_id),
    FOREIGN KEY (product_variant_id) REFERENCES product_variant(id)
);

CREATE TABLE sale_tax (
    id bigint,
    sale_id bigint,
    pres_amount double precision,
    pres_currency_code text,
    shop_amount double precision,
    shop_currency_code text,
    -- tax_line_* (dynamic column),
    PRIMARY KEY (id, sale_id),
    FOREIGN KEY (sale_id) REFERENCES sale(id)
);

CREATE TABLE checkout_line_item_discount_allocation_event (
    "index" bigint,
    checkout_line_item_id text,
    event_id text,
    amount double precision,
    currency_code text,
    -- discount_application_* (dynamic column),
    PRIMARY KEY ("index", checkout_line_item_id, event_id),
    FOREIGN KEY (checkout_line_item_id) REFERENCES checkout_line_item_event(event_id),
    FOREIGN KEY (event_id) REFERENCES checkout_event(event_id)
);

CREATE TABLE bundle_component (
    "index" bigint,
    product_id bigint,
    component_product_id bigint,
    quantity_option_parent_option_id bigint,
    quantity bigint,
    quantity_option_name text,
    quantity_option_values jsonb,
    PRIMARY KEY ("index", product_id),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (component_product_id) REFERENCES product(id),
    FOREIGN KEY (quantity_option_parent_option_id) REFERENCES product_option(id)
);

CREATE TABLE customer_segment (
    id bigint,
    created_at timestamp,
    "name" text,
    query text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE draft_order_line_tax_line (
    "index" bigint,
    draft_order_line_id bigint,
    draft_order_id bigint,
    channel_liable boolean,
    price_set_pres_amount double precision,
    price_set_pres_currency_code text,
    price_set_shop_amount double precision,
    price_set_shop_currency_code text,
    rate double precision,
    rate_percentage double precision,
    "source" text,
    title text,
    PRIMARY KEY ("index", draft_order_line_id),
    FOREIGN KEY (draft_order_line_id) REFERENCES draft_order_line(id),
    FOREIGN KEY (draft_order_id) REFERENCES draft_order(id)
);

CREATE TABLE draft_order_tag (
    "index" bigint,
    draft_order_id bigint,
    "value" text,
    PRIMARY KEY ("index", draft_order_id),
    FOREIGN KEY (draft_order_id) REFERENCES draft_order(id)
);

CREATE TABLE video (
    media_id bigint,
    duration integer,
    file_name text,
    -- original_source_* (dynamic column),
    PRIMARY KEY (media_id),
    FOREIGN KEY (media_id) REFERENCES media(id)
);

CREATE TABLE collection_product (
    collection_id bigint,
    product_id bigint,
    PRIMARY KEY (collection_id, product_id),
    FOREIGN KEY (collection_id) REFERENCES collection(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE fulfillment (
    id bigint,
    location_id bigint,
    order_id bigint,
    service_id text,
    created_at timestamp,
    delivered_at timestamp,
    display_status text,
    estimated_delivery_at timestamp,
    in_transit_at timestamp,
    "name" text,
    requires_shipping boolean,
    "status" text,
    total_quantity integer,
    updated_at timestamp,
    -- origin_address_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (location_id) REFERENCES location(id),
    FOREIGN KEY (order_id) REFERENCES "order"(id),
    FOREIGN KEY (service_id) REFERENCES fulfillment_service(id)
);
