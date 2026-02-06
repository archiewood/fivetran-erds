CREATE TABLE rma_auth_line (
    item_number text,
    rma_id text,
    description text,
    quantity text,
    serial_number text,
    PRIMARY KEY (item_number, rma_id),
    FOREIGN KEY (rma_id) REFERENCES rma(id)
);

CREATE TABLE rma_return_detail (
    item_number text,
    rma_id text,
    authorized_line_number text,
    authorized_quantity text,
    "condition" text,
    condition_code text,
    disposition text,
    disposition_code text,
    is_cancelled text,
    om_line_number text,
    received_date text,
    received_quantity text,
    received_serial_number text,
    PRIMARY KEY (item_number, rma_id),
    FOREIGN KEY (rma_id) REFERENCES rma(id)
);

CREATE TABLE rma_ship_line (
    item_number text,
    rma_id text,
    description text,
    price text,
    quantity text,
    PRIMARY KEY (item_number, rma_id),
    FOREIGN KEY (rma_id) REFERENCES rma(id)
);

CREATE TABLE rma_received_line (
    item_number text,
    rma_id text,
    "condition" text,
    disposition text,
    line_number text,
    quantity text,
    received_on text,
    serial_number text,
    PRIMARY KEY (item_number, rma_id),
    FOREIGN KEY (rma_id) REFERENCES rma(id)
);

CREATE TABLE rma_line (
    item_number text,
    rma_id text,
    description text,
    price text,
    quantity text,
    serial_number text,
    ship_description text,
    ship_item_number text,
    ship_price text,
    ship_quantity text,
    PRIMARY KEY (item_number, rma_id),
    FOREIGN KEY (rma_id) REFERENCES rma(id)
);

CREATE TABLE rma (
    id text,
    cancelled_date text,
    comments text,
    custom_option_1 text,
    custom_option_2 text,
    custom_option_3 text,
    custom_option_4 text,
    custom_option_5 text,
    custom_option_6 text,
    custom_option_7 text,
    customer_number text,
    disposition text,
    expired_date text,
    order_amount text,
    original_order_number text,
    received_lines text,
    replacement_order text,
    restocking_fee text,
    return_label_tracking_number text,
    return_label_url text,
    rma_account_number text,
    rma_date text,
    rma_location text,
    rma_type text,
    sales_tax text,
    ship_lines text,
    shipping_account_number text,
    shipping_address_address_1 text,
    shipping_address_address_2 text,
    shipping_address_attention text,
    shipping_address_city text,
    shipping_address_company text,
    shipping_address_country text,
    shipping_address_email text,
    shipping_address_phone text,
    shipping_address_postal_code text,
    shipping_address_state_province text,
    shipping_carrier text,
    shipping_handling text,
    shipping_instructions text,
    shipping_location text,
    shipping_service text,
    total_amount text,
    PRIMARY KEY (id)
);

CREATE TABLE item_lot (
    lot_number text,
    item_id text,
    available text,
    committed text,
    expiration_date text,
    in_process text,
    on_hand text,
    on_hold text,
    PRIMARY KEY (lot_number, item_id),
    FOREIGN KEY (item_id) REFERENCES item(id)
);

CREATE TABLE item (
    id text,
    available text,
    committed text,
    dcl_quantity text,
    description text,
    in_process text,
    inventory_type text,
    min_quantity text,
    net_available text,
    on_demand text,
    on_hand text,
    on_hold text,
    open_po text,
    open_rma text,
    open_wo text,
    PRIMARY KEY (id)
);

CREATE TABLE order_line_bundle_line (
    item_number text,
    line_number text,
    order_line_item_number text,
    comments text,
    custom_field_1 text,
    custom_field_2 text,
    custom_field_3 text,
    custom_field_4 text,
    custom_field_5 text,
    description text,
    do_not_ship_before text,
    is_back_order text,
    price text,
    quantity text,
    ship_by text,
    PRIMARY KEY (item_number, line_number, order_line_item_number),
    FOREIGN KEY (order_line_item_number) REFERENCES order_line(item_number)
);

CREATE TABLE order_line (
    item_number text,
    order_number text,
    comments text,
    custom_field_1 text,
    custom_field_2 text,
    custom_field_3 text,
    custom_field_4 text,
    custom_field_5 text,
    description text,
    do_not_ship_before text,
    is_back_order text,
    line_number text,
    price text,
    quantity text,
    ship_by text,
    PRIMARY KEY (item_number, order_number),
    FOREIGN KEY (order_number) REFERENCES orders(order_number)
);

CREATE TABLE order_shipment_shipped_line_serial_number (
    serial_number text,
    order_shipment_shipped_line_item_number text,
    ship_id text,
    PRIMARY KEY (serial_number, order_shipment_shipped_line_item_number, ship_id),
    FOREIGN KEY (order_shipment_shipped_line_item_number) REFERENCES order_shipment_shipped_line(item_number),
    FOREIGN KEY (ship_id) REFERENCES order_shipment(ship_id)
);

CREATE TABLE order_shipment_shipped_line_lot_number (
    lot_number text,
    item_number text,
    ship_id text,
    PRIMARY KEY (lot_number, item_number, ship_id),
    FOREIGN KEY (item_number) REFERENCES order_shipment_shipped_line(item_number),
    FOREIGN KEY (ship_id) REFERENCES order_shipment(ship_id)
);

CREATE TABLE order_shipment_shipped_line_bundle_line (
    item_number text,
    order_shipment_shipped_line_item_number text,
    ship_id text,
    custom_field text,
    description text,
    line_number text,
    quantity text,
    PRIMARY KEY (item_number, order_shipment_shipped_line_item_number, ship_id),
    FOREIGN KEY (order_shipment_shipped_line_item_number) REFERENCES order_shipment_shipped_line(item_number),
    FOREIGN KEY (ship_id) REFERENCES order_shipment(ship_id)
);

CREATE TABLE order_shipment_shipped_line (
    item_number text,
    ship_id text,
    custom_field text,
    description text,
    line_number text,
    quantity text,
    PRIMARY KEY (item_number, ship_id),
    FOREIGN KEY (ship_id) REFERENCES order_shipment(ship_id)
);

CREATE TABLE order_shipment_package_item_serial_number (
    serial_number text,
    carton_id text,
    item_number text,
    ship_id text,
    PRIMARY KEY (serial_number, carton_id, item_number, ship_id),
    FOREIGN KEY (carton_id) REFERENCES order_shipment_package(carton_id),
    FOREIGN KEY (item_number) REFERENCES order_shipment_package_shipped_item(item_number),
    FOREIGN KEY (ship_id) REFERENCES order_shipment(ship_id)
);

CREATE TABLE order_shipment_package_item_lot_number (
    lot_number text,
    carton_id text,
    item_number text,
    ship_id text,
    PRIMARY KEY (lot_number, carton_id, item_number, ship_id),
    FOREIGN KEY (carton_id) REFERENCES order_shipment_package(carton_id),
    FOREIGN KEY (item_number) REFERENCES order_shipment_package_shipped_item(item_number),
    FOREIGN KEY (ship_id) REFERENCES order_shipment(ship_id)
);

CREATE TABLE order_shipment_package_shipped_item (
    item_number text,
    carton_id text,
    ship_id text,
    custom_field text,
    description text,
    line_number text,
    quantity text,
    PRIMARY KEY (item_number, carton_id, ship_id),
    FOREIGN KEY (carton_id) REFERENCES order_shipment_package(carton_id),
    FOREIGN KEY (ship_id) REFERENCES order_shipment(ship_id)
);

CREATE TABLE order_shipment_package (
    carton_id text,
    ship_id text,
    asn text,
    carton_count_number text,
    delivery_date text,
    delivery_status text,
    dimension text,
    freight text,
    tracking_number text,
    weight text,
    PRIMARY KEY (carton_id, ship_id),
    FOREIGN KEY (ship_id) REFERENCES order_shipment(ship_id)
);

CREATE TABLE order_shipment (
    ship_id text,
    order_number text,
    freight_account text,
    reference_1 text,
    reference_2 text,
    reference_3 text,
    reference_4 text,
    rs_tracking_number text,
    ship_date text,
    shipping_address text,
    shipping_carrier text,
    shipping_service text,
    total_charge text,
    total_weight text,
    PRIMARY KEY (ship_id),
    FOREIGN KEY (order_number) REFERENCES orders(order_number)
);

CREATE TABLE orders (
    order_number text,
    account_number text,
    amount_paid text,
    balance_due_us text,
    billing_address_address_1 text,
    billing_address_address_2 text,
    billing_address_attention text,
    billing_address_city text,
    billing_address_company text,
    billing_address_country text,
    billing_address_email text,
    billing_address_phone text,
    billing_address_postal_code text,
    billing_address_state_province text,
    consignee_number text,
    custom_field_1 text,
    custom_field_2 text,
    custom_field_3 text,
    custom_field_4 text,
    custom_field_5 text,
    customer_number text,
    fob text,
    freight_account text,
    international_code text,
    international_declared_value text,
    international_handling text,
    is_back_order text,
    is_cancelled text,
    location text,
    modified_at timestamp,
    net_due_currency text,
    order_stage text,
    order_status text,
    order_subtotal text,
    ordered_date text,
    packing_list_comments text,
    packing_list_type text,
    payment_type text,
    po_number text,
    received_date text,
    sales_tax text,
    shipping_address_address_1 text,
    shipping_address_address_2 text,
    shipping_address_attention text,
    shipping_address_city text,
    shipping_address_company text,
    shipping_address_country text,
    shipping_address_email text,
    shipping_address_phone text,
    shipping_address_postal_code text,
    shipping_address_state_province text,
    shipping_carrier text,
    shipping_handling text,
    shipping_instructions text,
    shipping_service text,
    stage_description text,
    system_id text,
    terms text,
    total_due text,
    "type" text,
    PRIMARY KEY (order_number)
);
