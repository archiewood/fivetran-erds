CREATE TABLE shipment (
    shipment_id text,
    actual_delivery text,
    actual_pickup text,
    barcode text,
    barcode_latest_event text,
    booking_id text,
    from_date text,
    from_date_end text,
    from_date_start text,
    from_date_type text,
    goods_total_colli text,
    goods_total_load_meter text,
    goods_total_volume text,
    goods_total_weight text,
    main_tms_shipment_id text,
    mode_of_transport text,
    requested_delivery text,
    requested_pickup text,
    "status" text,
    to_date text,
    to_date_end text,
    to_date_start text,
    to_date_type text,
    PRIMARY KEY (shipment_id)
);

CREATE TABLE events (
    "index" text,
    shipment_id text,
    cargo_availability text,
    cargo_cut_off text,
    code text,
    "date" text,
    description text,
    groups text,
    location_country_code text,
    location_place text,
    location_unlocode text,
    transport_mode text,
    "type" text,
    type_value text,
    vessel_name text,
    voyage_flight_no text,
    voyage_id text,
    PRIMARY KEY ("index", shipment_id),
    FOREIGN KEY (shipment_id) REFERENCES shipment_detail(shipment_id)
);

CREATE TABLE dangerous_package (
    _fivetran_id text,
    package_index text,
    shipment_id text,
    class_name text,
    empty text,
    flash_point text,
    gross_quantity text,
    gross_quantity_unit text,
    limited_quantity text,
    marine_pollutant text,
    net_quantity text,
    net_quantity_unit text,
    package_count text,
    packing_group text,
    packing_kind text,
    proper_shipping_name text,
    sub_risk text,
    technical_name text,
    technical_name_national text,
    temperature_from text,
    temperature_to text,
    tunnel_code text,
    "type" text,
    un_code text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (package_index) REFERENCES package("index"),
    FOREIGN KEY (shipment_id) REFERENCES package(shipment_id)
);

CREATE TABLE package_reference (
    "index" text,
    shipment_id text,
    package_index text,
    qualifier text,
    reference text,
    PRIMARY KEY ("index", shipment_id),
    FOREIGN KEY (shipment_id) REFERENCES package(shipment_id),
    FOREIGN KEY (package_index) REFERENCES package("index")
);

CREATE TABLE package (
    "index" text,
    shipment_id text,
    cargo_aircraft_only text,
    container_no text,
    description text,
    goods_type text,
    gross_weight text,
    height text,
    height_uom text,
    is_dangerous text,
    length text,
    length_uom text,
    loading_meters text,
    net_weight text,
    package_type text,
    pallet_space text,
    quantity text,
    shipping_mark text,
    stackable jsonb,
    temperature_controlled text,
    temperature_max text,
    temperature_min text,
    total_volume text,
    total_weight text,
    tracking_number jsonb,
    volume_uom text,
    width text,
    width_uom text,
    PRIMARY KEY ("index", shipment_id),
    FOREIGN KEY (shipment_id) REFERENCES shipment_detail(shipment_id)
);

CREATE TABLE product_container (
    "index" text,
    shipment_id text,
    genset text,
    ref text,
    temp text,
    "type" text,
    PRIMARY KEY ("index", shipment_id),
    FOREIGN KEY (shipment_id) REFERENCES shipment_detail(shipment_id)
);

CREATE TABLE container (
    "index" text,
    shipment_id text,
    container_number text,
    container_type text,
    seal_number text,
    PRIMARY KEY ("index", shipment_id),
    FOREIGN KEY (shipment_id) REFERENCES shipment_detail(shipment_id)
);

CREATE TABLE issue (
    "index" text,
    shipment_id text,
    "date" text,
    note text,
    party_code text,
    party_description text,
    point_code text,
    point_description text,
    reason_code text,
    reason_description text,
    resolved text,
    type_code text,
    type_description text,
    PRIMARY KEY ("index", shipment_id),
    FOREIGN KEY (shipment_id) REFERENCES shipment_detail(shipment_id)
);

CREATE TABLE proof_of_delivery (
    document_id text,
    shipment_id text,
    create_date text,
    document_type text,
    download_url text,
    file_name text,
    file_type text,
    type_description text,
    PRIMARY KEY (document_id, shipment_id),
    FOREIGN KEY (shipment_id) REFERENCES shipment_detail(shipment_id)
);

CREATE TABLE selected_service (
    "index" text,
    shipment_id text,
    code text,
    detail jsonb,
    "name" text,
    PRIMARY KEY ("index", shipment_id),
    FOREIGN KEY (shipment_id) REFERENCES shipment_detail(shipment_id)
);

CREATE TABLE reference (
    "index" text,
    shipment_id text,
    "type" text,
    "value" text,
    PRIMARY KEY ("index", shipment_id),
    FOREIGN KEY (shipment_id) REFERENCES shipment_detail(shipment_id)
);

CREATE TABLE child_shipment_id (
    "index" text,
    shipment_id text,
    child_shipment_id text,
    PRIMARY KEY ("index", shipment_id),
    FOREIGN KEY (shipment_id) REFERENCES shipment_detail(shipment_id)
);

CREATE TABLE shipment_detail (
    shipment_id text,
    booking_id text,
    booked_by text,
    carrier_tracking_id text,
    customs_entry_number jsonb,
    customs_removal_mode text,
    customs_shipped_onboard_date text,
    customs_status text,
    delivery_date text,
    delivery_end text,
    delivery_instruction text,
    delivery_start text,
    goods_description text,
    goods_gross_weight_uom text,
    goods_gross_weight_value text,
    goods_loading_meters_uom text,
    goods_loading_meters_value text,
    goods_quantity_uom text,
    goods_quantity_value text,
    goods_volume_uom text,
    goods_volume_value text,
    incoterms_code text,
    incoterms_location text,
    master_shipment_id text,
    pickup_date text,
    pickup_end text,
    pickup_instruction text,
    pickup_start text,
    product_bill_of_lading text,
    product_container_mode text,
    product_drop_off text,
    product_name text,
    public_shipment_id text,
    service_level_code text,
    service_level_description text,
    shipment_note text,
    "status" text,
    transport_awb text,
    transport_destination_code text,
    transport_destination_name text,
    transport_house_bill_number text,
    transport_master_bill_number text,
    transport_origin_code text,
    transport_origin_name text,
    PRIMARY KEY (shipment_id),
    FOREIGN KEY (shipment_id) REFERENCES shipment(shipment_id),
    FOREIGN KEY (booking_id) REFERENCES shipment(shipment_id)
);

CREATE TABLE address (
    "index" text,
    shipment_id text,
    address_id text,
    address_line_1 text,
    address_line_2 text,
    address_line_3 text,
    address_type text,
    city text,
    company_name text,
    country_code text,
    email text,
    instruction text,
    mdm text,
    "name" text,
    "role" text,
    "state" text,
    telephone text,
    zip_code text,
    PRIMARY KEY ("index", shipment_id),
    FOREIGN KEY (shipment_id) REFERENCES shipment_detail(shipment_id)
);
