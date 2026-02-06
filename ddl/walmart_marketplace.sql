CREATE TABLE product_identifier (
    product_id text,
    feed_id text,
    feed_item_detail_index text,
    product_id_type text,
    PRIMARY KEY (product_id, feed_id, feed_item_detail_index),
    FOREIGN KEY (feed_id) REFERENCES feed_item_detail(feed_id),
    FOREIGN KEY (feed_item_detail_index) REFERENCES feed_item_detail("index")
);

CREATE TABLE feed_item_detail (
    "index" text,
    feed_id text,
    ingestion_status text,
    itemid text,
    mart_id text,
    sku text,
    wpid text,
    PRIMARY KEY ("index", feed_id),
    FOREIGN KEY (feed_id) REFERENCES feed_item_status(feed_id)
);

CREATE TABLE feed_item_status (
    feed_id text,
    additional_attribute text,
    feed_status text,
    feed_submission_date text,
    ingestion_error text,
    items_failed text,
    items_processing text,
    items_received text,
    items_succeeded text,
    submitted_by text,
    PRIMARY KEY (feed_id),
    FOREIGN KEY (feed_id) REFERENCES feed_status(feed_id)
);

CREATE TABLE inbound_shipment_item (
    inbound_order_id text,
    shipment_id text,
    sku text,
    damaged_qty text,
    expected_delivery_date text,
    fill_rate text,
    gtin text,
    inner_pack_quantity text,
    item_desc text,
    item_quantity text,
    received_qty text,
    updated_expected_delivery_date text,
    vendor_pack_quantity text,
    PRIMARY KEY (inbound_order_id, shipment_id),
    FOREIGN KEY (shipment_id) REFERENCES shipment(id),
    FOREIGN KEY (sku) REFERENCES item(sku)
);

CREATE TABLE wfs_inventory_log (
    id text,
    gtin text,
    changed_unit text,
    fc_name text,
    shipment_id text,
    transaction_location text,
    transaction_reason_code text,
    transaction_reason_desc text,
    transaction_time text,
    transaction_type text,
    PRIMARY KEY (id, gtin),
    FOREIGN KEY (gtin) REFERENCES wfs_inventory_log_payload(gtin)
);

CREATE TABLE wfs_inventory_log_payload (
    gtin text,
    product_name text,
    vendor_sku text,
    PRIMARY KEY (gtin),
    FOREIGN KEY (gtin) REFERENCES item(gtin)
);

CREATE TABLE distributor_supported_service (
    distributor_supported_service text,
    ship_node text,
    PRIMARY KEY (distributor_supported_service, ship_node),
    FOREIGN KEY (ship_node) REFERENCES fulfillment_center(ship_node)
);

CREATE TABLE two_day_shipping_detail (
    "index" text,
    fulfillment_center_ship_node text,
    carrier_method_name text,
    carrier_method_type text,
    PRIMARY KEY ("index", fulfillment_center_ship_node),
    FOREIGN KEY (fulfillment_center_ship_node) REFERENCES fulfillment_center(ship_node)
);

CREATE TABLE calendar_day_configuration (
    "index" text,
    ship_node text,
    additional_days_off text,
    carrier_weekend_calendar_saturday_working_day text,
    carrier_weekend_calendar_sunday_working_day text,
    standard_processing_schedule_friday_cut_off_time text,
    standard_processing_schedule_friday_is_working_day text,
    standard_processing_schedule_monday_cut_off_time text,
    standard_processing_schedule_monday_is_working_day text,
    standard_processing_schedule_saturday_cut_off_time text,
    standard_processing_schedule_saturday_is_working_day text,
    standard_processing_schedule_sunday_cut_off_time text,
    standard_processing_schedule_sunday_is_working_day text,
    standard_processing_schedule_thursday_cut_off_time text,
    standard_processing_schedule_thursday_is_working_day text,
    standard_processing_schedule_tuesday_cut_off_time text,
    standard_processing_schedule_tuesday_is_working_day text,
    standard_processing_schedule_wednesday_cut_off_time text,
    standard_processing_schedule_wednesday_is_working_day text,
    PRIMARY KEY ("index", ship_node),
    FOREIGN KEY (ship_node) REFERENCES fulfillment_center(ship_node)
);

CREATE TABLE fulfillment_center (
    ship_node text,
    custom_node_id text,
    node_type text,
    postal_address_address_line_1 text,
    postal_address_city text,
    postal_address_country text,
    postal_address_postal_code text,
    postal_address_state text,
    ship_node_name text,
    "status" text,
    time_zone text,
    PRIMARY KEY (ship_node)
);

CREATE TABLE fulfillment_order_line_quantity_info (
    "index" text,
    fulfillment_order_line_index text,
    seller_order_id text,
    "status" text,
    status_description text,
    status_measurement_value text,
    status_unit_of_measure text,
    PRIMARY KEY ("index", fulfillment_order_line_index, seller_order_id),
    FOREIGN KEY (fulfillment_order_line_index) REFERENCES fulfillment_order_line("index"),
    FOREIGN KEY (seller_order_id) REFERENCES fulfillment_order_line(seller_order_id)
);

CREATE TABLE fulfillment_order_line (
    "index" text,
    seller_order_id text,
    address_type text,
    addressline_one text,
    addressline_two text,
    city text,
    complete_name text,
    country_code text,
    first_name text,
    fulfillment_type text,
    last_modified text,
    last_name text,
    order_product_name text,
    ordered_quantity_measure_unit text,
    ordered_quantity_measurement_value text,
    postal_code text,
    shipping_method text,
    shipping_tier text,
    state_or_province_code text,
    state_or_province_name text,
    PRIMARY KEY ("index", seller_order_id),
    FOREIGN KEY (seller_order_id) REFERENCES fulfillment_order_status(seller_order_id)
);

CREATE TABLE fulfillment_order_shipment_line (
    "index" text,
    seller_order_id text,
    shipment_no text,
    fulfiller_line_id text,
    measurement_value text,
    shipment_line_no text,
    unit_of_measure text,
    PRIMARY KEY ("index", seller_order_id, shipment_no),
    FOREIGN KEY (seller_order_id) REFERENCES fulfillment_order_shipment(seller_order_id),
    FOREIGN KEY (shipment_no) REFERENCES fulfillment_order_shipment(shipment_no)
);

CREATE TABLE fulfillment_order_shipment_date (
    "index" text,
    seller_order_id text,
    shipment_no text,
    actual_date text,
    datetype_id text,
    expected_date text,
    PRIMARY KEY ("index", seller_order_id, shipment_no),
    FOREIGN KEY (seller_order_id) REFERENCES fulfillment_order_shipment(seller_order_id),
    FOREIGN KEY (shipment_no) REFERENCES fulfillment_order_shipment(shipment_no)
);

CREATE TABLE fulfillment_order_shipment (
    shipment_no text,
    seller_order_id text,
    actual_shipment_date text,
    carrier_description text,
    carrier_service_code text,
    external_tracking_url text,
    last_modified text,
    package_asn text,
    package_id text,
    purchase_order_id text,
    scac text,
    "status" text,
    status_description text,
    tracking_no text,
    PRIMARY KEY (shipment_no, seller_order_id),
    FOREIGN KEY (seller_order_id) REFERENCES fulfillment_order_status(seller_order_id)
);

CREATE TABLE fulfillment_order_status (
    seller_order_id text,
    buyer_first_name text,
    buyer_last_name text,
    order_channel_id text,
    order_date text,
    order_type text,
    "status" text,
    PRIMARY KEY (seller_order_id)
);

CREATE TABLE unpublished_item (
    _fivetran_id text,
    gtin text,
    sku text,
    brand text,
    conversion_rate text,
    customer_rating text,
    gmv_amount text,
    gmv_amount_currency text,
    item_id text,
    lifecycle_status text,
    market_price_amount text,
    market_price_currency text,
    market_trending text,
    offer_end_date text,
    offer_start_date text,
    page_view text,
    price_amount text,
    price_currency text,
    product_name text,
    product_type text,
    publish_status text,
    unpublish_reason text,
    unpublished_date text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (gtin) REFERENCES item(gtin),
    FOREIGN KEY (sku) REFERENCES item(sku)
);

CREATE TABLE order_line_status (
    "index" text,
    order_line_index text,
    purchase_order_id text,
    cancellation_reason text,
    return_center_address text,
    return_center_address_address_1 text,
    return_center_address_address_2 text,
    return_center_address_city text,
    return_center_address_country text,
    return_center_address_email_id text,
    return_center_address_name text,
    return_center_address_postal_code text,
    return_center_address_state text,
    "status" text,
    status_quantity_amount text,
    status_quantity_unit_of_measurement text,
    sub_seller_id text,
    tracking_info_carrier_name text,
    tracking_info_method_code text,
    tracking_info_ship_date_time text,
    tracking_info_tracking_number text,
    tracking_info_tracking_url text,
    PRIMARY KEY ("index", order_line_index, purchase_order_id),
    FOREIGN KEY (order_line_index) REFERENCES order_line("index"),
    FOREIGN KEY (purchase_order_id) REFERENCES order_line(purchase_order_id)
);

CREATE TABLE orders (
    purchase_order_id text,
    buyer_id text,
    customer_email_id text,
    customer_order_id text,
    is_guest text,
    mart text,
    order_date text,
    order_type text,
    original_customer_order_id text,
    payment_type text,
    ship_node_id text,
    ship_node_name text,
    ship_node_type text,
    shipnode_type text,
    shipping_info_estimated_delivery_date text,
    shipping_info_estimated_ship_date text,
    shipping_info_method_code text,
    shipping_info_phone text,
    shipping_info_postal_address_address_1 text,
    shipping_info_postal_address_address_2 text,
    shipping_info_postal_address_address_type text,
    shipping_info_postal_address_city text,
    shipping_info_postal_address_country text,
    shipping_info_postal_address_name text,
    shipping_info_postal_address_postal_code text,
    shipping_info_postal_address_state text,
    PRIMARY KEY (purchase_order_id)
);

CREATE TABLE order_line (
    "index" text,
    purchase_order_id text,
    item_sku text,
    return_order_id text,
    config_id text,
    fulfillment_fulfillment_option text,
    fulfillment_pickup_by text,
    fulfillment_pickup_date_time text,
    fulfillment_ship_method text,
    fulfillment_shipping_programtype text,
    fulfillment_store_id text,
    intent_to_cancel text,
    item_condition text,
    item_image_url text,
    item_product_name text,
    item_weight_unit text,
    item_weight_value text,
    line_number text,
    orderlinequantity_amount text,
    orderlinequantity_unitof_measurement text,
    reference_line_id text,
    refund_comment text,
    refund_id text,
    seller_order_id text,
    serial_number text,
    status_date text,
    PRIMARY KEY ("index", purchase_order_id),
    FOREIGN KEY (purchase_order_id) REFERENCES orders(purchase_order_id),
    FOREIGN KEY (item_sku) REFERENCES item(sku),
    FOREIGN KEY (return_order_id) REFERENCES "return"(id)
);

CREATE TABLE order_pickup_person (
    "index" text,
    purchase_order_id text,
    name_complete_name text,
    name_empty text,
    name_first_name text,
    name_general_suffix text,
    name_last_name text,
    name_maturity_suffix text,
    name_middle_name text,
    name_title_of_respect text,
    phone_area_code text,
    phone_complete_number text,
    phone_country_code text,
    phone_extension text,
    phone_id text,
    phone_subscriber_number text,
    phone_type text,
    phone_validity_validated_by text,
    phone_validity_validated_date text,
    phone_validity_validation_status text,
    phone_validity_validation_type text,
    PRIMARY KEY ("index", purchase_order_id),
    FOREIGN KEY (purchase_order_id) REFERENCES orders(purchase_order_id)
);

CREATE TABLE order_line_refund_charge (
    "index" text,
    order_line_index text,
    purchase_order_id text,
    charge_amount text,
    charge_amount_currency text,
    charge_name text,
    charge_type text,
    refund_reason text,
    tax_amount text,
    tax_name text,
    taxamount_currency text,
    PRIMARY KEY ("index", order_line_index, purchase_order_id),
    FOREIGN KEY (order_line_index) REFERENCES order_line("index"),
    FOREIGN KEY (purchase_order_id) REFERENCES order_line(purchase_order_id)
);

CREATE TABLE order_line_charge (
    "index" text,
    order_line_index text,
    purchase_order_id text,
    charge_amount text,
    charge_amount_currency text,
    charge_name text,
    charge_type text,
    tax_amount text,
    tax_name text,
    taxamount_currency text,
    PRIMARY KEY ("index", order_line_index, purchase_order_id),
    FOREIGN KEY (order_line_index) REFERENCES order_line("index"),
    FOREIGN KEY (purchase_order_id) REFERENCES order_line(purchase_order_id)
);

CREATE TABLE label_detail_box_item (
    sku text,
    purchase_order_id text,
    line_number text,
    quantity text,
    PRIMARY KEY (sku, purchase_order_id),
    FOREIGN KEY (purchase_order_id) REFERENCES label_detail_by_purchase_order(purchase_order_id)
);

CREATE TABLE label_detail_add_on (
    "index" text,
    purchase_order_id text,
    charge_amount text,
    charge_currency text,
    declared_amount text,
    declared_currency text,
    "name" text,
    ref_link text,
    "status" text,
    PRIMARY KEY ("index", purchase_order_id),
    FOREIGN KEY (purchase_order_id) REFERENCES label_detail_by_purchase_order(purchase_order_id)
);

CREATE TABLE label_detail_by_purchase_order (
    purchase_order_id text,
    carrier_full_name text,
    carrier_name text,
    carrier_service_type text,
    tracking_no text,
    tracking_url text,
    PRIMARY KEY (purchase_order_id),
    FOREIGN KEY (purchase_order_id) REFERENCES orders(purchase_order_id)
);

CREATE TABLE item_unpublished_reason (
    "index" text,
    sku text,
    unpublished_reason text,
    PRIMARY KEY ("index", sku),
    FOREIGN KEY (sku) REFERENCES item(sku)
);

CREATE TABLE item_additional_attribute_value (
    "index" text,
    item_additional_attribute_index text,
    sku text,
    groups text,
    is_variant text,
    rank text,
    "source" text,
    "value" text,
    PRIMARY KEY ("index", item_additional_attribute_index, sku),
    FOREIGN KEY (item_additional_attribute_index) REFERENCES item_additional_attribute("index"),
    FOREIGN KEY (sku) REFERENCES item_additional_attribute(sku)
);

CREATE TABLE item_additional_attribute (
    "index" text,
    sku text,
    is_variant text,
    "name" text,
    "type" text,
    variant_resource_type text,
    PRIMARY KEY ("index", sku),
    FOREIGN KEY (sku) REFERENCES item(sku)
);

CREATE TABLE item (
    sku text,
    "condition" text,
    gtin text,
    lifecycle_status text,
    mart text,
    price_amount text,
    price_currency text,
    product_name text,
    product_type text,
    published_status text,
    shelf text,
    upc text,
    variant_group_id text,
    variant_group_info_grouping_attributes_name text,
    variant_group_info_grouping_attributes_value text,
    variant_group_info_is_primary text,
    variant_group_info_primary text,
    wpid text,
    PRIMARY KEY (sku)
);

CREATE TABLE shipment_package (
    "index" text,
    carrier_rate_quote_quote_id text,
    assessorial_charge text,
    billing_weight text,
    height text,
    label_information_ep_tracker_id text,
    label_information_label_data text,
    label_information_label_format text,
    label_information_master text,
    label_information_master_tracking_code text,
    label_information_package_asn text,
    label_information_reference_tracking_code text,
    label_information_shipment_id text,
    label_information_tracking_code text,
    length text,
    length_uom text,
    net_charge text,
    no_of_package text,
    nominal_charge text,
    package_sequence_number text,
    package_type text,
    service_charge text,
    stackable text,
    weight text,
    weight_uom text,
    width text,
    PRIMARY KEY ("index", carrier_rate_quote_quote_id),
    FOREIGN KEY (carrier_rate_quote_quote_id) REFERENCES carrier_rate_quote(quote_id)
);

CREATE TABLE carrier_rate_quote (
    quote_id text,
    shipment_id text,
    carrier_id text,
    carrier_name text,
    destination_location_address_address_line_1 text,
    destination_location_address_address_line_2 text,
    destination_location_address_city text,
    destination_location_address_country_code text,
    destination_location_address_phone text,
    destination_location_address_postal_code text,
    destination_location_address_state_code text,
    destination_location_location_id text,
    destination_location_location_name text,
    origin_location_address_address_line_1 text,
    origin_location_address_address_line_2 text,
    origin_location_address_city text,
    origin_location_address_country_code text,
    origin_location_address_phone text,
    origin_location_address_postal_code text,
    origin_location_address_state_code text,
    origin_location_location_id text,
    origin_location_location_name text,
    quote_creation_date text,
    rate_quote_assessorial_charge text,
    rate_quote_currency text,
    rate_quote_declared_value text,
    rate_quote_discount_charge text,
    rate_quote_effective_date text,
    rate_quote_equipment_type_code text,
    rate_quote_estimated_delivery_date_time text,
    rate_quote_expiry_date text,
    rate_quote_freight_charge text,
    rate_quote_freight_ready_date text,
    rate_quote_fuel_charge text,
    rate_quote_minimum_charge text,
    rate_quote_mixed_sku text,
    rate_quote_mode text,
    rate_quote_net_charge text,
    rate_quote_nominal_charge text,
    rate_quote_number_of_pallet text,
    rate_quote_seller_freight_classcode text,
    rate_quote_service_charge text,
    rate_quote_service_code text,
    rate_quote_single_sku text,
    rate_quote_status text,
    rate_quote_sur_charge_type text,
    rate_quote_sur_charge_value text,
    rate_quote_total_billing_weight text,
    rate_quote_total_volume text,
    rate_quote_total_weight text,
    rate_quote_transit_day text,
    return_location_address_address_line_1 text,
    return_location_address_address_line_2 text,
    return_location_address_city text,
    return_location_address_country_code text,
    return_location_address_phone text,
    return_location_address_postal_code text,
    return_location_address_state_code text,
    return_location_location_name text,
    PRIMARY KEY (quote_id),
    FOREIGN KEY (shipment_id) REFERENCES shipment(id)
);

CREATE TABLE shipping_configuration_category (
    "index" text,
    shipping_configuration_fivetran_id text,
    shipping_detail_index text,
    fulfillment_lag_time text,
    "name" text,
    PRIMARY KEY ("index", shipping_configuration_fivetran_id, shipping_detail_index),
    FOREIGN KEY (shipping_configuration_fivetran_id) REFERENCES shipping_configuration_detail(shipping_configuration_fivetran_id),
    FOREIGN KEY (shipping_detail_index) REFERENCES shipping_configuration_detail("index")
);

CREATE TABLE shipping_configuration_detail (
    "index" text,
    shipping_configuration_fivetran_id text,
    configuration_name text,
    PRIMARY KEY ("index", shipping_configuration_fivetran_id),
    FOREIGN KEY (shipping_configuration_fivetran_id) REFERENCES shipping_configuration(_fivetran_id)
);

CREATE TABLE shipping_configuration (
    _fivetran_id text,
    partner_id text,
    business_reg_number text,
    country_of_incorporation text,
    partner_display_name text,
    partner_name text,
    partner_store_id text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (partner_id) REFERENCES partner_configuration_detail(partner_id)
);

CREATE TABLE lag_time (
    _fivetran_id text,
    sku text,
    fulfillment_lag_time text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (sku) REFERENCES item(sku)
);

CREATE TABLE simulation_result (
    _fivetran_id text,
    rule_id text,
    rule_status text,
    simulation_count text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (rule_id) REFERENCES rule(id)
);

CREATE TABLE inbound_shipment_error (
    "index" text,
    inbound_order_id text,
    category text,
    code text,
    description text,
    field text,
    info text,
    severity text,
    PRIMARY KEY ("index", inbound_order_id),
    FOREIGN KEY (inbound_order_id) REFERENCES inbound_shipment_error_payload(inbound_order_id)
);

CREATE TABLE add_on_service (
    "index" text,
    inbound_order_id text,
    product_id text,
    add_on_service text,
    PRIMARY KEY ("index", inbound_order_id, product_id),
    FOREIGN KEY (inbound_order_id) REFERENCES inbound_shipment_order_item(inbound_order_id),
    FOREIGN KEY (product_id) REFERENCES inbound_shipment_order_item(product_id)
);

CREATE TABLE dimension (
    dimension text,
    inbound_order_id text,
    PRIMARY KEY (dimension, inbound_order_id),
    FOREIGN KEY (inbound_order_id) REFERENCES inbound_shipment_order_item(inbound_order_id)
);

CREATE TABLE inbound_shipment_order_item (
    product_id text,
    inbound_order_id text,
    expected_delivery_date text,
    inner_pack_quantity text,
    item_desc text,
    item_nbr text,
    item_quantity text,
    non_sort_item text,
    product_type text,
    ship_node text,
    sku text,
    vendor_pack_quantity text,
    PRIMARY KEY (product_id, inbound_order_id),
    FOREIGN KEY (inbound_order_id) REFERENCES inbound_shipment_error_payload(inbound_order_id)
);

CREATE TABLE inbound_shipment_error_payload (
    inbound_order_id text,
    created_date text,
    return_address_address_line_1 text,
    return_address_address_line_2 text,
    return_address_city text,
    return_address_country_code text,
    return_address_postal_code text,
    return_address_state_code text,
    PRIMARY KEY (inbound_order_id),
    FOREIGN KEY (inbound_order_id) REFERENCES inbound_shipment_item(inbound_order_id)
);

CREATE TABLE quality_issue_product_type (
    "index" text,
    category text,
    offer_count text,
    product_type_name text,
    PRIMARY KEY ("index", category),
    FOREIGN KEY (category) REFERENCES item_count_listing_quality_issue(category)
);

CREATE TABLE item_count_listing_quality_issue (
    category text,
    "name" text,
    offer_count text,
    PRIMARY KEY (category)
);

CREATE TABLE third_party_fulfillment_provider (
    ship_node text,
    ship_node_name text,
    PRIMARY KEY (ship_node),
    FOREIGN KEY (ship_node) REFERENCES fulfillment_center(ship_node)
);

CREATE TABLE price_incentive (
    incentive_status text,
    sku_id text,
    base_referral_fee text,
    current_price text,
    enrollment_date text,
    enrollment_type text,
    expiration_date text,
    incentive_id text,
    incentive_type text,
    inventory_count text,
    item_id text,
    offer_id text,
    product_image_url text,
    product_name text,
    product_url text,
    reduced_referral_fee text,
    shipping_price text,
    start_date text,
    target_price text,
    PRIMARY KEY (incentive_status, sku_id),
    FOREIGN KEY (sku_id) REFERENCES item(sku)
);

CREATE TABLE coverage_area (
    coverage_area text,
    ship_node text,
    PRIMARY KEY (coverage_area, ship_node),
    FOREIGN KEY (ship_node) REFERENCES fulfillment_center_coverage(ship_node)
);

CREATE TABLE fulfillment_center_coverage (
    ship_node text,
    shipnode_name text,
    PRIMARY KEY (ship_node),
    FOREIGN KEY (ship_node) REFERENCES fulfillment_center(ship_node)
);

CREATE TABLE top_trending_item (
    item_id text,
    taxanomy_department_department_id text,
    brand text,
    category_name text,
    department_name text,
    exists_for_seller text,
    is_two_day_eligible text,
    isbn text,
    issn text,
    product_name text,
    rank text,
    sub_category_name text,
    super_department_name text,
    total_offer text,
    PRIMARY KEY (item_id),
    FOREIGN KEY (taxanomy_department_department_id) REFERENCES taxanomy_department(department_id)
);

CREATE TABLE return_line (
    "index" text,
    customer_order_id text,
    return_id text,
    return_line_group_index text,
    return_order_line_number text,
    PRIMARY KEY ("index", customer_order_id, return_id, return_line_group_index),
    FOREIGN KEY (customer_order_id) REFERENCES return_line_group(customer_order_id),
    FOREIGN KEY (return_id) REFERENCES return_line_group(return_id),
    FOREIGN KEY (return_line_group_index) REFERENCES return_line_group("index")
);

CREATE TABLE return_line_group_carrier_info_list (
    carrier_id text,
    customer_order_id text,
    return_id text,
    return_line_group_index text,
    return_line_label_index text,
    carrier_name text,
    service_type text,
    tracking_no text,
    PRIMARY KEY (carrier_id, customer_order_id, return_id, return_line_group_index, return_line_label_index),
    FOREIGN KEY (customer_order_id) REFERENCES return_line_label(customer_order_id),
    FOREIGN KEY (return_id) REFERENCES return_line_label(return_id),
    FOREIGN KEY (return_line_group_index) REFERENCES return_line_label(return_line_group_index),
    FOREIGN KEY (return_line_label_index) REFERENCES return_line_label("index")
);

CREATE TABLE return_line_label (
    "index" text,
    customer_order_id text,
    return_id text,
    return_line_group_index text,
    label_image_url text,
    PRIMARY KEY ("index", customer_order_id, return_id, return_line_group_index),
    FOREIGN KEY (customer_order_id) REFERENCES return_line_group(customer_order_id),
    FOREIGN KEY (return_id) REFERENCES return_line_group(return_id),
    FOREIGN KEY (return_line_group_index) REFERENCES return_line_group("index")
);

CREATE TABLE return_line_group (
    "index" text,
    customer_order_id text,
    return_id text,
    group_no text,
    return_expected_flag text,
    PRIMARY KEY ("index", customer_order_id, return_id),
    FOREIGN KEY (customer_order_id) REFERENCES "return"(customer_order_id),
    FOREIGN KEY (return_id) REFERENCES "return"(id)
);

CREATE TABLE return_order_line_charge_tax (
    "index" text,
    return_id text,
    return_order_line_charge_index text,
    return_order_line_index text,
    excess_tax_currency_amount text,
    excess_tax_currency_unit text,
    tax_name text,
    tax_per_unit_currency_amount text,
    tax_per_unit_currency_unit text,
    PRIMARY KEY ("index", return_id, return_order_line_charge_index, return_order_line_index),
    FOREIGN KEY (return_id) REFERENCES return_order_line_charge(return_id),
    FOREIGN KEY (return_order_line_charge_index) REFERENCES return_order_line_charge("index"),
    FOREIGN KEY (return_order_line_index) REFERENCES return_order_line_charge(return_order_line_index)
);

CREATE TABLE return_order_line_charge_reference (
    "index" text,
    return_id text,
    return_order_line_charge_index text,
    return_order_line_index text,
    "name" text,
    "value" text,
    PRIMARY KEY ("index", return_id, return_order_line_charge_index, return_order_line_index),
    FOREIGN KEY (return_id) REFERENCES return_order_line_charge(return_id),
    FOREIGN KEY (return_order_line_charge_index) REFERENCES return_order_line_charge("index"),
    FOREIGN KEY (return_order_line_index) REFERENCES return_order_line_charge(return_order_line_index)
);

CREATE TABLE return_order_line_charge (
    "index" text,
    return_id text,
    return_order_line_index text,
    charge_category text,
    charge_name text,
    chargeperunit_currency_amount text,
    chargeperunit_currency_unit text,
    excess_charge_currency_amount text,
    excess_charge_currency_unit text,
    is_billable text,
    is_discount text,
    PRIMARY KEY ("index", return_id, return_order_line_index),
    FOREIGN KEY (return_id) REFERENCES return_order_line(return_id),
    FOREIGN KEY (return_order_line_index) REFERENCES return_order_line("index")
);

CREATE TABLE return_order_line_charge_total (
    "index" text,
    return_id text,
    return_order_line_index text,
    currency_amount text,
    currency_unit text,
    "name" text,
    PRIMARY KEY ("index", return_id, return_order_line_index),
    FOREIGN KEY (return_id) REFERENCES return_order_line(return_id),
    FOREIGN KEY (return_order_line_index) REFERENCES return_order_line("index")
);

CREATE TABLE return_order_line_refund_channel (
    "index" text,
    return_id text,
    return_order_line_index text,
    quantity_measurement_value text,
    refund_channel_name text,
    PRIMARY KEY ("index", return_id, return_order_line_index),
    FOREIGN KEY (return_id) REFERENCES return_order_line(return_id),
    FOREIGN KEY (return_order_line_index) REFERENCES return_order_line("index")
);

CREATE TABLE return_order_line_tracking_reference (
    "index" text,
    return_id text,
    return_order_line_index text,
    return_order_line_tracking_detail_index text,
    "name" text,
    "value" text,
    PRIMARY KEY ("index", return_id, return_order_line_index, return_order_line_tracking_detail_index),
    FOREIGN KEY (return_id) REFERENCES return_order_line_tracking_detail(return_id),
    FOREIGN KEY (return_order_line_index) REFERENCES return_order_line_tracking_detail(return_order_line_index),
    FOREIGN KEY (return_order_line_tracking_detail_index) REFERENCES return_order_line_tracking_detail("index")
);

CREATE TABLE return_order_line_tracking_detail (
    "index" text,
    return_id text,
    return_order_line_index text,
    event_description text,
    event_tag text,
    event_time text,
    sequence_no text,
    PRIMARY KEY ("index", return_id, return_order_line_index),
    FOREIGN KEY (return_id) REFERENCES return_order_line(return_id),
    FOREIGN KEY (return_order_line_index) REFERENCES return_order_line("index")
);

CREATE TABLE return_order_line_current_tracking_status (
    "index" text,
    return_id text,
    return_order_line_index text,
    current_refund_status text,
    quantity_measurement_value text,
    quantity_unit_of_measure text,
    "status" text,
    status_time text,
    PRIMARY KEY ("index", return_id, return_order_line_index),
    FOREIGN KEY (return_id) REFERENCES return_order_line(return_id),
    FOREIGN KEY (return_order_line_index) REFERENCES return_order_line("index")
);

CREATE TABLE return_order_line (
    "index" text,
    return_id text,
    purchase_order_id text,
    seller_order_id text,
    cancellable_qty text,
    current_delivery_status text,
    current_refund_status text,
    exception_item_type text,
    is_fast_replacement text,
    is_keep_it text,
    is_return_for_exception text,
    item_condition text,
    item_product_name text,
    item_sku text,
    item_weight_measurement_value text,
    item_weight_unit_of_measure text,
    last_item text,
    purchase_order_line_number text,
    quantity_measurement_value text,
    quantity_unit_of_measure text,
    recharge_reason text,
    rechargeable_qty text,
    refund_channel text,
    refunded_qty text,
    return_cancellation_reason text,
    return_expected_flag text,
    return_order_line_number text,
    return_reason text,
    sales_order_line_number text,
    "status" text,
    status_time text,
    unit_price_currency_amount text,
    unit_price_currency_unit text,
    PRIMARY KEY ("index", return_id),
    FOREIGN KEY (return_id) REFERENCES "return"(id),
    FOREIGN KEY (purchase_order_id) REFERENCES orders(purchase_order_id),
    FOREIGN KEY (seller_order_id) REFERENCES order_line(seller_order_id)
);

CREATE TABLE "return" (
    id text,
    customer_order_id text,
    customer_email_id text,
    customer_first_name text,
    customer_last_name text,
    refund_mode text,
    replacement_customer_order_id text,
    return_by_date text,
    return_order_date text,
    returnchannel_name text,
    total_refund_currency_amount text,
    total_refund_currency_unit text,
    PRIMARY KEY (id, customer_order_id),
    FOREIGN KEY (customer_order_id) REFERENCES orders(customer_order_id)
);

CREATE TABLE item_taxonomy_subcategory (
    sub_category_id text,
    item_taxonomy_category_id text,
    sub_category_name text,
    PRIMARY KEY (sub_category_id, item_taxonomy_category_id),
    FOREIGN KEY (item_taxonomy_category_id) REFERENCES item_taxonomy(category_id)
);

CREATE TABLE item_taxonomy (
    category_id text,
    category_name text,
    PRIMARY KEY (category_id)
);

CREATE TABLE partner_throttle_configuration (
    "index" text,
    partner_id text,
    filesize_unitofmeasurement text,
    filesize_value text,
    rate_count text,
    replenish_timewindow_unitofmeasurement text,
    replenish_timewindow_value text,
    "type" text,
    PRIMARY KEY ("index", partner_id),
    FOREIGN KEY (partner_id) REFERENCES partner_configuration_value(partner_id)
);

CREATE TABLE partner_configuration_value (
    "index" text,
    partner_id text,
    feed_type text,
    PRIMARY KEY ("index", partner_id),
    FOREIGN KEY (partner_id) REFERENCES partner_configuration(partner_id)
);

CREATE TABLE partner_configuration (
    "index" text,
    partner_id text,
    configuration_name text,
    configuration_status text,
    PRIMARY KEY ("index", partner_id),
    FOREIGN KEY (partner_id) REFERENCES partner_configuration_detail(partner_id)
);

CREATE TABLE partner_configuration_detail (
    partner_id text,
    business_regnumber text,
    country_of_incorporation text,
    partner_display_name text,
    partner_name text,
    partner_store_id text,
    PRIMARY KEY (partner_id)
);

CREATE TABLE shipment_tracking_no (
    tracking_no text,
    shipment_id text,
    PRIMARY KEY (tracking_no, shipment_id),
    FOREIGN KEY (shipment_id) REFERENCES shipment(id)
);

CREATE TABLE shipment (
    id text,
    inbound_order_id text,
    carrier_name text,
    created_date text,
    expected_delivery_date text,
    received_unit text,
    return_address_address_line_1 text,
    return_address_address_line_2 text,
    return_address_city text,
    return_address_country_code text,
    return_address_postal_code text,
    return_address_state_code text,
    ship_to_address_address_line_1 text,
    ship_to_address_city text,
    ship_to_address_country_code text,
    ship_to_address_fc_name text,
    ship_to_address_postal_code text,
    ship_to_address_state_code text,
    shipment_unit text,
    "status" text,
    updated_expected_delivery_date text,
    PRIMARY KEY (id, inbound_order_id)
);

CREATE TABLE rule_exception (
    sku_id text,
    PRIMARY KEY (sku_id)
);

CREATE TABLE rule_area_state (
    "index" text,
    region_code text,
    state_subregion_code text,
    state_subregion_name text,
    PRIMARY KEY ("index", region_code),
    FOREIGN KEY (region_code) REFERENCES rule_area(region_code)
);

CREATE TABLE rule_area (
    region_code text,
    region_name text,
    PRIMARY KEY (region_code)
);

CREATE TABLE taxanomy_department_category (
    category_id text,
    taxanomy_dept_id text,
    category_name text,
    PRIMARY KEY (category_id, taxanomy_dept_id),
    FOREIGN KEY (taxanomy_dept_id) REFERENCES taxanomy_department_payload(department_id)
);

CREATE TABLE taxanomy_department_payload (
    department_id text,
    department_name text,
    PRIMARY KEY (department_id),
    FOREIGN KEY (department_id) REFERENCES taxanomy_department(department_id)
);

CREATE TABLE performance_report (
    partner_id text,
    payload_14_day_cancellation_customer_fault text,
    payload_14_day_cancellation_seller_fault text,
    payload_14_day_otd text,
    payload_14_day_ots text,
    payload_14_day_refund_rate_customer_fault text,
    payload_14_day_refund_rate_seller_fault text,
    payload_14_day_vtr text,
    payload_30_day_cancellation_customer_fault text,
    payload_30_day_cancellation_seller_fault text,
    payload_30_day_otd text,
    payload_30_day_ots text,
    payload_30_day_refund_rate_customer_fault text,
    payload_30_day_refund_rate_seller_fault text,
    payload_30_day_vtr text,
    payload_60_day_cancellation_customer_fault text,
    payload_60_day_cancellation_seller_fault text,
    payload_60_day_otd text,
    payload_60_day_ots text,
    payload_60_day_refund_rate_customer_fault text,
    payload_60_day_refund_rate_seller_fault text,
    payload_60_day_vtr text,
    payload_7_day_cancellation_customer_fault text,
    payload_7_day_cancellation_seller_fault text,
    payload_7_day_otd text,
    payload_7_day_ots text,
    payload_7_day_refund_rate_customer_fault text,
    payload_7_day_refund_rate_seller_fault text,
    payload_7_day_vtr text,
    payload_90_day_cancellation_customer_fault text,
    payload_90_day_cancellation_seller_fault text,
    payload_90_day_otd text,
    payload_90_day_ots text,
    payload_90_day_refund_rate_customer_fault text,
    payload_90_day_refund_rate_seller_fault text,
    payload_90_day_vtr text,
    "status" text,
    PRIMARY KEY (partner_id),
    FOREIGN KEY (partner_id) REFERENCES partner_configuration_detail(partner_id)
);

CREATE TABLE repricer_strategy (
    "index" text,
    collection_id text,
    adjustment_type text,
    adjustment_value text,
    strategy_type text,
    PRIMARY KEY ("index", collection_id),
    FOREIGN KEY (collection_id) REFERENCES repricer_strategy_collection(id)
);

CREATE TABLE repricer_strategy_collection (
    id text,
    assigned_count text,
    enable_repricer_for_promotion text,
    enabled text,
    repricer_strategy text,
    PRIMARY KEY (id)
);

CREATE TABLE rule_condition (
    "index" text,
    rule_id text,
    "name" text,
    operator text,
    "value" text,
    PRIMARY KEY ("index", rule_id),
    FOREIGN KEY (rule_id) REFERENCES rule(id)
);

CREATE TABLE rule_action_sub_region (
    "index" text,
    rule_action_index text,
    sub_region_code text,
    PRIMARY KEY ("index", rule_action_index),
    FOREIGN KEY (rule_action_index) REFERENCES rule_action("index"),
    FOREIGN KEY (sub_region_code) REFERENCES rule_area_state(state_subregion_code)
);

CREATE TABLE rule_action (
    "index" text,
    rule_id text,
    region_code text,
    PRIMARY KEY ("index", rule_id),
    FOREIGN KEY (rule_id) REFERENCES rule(id),
    FOREIGN KEY (region_code) REFERENCES rule_area(region_code)
);

CREATE TABLE rule (
    id text,
    description text,
    "name" text,
    priority text,
    rule_status text,
    sku_processing_status text,
    PRIMARY KEY (id)
);

CREATE TABLE inventory_node (
    ship_node text,
    inventory_sku text,
    avail_tosell_quantity_amount text,
    avail_tosell_quantity_unit text,
    input_quantity_amount text,
    input_quantity_unit text,
    reserved_quantity_amount text,
    reserved_quantity_unit text,
    PRIMARY KEY (ship_node, inventory_sku),
    FOREIGN KEY (inventory_sku) REFERENCES inventory(sku)
);

CREATE TABLE inventory (
    sku text,
    PRIMARY KEY (sku),
    FOREIGN KEY (sku) REFERENCES item(sku)
);

CREATE TABLE shipping_method_state_sub_region (
    "index" text,
    shipping_template_id text,
    state_sub_region_index text,
    state_subregion_code text,
    state_subregion_name text,
    PRIMARY KEY ("index", shipping_template_id, state_sub_region_index),
    FOREIGN KEY (shipping_template_id) REFERENCES shipping_method_sub_region_state(shipping_template_id),
    FOREIGN KEY (state_sub_region_index) REFERENCES shipping_method_sub_region_state("index")
);

CREATE TABLE shipping_method_sub_region_state (
    "index" text,
    shipping_template_id text,
    sub_region_index text,
    state_code text,
    state_name text,
    PRIMARY KEY ("index", shipping_template_id, sub_region_index),
    FOREIGN KEY (shipping_template_id) REFERENCES shipping_method_sub_region(shipping_template_id),
    FOREIGN KEY (sub_region_index) REFERENCES shipping_method_sub_region("index")
);

CREATE TABLE shipping_method_sub_region (
    "index" text,
    shipping_method_region_index text,
    shipping_template_id text,
    sub_region_code text,
    sub_region_name text,
    PRIMARY KEY ("index", shipping_method_region_index, shipping_template_id),
    FOREIGN KEY (shipping_method_region_index) REFERENCES shipping_method_region("index"),
    FOREIGN KEY (shipping_template_id) REFERENCES shipping_method_region(shipping_template_id)
);

CREATE TABLE shipping_method_region (
    "index" text,
    shiiping_configuration_index text,
    shipping_template_id text,
    region_code text,
    region_name text,
    PRIMARY KEY ("index", shiiping_configuration_index, shipping_template_id),
    FOREIGN KEY (shiiping_configuration_index) REFERENCES shipping_method_configuration("index"),
    FOREIGN KEY (shipping_template_id) REFERENCES shipping_method_configuration(template_id)
);

CREATE TABLE shipping_method_address_type (
    address_type text,
    shipping_configuration_index text,
    template_id text,
    PRIMARY KEY (address_type, shipping_configuration_index, template_id),
    FOREIGN KEY (shipping_configuration_index) REFERENCES shipping_method_configuration("index"),
    FOREIGN KEY (template_id) REFERENCES shipping_method_configuration(template_id)
);

CREATE TABLE shipping_method_tiered_shipping_charge (
    "index" text,
    shipping_configuration_index text,
    template_id text,
    maximum_limit text,
    minimum_limit text,
    shipcharge_amount text,
    shipcharge_currency text,
    PRIMARY KEY ("index", shipping_configuration_index, template_id),
    FOREIGN KEY (shipping_configuration_index) REFERENCES shipping_method_configuration("index"),
    FOREIGN KEY (template_id) REFERENCES shipping_method_configuration(template_id)
);

CREATE TABLE shipping_method_configuration (
    "index" text,
    shipping_method_index text,
    template_id text,
    address_type text,
    per_shipping_charge_charge_per_item_amount text,
    per_shipping_charge_charge_per_item_currency text,
    per_shipping_charge_charge_per_weight_ammount text,
    per_shipping_charge_charge_per_weight_currency text,
    per_shipping_charge_shipping_and_handling_amount text,
    per_shipping_charge_shipping_and_handling_currency text,
    per_shipping_charge_unit_of_measure text,
    transit_time text,
    PRIMARY KEY ("index", shipping_method_index, template_id),
    FOREIGN KEY (shipping_method_index) REFERENCES shipping_method("index"),
    FOREIGN KEY (template_id) REFERENCES shipping_method(template_id)
);

CREATE TABLE shipping_method (
    "index" text,
    template_id text,
    ship_method text,
    "status" text,
    PRIMARY KEY ("index", template_id),
    FOREIGN KEY (template_id) REFERENCES shipping_template(id)
);

CREATE TABLE shipping_template (
    id text,
    created_by text,
    created_date text,
    modified_by text,
    modified_date text,
    "name" text,
    rate_model_type text,
    "status" text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE seller_listing_quality_score (
    _fivetran_id text,
    listing_quality text,
    overall_quality text,
    post_purchase_qualitydefect_ratio text,
    post_purchase_qualityitem_defect_count text,
    score_content_score text,
    score_offer_score text,
    score_rating_review_score text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE recon_report (
    _fivetran_id text,
    available_report_date text,
    amount text,
    amount_type text,
    commission_rule text,
    contract_category text,
    currency text,
    customer_order_line_no text,
    customer_order_no text,
    fulfillment_detail text,
    fulfillment_type text,
    partner_gtin text,
    partner_item_id text,
    partner_item_name text,
    period_end_date text,
    period_start_date text,
    product_tax_code text,
    product_type text,
    purchase_order_line_no text,
    purchase_order_no text,
    ship_quantity text,
    ship_to_city text,
    ship_to_state text,
    ship_to_zipcode text,
    shipping_method text,
    total_payable text,
    transaction_description text,
    transaction_key text,
    transaction_posted_timestamp text,
    transaction_type text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (available_report_date) REFERENCES available_report_date(available_report_date)
);

CREATE TABLE payment_statement_report (
    partner_id text,
    error text,
    payload_closing_balance text,
    payload_hold_amount text,
    payload_hold_dates text,
    payload_last_updated_date text,
    payload_net_payable text,
    payload_opening_balance text,
    payload_order_activity text,
    payload_other_activities text,
    payload_outstanding_mca_balance text,
    payload_paid_to_you text,
    payload_partner_transaction_netpayable text,
    payload_partner_transaction_review text,
    payload_payment_processor text,
    payload_refund_commission_savings text,
    payload_refund_net_comm text,
    payload_refund_net_payable text,
    payload_refund_net_tax_collected text,
    payload_refund_net_tax_withheld text,
    payload_refund_pricing_adjustment text,
    payload_refund_product_price text,
    payload_refund_product_tax_collected text,
    payload_refund_product_tax_withheld text,
    payload_refund_shipping text,
    payload_refund_shipping_tax_collected text,
    payload_refund_shipping_tax_withheld text,
    payload_refund_total_base_commission text,
    payload_refund_total_sf_amt text,
    payload_reserve text,
    payload_reserve_to_date text,
    payload_return_ship_service_charge text,
    payload_sale_aggregate_commission_savings text,
    payload_sale_aggregate_net_comm text,
    payload_sale_aggregate_net_payable text,
    payload_sale_aggregate_net_tax_collected text,
    payload_sale_aggregate_net_tax_withheld text,
    payload_sale_aggregate_netfee_collected text,
    payload_sale_aggregate_pricing_adjustment text,
    payload_sale_aggregate_product_price text,
    payload_sale_aggregate_product_tax_collected text,
    payload_sale_aggregate_product_tax_withheld text,
    payload_sale_aggregate_shipping text,
    payload_sale_aggregate_shipping_tax_collected text,
    payload_sale_aggregate_shipping_tax_withheld text,
    payload_sale_aggregate_total_base_commission text,
    payload_sale_aggregate_total_s_f_amt text,
    payload_scheduled_settlement_date text,
    payload_seller_payment_status text,
    payload_seller_status text,
    payload_seller_store_front_url text,
    payload_settle_cycle text,
    payload_tenure text,
    payload_walmart_fulfillment_services text,
    payload_wfs_fullfillment_fee text,
    payload_wfs_inventory_removalfee text,
    payload_wfs_net_payable text,
    payload_wfs_return_shipping_fee text,
    payload_wfs_storagefee text,
    "status" text,
    status_code text,
    PRIMARY KEY (partner_id),
    FOREIGN KEY (partner_id) REFERENCES partner_configuration_detail(partner_id)
);

CREATE TABLE available_report_date (
    available_report_date text,
    PRIMARY KEY (available_report_date)
);

CREATE TABLE carrier_method (
    id text,
    display_description text,
    method_name text,
    method_type text,
    PRIMARY KEY (id)
);

CREATE TABLE taxanomy_department (
    department_id text,
    taxanomy_super_dept_id text,
    department_name text,
    PRIMARY KEY (department_id, taxanomy_super_dept_id),
    FOREIGN KEY (taxanomy_super_dept_id) REFERENCES taxanomy_super_department(super_department_id)
);

CREATE TABLE taxanomy_super_department (
    super_department_id text,
    super_department text,
    PRIMARY KEY (super_department_id)
);

CREATE TABLE feed_status (
    feed_id text,
    partner_id text,
    batch_id text,
    channel_type text,
    feed_date text,
    feed_source text,
    feed_status text,
    feed_type text,
    file_name text,
    item_data_error_count text,
    item_system_error_count text,
    item_timeout_error_count text,
    items_failed text,
    items_processing text,
    items_received text,
    items_succeeded text,
    modified_dtm text,
    org_id text,
    PRIMARY KEY (feed_id),
    FOREIGN KEY (partner_id) REFERENCES partner_configuration_detail(partner_id)
);

CREATE TABLE promotional_pricing (
    "index" text,
    sku text,
    comparison_price_max_unit_value_amount text,
    comparison_price_max_unit_value_currency text,
    comparison_price_max_unit_value_value text,
    comparison_price_max_value_amount text,
    comparison_price_max_value_currency text,
    comparison_price_max_value_value text,
    comparison_price_min_unit_value_amount text,
    comparison_price_min_unit_value_currency text,
    comparison_price_min_unit_value_value text,
    comparison_price_min_value_amount text,
    comparison_price_min_value_currency text,
    comparison_price_min_value_value text,
    comparison_price_per_unit_value_amount text,
    comparison_price_per_unit_value_currency text,
    comparison_price_per_unit_value_value text,
    comparison_price_type text,
    comparison_price_uom_type text,
    comparison_price_value_amount text,
    comparison_price_value_currency text,
    current_price_max_unit_value_amount text,
    current_price_max_unit_value_currency text,
    current_price_max_unit_value_value text,
    current_price_max_value_amount text,
    current_price_max_value_currency text,
    current_price_max_value_value text,
    current_price_min_unit_value_amount text,
    current_price_min_unit_value_currency text,
    current_price_min_unit_value_value text,
    current_price_min_value_amount text,
    current_price_min_value_currency text,
    current_price_min_value_value text,
    current_price_per_unit_value_amount text,
    current_price_per_unit_value_currency text,
    current_price_per_unit_value_value text,
    current_price_type text,
    current_price_uom_type text,
    current_price_value_amount text,
    current_price_value_currency text,
    effective_date text,
    expiration_date text,
    pickup_discount_is_pickup_discount_eligible text,
    pickup_discount_pickup_discount_amount text,
    pickup_discount_pickup_discount_currency text,
    pickup_discount_pickup_discount_value text,
    pid text,
    price_display_codes_hide_price_for_soi text,
    price_display_codes_is_clearance text,
    price_display_codes_is_eligible_for_associate_discount text,
    price_display_codes_is_reduced_price text,
    price_display_codes_is_rollback text,
    price_display_codes_is_strikethrough text,
    price_display_codes_submap_type text,
    process_mode text,
    promo_id text,
    savings_amount text,
    savings_percent text,
    PRIMARY KEY ("index", sku),
    FOREIGN KEY (sku) REFERENCES promotional_price(sku)
);

CREATE TABLE promotional_price_additional_attribute (
    "index" text,
    sku text,
    "name" text,
    "value" text,
    PRIMARY KEY ("index", sku),
    FOREIGN KEY (sku) REFERENCES promotional_price(sku)
);

CREATE TABLE promotional_price (
    sku text,
    item_id text,
    max_sales_retail_price_amount text,
    max_sales_retail_price_currency text,
    max_sales_retail_price_value text,
    min_advt_price text,
    min_advt_price_amount text,
    min_advt_price_currency text,
    min_advt_price_value text,
    offer_id text,
    pricing_list_replace_all text,
    product_type text,
    rebate_end_date text,
    rebate_info_url text,
    rebate_rebate_amount text,
    rebate_rebate_currency text,
    rebate_rebate_type text,
    rebate_rebate_value text,
    rebate_start_date text,
    wpid text,
    PRIMARY KEY (sku),
    FOREIGN KEY (sku) REFERENCES item(sku)
);
