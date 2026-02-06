CREATE TABLE purchase_cost (
    "index" text,
    purchase_id text,
    cost double precision,
    "name" text,
    quantity bigint,
    PRIMARY KEY ("index", purchase_id),
    FOREIGN KEY (purchase_id) REFERENCES purchase(id)
);

CREATE TABLE purchase_line_item (
    id text,
    purchase_id text,
    location_id text,
    sku text,
    "name" text,
    price double precision,
    quantity bigint,
    received_quantity bigint,
    routed boolean,
    shipped_quantity bigint,
    upc text,
    PRIMARY KEY (id, purchase_id),
    FOREIGN KEY (purchase_id) REFERENCES purchase(id),
    FOREIGN KEY (location_id) REFERENCES location(id),
    FOREIGN KEY (sku) REFERENCES product(sku)
);

CREATE TABLE purchase (
    id text,
    billing_address_email text,
    external_order_id text,
    integration_id text,
    organization_key text,
    to_location_id text,
    vendor_address_email text,
    actual_arrival_date timestamp,
    billing_address_first_name text,
    billing_address_last_name text,
    created_at timestamp,
    currency text,
    employee_name text,
    expected_arrival_date timestamp,
    incoterms text,
    purchase_notes text,
    purchase_order_date timestamp,
    purchase_tax double precision,
    reference_number text,
    ship_by_date timestamp,
    shipping_carrier text,
    shipping_notes text,
    shipping_service text,
    "status" text,
    sub_total_price double precision,
    time_stamp timestamp,
    to_address_first_name text,
    to_address_last_name text,
    total_price double precision,
    updated_at timestamp,
    vendor_address_first_name text,
    vendor_address_last_name text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (billing_address_email) REFERENCES location(email),
    FOREIGN KEY (external_order_id) REFERENCES orders(id),
    FOREIGN KEY (integration_id) REFERENCES integration(id),
    FOREIGN KEY (organization_key) REFERENCES organization(organization_key),
    FOREIGN KEY (to_location_id) REFERENCES location(id),
    FOREIGN KEY (vendor_address_email) REFERENCES location(email)
);

CREATE TABLE account_integration (
    account_user_id text,
    integration_id text,
    PRIMARY KEY (account_user_id, integration_id),
    FOREIGN KEY (account_user_id) REFERENCES account(user_id),
    FOREIGN KEY (integration_id) REFERENCES integration(id)
);

CREATE TABLE account_role_id (
    role_id text,
    account_user_id text,
    id text,
    PRIMARY KEY (role_id, account_user_id),
    FOREIGN KEY (account_user_id) REFERENCES account(user_id),
    FOREIGN KEY (id) REFERENCES "role"(id)
);

CREATE TABLE account_payment_sale_discount_code (
    sales_discount_code text,
    account_user_id text,
    PRIMARY KEY (sales_discount_code, account_user_id),
    FOREIGN KEY (account_user_id) REFERENCES account(user_id)
);

CREATE TABLE account (
    user_id text,
    organization_key text,
    activation_key text,
    billingamount double precision,
    billingbase_period text,
    billingcharge_enterprise_support boolean,
    billingdeleted_at timestamp,
    billingeffective_plan text,
    billingnote text,
    billingoverage_amount double precision,
    billingoverage_period text,
    billingpaused_at timestamp,
    billingplan text,
    billingquota double precision,
    billingrenewal_date timestamp,
    billingsource text,
    billingstart_date timestamp,
    billingstatus text,
    branding_copyright text,
    branding_logo_url text,
    branding_privacy_url text,
    created_at timestamp,
    expiration_date timestamp,
    is_multi_organization_allowed boolean,
    is_rebranding_allowed boolean,
    payment_expiration_date timestamp,
    pricing_id text,
    secondary_organization_limit bigint,
    "status" text,
    updated_at timestamp,
    PRIMARY KEY (user_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (organization_key) REFERENCES organization(organization_key)
);

CREATE TABLE inventory (
    _fivetran_id text,
    integration_id text,
    location_id text,
    order_id text,
    organization_key text,
    sku text,
    "user" text,
    available bigint,
    available_to_promise bigint,
    commit_ship bigint,
    commit_transferred bigint,
    committed bigint,
    committed_future bigint,
    created_at timestamp,
    entity_id text,
    entity_type text,
    event text,
    future bigint,
    id text,
    incoming bigint,
    on_hand bigint,
    order_type text,
    quantity bigint,
    "status" text,
    unavailable bigint,
    updated_at timestamp,
    user_id text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (integration_id) REFERENCES integration(id),
    FOREIGN KEY (location_id) REFERENCES location(id),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (organization_key) REFERENCES organization(organization_key),
    FOREIGN KEY (sku) REFERENCES product(sku),
    FOREIGN KEY ("user") REFERENCES users(id)
);

CREATE TABLE transfer_line_item (
    id text,
    transfer_id text,
    location_id text,
    "name" text,
    quantity bigint,
    received_quantity bigint,
    routed boolean,
    shipped_quantity bigint,
    sku text,
    upc text,
    PRIMARY KEY (id, transfer_id),
    FOREIGN KEY (transfer_id) REFERENCES transfer(id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE transfer (
    id text,
    from_location_id text,
    integration_id text,
    organization_key text,
    to_location_id text,
    actual_arrival_date timestamp,
    created_at timestamp,
    employee_name text,
    expected_arrival_date timestamp,
    expected_ship_date timestamp,
    external_order_id text,
    incoterms text,
    order_source_type text,
    ship_by_date timestamp,
    shipping_carrier text,
    shipping_notes text,
    shipping_service text,
    "status" text,
    time_stamp text,
    to_address_first_name text,
    to_address_last_name text,
    transfer_notes text,
    transfer_order_date timestamp,
    updated_at timestamp,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (from_location_id) REFERENCES location(id),
    FOREIGN KEY (integration_id) REFERENCES integration(id),
    FOREIGN KEY (organization_key) REFERENCES organization(organization_key),
    FOREIGN KEY (to_location_id) REFERENCES location(id)
);

CREATE TABLE product_published (
    "index" text,
    product_id text,
    integration_id text,
    buffer_inventory bigint,
    external_product_id text,
    inventory_not_tracked boolean,
    "name" text,
    sku text,
    "status" text,
    updated_at timestamp,
    PRIMARY KEY ("index", product_id),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (integration_id) REFERENCES integration(id)
);

CREATE TABLE product_bundle_item (
    sku text,
    product_id text,
    quantity bigint,
    PRIMARY KEY (sku, product_id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE product_variant_option (
    "index" text,
    product_id text,
    "name" text,
    "value" text,
    PRIMARY KEY ("index", product_id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE product_price (
    "index" text,
    product_id text,
    currency text,
    "name" text,
    "value" double precision,
    PRIMARY KEY ("index", product_id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE product_image_url (
    image_url text,
    product_id text,
    PRIMARY KEY (image_url, product_id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE product_tag (
    "index" text,
    product_id text,
    tags text,
    PRIMARY KEY ("index", product_id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE product_type (
    "type" text,
    product_id text,
    PRIMARY KEY ("type", product_id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE product (
    id text,
    integration_id text,
    mapped_product_integration_id text,
    organization_key text,
    cost double precision,
    cost_currency text,
    country_of_origin text,
    created_at timestamp,
    description text,
    dimensions_unit text,
    external_product_api_id text,
    external_product_created_at timestamp,
    external_product_id text,
    external_product_updated_at timestamp,
    harmonized_code text,
    height double precision,
    hide_in_store boolean,
    inventory_not_tracked boolean,
    length double precision,
    mapped_product_buffer_inventory bigint,
    mapped_product_external_product_id text,
    mapped_product_inventory_not_tracked boolean,
    mapped_product_name text,
    mapped_product_sku text,
    mapped_product_status text,
    mapped_product_updated_at timestamp,
    "name" text,
    parent_external_product_id text,
    part_id text,
    sku text,
    "status" text,
    taxable boolean,
    upc text,
    updated_at timestamp,
    vendor text,
    weight double precision,
    weight_unit text,
    width double precision,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (integration_id) REFERENCES integration(id),
    FOREIGN KEY (mapped_product_integration_id) REFERENCES integration(id),
    FOREIGN KEY (organization_key) REFERENCES organization(organization_key)
);

CREATE TABLE order_additional_charge (
    line_item_id text,
    orders_id text,
    label text,
    reference text,
    "type" text,
    "value" double precision,
    PRIMARY KEY (line_item_id, orders_id),
    FOREIGN KEY (line_item_id) REFERENCES order_line_item(id),
    FOREIGN KEY (orders_id) REFERENCES orders(id)
);

CREATE TABLE order_discount (
    "index" text,
    orders_id text,
    line_item_id text,
    label text,
    reference text,
    "type" text,
    "value" double precision,
    PRIMARY KEY ("index", orders_id),
    FOREIGN KEY (orders_id) REFERENCES orders(id),
    FOREIGN KEY (line_item_id) REFERENCES order_line_item(id)
);

CREATE TABLE order_payment (
    "index" text,
    orders_id text,
    amount double precision,
    conversion bigint,
    currency text,
    custom_method text,
    kind text,
    method text,
    reference text,
    "status" text,
    PRIMARY KEY ("index", orders_id),
    FOREIGN KEY (orders_id) REFERENCES orders(id)
);

CREATE TABLE order_line_item (
    id text,
    orders_id text,
    location_id text,
    sku text,
    item_discount double precision,
    item_price double precision,
    item_tax double precision,
    "name" text,
    quantity bigint,
    requires_shipping boolean,
    routed boolean,
    taxable boolean,
    -- custom_* (dynamic column),
    PRIMARY KEY (id, orders_id),
    FOREIGN KEY (orders_id) REFERENCES orders(id),
    FOREIGN KEY (location_id) REFERENCES location(id),
    FOREIGN KEY (sku) REFERENCES product(sku)
);

CREATE TABLE order_tag (
    "index" text,
    orders_id text,
    tags text,
    PRIMARY KEY ("index", orders_id),
    FOREIGN KEY (orders_id) REFERENCES orders(id)
);

CREATE TABLE orders (
    id text,
    billing_address_email text,
    customer_id text,
    integration_id text,
    location_id text,
    organization_key text,
    shipping_address_email text,
    billing_address_first_name text,
    billing_address_last_name text,
    created_at timestamp,
    currency text,
    expected_delivery_date timestamp,
    external_order_api_id text,
    external_order_created_at timestamp,
    external_order_id text,
    external_order_updated_at timestamp,
    external_order_url text,
    fulfillment_status text,
    gift_note text,
    incoterms text,
    order_discount double precision,
    order_note text,
    order_source text,
    order_source_type text,
    order_tax double precision,
    payment_status text,
    require_shipping_labels boolean,
    routing_status text,
    ship_after_date timestamp,
    ship_by_date timestamp,
    ship_cancel_by_date timestamp,
    shipping_address_first_name text,
    shipping_address_last_name text,
    shipping_carrier text,
    shipping_class text,
    shipping_code text,
    shipping_note text,
    shipping_price double precision,
    "status" text,
    sub_total_price double precision,
    time_stamp timestamp,
    total_price double precision,
    updated_at timestamp,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (billing_address_email) REFERENCES location(email),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (integration_id) REFERENCES integration(id),
    FOREIGN KEY (location_id) REFERENCES location(id),
    FOREIGN KEY (organization_key) REFERENCES organization(organization_key),
    FOREIGN KEY (shipping_address_email) REFERENCES location(email)
);

CREATE TABLE label (
    id text,
    organization_key text,
    tracking_number text,
    content_type text,
    created_at timestamp,
    file_name text,
    label_type text,
    shipping_method text,
    "status" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (organization_key) REFERENCES organization(organization_key),
    FOREIGN KEY (tracking_number) REFERENCES tracking(tracking_number)
);

CREATE TABLE customer (
    id text,
    billing_email text,
    organization_key text,
    shipping_email text,
    company text,
    created_at timestamp,
    display_name text,
    email text,
    external_customer_id text,
    first_name text,
    last_name text,
    phone text,
    "status" text,
    updated_at timestamp,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (billing_email) REFERENCES location(email),
    FOREIGN KEY (organization_key) REFERENCES organization(organization_key),
    FOREIGN KEY (shipping_email) REFERENCES location(email)
);

CREATE TABLE mapping_attribute (
    _fivetran_id text,
    mapping_id text,
    defaults jsonb,
    enabled boolean,
    lookup jsonb,
    missing text,
    "name" text,
    require text,
    "source" text,
    target text,
    "type" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (mapping_id) REFERENCES mapping(id)
);

CREATE TABLE mapping (
    id text,
    connector_id text,
    organization_key text,
    created_at timestamp,
    description text,
    is_public boolean,
    origin_id text,
    updated_at timestamp,
    uuid text,
    PRIMARY KEY (id),
    FOREIGN KEY (connector_id) REFERENCES connector(id),
    FOREIGN KEY (organization_key) REFERENCES organization(organization_key)
);

CREATE TABLE user_role (
    "role" text,
    users_id text,
    PRIMARY KEY ("role", users_id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    email text,
    organization_key text,
    created_at timestamp,
    description text,
    last_ip_address text,
    last_login timestamp,
    logins_count bigint,
    "name" text,
    phone text,
    "status" text,
    time_zone text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (email) REFERENCES location(email),
    FOREIGN KEY (organization_key) REFERENCES organization(organization_key)
);

CREATE TABLE connector_entity (
    "index" text,
    connector_id text,
    mapping_uuid text,
    routing_uuid text,
    direction text,
    "name" text,
    "path" jsonb,
    PRIMARY KEY ("index", connector_id),
    FOREIGN KEY (connector_id) REFERENCES connector(id),
    FOREIGN KEY (mapping_uuid) REFERENCES mapping(uuid),
    FOREIGN KEY (routing_uuid) REFERENCES routing(uuid)
);

CREATE TABLE connector_action_field (
    _fivetran_id text,
    connector_id text,
    groups text,
    options_common boolean,
    options_component text,
    options_default_value jsonb,
    options_end_adornment text,
    options_extra jsonb,
    options_fields jsonb,
    options_genkey text,
    options_group text,
    options_helper_text text,
    options_hidden boolean,
    options_label text,
    options_place_holder text,
    options_read_me text,
    options_read_only boolean,
    options_start_adornment text,
    options_wizard boolean,
    "path" text,
    secret boolean,
    "type" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (connector_id) REFERENCES connector_action(connector_id)
);

CREATE TABLE connector_action (
    _fivetran_id text,
    connector_id text,
    action_name text,
    action_type text,
    description text,
    verb text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (connector_id) REFERENCES connector(id)
);

CREATE TABLE connector (
    id text,
    organization_key text,
    availability_status text,
    capability jsonb,
    connection_type text,
    connection_url text,
    connector_name text,
    connector_type text,
    created_at timestamp,
    description text,
    display_name text,
    intent_name text,
    intent_rank bigint,
    intent_show boolean,
    is_public boolean,
    logo_url text,
    organization_unique boolean,
    organization_wide_access boolean,
    pricing_category text,
    rank bigint,
    read_me text,
    self_service_mode text,
    slug text,
    "status" text,
    updated_at timestamp,
    version text,
    webhook_topics jsonb,
    webhook_url text,
    PRIMARY KEY (id),
    FOREIGN KEY (organization_key) REFERENCES organization(organization_key)
);

CREATE TABLE connector_field (
    _fivetran_id text,
    connector_id text,
    groups text,
    options jsonb,
    options_common boolean,
    options_component text,
    options_default_value jsonb,
    options_end_adornment text,
    options_extra jsonb,
    options_fields jsonb,
    options_genkey text,
    options_group text,
    options_helper_text text,
    options_hidden boolean,
    options_label text,
    options_place_holder text,
    options_read_me text,
    options_read_only boolean,
    options_start_adornment text,
    options_wizard boolean,
    "path" text,
    secret boolean,
    "status" text,
    "type" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (connector_id) REFERENCES connector(id)
);

CREATE TABLE location_external_system (
    "index" text,
    location_id text,
    integration_id text,
    location_value text,
    PRIMARY KEY ("index", location_id),
    FOREIGN KEY (location_id) REFERENCES location(id),
    FOREIGN KEY (integration_id) REFERENCES integration(id)
);

CREATE TABLE location (
    id text,
    integration_id text,
    organization_key text,
    address_1 text,
    address_2 text,
    city text,
    company text,
    country text,
    created_at timestamp,
    email text,
    exclude_from_totals boolean,
    fulfillment_integration_id text,
    infinite boolean,
    inventory_integration_id text,
    merged_with_location_id text,
    "name" text,
    phone text,
    preserve_bundles boolean,
    state_or_province text,
    "status" text,
    updated_at timestamp,
    zip_code_or_postal_code text,
    PRIMARY KEY (id),
    FOREIGN KEY (integration_id) REFERENCES integration(id),
    FOREIGN KEY (organization_key) REFERENCES organization(organization_key)
);

CREATE TABLE routing (
    id text,
    organization_key text,
    created_at timestamp,
    description text,
    enabled boolean,
    filter text,
    is_public boolean,
    updated_at timestamp,
    uuid text,
    PRIMARY KEY (id),
    FOREIGN KEY (organization_key) REFERENCES organization(organization_key)
);

CREATE TABLE shipment_line_item (
    id text,
    shipment_id text,
    sku text,
    bundle_quantity bigint,
    bundle_sku text,
    item_price double precision,
    "name" text,
    quantity bigint,
    shipped_quantity bigint,
    -- custom_* (dynamic column),
    PRIMARY KEY (id, shipment_id),
    FOREIGN KEY (shipment_id) REFERENCES shipment(id),
    FOREIGN KEY (sku) REFERENCES product(sku)
);

CREATE TABLE shipment_shipping_label (
    shipping_label text,
    shipment_id text,
    PRIMARY KEY (shipping_label, shipment_id),
    FOREIGN KEY (shipment_id) REFERENCES shipment(id)
);

CREATE TABLE shipment_tag (
    "index" text,
    shipment_id text,
    tags text,
    PRIMARY KEY ("index", shipment_id),
    FOREIGN KEY (shipment_id) REFERENCES shipment(id)
);

CREATE TABLE shipment (
    id text,
    integration_id text,
    location_id text,
    order_id text,
    order_type text,
    organization_key text,
    created_at timestamp,
    expected_delivery_date timestamp,
    expected_ship_date timestamp,
    external_order_id text,
    external_reference_id text,
    external_reference_url text,
    external_shipment_id text,
    fulfillment_integration_id text,
    gift_note text,
    incoterms text,
    order_create_time text,
    sent_to_fulfillment_at timestamp,
    ship_after_date timestamp,
    ship_by_date timestamp,
    ship_cancel_by_date timestamp,
    shipping_address_first_name text,
    shipping_address_last_name text,
    shipping_carrier text,
    shipping_class text,
    shipping_code text,
    shipping_method_mapping boolean,
    shipping_note text,
    "status" text,
    updated_at timestamp,
    version bigint,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (integration_id) REFERENCES integration(id),
    FOREIGN KEY (location_id) REFERENCES location(id),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (order_type) REFERENCES inventory(order_type),
    FOREIGN KEY (organization_key) REFERENCES organization(organization_key)
);

CREATE TABLE fulfillment_line_item (
    fulfillment_id text,
    sku text,
    unique_id text,
    bundle_quantity bigint,
    bundle_quantity_partial jsonb,
    bundle_sku text,
    quantity bigint,
    PRIMARY KEY (fulfillment_id, sku),
    FOREIGN KEY (fulfillment_id) REFERENCES fulfillment(id),
    FOREIGN KEY (sku) REFERENCES product(sku),
    FOREIGN KEY (unique_id) REFERENCES shipment_line_item(id)
);

CREATE TABLE fulfillment_tracking_number (
    tracking_number text,
    fulfillment_id text,
    PRIMARY KEY (tracking_number, fulfillment_id),
    FOREIGN KEY (fulfillment_id) REFERENCES fulfillment(id)
);

CREATE TABLE fulfillment_tracking_url (
    tracking_url text,
    fulfillment_id text,
    PRIMARY KEY (tracking_url, fulfillment_id),
    FOREIGN KEY (fulfillment_id) REFERENCES fulfillment(id)
);

CREATE TABLE fulfillment (
    id text,
    integration_id text,
    location_id text,
    organization_key text,
    shipment_id text,
    actual_ship_date timestamp,
    created_at timestamp,
    expected_arrival_date timestamp,
    external_fulfillment_id text,
    external_order_id text,
    shipping_carrier text,
    shipping_charge double precision,
    shipping_class text,
    updated_at timestamp,
    weight double precision,
    weight_unit text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (integration_id) REFERENCES integration(id),
    FOREIGN KEY (location_id) REFERENCES location(id),
    FOREIGN KEY (organization_key) REFERENCES organization(organization_key),
    FOREIGN KEY (shipment_id) REFERENCES shipment(id)
);

CREATE TABLE supplier_contact (
    email text,
    supplier_id text,
    organization_key text,
    first_name text,
    last_name text,
    phone text,
    PRIMARY KEY (email, supplier_id),
    FOREIGN KEY (supplier_id) REFERENCES supplier(id),
    FOREIGN KEY (organization_key) REFERENCES organization(organization_key)
);

CREATE TABLE supplier (
    id text,
    organization_key text,
    address_address_1 text,
    address_address_2 text,
    address_city text,
    address_country text,
    address_state_or_province text,
    address_zip_code_or_postal_code text,
    created_at timestamp,
    "name" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (organization_key) REFERENCES organization(organization_key)
);

CREATE TABLE organization_setting (
    "index" text,
    organization_key text,
    "path" text,
    "type" text,
    "value" jsonb,
    PRIMARY KEY ("index", organization_key),
    FOREIGN KEY (organization_key) REFERENCES organization(organization_key)
);

CREATE TABLE organization (
    organization_key text,
    account_id text,
    email text,
    branding_copyright text,
    branding_logo_url text,
    branding_privacy_url text,
    created_at timestamp,
    is_holding_organization boolean,
    logo_url text,
    "name" text,
    organization_mode text,
    phone text,
    "status" text,
    tier text,
    time_zone text,
    updated_at timestamp,
    PRIMARY KEY (organization_key),
    FOREIGN KEY (account_id) REFERENCES account(user_id),
    FOREIGN KEY (email) REFERENCES location(email)
);

CREATE TABLE "role" (
    id text,
    organization_key text,
    created_at timestamp,
    description text,
    is_public boolean,
    "name" text,
    "status" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (organization_key) REFERENCES organization(organization_key)
);

CREATE TABLE arrival_line_item (
    id text,
    arrival_id text,
    unique_id text,
    "name" text,
    quantity bigint,
    received_quantity bigint,
    sku text,
    upc text,
    PRIMARY KEY (id, arrival_id),
    FOREIGN KEY (arrival_id) REFERENCES arrival(id),
    FOREIGN KEY (unique_id) REFERENCES receipt_line_item(id)
);

CREATE TABLE arrival (
    id text,
    from_location_id text,
    fulfillment_id text,
    integration_id text,
    organization_key text,
    purchase_id text,
    to_location_id text,
    transfer_id text,
    created_at timestamp,
    expected_arrival_date timestamp,
    external_arrival_id text,
    external_order_id text,
    incoterms text,
    sender_name text,
    shipping_carrier text,
    shipping_method text,
    shipping_note text,
    "status" text,
    total_weight text,
    updated_at timestamp,
    weight_unit text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (from_location_id) REFERENCES location(id),
    FOREIGN KEY (fulfillment_id) REFERENCES fulfillment(id),
    FOREIGN KEY (integration_id) REFERENCES integration(id),
    FOREIGN KEY (organization_key) REFERENCES organization(organization_key),
    FOREIGN KEY (purchase_id) REFERENCES purchase(id),
    FOREIGN KEY (to_location_id) REFERENCES location(id),
    FOREIGN KEY (transfer_id) REFERENCES transfer(id)
);

CREATE TABLE inventory_rule (
    id text,
    integration_id text,
    organization_key text,
    created_at timestamp,
    description text,
    event text,
    partner text,
    ptype text,
    rule text,
    "status" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (integration_id) REFERENCES integration(id),
    FOREIGN KEY (organization_key) REFERENCES organization(organization_key)
);

CREATE TABLE receipt_line_item (
    id text,
    receipt_id text,
    quantity bigint,
    sku text,
    PRIMARY KEY (id, receipt_id),
    FOREIGN KEY (receipt_id) REFERENCES receipt(id)
);

CREATE TABLE receipt (
    id text,
    arrival_id text,
    integration_id text,
    organization_key text,
    created_at timestamp,
    currency text,
    external_order_id text,
    external_receipt_id text,
    shipping_carrier text,
    shipping_class text,
    updated_at timestamp,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (arrival_id) REFERENCES arrival(id),
    FOREIGN KEY (integration_id) REFERENCES integration(id),
    FOREIGN KEY (organization_key) REFERENCES organization(organization_key)
);

CREATE TABLE tracking (
    id text,
    fulfillment_id text,
    organization_key text,
    actual_arrival_date timestamp,
    actual_ship_date timestamp,
    created_at timestamp,
    expected_arrival_date timestamp,
    shipping_carrier text,
    "status" text,
    tracking_number text,
    updated_at timestamp,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (fulfillment_id) REFERENCES fulfillment(id),
    FOREIGN KEY (organization_key) REFERENCES organization(organization_key)
);

CREATE TABLE shipping_method_mapped_method (
    method_id text,
    shipping_method_id text,
    PRIMARY KEY (method_id, shipping_method_id),
    FOREIGN KEY (shipping_method_id) REFERENCES shipping_method(id)
);

CREATE TABLE shipping_method (
    id text,
    integration_id text,
    organization_key text,
    created_at timestamp,
    description text,
    external_method_id text,
    is_default boolean,
    is_passthrough boolean,
    "name" text,
    shipping_carrier text,
    shipping_code text,
    shipping_service text,
    source_integration_id text,
    source_type text,
    "status" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (integration_id) REFERENCES integration(id),
    FOREIGN KEY (organization_key) REFERENCES organization(organization_key)
);

CREATE TABLE integration_entity_restriction (
    _fivetran_id text,
    integration_id text,
    "path" text,
    "type" text,
    "value" jsonb,
    PRIMARY KEY (_fivetran_id, integration_id),
    FOREIGN KEY (integration_id) REFERENCES integration_entity(integration_id)
);

CREATE TABLE integration_entity (
    _fivetran_id text,
    integration_id text,
    mapping_uuid text,
    routing_uuid text,
    direction text,
    "name" text,
    PRIMARY KEY (_fivetran_id, integration_id),
    FOREIGN KEY (integration_id) REFERENCES integration(id),
    FOREIGN KEY (mapping_uuid) REFERENCES mapping(uuid),
    FOREIGN KEY (routing_uuid) REFERENCES routing(uuid)
);

CREATE TABLE integration_connection_field (
    "index" text,
    integration_id text,
    "path" text,
    "value" jsonb,
    PRIMARY KEY ("index", integration_id),
    FOREIGN KEY (integration_id) REFERENCES integration(id)
);

CREATE TABLE integration_setting_field (
    "index" text,
    integration_id text,
    "path" text,
    "value" jsonb,
    PRIMARY KEY ("index", integration_id),
    FOREIGN KEY (integration_id) REFERENCES integration(id)
);

CREATE TABLE integration (
    id text,
    connector_id text,
    organization_key text,
    capability jsonb,
    connector_name text,
    created_at timestamp,
    environment text,
    error_text text,
    integration_name text,
    "status" text,
    updated_at timestamp,
    variables_property_1_type text,
    variables_property_1_value jsonb,
    variables_property_2_type text,
    variables_property_2_value jsonb,
    version text,
    PRIMARY KEY (id),
    FOREIGN KEY (connector_id) REFERENCES connector(id),
    FOREIGN KEY (organization_key) REFERENCES organization(organization_key)
);

CREATE TABLE action_param (
    "index" text,
    integration_action_id text,
    "path" text,
    "value" jsonb,
    PRIMARY KEY ("index", integration_action_id),
    FOREIGN KEY (integration_action_id) REFERENCES integration_action(id)
);

CREATE TABLE integration_action (
    id text,
    integration_id text,
    organization_key text,
    action_name text,
    action_type text,
    created_at timestamp,
    progress bigint,
    "status" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (integration_id) REFERENCES integration(id),
    FOREIGN KEY (organization_key) REFERENCES organization(organization_key)
);
