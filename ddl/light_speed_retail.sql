CREATE TABLE item_shop_history (
    id bigint,
    updated_time timestamp,
    item_id bigint,
    shop_id bigint,
    backorder integer,
    component_backorder integer,
    component_qoh integer,
    qoh integer,
    reorder_level integer,
    reorder_point integer,
    PRIMARY KEY (id, updated_time),
    FOREIGN KEY (item_id) REFERENCES item_history(id),
    FOREIGN KEY (shop_id) REFERENCES shop_history(id)
);

CREATE TABLE payment_type (
    id bigint,
    refund_as_payment_type_id bigint,
    archived boolean,
    internal_reserved boolean,
    "name" text,
    require_customer boolean,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (refund_as_payment_type_id) REFERENCES payment_type(id)
);

CREATE TABLE price_level (
    id bigint,
    archived boolean,
    can_be_archived boolean,
    "name" text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE employee_role (
    id bigint,
    archived boolean,
    "name" text,
    system boolean,
    PRIMARY KEY (id)
);

CREATE TABLE order_history (
    id bigint,
    updated_time timestamp,
    shop_id bigint,
    vendor_id bigint,
    archived boolean,
    arrival_date timestamp,
    complete boolean,
    discount double precision,
    note text,
    note_id bigint,
    note_is_public boolean,
    note_updated_time timestamp,
    ordered_date timestamp,
    other_cost double precision,
    received_date timestamp,
    reference_number text,
    ship_cost double precision,
    ship_instructions text,
    stock_instructions text,
    total_discount double precision,
    total_quantity integer,
    PRIMARY KEY (id, updated_time),
    FOREIGN KEY (shop_id) REFERENCES shop_history(id),
    FOREIGN KEY (vendor_id) REFERENCES vendor_history(id)
);

CREATE TABLE customer_history (
    id bigint,
    updated_time timestamp,
    credit_account_id bigint,
    customer_type_id bigint,
    discount_id bigint,
    tax_category_id bigint,
    address_1 text,
    address_2 text,
    archived boolean,
    city text,
    company text,
    company_registration_number text,
    country text,
    country_code text,
    created_time timestamp,
    custom text,
    dob timestamp,
    first_name text,
    last_name text,
    no_email boolean,
    no_mail boolean,
    no_phone boolean,
    note text,
    note_is_public boolean,
    note_updated_time timestamp,
    "state" text,
    state_code text,
    title text,
    vat_number text,
    website_url text,
    zip text,
    PRIMARY KEY (id, updated_time),
    FOREIGN KEY (credit_account_id) REFERENCES credit_account_history(id),
    FOREIGN KEY (customer_type_id) REFERENCES customer_type(id),
    FOREIGN KEY (discount_id) REFERENCES discount_history(id),
    FOREIGN KEY (tax_category_id) REFERENCES tax_category_history(id)
);

CREATE TABLE quote (
    id bigint,
    employee_id bigint,
    sale_id bigint,
    archived boolean,
    issue_date timestamp,
    notes text,
    PRIMARY KEY (id),
    FOREIGN KEY (employee_id) REFERENCES employee_history(id),
    FOREIGN KEY (sale_id) REFERENCES sale_history(id)
);

CREATE TABLE register_count (
    id bigint,
    close_employee_id bigint,
    open_employee_id bigint,
    register_id bigint,
    created_time timestamp,
    notes text,
    open_time timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (close_employee_id) REFERENCES employee_history(id),
    FOREIGN KEY (open_employee_id) REFERENCES employee_history(id),
    FOREIGN KEY (register_id) REFERENCES register_history(open_time)
);

CREATE TABLE inventory_count_reconcile (
    id bigint,
    inventory_count_id bigint,
    item_id bigint,
    cost_change double precision,
    created_time timestamp,
    qoh_change integer,
    PRIMARY KEY (id),
    FOREIGN KEY (inventory_count_id) REFERENCES inventory_count_history(id),
    FOREIGN KEY (item_id) REFERENCES item_history(id)
);

CREATE TABLE item_vendor_num_history (
    id bigint,
    updated_time timestamp,
    item_id bigint,
    vendor_id bigint,
    "value" text,
    PRIMARY KEY (id, updated_time),
    FOREIGN KEY (item_id) REFERENCES item_history(id),
    FOREIGN KEY (vendor_id) REFERENCES vendor_history(id)
);

CREATE TABLE order_by_tax_class (
    "date" text,
    order_id bigint,
    tax_class_id bigint,
    shop_id bigint,
    vendor_id bigint,
    cost double precision,
    tax_class_name text,
    total_other_cost double precision,
    total_ship_cost double precision,
    vendor_name text,
    PRIMARY KEY ("date", order_id, tax_class_id),
    FOREIGN KEY (order_id) REFERENCES order_history(id),
    FOREIGN KEY (tax_class_id) REFERENCES tax_class_history(id),
    FOREIGN KEY (shop_id) REFERENCES shop_history(id),
    FOREIGN KEY (vendor_id) REFERENCES vendor_history(id)
);

CREATE TABLE sale_history (
    id bigint,
    updated_time timestamp,
    customer_id bigint,
    discount_id bigint,
    employee_id bigint,
    quote_id bigint,
    register_id bigint,
    ship_to_id bigint,
    shop_id bigint,
    tax_category_id bigint,
    archived boolean,
    balance double precision,
    calc_avg_cost double precision,
    calc_discount double precision,
    calc_fifocost double precision,
    calc_non_taxable double precision,
    calc_payments double precision,
    calc_subtotal double precision,
    calc_tax_1 double precision,
    calc_tax_2 double precision,
    calc_taxable double precision,
    calc_total double precision,
    change double precision,
    complete_time timestamp,
    completed boolean,
    created_time timestamp,
    discount_percent double precision,
    displayable_subtotal double precision,
    displayable_total double precision,
    enable_promotions boolean,
    is_tax_inclusive boolean,
    receipt_preference text,
    reference_number text,
    reference_number_source text,
    tax_1_rate double precision,
    tax_2_rate double precision,
    tax_total double precision,
    ticket_number text,
    total double precision,
    total_due double precision,
    voided boolean,
    PRIMARY KEY (id, updated_time),
    FOREIGN KEY (customer_id) REFERENCES customer_history(id),
    FOREIGN KEY (discount_id) REFERENCES discount_history(id),
    FOREIGN KEY (employee_id) REFERENCES employee_history(id),
    FOREIGN KEY (quote_id) REFERENCES quote(id),
    FOREIGN KEY (register_id) REFERENCES register_history(open_time),
    FOREIGN KEY (ship_to_id) REFERENCES ship_to_history(id),
    FOREIGN KEY (shop_id) REFERENCES shop_history(id),
    FOREIGN KEY (tax_category_id) REFERENCES tax_category_history(id)
);

CREATE TABLE work_order_history (
    id bigint,
    updated_time timestamp,
    customer_id bigint,
    discount_id bigint,
    employee_id bigint,
    sale_id bigint,
    sale_line_id bigint,
    serialized_id bigint,
    shop_id bigint,
    workorder_status_id bigint,
    archived boolean,
    assign_employee_to_all boolean,
    eta_out timestamp,
    hook_in text,
    hook_out text,
    note text,
    save_parts boolean,
    system_sku text,
    tax boolean,
    time_in timestamp,
    warranty boolean,
    PRIMARY KEY (id, updated_time),
    FOREIGN KEY (customer_id) REFERENCES customer_history(id),
    FOREIGN KEY (discount_id) REFERENCES discount_history(id),
    FOREIGN KEY (employee_id) REFERENCES employee_history(id),
    FOREIGN KEY (sale_id) REFERENCES sale_history(id),
    FOREIGN KEY (sale_line_id) REFERENCES sale_line_history(id),
    FOREIGN KEY (serialized_id) REFERENCES serial_history(id),
    FOREIGN KEY (shop_id) REFERENCES shop_history(id),
    FOREIGN KEY (workorder_status_id) REFERENCES work_order_status(id)
);

CREATE TABLE ship_to_history (
    id bigint,
    updated_time timestamp,
    customer_id bigint,
    sale_id bigint,
    address_1 text,
    address_2 text,
    city text,
    company text,
    country text,
    country_code text,
    custom text,
    email_address text,
    email_use_type text,
    first_name text,
    last_name text,
    secondary_email_address text,
    secondary_email_use_type text,
    ship_note text,
    "state" text,
    state_code text,
    website_url text,
    zip text,
    PRIMARY KEY (id, updated_time),
    FOREIGN KEY (customer_id) REFERENCES customer_history(id),
    FOREIGN KEY (sale_id) REFERENCES sale_history(id)
);

CREATE TABLE vendor_email_history (
    use_type text,
    vendor_id bigint,
    vendor_updated_time timestamp,
    address text,
    PRIMARY KEY (use_type, vendor_id, vendor_updated_time),
    FOREIGN KEY (vendor_id) REFERENCES vendor_history(id),
    FOREIGN KEY (vendor_updated_time) REFERENCES vendor_history(id)
);

CREATE TABLE inventory_count_calculation (
    id bigint,
    updated_time timestamp,
    inventory_count_id bigint,
    item_id bigint,
    calculated_qoh integer,
    counted_qoh integer,
    PRIMARY KEY (id, updated_time),
    FOREIGN KEY (inventory_count_id) REFERENCES inventory_count_history(id),
    FOREIGN KEY (item_id) REFERENCES item_history(id)
);

CREATE TABLE item_matrix_tag_history (
    tag text,
    item_matrix_id bigint,
    item_matrix_updated_time timestamp,
    PRIMARY KEY (tag, item_matrix_id, item_matrix_updated_time),
    FOREIGN KEY (item_matrix_id) REFERENCES item_matrix_history(id),
    FOREIGN KEY (item_matrix_updated_time) REFERENCES item_matrix_history(id)
);

CREATE TABLE item_tag_history (
    tag text,
    item_id bigint,
    item_updated_time timestamp,
    PRIMARY KEY (tag, item_id, item_updated_time),
    FOREIGN KEY (item_id) REFERENCES item_history(id),
    FOREIGN KEY (item_updated_time) REFERENCES item_history(id)
);

CREATE TABLE employee_right (
    id bigint,
    employee_role_id bigint,
    "name" text,
    PRIMARY KEY (id, employee_role_id),
    FOREIGN KEY (employee_role_id) REFERENCES employee_role(id)
);

CREATE TABLE credit_account_history (
    id bigint,
    updated_time timestamp,
    customer_id bigint,
    archived boolean,
    balance double precision,
    code text,
    credit_limit double precision,
    description text,
    gift_card boolean,
    "name" text,
    PRIMARY KEY (id, updated_time),
    FOREIGN KEY (customer_id) REFERENCES customer_history(id)
);

CREATE TABLE attribute_value (
    attribute_type text,
    "index" integer,
    item_matrix_id bigint,
    "value" text,
    PRIMARY KEY (attribute_type, "index", item_matrix_id),
    FOREIGN KEY (item_matrix_id) REFERENCES item_matrix_history(id)
);

CREATE TABLE customer_email_history (
    use_type text,
    customer_id bigint,
    customer_updated_time timestamp,
    address text,
    PRIMARY KEY (use_type, customer_id, customer_updated_time),
    FOREIGN KEY (customer_id) REFERENCES customer_history(id),
    FOREIGN KEY (customer_updated_time) REFERENCES customer_history(id)
);

CREATE TABLE tax_category_history (
    id bigint,
    updated_time timestamp,
    is_tax_inclusive boolean,
    tax_1_name text,
    tax_1_rate double precision,
    tax_2_name text,
    tax_2_rate double precision,
    PRIMARY KEY (id, updated_time)
);

CREATE TABLE register_calculated (
    payment_type_id bigint,
    register_id bigint,
    register_open_time timestamp,
    add double precision,
    payment double precision,
    withdraw double precision,
    PRIMARY KEY (payment_type_id, register_id, register_open_time),
    FOREIGN KEY (payment_type_id) REFERENCES payment_type(id),
    FOREIGN KEY (register_id) REFERENCES register_history(open_time),
    FOREIGN KEY (register_open_time) REFERENCES register_history(open_time)
);

CREATE TABLE register_count_amount (
    id bigint,
    payment_type_id bigint,
    register_count_id bigint,
    actual double precision,
    calculated double precision,
    PRIMARY KEY (id),
    FOREIGN KEY (payment_type_id) REFERENCES payment_type(id),
    FOREIGN KEY (register_count_id) REFERENCES register_count(id)
);

CREATE TABLE serial_history (
    id bigint,
    updated_time timestamp,
    customer_id bigint,
    item_id bigint,
    sale_line_id bigint,
    color_name text,
    description text,
    serial text,
    size_name text,
    PRIMARY KEY (id, updated_time),
    FOREIGN KEY (customer_id) REFERENCES customer_history(id),
    FOREIGN KEY (item_id) REFERENCES item_history(id),
    FOREIGN KEY (sale_line_id) REFERENCES sale_line_history(id)
);

CREATE TABLE item_history (
    id bigint,
    updated_time timestamp,
    category_id bigint,
    default_vendor_id bigint,
    item_attribute_set_id bigint,
    item_matrix_id bigint,
    manufacturer_id bigint,
    tax_class_id bigint,
    archived boolean,
    attribute_1 text,
    attribute_2 text,
    attribute_3 text,
    avg_cost double precision,
    created_time timestamp,
    custom_sku text,
    default_cost double precision,
    department_id bigint,
    description text,
    discountable boolean,
    ean text,
    item_type text,
    manufacturer_sku text,
    model_year integer,
    note text,
    note_is_public boolean,
    note_updated_time timestamp,
    publish_to_ecom boolean,
    season_id bigint,
    serialized boolean,
    system_sku bigint,
    tax boolean,
    upc text,
    PRIMARY KEY (id, updated_time),
    FOREIGN KEY (category_id) REFERENCES category_history(id),
    FOREIGN KEY (default_vendor_id) REFERENCES vendor_history(id),
    FOREIGN KEY (item_attribute_set_id) REFERENCES item_attribute_set(id),
    FOREIGN KEY (item_matrix_id) REFERENCES item_matrix_history(id),
    FOREIGN KEY (manufacturer_id) REFERENCES manufacturer_history(id),
    FOREIGN KEY (tax_class_id) REFERENCES tax_class_history(id)
);

CREATE TABLE discount_by_day (
    "date" text,
    shop_id bigint,
    discount double precision,
    PRIMARY KEY ("date", shop_id),
    FOREIGN KEY (shop_id) REFERENCES shop_history(id)
);

CREATE TABLE employee_hours (
    id bigint,
    employee_id bigint,
    shop_id bigint,
    check_in timestamp,
    check_out timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (employee_id) REFERENCES employee_history(id),
    FOREIGN KEY (shop_id) REFERENCES shop_history(id)
);

CREATE TABLE item_attribute_set (
    id bigint,
    archived boolean,
    attribute_name_1 text,
    attribute_name_2 text,
    attribute_name_3 text,
    "name" text,
    system boolean,
    PRIMARY KEY (id)
);

CREATE TABLE work_order_status (
    id bigint,
    html_color text,
    "name" text,
    sort_order text,
    system_value text,
    PRIMARY KEY (id)
);

CREATE TABLE customer_type (
    id bigint,
    discount_id bigint,
    tax_category_id bigint,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (discount_id) REFERENCES discount_history(id),
    FOREIGN KEY (tax_category_id) REFERENCES tax_category_history(id)
);

CREATE TABLE customer_phone_history (
    use_type text,
    customer_id bigint,
    customer_updated_time timestamp,
    number text,
    PRIMARY KEY (use_type, customer_id, customer_updated_time),
    FOREIGN KEY (customer_id) REFERENCES customer_history(id),
    FOREIGN KEY (customer_updated_time) REFERENCES customer_history(id)
);

CREATE TABLE phone_history (
    use_type text,
    contact_id bigint,
    contact_updated_time timestamp,
    number text,
    PRIMARY KEY (use_type, contact_id, contact_updated_time),
    FOREIGN KEY (contact_id) REFERENCES contact_history(id),
    FOREIGN KEY (contact_updated_time) REFERENCES contact_history(id)
);

CREATE TABLE contact_history (
    id bigint,
    updated_time timestamp,
    address_1 text,
    address_2 text,
    city text,
    country text,
    country_code text,
    custom text,
    no_email boolean,
    no_mail boolean,
    no_phone boolean,
    "state" text,
    state_code text,
    website_url text,
    zip text,
    PRIMARY KEY (id, updated_time)
);

CREATE TABLE work_order_line_history (
    id bigint,
    updated_time timestamp,
    discount_id bigint,
    employee_id bigint,
    item_id bigint,
    sale_id bigint,
    sale_line_id bigint,
    tax_class_id bigint,
    workorder_id bigint,
    approved boolean,
    done boolean,
    hours integer,
    minutes integer,
    note text,
    tax boolean,
    unit_cost double precision,
    unit_price_override double precision,
    unit_quantity integer,
    warranty boolean,
    PRIMARY KEY (id, updated_time),
    FOREIGN KEY (discount_id) REFERENCES discount_history(id),
    FOREIGN KEY (employee_id) REFERENCES employee_history(id),
    FOREIGN KEY (item_id) REFERENCES item_history(id),
    FOREIGN KEY (sale_id) REFERENCES sale_history(id),
    FOREIGN KEY (sale_line_id) REFERENCES sale_line_history(id),
    FOREIGN KEY (tax_class_id) REFERENCES tax_class_history(id),
    FOREIGN KEY (workorder_id) REFERENCES work_order_history(id)
);

CREATE TABLE item_tag (
    tag text,
    item_id bigint,
    PRIMARY KEY (tag, item_id),
    FOREIGN KEY (item_id) REFERENCES item_history(id)
);

CREATE TABLE tax_by_day (
    "date" text,
    "index" bigint,
    shop_id bigint,
    tax_category_id bigint,
    tax double precision,
    tax_category_name text,
    PRIMARY KEY ("date", "index", shop_id),
    FOREIGN KEY (shop_id) REFERENCES shop_history(id),
    FOREIGN KEY (tax_category_id) REFERENCES tax_category_history(id)
);

CREATE TABLE item_matrix_history (
    id bigint,
    updated_time timestamp,
    category_id bigint,
    default_vendor_id bigint,
    item_attribute_set_id bigint,
    manufacturer_id bigint,
    tax_class_id bigint,
    archived boolean,
    default_cost double precision,
    description text,
    item_type text,
    model_year integer,
    serialized boolean,
    tax boolean,
    PRIMARY KEY (id, updated_time),
    FOREIGN KEY (category_id) REFERENCES category_history(id),
    FOREIGN KEY (default_vendor_id) REFERENCES vendor_history(id),
    FOREIGN KEY (item_attribute_set_id) REFERENCES item_attribute_set(id),
    FOREIGN KEY (manufacturer_id) REFERENCES manufacturer_history(id),
    FOREIGN KEY (tax_class_id) REFERENCES tax_class_history(id)
);

CREATE TABLE discount_history (
    id bigint,
    updated_time timestamp,
    archived boolean,
    discount_amount text,
    discount_percent text,
    "name" text,
    require_customer boolean,
    PRIMARY KEY (id, updated_time)
);

CREATE TABLE sale_line_history (
    id bigint,
    updated_time timestamp,
    customer_id bigint,
    discount_id bigint,
    employee_id bigint,
    item_id bigint,
    parent_sale_line_id bigint,
    sale_id bigint,
    shop_id bigint,
    tax_category_id bigint,
    tax_class_id bigint,
    avg_cost double precision,
    calc_subtotal double precision,
    calc_tax_1 double precision,
    calc_tax_2 double precision,
    calc_total double precision,
    calc_transaction_discount double precision,
    calculated_line_discount double precision,
    created_time timestamp,
    discount_amount double precision,
    discount_percent double precision,
    displayable_subtotal double precision,
    displayable_unit_price double precision,
    fifo_cost double precision,
    is_layaway boolean,
    is_special_order boolean,
    is_workorder boolean,
    normal_unit_price double precision,
    note text,
    note_id bigint,
    note_is_public boolean,
    note_updated_time timestamp,
    tax boolean,
    tax_1_rate double precision,
    tax_2_rate double precision,
    unit_price double precision,
    unit_quantity integer,
    PRIMARY KEY (id, updated_time),
    FOREIGN KEY (customer_id) REFERENCES customer_history(id),
    FOREIGN KEY (discount_id) REFERENCES discount_history(id),
    FOREIGN KEY (employee_id) REFERENCES employee_history(id),
    FOREIGN KEY (item_id) REFERENCES item_history(id),
    FOREIGN KEY (parent_sale_line_id) REFERENCES sale_line_history(id),
    FOREIGN KEY (sale_id) REFERENCES sale_history(id),
    FOREIGN KEY (shop_id) REFERENCES shop_history(id),
    FOREIGN KEY (tax_category_id) REFERENCES tax_category_history(id),
    FOREIGN KEY (tax_class_id) REFERENCES tax_category_history(id)
);

CREATE TABLE category_history (
    id bigint,
    updated_time timestamp,
    parent_id bigint,
    created_time timestamp,
    full_path_name text,
    left_node integer,
    "name" text,
    node_depth integer,
    right_node integer,
    PRIMARY KEY (id, updated_time),
    FOREIGN KEY (parent_id) REFERENCES category_history(id)
);

CREATE TABLE item_matrix_tag (
    tag text,
    item_matrix_id bigint,
    PRIMARY KEY (tag, item_matrix_id),
    FOREIGN KEY (item_matrix_id) REFERENCES item_matrix_history(id)
);

CREATE TABLE email_history (
    use_type text,
    contact_id bigint,
    contact_updated_time timestamp,
    address text,
    PRIMARY KEY (use_type, contact_id, contact_updated_time),
    FOREIGN KEY (contact_id) REFERENCES contact_history(id),
    FOREIGN KEY (contact_updated_time) REFERENCES contact_history(id)
);

CREATE TABLE register_withdraw (
    id bigint,
    employee_id bigint,
    payment_type_id bigint,
    register_id bigint,
    amount double precision,
    created_time timestamp,
    notes text,
    PRIMARY KEY (id),
    FOREIGN KEY (employee_id) REFERENCES employee_history(id),
    FOREIGN KEY (payment_type_id) REFERENCES payment_type(id),
    FOREIGN KEY (register_id) REFERENCES register_history(open_time)
);

CREATE TABLE ship_to_phone_history (
    use_type text,
    ship_to_id bigint,
    ship_to_updated_time timestamp,
    number text,
    PRIMARY KEY (use_type, ship_to_id, ship_to_updated_time),
    FOREIGN KEY (ship_to_id) REFERENCES ship_to_history(id),
    FOREIGN KEY (ship_to_updated_time) REFERENCES ship_to_history(id)
);

CREATE TABLE shop_history (
    id bigint,
    updated_time timestamp,
    contact_id bigint,
    price_level_id bigint,
    tax_category_id bigint,
    archived boolean,
    cc_gateway_id bigint,
    company_registration_number text,
    gateway_config_id text,
    label_msrp boolean,
    label_title text,
    "name" text,
    receipt_setup_id bigint,
    service_rate double precision,
    tax_labor boolean,
    time_zone text,
    vat_number text,
    zebra_browser_print boolean,
    PRIMARY KEY (id, updated_time),
    FOREIGN KEY (contact_id) REFERENCES contact_history(id),
    FOREIGN KEY (price_level_id) REFERENCES price_level(id),
    FOREIGN KEY (tax_category_id) REFERENCES tax_category_history(id)
);

CREATE TABLE cc_charge_history (
    id bigint,
    updated_time timestamp,
    sale_id bigint,
    amount double precision,
    auth_code text,
    auth_only boolean,
    card_type text,
    cardholder_name text,
    communication_key text,
    declined boolean,
    entry_method text,
    expiry_date text,
    gateway_transaction_id text,
    is_debit boolean,
    refunded double precision,
    voided boolean,
    xnum text,
    PRIMARY KEY (id, updated_time),
    FOREIGN KEY (sale_id) REFERENCES sale_history(id)
);

CREATE TABLE employee_history (
    id bigint,
    updated_time timestamp,
    clock_in_employee_hours_id bigint,
    contact_id bigint,
    employee_role_id bigint,
    last_register_id bigint,
    last_sale_id bigint,
    last_shop_id bigint,
    limit_to_shop_id bigint,
    archived boolean,
    first_name text,
    last_name text,
    lock_out boolean,
    PRIMARY KEY (id, updated_time),
    FOREIGN KEY (clock_in_employee_hours_id) REFERENCES employee_hours(id),
    FOREIGN KEY (contact_id) REFERENCES contact_history(id),
    FOREIGN KEY (employee_role_id) REFERENCES employee_role(id),
    FOREIGN KEY (last_register_id) REFERENCES register_history(open_time),
    FOREIGN KEY (last_sale_id) REFERENCES sale_history(id),
    FOREIGN KEY (last_shop_id) REFERENCES shop_history(id),
    FOREIGN KEY (limit_to_shop_id) REFERENCES shop_history(id)
);

CREATE TABLE inventory_count_item_history (
    id bigint,
    updated_time timestamp,
    employee_id bigint,
    inventory_count_id bigint,
    item_id bigint,
    quantity integer,
    PRIMARY KEY (id, updated_time),
    FOREIGN KEY (employee_id) REFERENCES employee_history(id),
    FOREIGN KEY (inventory_count_id) REFERENCES inventory_count_history(id),
    FOREIGN KEY (item_id) REFERENCES item_history(id)
);

CREATE TABLE tax_class_sales_by_day (
    "date" text,
    shop_id bigint,
    tax_class_id bigint,
    avg_cost double precision,
    fifo_cost double precision,
    subtotal double precision,
    tax_class_name text,
    PRIMARY KEY ("date", shop_id, tax_class_id),
    FOREIGN KEY (shop_id) REFERENCES shop_history(id),
    FOREIGN KEY (tax_class_id) REFERENCES tax_class_history(id)
);

CREATE TABLE item_matrix_price (
    use_type_id integer,
    item_matrix_id bigint,
    amount double precision,
    use_type text,
    PRIMARY KEY (use_type_id, item_matrix_id),
    FOREIGN KEY (item_matrix_id) REFERENCES item_matrix_history(id)
);

CREATE TABLE work_order_item_history (
    id bigint,
    updated_time timestamp,
    discount_id bigint,
    employee_id bigint,
    item_id bigint,
    sale_id bigint,
    sale_line_id bigint,
    workorder_id bigint,
    approved boolean,
    is_special_order boolean,
    note text,
    tax boolean,
    unit_price double precision,
    unit_quantity integer,
    warranty boolean,
    PRIMARY KEY (id, updated_time),
    FOREIGN KEY (discount_id) REFERENCES discount_history(id),
    FOREIGN KEY (employee_id) REFERENCES employee_history(id),
    FOREIGN KEY (item_id) REFERENCES item_history(id),
    FOREIGN KEY (sale_id) REFERENCES sale_history(id),
    FOREIGN KEY (sale_line_id) REFERENCES sale_line_history(id),
    FOREIGN KEY (workorder_id) REFERENCES work_order_history(id)
);

CREATE TABLE manufacturer_history (
    id bigint,
    updated_time timestamp,
    created_time timestamp,
    "name" text,
    PRIMARY KEY (id, updated_time)
);

CREATE TABLE item_price (
    item_id bigint,
    use_type_id integer,
    amount double precision,
    use_type text,
    PRIMARY KEY (item_id, use_type_id)
);

CREATE TABLE item_price_history (
    use_type_id integer,
    item_id bigint,
    item_updated_time timestamp,
    amount double precision,
    use_type text,
    PRIMARY KEY (use_type_id, item_id, item_updated_time),
    FOREIGN KEY (item_id) REFERENCES item_history(id),
    FOREIGN KEY (item_updated_time) REFERENCES item_history(id)
);

CREATE TABLE register_history (
    id bigint,
    open_time timestamp,
    open_employee_id bigint,
    shop_id bigint,
    archived boolean,
    cc_terminal_id text,
    "name" text,
    "open" boolean,
    PRIMARY KEY (id, open_time),
    FOREIGN KEY (open_employee_id) REFERENCES employee_history(id),
    FOREIGN KEY (shop_id) REFERENCES shop_history(id)
);

CREATE TABLE sale_void (
    id bigint,
    employee_id bigint,
    sale_id bigint,
    shop_id bigint,
    created_time timestamp,
    reason text,
    PRIMARY KEY (id),
    FOREIGN KEY (employee_id) REFERENCES employee_history(id),
    FOREIGN KEY (sale_id) REFERENCES sale_history(id),
    FOREIGN KEY (shop_id) REFERENCES shop_history(id)
);

CREATE TABLE item_matrix_price_history (
    use_type_id integer,
    item_matrix_id bigint,
    item_matrix_updated_time timestamp,
    amount double precision,
    use_type text,
    PRIMARY KEY (use_type_id, item_matrix_id, item_matrix_updated_time),
    FOREIGN KEY (item_matrix_id) REFERENCES item_matrix_history(id),
    FOREIGN KEY (item_matrix_updated_time) REFERENCES item_matrix_history(id)
);

CREATE TABLE payment_by_day (
    "date" text,
    payment_type_id bigint,
    shop_id bigint,
    amount double precision,
    payment_type_name text,
    PRIMARY KEY ("date", payment_type_id, shop_id),
    FOREIGN KEY (payment_type_id) REFERENCES payment_type(id),
    FOREIGN KEY (shop_id) REFERENCES shop_history(id)
);

CREATE TABLE inventory_count_history (
    id bigint,
    updated_time timestamp,
    shop_id bigint,
    archived boolean,
    "name" text,
    PRIMARY KEY (id, updated_time),
    FOREIGN KEY (shop_id) REFERENCES shop_history(id)
);

CREATE TABLE sale_payment (
    id bigint,
    cc_charge_id bigint,
    credit_account_id bigint,
    employee_id bigint,
    payment_type_id bigint,
    ref_payment_id bigint,
    register_id bigint,
    sale_id bigint,
    amount double precision,
    archived boolean,
    created_time timestamp,
    payment_id text,
    remote_reference text,
    PRIMARY KEY (id),
    FOREIGN KEY (cc_charge_id) REFERENCES cc_charge_history(id),
    FOREIGN KEY (credit_account_id) REFERENCES credit_account_history(id),
    FOREIGN KEY (employee_id) REFERENCES employee_history(id),
    FOREIGN KEY (payment_type_id) REFERENCES payment_type(id),
    FOREIGN KEY (ref_payment_id) REFERENCES sale_payment(id),
    FOREIGN KEY (register_id) REFERENCES register_history(open_time),
    FOREIGN KEY (sale_id) REFERENCES sale_history(id)
);

CREATE TABLE vendor_history (
    id bigint,
    updated_time timestamp,
    account_number text,
    address_1 text,
    address_2 text,
    archived boolean,
    city text,
    country text,
    country_code text,
    custom text,
    "name" text,
    no_email boolean,
    no_mail boolean,
    no_phone boolean,
    price_level text,
    rep_first_name text,
    rep_last_name text,
    share_sell_through boolean,
    "state" text,
    state_code text,
    update_cost boolean,
    update_description boolean,
    update_price boolean,
    website_url text,
    zip text,
    PRIMARY KEY (id, updated_time)
);

CREATE TABLE vendor_phone_history (
    use_type text,
    vendor_id bigint,
    vendor_updated_time timestamp,
    number text,
    PRIMARY KEY (use_type, vendor_id, vendor_updated_time),
    FOREIGN KEY (vendor_id) REFERENCES vendor_history(id),
    FOREIGN KEY (vendor_updated_time) REFERENCES vendor_history(id)
);

CREATE TABLE attribute_value_history (
    attribute_type text,
    "index" integer,
    item_matrix_id bigint,
    item_matrix_updated_time timestamp,
    "value" text,
    PRIMARY KEY (attribute_type, "index", item_matrix_id, item_matrix_updated_time),
    FOREIGN KEY (item_matrix_id) REFERENCES item_matrix_history(id),
    FOREIGN KEY (item_matrix_updated_time) REFERENCES item_matrix_history(id)
);

CREATE TABLE tax_class_history (
    id bigint,
    updated_time timestamp,
    "name" text,
    PRIMARY KEY (id, updated_time)
);

CREATE TABLE inventory_transfer_history (
    id bigint,
    updated_time timestamp,
    created_by_employee_id bigint,
    receiving_shop_id bigint,
    sending_shop_id bigint,
    sent_by_employee_id bigint,
    archived boolean,
    created_time timestamp,
    need_by timestamp,
    note text,
    sent_on timestamp,
    "status" text,
    PRIMARY KEY (id, updated_time),
    FOREIGN KEY (created_by_employee_id) REFERENCES employee_history(id),
    FOREIGN KEY (receiving_shop_id) REFERENCES shop_history(id),
    FOREIGN KEY (sending_shop_id) REFERENCES shop_history(id),
    FOREIGN KEY (sent_by_employee_id) REFERENCES employee_history(id)
);

CREATE TABLE transfer_item_history (
    id bigint,
    updated_time timestamp,
    item_id bigint,
    transfer_id bigint,
    "comment" text,
    received integer,
    received_value double precision,
    sent integer,
    sent_value double precision,
    to_receive integer,
    to_send integer,
    PRIMARY KEY (id, updated_time),
    FOREIGN KEY (item_id) REFERENCES item_history(id),
    FOREIGN KEY (transfer_id) REFERENCES inventory_transfer_history(id)
);

CREATE TABLE special_order_history (
    id bigint,
    updated_time timestamp,
    customer_id bigint,
    order_line_id bigint,
    sale_line_id bigint,
    shop_id bigint,
    transfer_item_id bigint,
    completed boolean,
    contacted boolean,
    "status" text,
    unit_quantity integer,
    PRIMARY KEY (id, updated_time),
    FOREIGN KEY (customer_id) REFERENCES customer_history(id),
    FOREIGN KEY (order_line_id) REFERENCES order_line_history(id),
    FOREIGN KEY (sale_line_id) REFERENCES sale_line_history(id),
    FOREIGN KEY (shop_id) REFERENCES shop_history(id),
    FOREIGN KEY (transfer_item_id) REFERENCES transfer_item_history(id)
);

CREATE TABLE order_line_history (
    id bigint,
    updated_time timestamp,
    item_id bigint,
    order_id bigint,
    checked_in integer,
    num_received integer,
    original_price double precision,
    price double precision,
    quantity integer,
    total double precision,
    PRIMARY KEY (id, updated_time),
    FOREIGN KEY (item_id) REFERENCES item_history(id),
    FOREIGN KEY (order_id) REFERENCES order_history(id)
);
