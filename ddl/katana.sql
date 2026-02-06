CREATE TABLE sales_order_address (
    id text,
    sales_order_id text,
    city text,
    company text,
    country text,
    created_at text,
    deleted_at text,
    entity_type text,
    first_name text,
    last_name text,
    line_1 text,
    line_2 text,
    phone text,
    "state" text,
    updated_at text,
    zip text,
    PRIMARY KEY (id),
    FOREIGN KEY (sales_order_id) REFERENCES sales_order(id)
);

CREATE TABLE variant_config_attribute (
    _fivetran_id text,
    variant_id text,
    config_name text,
    config_value text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (variant_id) REFERENCES variant(id)
);

CREATE TABLE variant_supplier_item_code (
    supplier_item_code text,
    variant_id text,
    PRIMARY KEY (supplier_item_code, variant_id),
    FOREIGN KEY (variant_id) REFERENCES variant(id)
);

CREATE TABLE variant (
    id text,
    material_id text,
    product_id text,
    created_at text,
    deleted_at text,
    internal_barcode text,
    purchase_price text,
    registered_barcode text,
    sales_price text,
    sku text,
    "type" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (material_id) REFERENCES material(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE outsource_purchase_order_recipe (
    id text,
    ingredient_variant_id text,
    purchase_order_id text,
    purchase_order_row_id text,
    cost text,
    ingredient_availability text,
    ingredient_expected_date text,
    notes text,
    planned_quantity_per_unit text,
    PRIMARY KEY (id),
    FOREIGN KEY (ingredient_variant_id) REFERENCES variant(id),
    FOREIGN KEY (purchase_order_id) REFERENCES purchase_order(id),
    FOREIGN KEY (purchase_order_row_id) REFERENCES purchase_order_row(id)
);

CREATE TABLE batch_transaction (
    batch_id text,
    parent_id text,
    quantity text,
    "type" text,
    PRIMARY KEY (batch_id),
    FOREIGN KEY (batch_id) REFERENCES batch(id),
    FOREIGN KEY (parent_id) REFERENCES stock_transfer_row(stock_transfer_row_temp_id)
);

CREATE TABLE inventory (
    _fivetran_id text,
    location_id text,
    variant_id text,
    average_cost text,
    quantity_committed text,
    quantity_expected text,
    quantity_in_stock text,
    quantity_missing_or_excess text,
    reorder_point text,
    value_in_stock text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (location_id) REFERENCES location(id),
    FOREIGN KEY (variant_id) REFERENCES variant(id)
);

CREATE TABLE sales_order_sales_order_row (
    id text,
    sales_order_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES sales_order_row(id),
    FOREIGN KEY (sales_order_id) REFERENCES sales_order(id)
);

CREATE TABLE sales_order (
    id text,
    billing_address_id text,
    customer_id text,
    location_id text,
    shipping_address_id text,
    additional_info text,
    conversion_date text,
    conversion_rate text,
    created_at text,
    currency text,
    deleted_at text,
    delivery_date text,
    ecommerce_order_id text,
    ecommerce_order_type text,
    ecommerce_store_name text,
    ingredient_availability text,
    ingredient_expected_date text,
    invoicing_status text,
    order_created_date text,
    order_no text,
    picked_date text,
    product_availability text,
    product_expected_date text,
    production_status text,
    "source" text,
    "status" text,
    total text,
    total_in_base_currency text,
    tracking_number text,
    tracking_number_url text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (billing_address_id) REFERENCES sales_order_address(id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (location_id) REFERENCES location(id),
    FOREIGN KEY (shipping_address_id) REFERENCES sales_order_address(id)
);

CREATE TABLE manufacture_order_operation (
    id text,
    completed_at text,
    cost_per_hour text,
    created_at text,
    deleted_at text,
    manufacturing_order_id text,
    operation_id text,
    operation_name text,
    planned_cost_per_unit text,
    planned_time_per_unit text,
    rank text,
    resource_id text,
    resource_name text,
    "status" text,
    total_actual_cost text,
    total_actual_time text,
    total_consumed_time text,
    total_remaining_time text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE manufacturing_order_operator (
    operator_id text,
    manufacture_order_operation_id text,
    deleted_at text,
    "name" text,
    "type" text,
    PRIMARY KEY (operator_id, manufacture_order_operation_id),
    FOREIGN KEY (manufacture_order_operation_id) REFERENCES manufacture_order_operation(id)
);

CREATE TABLE product_variant (
    id text,
    product_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES variant(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE product (
    id text,
    default_supplier_id text,
    additional_info text,
    batch_tracked text,
    category_name text,
    created_at text,
    deleted_at text,
    is_producible text,
    is_purchasable text,
    "name" text,
    purchase_uom text,
    purchase_uom_conversion_rate text,
    serial_tracked text,
    "type" text,
    uom text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (default_supplier_id) REFERENCES supplier(id)
);

CREATE TABLE config_type_value (
    "value" text,
    config_type_id text,
    "type" text,
    PRIMARY KEY ("value", config_type_id),
    FOREIGN KEY (config_type_id) REFERENCES config_type(id)
);

CREATE TABLE config_type (
    id text,
    parent_id text,
    product_id text,
    "name" text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (parent_id) REFERENCES product(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE sales_order_fuiliment_row (
    sales_order_fulfillment_id text,
    sales_order_row_id text,
    quantity text,
    PRIMARY KEY (sales_order_fulfillment_id, sales_order_row_id),
    FOREIGN KEY (sales_order_fulfillment_id) REFERENCES sales_order_fulfillment(id),
    FOREIGN KEY (sales_order_row_id) REFERENCES sales_order_row(id)
);

CREATE TABLE sales_order_fulfillment (
    id text,
    sales_order_id text,
    conversion_date text,
    conversion_rate text,
    invoice_status text,
    picked_date text,
    "status" text,
    tracking_carrier text,
    tracking_method text,
    tracking_number text,
    tracking_url text,
    PRIMARY KEY (id),
    FOREIGN KEY (sales_order_id) REFERENCES sales_order(id)
);

CREATE TABLE customer (
    id text,
    default_billing_id text,
    default_shipping_id text,
    "comment" text,
    company text,
    created_at text,
    currency text,
    deleted_at text,
    email text,
    first_name text,
    last_name text,
    "name" text,
    phone text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (default_billing_id) REFERENCES customer_addresses(id),
    FOREIGN KEY (default_shipping_id) REFERENCES customer_addresses(id)
);

CREATE TABLE manufacturing_order_serial_number (
    id text,
    manufacturing_order_id text,
    resource_id text,
    resource_type text,
    serial_number text,
    transaction_date text,
    transaction_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (manufacturing_order_id) REFERENCES manufacturing_order(id)
);

CREATE TABLE manufacturing_order (
    id text,
    location_id text,
    sales_order_id text,
    sales_order_row_id text,
    variant_id text,
    actual_quantity text,
    additional_info text,
    completed_quantity text,
    created_at text,
    deleted_at text,
    done_date text,
    includes_partial_completions text,
    ingredient_availability text,
    is_linked_to_sales_order text,
    material_cost text,
    operations_cost text,
    order_created_date text,
    order_no text,
    planned_quantity text,
    production_deadline_date text,
    remaining_quantity text,
    sales_order_delivery_deadline text,
    "status" text,
    subassemblies_cost text,
    total_actual_time text,
    total_cost text,
    total_planned_time text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (location_id) REFERENCES location(id),
    FOREIGN KEY (sales_order_id) REFERENCES sales_order(id),
    FOREIGN KEY (sales_order_row_id) REFERENCES sales_order_row(id),
    FOREIGN KEY (variant_id) REFERENCES variant(id)
);

CREATE TABLE stock_adjusment_row (
    id text,
    stock_adjusment_id text,
    variant_id text,
    cost_per_unit text,
    created_at text,
    deleted_at text,
    quantity text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (stock_adjusment_id) REFERENCES stock_adjusment(id),
    FOREIGN KEY (variant_id) REFERENCES variant(id)
);

CREATE TABLE stock_adjusment (
    id text,
    location_id text,
    additional_info text,
    created_at text,
    deleted_at text,
    reason text,
    stock_adjustment_date text,
    stock_adjustment_number text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE customer_addresses (
    id text,
    customer_id text,
    city text,
    company text,
    country text,
    created_at text,
    deleted_at text,
    entity_type text,
    first_name text,
    last_name text,
    line_1 text,
    line_2 text,
    phone text,
    "state" text,
    updated_at text,
    zip text,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE manufacturing_ordering_recipe (
    id text,
    manufacturing_order_id text,
    variant_id text,
    cost text,
    created_at text,
    deleted_at text,
    ingredient_availability text,
    ingredient_expected_date text,
    notes text,
    planned_quantity_per_unit text,
    total_actual_quantity text,
    total_consumed_quantity text,
    total_remaining_quantity text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (manufacturing_order_id) REFERENCES manufacturing_order(id),
    FOREIGN KEY (variant_id) REFERENCES variant(id)
);

CREATE TABLE purchase_order_purchase_order_row (
    id text,
    purchase_order_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES purchase_order_row(id),
    FOREIGN KEY (purchase_order_id) REFERENCES purchase_order(id)
);

CREATE TABLE purchase_order (
    id text,
    location_id text,
    supplier_id text,
    tracking_location_id text,
    additional_info text,
    billing_status text,
    created_at text,
    currency text,
    deleted_at text,
    entity_type text,
    expected_arrival_date text,
    ingredient_availability text,
    ingredient_expected_date text,
    last_document_status text,
    order_created_date text,
    order_no text,
    "status" text,
    total text,
    total_in_base_currency text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (location_id) REFERENCES location(id),
    FOREIGN KEY (supplier_id) REFERENCES supplier(id),
    FOREIGN KEY (tracking_location_id) REFERENCES location(id)
);

CREATE TABLE location (
    id text,
    address text,
    address_city text,
    address_country text,
    address_id text,
    address_line_1 text,
    address_line_2 text,
    address_state text,
    address_zip text,
    created_at text,
    deleted_at text,
    is_primary text,
    legal_name text,
    manufacturing_allowed text,
    "name" text,
    purchase_allowed text,
    sales_allowed text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE sales_order_accounting_metadata (
    id text,
    fulfillment_id text,
    sales_order_id text,
    created_at text,
    integration_type text,
    invoice_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (fulfillment_id) REFERENCES sales_order_fulfillment(id),
    FOREIGN KEY (sales_order_id) REFERENCES sales_order(id)
);

CREATE TABLE supplier_address (
    id text,
    supplier_id text,
    city text,
    country text,
    created_at text,
    line_1 text,
    line_2 text,
    "state" text,
    updated_at text,
    zip text,
    PRIMARY KEY (id, supplier_id),
    FOREIGN KEY (supplier_id) REFERENCES supplier(id)
);

CREATE TABLE supplier (
    id text,
    "comment" text,
    created_at text,
    currency text,
    default_address_id text,
    deleted_at text,
    email text,
    "name" text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE recipe (
    recipe_id text,
    ingredient_variant_id text,
    product_id text,
    product_variant_id text,
    created_at text,
    notes text,
    quantity text,
    recipe_row_id text,
    updated_at text,
    PRIMARY KEY (recipe_id),
    FOREIGN KEY (ingredient_variant_id) REFERENCES variant(id),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (product_variant_id) REFERENCES product_variant(id)
);

CREATE TABLE batch (
    id text,
    location_id text,
    variant_id text,
    batch_barcode text,
    batch_created_date text,
    batch_number text,
    expiration_date text,
    quantity_in_stock text,
    PRIMARY KEY (id),
    FOREIGN KEY (location_id) REFERENCES location(id),
    FOREIGN KEY (variant_id) REFERENCES variant(id)
);

CREATE TABLE inventory_movement (
    id text,
    location_id text,
    variant_id text,
    average_cost_after text,
    balance_after text,
    caused_by_order_no text,
    caused_by_resource_id text,
    created_at text,
    movement_date text,
    quantity_change text,
    rank text,
    resource_id text,
    resource_type text,
    updated_at text,
    value_in_stock_after text,
    value_per_unit text,
    PRIMARY KEY (id),
    FOREIGN KEY (location_id) REFERENCES location(id),
    FOREIGN KEY (variant_id) REFERENCES variant(id)
);

CREATE TABLE factory (
    _fivetran_id text,
    default_manufacturing_location_id text,
    default_purchases_location_id text,
    default_sales_location_id text,
    base_currency_code text,
    default_po_lead_time text,
    default_so_delivery_time text,
    display_name text,
    inventory_closing_date text,
    legal_address_city text,
    legal_address_country text,
    legal_address_line_1 text,
    legal_address_line_2 text,
    legal_address_state text,
    legal_address_zip text,
    legal_name text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (default_manufacturing_location_id) REFERENCES location(id),
    FOREIGN KEY (default_purchases_location_id) REFERENCES location(id),
    FOREIGN KEY (default_sales_location_id) REFERENCES location(id)
);

CREATE TABLE material_variant (
    id text,
    material_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES variant(id),
    FOREIGN KEY (material_id) REFERENCES material(id)
);

CREATE TABLE material_supplier_item_code (
    _fivetran_id text,
    material_id text,
    code text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (material_id) REFERENCES material(id)
);

CREATE TABLE material (
    id text,
    default_supplier_id text,
    additional_info text,
    batch_tracked text,
    category_name text,
    created_at text,
    deleted_at text,
    "name" text,
    purchase_uom text,
    purchase_uom_conversion_rate text,
    serial_tracked text,
    "type" text,
    uom text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (default_supplier_id) REFERENCES supplier(id)
);

CREATE TABLE sales_order_row (
    id text,
    linked_manufacturing_order_id text,
    sales_order_id text,
    tax_rate_id text,
    variant_id text,
    conversion_date text,
    conversion_rate text,
    created_at text,
    deleted_at text,
    price_per_unit text,
    price_per_unit_in_base_currency text,
    quantity text,
    serial_numbers jsonb,
    total text,
    total_in_base_currency text,
    updated_at text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (linked_manufacturing_order_id) REFERENCES manufacturing_order(id),
    FOREIGN KEY (sales_order_id) REFERENCES sales_order(id),
    FOREIGN KEY (tax_rate_id) REFERENCES tax_rate(id),
    FOREIGN KEY (variant_id) REFERENCES variant(id)
);

CREATE TABLE stock_transfer_row (
    stock_transfer_row_temp_id text,
    stock_transfer_row_temp_cost_per_unit text,
    stock_transfer_row_temp_quantity text,
    stock_transfer_row_temp_variant_id text,
    PRIMARY KEY (stock_transfer_row_temp_id)
);

CREATE TABLE stock_transfer (
    id text,
    source_location_id text,
    target_location_id text,
    additional_info text,
    created_at text,
    deleted_at text,
    stock_transfer_number text,
    transfer_date text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (source_location_id) REFERENCES location(id),
    FOREIGN KEY (target_location_id) REFERENCES location(id)
);

CREATE TABLE purchase_order_row (
    id text,
    purchase_order_id text,
    tax_rate_id text,
    variant_id text,
    conversion_date text,
    conversion_rate text,
    created_at text,
    currency text,
    deleted_at text,
    price_per_unit text,
    purchase_uom text,
    purchase_uom_conversion_rate text,
    quantity text,
    received_date text,
    total text,
    total_in_base_currency text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (purchase_order_id) REFERENCES purchase_order(id),
    FOREIGN KEY (tax_rate_id) REFERENCES tax_rate(id),
    FOREIGN KEY (variant_id) REFERENCES variant(id)
);

CREATE TABLE tax_rate (
    id text,
    created_at text,
    display_name text,
    is_default_purchases text,
    is_default_sales text,
    "name" text,
    rate text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE production_operation (
    _fivetran_id text,
    operation_id text,
    product_id text,
    cost_per_hour text,
    created_at text,
    operation_name text,
    planned_cost_per_unit text,
    planned_time_per_unit text,
    product_operation_row_id text,
    product_variant_id text,
    rank text,
    resource_id text,
    resource_name text,
    updated_at text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (operation_id) REFERENCES manufacture_order_operation(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);
