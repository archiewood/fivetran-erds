CREATE TABLE location (
    id text,
    parent_location_id text,
    warehouse_id text,
    is_bulk_location text,
    is_exclusive_location text,
    location_type_color text,
    location_type_default text,
    location_type_id text,
    location_type_name text,
    "name" text,
    remarks text,
    "type" text,
    unlink_on_empty text,
    PRIMARY KEY (id),
    FOREIGN KEY (parent_location_id) REFERENCES location(id),
    FOREIGN KEY (warehouse_id) REFERENCES warehouse(id)
);

CREATE TABLE price_list (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE vat_group (
    id text,
    "name" text,
    percentage text,
    standard text,
    PRIMARY KEY (id)
);

CREATE TABLE supplier (
    id text,
    template_id text,
    active text,
    address text,
    address_2 text,
    city text,
    contact_name text,
    country text,
    email_address text,
    full_address text,
    languages text,
    "name" text,
    region text,
    remarks text,
    telephone text,
    zip_code text,
    PRIMARY KEY (id),
    FOREIGN KEY (template_id) REFERENCES template(id)
);

CREATE TABLE comment_mention (
    _fivetran_id text,
    comment_id text,
    user_id text,
    mentioned_type text,
    text text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (comment_id) REFERENCES "comment"(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE "comment" (
    id text,
    customer_id text,
    order_id text,
    picklist_id text,
    product_id text,
    purchaseorder_id text,
    return_id text,
    supplier_id text,
    user_id text,
    author_type text,
    body text,
    created_at text,
    image_url text,
    receipt_id text,
    show_at_related text,
    source_type text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (picklist_id) REFERENCES picklist(id),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (purchaseorder_id) REFERENCES purchase_order(id),
    FOREIGN KEY (return_id) REFERENCES "return"(id),
    FOREIGN KEY (supplier_id) REFERENCES supplier(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE "return" (
    id text,
    customer_id text,
    order_id text,
    template_id text,
    address text,
    address_2 text,
    city text,
    completed_at text,
    contact_name text,
    country text,
    created_at text,
    email_address text,
    full_address text,
    languages text,
    "name" text,
    received_at text,
    reference text,
    region text,
    return_number text,
    return_status_id text,
    telephone text,
    tracking_code text,
    updated_at text,
    zip_code text,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (template_id) REFERENCES template(id)
);

CREATE TABLE stock_history (
    id text,
    location_id text,
    product_id text,
    user_id text,
    warehouse_id text,
    change_type text,
    changed_at text,
    new_stock text,
    old_stock text,
    reason text,
    stock_change text,
    PRIMARY KEY (id),
    FOREIGN KEY (location_id) REFERENCES location(id),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (warehouse_id) REFERENCES warehouse(id)
);

CREATE TABLE product_image (
    "index" text,
    product_id text,
    image_url text,
    PRIMARY KEY ("index", product_id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE product_stock (
    product_id text,
    warehouse_id text,
    freestock text,
    reserved text,
    reserved_allocations text,
    reserved_back_order text,
    reserved_picklist text,
    stock text,
    PRIMARY KEY (product_id, warehouse_id),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (warehouse_id) REFERENCES warehouse(id)
);

CREATE TABLE product_field (
    id text,
    product_id text,
    PRIMARY KEY (id, product_id),
    FOREIGN KEY (id) REFERENCES product_field_detailed(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE product_price_list (
    id text,
    product_id text,
    price text,
    PRIMARY KEY (id, product_id),
    FOREIGN KEY (id) REFERENCES price_list(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE product_tag (
    product_id text,
    tag_id text,
    PRIMARY KEY (product_id, tag_id),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (tag_id) REFERENCES tags(id)
);

CREATE TABLE product (
    id text,
    supplier_id text,
    vat_group_id text,
    active text,
    analysis_abc_classification text,
    analysis_pick_amount_per_day text,
    assembled text,
    barcode text,
    code text,
    country_of_origin text,
    delivery_time text,
    description text,
    fixed_stock_price text,
    height text,
    hs_code text,
    length text,
    minimum_purchase_quantity text,
    "name" text,
    price text,
    product_code_supplier text,
    purchase_in_quantities_of text,
    show_on_portal text,
    "type" text,
    unlimited_stock text,
    weight text,
    width text,
    PRIMARY KEY (id),
    FOREIGN KEY (supplier_id) REFERENCES supplier(id),
    FOREIGN KEY (vat_group_id) REFERENCES vat_group(id)
);

CREATE TABLE order_product (
    order_product_id text,
    order_id text,
    part_of_idorder_product text,
    product_id text,
    amount text,
    amount_cancelled text,
    has_parts text,
    part_of_order_product_id text,
    price text,
    remarks text,
    PRIMARY KEY (order_product_id, order_id),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (part_of_idorder_product) REFERENCES order_product(order_product_id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE order_field (
    id text,
    order_id text,
    PRIMARY KEY (id, order_id),
    FOREIGN KEY (id) REFERENCES order_field_detailed(id),
    FOREIGN KEY (order_id) REFERENCES orders(id)
);

CREATE TABLE order_price_list (
    order_id text,
    pricelist_id text,
    PRIMARY KEY (order_id, pricelist_id),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (pricelist_id) REFERENCES price_list(id)
);

CREATE TABLE order_warehouse (
    order_id text,
    warehouse_id text,
    PRIMARY KEY (order_id, warehouse_id),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (warehouse_id) REFERENCES warehouse(id)
);

CREATE TABLE order_tag (
    order_id text,
    tag_id text,
    PRIMARY KEY (order_id, tag_id),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (tag_id) REFERENCES tags(id)
);

CREATE TABLE orders (
    id text,
    customer_id text,
    shipping_provider_profile_id integer,
    template_id text,
    auto_split text,
    calculate_vat text,
    created text,
    customer_remarks text,
    delivery_address text,
    delivery_address_2 text,
    delivery_city text,
    delivery_contact_name text,
    delivery_country text,
    delivery_name text,
    delivery_region text,
    delivery_zip_code text,
    discount text,
    email_address text,
    full_delivery_address text,
    full_invoice_address text,
    invoice_address text,
    invoice_address_2 text,
    invoice_city text,
    invoice_contact_name text,
    invoice_country text,
    invoice_name text,
    invoice_region text,
    invoice_zip_code text,
    invoiced text,
    languages text,
    order_number text,
    partial_delivery text,
    pickup_point_data text,
    preferred_delivery_date text,
    public_status_page text,
    reference text,
    "status" text,
    telephone text,
    updated text,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (shipping_provider_profile_id) REFERENCES shipping_provider_profile(id),
    FOREIGN KEY (template_id) REFERENCES template(id)
);

CREATE TABLE customer_address (
    id text,
    customer_id text,
    address text,
    address_2 text,
    city text,
    contact_name text,
    country text,
    default_delivery text,
    default_invoice text,
    full_address text,
    "name" text,
    region text,
    zip_code text,
    PRIMARY KEY (id, customer_id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE customer_field (
    customer_id text,
    id text,
    PRIMARY KEY (customer_id, id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (id) REFERENCES customer_field_detailed(id)
);

CREATE TABLE customer_tag (
    customer_id text,
    tag_id text,
    PRIMARY KEY (customer_id, tag_id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (tag_id) REFERENCES tags(id)
);

CREATE TABLE customer (
    id text,
    template_id text,
    auto_split text,
    calculate_vat text,
    contact_name text,
    customer_number text,
    default_order_remarks text,
    discount text,
    email_address text,
    languages text,
    "name" text,
    partial_delivery text,
    remarks text,
    telephone text,
    vat_number text,
    PRIMARY KEY (id),
    FOREIGN KEY (template_id) REFERENCES template(id)
);

CREATE TABLE template (
    id text,
    custom_css text,
    defaults text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE product_field_detailed (
    id text,
    required text,
    title text,
    "type" text,
    values jsonb,
    visible_invoice text,
    visible_picklist text,
    visible_portal text,
    visible_purchase_order text,
    visible_shipping_list text,
    PRIMARY KEY (id)
);

CREATE TABLE picklist_location (
    location_id text,
    picklist_id text,
    picklist_product_id text,
    amount text,
    PRIMARY KEY (location_id, picklist_id, picklist_product_id),
    FOREIGN KEY (location_id) REFERENCES location(id),
    FOREIGN KEY (picklist_id) REFERENCES picklist_product(picklist_id),
    FOREIGN KEY (picklist_product_id) REFERENCES picklist_product(id)
);

CREATE TABLE picklist_product (
    id text,
    picklist_id text,
    order_product_id text,
    product_id text,
    amount text,
    amount_picked text,
    has_parts text,
    part_of_picklist_product_id text,
    price text,
    remarks text,
    return_product_replacement_id text,
    stock_location text,
    PRIMARY KEY (id, picklist_id),
    FOREIGN KEY (picklist_id) REFERENCES picklist(id),
    FOREIGN KEY (order_product_id) REFERENCES order_product(order_product_id),
    FOREIGN KEY (product_id) REFERENCES picklist_product(id)
);

CREATE TABLE picklist (
    id text,
    assigned_to_user_id text,
    closed_by_user_id text,
    customer_id text,
    order_id text,
    reference text,
    return_id text,
    shipping_provider_profile_id text,
    template_id text,
    warehouse_id text,
    closed_at text,
    created text,
    delivery_address text,
    delivery_address_2 text,
    delivery_city text,
    delivery_contact text,
    delivery_country text,
    delivery_name text,
    delivery_region text,
    delivery_zip_code text,
    email_address text,
    invoiced text,
    picklist_number text,
    preferred_delivery_date text,
    snoozed_until text,
    "status" text,
    telephone text,
    total_picked text,
    total_product text,
    updated text,
    urgent text,
    PRIMARY KEY (id),
    FOREIGN KEY (assigned_to_user_id) REFERENCES users(id),
    FOREIGN KEY (closed_by_user_id) REFERENCES users(id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (reference) REFERENCES orders(reference),
    FOREIGN KEY (return_id) REFERENCES "return"(id),
    FOREIGN KEY (shipping_provider_profile_id) REFERENCES shipping_provider_profile(id),
    FOREIGN KEY (template_id) REFERENCES template(id),
    FOREIGN KEY (warehouse_id) REFERENCES warehouse(id)
);

CREATE TABLE warehouse (
    id text,
    accept_orders text,
    active text,
    counts_for_general_stock text,
    "name" text,
    priority text,
    PRIMARY KEY (id)
);

CREATE TABLE customer_field_detailed (
    id text,
    required text,
    title text,
    "type" text,
    values jsonb,
    PRIMARY KEY (id)
);

CREATE TABLE backorder (
    id text,
    customer_id text,
    order_id text,
    part_of_backorder_id text,
    product_id text,
    return_id text,
    warehouse_id text,
    amount text,
    amount_available text,
    created_at text,
    has_parts text,
    parts_per_parent text,
    priority text,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (part_of_backorder_id) REFERENCES backorder(id),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (return_id) REFERENCES "return"(id),
    FOREIGN KEY (warehouse_id) REFERENCES warehouse(id)
);

CREATE TABLE order_field_detailed (
    id text,
    required text,
    title text,
    "type" text,
    values jsonb,
    visible_picklist text,
    visible_portal text,
    PRIMARY KEY (id)
);

CREATE TABLE shipping_provider_profile (
    id text,
    shipping_provider_id text,
    active text,
    created text,
    "name" text,
    standard text,
    updated text,
    PRIMARY KEY (id, shipping_provider_id),
    FOREIGN KEY (shipping_provider_id) REFERENCES shipping_provider(id)
);

CREATE TABLE shipping_provider (
    id text,
    active text,
    created text,
    "name" text,
    provider text,
    updated text,
    PRIMARY KEY (id)
);

CREATE TABLE purchase_order_product (
    purchase_order_product_id text,
    purchase_order_id text,
    product_id text,
    amount text,
    amount_received text,
    delivery_date text,
    price text,
    product_code_supplier text,
    PRIMARY KEY (purchase_order_product_id, purchase_order_id),
    FOREIGN KEY (purchase_order_id) REFERENCES purchase_order(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE purchase_order (
    id text,
    completed_user_id text,
    created_user_id text,
    purchased_user_id text,
    supplier_id text,
    template_id text,
    warehouse_id text,
    completed_at text,
    created text,
    delivery_date text,
    languages text,
    purchase_order_number text,
    purchased_at text,
    remarks text,
    "status" text,
    supplier_name text,
    supplier_order_id text,
    updated text,
    PRIMARY KEY (id),
    FOREIGN KEY (completed_user_id) REFERENCES users(id),
    FOREIGN KEY (created_user_id) REFERENCES users(id),
    FOREIGN KEY (purchased_user_id) REFERENCES users(id),
    FOREIGN KEY (supplier_id) REFERENCES supplier(id),
    FOREIGN KEY (template_id) REFERENCES template(id),
    FOREIGN KEY (warehouse_id) REFERENCES warehouse(id)
);

CREATE TABLE picking_container (
    id text,
    picklist_id text,
    created_at text,
    "name" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (picklist_id) REFERENCES picklist(id)
);

CREATE TABLE user_right (
    rights text,
    user_id text,
    granted text,
    PRIMARY KEY (rights, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    active text,
    "admin" text,
    created_at text,
    email_address text,
    first_name text,
    full_name text,
    languages text,
    last_login_at text,
    last_name text,
    "name" text,
    packing_station_id text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE tags (
    id text,
    color text,
    inherit text,
    text_color text,
    title text,
    PRIMARY KEY (id)
);
