CREATE TABLE usage_history_detail (
    "index" text,
    usage_history_asset_id text,
    date_on text,
    is_used text,
    PRIMARY KEY ("index", usage_history_asset_id),
    FOREIGN KEY (usage_history_asset_id) REFERENCES usage_history(asset_id)
);

CREATE TABLE usage_history (
    asset_id text,
    last_updated_timestamp text,
    PRIMARY KEY (asset_id),
    FOREIGN KEY (asset_id) REFERENCES asset(id)
);

CREATE TABLE location_label (
    "index" text,
    location_id text,
    label text,
    PRIMARY KEY ("index", location_id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE location (
    id text,
    manager_id text,
    address_line_1 text,
    address_line_2 text,
    city text,
    cost_center text,
    country text,
    custom_location_id text,
    description text,
    external_id text,
    is_locker_enabled text,
    "name" text,
    phone_number text,
    phone_number_country_code text,
    postal_code text,
    scan_code text,
    "state" text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (manager_id) REFERENCES worker(id)
);

CREATE TABLE asset_history_service (
    id text,
    asset_id text,
    attachment_count text,
    completion_date text,
    cost text,
    cost_currency text,
    notes text,
    schedule_date text,
    service_name text,
    service_provider text,
    service_result text,
    service_state text,
    service_template_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (asset_id) REFERENCES asset(id)
);

CREATE TABLE group_associated (
    "index" text,
    group_id text,
    group_associated text,
    PRIMARY KEY ("index", group_id),
    FOREIGN KEY (group_id) REFERENCES groups(id)
);

CREATE TABLE groups (
    id text,
    "name" text,
    parent_group_id text,
    PRIMARY KEY (id)
);

CREATE TABLE asset_service (
    id text,
    frequency text,
    is_associated text,
    service_description text,
    service_interval text,
    service_name text,
    service_period text,
    service_type text,
    PRIMARY KEY (id)
);

CREATE TABLE runtime_data (
    asset_id text,
    application_count text,
    last_seen_timestamp text,
    last_used_timestamp text,
    run_time_total text,
    PRIMARY KEY (asset_id),
    FOREIGN KEY (asset_id) REFERENCES asset(id)
);

CREATE TABLE asset_attachment (
    id text,
    asset_id text,
    display_name text,
    file_name text,
    PRIMARY KEY (id, asset_id),
    FOREIGN KEY (asset_id) REFERENCES asset(id)
);

CREATE TABLE asset_label (
    "index" text,
    asset_id text,
    label text,
    PRIMARY KEY ("index", asset_id),
    FOREIGN KEY (asset_id) REFERENCES asset(id)
);

CREATE TABLE asset (
    id text,
    current_location_id text,
    default_location_id text,
    default_parent_on_track_id text,
    default_worker_id text,
    group_id text,
    inventory_employee_id text,
    parent_on_track_id text,
    responsible_employee_id text,
    category_code text,
    child_asset_count text,
    child_quantity_item_count text,
    completed_services_count text,
    cost_code text,
    current_location_type text,
    default_location_type text,
    description text,
    external_id text,
    fleet_cost_center text,
    fleet_currency_code text,
    fleet_delivery_date text,
    fleet_exchange_or_warranty_date text,
    fleet_inventory_number text,
    fleet_is_loan_tool_claim text,
    fleet_is_theft_insurance text,
    fleet_monthly_rate text,
    fleet_organization_reference_number text,
    fleet_purchase_order_number text,
    image_id text,
    inventory_number text,
    is_hilti_tool text,
    manufacturer_id text,
    manufacturer_name text,
    model text,
    "name" text,
    next_service_date text,
    notes text,
    ownership_detail_purchase_currency_code text,
    ownership_detail_purchase_date text,
    ownership_detail_purchase_order_number text,
    ownership_detail_purchase_price text,
    ownership_detail_vendor text,
    ownership_detail_warranty_expiration_date text,
    ownership_type text,
    replacement_cost text,
    scan_code text,
    scan_code_type text,
    serial_number text,
    status_code text,
    storage_location text,
    sub_type_code text,
    type_code text,
    upcoming_services_count text,
    usage_condition_date text,
    usage_condition_state_code text,
    PRIMARY KEY (id),
    FOREIGN KEY (current_location_id) REFERENCES location(id),
    FOREIGN KEY (default_location_id) REFERENCES location(id),
    FOREIGN KEY (default_parent_on_track_id) REFERENCES asset(id),
    FOREIGN KEY (default_worker_id) REFERENCES worker(id),
    FOREIGN KEY (group_id) REFERENCES groups(id),
    FOREIGN KEY (inventory_employee_id) REFERENCES worker(id),
    FOREIGN KEY (parent_on_track_id) REFERENCES asset(id),
    FOREIGN KEY (responsible_employee_id) REFERENCES worker(id)
);

CREATE TABLE asset_cost (
    asset_id text,
    source_type text,
    "type" text,
    "value" text,
    PRIMARY KEY (asset_id),
    FOREIGN KEY (asset_id) REFERENCES asset(id)
);

CREATE TABLE worker_label (
    "index" text,
    worker_id text,
    label text,
    PRIMARY KEY ("index", worker_id),
    FOREIGN KEY (worker_id) REFERENCES worker(id)
);

CREATE TABLE worker (
    id text,
    address_city text,
    address_country_code text,
    address_line_1 text,
    address_line_2 text,
    address_postal_code text,
    address_state text,
    badge_id text,
    contract_type text,
    cost_center text,
    description text,
    designation text,
    external_id text,
    first_name text,
    is_locker_admin text,
    language_code text,
    last_name text,
    locker_rfid text,
    mobile_country_code text,
    mobile_phone_number text,
    notification_email text,
    office_country_code text,
    office_phone_number text,
    primary_emergency_country_code text,
    primary_emergency_phone_number text,
    private_home_country_code text,
    private_home_phone_number text,
    responsibility_type text,
    scan_code text,
    PRIMARY KEY (id)
);

CREATE TABLE asset_open_service (
    id text,
    asset_id text,
    service_description text,
    service_name text,
    service_schedule_date text,
    PRIMARY KEY (id),
    FOREIGN KEY (asset_id) REFERENCES asset(id)
);

CREATE TABLE quantity_item_label (
    "index" text,
    quantity_item_id text,
    label text,
    PRIMARY KEY ("index", quantity_item_id),
    FOREIGN KEY (quantity_item_id) REFERENCES quantity_item(id)
);

CREATE TABLE quantity_item (
    id text,
    group_id text,
    can_consume text,
    description text,
    external_id text,
    inventory_number text,
    last_purchase_date text,
    last_purchase_price text,
    manufacturer_id text,
    manufacturer_name text,
    model text,
    "name" text,
    notes text,
    one_time_cost text,
    scan_code text,
    scan_code_type text,
    stock_unit_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (group_id) REFERENCES groups(id)
);

CREATE TABLE quantity_item_allocation (
    id text,
    quantity_item_id text,
    responsible_employee_id text,
    allocation_status text,
    allocation_type text,
    allocation_type_id text,
    main_allocation_flag text,
    stock_alert_enabled text,
    stock_max text,
    stock_min text,
    stock_quantity text,
    storage_location text,
    PRIMARY KEY (id),
    FOREIGN KEY (quantity_item_id) REFERENCES quantity_item(id),
    FOREIGN KEY (responsible_employee_id) REFERENCES worker(id)
);

CREATE TABLE transfer_asset_detail (
    id text,
    transfer_id text,
    from_location_id text,
    from_storage_asset_id text,
    from_worker_id text,
    quantity_item_id text,
    to_location_id text,
    to_storage_asset_id text,
    to_worker_id text,
    to_allocation_status text,
    transfer_asset_type text,
    transfer_quantity text,
    transfer_status text,
    PRIMARY KEY (id, transfer_id),
    FOREIGN KEY (transfer_id) REFERENCES transfer(id),
    FOREIGN KEY (from_location_id) REFERENCES location(id),
    FOREIGN KEY (from_storage_asset_id) REFERENCES asset(id),
    FOREIGN KEY (from_worker_id) REFERENCES worker(id),
    FOREIGN KEY (quantity_item_id) REFERENCES quantity_item(id),
    FOREIGN KEY (to_location_id) REFERENCES location(id),
    FOREIGN KEY (to_storage_asset_id) REFERENCES asset(id),
    FOREIGN KEY (to_worker_id) REFERENCES worker(id)
);

CREATE TABLE transfer (
    id text,
    creator_id text,
    notes text,
    origin text,
    submitted_timestamp text,
    task_code text,
    transfer_timestamp text,
    PRIMARY KEY (id),
    FOREIGN KEY (creator_id) REFERENCES worker(id)
);
