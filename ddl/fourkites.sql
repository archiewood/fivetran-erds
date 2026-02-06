CREATE TABLE shipment_purchase_order_number (
    "index" text,
    shipment_id text,
    purchase_order_number text,
    PRIMARY KEY ("index", shipment_id),
    FOREIGN KEY (shipment_id) REFERENCES shipment(id)
);

CREATE TABLE shipment_reference_number (
    "index" text,
    shipment_id text,
    reference_number text,
    PRIMARY KEY ("index", shipment_id),
    FOREIGN KEY (shipment_id) REFERENCES shipment(id)
);

CREATE TABLE shipment_stop (
    id text,
    shipment_id text,
    arrival_time text,
    city text,
    country text,
    customer_id text,
    customer_name text,
    departure_time text,
    external_address_id text,
    latitude text,
    longitude text,
    schedule_appointment_time text,
    schedule_appointment_window_end text,
    schedule_appointment_window_start text,
    schedule_want_time text,
    "sequence" text,
    "state" text,
    "status" text,
    stop_name text,
    stop_type text,
    timezone text,
    PRIMARY KEY (id, shipment_id),
    FOREIGN KEY (shipment_id) REFERENCES shipment(id)
);

CREATE TABLE shipment (
    id text,
    four_kites_eta text,
    identifiers_consignment_number text,
    identifiers_consignment_sequence text,
    identifiers_pro_number text,
    latest_location_latitude text,
    latest_location_longitude text,
    latest_location_name text,
    latest_location_timezone text,
    latest_location_updated_time text,
    load_number text,
    number_of_delivery_stop text,
    remaining_distance_in_meter text,
    scac text,
    stakeholder_carrier text,
    stakeholder_shipper text,
    stakeholder_third_party_logistics text,
    "status" text,
    timezone text,
    total_distance_in_meter text,
    PRIMARY KEY (id)
);

CREATE TABLE shipment_e_url (
    _fivetran_id text,
    shipment_id text,
    data text,
    PRIMARY KEY (_fivetran_id, shipment_id),
    FOREIGN KEY (shipment_id) REFERENCES shipment(id)
);

CREATE TABLE shipment_stop_e_url (
    _fivetran_id text,
    shipment_id text,
    shipment_stop_id text,
    data text,
    PRIMARY KEY (_fivetran_id, shipment_id, shipment_stop_id),
    FOREIGN KEY (shipment_id) REFERENCES shipment(id),
    FOREIGN KEY (shipment_stop_id) REFERENCES shipment_stop(id)
);
