CREATE TABLE quote_line_item (
    id text,
    quote_id text,
    inventory_id text,
    category_name text,
    cost text,
    count text,
    created_at text,
    "name" text,
    sku text,
    updated_at text,
    PRIMARY KEY (id, quote_id),
    FOREIGN KEY (quote_id) REFERENCES quote(id),
    FOREIGN KEY (inventory_id) REFERENCES inventory(id)
);

CREATE TABLE quote (
    id text,
    customer_id text,
    created_at text,
    "date" text,
    delivery_method_id text,
    discount text,
    expiration_date text,
    instruction text,
    number text,
    payment_term_id text,
    salesperson_name text,
    shipping text,
    "status" text,
    subtotal text,
    tax text,
    total text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE shipment_address (
    id text,
    shipment_id text,
    city text,
    country text,
    country_subdivision_code text,
    created_at text,
    descriptive_name text,
    line_1 text,
    line_2 text,
    line_3 text,
    line_4 text,
    line_5 text,
    postal_code text,
    updated_at text,
    PRIMARY KEY (id, shipment_id),
    FOREIGN KEY (shipment_id) REFERENCES shipment(id)
);

CREATE TABLE shipment_item_auto_ship (
    adjustment_id text,
    shipment_id text,
    shipment_item_id text,
    barcode text,
    change text,
    count text,
    lot_code text,
    reason text,
    stock_id text,
    PRIMARY KEY (adjustment_id, shipment_id, shipment_item_id),
    FOREIGN KEY (shipment_id) REFERENCES shipment_item(shipment_id),
    FOREIGN KEY (shipment_item_id) REFERENCES shipment_item(id)
);

CREATE TABLE shipment_item (
    id text,
    shipment_id text,
    count text,
    inventory_name text,
    inventory_sku text,
    part_of_kit text,
    PRIMARY KEY (id, shipment_id),
    FOREIGN KEY (shipment_id) REFERENCES shipment(id)
);

CREATE TABLE shipment (
    id text,
    customer_id text,
    order_id text,
    created_at text,
    delivery_driver text,
    delivery_vehicle text,
    note text,
    number text,
    ship_date text,
    tracking_number text,
    updated_at text,
    user_name text,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (order_id) REFERENCES orders(id)
);

CREATE TABLE purchase_line_item (
    id text,
    purchase_id text,
    inventory_id text,
    category_name text,
    cost text,
    count text,
    created_at text,
    "name" text,
    sku text,
    updated_at text,
    PRIMARY KEY (id, purchase_id),
    FOREIGN KEY (purchase_id) REFERENCES purchase(id),
    FOREIGN KEY (inventory_id) REFERENCES inventory(id)
);

CREATE TABLE purchase (
    id text,
    vendor_id text,
    created_at text,
    "date" text,
    deliver_by_date text,
    delivery_method_id text,
    delivery_method_instruction text,
    delivery_method_kind text,
    delivery_method_name text,
    discount text,
    instruction text,
    number text,
    shipping text,
    "status" text,
    subtotal text,
    tax text,
    total text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (vendor_id) REFERENCES vendor(id)
);

CREATE TABLE inventory_conversion (
    _fivetran_id text,
    inventory_id text,
    catch_weight text,
    from_count text,
    maximum_weight text,
    minimum_weight text,
    to_count text,
    unit_of_measurement text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (inventory_id) REFERENCES inventory(id)
);

CREATE TABLE inventory_custom_field_value (
    id text,
    inventory_id text,
    active_stock_id text,
    created_at text,
    updated_at text,
    "value" text,
    value_type text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id, inventory_id),
    FOREIGN KEY (inventory_id) REFERENCES inventory(id)
);

CREATE TABLE inventory (
    id text,
    category_name text,
    created_at text,
    height text,
    lead_time text,
    length text,
    "name" text,
    on_hand text,
    property text,
    pull_strategy text,
    purchase_conversion text,
    quantity_not_tracked text,
    reorder_point text,
    retired text,
    sku text,
    unit_of_dimension text,
    unit_of_invoice text,
    unit_of_order text,
    unit_of_pick_and_ship text,
    unit_of_purchase text,
    unit_of_use text,
    unit_of_weight text,
    updated_at text,
    waste_percentage text,
    weight text,
    width text,
    PRIMARY KEY (id)
);

CREATE TABLE order_line_item (
    id text,
    order_id text,
    inventory_id text,
    category_name text,
    cost text,
    count text,
    created_at text,
    "name" text,
    sku text,
    updated_at text,
    PRIMARY KEY (id, order_id),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (inventory_id) REFERENCES inventory(id)
);

CREATE TABLE order_billing_address (
    id text,
    orders_id text,
    city text,
    country text,
    country_subdivision_code text,
    created_at text,
    descriptive_name text,
    line_1 text,
    line_2 text,
    line_3 text,
    line_4 text,
    line_5 text,
    postal_code text,
    updated_at text,
    PRIMARY KEY (id, orders_id),
    FOREIGN KEY (orders_id) REFERENCES orders(id)
);

CREATE TABLE order_shipping_address (
    id text,
    orders_id text,
    city text,
    country text,
    country_subdivision_code text,
    created_at text,
    descriptive_name text,
    line_1 text,
    line_2 text,
    line_3 text,
    line_4 text,
    line_5 text,
    postal_code text,
    updated_at text,
    PRIMARY KEY (id, orders_id),
    FOREIGN KEY (orders_id) REFERENCES orders(id)
);

CREATE TABLE order_ship_from_address (
    id text,
    orders_id text,
    city text,
    country text,
    country_subdivision_code text,
    created_at text,
    descriptive_name text,
    line_1 text,
    line_2 text,
    line_3 text,
    line_4 text,
    line_5 text,
    postal_code text,
    updated_at text,
    PRIMARY KEY (id, orders_id),
    FOREIGN KEY (orders_id) REFERENCES orders(id)
);

CREATE TABLE orders (
    id text,
    customer_id text,
    created_at text,
    deliver_date text,
    delivery_method_id text,
    discount text,
    instruction text,
    invoiced text,
    invoiced_at text,
    order_date text,
    order_number text,
    payment_term_id text,
    po_number text,
    produce_date text,
    sales_channel_name text,
    sales_person_name text,
    ship_date text,
    shipping text,
    "status" text,
    subtotal text,
    tax text,
    total text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE customer_address (
    id text,
    customer_id text,
    city text,
    country text,
    country_subdivision_code text,
    created_at text,
    descriptive_name text,
    line_1 text,
    line_2 text,
    line_3 text,
    line_4 text,
    line_5 text,
    postal_code text,
    updated_at text,
    PRIMARY KEY (id, customer_id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE customer_billing_address (
    id text,
    customer_id text,
    city text,
    country text,
    country_subdivision_code text,
    created_at text,
    descriptive_name text,
    line_1 text,
    line_2 text,
    line_3 text,
    line_4 text,
    line_5 text,
    postal_code text,
    updated_at text,
    PRIMARY KEY (id, customer_id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE customer_shipping_address (
    id text,
    customer_id text,
    city text,
    country text,
    country_subdivision_code text,
    created_at text,
    descriptive_name text,
    line_1 text,
    line_2 text,
    line_3 text,
    line_4 text,
    line_5 text,
    postal_code text,
    updated_at text,
    PRIMARY KEY (id, customer_id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE customer (
    id text,
    business_license_number text,
    created_at text,
    default_special_instructions text,
    delivery_driver text,
    delivery_method text,
    delivery_method_id text,
    delivery_vehicle text,
    display_name text,
    email text,
    fax text,
    first_name text,
    kind text,
    last_name text,
    mobile text,
    note text,
    payment_terms text,
    phone text,
    sales_channel text,
    salesperson text,
    updated_at text,
    website text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE invoice_line_item (
    id text,
    invoice_id text,
    inventory_id text,
    category_name text,
    cost text,
    count text,
    created_at text,
    "name" text,
    sku text,
    updated_at text,
    PRIMARY KEY (id, invoice_id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id),
    FOREIGN KEY (inventory_id) REFERENCES inventory(id)
);

CREATE TABLE invoice_billing_address (
    id text,
    invoice_id text,
    city text,
    country text,
    country_subdivision_code text,
    created_at text,
    descriptive_name text,
    line_1 text,
    line_2 text,
    line_3 text,
    line_4 text,
    line_5 text,
    postal_code text,
    updated_at text,
    PRIMARY KEY (id, invoice_id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id)
);

CREATE TABLE invoice_shipping_address (
    id text,
    invoice_id text,
    city text,
    country text,
    country_subdivision_code text,
    created_at text,
    descriptive_name text,
    line_1 text,
    line_2 text,
    line_3 text,
    line_4 text,
    line_5 text,
    postal_code text,
    updated_at text,
    PRIMARY KEY (id, invoice_id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id)
);

CREATE TABLE invoice (
    id text,
    customer_id text,
    created_at text,
    "date" text,
    delivery_method_id text,
    discount text,
    instruction text,
    invoice_number text,
    payment_term_id text,
    sales_channel text,
    sales_person_id text,
    salesperson_name text,
    shipping text,
    "status" text,
    subtotal text,
    tax text,
    total text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE categories (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE vendor_billing_address (
    id text,
    vendor_id text,
    city text,
    country text,
    country_subdivision_code text,
    created_at text,
    descriptive_name text,
    line_1 text,
    line_2 text,
    line_3 text,
    line_4 text,
    line_5 text,
    postal_code text,
    updated_at text,
    PRIMARY KEY (id, vendor_id),
    FOREIGN KEY (vendor_id) REFERENCES vendor(id)
);

CREATE TABLE vendor_shipping_address (
    id text,
    vendor_id text,
    city text,
    country text,
    country_subdivision_code text,
    created_at text,
    descriptive_name text,
    line_1 text,
    line_2 text,
    line_3 text,
    line_4 text,
    line_5 text,
    postal_code text,
    updated_at text,
    PRIMARY KEY (id, vendor_id),
    FOREIGN KEY (vendor_id) REFERENCES vendor(id)
);

CREATE TABLE vendor (
    id text,
    business_license_number text,
    created_at text,
    delivery_method_id text,
    delivery_method_kind text,
    delivery_method_name text,
    display_name text,
    email text,
    fax text,
    first_name text,
    kind text,
    last_name text,
    mobile text,
    note text,
    payment_term_id text,
    payment_term_name text,
    payment_term_net text,
    phone text,
    updated_at text,
    website text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id)
);
