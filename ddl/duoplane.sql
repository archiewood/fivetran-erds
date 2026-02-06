CREATE TABLE shipment_tracking_attribute (
    id text,
    tracking text,
    shipment_id text,
    tracking_url text,
    PRIMARY KEY (id, tracking),
    FOREIGN KEY (shipment_id) REFERENCES shipment(id)
);

CREATE TABLE shipment_item_serial_code (
    serial_code text,
    shipment_item_attribute_id text,
    shipment_item_attribute_order_item_id text,
    PRIMARY KEY (serial_code, shipment_item_attribute_id, shipment_item_attribute_order_item_id),
    FOREIGN KEY (shipment_item_attribute_id) REFERENCES shipment_item_attribute(id),
    FOREIGN KEY (shipment_item_attribute_order_item_id) REFERENCES shipment_item_attribute(order_item_id)
);

CREATE TABLE shipment_item_attribute (
    id text,
    order_item_id text,
    shipment_id text,
    cost double precision,
    order_item_name text,
    quantity integer,
    PRIMARY KEY (id, order_item_id),
    FOREIGN KEY (shipment_id) REFERENCES shipment(id)
);

CREATE TABLE shipment (
    id text,
    created_at timestamp,
    purchase_order_id text,
    purchase_order_public_reference text,
    shipper_id text,
    shipper_invoice_reference text,
    shipper_name text,
    shipper_scac_code text,
    shipper_shipping_cost double precision,
    updated_at timestamp,
    vendor_handling_cost double precision,
    vendor_invoice_reference text,
    vendor_shipping_cost double precision,
    vendor_tax_cost double precision,
    PRIMARY KEY (id)
);

CREATE TABLE purchase_order_item_note (
    _fivetran_id text,
    purchase_order_item_id text,
    body text,
    title text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (purchase_order_item_id) REFERENCES purchase_order_item(id)
);

CREATE TABLE purchase_order_item_comment (
    id text,
    purchase_order_item_id text,
    body text,
    commentator_company_name text,
    recipient_company_name text,
    PRIMARY KEY (id),
    FOREIGN KEY (purchase_order_item_id) REFERENCES purchase_order_item(id)
);

CREATE TABLE purchase_order_item (
    id text,
    purchase_order_id text,
    cost double precision,
    mpn text,
    "name" text,
    net_price double precision,
    order_id text,
    other_barcode text,
    price double precision,
    promise_date text,
    quantity integer,
    quantity_open integer,
    retailer_product_id text,
    retailer_sku text,
    total_discount double precision,
    upc text,
    vendor_sku text,
    PRIMARY KEY (id),
    FOREIGN KEY (purchase_order_id) REFERENCES purchase_order(id)
);

CREATE TABLE purchase_order_note (
    _fivetran_id text,
    purchase_order_id text,
    body text,
    title text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (purchase_order_id) REFERENCES purchase_order(id)
);

CREATE TABLE purchase_order (
    id text,
    created_at timestamp,
    customer_note text,
    order_id text,
    order_public_reference text,
    ordered_at timestamp,
    promise_date text,
    public_reference text,
    retailer_account text,
    retailer_id text,
    retailer_name text,
    sent_at timestamp,
    ship_method text,
    shipping_address_address_1 text,
    shipping_address_address_2 text,
    shipping_address_city text,
    shipping_address_company_name text,
    shipping_address_country text,
    shipping_address_email text,
    shipping_address_first_name text,
    shipping_address_last_name text,
    shipping_address_phone text,
    shipping_address_post_code text,
    shipping_address_province text,
    shipping_address_province_iso text,
    "status" text,
    store_name text,
    total_shipping_revenue double precision,
    total_tax double precision,
    updated_at timestamp,
    vendor text,
    vendor_account text,
    vendor_id text,
    vendor_reference text,
    PRIMARY KEY (id)
);

CREATE TABLE product_inventory (
    id text,
    product_id text,
    actual_leadtime_days integer,
    backordered_until text,
    cost double precision,
    manage_inventory text,
    purchase_name text,
    quantity_available integer,
    vendor_id text,
    vendor_name text,
    vendor_sku text,
    PRIMARY KEY (id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE store_product (
    id text,
    product_id text,
    inventory_quantity_buffer text,
    store_id text,
    store_name text,
    store_product_type text,
    store_reference_unique text,
    vendor_store_reference text,
    PRIMARY KEY (id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE product (
    id text,
    created_at timestamp,
    deactivated_at text,
    mpn text,
    "name" text,
    other_barcode text,
    price text,
    price_map text,
    price_msrp text,
    product_type text,
    retailer_sku text,
    upc text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE order_vendor_comment (
    id text,
    purchase_order_id text,
    body text,
    commentable_id text,
    commentable_type text,
    commenter_email text,
    commenter_full_name text,
    created_at timestamp,
    recipient_company_id text,
    recipient_company_name text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (purchase_order_id) REFERENCES purchase_order(id)
);

CREATE TABLE order_retailer_comment (
    id text,
    purchase_order_item_id text,
    body text,
    commentable_id text,
    commentable_type text,
    commenter_email text,
    commenter_full_name text,
    created_at timestamp,
    recipient_company_id text,
    recipient_company_name text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (purchase_order_item_id) REFERENCES purchase_order_item(id)
);
