CREATE TABLE sale_merchant_item_by_date (
    "index" text,
    product_sku text,
    sale_by_date_id text,
    part_number text,
    quantity text,
    unit_price_a text,
    unit_price_s text,
    PRIMARY KEY ("index", product_sku, sale_by_date_id),
    FOREIGN KEY (product_sku) REFERENCES product(sku),
    FOREIGN KEY (sale_by_date_id) REFERENCES sale_by_date(id)
);

CREATE TABLE sale_merchant_kit_item_by_date (
    "index" text,
    sale_by_date_id text,
    sale_merchant_kit_by_date_index text,
    part_number text,
    product_sku text,
    quantity text,
    unit_price_a text,
    unit_price_s text,
    PRIMARY KEY ("index", sale_by_date_id, sale_merchant_kit_by_date_index),
    FOREIGN KEY (sale_by_date_id) REFERENCES sale_merchant_kit_by_date(sale_by_date_id),
    FOREIGN KEY (sale_merchant_kit_by_date_index) REFERENCES sale_merchant_kit_by_date("index")
);

CREATE TABLE sale_merchant_kit_by_date (
    "index" text,
    sale_by_date_id text,
    product_sku text,
    quantity text,
    unit_price_a text,
    unit_price_s text,
    PRIMARY KEY ("index", sale_by_date_id),
    FOREIGN KEY (sale_by_date_id) REFERENCES sale_by_date(id),
    FOREIGN KEY (product_sku) REFERENCES product(sku)
);

CREATE TABLE sale_processed_item_by_date (
    "index" text,
    sale_by_date_id text,
    product_sku text,
    failed_quantity text,
    passed_quantity text,
    picked_quantity text,
    PRIMARY KEY ("index", sale_by_date_id),
    FOREIGN KEY (sale_by_date_id) REFERENCES sale_by_date(id),
    FOREIGN KEY (product_sku) REFERENCES product(sku)
);

CREATE TABLE sale_by_date (
    id text,
    channel text,
    channel_id text,
    client text,
    contact_info_company text,
    contact_info_email text,
    contact_info_firstname text,
    contact_info_lastname text,
    contact_info_phone text,
    fulfilled_items jsonb,
    last_printed_date text,
    market_place text,
    market_place_id text,
    notes text,
    printed_status text,
    sale_date text,
    seller_sale_id text,
    shipping_carrier text,
    shipping_charge_a text,
    shipping_charge_s text,
    shipping_class text,
    shipping_cost_a text,
    shipping_cost_s text,
    shipping_info_address_1 text,
    shipping_info_address_2 text,
    shipping_info_city text,
    shipping_info_country text,
    shipping_info_postal_code text,
    shipping_info_region text,
    "status" text,
    PRIMARY KEY (id)
);

CREATE TABLE product_supplier_info (
    product_sku text,
    supplier_name text,
    cost text,
    is_active text,
    is_primary text,
    lead_time text,
    supplier_part_number text,
    PRIMARY KEY (product_sku, supplier_name),
    FOREIGN KEY (product_sku) REFERENCES product(sku),
    FOREIGN KEY (supplier_name) REFERENCES supplier("name")
);

CREATE TABLE product_picture (
    picture text,
    product_sku text,
    PRIMARY KEY (picture, product_sku),
    FOREIGN KEY (product_sku) REFERENCES product(sku)
);

CREATE TABLE product_attribute (
    _fivetran_id text,
    product_sku text,
    "name" text,
    "value" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (product_sku) REFERENCES product(sku)
);

CREATE TABLE product_status (
    "status" text,
    product_sku text,
    PRIMARY KEY ("status", product_sku),
    FOREIGN KEY (product_sku) REFERENCES product(sku)
);

CREATE TABLE product (
    sku text,
    brand text,
    classification text,
    primary_sku text,
    supplier text,
    client text,
    code text,
    cost text,
    created_date_utc timestamp,
    description text,
    disable_quantity_sync text,
    id text,
    incremental_quantity text,
    is_alternate_code text,
    is_alternate_sku text,
    is_serialized text,
    long_description text,
    minimum_order_quantity text,
    minimum_order_quantity_information text,
    modified_date_utc timestamp,
    part_number text,
    quantity_available text,
    quantity_in_stock text,
    quantity_inbound text,
    quantity_incoming text,
    quantity_on_hand text,
    quantity_on_hold text,
    quantity_pending text,
    quantity_picked text,
    quantity_total_fba text,
    quantity_transfer text,
    reorder_point text,
    retail_price text,
    sale_price text,
    short_description text,
    variation_parent_sku text,
    weight_unit text,
    weight_value text,
    PRIMARY KEY (sku),
    FOREIGN KEY (brand) REFERENCES brand("name"),
    FOREIGN KEY (classification) REFERENCES classification("name"),
    FOREIGN KEY (primary_sku) REFERENCES product(sku),
    FOREIGN KEY (supplier) REFERENCES supplier("name")
);

CREATE TABLE token (
    tenant_token text,
    user_token text,
    PRIMARY KEY (tenant_token, user_token)
);

CREATE TABLE available_alternate_sku (
    alternate_sku text,
    product_sku text,
    PRIMARY KEY (alternate_sku, product_sku),
    FOREIGN KEY (product_sku) REFERENCES available_quantity(product_sku)
);

CREATE TABLE available_quantity (
    product_sku text,
    last_modified_date_time_utc timestamp,
    PRIMARY KEY (product_sku),
    FOREIGN KEY (product_sku) REFERENCES product(sku)
);

CREATE TABLE warehouse (
    code text,
    id text,
    PRIMARY KEY (code)
);

CREATE TABLE classification_attribute (
    "name" text,
    classification_name text,
    is_enabled text,
    is_required text,
    values jsonb,
    PRIMARY KEY ("name", classification_name),
    FOREIGN KEY (classification_name) REFERENCES classification("name")
);

CREATE TABLE classification (
    "name" text,
    is_enabled text,
    PRIMARY KEY ("name")
);

CREATE TABLE brand (
    "name" text,
    is_enabled text,
    PRIMARY KEY ("name")
);

CREATE TABLE external_warehouse_quantitiy (
    product_sku text,
    in_stock_quantity text,
    inbound_quantity text,
    reserve_quantity text,
    total_quantity text,
    transfer_quantity text,
    PRIMARY KEY (product_sku),
    FOREIGN KEY (product_sku) REFERENCES product(sku)
);

CREATE TABLE purchase_order_line_item (
    product_sku text,
    purchase_order_id text,
    cost text,
    identifier text,
    private_notes text,
    public_notes text,
    quantity text,
    quantity_to_3_pl text,
    received_quantity text,
    received_quantity_to_3_pl text,
    retail_cost text,
    variant text,
    PRIMARY KEY (product_sku, purchase_order_id),
    FOREIGN KEY (product_sku) REFERENCES product(sku),
    FOREIGN KEY (purchase_order_id) REFERENCES purchase_order(id)
);

CREATE TABLE purchase_order (
    id text,
    supplier_name text,
    actual_shipped_date timestamp,
    arrival_due_date timestamp,
    carrier_name text,
    class_name text,
    costs jsonb,
    created_date timestamp,
    order_cancel_date timestamp,
    order_date timestamp,
    payment_status text,
    po_number text,
    private_notes text,
    public_notes text,
    requested_ship_date timestamp,
    sent_status text,
    ship_to_address text,
    ship_to_warehouse text,
    "status" text,
    terms_name text,
    tracking_info text,
    PRIMARY KEY (id),
    FOREIGN KEY (supplier_name) REFERENCES supplier("name")
);

CREATE TABLE kit_line_item (
    kit_line_index text,
    kit_sku text,
    product_sku text,
    code text,
    description text,
    PRIMARY KEY (kit_line_index, kit_sku, product_sku),
    FOREIGN KEY (kit_line_index) REFERENCES kit_line("index"),
    FOREIGN KEY (kit_sku) REFERENCES kit_line(kit_sku),
    FOREIGN KEY (product_sku) REFERENCES product(sku)
);

CREATE TABLE kit_line (
    "index" text,
    kit_sku text,
    combine text,
    line_name text,
    quantity text,
    PRIMARY KEY ("index", kit_sku),
    FOREIGN KEY (kit_sku) REFERENCES kit(sku)
);

CREATE TABLE kit_status (
    "status" text,
    kit_sku text,
    PRIMARY KEY ("status", kit_sku),
    FOREIGN KEY (kit_sku) REFERENCES kit(sku)
);

CREATE TABLE kit (
    sku text,
    available_quantity text,
    available_quantity_last_modified_date_time_utc text,
    code text,
    cost text,
    description text,
    last_modified_date_time_utc text,
    PRIMARY KEY (sku)
);

CREATE TABLE location (
    location_code text,
    warehouse_code text,
    container_code text,
    parent_location text,
    total_quantity text,
    warehouse_name text,
    PRIMARY KEY (location_code, warehouse_code),
    FOREIGN KEY (warehouse_code) REFERENCES warehouse(code)
);

CREATE TABLE shipment_cost (
    _fivetran_id text,
    shipment_sale_id text,
    shipment_tracking_number text,
    cost_a text,
    cost_s text,
    cost_type text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (shipment_sale_id) REFERENCES shipment(sale_id),
    FOREIGN KEY (shipment_tracking_number) REFERENCES shipment(tracking_number)
);

CREATE TABLE shipment_parcel_item (
    id text,
    shipment_parcel_number text,
    shipment_sale_id text,
    shipment_tracking_number text,
    product_sku text,
    quantity text,
    PRIMARY KEY (id, shipment_parcel_number, shipment_sale_id, shipment_tracking_number),
    FOREIGN KEY (shipment_parcel_number) REFERENCES shipment_parcel(number),
    FOREIGN KEY (shipment_sale_id) REFERENCES shipment_parcel(shipment_sale_id),
    FOREIGN KEY (shipment_tracking_number) REFERENCES shipment_parcel(shipment_tracking_number),
    FOREIGN KEY (product_sku) REFERENCES product(sku)
);

CREATE TABLE shipment_parcel_kit (
    kit_sku text,
    shipment_parcel_number text,
    shipment_sale_id text,
    shipment_tracking_number text,
    PRIMARY KEY (kit_sku, shipment_parcel_number, shipment_sale_id, shipment_tracking_number),
    FOREIGN KEY (kit_sku) REFERENCES kit(sku),
    FOREIGN KEY (shipment_parcel_number) REFERENCES shipment_parcel(number),
    FOREIGN KEY (shipment_sale_id) REFERENCES shipment_parcel(shipment_sale_id),
    FOREIGN KEY (shipment_tracking_number) REFERENCES shipment_parcel(shipment_tracking_number)
);

CREATE TABLE shipment_parcel (
    number text,
    shipment_sale_id text,
    shipment_tracking_number text,
    dimensionsheight text,
    dimensionslength text,
    dimensionsunit text,
    dimensionswidth text,
    note text,
    weight text,
    weight_unit text,
    PRIMARY KEY (number, shipment_sale_id, shipment_tracking_number),
    FOREIGN KEY (shipment_sale_id) REFERENCES shipment(sale_id),
    FOREIGN KEY (shipment_tracking_number) REFERENCES shipment(tracking_number)
);

CREATE TABLE shipment_landed_cost (
    product_sku text,
    shipment_sale_id text,
    shipment_tracking_number text,
    cost_a text,
    cost_s text,
    PRIMARY KEY (product_sku, shipment_sale_id, shipment_tracking_number),
    FOREIGN KEY (product_sku) REFERENCES product(sku),
    FOREIGN KEY (shipment_sale_id) REFERENCES shipment(sale_id),
    FOREIGN KEY (shipment_tracking_number) REFERENCES shipment(tracking_number)
);

CREATE TABLE shipment (
    tracking_number text,
    sale_id text,
    shipped_from_warehouse_code text,
    alternate_id text,
    carrier text,
    class text,
    created_date text,
    estimated_delivery_date text,
    estimated_ship_date text,
    file_id jsonb,
    manifest_id text,
    note text,
    shipped_from_address_1 text,
    shipped_from_address_2 text,
    shipped_from_city text,
    shipped_from_company text,
    shipped_from_country text,
    shipped_from_email text,
    shipped_from_first_name text,
    shipped_from_last_name text,
    shipped_from_middle_name text,
    shipped_from_postal_code text,
    shipped_from_region text,
    shipped_from_three_pl text,
    "source" text,
    "status" text,
    total_weight text,
    tracking_url text,
    "type" text,
    weight_unit text,
    PRIMARY KEY (tracking_number, sale_id),
    FOREIGN KEY (sale_id) REFERENCES sale(id),
    FOREIGN KEY (shipped_from_warehouse_code) REFERENCES warehouse(code)
);

CREATE TABLE "transaction" (
    transaction_date timestamp,
    product_sku text,
    context_id text,
    context_type text,
    location text,
    lot_number text,
    quantity text,
    quantity_after text,
    quantity_before text,
    scanned_code text,
    title text,
    transaction_note text,
    transaction_reason text,
    transaction_type text,
    username text,
    PRIMARY KEY (transaction_date, product_sku),
    FOREIGN KEY (product_sku) REFERENCES product(sku)
);

CREATE TABLE supplier (
    "name" text,
    is_enabled text,
    PRIMARY KEY ("name")
);

CREATE TABLE serial_number (
    serial_number text,
    location_code text,
    warehouse_code text,
    container_code text,
    PRIMARY KEY (serial_number),
    FOREIGN KEY (location_code) REFERENCES location(location_code),
    FOREIGN KEY (warehouse_code) REFERENCES warehouse(code)
);

CREATE TABLE receive_history (
    product_sku text,
    location text,
    warehouse text,
    part_number text,
    quantity text,
    quantity_3_pl text,
    quantity_to_location text,
    receipt_date timestamp,
    received_date timestamp,
    username text,
    PRIMARY KEY (product_sku),
    FOREIGN KEY (product_sku) REFERENCES product(sku),
    FOREIGN KEY (location) REFERENCES location(location_code),
    FOREIGN KEY (warehouse) REFERENCES warehouse(code)
);

CREATE TABLE receive_correction_quantity_receipt_date (
    _fivetran_id text,
    product_sku text,
    new_quantity text,
    old_quantity text,
    receipt_date timestamp,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (product_sku) REFERENCES receive_correction(product_sku)
);

CREATE TABLE receive_correction (
    product_sku text,
    warehouse text,
    corrected_date timestamp,
    new_quantity text,
    new_quantity_3_pl text,
    old_quantity text,
    old_quantity_3_pl text,
    part_number text,
    ponumber text,
    received_date timestamp,
    username text,
    PRIMARY KEY (product_sku),
    FOREIGN KEY (product_sku) REFERENCES product(sku),
    FOREIGN KEY (warehouse) REFERENCES warehouse(code)
);

CREATE TABLE external_warehouse (
    id text,
    code text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE handling_time_kit (
    account_id text,
    product_sku text,
    quantity text,
    PRIMARY KEY (account_id, product_sku),
    FOREIGN KEY (product_sku) REFERENCES product(sku)
);

CREATE TABLE handling_time_product (
    account_id text,
    kit_sku text,
    quantity text,
    PRIMARY KEY (account_id, kit_sku),
    FOREIGN KEY (kit_sku) REFERENCES kit(sku)
);

CREATE TABLE inventory_location (
    location_code text,
    sku text,
    warehouse_code text,
    quantity text,
    reserve text,
    PRIMARY KEY (location_code, sku, warehouse_code),
    FOREIGN KEY (warehouse_code) REFERENCES warehouse(code)
);

CREATE TABLE sale_item_promotion (
    code text,
    product_sku text,
    item_discount_a text,
    item_discount_s text,
    shipping_discount_a text,
    shipping_discount_s text,
    PRIMARY KEY (code, product_sku),
    FOREIGN KEY (product_sku) REFERENCES sale_item(product_sku)
);

CREATE TABLE sale_item (
    product_sku text,
    sale_id text,
    quantity text,
    taxes text,
    unit_price_a text,
    unit_price_s text,
    PRIMARY KEY (product_sku),
    FOREIGN KEY (product_sku) REFERENCES product(sku),
    FOREIGN KEY (sale_id) REFERENCES sale(id)
);

CREATE TABLE sale_kit (
    kit_sku text,
    sale_id text,
    kit_items jsonb,
    quantity text,
    unit_price_a text,
    unit_price_s text,
    PRIMARY KEY (kit_sku, sale_id),
    FOREIGN KEY (kit_sku) REFERENCES kit(sku),
    FOREIGN KEY (sale_id) REFERENCES sale(id)
);

CREATE TABLE sale_charge (
    _fivetran_id text,
    sale_id text,
    amount_a text,
    amount_s text,
    "type" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (sale_id) REFERENCES sale(id)
);

CREATE TABLE sale_promotion (
    code text,
    sale_id text,
    order_discount_a text,
    order_discount_s text,
    shipping_discount_a text,
    shipping_discount_s text,
    "type" text,
    PRIMARY KEY (code, sale_id),
    FOREIGN KEY (sale_id) REFERENCES sale(id)
);

CREATE TABLE sale (
    id text,
    channel_id text,
    contact_infocompany text,
    contact_infoemail text,
    contact_infofirst_name text,
    contact_infolast_name text,
    contact_infophone text,
    fulfilled_items jsonb,
    fulfilled_kits jsonb,
    last_printed_date text,
    marketplace text,
    marketplace_id text,
    notes text,
    printed_status text,
    sale_date text,
    seller_sale_id text,
    shipping_carrier text,
    shipping_chargea text,
    shipping_charges text,
    shipping_class text,
    shipping_costa text,
    shipping_costs text,
    shipping_infoaddress_1 text,
    shipping_infoaddress_2 text,
    shipping_infocity text,
    shipping_infocountry text,
    shipping_infopostal_code text,
    shipping_inforegion text,
    "status" text,
    PRIMARY KEY (id)
);

CREATE TABLE item_quantity (
    product_sku text,
    last_modified_date_time_utc timestamp,
    PRIMARY KEY (product_sku),
    FOREIGN KEY (product_sku) REFERENCES product(sku)
);

CREATE TABLE incoming_item (
    product_sku text,
    third_party_logistic_quantity text,
    PRIMARY KEY (product_sku),
    FOREIGN KEY (product_sku) REFERENCES product(sku)
);
