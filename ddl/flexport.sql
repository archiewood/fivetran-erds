CREATE TABLE commercial_invoice_line_item (
    _fivetran_id text,
    commercial_invoice_id text,
    product_id text,
    container_number text,
    document_line_number text,
    first_sale_value_amount text,
    first_sale_value_currency_code text,
    first_sale_value_object text,
    manufacturer_address text,
    manufacturer_name text,
    metadata jsonb,
    net_net_weight_object text,
    net_net_weight_unit text,
    net_net_weight_value text,
    net_value_amount text,
    net_value_currency_code text,
    net_value_object text,
    net_weight_object text,
    net_weight_unit text,
    net_weight_value text,
    object text,
    po_line_item_number text,
    price_per_unit_amount text,
    price_per_unit_currency_code text,
    price_per_unit_object text,
    purchase_order_number text,
    total_units text,
    value_amount text,
    value_currency_code text,
    value_object text,
    volume_object text,
    volume_unit text,
    volume_value text,
    weight_object text,
    weight_unit text,
    weight_value text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (commercial_invoice_id) REFERENCES commercial_invoice(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE commercial_invoice_involved_party (
    _fivetran_id text,
    commercial_invoice_id text,
    company_entity_id text,
    mailing_city text,
    mailing_country text,
    mailing_country_code text,
    mailing_object text,
    mailing_ref text,
    mailing_state text,
    mailing_street_address text,
    mailing_street_address_2 text,
    mailing_timezone text,
    mailing_unlocode text,
    mailing_zip text,
    "name" text,
    object text,
    "type" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (commercial_invoice_id) REFERENCES commercial_invoice(id),
    FOREIGN KEY (company_entity_id) REFERENCES company_entity(id)
);

CREATE TABLE commercial_invoice (
    id text,
    shipment_id text,
    currency text,
    digitization_status text,
    invoice_date text,
    invoice_number text,
    is_related_parties text,
    metadata jsonb,
    object text,
    order_number text,
    total_unit_count text,
    total_value_amount text,
    total_value_currency_code text,
    total_value_object text,
    total_volume_object text,
    total_volume_unit text,
    total_volume_value text,
    total_weight_object text,
    total_weight_unit text,
    total_weight_value text,
    PRIMARY KEY (id),
    FOREIGN KEY (shipment_id) REFERENCES shipment(id)
);

CREATE TABLE document (
    id text,
    shipment_id text,
    archived_at text,
    document_type text,
    file_link text,
    file_metadata_object text,
    file_metadata_size text,
    file_metadata_uploaded_at text,
    file_name text,
    memo text,
    object text,
    PRIMARY KEY (id),
    FOREIGN KEY (shipment_id) REFERENCES shipment(id)
);

CREATE TABLE container_leg_date (
    _fivetran_id text,
    container_leg_id text,
    actual_loaded_on_board_date text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (container_leg_id) REFERENCES container_leg(id)
);

CREATE TABLE container_leg (
    id text,
    container_id text,
    shipment_leg_id text,
    object text,
    PRIMARY KEY (id),
    FOREIGN KEY (container_id) REFERENCES container(id),
    FOREIGN KEY (shipment_leg_id) REFERENCES shipment_leg(id)
);

CREATE TABLE shipment_leg (
    id text,
    actual_arrival_date text,
    actual_departure_date text,
    additional_cargo_ready_date text,
    additional_delivery_appointment_requested_at_date text,
    additional_delivery_appointment_requested_date text,
    additional_delivery_appointment_scheduled_at_date text,
    additional_delivery_appointment_scheduled_date text,
    additional_delivery_completed text,
    additional_loaded_on_truck_date text,
    air_leg_flight_number text,
    air_leg_iata_code text,
    air_leg_icao_code text,
    air_leg_object text,
    cargo_ready_date text,
    carrier_name text,
    container_leg_link text,
    container_leg_object text,
    deleted_at text,
    destination_object text,
    destination_place_name text,
    destination_place_object text,
    destination_terminal text,
    destination_terminal_firms_code text,
    destination_terminal_name text,
    destination_terminal_object text,
    estimated_arrival_date text,
    estimated_departure_date text,
    object text,
    ocean_leg_container_legs_link text,
    ocean_leg_container_legs_object text,
    ocean_leg_object text,
    ocean_leg_scac_code text,
    ocean_leg_vessel_imo text,
    ocean_leg_vessel_name text,
    ocean_leg_voyage_number text,
    origin_object text,
    origin_place_name text,
    origin_place_object text,
    origin_terminal_firms_code text,
    origin_terminal_name text,
    origin_terminal_object text,
    rail_leg_container_legs_link text,
    rail_leg_container_legs_object text,
    rail_leg_object text,
    shipment_id text,
    transportation_mode text,
    trucking_leg_container_less_leg_link text,
    trucking_leg_container_less_object text,
    trucking_leg_object text,
    trucking_leg_pieces text,
    trucking_leg_scac_code text,
    trucking_leg_service_type text,
    trucking_leg_tracking_number text,
    PRIMARY KEY (id)
);

CREATE TABLE tags (
    _fivetran_id text,
    shipment_leg_id text,
    tags text,
    "type" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (shipment_leg_id) REFERENCES shipment_leg(id)
);

CREATE TABLE detail (
    _fivetran_id text,
    parent_id text,
    country_code text,
    detail_type text,
    iata_code text,
    icao_code text,
    manufacturer_code text,
    object text,
    port_code text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (parent_id) REFERENCES shipment_leg(id)
);

CREATE TABLE address (
    _fivetran_id text,
    parent_id text,
    address_type text,
    city text,
    country text,
    country_code text,
    object text,
    ref text,
    "state" text,
    street_address text,
    street_address_2 text,
    timezone text,
    unlocode text,
    zip text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (parent_id) REFERENCES shipment_leg(id)
);

CREATE TABLE company_entity_company (
    company_entity_id text,
    company_id text,
    PRIMARY KEY (company_entity_id, company_id),
    FOREIGN KEY (company_entity_id) REFERENCES company_entity(id),
    FOREIGN KEY (company_id) REFERENCES company(id)
);

CREATE TABLE company (
    id text,
    contact_link text,
    contact_object text,
    editable text,
    location_link text,
    location_object text,
    metadata jsonb,
    "name" text,
    object text,
    ref text,
    PRIMARY KEY (id)
);

CREATE TABLE purchase_order_party_contact (
    _fivetran_id text,
    purchase_order_party_company_entity_id text,
    purchase_order_party_purchase_order_id text,
    department text,
    email text,
    fax text,
    "name" text,
    object text,
    phone text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (purchase_order_party_company_entity_id) REFERENCES purchase_order_party(company_entity_id),
    FOREIGN KEY (purchase_order_party_purchase_order_id) REFERENCES purchase_order_party(purchase_order_id)
);

CREATE TABLE purchase_order_party (
    company_entity_id text,
    purchase_order_id text,
    location_city text,
    location_country text,
    location_country_code text,
    location_object text,
    location_ref text,
    location_state text,
    location_street_address text,
    location_street_address_2 text,
    location_timezone text,
    location_unlocode text,
    location_zip text,
    object text,
    "role" text,
    PRIMARY KEY (company_entity_id, purchase_order_id),
    FOREIGN KEY (company_entity_id) REFERENCES company_entity(id),
    FOREIGN KEY (purchase_order_id) REFERENCES purchase_order(id)
);

CREATE TABLE purchase_order (
    id text,
    buyer_id text,
    seller_id text,
    archived_at text,
    cargo_ready_date text,
    created_at text,
    destination_port_name text,
    destination_port_object text,
    freight_paymnet_term text,
    incoterm text,
    issue_date text,
    line_itemlink text,
    line_itemobject text,
    line_itemref_type text,
    memo text,
    metadata jsonb,
    must_arrive_date text,
    "name" text,
    object text,
    order_class text,
    order_type text,
    origin_port_name text,
    origin_port_object text,
    priority text,
    "status" text,
    transportation_mode text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (buyer_id) REFERENCES shipment_buyer(id),
    FOREIGN KEY (seller_id) REFERENCES shipment_entity(id)
);

CREATE TABLE location (
    id text,
    company_id text,
    contacts_link text,
    contacts_object text,
    contacts_ref_type text,
    editable text,
    metadata jsonb,
    "name" text,
    object text,
    PRIMARY KEY (id),
    FOREIGN KEY (company_id) REFERENCES company(id)
);

CREATE TABLE shipment_buyer (
    id text,
    shipment_id text,
    mailing_city text,
    mailing_country text,
    mailing_country_code text,
    mailing_object text,
    mailing_ref text,
    mailing_state text,
    mailing_street_address text,
    mailing_street_address_2 text,
    mailing_timezone text,
    mailing_unlocode text,
    mailing_zip text,
    "name" text,
    object text,
    ref text,
    PRIMARY KEY (id),
    FOREIGN KEY (shipment_id) REFERENCES shipment(id)
);

CREATE TABLE shipment_item (
    id text,
    product_id text,
    shipment_id text,
    object text,
    purchase_order_number text,
    total_units text,
    total_vloume_object text,
    total_vloume_unit text,
    total_vloume_value text,
    total_weight_object text,
    total_weight_unit text,
    total_weight_value text,
    PRIMARY KEY (id),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (shipment_id) REFERENCES shipment(id)
);

CREATE TABLE shipment_importers_record (
    id text,
    shipment_id text,
    mailing_city text,
    mailing_country text,
    mailing_country_code text,
    mailing_object text,
    mailing_ref text,
    mailing_state text,
    mailing_street_address text,
    mailing_street_address_2 text,
    mailing_timezone text,
    mailing_unlocode text,
    mailing_zip text,
    "name" text,
    object text,
    ref text,
    PRIMARY KEY (id),
    FOREIGN KEY (shipment_id) REFERENCES shipment(id)
);

CREATE TABLE shipment_child (
    id text,
    shipment_id text,
    link text,
    object text,
    PRIMARY KEY (id, shipment_id),
    FOREIGN KEY (shipment_id) REFERENCES shipment(id)
);

CREATE TABLE shipment_dangerious_goods_classification (
    classification text,
    shipment_id text,
    PRIMARY KEY (classification, shipment_id),
    FOREIGN KEY (shipment_id) REFERENCES shipment(id)
);

CREATE TABLE shipment (
    id text,
    parent_shipment_id text,
    actual_arrival_date text,
    actual_delivered_in_full_date text,
    actual_departure_date text,
    actual_picked_up_in_full_date text,
    air_shipment_chargeable_volume_object text,
    air_shipment_chargeable_volume_unit text,
    air_shipment_chargeable_volume_value text,
    air_shipment_chargeable_weight_object text,
    air_shipment_chargeable_weight_unit text,
    air_shipment_chargeable_weight_value text,
    air_shipment_house_airway_bill text,
    air_shipment_master_airway_bill text,
    air_shipment_object text,
    archived_at text,
    arrival_date text,
    belongs_to_a_buyers_consol text,
    booking_id text,
    calculated_volume_object text,
    calculated_volume_unit text,
    calculated_volume_value text,
    calculated_weight_object text,
    calculated_weight_unit text,
    calculated_weight_value text,
    cargo_ready_date text,
    commercial_invoices_link text,
    commercial_invoices_object text,
    created_date text,
    customs_entries_link text,
    customs_entries_object text,
    dangerous_goods_object text,
    dangerous_goods_review_status text,
    delivered_in_full_date text,
    departure_date text,
    documents_link text,
    documents_object text,
    estimated_arrival_date text,
    estimated_delivered_in_full_date text,
    estimated_departure_date text,
    estimated_picked_up_in_full_date text,
    freight_type text,
    incoterm text,
    it_number text,
    legs_link text,
    legs_object text,
    metadata jsonb,
    "name" text,
    object text,
    ocean_shipment_carrier_booking_number text,
    ocean_shipment_confirmed_space_released_at text,
    ocean_shipment_containers_link text,
    ocean_shipment_containers_object text,
    ocean_shipment_house_bill_number text,
    ocean_shipment_is_lcl text,
    ocean_shipment_master_bill_number text,
    ocean_shipment_object text,
    picked_up_in_full_date text,
    pieces text,
    priority text,
    "status" text,
    target_delivery_date text,
    transportation_mode text,
    updated_at text,
    visibility_only text,
    wants_commercial_invoice_transcription text,
    wants_delivery_service text,
    wants_export_customs_service text,
    wants_flexport_freight text,
    wants_flexport_insurance text,
    wants_freight_management_bco text,
    wants_import_customs_service text,
    wants_pickup_service text,
    wants_trade_declaration_service text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES booking(id),
    FOREIGN KEY (parent_shipment_id) REFERENCES shipment(id)
);

CREATE TABLE vat_number (
    _fivetran_id text,
    parent_id text,
    country_code text,
    number text,
    object text,
    vat_number_type text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (parent_id) REFERENCES booking(id)
);

CREATE TABLE shipment_entity (
    id text,
    shipment_id text,
    entity_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (shipment_id) REFERENCES shipment(id)
);

CREATE TABLE custom_entry (
    id text,
    shipment_id text,
    entry_number text,
    object text,
    release_date text,
    release_status text,
    PRIMARY KEY (id),
    FOREIGN KEY (shipment_id) REFERENCES shipment(id)
);

CREATE TABLE contact (
    id text,
    company_id text,
    email text,
    locations_link text,
    locations_object text,
    locations_ref_type text,
    "name" text,
    object text,
    phone_number text,
    PRIMARY KEY (id),
    FOREIGN KEY (company_id) REFERENCES company(id)
);

CREATE TABLE booking_line_item (
    id text,
    booking_id text,
    purchase_order_line_item_id text,
    object text,
    unit text,
    PRIMARY KEY (id),
    FOREIGN KEY (booking_id) REFERENCES booking(id),
    FOREIGN KEY (purchase_order_line_item_id) REFERENCES purchase_order_line_item(id)
);

CREATE TABLE product_supplier (
    id text,
    product_id text,
    country_of_origin text,
    object text,
    ref text,
    PRIMARY KEY (id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE product_classification_code (
    hs_code text,
    product_classification_id text,
    PRIMARY KEY (hs_code, product_classification_id),
    FOREIGN KEY (hs_code) REFERENCES hs(code),
    FOREIGN KEY (product_classification_id) REFERENCES product_classification("index")
);

CREATE TABLE product_classification (
    "index" text,
    product_id text,
    region text,
    PRIMARY KEY ("index"),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (region) REFERENCES hs(country_code)
);

CREATE TABLE product_property (
    _fivetran_id text,
    product_id text,
    object text,
    "type" text,
    "value" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE product (
    id text,
    archived_at text,
    client_verified text,
    description text,
    "name" text,
    object text,
    product_category text,
    sku text,
    PRIMARY KEY (id)
);

CREATE TABLE booking_cargo_shipping_unit (
    _fivetran_id text,
    booking_id text,
    atomic_count text,
    count text,
    "name" jsonb,
    unit_type text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (booking_id) REFERENCES booking(id)
);

CREATE TABLE booking (
    id text,
    shipment_id text,
    air_booking_incoterm text,
    air_booking_object text,
    air_booking_origin_port_name text,
    air_booking_origin_port_object text,
    air_booking_wants_delivery_service text,
    air_booking_wants_pickup_service text,
    booking_line_items_link text,
    booking_line_items_object text,
    cargo_contains_hazmat text,
    cargo_contains_li_ion text,
    cargo_contains_magnets text,
    cargo_contains_non_li_ion_battery text,
    cargo_contains_other_dangerous_goods text,
    cargo_lithium_batteries_packing_types jsonb,
    cargo_marks_and_numbers text,
    cargo_object text,
    cargo_ready_date text,
    cargo_volume_object text,
    cargo_volume_unit text,
    cargo_volume_value text,
    cargo_weight_object text,
    cargo_weight_unit text,
    cargo_weight_value text,
    consignee_entity_id text,
    consignee_entity_name text,
    consignee_entity_object text,
    consignee_entity_ref text,
    created_at text,
    delivery_date text,
    flex_id text,
    metadata jsonb,
    "name" text,
    notify_party text,
    object text,
    ocean_booking_container_counts_forty_five_ft_hc text,
    ocean_booking_container_counts_forty_ft text,
    ocean_booking_container_counts_forty_ft_hc text,
    ocean_booking_container_counts_object text,
    ocean_booking_container_counts_twenty_ft text,
    ocean_booking_destination_port_name text,
    ocean_booking_destination_port_object text,
    ocean_booking_incoterm text,
    ocean_booking_is_lcl text,
    ocean_booking_object text,
    ocean_booking_origin_port_name text,
    ocean_booking_origin_port_object text,
    ocean_booking_wants_delivery_service text,
    ocean_booking_wants_pickup_service text,
    quote_status text,
    shipper_entity_id text,
    shipper_entity_name text,
    shipper_entity_object text,
    shipper_entity_ref text,
    special_instructions text,
    "status" text,
    transportation_mode text,
    trucking_booking_description_of_products text,
    trucking_booking_is_ftl text,
    trucking_booking_object text,
    trucking_booking_payement_terms text,
    wants_export_customs_service text,
    wants_import_customs_service text,
    PRIMARY KEY (id),
    FOREIGN KEY (shipment_id) REFERENCES shipment(id)
);

CREATE TABLE hs (
    code text,
    country_code text,
    description text,
    object text,
    PRIMARY KEY (code, country_code)
);

CREATE TABLE booking_description (
    _fivetran_id text,
    code text,
    country_code text,
    parent_id text,
    description text,
    description_for_export_customs text,
    description_for_export_customs_locale text,
    description_type text,
    object text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (code) REFERENCES hs(code),
    FOREIGN KEY (country_code) REFERENCES hs(country_code),
    FOREIGN KEY (parent_id) REFERENCES booking(id)
);

CREATE TABLE port (
    "name" text,
    object text,
    PRIMARY KEY ("name")
);

CREATE TABLE invoice_credit_memo (
    _fivetran_id text,
    invoice_id text,
    amount_amount text,
    amount_currency_code text,
    amount_object text,
    categories text,
    category text,
    credited_at text,
    object text,
    reason text,
    reasons text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id)
);

CREATE TABLE invoice_line_item (
    _fivetran_id text,
    invoice_id text,
    amount_amount text,
    amount_currency_code text,
    amount_object text,
    category text,
    "name" text,
    object text,
    quantity_object text,
    quantity_qualifier text,
    quantity_value text,
    rate_object text,
    rate_qualifier text,
    rate_value text,
    slug text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id)
);

CREATE TABLE invoice (
    id text,
    shipment_id text,
    balance_amount text,
    balance_currency_code text,
    balance_object text,
    due_date text,
    issued_at text,
    issuer_id text,
    issuer_name text,
    issuer_object text,
    issuer_ref text,
    last_updated_at text,
    "name" text,
    notes jsonb,
    object text,
    recipient_id text,
    recipient_name text,
    recipient_object text,
    recipient_ref text,
    "status" text,
    total_amount text,
    total_currency_code text,
    total_object text,
    "type" text,
    voided_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (shipment_id) REFERENCES shipment(id)
);

CREATE TABLE company_entity (
    id text,
    "name" text,
    object text,
    ref text,
    PRIMARY KEY (id)
);

CREATE TABLE purchase_order_line_item_measurement (
    _fivetran_id text,
    purchase_order_line_item_id text,
    measure_type text,
    object text,
    unit_of_measure text,
    "value" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (purchase_order_line_item_id) REFERENCES purchase_order_line_item(id)
);

CREATE TABLE purchase_order_line_item_product_classification (
    hs_code text,
    purchase_order_line_item_id text,
    object text,
    region text,
    PRIMARY KEY (hs_code, purchase_order_line_item_id),
    FOREIGN KEY (hs_code) REFERENCES hs(code),
    FOREIGN KEY (purchase_order_line_item_id) REFERENCES purchase_order_line_item(id)
);

CREATE TABLE purchase_order_line_item_product_property (
    _fivetran_id text,
    parent_id text,
    object text,
    "type" text,
    "value" text,
    PRIMARY KEY (_fivetran_id, parent_id),
    FOREIGN KEY (parent_id) REFERENCES purchase_order_line_item(id)
);

CREATE TABLE purchase_order_line_item (
    id text,
    country_code text,
    hs_code text,
    product_id text,
    purchase_order_id text,
    assigned_party_id text,
    assigned_party_name text,
    assigned_party_object text,
    assigned_party_ref text,
    booking_line_item_link text,
    booking_line_item_object text,
    destination_port_name text,
    incoterm text,
    item_key text,
    line_item_number text,
    line_type text,
    metadata jsonb,
    must_arrive_date text,
    object text,
    origin_port_name text,
    parent_line_key text,
    product_color text,
    product_dangerous text,
    product_ean_ucc_13 text,
    product_ean_ucc_8 text,
    product_lot_number text,
    product_size text,
    product_style text,
    product_upc text,
    supplier jsonb,
    transportation_mode text,
    unit_cost_amount text,
    unit_cost_currency_code text,
    unit_cost_object text,
    unit_of_measure text,
    units text,
    PRIMARY KEY (id),
    FOREIGN KEY (country_code) REFERENCES hs(country_code),
    FOREIGN KEY (hs_code) REFERENCES hs(code),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (purchase_order_id) REFERENCES purchase_order(id)
);

CREATE TABLE container_item (
    id text,
    container_id text,
    product_id text,
    object text,
    purchase_order_number text,
    total_unit text,
    total_volume_object text,
    total_volume_unit text,
    total_volume_value text,
    total_weight_object text,
    total_weight_unit text,
    total_weight_value text,
    PRIMARY KEY (id),
    FOREIGN KEY (container_id) REFERENCES container(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE container (
    id text,
    shipment_id text,
    actual_arrival_date text,
    actual_delivery_date text,
    actual_departure_date text,
    actual_pickup_date text,
    available_for_pickup_date text,
    cargo_ready_date text,
    container_legs_link text,
    container_legs_object text,
    container_number text,
    container_size text,
    container_type text,
    empty_returned_date text,
    estimated_arrival_date text,
    estimated_available_for_pickup_date text,
    estimated_delivery_date text,
    estimated_departure_date text,
    estimated_pickup_date text,
    last_free_day_date text,
    metadata jsonb,
    object text,
    pickup_number text,
    seal_number text,
    PRIMARY KEY (id),
    FOREIGN KEY (shipment_id) REFERENCES shipment(id)
);
