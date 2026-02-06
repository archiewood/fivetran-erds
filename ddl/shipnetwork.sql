CREATE TABLE advance_shipping_notice_item (
    "index" text,
    advance_shipping_notice_id text,
    description text,
    expected_quantity text,
    purchase_order_number text,
    received_quantity text,
    stock_keeping_unit text,
    tracking_number text,
    PRIMARY KEY ("index", advance_shipping_notice_id),
    FOREIGN KEY (advance_shipping_notice_id) REFERENCES advance_shipping_notice(id)
);

CREATE TABLE advance_shipping_notice (
    id text,
    arrival_date text,
    client_advanced_shipment_notice text,
    estimated_delivery_date text,
    warehouse_name text,
    PRIMARY KEY (id)
);

CREATE TABLE hs_code (
    id text,
    code text,
    long_description text,
    short_description text,
    PRIMARY KEY (id)
);

CREATE TABLE item_available_inventory_lot_detail (
    "index" text,
    _fivetran_id text,
    item_available_inventory_index text,
    lot_number text,
    quantity text,
    PRIMARY KEY ("index", _fivetran_id, item_available_inventory_index),
    FOREIGN KEY (_fivetran_id) REFERENCES item_available_inventory(_fivetran_id),
    FOREIGN KEY (item_available_inventory_index) REFERENCES item_available_inventory("index")
);

CREATE TABLE item_available_inventory (
    "index" text,
    _fivetran_id text,
    available_inventory_quantity text,
    warehouse_name text,
    PRIMARY KEY ("index", _fivetran_id),
    FOREIGN KEY (_fivetran_id) REFERENCES item(_fivetran_id)
);

CREATE TABLE item_lot_number (
    "index" text,
    _fivetran_id text,
    expiration_date text,
    lot_number text,
    quantity text,
    PRIMARY KEY ("index", _fivetran_id),
    FOREIGN KEY (_fivetran_id) REFERENCES item(_fivetran_id)
);

CREATE TABLE item (
    _fivetran_id text,
    hs_code_id text,
    barcode text,
    category text,
    declared_value text,
    description text,
    haz_mat_type text,
    height text,
    is_expiration_tracked text,
    is_haz_mat text,
    is_label_only text,
    is_lot_tracked text,
    is_serial_tracked text,
    length text,
    origin_country text,
    stock_keeping_unit text,
    weight text,
    width text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (hs_code_id) REFERENCES hs_code(id)
);

CREATE TABLE order_business_stock_keeping_unit_item_lot (
    "index" text,
    order_business_stock_keeping_unit_index text,
    order_business_stock_keeping_unit_order_business_id text,
    expiration_date text,
    lot_number text,
    quantity text,
    PRIMARY KEY ("index", order_business_stock_keeping_unit_index, order_business_stock_keeping_unit_order_business_id),
    FOREIGN KEY (order_business_stock_keeping_unit_index) REFERENCES order_business_stock_keeping_unit("index"),
    FOREIGN KEY (order_business_stock_keeping_unit_order_business_id) REFERENCES order_business_stock_keeping_unit(order_business_id)
);

CREATE TABLE order_business_stock_keeping_unit_serial_number (
    "index" text,
    order_business_stock_keeping_unit_index text,
    order_business_stock_keeping_unit_order_business_id text,
    serial_number text,
    PRIMARY KEY ("index", order_business_stock_keeping_unit_index, order_business_stock_keeping_unit_order_business_id),
    FOREIGN KEY (order_business_stock_keeping_unit_index) REFERENCES order_business_stock_keeping_unit("index"),
    FOREIGN KEY (order_business_stock_keeping_unit_order_business_id) REFERENCES order_business_stock_keeping_unit(order_business_id)
);

CREATE TABLE order_business_stock_keeping_unit (
    "index" text,
    order_business_id text,
    description text,
    quantity text,
    stock_keeping_unit text,
    PRIMARY KEY ("index", order_business_id),
    FOREIGN KEY (order_business_id) REFERENCES order_business(id)
);

CREATE TABLE order_business (
    id text,
    "comment" text,
    customer_address_1 text,
    customer_address_2 text,
    customer_address_3 text,
    customer_city text,
    customer_company text,
    customer_country text,
    customer_email text,
    customer_name text,
    customer_phone_number text,
    customer_postal_code text,
    customer_state_or_province text,
    date_backordered text,
    date_created text,
    reference_number text,
    shipping_method text,
    status_description text,
    "type" text,
    warehouse_name text,
    PRIMARY KEY (id)
);

CREATE TABLE backorder_dropship_stock_keeping_unit_item_lot (
    "index" text,
    backorder_dropship_stock_keeping_unit_backorder_dropship_id text,
    backorder_dropship_stock_keeping_unit_index text,
    expiration_date text,
    lot_number text,
    quantity text,
    PRIMARY KEY ("index", backorder_dropship_stock_keeping_unit_backorder_dropship_id, backorder_dropship_stock_keeping_unit_index),
    FOREIGN KEY (backorder_dropship_stock_keeping_unit_backorder_dropship_id) REFERENCES backorder_dropship_stock_keeping_unit(backorder_dropship_id),
    FOREIGN KEY (backorder_dropship_stock_keeping_unit_index) REFERENCES backorder_dropship_stock_keeping_unit("index")
);

CREATE TABLE backorder_dropship_stock_keeping_unit_serial_number (
    "index" text,
    backorder_dropship_stock_keeping_unit_backorder_dropship_id text,
    backorder_dropship_stock_keeping_unit_index text,
    serial_number text,
    PRIMARY KEY ("index", backorder_dropship_stock_keeping_unit_backorder_dropship_id, backorder_dropship_stock_keeping_unit_index),
    FOREIGN KEY (backorder_dropship_stock_keeping_unit_backorder_dropship_id) REFERENCES backorder_dropship_stock_keeping_unit(backorder_dropship_id),
    FOREIGN KEY (backorder_dropship_stock_keeping_unit_index) REFERENCES backorder_dropship_stock_keeping_unit("index")
);

CREATE TABLE backorder_dropship_stock_keeping_unit (
    "index" text,
    backorder_dropship_id text,
    description text,
    quantity text,
    stock_keeping_unit text,
    PRIMARY KEY ("index", backorder_dropship_id),
    FOREIGN KEY (backorder_dropship_id) REFERENCES backorder_dropship(id)
);

CREATE TABLE backorder_dropship (
    id text,
    "comment" text,
    customer_address_1 text,
    customer_address_2 text,
    customer_address_3 text,
    customer_city text,
    customer_company text,
    customer_country text,
    customer_email text,
    customer_name text,
    customer_phone_number text,
    customer_postal_code text,
    customer_state_or_province text,
    date_backordered text,
    date_created text,
    reference_number text,
    shipping_method text,
    "type" text,
    warehouse_name text,
    PRIMARY KEY (id)
);

CREATE TABLE order_dropship_stock_keeping_unit_item_lot (
    "index" text,
    order_dropship_stock_keeping_unit_index text,
    order_dropship_stock_keeping_unit_order_dropship_id text,
    expiration_date text,
    lot_number text,
    quantity text,
    PRIMARY KEY ("index", order_dropship_stock_keeping_unit_index, order_dropship_stock_keeping_unit_order_dropship_id),
    FOREIGN KEY (order_dropship_stock_keeping_unit_index) REFERENCES order_dropship_stock_keeping_unit("index"),
    FOREIGN KEY (order_dropship_stock_keeping_unit_order_dropship_id) REFERENCES order_dropship_stock_keeping_unit(order_dropship_id)
);

CREATE TABLE order_dropship_stock_keeping_unit_serial_number (
    "index" text,
    order_dropship_stock_keeping_unit_index text,
    order_dropship_stock_keeping_unit_order_dropship_id text,
    serial_number text,
    PRIMARY KEY ("index", order_dropship_stock_keeping_unit_index, order_dropship_stock_keeping_unit_order_dropship_id),
    FOREIGN KEY (order_dropship_stock_keeping_unit_index) REFERENCES order_dropship_stock_keeping_unit("index"),
    FOREIGN KEY (order_dropship_stock_keeping_unit_order_dropship_id) REFERENCES order_dropship_stock_keeping_unit(order_dropship_id)
);

CREATE TABLE order_dropship_stock_keeping_unit (
    "index" text,
    order_dropship_id text,
    description text,
    quantity text,
    stock_keeping_unit text,
    PRIMARY KEY ("index", order_dropship_id),
    FOREIGN KEY (order_dropship_id) REFERENCES order_dropship(id)
);

CREATE TABLE order_dropship (
    id text,
    "comment" text,
    customer_address_1 text,
    customer_address_2 text,
    customer_address_3 text,
    customer_city text,
    customer_company text,
    customer_country text,
    customer_email text,
    customer_name text,
    customer_phone_number text,
    customer_postal_code text,
    customer_state_or_province text,
    date_backordered text,
    date_created text,
    reference_number text,
    shipping_method text,
    status_description text,
    "type" text,
    warehouse_name text,
    PRIMARY KEY (id)
);

CREATE TABLE order_consumer_stock_keeping_unit_item_lot (
    "index" text,
    order_consumer_stock_keeping_unit_index text,
    order_consumer_stock_keeping_unit_order_consumer_id text,
    expiration_date text,
    lot_number text,
    quantity text,
    PRIMARY KEY ("index", order_consumer_stock_keeping_unit_index, order_consumer_stock_keeping_unit_order_consumer_id),
    FOREIGN KEY (order_consumer_stock_keeping_unit_index) REFERENCES order_consumer_stock_keeping_unit("index"),
    FOREIGN KEY (order_consumer_stock_keeping_unit_order_consumer_id) REFERENCES order_consumer_stock_keeping_unit(order_consumer_id)
);

CREATE TABLE order_consumer_stock_keeping_unit_serial_number (
    "index" text,
    order_consumer_stock_keeping_unit_index text,
    order_consumer_stock_keeping_unit_order_consumer_id text,
    serial_number text,
    PRIMARY KEY ("index", order_consumer_stock_keeping_unit_index, order_consumer_stock_keeping_unit_order_consumer_id),
    FOREIGN KEY (order_consumer_stock_keeping_unit_index) REFERENCES order_consumer_stock_keeping_unit("index"),
    FOREIGN KEY (order_consumer_stock_keeping_unit_order_consumer_id) REFERENCES order_consumer_stock_keeping_unit(order_consumer_id)
);

CREATE TABLE order_consumer_stock_keeping_unit (
    "index" text,
    order_consumer_id text,
    description text,
    quantity text,
    stock_keeping_unit text,
    PRIMARY KEY ("index", order_consumer_id),
    FOREIGN KEY (order_consumer_id) REFERENCES order_consumer(id)
);

CREATE TABLE order_consumer (
    id text,
    "comment" text,
    customer_address_1 text,
    customer_address_2 text,
    customer_address_3 text,
    customer_city text,
    customer_company text,
    customer_country text,
    customer_email text,
    customer_name text,
    customer_phone_number text,
    customer_postal_code text,
    customer_state_or_province text,
    date_backordered text,
    date_created text,
    reference_number text,
    shipping_method text,
    status_description text,
    "type" text,
    warehouse_name text,
    PRIMARY KEY (id)
);

CREATE TABLE backorder_consumer_stock_keeping_unit_item_lot (
    "index" text,
    backorder_consumer_stock_keeping_unit_backorder_consumer_id text,
    backorder_consumer_stock_keeping_unit_index text,
    expiration_date text,
    lot_number text,
    quantity text,
    PRIMARY KEY ("index", backorder_consumer_stock_keeping_unit_backorder_consumer_id, backorder_consumer_stock_keeping_unit_index),
    FOREIGN KEY (backorder_consumer_stock_keeping_unit_backorder_consumer_id) REFERENCES backorder_consumer_stock_keeping_unit(backorder_consumer_id),
    FOREIGN KEY (backorder_consumer_stock_keeping_unit_index) REFERENCES backorder_consumer_stock_keeping_unit("index")
);

CREATE TABLE backorder_consumer_stock_keeping_unit_serial_number (
    "index" text,
    backorder_consumer_stock_keeping_unit_backorder_consumer_id text,
    backorder_consumer_stock_keeping_unit_index text,
    serial_number text,
    PRIMARY KEY ("index", backorder_consumer_stock_keeping_unit_backorder_consumer_id, backorder_consumer_stock_keeping_unit_index),
    FOREIGN KEY (backorder_consumer_stock_keeping_unit_backorder_consumer_id) REFERENCES backorder_consumer_stock_keeping_unit(backorder_consumer_id),
    FOREIGN KEY (backorder_consumer_stock_keeping_unit_index) REFERENCES backorder_consumer_stock_keeping_unit("index")
);

CREATE TABLE backorder_consumer_stock_keeping_unit (
    "index" text,
    backorder_consumer_id text,
    description text,
    quantity text,
    stock_keeping_unit text,
    PRIMARY KEY ("index", backorder_consumer_id),
    FOREIGN KEY (backorder_consumer_id) REFERENCES backorder_consumer(id)
);

CREATE TABLE backorder_consumer (
    id text,
    "comment" text,
    customer_address_1 text,
    customer_address_2 text,
    customer_address_3 text,
    customer_city text,
    customer_company text,
    customer_country text,
    customer_email text,
    customer_name text,
    customer_phone_number text,
    customer_postal_code text,
    customer_state_or_province text,
    date_backordered text,
    date_created text,
    reference_number text,
    shipping_method text,
    "type" text,
    warehouse_name text,
    PRIMARY KEY (id)
);

CREATE TABLE backorder_wholesale_stock_keeping_unit_item_lot (
    "index" text,
    backorder_wholesale_stock_keeping_unit_backorder_wholesale_id text,
    backorder_wholesale_stock_keeping_unit_index text,
    expiration_date text,
    lot_number text,
    quantity text,
    PRIMARY KEY ("index", backorder_wholesale_stock_keeping_unit_backorder_wholesale_id, backorder_wholesale_stock_keeping_unit_index),
    FOREIGN KEY (backorder_wholesale_stock_keeping_unit_backorder_wholesale_id) REFERENCES backorder_wholesale_stock_keeping_unit(backorder_wholesale_id),
    FOREIGN KEY (backorder_wholesale_stock_keeping_unit_index) REFERENCES backorder_wholesale_stock_keeping_unit("index")
);

CREATE TABLE backorder_wholesale_stock_keeping_unit_serial_number (
    "index" text,
    backorder_wholesale_stock_keeping_unit_backorder_wholesale_id text,
    backorder_wholesale_stock_keeping_unit_index text,
    serial_number text,
    PRIMARY KEY ("index", backorder_wholesale_stock_keeping_unit_backorder_wholesale_id, backorder_wholesale_stock_keeping_unit_index),
    FOREIGN KEY (backorder_wholesale_stock_keeping_unit_backorder_wholesale_id) REFERENCES backorder_wholesale_stock_keeping_unit(backorder_wholesale_id),
    FOREIGN KEY (backorder_wholesale_stock_keeping_unit_index) REFERENCES backorder_wholesale_stock_keeping_unit("index")
);

CREATE TABLE backorder_wholesale_stock_keeping_unit (
    "index" text,
    backorder_wholesale_id text,
    description text,
    quantity text,
    stock_keeping_unit text,
    PRIMARY KEY ("index", backorder_wholesale_id),
    FOREIGN KEY (backorder_wholesale_id) REFERENCES backorder_wholesale(id)
);

CREATE TABLE backorder_wholesale (
    id text,
    "comment" text,
    customer_address_1 text,
    customer_address_2 text,
    customer_address_3 text,
    customer_city text,
    customer_company text,
    customer_country text,
    customer_email text,
    customer_name text,
    customer_phone_number text,
    customer_postal_code text,
    customer_state_or_province text,
    date_backordered text,
    date_created text,
    reference_number text,
    shipping_method text,
    "type" text,
    warehouse_name text,
    PRIMARY KEY (id)
);

CREATE TABLE order_wholesale_stock_keeping_unit_item_lot (
    "index" text,
    order_wholesale_stock_keeping_unit_index text,
    order_wholesale_stock_keeping_unit_order_wholesale_id text,
    expiration_date text,
    lot_number text,
    quantity text,
    PRIMARY KEY ("index", order_wholesale_stock_keeping_unit_index, order_wholesale_stock_keeping_unit_order_wholesale_id),
    FOREIGN KEY (order_wholesale_stock_keeping_unit_index) REFERENCES order_wholesale_stock_keeping_unit("index"),
    FOREIGN KEY (order_wholesale_stock_keeping_unit_order_wholesale_id) REFERENCES order_wholesale_stock_keeping_unit(order_wholesale_id)
);

CREATE TABLE order_wholesale_stock_keeping_unit_serial_number (
    "index" text,
    order_wholesale_stock_keeping_unit_index text,
    order_wholesale_stock_keeping_unit_order_wholesale_id text,
    serial_number text,
    PRIMARY KEY ("index", order_wholesale_stock_keeping_unit_index, order_wholesale_stock_keeping_unit_order_wholesale_id),
    FOREIGN KEY (order_wholesale_stock_keeping_unit_index) REFERENCES order_wholesale_stock_keeping_unit("index"),
    FOREIGN KEY (order_wholesale_stock_keeping_unit_order_wholesale_id) REFERENCES order_wholesale_stock_keeping_unit(order_wholesale_id)
);

CREATE TABLE order_wholesale_stock_keeping_unit (
    "index" text,
    order_wholesale_id text,
    description text,
    quantity text,
    stock_keeping_unit text,
    PRIMARY KEY ("index", order_wholesale_id),
    FOREIGN KEY (order_wholesale_id) REFERENCES order_wholesale(id)
);

CREATE TABLE order_wholesale (
    id text,
    "comment" text,
    customer_address_1 text,
    customer_address_2 text,
    customer_address_3 text,
    customer_city text,
    customer_company text,
    customer_country text,
    customer_email text,
    customer_name text,
    customer_postal_code text,
    customer_state_or_province text,
    date_backordered text,
    date_created text,
    phone_number text,
    reference_number text,
    shipping_method text,
    status_description text,
    "type" text,
    warehouse_name text,
    PRIMARY KEY (id)
);

CREATE TABLE backorder_business_stock_keeping_unit_item_lot (
    "index" text,
    backorder_business_stock_keeping_unit_backorder_business_id text,
    backorder_business_stock_keeping_unit_index text,
    expiration_date text,
    lot_number text,
    quantity text,
    PRIMARY KEY ("index", backorder_business_stock_keeping_unit_backorder_business_id, backorder_business_stock_keeping_unit_index),
    FOREIGN KEY (backorder_business_stock_keeping_unit_backorder_business_id) REFERENCES backorder_business_stock_keeping_unit(backorder_business_id),
    FOREIGN KEY (backorder_business_stock_keeping_unit_index) REFERENCES backorder_business_stock_keeping_unit("index")
);

CREATE TABLE backorder_business_stock_keeping_unit_serial_number (
    "index" text,
    backorder_business_stock_keeping_unit_backorder_business_id text,
    backorder_business_stock_keeping_unit_index text,
    serial_number text,
    PRIMARY KEY ("index", backorder_business_stock_keeping_unit_backorder_business_id, backorder_business_stock_keeping_unit_index),
    FOREIGN KEY (backorder_business_stock_keeping_unit_backorder_business_id) REFERENCES backorder_business_stock_keeping_unit(backorder_business_id),
    FOREIGN KEY (backorder_business_stock_keeping_unit_index) REFERENCES backorder_business_stock_keeping_unit("index")
);

CREATE TABLE backorder_business_stock_keeping_unit (
    "index" text,
    backorder_business_id text,
    description text,
    quantity text,
    stock_keeping_unit text,
    PRIMARY KEY ("index", backorder_business_id),
    FOREIGN KEY (backorder_business_id) REFERENCES backorder_business(id)
);

CREATE TABLE backorder_business (
    id text,
    "comment" text,
    customer_address_1 text,
    customer_address_2 text,
    customer_address_3 text,
    customer_city text,
    customer_company text,
    customer_country text,
    customer_email text,
    customer_name text,
    customer_phone_number text,
    customer_postal_code text,
    customer_state_or_province text,
    date_backordered text,
    date_created text,
    reference_number text,
    shipping_method text,
    "type" text,
    warehouse_name text,
    PRIMARY KEY (id)
);
