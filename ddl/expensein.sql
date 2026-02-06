CREATE TABLE custom_field_dropdown_value (
    "index" text,
    custom_field_id text,
    dropdown_value text,
    PRIMARY KEY ("index", custom_field_id),
    FOREIGN KEY (custom_field_id) REFERENCES custom_field(id)
);

CREATE TABLE custom_field_display_category (
    custom_field_id text,
    id text,
    PRIMARY KEY (custom_field_id, id),
    FOREIGN KEY (custom_field_id) REFERENCES custom_field(id),
    FOREIGN KEY (id) REFERENCES category(id)
);

CREATE TABLE custom_field_visible_user (
    custom_field_id text,
    id text,
    PRIMARY KEY (custom_field_id, id),
    FOREIGN KEY (custom_field_id) REFERENCES custom_field(id),
    FOREIGN KEY (id) REFERENCES users(id)
);

CREATE TABLE custom_field_visible_department (
    custom_field_id text,
    id text,
    PRIMARY KEY (custom_field_id, id),
    FOREIGN KEY (custom_field_id) REFERENCES custom_field(id),
    FOREIGN KEY (id) REFERENCES department(id)
);

CREATE TABLE custom_field_visible_user_group (
    custom_field_id text,
    id text,
    PRIMARY KEY (custom_field_id, id),
    FOREIGN KEY (custom_field_id) REFERENCES custom_field(id),
    FOREIGN KEY (id) REFERENCES user_group(id)
);

CREATE TABLE custom_field (
    id text,
    date_added text,
    display_order text,
    is_deleted text,
    "name" text,
    required text,
    target text,
    "type" text,
    visibility text,
    PRIMARY KEY (id)
);

CREATE TABLE purchase_method (
    id text,
    date_added text,
    icon_css_class text,
    is_deleted text,
    is_reconcilable text,
    is_reimbursable text,
    is_system text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE vehicle_specification_fuel_rate (
    id text,
    vehicle_specification_id text,
    effective_date text,
    rate text,
    PRIMARY KEY (id, vehicle_specification_id),
    FOREIGN KEY (vehicle_specification_id) REFERENCES vehicle_specification(id)
);

CREATE TABLE vehicle_specification_visible_user (
    id text,
    vehicle_specification_id text,
    PRIMARY KEY (id, vehicle_specification_id),
    FOREIGN KEY (id) REFERENCES users(id),
    FOREIGN KEY (vehicle_specification_id) REFERENCES vehicle_specification(id)
);

CREATE TABLE vehicle_specification_visible_department (
    id text,
    vehicle_specification_id text,
    PRIMARY KEY (id, vehicle_specification_id),
    FOREIGN KEY (id) REFERENCES department(id),
    FOREIGN KEY (vehicle_specification_id) REFERENCES vehicle_specification(id)
);

CREATE TABLE vehicle_specification_visible_user_group (
    id text,
    vehicle_specification_id text,
    PRIMARY KEY (id, vehicle_specification_id),
    FOREIGN KEY (id) REFERENCES user_group(id),
    FOREIGN KEY (vehicle_specification_id) REFERENCES vehicle_specification(id)
);

CREATE TABLE vehicle_specification (
    id text,
    date_added text,
    engine_size text,
    fuel_type text,
    is_deleted text,
    visibility text,
    PRIMARY KEY (id)
);

CREATE TABLE project_custom_field (
    id text,
    project_id text,
    "value" text,
    PRIMARY KEY (id, project_id),
    FOREIGN KEY (id) REFERENCES custom_field(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE project_billable_category (
    id text,
    project_id text,
    PRIMARY KEY (id, project_id),
    FOREIGN KEY (id) REFERENCES category(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE project_visible_user (
    id text,
    project_id text,
    PRIMARY KEY (id, project_id),
    FOREIGN KEY (id) REFERENCES users(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE project_visible_department (
    id text,
    project_id text,
    PRIMARY KEY (id, project_id),
    FOREIGN KEY (id) REFERENCES department(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE project_visible_user_group (
    id text,
    project_id text,
    PRIMARY KEY (id, project_id),
    FOREIGN KEY (id) REFERENCES user_group(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE project (
    id text,
    applies_to_invoicing text,
    applies_to_mileage_expenses text,
    applies_to_mileage_log_expenses text,
    applies_to_purchase_expenses text,
    applies_to_time_expenses text,
    approval_flow_id text,
    approval_flow_name text,
    billable_type text,
    date_added text,
    description text,
    invoicing_approval_flow_id text,
    invoicing_approval_flow_name text,
    is_active text,
    is_deleted text,
    "name" text,
    reference text,
    visibility text,
    PRIMARY KEY (id)
);

CREATE TABLE vehicle_custom_field (
    id text,
    vehicle_id text,
    "value" text,
    PRIMARY KEY (id, vehicle_id),
    FOREIGN KEY (id) REFERENCES custom_field(id),
    FOREIGN KEY (vehicle_id) REFERENCES vehicle(id)
);

CREATE TABLE vehicle (
    id text,
    user_id text,
    vehicle_specification_id text,
    date_added text,
    is_deleted text,
    is_fuel_reimbursable text,
    make text,
    model text,
    registration text,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (vehicle_specification_id) REFERENCES vehicle_specification(id)
);

CREATE TABLE department_custom_field (
    department_id text,
    id text,
    "value" text,
    PRIMARY KEY (department_id, id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (id) REFERENCES custom_field(id)
);

CREATE TABLE department_visible_user (
    department_id text,
    id text,
    PRIMARY KEY (department_id, id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (id) REFERENCES users(id)
);

CREATE TABLE department_visible_user_group (
    department_id text,
    id text,
    PRIMARY KEY (department_id, id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (id) REFERENCES user_group(id)
);

CREATE TABLE department (
    id text,
    approval_flow_id text,
    approval_flow_name text,
    date_added text,
    invoicing_approval_flow_id text,
    invoicing_approval_flow_name text,
    is_deleted text,
    "name" text,
    reference text,
    visibility text,
    visible_departments jsonb,
    PRIMARY KEY (id)
);

CREATE TABLE policy (
    id text,
    description text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE user_custom_field (
    id text,
    user_id text,
    "value" text,
    PRIMARY KEY (id, user_id),
    FOREIGN KEY (id) REFERENCES custom_field(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE user_role (
    id text,
    user_id text,
    PRIMARY KEY (id, user_id),
    FOREIGN KEY (id) REFERENCES "role"(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE user_group (
    id text,
    user_id text,
    "name" text,
    PRIMARY KEY (id, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    department_id text,
    expense_policy_id text,
    account_id text,
    account_name text,
    approval_flow_id text,
    approval_flow_name text,
    bank_account_number text,
    bank_bic text,
    bank_branch_code text,
    bank_code text,
    bank_iban text,
    email text,
    expense_policy_name text,
    first_name text,
    invoicing_approval_flow_id text,
    invoicing_approval_flow_name text,
    last_name text,
    leaving_date text,
    reference text,
    statement_identifier text,
    two_step_authentication_enabled text,
    PRIMARY KEY (id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (expense_policy_id) REFERENCES policy(id)
);

CREATE TABLE "role" (
    id text,
    parent_role_id text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (parent_role_id) REFERENCES "role"(id)
);

CREATE TABLE receipt (
    id text,
    expense_id text,
    purchase_method_id text,
    client_date_added text,
    client_date_updated text,
    client_id text,
    date_added text,
    date_updated text,
    file_name text,
    is_deleted text,
    is_shared text,
    memo text,
    PRIMARY KEY (id),
    FOREIGN KEY (expense_id) REFERENCES expense(id),
    FOREIGN KEY (purchase_method_id) REFERENCES purchase_method(id)
);

CREATE TABLE category_custom_field (
    category_id text,
    id text,
    "value" text,
    PRIMARY KEY (category_id, id),
    FOREIGN KEY (category_id) REFERENCES category(id),
    FOREIGN KEY (id) REFERENCES custom_field(id)
);

CREATE TABLE category_visible_user (
    category_id text,
    id text,
    PRIMARY KEY (category_id, id),
    FOREIGN KEY (category_id) REFERENCES category(id),
    FOREIGN KEY (id) REFERENCES users(id)
);

CREATE TABLE category_visible_department (
    category_id text,
    id text,
    PRIMARY KEY (category_id, id),
    FOREIGN KEY (category_id) REFERENCES category(id),
    FOREIGN KEY (id) REFERENCES department(id)
);

CREATE TABLE category_visible_user_group (
    category_id text,
    id text,
    "name" text,
    PRIMARY KEY (category_id, id),
    FOREIGN KEY (category_id) REFERENCES category(id),
    FOREIGN KEY (id) REFERENCES user_group(id)
);

CREATE TABLE category (
    id text,
    default_tax_rate_id text,
    applies_to_invoicing text,
    applies_to_mileage_expense text,
    applies_to_mileage_log_expense text,
    applies_to_purchase_expense text,
    applies_to_time_expense text,
    carbon_category text,
    date_added text,
    description text,
    enforce_default_tax_rate text,
    fixed_amount text,
    is_deleted text,
    is_reportable text,
    "name" text,
    reference text,
    show_attendee text,
    show_number_of_nights text,
    visibility text,
    PRIMARY KEY (id),
    FOREIGN KEY (default_tax_rate_id) REFERENCES tax_rate(id)
);

CREATE TABLE mileage_rate_custom_field (
    id text,
    mileage_rate_id text,
    "value" text,
    PRIMARY KEY (id, mileage_rate_id),
    FOREIGN KEY (id) REFERENCES custom_field(id),
    FOREIGN KEY (mileage_rate_id) REFERENCES mileage_rate(id)
);

CREATE TABLE mileage_rate_visible_user (
    id text,
    mileage_rate_id text,
    PRIMARY KEY (id, mileage_rate_id),
    FOREIGN KEY (id) REFERENCES users(id),
    FOREIGN KEY (mileage_rate_id) REFERENCES mileage_rate(id)
);

CREATE TABLE mileage_rate_visible_department (
    id text,
    mileage_rate_id text,
    PRIMARY KEY (id, mileage_rate_id),
    FOREIGN KEY (id) REFERENCES department(id),
    FOREIGN KEY (mileage_rate_id) REFERENCES mileage_rate(id)
);

CREATE TABLE mileage_rate_visible_user_group (
    id text,
    mileage_rate_id text,
    PRIMARY KEY (id, mileage_rate_id),
    FOREIGN KEY (id) REFERENCES user_group(id),
    FOREIGN KEY (mileage_rate_id) REFERENCES mileage_rate(id)
);

CREATE TABLE mileage_rate (
    id text,
    date_added text,
    is_deleted text,
    maximum_distance text,
    minimum_distance text,
    "name" text,
    rate text,
    visibility text,
    PRIMARY KEY (id)
);

CREATE TABLE tax_rate_custom_field (
    id text,
    tax_rate_id text,
    "value" text,
    PRIMARY KEY (id, tax_rate_id),
    FOREIGN KEY (id) REFERENCES custom_field(id),
    FOREIGN KEY (tax_rate_id) REFERENCES tax_rate(id)
);

CREATE TABLE tax_rate_visible_user (
    id text,
    tax_rate_id text,
    PRIMARY KEY (id, tax_rate_id),
    FOREIGN KEY (id) REFERENCES users(id),
    FOREIGN KEY (tax_rate_id) REFERENCES tax_rate(id)
);

CREATE TABLE tax_rate_visible_department (
    id text,
    tax_rate_id text,
    PRIMARY KEY (id, tax_rate_id),
    FOREIGN KEY (id) REFERENCES department(id),
    FOREIGN KEY (tax_rate_id) REFERENCES tax_rate(id)
);

CREATE TABLE tax_rate_visible_user_group (
    id text,
    tax_rate_id text,
    PRIMARY KEY (id, tax_rate_id),
    FOREIGN KEY (id) REFERENCES user_group(id),
    FOREIGN KEY (tax_rate_id) REFERENCES tax_rate(id)
);

CREATE TABLE tax_rate (
    id text,
    date_added text,
    is_deleted text,
    "name" text,
    rate text,
    reference text,
    visibility text,
    PRIMARY KEY (id)
);

CREATE TABLE expense_to_location (
    "index" text,
    expense_id text,
    is_postcode text,
    map_name text,
    "name" text,
    PRIMARY KEY ("index", expense_id),
    FOREIGN KEY (expense_id) REFERENCES expense(id)
);

CREATE TABLE expense_policy_result (
    "index" text,
    expense_id text,
    policy_rule_result text,
    "status" text,
    PRIMARY KEY ("index", expense_id),
    FOREIGN KEY (expense_id) REFERENCES expense(id)
);

CREATE TABLE expense_custom_field (
    expense_id text,
    id text,
    "value" text,
    PRIMARY KEY (expense_id, id),
    FOREIGN KEY (expense_id) REFERENCES expense(id),
    FOREIGN KEY (id) REFERENCES custom_field(id)
);

CREATE TABLE expense_attendee (
    "index" text,
    expense_id text,
    attendee text,
    PRIMARY KEY ("index", expense_id),
    FOREIGN KEY (expense_id) REFERENCES expense(id)
);

CREATE TABLE expense_time_rate_visible_user (
    expense_id text,
    id text,
    PRIMARY KEY (expense_id, id),
    FOREIGN KEY (expense_id) REFERENCES expense(id),
    FOREIGN KEY (id) REFERENCES users(id)
);

CREATE TABLE expense_time_rate_visible_department (
    expense_id text,
    id text,
    PRIMARY KEY (expense_id, id),
    FOREIGN KEY (expense_id) REFERENCES expense(id),
    FOREIGN KEY (id) REFERENCES department(id)
);

CREATE TABLE expense_time_rate_visible_user_group (
    expense_id text,
    id text,
    PRIMARY KEY (expense_id, id),
    FOREIGN KEY (expense_id) REFERENCES expense(id),
    FOREIGN KEY (id) REFERENCES user_group(id)
);

CREATE TABLE expense_journey (
    id text,
    expense_id text,
    project_id text,
    base_distance text,
    description text,
    from_location_is_postcode text,
    from_location_map_name text,
    from_location_name text,
    journey_date text,
    map_base_distance text,
    to_location_is_postcode text,
    to_location_map_name text,
    to_location_name text,
    PRIMARY KEY (id, expense_id),
    FOREIGN KEY (expense_id) REFERENCES expense(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE expense (
    id text,
    category_id text,
    department_id text,
    mileage_rate_id text,
    project_id text,
    purchase_method_id text,
    tax_rate_id text,
    user_id text,
    vehicle_id text,
    vehicle_specification_id text,
    approved_date text,
    base_distance text,
    base_gross_amount text,
    base_map_distance text,
    base_net_amount text,
    base_tax_amount text,
    billed text,
    client_date_added text,
    client_date_updated text,
    client_id text,
    commute_base_distance text,
    commute_distance text,
    commute_is_return text,
    completed text,
    completed_date text,
    currency_code text,
    currency_id text,
    currency_name text,
    currency_symbol text,
    date_added text,
    date_updated text,
    description text,
    distance text,
    distance_unit text,
    duration text,
    exchange_rate text,
    expense_date text,
    flight_class text,
    flight_from_airport_country_code_three_letter text,
    flight_from_airport_country_id text,
    flight_from_airport_country_name text,
    flight_from_airport_country_standard_tax_rate text,
    flight_from_airport_country_tax_label text,
    flight_from_airport_iata_code text,
    flight_from_airport_id text,
    flight_from_airport_name text,
    flight_return_journey text,
    flight_to_airport_country_code_three_letter text,
    flight_to_airport_country_id text,
    flight_to_airport_country_name text,
    flight_to_airport_country_standard_tax_rate text,
    flight_to_airport_country_tax_label text,
    flight_to_airport_iata_code text,
    flight_to_airport_id text,
    flight_to_airport_name text,
    from_location_is_postcode text,
    from_location_map_name text,
    from_location_name text,
    fuel_rate text,
    gross_amount text,
    hotel_country_code_three_letter text,
    hotel_country_id text,
    hotel_country_name text,
    hotel_country_standard_tax_rate text,
    hotel_country_tax_label text,
    import_date_added text,
    import_id text,
    import_purchase_method_id text,
    import_purchase_method_name text,
    import_statement_date text,
    "interval" text,
    interval_count text,
    is_billable text,
    is_deleted text,
    is_fuel_reimbursable text,
    is_reconcilable text,
    is_reimbursable text,
    is_return text,
    kg_co_2_e text,
    map_distance text,
    map_duration text,
    merchant_id text,
    merchant_name text,
    merchant_reference text,
    notes text,
    number_of_nights text,
    odometer_end text,
    odometer_start text,
    purchase_merchant_name text,
    rate text,
    receipt_verified text,
    reconciled text,
    reimbursed text,
    rejected_reason text,
    resubmitted text,
    road_return_journey text,
    road_travel_from text,
    road_travel_to text,
    road_travel_type text,
    split_group_id text,
    "status" text,
    submission_date_submitted text,
    submission_id text,
    time_rate_id text,
    time_rate_interval text,
    time_rate_name text,
    time_rate_rate text,
    time_rate_visibility text,
    train_return_journey text,
    train_station_from_country_code_three_letter text,
    train_station_from_country_id text,
    train_station_from_country_name text,
    train_station_from_country_standard_tax_rate text,
    train_station_from_country_tax_label text,
    train_station_from_id text,
    train_station_from_name text,
    train_station_to_country_code_three_letter text,
    train_station_to_country_id text,
    train_station_to_country_name text,
    train_station_to_country_standard_tax_rate text,
    train_station_to_country_tax_label text,
    train_station_to_id text,
    train_station_to_name text,
    train_type text,
    "type" text,
    validated text,
    PRIMARY KEY (id),
    FOREIGN KEY (category_id) REFERENCES category(id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (mileage_rate_id) REFERENCES mileage_rate(id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (purchase_method_id) REFERENCES purchase_method(id),
    FOREIGN KEY (tax_rate_id) REFERENCES tax_rate(id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (vehicle_id) REFERENCES vehicle(id),
    FOREIGN KEY (vehicle_specification_id) REFERENCES vehicle_specification(id)
);
