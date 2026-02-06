CREATE TABLE route (
    id text,
    shipment_id text,
    team_id text,
    actual_arrival_time text,
    actual_departure_time text,
    carrier_name text,
    destination_address_line_1 text,
    destination_address_line_2 text,
    destination_city text,
    destination_country text,
    destination_country_code text,
    destination_iata_code text,
    destination_id text,
    destination_lat text,
    destination_lon text,
    destination_name text,
    destination_port_name text,
    destination_port_type text,
    destination_postal_code text,
    destination_state text,
    estimated_arrival_time text,
    estimated_departure_time text,
    origin_address_line_1 text,
    origin_address_line_2 text,
    origin_city text,
    origin_country text,
    origin_country_code text,
    origin_iata_code text,
    origin_id text,
    origin_lat text,
    origin_lon text,
    origin_name text,
    origin_port_name text,
    origin_port_type text,
    origin_postal_code text,
    origin_state text,
    priority text,
    tracking_number text,
    transportation_mode text,
    vehicle_model text,
    PRIMARY KEY (id, shipment_id, team_id),
    FOREIGN KEY (shipment_id) REFERENCES shipment(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE contact (
    id text,
    supplier_id text,
    team_id text,
    address_line_1 text,
    address_line_2 text,
    city text,
    country text,
    created_at text,
    email text,
    "name" text,
    phone text,
    postal_code text,
    "state" text,
    updated_at text,
    PRIMARY KEY (id, supplier_id, team_id),
    FOREIGN KEY (supplier_id) REFERENCES supplier(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE custom_field (
    id text,
    team_id text,
    created_at text,
    default_value text,
    description text,
    "name" text,
    option_currency text,
    option_field_type text,
    option_show_on_pdf text,
    option_unit_of_measure text,
    resource_type text,
    updated_at text,
    PRIMARY KEY (id, team_id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE shipment_consolidation_order (
    shipment_consolidation_id text,
    track_shipment_requests_order_id text,
    shipment_consolidation_track_shipment_requests_id text,
    PRIMARY KEY (shipment_consolidation_id, track_shipment_requests_order_id),
    FOREIGN KEY (shipment_consolidation_id) REFERENCES shipment_consolidation(id),
    FOREIGN KEY (track_shipment_requests_order_id) REFERENCES purchase_order(id)
);

CREATE TABLE shipment_consolidation (
    id text,
    team_id text,
    ship_to_location_id text,
    shipment_consolidation_order_id text,
    shipment_consolidation_order_item_id text,
    shipment_id text,
    actual_delivery_date text,
    actual_freight_cost text,
    actual_ship_date text,
    cargo_pickup_date text,
    container_load_time text,
    created_at text,
    estimated_delivery_date text,
    estimated_ship_date text,
    last_date_to_cancel text,
    logistics_trackings_carrier text,
    logistics_trackings_created_at text,
    logistics_trackings_id text,
    logistics_trackings_tracking_number text,
    logistics_trackings_tracking_type text,
    logistics_trackings_updated_at text,
    "name" text,
    notes text,
    original_freight_quote text,
    port_of_departure text,
    shipment_consolidation_files_count text,
    shipment_consolidation_order_items_count text,
    shipment_consolidation_orders_count text,
    shipment_consolidation_select_all text,
    shipment_cost text,
    shipment_number text,
    "status" text,
    track_shipment_requests_carrier text,
    track_shipment_requests_created_at text,
    track_shipment_requests_id text,
    track_shipment_requests_order_ids text,
    track_shipment_requests_status text,
    track_shipment_requests_tracking_reference text,
    track_shipment_requests_type text,
    track_shipment_requests_updated_at text,
    updated_at text,
    vessel_number text,
    PRIMARY KEY (id, team_id),
    FOREIGN KEY (team_id) REFERENCES team(id),
    FOREIGN KEY (ship_to_location_id) REFERENCES location(id),
    FOREIGN KEY (shipment_consolidation_order_id) REFERENCES purchase_order(id),
    FOREIGN KEY (shipment_consolidation_order_item_id) REFERENCES purchase_order_item(id),
    FOREIGN KEY (shipment_id) REFERENCES shipment(id)
);

CREATE TABLE purchase_order_source (
    id text,
    purchase_order_id text,
    team_id text,
    created_at text,
    source_id text,
    source_ref text,
    updated_at text,
    vendor_id text,
    vendor_name text,
    PRIMARY KEY (id, purchase_order_id, team_id),
    FOREIGN KEY (purchase_order_id) REFERENCES purchase_order(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE part_source (
    id text,
    part_id text,
    team_id text,
    created_at text,
    source_id text,
    source_ref text,
    updated_at text,
    vendor_id text,
    vendor_name text,
    PRIMARY KEY (id, part_id, team_id),
    FOREIGN KEY (part_id) REFERENCES part(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE tracked_shipment_order (
    order_id text,
    tracked_shipment_id text,
    PRIMARY KEY (order_id, tracked_shipment_id),
    FOREIGN KEY (order_id) REFERENCES purchase_order(id),
    FOREIGN KEY (tracked_shipment_id) REFERENCES tracked_shipment(id)
);

CREATE TABLE tracked_shipment (
    id text,
    team_id text,
    created_at text,
    "status" text,
    tracking_carrier text,
    tracking_reference text,
    tracking_type text,
    updated_at text,
    PRIMARY KEY (id, team_id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE task (
    id text,
    team_id text,
    assignee_id text,
    assignee_type text,
    created_at text,
    creator_id text,
    description text,
    due_date text,
    required text,
    "status" text,
    taskable_id text,
    taskable_type text,
    title text,
    updated_at text,
    PRIMARY KEY (id, team_id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE order_part (
    id text,
    purchase_order_id text,
    team_id text,
    PRIMARY KEY (id, purchase_order_id, team_id),
    FOREIGN KEY (id) REFERENCES part(id),
    FOREIGN KEY (purchase_order_id) REFERENCES purchase_order(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE order_collection (
    id text,
    purchase_order_id text,
    team_id text,
    "name" text,
    "type" text,
    PRIMARY KEY (id, purchase_order_id, team_id),
    FOREIGN KEY (purchase_order_id) REFERENCES purchase_order(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE invoice_item (
    id text,
    invoice_id text,
    part_id text,
    created_at text,
    "name" text,
    quantity text,
    unit_price_micros text,
    updated_at text,
    PRIMARY KEY (id, invoice_id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id),
    FOREIGN KEY (part_id) REFERENCES part(id)
);

CREATE TABLE invoice (
    id text,
    team_id text,
    order_id text,
    created_at text,
    due_date text,
    number text,
    submitted_at text,
    total_micros text,
    updated_at text,
    PRIMARY KEY (id, team_id),
    FOREIGN KEY (team_id) REFERENCES team(id),
    FOREIGN KEY (order_id) REFERENCES purchase_order(id)
);

CREATE TABLE collaborator (
    id text,
    team_id text,
    user_id text,
    category text,
    created_at text,
    email text,
    invite_message text,
    "name" text,
    restrict_files_access text,
    restrict_financial text,
    updated_at text,
    PRIMARY KEY (id, team_id),
    FOREIGN KEY (team_id) REFERENCES team(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE purchase_order_custom (
    "index" text,
    purchase_order_id text,
    field_id text,
    field_name text,
    field_options_currency text,
    field_options_unit_of_measure text,
    "value" text,
    PRIMARY KEY ("index", purchase_order_id),
    FOREIGN KEY (purchase_order_id) REFERENCES purchase_order(id)
);

CREATE TABLE purchase_order_tag (
    "index" text,
    purchase_order_id text,
    tags text,
    PRIMARY KEY ("index", purchase_order_id),
    FOREIGN KEY (purchase_order_id) REFERENCES purchase_order(id)
);

CREATE TABLE purchase_order_invoice (
    invoice_id text,
    purchase_order_id text,
    PRIMARY KEY (invoice_id, purchase_order_id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id),
    FOREIGN KEY (purchase_order_id) REFERENCES purchase_order(id)
);

CREATE TABLE purchase_order_shipment (
    purchase_order_id text,
    shipment_id text,
    PRIMARY KEY (purchase_order_id, shipment_id),
    FOREIGN KEY (purchase_order_id) REFERENCES purchase_order(id),
    FOREIGN KEY (shipment_id) REFERENCES shipment(id)
);

CREATE TABLE purchase_order_item_custom (
    "index" text,
    purchase_order_item_id text,
    purchase_order_item_purchase_order_id text,
    field_id text,
    field_name text,
    field_options_currency text,
    field_options_unit_of_measure text,
    "value" text,
    PRIMARY KEY ("index", purchase_order_item_id, purchase_order_item_purchase_order_id),
    FOREIGN KEY (purchase_order_item_id) REFERENCES purchase_order_item(id),
    FOREIGN KEY (purchase_order_item_purchase_order_id) REFERENCES purchase_order_item(purchase_order_id)
);

CREATE TABLE purchase_order_item (
    id text,
    purchase_order_id text,
    part_id text,
    "name" text,
    quantity text,
    unit_of_measure text,
    unit_price_micros text,
    PRIMARY KEY (id, purchase_order_id),
    FOREIGN KEY (purchase_order_id) REFERENCES purchase_order(id),
    FOREIGN KEY (part_id) REFERENCES part(id)
);

CREATE TABLE purchase_order_task (
    purchase_order_id text,
    task_id text,
    PRIMARY KEY (purchase_order_id, task_id),
    FOREIGN KEY (purchase_order_id) REFERENCES purchase_order(id),
    FOREIGN KEY (task_id) REFERENCES task(id)
);

CREATE TABLE purchase_order (
    id text,
    team_id text,
    creator_id text,
    current_milestone_id text,
    supplier_id text,
    workflow_id text,
    created_at text,
    creator_email text,
    currency text,
    current_milestone_status text,
    delivered_on text,
    incoterms text,
    is_delivered text,
    is_shipped text,
    issued_at text,
    last_issued_at text,
    "name" text,
    note text,
    order_number text,
    payment_terms text,
    seller_address_line_1 text,
    seller_address_line_2 text,
    seller_city text,
    seller_company_line_1 text,
    seller_company_line_2 text,
    seller_country text,
    seller_postal_code text,
    seller_state text,
    shipping_method text,
    ships_on text,
    ships_to_address_line_1 text,
    ships_to_address_line_2 text,
    ships_to_city text,
    ships_to_company_line_1 text,
    ships_to_company_line_2 text,
    ships_to_country text,
    ships_to_email text,
    ships_to_phone text,
    ships_to_postal_code text,
    ships_to_state text,
    "status" text,
    submitter_email text,
    submitter_id text,
    updated_at text,
    PRIMARY KEY (id, team_id),
    FOREIGN KEY (team_id) REFERENCES team(id),
    FOREIGN KEY (creator_id) REFERENCES users(id),
    FOREIGN KEY (current_milestone_id) REFERENCES order_milestone(id),
    FOREIGN KEY (supplier_id) REFERENCES supplier(id),
    FOREIGN KEY (workflow_id) REFERENCES workflow(id)
);

CREATE TABLE users (
    id text,
    team_id text,
    created_at text,
    email text,
    "name" text,
    updated_at text,
    PRIMARY KEY (id, team_id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE logistics_tracking (
    id text,
    purchase_order_id text,
    team_id text,
    carrier text,
    created_at text,
    number text,
    "type" text,
    updated_at text,
    PRIMARY KEY (id, purchase_order_id, team_id),
    FOREIGN KEY (purchase_order_id) REFERENCES purchase_order(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE order_schedule (
    _fivetran_id text,
    purchase_order_id text,
    team_id text,
    actual_delivery_date text,
    actual_ship_date text,
    delivered_on text,
    expected_ship_date text,
    mass_production_starts_on text,
    original_ships_on text,
    ship_date text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (purchase_order_id) REFERENCES purchase_order(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE location (
    id text,
    team_id text,
    address_line_1 text,
    address_line_2 text,
    city text,
    company_line_1 text,
    company_line_2 text,
    country text,
    email text,
    "name" text,
    phone text,
    postal_code text,
    "state" text,
    PRIMARY KEY (id, team_id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE shipment (
    id text,
    team_id text,
    purchase_order_id text,
    actual_arrival_time text,
    actual_delivered_time text,
    actual_departure_time text,
    cargo_ready_date text,
    created_at text,
    estimated_arrival_time text,
    estimated_delivery_time text,
    estimated_departure_time text,
    estimated_pickup_time text,
    external_id text,
    metadata text,
    "name" text,
    pickup_time text,
    "status" text,
    updated_at text,
    vendor_name text,
    PRIMARY KEY (id, team_id),
    FOREIGN KEY (team_id) REFERENCES team(id),
    FOREIGN KEY (purchase_order_id) REFERENCES purchase_order(id)
);

CREATE TABLE supplier_part_quantity (
    id text,
    supplier_part_part_id text,
    supplier_part_supplier_id text,
    currency text,
    lead_time_days text,
    min_order_qty text,
    unit_of_measure text,
    unit_price_micros text,
    PRIMARY KEY (id, supplier_part_part_id, supplier_part_supplier_id),
    FOREIGN KEY (supplier_part_part_id) REFERENCES supplier_part(part_id),
    FOREIGN KEY (supplier_part_supplier_id) REFERENCES supplier_part(supplier_id)
);

CREATE TABLE supplier_identifier (
    "index" text,
    supplier_part_part_id text,
    supplier_part_supplier_id text,
    label text,
    "value" text,
    PRIMARY KEY ("index", supplier_part_part_id, supplier_part_supplier_id),
    FOREIGN KEY (supplier_part_part_id) REFERENCES supplier_part(part_id),
    FOREIGN KEY (supplier_part_supplier_id) REFERENCES supplier_part(supplier_id)
);

CREATE TABLE supplier_part_custom (
    "index" text,
    supplier_part_part_id text,
    supplier_part_supplier_id text,
    field_id text,
    field_name text,
    field_options_currency text,
    field_options_unit_of_measure text,
    "value" text,
    PRIMARY KEY ("index", supplier_part_part_id, supplier_part_supplier_id),
    FOREIGN KEY (supplier_part_part_id) REFERENCES supplier_part(part_id),
    FOREIGN KEY (supplier_part_supplier_id) REFERENCES supplier_part(supplier_id)
);

CREATE TABLE supplier_part (
    part_id text,
    supplier_id text,
    master_cases_per_pallet text,
    notes text,
    supplier_part_number text,
    units_per_master_case text,
    PRIMARY KEY (part_id, supplier_id),
    FOREIGN KEY (part_id) REFERENCES part(id),
    FOREIGN KEY (supplier_id) REFERENCES supplier(id)
);

CREATE TABLE supplier (
    id text,
    team_id text,
    address_line_1 text,
    address_line_2 text,
    city text,
    country text,
    created_at text,
    default_custom_payment_term_id text,
    default_incoterms text,
    default_payment_term text,
    "name" text,
    notes text,
    phone text,
    postal_code text,
    "state" text,
    updated_at text,
    PRIMARY KEY (id, team_id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE part_identifier (
    "index" text,
    part_id text,
    label text,
    "value" text,
    PRIMARY KEY ("index", part_id),
    FOREIGN KEY (part_id) REFERENCES part(id)
);

CREATE TABLE part_children (
    id text,
    part_id text,
    PRIMARY KEY (id, part_id),
    FOREIGN KEY (part_id) REFERENCES part(id)
);

CREATE TABLE part_parent (
    id text,
    part_id text,
    PRIMARY KEY (id, part_id),
    FOREIGN KEY (part_id) REFERENCES part(id)
);

CREATE TABLE part_tag (
    "index" text,
    part_id text,
    tags text,
    PRIMARY KEY ("index", part_id),
    FOREIGN KEY (part_id) REFERENCES part(id)
);

CREATE TABLE part (
    id text,
    team_id text,
    asin text,
    created_at text,
    description text,
    hts_code text,
    is_archived text,
    isbn text,
    "name" text,
    sku text,
    upc text,
    updated_at text,
    PRIMARY KEY (id, team_id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE rule (
    id text,
    team_id text,
    action_id text,
    action_name text,
    created_at text,
    "name" text,
    "status" text,
    trigger_event_type text,
    trigger_id text,
    trigger_status text,
    updated_at text,
    PRIMARY KEY (id, team_id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE factory_capability (
    "index" text,
    factory_id text,
    capability text,
    PRIMARY KEY ("index", factory_id),
    FOREIGN KEY (factory_id) REFERENCES factory(id)
);

CREATE TABLE factory (
    id text,
    supplier_id text,
    team_id text,
    address_line_1 text,
    address_line_2 text,
    city text,
    country text,
    created_at text,
    "name" text,
    phone text,
    postal_code text,
    "state" text,
    updated_at text,
    PRIMARY KEY (id, supplier_id, team_id),
    FOREIGN KEY (supplier_id) REFERENCES supplier(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE payment_term (
    id text,
    team_id text,
    created_at text,
    "name" text,
    updated_at text,
    PRIMARY KEY (id, team_id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE order_milestone (
    id text,
    purchase_order_id text,
    team_id text,
    created_at text,
    key_date text,
    sequential_id text,
    "status" text,
    "type" text,
    updated_at text,
    PRIMARY KEY (id, purchase_order_id, team_id),
    FOREIGN KEY (purchase_order_id) REFERENCES purchase_order(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE team (
    id text,
    address_line_1 text,
    address_line_2 text,
    city text,
    country text,
    created_at text,
    description text,
    "name" text,
    postal_code text,
    "state" text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE workflow_milestone (
    id text,
    workflow_id text,
    custom_field_id text,
    "name" text,
    "type" text,
    PRIMARY KEY (id, workflow_id),
    FOREIGN KEY (workflow_id) REFERENCES workflow(id)
);

CREATE TABLE workflow (
    id text,
    team_id text,
    created_at text,
    description text,
    is_enabled text,
    "name" text,
    updated_at text,
    PRIMARY KEY (id, team_id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);
