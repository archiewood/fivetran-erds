CREATE TABLE feed (
    feed_id text,
    created_time timestamp,
    feed_type text,
    processing_end_time timestamp,
    processing_start_time timestamp,
    processing_status text,
    result_feed_document_id text,
    PRIMARY KEY (feed_id)
);

CREATE TABLE order_item (
    order_item_id text,
    amazon_order_id text,
    asin text,
    buyer_requested_cancel_buyer_cancel_reason text,
    buyer_requested_cancel_is_buyer_requested_cancel boolean,
    condition_id text,
    condition_note text,
    condition_subtype_id text,
    deemed_reseller_category text,
    ioss_number text,
    is_gift boolean,
    is_transparency boolean,
    item_approval_context_approval_status text,
    item_approval_context_approval_type text,
    item_price_amount text,
    item_price_currency_code text,
    item_tax_amount text,
    item_tax_currency_code text,
    points_granted_monetary_amount text,
    points_granted_monetary_currency_code text,
    points_granted_points_number bigint,
    price_designation text,
    product_info_detail_number_of_items bigint,
    promotion_discount_amount text,
    promotion_discount_currency_code text,
    promotion_discount_tax_amount text,
    promotion_discount_tax_currency_code text,
    quantity_ordered bigint,
    quantity_shipped bigint,
    scheduled_delivery_end_date text,
    scheduled_delivery_start_date text,
    seller_sku text,
    serial_number_required boolean,
    shipping_discount_amount text,
    shipping_discount_currency_code text,
    shipping_discount_tax_amount text,
    shipping_discount_tax_currency_code text,
    shipping_price_amount text,
    shipping_price_currency_code text,
    shipping_tax_amount text,
    shipping_tax_currency_code text,
    store_chain_store_id text,
    tax_collection_model text,
    tax_collection_responsible_party text,
    title text,
    PRIMARY KEY (order_item_id, amazon_order_id),
    FOREIGN KEY (amazon_order_id) REFERENCES orders(amazon_order_id)
);

CREATE TABLE financial_failed_adhoc_disbursement_event (
    _fivetran_id text,
    financial_event_group_id text,
    disbursement_id text,
    funds_transfers_type text,
    payment_disbursement_type text,
    posted_date timestamp,
    "status" text,
    transfer_amount_currency_amount double precision,
    transfer_amount_currency_code text,
    transfer_id text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (financial_event_group_id) REFERENCES financial_event_group(financial_event_group_id)
);

CREATE TABLE outbound_seller_feature (
    feature_name text,
    feature_description text,
    seller_eligible boolean,
    PRIMARY KEY (feature_name)
);

CREATE TABLE item_offer_count_type (
    "type" text,
    asin text,
    "condition" text,
    fullfillment_channel text,
    offer_count bigint,
    PRIMARY KEY ("type", asin),
    FOREIGN KEY (asin) REFERENCES catalog(asin)
);

CREATE TABLE item_image (
    link text,
    variant text,
    asin text,
    marketplace_id text,
    height bigint,
    width bigint,
    PRIMARY KEY (link, variant, asin, marketplace_id),
    FOREIGN KEY (asin) REFERENCES catalog(asin),
    FOREIGN KEY (marketplace_id) REFERENCES catalog(asin)
);

CREATE TABLE easyship_package_item_serial_number (
    order_item_serial_number text,
    order_item_id text,
    package_id text,
    PRIMARY KEY (order_item_serial_number, order_item_id, package_id),
    FOREIGN KEY (order_item_id) REFERENCES order_item(order_item_id),
    FOREIGN KEY (package_id) REFERENCES easyship_package(amazon_order_id)
);

CREATE TABLE fulfillment_order (
    seller_fulfillment_order_id text,
    cod_charge_currency_code text,
    cod_charge_taxcurrency_code text,
    cod_charge_taxvalue text,
    cod_charge_value text,
    delivery_window_end_date timestamp,
    delivery_window_start_date timestamp,
    displayable_order_comment text,
    displayable_order_date timestamp,
    displayable_order_id text,
    fulfillment_action text,
    fulfillment_order_status text,
    fulfillment_policy text,
    is_cod_required boolean,
    marketplace_id text,
    received_date timestamp,
    shipping_charge_currency_code text,
    shipping_charge_taxcurrency_code text,
    shipping_charge_taxvalue text,
    shipping_charge_value text,
    shipping_speed_category text,
    status_updated_date timestamp,
    -- address_* (dynamic column),
    PRIMARY KEY (seller_fulfillment_order_id)
);

CREATE TABLE available_shipping_service_option (
    carrier_will_pick_up_option text,
    shipment_id text,
    charge_amount double precision,
    charge_currency_code text,
    shipping_service_id text,
    PRIMARY KEY (carrier_will_pick_up_option, shipment_id),
    FOREIGN KEY (shipment_id) REFERENCES merchant_fulfillment_shipment(id)
);

CREATE TABLE partnered_small_parcel_package_output (
    "index" integer,
    shipment_id text,
    carrier_name text,
    package_status text,
    tracking_id text,
    weight_unit text,
    weight_value double precision,
    -- dimensions_* (dynamic column),
    PRIMARY KEY ("index", shipment_id),
    FOREIGN KEY (shipment_id) REFERENCES transport_content(shipment_id)
);

CREATE TABLE financial_shipment_event_item_promotion (
    "index" integer,
    "type" text,
    financial_shipment_event_item_id text,
    amount_currency_amount double precision,
    amount_currency_code text,
    id text,
    promotion_kind text,
    PRIMARY KEY ("index", "type", financial_shipment_event_item_id),
    FOREIGN KEY (financial_shipment_event_item_id) REFERENCES financial_shipment_event_item(_fivetran_id)
);

CREATE TABLE financial_imaging_services_fee_event (
    _fivetran_id text,
    financial_event_group_id text,
    asin text,
    imaging_request_billing_item_id text,
    posted_date timestamp,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (financial_event_group_id) REFERENCES financial_event_group(financial_event_group_id)
);

CREATE TABLE fulfillment_order_feature_settings (
    feature_name text,
    seller_fulfillment_order_id text,
    feature_fulfillment_policy text,
    PRIMARY KEY (feature_name, seller_fulfillment_order_id),
    FOREIGN KEY (seller_fulfillment_order_id) REFERENCES fulfillment_order(seller_fulfillment_order_id)
);

CREATE TABLE item_fulfillment_availability (
    fulfillment_channel_code text,
    sku text,
    quantity bigint,
    PRIMARY KEY (fulfillment_channel_code, sku),
    FOREIGN KEY (sku) REFERENCES listed_item(sku)
);

CREATE TABLE container_packed_item (
    "index" bigint,
    container_sequence_number text,
    container_type text,
    transaction_date text,
    vendor_shipment_identifier text,
    buyer_product_identifier text,
    item_sequence_number text,
    packed_item_details_expiry_duration_duration_unit text,
    packed_item_details_expiry_duration_duration_value text,
    packed_item_details_expiry_expiry_date text,
    packed_item_details_expiry_manufacture_date text,
    packed_item_details_lot_number text,
    packed_item_details_purchase_order_number text,
    packed_quantity_amount bigint,
    packed_quantity_unit_of_measure text,
    packed_quantity_unit_size bigint,
    vendor_product_identifier text,
    PRIMARY KEY ("index", container_sequence_number, container_type, transaction_date, vendor_shipment_identifier),
    FOREIGN KEY (container_sequence_number) REFERENCES vendor_retail_procurement_container(container_sequence_number),
    FOREIGN KEY (container_type) REFERENCES vendor_retail_procurement_container(container_sequence_number),
    FOREIGN KEY (transaction_date) REFERENCES vendor_retail_procurement_container(container_sequence_number),
    FOREIGN KEY (vendor_shipment_identifier) REFERENCES vendor_retail_procurement_container(container_sequence_number)
);

CREATE TABLE vendor_direct_fulfillment_customer_invoice (
    purchase_order_number text,
    content text,
    PRIMARY KEY (purchase_order_number),
    FOREIGN KEY (purchase_order_number) REFERENCES vendor_direct_fulfillment_order(purchase_order_number)
);

CREATE TABLE vendor_retail_procurement_order_item_status (
    item_sequence_number text,
    purchase_order_number text,
    accepted_quantity_amount bigint,
    accepted_quantity_unit_of_measure text,
    accepted_quantity_unit_size bigint,
    buyer_product_identifier text,
    confirmation_status text,
    last_receive_date timestamp,
    list_price_amount double precision,
    list_price_currency_code text,
    net_cost_amount double precision,
    net_cost_currency_code text,
    ordered_quantity_amount bigint,
    ordered_quantity_unit_of_measure text,
    ordered_quantity_unit_size bigint,
    receive_status text,
    received_quantity_amount bigint,
    received_quantity_unit_of_measure text,
    received_quantity_unit_size bigint,
    rejected_quantity_amount bigint,
    rejected_quantity_unit_of_measure text,
    rejected_quantity_unit_size bigint,
    PRIMARY KEY (item_sequence_number, purchase_order_number),
    FOREIGN KEY (purchase_order_number) REFERENCES vendor_retail_procurement_order_status(purchase_order_number)
);

CREATE TABLE inbound_shipment_item (
    shipment_id text,
    fulfillment_network_sku text,
    quantity_in_case bigint,
    quantity_received bigint,
    quantity_shipped bigint,
    release_date text,
    seller_sku text,
    PRIMARY KEY (shipment_id),
    FOREIGN KEY (shipment_id) REFERENCES inbound_shipment_info(shipment_id)
);

CREATE TABLE transport_content (
    shipment_id text,
    error_code text,
    error_description text,
    is_partnered boolean,
    seller_id text,
    shipment_type text,
    transport_status text,
    PRIMARY KEY (shipment_id),
    FOREIGN KEY (shipment_id) REFERENCES inbound_shipment_info(shipment_id)
);

CREATE TABLE preorder_info_result (
    shipment_id text,
    confirmed_fulfillable_date text,
    need_by_date text,
    shipment_confirmed_for_preorder boolean,
    shipment_contains_preorderable_items boolean,
    PRIMARY KEY (shipment_id),
    FOREIGN KEY (shipment_id) REFERENCES inbound_shipment_info(shipment_id)
);

CREATE TABLE ordered_quantity_details (
    "index" bigint,
    item_sequence_number text,
    purchase_order_number text,
    cancelled_amount bigint,
    cancelled_unit_of_measure text,
    cancelled_unit_size bigint,
    ordered_amount bigint,
    ordered_unit_of_measure text,
    ordered_unit_size bigint,
    updated_date timestamp,
    PRIMARY KEY ("index", item_sequence_number, purchase_order_number),
    FOREIGN KEY (item_sequence_number) REFERENCES vendor_retail_procurement_order_item(item_sequence_number),
    FOREIGN KEY (purchase_order_number) REFERENCES vendor_retail_procurement_order_item(item_sequence_number)
);

CREATE TABLE partnered_ltl_data_output_pallet (
    "index" integer,
    shipment_id text,
    is_stacked boolean,
    weight_unit text,
    weight_value double precision,
    -- dimension_* (dynamic column),
    PRIMARY KEY ("index", shipment_id),
    FOREIGN KEY (shipment_id) REFERENCES partnered_ltl_data_output_pallet(shipment_id)
);

CREATE TABLE label_format_option (
    label_format text,
    shipment_id text,
    include_packing_slip_with_label boolean,
    shipping_service_id text,
    PRIMARY KEY (label_format, shipment_id),
    FOREIGN KEY (shipment_id) REFERENCES merchant_fulfillment_shipment(id)
);

CREATE TABLE easyship_package_item (
    order_item_id text,
    package_id text,
    PRIMARY KEY (order_item_id, package_id),
    FOREIGN KEY (order_item_id) REFERENCES order_item(order_item_id),
    FOREIGN KEY (package_id) REFERENCES easyship_package(amazon_order_id)
);

CREATE TABLE financial_shipment_event_item (
    _fivetran_id text,
    financial_shipment_event_id text,
    cost_of_points_granted_currency_amount double precision,
    cost_of_points_granted_currency_code text,
    cost_of_points_returned_currency_amount double precision,
    cost_of_points_returned_currency_code text,
    "index" integer,
    item_kind text,
    order_adjustment_item_id text,
    order_item_id text,
    quantity_shipped bigint,
    seller_sku text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (financial_shipment_event_id) REFERENCES financial_shipment_event(_fivetran_id)
);

CREATE TABLE listed_item_issue (
    code text,
    sku text,
    attribute_names jsonb,
    message text,
    severity text,
    PRIMARY KEY (code, sku),
    FOREIGN KEY (sku) REFERENCES listed_item(sku)
);

CREATE TABLE fba_inventory_researching_quantity_entry (
    "name" text,
    inventory_summary_id text,
    granularity_id text,
    granularity_type text,
    quantity integer,
    PRIMARY KEY ("name", inventory_summary_id),
    FOREIGN KEY (inventory_summary_id) REFERENCES fba_inventory_summary(_fivetran_id)
);

CREATE TABLE regulated_information_field (
    id text,
    amazon_order_id text,
    field_label text,
    field_type text,
    field_value text,
    PRIMARY KEY (id, amazon_order_id),
    FOREIGN KEY (amazon_order_id) REFERENCES orders(amazon_order_id)
);

CREATE TABLE financial_tds_reimbursement_event (
    _fivetran_id text,
    financial_event_group_id text,
    posted_date timestamp,
    reimbursed_amount_currency_amount double precision,
    reimbursed_amount_currency_code text,
    tdsorder_id text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (financial_event_group_id) REFERENCES financial_event_group(financial_event_group_id)
);

CREATE TABLE container_identification (
    container_identification_number text,
    container_identification_type text,
    container_sequence_number text,
    container_type text,
    transaction_date text,
    vendor_shipment_identifier text,
    PRIMARY KEY (container_identification_number, container_identification_type, container_sequence_number, container_type, transaction_date, vendor_shipment_identifier),
    FOREIGN KEY (container_sequence_number) REFERENCES vendor_retail_procurement_container(container_sequence_number),
    FOREIGN KEY (container_type) REFERENCES vendor_retail_procurement_container(container_sequence_number),
    FOREIGN KEY (transaction_date) REFERENCES vendor_retail_procurement_container(container_sequence_number),
    FOREIGN KEY (vendor_shipment_identifier) REFERENCES vendor_retail_procurement_container(container_sequence_number)
);

CREATE TABLE item_vendor_detail (
    asin text,
    marketplace_id text,
    manufacturer_code text,
    manufacturer_code_parent text,
    product_categorydisplay_name text,
    product_categoryvalue text,
    product_group text,
    product_subcategorydisplay_name text,
    product_subcategoryvalue text,
    replenishment_category text,
    PRIMARY KEY (asin, marketplace_id),
    FOREIGN KEY (asin) REFERENCES catalog(asin),
    FOREIGN KEY (marketplace_id) REFERENCES catalog(asin)
);

CREATE TABLE item_summary (
    asin text,
    marketplace_id text,
    adult_product boolean,
    autographed boolean,
    brand text,
    classification_id text,
    color text,
    contributors jsonb,
    display_name text,
    item_classification text,
    item_name text,
    manufacturer text,
    memorabilia boolean,
    model_number text,
    package_quantity bigint,
    part_number text,
    release_date text,
    "size" text,
    style text,
    trade_in_eligible boolean,
    website_display_group text,
    website_display_group_name text,
    PRIMARY KEY (asin, marketplace_id),
    FOREIGN KEY (asin) REFERENCES catalog(asin),
    FOREIGN KEY (marketplace_id) REFERENCES catalog(asin)
);

CREATE TABLE competitive_price_type (
    id text,
    asin text,
    belongs_to_requester boolean,
    "condition" text,
    landed_amount double precision,
    landed_currency_code text,
    listing_amount double precision,
    listing_currency_code text,
    offer_type text,
    points_monetary_value_amount double precision,
    points_monetary_value_currency_code text,
    points_number bigint,
    quantity_discount_type text,
    quantity_tier bigint,
    seller_id text,
    shipping_amount double precision,
    shipping_currency_code text,
    subcondition text,
    PRIMARY KEY (id, asin),
    FOREIGN KEY (asin) REFERENCES catalog(asin)
);

CREATE TABLE item_sales_rank_type (
    asin text,
    product_category_id text,
    rank text,
    PRIMARY KEY (asin),
    FOREIGN KEY (asin) REFERENCES catalog(asin)
);

CREATE TABLE cpt_trade_in_value (
    asin text,
    amount double precision,
    currency_code text,
    PRIMARY KEY (asin),
    FOREIGN KEY (asin) REFERENCES catalog(asin)
);

CREATE TABLE financial_loan_servicing_event (
    _fivetran_id text,
    financial_event_group_id text,
    loan_amount_currency_amount double precision,
    loan_amount_currency_code text,
    source_business_event_type text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (financial_event_group_id) REFERENCES financial_event_group(financial_event_group_id)
);

CREATE TABLE item_identifier (
    identifier text,
    identifier_type text,
    asin text,
    marketplace_id text,
    PRIMARY KEY (identifier, identifier_type, asin, marketplace_id),
    FOREIGN KEY (asin) REFERENCES catalog(asin),
    FOREIGN KEY (marketplace_id) REFERENCES catalog(asin)
);

CREATE TABLE tracking (
    id text,
    alternate_leg_tracking_id text,
    promised_delivery_date timestamp,
    tracking_summary_status text,
    PRIMARY KEY (id)
);

CREATE TABLE listed_item_summary (
    asin text,
    marketplace_id text,
    sku text,
    condition_type text,
    created_date timestamp,
    fn_sku text,
    height integer,
    item_name text,
    last_updated_date timestamp,
    link text,
    product_type text,
    "status" jsonb,
    width integer,
    PRIMARY KEY (asin, marketplace_id, sku),
    FOREIGN KEY (sku) REFERENCES listed_item(sku)
);

CREATE TABLE financial_seller_review_enrollment_payment_event (
    _fivetran_id text,
    financial_event_group_id text,
    enrollment_id text,
    parent_asin text,
    posted_date timestamp,
    total_amount_currency_amount double precision,
    total_amount_currency_code text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (financial_event_group_id) REFERENCES financial_event_group(financial_event_group_id)
);

CREATE TABLE vendor_shipping_order (
    purchase_order_date text,
    purchase_order_number text,
    transaction_date text,
    vendor_shipment_identifier text,
    ship_window text,
    PRIMARY KEY (purchase_order_date, purchase_order_number, transaction_date, vendor_shipment_identifier),
    FOREIGN KEY (purchase_order_date) REFERENCES vendor_retail_procurement_order(purchase_order_number),
    FOREIGN KEY (purchase_order_number) REFERENCES vendor_retail_procurement_order(purchase_order_number),
    FOREIGN KEY (transaction_date) REFERENCES vendor_retail_procurement_shipment(vendor_shipment_identifier),
    FOREIGN KEY (vendor_shipment_identifier) REFERENCES vendor_retail_procurement_shipment(vendor_shipment_identifier)
);

CREATE TABLE network_commingling_transaction_event (
    _fivetran_id text,
    financial_event_group_id text,
    asin text,
    marketplace_id text,
    net_co_transaction_id text,
    posted_date timestamp,
    swap_reason text,
    tax_amount_currency_amount double precision,
    tax_amount_currency_code text,
    tax_exclusive_amount_currency_amount double precision,
    tax_exclusive_amount_currency_code text,
    transaction_type text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (financial_event_group_id) REFERENCES financial_event_group(financial_event_group_id)
);

CREATE TABLE item_product_type (
    product_type text,
    asin text,
    marketplace_id text,
    PRIMARY KEY (product_type, asin, marketplace_id),
    FOREIGN KEY (asin) REFERENCES catalog(asin),
    FOREIGN KEY (marketplace_id) REFERENCES catalog(asin)
);

CREATE TABLE acknowledgement_status_details (
    "index" bigint,
    item_sequence_number text,
    purchase_order_number text,
    accepted_quantity_amount bigint,
    accepted_quantity_unit_of_measure text,
    accepted_quantity_unit_size bigint,
    acknowledgement_date timestamp,
    rejected_quantity_amount bigint,
    rejected_quantity_unit_of_measure text,
    rejected_quantity_unit_size bigint,
    PRIMARY KEY ("index", item_sequence_number, purchase_order_number),
    FOREIGN KEY (item_sequence_number) REFERENCES vendor_retail_procurement_order_item(item_sequence_number),
    FOREIGN KEY (purchase_order_number) REFERENCES vendor_retail_procurement_order_item(item_sequence_number)
);

CREATE TABLE service_job_appointment (
    appointment_id text,
    service_job_id bigint,
    poa_poa_type text,
    poa_upload_time timestamp,
    poa_uploading_technician text,
    rescheduled_appointment_id text,
    PRIMARY KEY (appointment_id),
    FOREIGN KEY (service_job_id) REFERENCES service_job(service_job_id)
);

CREATE TABLE vendor_retail_procurement_order_status (
    purchase_order_number text,
    last_updated_date timestamp,
    purchase_order_date timestamp,
    purchase_order_status text,
    PRIMARY KEY (purchase_order_number)
);

CREATE TABLE package_tracking_event (
    code text,
    package_number bigint,
    address_city text,
    address_country text,
    address_state text,
    "date" timestamp,
    description text,
    PRIMARY KEY (code, package_number),
    FOREIGN KEY (package_number) REFERENCES package_tracking_detail(package_number)
);

CREATE TABLE merchant_fulfillment_shipment (
    id text,
    amazon_order_id text,
    created_date timestamp,
    insurance_amount double precision,
    insurance_currency_code text,
    last_updated_date timestamp,
    seller_order_id text,
    "status" text,
    tracking_id text,
    weight_unit text,
    weight_value double precision,
    -- label_* (dynamic column),
    -- package_dimension_* (dynamic column),
    -- ship_from_address_* (dynamic column),
    -- ship_to_address_* (dynamic column),
    -- shipping_service_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (amazon_order_id) REFERENCES orders(amazon_order_id)
);

CREATE TABLE item_offer_detail (
    "index" bigint,
    sub_condition text,
    asin text,
    availability_type text,
    available_date timestamp,
    condition_notes text,
    country text,
    feedback_count text,
    is_buy_box_winner boolean,
    is_featured_merchant boolean,
    is_fulfilled_by_amazon boolean,
    is_national_prime boolean,
    is_prime boolean,
    listing_price_amount double precision,
    listing_price_currency_code text,
    maximum_hours bigint,
    minimum_hours bigint,
    offer_type text,
    points_monetary_value_amount double precision,
    points_monetary_value_currency_code text,
    points_number bigint,
    seller_id text,
    seller_positive_feedback_rating text,
    shipping_amount double precision,
    shipping_currency_code text,
    "state" text,
    PRIMARY KEY ("index", sub_condition, asin),
    FOREIGN KEY (asin) REFERENCES catalog(asin)
);

CREATE TABLE financial_pay_with_amazon_event (
    _fivetran_id text,
    financial_event_group_id text,
    amount_description text,
    business_object_type text,
    fulfillment_channel text,
    payment_amount_type text,
    sales_channel text,
    seller_order_id text,
    store_name text,
    transaction_posted_date timestamp,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (financial_event_group_id) REFERENCES financial_event_group(financial_event_group_id)
);

CREATE TABLE inner_container_sequence_number (
    container_sequence_number text,
    container_type text,
    transaction_date text,
    vendor_shipment_identifier text,
    PRIMARY KEY (container_sequence_number, container_type, transaction_date, vendor_shipment_identifier),
    FOREIGN KEY (container_sequence_number) REFERENCES vendor_retail_procurement_container(container_sequence_number),
    FOREIGN KEY (container_type) REFERENCES vendor_retail_procurement_container(container_sequence_number),
    FOREIGN KEY (transaction_date) REFERENCES vendor_retail_procurement_container(container_sequence_number),
    FOREIGN KEY (vendor_shipment_identifier) REFERENCES vendor_retail_procurement_container(container_sequence_number)
);

CREATE TABLE fba_inventory_summary (
    _fivetran_id text,
    asin text,
    carrier_damaged_quantity bigint,
    "condition" text,
    customer_damaged_quantity bigint,
    defective_quantity bigint,
    distributor_damaged_quantity bigint,
    expired_quantity bigint,
    fc_processing_quantity bigint,
    fn_sku text,
    fulfillable_quantity bigint,
    granularity_id text,
    granularity_type text,
    inbound_receiving_quantity bigint,
    inbound_shipped_quantity bigint,
    inbound_working_quantity bigint,
    last_updated_time timestamp,
    pending_customer_order_quantity bigint,
    pending_transshipment_quantity bigint,
    product_name text,
    seller_sku text,
    total_quantity bigint,
    total_reserved_quantity bigint,
    total_unfulfillable_quantity bigint,
    warehouse_damaged_quantity bigint,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (asin) REFERENCES catalog(asin)
);

CREATE TABLE item_relationship (
    "type" text,
    child_asin text,
    parent_asin text,
    PRIMARY KEY ("type", child_asin, parent_asin),
    FOREIGN KEY (child_asin) REFERENCES catalog(asin),
    FOREIGN KEY (parent_asin) REFERENCES catalog(asin)
);

CREATE TABLE financial_shipment_event (
    _fivetran_id text,
    financial_event_group_id text,
    amazon_order_id text,
    event_type text,
    marketplace_name text,
    posted_date timestamp,
    seller_order_id text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (financial_event_group_id) REFERENCES financial_event_group(financial_event_group_id)
);

CREATE TABLE financial_safet_reimbursement_item (
    _fivetran_id text,
    "index" integer,
    safet_reimbursement_event_id text,
    product_description text,
    quantity text,
    PRIMARY KEY (_fivetran_id, "index", safet_reimbursement_event_id),
    FOREIGN KEY (safet_reimbursement_event_id) REFERENCES financial_safet_reimbursement_event(_fivetran_id)
);

CREATE TABLE financial_removal_shipment_item_adjustment (
    removal_shipment_item_id text,
    removal_shipment_adjustment_event_id text,
    adjusted_quantity bigint,
    fulfillment_network_sku text,
    revenue_adjustment_currency_amount double precision,
    revenue_adjustment_currency_code text,
    tax_amount_adjustment_currency_amount double precision,
    tax_amount_adjustment_currency_code text,
    tax_collection_model text,
    tax_withheld_adjustment_currency_amount double precision,
    tax_withheld_adjustment_currency_code text,
    PRIMARY KEY (removal_shipment_item_id, removal_shipment_adjustment_event_id),
    FOREIGN KEY (removal_shipment_adjustment_event_id) REFERENCES financial_removal_shipment_adjustment_event(adjustment_event_id)
);

CREATE TABLE financial_adhoc_disbursement_event (
    _fivetran_id text,
    financial_event_group_id text,
    posted_date timestamp,
    transaction_amount_currency_amount double precision,
    transaction_amount_currency_code text,
    transaction_id text,
    transaction_type text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (financial_event_group_id) REFERENCES financial_event_group(financial_event_group_id)
);

CREATE TABLE sku_inbound_guidance (
    seller_sku text,
    asin text,
    inbound_guidance text,
    PRIMARY KEY (seller_sku)
);

CREATE TABLE order_item_serial_number (
    serial_number text,
    amazon_order_id text,
    order_item_id text,
    PRIMARY KEY (serial_number, amazon_order_id, order_item_id),
    FOREIGN KEY (amazon_order_id) REFERENCES order_item(order_item_id),
    FOREIGN KEY (order_item_id) REFERENCES order_item(order_item_id)
);

CREATE TABLE financial_retro_charge_event (
    _fivetran_id text,
    financial_event_group_id text,
    amazon_order_id text,
    base_tax_currency_amount double precision,
    base_tax_currency_code text,
    marketplace_name text,
    posted_date timestamp,
    retrocharge_event_type text,
    shipping_tax_currency_amount double precision,
    shipping_tax_currency_code text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (financial_event_group_id) REFERENCES financial_event_group(financial_event_group_id)
);

CREATE TABLE content_badge_set (
    content_badge text,
    content_reference_key text,
    PRIMARY KEY (content_badge, content_reference_key),
    FOREIGN KEY (content_reference_key) REFERENCES content_meta_data_record(content_reference_key)
);

CREATE TABLE financial_removal_shipment_adjustment_event (
    _fivetran_id text,
    adjustment_event_id text,
    financial_event_group_id text,
    merchant_order_id text,
    order_id text,
    posted_date timestamp,
    transaction_type text,
    PRIMARY KEY (_fivetran_id, adjustment_event_id),
    FOREIGN KEY (financial_event_group_id) REFERENCES financial_event_group(financial_event_group_id)
);

CREATE TABLE financial_removal_shipment_event (
    _fivetran_id text,
    financial_event_group_id text,
    merchant_order_id text,
    order_id text,
    posted_date timestamp,
    transaction_type text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (financial_event_group_id) REFERENCES financial_event_group(financial_event_group_id)
);

CREATE TABLE partnered_ltl_data_output (
    shipment_id text,
    amazon_calculated_value_currency_code text,
    amazon_calculated_value_value text,
    amazon_reference_id text,
    box_count bigint,
    carrier_name text,
    freight_ready_date text,
    is_bill_of_landing_available boolean,
    partnered_estimate_confirm_deadline text,
    partnered_estimate_currency_code text,
    partnered_estimate_value text,
    partnered_estimate_void_deadline text,
    preview_freight_class bigint,
    preview_pickup_date timestamp,
    seller_declared_currency_code text,
    seller_declared_value text,
    seller_fright_class bigint,
    total_weight_unit text,
    total_weight_value double precision,
    -- contact_* (dynamic column),
    PRIMARY KEY (shipment_id),
    FOREIGN KEY (shipment_id) REFERENCES transport_content(shipment_id)
);

CREATE TABLE vendor_direct_fulfillment_shipping_label_data (
    package_identifier text,
    purchase_order_number text,
    content text,
    ship_method text,
    ship_method_name text,
    tracking_number text,
    PRIMARY KEY (package_identifier, purchase_order_number),
    FOREIGN KEY (purchase_order_number) REFERENCES vendor_direct_fulfillment_shipping_label(purchase_order_number)
);

CREATE TABLE prep_instruction (
    seller_sku text,
    asin text,
    barcode_instruction text,
    prep_guidance text,
    prep_instruction_list jsonb,
    PRIMARY KEY (seller_sku)
);

CREATE TABLE financial_event_group (
    financial_event_group_id text,
    account_tail text,
    beginning_balance_currency_amount double precision,
    beginning_balance_currency_code text,
    converted_total_currency_amount double precision,
    converted_total_currency_code text,
    financial_event_group_end timestamp,
    financial_event_group_start timestamp,
    fund_transfer_date timestamp,
    fund_transfer_status text,
    original_total_currency_amount double precision,
    original_total_currency_code text,
    processing_status text,
    trace_id text,
    PRIMARY KEY (financial_event_group_id)
);

CREATE TABLE financial_debt_recovery_item (
    "index" integer,
    debt_recovery_event_id text,
    group_begin_date timestamp,
    group_end_date timestamp,
    recovery_amount_currency_amount double precision,
    recovery_amount_currency_code text,
    PRIMARY KEY ("index", debt_recovery_event_id),
    FOREIGN KEY (debt_recovery_event_id) REFERENCES financial_debt_recovery_event(_fivetran_id)
);

CREATE TABLE financial_capacity_reservation_billing_event (
    _fivetran_id text,
    financial_event_group_id text,
    description text,
    posted_date timestamp,
    transaction_amount_currency_amount double precision,
    transaction_amount_currency_code text,
    transaction_type text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (financial_event_group_id) REFERENCES financial_event_group(financial_event_group_id)
);

CREATE TABLE service_job_appointment_time (
    service_job_id bigint,
    duration_in_minutes bigint,
    start_time timestamp,
    "type" text,
    PRIMARY KEY (service_job_id),
    FOREIGN KEY (service_job_id) REFERENCES service_job(service_job_id)
);

CREATE TABLE financial_adjustment_event (
    _fivetran_id text,
    financial_event_group_id text,
    adjustment_amount_currency_amount double precision,
    adjustment_amount_currency_code text,
    adjustment_type text,
    posted_date timestamp,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (financial_event_group_id) REFERENCES financial_event_group(financial_event_group_id)
);

CREATE TABLE orders (
    amazon_order_id text,
    automated_shipping_setting_automated_carrier text,
    automated_shipping_setting_automated_ship_method text,
    automated_shipping_setting_has_automated_shipping_settings boolean,
    buyer_invoice_preference text,
    cba_displayable_shipping_label text,
    earliest_delivery_date timestamp,
    earliest_ship_date timestamp,
    easy_ship_shipment_status text,
    electronic_invoice_status text,
    fulfillment_channel text,
    fulfillment_supply_source_id text,
    has_regulated_items boolean,
    is_access_point_order boolean,
    is_business_order boolean,
    is_estimated_ship_date_set boolean,
    is_global_express_enabled boolean,
    is_iba boolean,
    is_ispu boolean,
    is_premium_order boolean,
    is_prime boolean,
    is_replacement_order boolean,
    is_sold_by_ab boolean,
    last_update_date timestamp,
    latest_delivery_date timestamp,
    latest_ship_date timestamp,
    marketplace_id text,
    number_of_items_shipped bigint,
    number_of_items_unshipped bigint,
    order_channel text,
    order_status text,
    order_total_amount text,
    order_total_currency_code text,
    order_type text,
    payment_method text,
    promise_response_due_date text,
    purchase_date timestamp,
    replaced_order_id text,
    sales_channel text,
    seller_display_name text,
    seller_order_id text,
    ship_service_level text,
    shipment_service_level_category text,
    -- buyer_info_* (dynamic column),
    -- buyer_tax_info* (dynamic column),
    -- default_ship_from_location_* (dynamic column),
    -- shipping_address_* (dynamic column),
    PRIMARY KEY (amazon_order_id)
);

CREATE TABLE vendor_direct_fulfillment_order_item (
    item_sequence_number text,
    customer_order_number text,
    purchase_order_number text,
    amount bigint,
    buyer_product_identifier text,
    customized_url text,
    earliest_nominated_delivery_date timestamp,
    gift_message text,
    gift_wrap_id text,
    latest_nominated_delivery_date timestamp,
    net_price_amount double precision,
    net_price_currency_code text,
    scheduled_delivery_service_type text,
    title text,
    total_price_amount double precision,
    total_price_currency_code text,
    unit_of_measure text,
    unit_size bigint,
    vendor_product_identifier text,
    PRIMARY KEY (item_sequence_number, customer_order_number, purchase_order_number),
    FOREIGN KEY (customer_order_number) REFERENCES vendor_direct_fulfillment_order(purchase_order_number),
    FOREIGN KEY (purchase_order_number) REFERENCES vendor_direct_fulfillment_order(purchase_order_number)
);

CREATE TABLE item_offer_lowest_price_type (
    asin text,
    "condition" text,
    fulfillment_channel text,
    landed_price_amount double precision,
    landed_price_currency_code text,
    listing_price_amount double precision,
    listing_price_currency_code text,
    offer_type text,
    points_points_number bigint,
    pointspoints_monetary_value_amount double precision,
    pointspoints_monetary_value_currency_code text,
    quantity_discount_type text,
    quantity_tier bigint,
    shipping_amount double precision,
    shipping_currency_code text,
    PRIMARY KEY (asin),
    FOREIGN KEY (asin) REFERENCES catalog(asin)
);

CREATE TABLE item_dimension (
    asin text,
    marketplace_id text,
    -- item_* (dynamic column),
    -- package_* (dynamic column),
    PRIMARY KEY (asin, marketplace_id),
    FOREIGN KEY (asin) REFERENCES catalog(asin),
    FOREIGN KEY (marketplace_id) REFERENCES catalog(asin)
);

CREATE TABLE non_partnered_ltl_data_output (
    shipment_id text,
    carrier_name text,
    pro_number text,
    PRIMARY KEY (shipment_id),
    FOREIGN KEY (shipment_id) REFERENCES non_partnered_small_parcel_package_output(shipment_id)
);

CREATE TABLE fulfillment_order_notification_email (
    email text,
    seller_fulfillment_order_id text,
    PRIMARY KEY (email, seller_fulfillment_order_id),
    FOREIGN KEY (seller_fulfillment_order_id) REFERENCES fulfillment_order(seller_fulfillment_order_id)
);

CREATE TABLE order_item_promotion_id (
    promotion_id text,
    amazon_order_id text,
    order_item_id text,
    PRIMARY KEY (promotion_id, amazon_order_id, order_item_id),
    FOREIGN KEY (amazon_order_id) REFERENCES orders(amazon_order_id),
    FOREIGN KEY (order_item_id) REFERENCES order_item(order_item_id)
);

CREATE TABLE financial_safet_reimbursement_event (
    _fivetran_id text,
    financial_event_group_id text,
    posted_date timestamp,
    reason_code text,
    reimbursed_amount_currency_amount double precision,
    reimbursed_amount_currency_code text,
    safetclaim_id text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (financial_event_group_id) REFERENCES financial_event_group(financial_event_group_id)
);

CREATE TABLE order_regulated_info (
    amazon_order_id text,
    external_reviewer_id text,
    rejection_reason text,
    rejection_reason_description text,
    rejection_reason_id text,
    requires_dosage_label boolean,
    requires_merchant_action boolean,
    review_date timestamp,
    "status" text,
    valid_rejection_reasons jsonb,
    PRIMARY KEY (amazon_order_id),
    FOREIGN KEY (amazon_order_id) REFERENCES orders(amazon_order_id)
);

CREATE TABLE vendor_retail_procurement_container (
    container_sequence_number text,
    container_type text,
    transaction_date text,
    vendor_shipment_identifier text,
    block bigint,
    container_count text,
    tier bigint,
    tracking_number text,
    weight_unit_of_measure text,
    weight_value double precision,
    -- dimensions_* (dynamic column),
    PRIMARY KEY (container_sequence_number, container_type, transaction_date, vendor_shipment_identifier),
    FOREIGN KEY (transaction_date) REFERENCES vendor_retail_procurement_shipment(vendor_shipment_identifier),
    FOREIGN KEY (vendor_shipment_identifier) REFERENCES vendor_retail_procurement_shipment(vendor_shipment_identifier)
);

CREATE TABLE item_contributor (
    "value" text,
    asin text,
    marketplace_id text,
    role_display_name text,
    role_value text,
    PRIMARY KEY ("value", asin, marketplace_id),
    FOREIGN KEY (asin) REFERENCES catalog(asin),
    FOREIGN KEY (marketplace_id) REFERENCES catalog(asin)
);

CREATE TABLE cod_payment_execution_detail (
    "index" bigint,
    amazon_order_id text,
    payment_amount text,
    payment_currency_code text,
    payment_method text,
    PRIMARY KEY ("index", amazon_order_id),
    FOREIGN KEY (amazon_order_id) REFERENCES orders(amazon_order_id)
);

CREATE TABLE approval_support_data_element (
    "name" text,
    amazon_order_id text,
    order_item_id text,
    "value" text,
    PRIMARY KEY ("name", amazon_order_id, order_item_id),
    FOREIGN KEY (amazon_order_id) REFERENCES order_item(order_item_id),
    FOREIGN KEY (order_item_id) REFERENCES order_item(order_item_id)
);

CREATE TABLE financial_seller_deal_payment_event (
    _fivetran_id text,
    financial_event_group_id text,
    deal_description text,
    deal_id text,
    event_type text,
    fee_amount_currency_amount double precision,
    fee_amount_currency_code text,
    fee_type text,
    posted_date timestamp,
    tax_amount_currency_amount double precision,
    tax_amount_currency_code text,
    total_amount_currency_amount double precision,
    total_amount_currency_code text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (financial_event_group_id) REFERENCES financial_event_group(financial_event_group_id)
);

CREATE TABLE financial_service_fee_event (
    _fivetran_id text,
    financial_event_group_id text,
    amazon_order_id text,
    asin text,
    fee_description text,
    fee_reason text,
    fn_sku text,
    seller_sku text,
    PRIMARY KEY (_fivetran_id, financial_event_group_id),
    FOREIGN KEY (financial_event_group_id) REFERENCES financial_event_group(financial_event_group_id)
);

CREATE TABLE asin_inbound_guidance (
    asin text,
    inbound_guidance text,
    PRIMARY KEY (asin)
);

CREATE TABLE tracking_event_history (
    event_code text,
    tracking_id text,
    event_time timestamp,
    -- location_* (dynamic column),
    PRIMARY KEY (event_code, tracking_id),
    FOREIGN KEY (tracking_id) REFERENCES tracking(id)
);

CREATE TABLE vendor_direct_fulfillment_tax_detail (
    "type" text,
    customer_order_number text,
    purchase_order_number text,
    tax_amount double precision,
    tax_currency_code text,
    tax_rate double precision,
    taxable_amount double precision,
    taxable_currency_code text,
    PRIMARY KEY ("type", customer_order_number, purchase_order_number),
    FOREIGN KEY (customer_order_number) REFERENCES vendor_direct_fulfillment_order(purchase_order_number),
    FOREIGN KEY (purchase_order_number) REFERENCES vendor_direct_fulfillment_order(purchase_order_number)
);

CREATE TABLE financial_tax_withholding_event (
    _fivetran_id text,
    financial_event_group_id text,
    base_amount_currency_amount double precision,
    base_amount_currency_code text,
    posted_date timestamp,
    tax_with_holding_period_end_date timestamp,
    tax_with_holding_period_start_date timestamp,
    with_held_amount_currency_amount double precision,
    with_held_amount_currency_code text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (financial_event_group_id) REFERENCES financial_event_group(financial_event_group_id)
);

CREATE TABLE item_buy_box_price_type (
    asin text,
    "condition" text,
    landed_price_amount double precision,
    landed_price_currency_code text,
    listing_price_amount double precision,
    listing_price_currency_code text,
    offer_type text,
    points_points_number bigint,
    pointspoints_monetary_value_amount double precision,
    pointspoints_monetary_value_currency_code text,
    quantity_discount_type text,
    quantity_tier bigint,
    seller_id text,
    shipping_price_amount double precision,
    shipping_price_currency_code text,
    PRIMARY KEY (asin),
    FOREIGN KEY (asin) REFERENCES catalog(asin)
);

CREATE TABLE vendor_retail_procurement_order_item (
    item_sequence_number text,
    purchase_order_number text,
    amazon_product_identifier text,
    amount bigint,
    is_back_order_allowed boolean,
    list_price_amount double precision,
    list_price_currency_code text,
    net_cost_amount double precision,
    net_cost_currency_code text,
    unit_of_measure text,
    unit_size bigint,
    vendor_product_identifier text,
    PRIMARY KEY (item_sequence_number, purchase_order_number),
    FOREIGN KEY (purchase_order_number) REFERENCES vendor_retail_procurement_order(purchase_order_number)
);

CREATE TABLE package_tracking_detail (
    package_number bigint,
    additional_location_info text,
    carrier_code text,
    carrier_phone_number text,
    carrier_url text,
    current_status text,
    current_status_description text,
    customer_tracking_link text,
    estimated_arrival_date timestamp,
    ship_date timestamp,
    ship_to_city text,
    ship_to_country text,
    ship_to_state text,
    signed_for_by text,
    tracking_number text,
    PRIMARY KEY (package_number)
);

CREATE TABLE item_classification_sales_rank (
    classification_id text,
    asin text,
    link text,
    rank text,
    title text,
    PRIMARY KEY (classification_id, asin),
    FOREIGN KEY (asin) REFERENCES catalog(asin)
);

CREATE TABLE financial_removal_shipment_item (
    removal_shipment_item_id text,
    removal_shipment_event_id text,
    fee_amount_currency_amount double precision,
    fee_amount_currency_code text,
    fulfillment_network_sku text,
    quantity bigint,
    revenue_currency_amount double precision,
    revenue_currency_code text,
    tax_amount_currency_amount double precision,
    tax_amount_currency_code text,
    tax_collection_model text,
    tax_with_held_currency_amount double precision,
    tax_with_held_currency_code text,
    PRIMARY KEY (removal_shipment_item_id, removal_shipment_event_id),
    FOREIGN KEY (removal_shipment_event_id) REFERENCES financial_removal_shipment_event(_fivetran_id)
);

CREATE TABLE financial_charge_component (
    charge_kind text,
    charge_type text,
    "index" integer,
    linked_to text,
    linked_to_id text,
    currency_amount double precision,
    currency_code text,
    PRIMARY KEY (charge_kind, charge_type, "index", linked_to, linked_to_id)
);

CREATE TABLE service_job (
    service_job_id bigint,
    asin text,
    create_time timestamp,
    marketplace_id text,
    quantity bigint,
    required_skills jsonb,
    seller_id text,
    service_job_provider_id text,
    service_job_status text,
    service_location_address_line_1 text,
    service_location_address_line_2 text,
    service_location_address_line_3 text,
    service_location_address_type text,
    service_location_city text,
    service_location_country text,
    service_location_country_code text,
    service_location_district text,
    service_location_district_or_county text,
    service_location_municipality text,
    service_location_name text,
    service_location_phone text,
    service_location_postal_code text,
    service_location_service_location_type text,
    service_location_state_or_region text,
    service_order_id text,
    store_id text,
    title text,
    PRIMARY KEY (service_job_id)
);

CREATE TABLE marketplace_tax_classification (
    "name" text,
    amazon_order_id text,
    "value" text,
    PRIMARY KEY ("name", amazon_order_id),
    FOREIGN KEY (amazon_order_id) REFERENCES orders(amazon_order_id)
);

CREATE TABLE technician (
    technician_id text,
    service_id bigint,
    "name" text,
    PRIMARY KEY (technician_id, service_id),
    FOREIGN KEY (service_id) REFERENCES service_job(service_job_id)
);

CREATE TABLE small_and_light_enrollment_status (
    marketplace_id text,
    seller_sku text,
    "status" text,
    PRIMARY KEY (marketplace_id, seller_sku)
);

CREATE TABLE inventory_feature (
    seller_sku text,
    feature_name text,
    asin text,
    fn_sku text,
    overlapping_skus jsonb,
    sku_count bigint,
    PRIMARY KEY (seller_sku, feature_name),
    FOREIGN KEY (feature_name) REFERENCES outbound_seller_feature(feature_name)
);

CREATE TABLE shipment_status_detail (
    "index" integer,
    transaction_date text,
    vendor_shipment_identifier text,
    shipment_status text,
    shipment_status_date text,
    PRIMARY KEY ("index", transaction_date, vendor_shipment_identifier),
    FOREIGN KEY (transaction_date) REFERENCES vendor_retail_procurement_shipment(vendor_shipment_identifier),
    FOREIGN KEY (vendor_shipment_identifier) REFERENCES vendor_retail_procurement_shipment(vendor_shipment_identifier)
);

CREATE TABLE financial_adjustment_item (
    "index" integer,
    adjustment_event_id text,
    asin text,
    fn_sku text,
    per_unit_amount_currency_amount double precision,
    per_unit_amount_currency_code text,
    product_description text,
    quantity text,
    seller_sku text,
    total_amount_currency_amount double precision,
    total_amount_currency_code text,
    PRIMARY KEY ("index", adjustment_event_id),
    FOREIGN KEY (adjustment_event_id) REFERENCES financial_adjustment_event(_fivetran_id)
);

CREATE TABLE catalog (
    asin text,
    marketplace_id text,
    PRIMARY KEY (asin)
);

CREATE TABLE item_display_group_sales_rank (
    website_display_group text,
    asin text,
    link text,
    rank text,
    title text,
    PRIMARY KEY (website_display_group, asin),
    FOREIGN KEY (asin) REFERENCES catalog(asin)
);

CREATE TABLE marketplace_participation (
    id text,
    merchant_id text,
    country_code text,
    default_currency_code text,
    default_language_code text,
    domain_name text,
    "name" text,
    PRIMARY KEY (id, merchant_id)
);

CREATE TABLE tracking_additional_input (
    rate_id text,
    PRIMARY KEY (rate_id)
);

CREATE TABLE inbound_shipment_info (
    shipment_id text,
    are_cases_required boolean,
    box_content_source text,
    box_contents_fee_details_fee_per_unit_currency_code text,
    box_contents_fee_details_fee_per_unit_value text,
    box_contents_fee_details_total_fee_currency_code text,
    box_contents_fee_details_total_fee_value text,
    box_contents_fee_details_total_units bigint,
    confirmed_needby_date text,
    destination_fulfillment_center_id text,
    label_prep_type text,
    shipment_name text,
    shipment_status text,
    -- ship_from_address_* (dynamic column),
    PRIMARY KEY (shipment_id)
);

CREATE TABLE financial_rental_transaction_event (
    _fivetran_id text,
    financial_event_group_id text,
    amazon_order_id text,
    extension_length bigint,
    marketplace_name text,
    posted_date timestamp,
    rental_event_type text,
    rental_initial_value_currency_amount double precision,
    rental_initial_value_currency_code text,
    rental_reimbursement_currency_amount double precision,
    rental_reimbursement_currency_code text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (financial_event_group_id) REFERENCES financial_event_group(financial_event_group_id)
);

CREATE TABLE financial_fee_component (
    fee_kind text,
    fee_type text,
    "index" integer,
    linked_to text,
    linked_to_id text,
    currency_amount double precision,
    currency_code text,
    PRIMARY KEY (fee_kind, fee_type, "index", linked_to, linked_to_id)
);

CREATE TABLE item_variation_theme (
    theme text,
    asin text,
    attribute jsonb,
    PRIMARY KEY (theme, asin),
    FOREIGN KEY (asin) REFERENCES catalog(asin)
);

CREATE TABLE financial_coupon_payment_event (
    _fivetran_id text,
    financial_event_group_id text,
    clip_or_redemption_count bigint,
    coupon_id text,
    payment_event_id text,
    posted_date timestamp,
    seller_coupon_description text,
    total_amount_currency_amount double precision,
    total_amount_currency_code text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (financial_event_group_id) REFERENCES financial_event_group(financial_event_group_id)
);

CREATE TABLE payment_method_detail_item (
    method text,
    amazon_order_id text,
    PRIMARY KEY (method, amazon_order_id),
    FOREIGN KEY (amazon_order_id) REFERENCES orders(amazon_order_id)
);

CREATE TABLE financial_product_ads_payment_event (
    _fivetran_id text,
    financial_event_group_id text,
    base_value_currency_amount double precision,
    base_value_currency_code text,
    invoice_id text,
    posted_date timestamp,
    tax_value_currency_amount double precision,
    tax_value_currency_code text,
    transaction_type text,
    transaction_value_currency_amount double precision,
    transaction_value_currency_code text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (financial_event_group_id) REFERENCES financial_event_group(financial_event_group_id)
);

CREATE TABLE available_delivery_experience_option (
    delivery_experience_option text,
    shipment_id text,
    charge_amount double precision,
    charge_currency_code text,
    PRIMARY KEY (delivery_experience_option, shipment_id),
    FOREIGN KEY (shipment_id) REFERENCES merchant_fulfillment_shipment(id)
);

CREATE TABLE item_quantity_discount_price_type (
    asin text,
    listing_price_amount double precision,
    listing_price_currency_code text,
    quantity_discount_type text,
    quantity_tier bigint,
    PRIMARY KEY (asin),
    FOREIGN KEY (asin) REFERENCES catalog(asin)
);

CREATE TABLE tax_registration_details (
    party_id text,
    tax_registration_number text,
    tax_registration_type text,
    PRIMARY KEY (party_id, tax_registration_number, tax_registration_type)
);

CREATE TABLE financial_charge_refund_event (
    _fivetran_id text,
    financial_event_group_id text,
    posted_date timestamp,
    reason_code text,
    reason_code_description text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (financial_event_group_id) REFERENCES financial_event_group(financial_event_group_id)
);

CREATE TABLE financial_debt_recovery_event (
    _fivetran_id text,
    financial_event_group_id text,
    debt_recovery_type text,
    over_payment_credit_currency_amount double precision,
    over_payment_credit_currency_code text,
    recovery_amount_currency_amount double precision,
    recovery_amount_currency_code text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (financial_event_group_id) REFERENCES financial_event_group(financial_event_group_id)
);

CREATE TABLE financial_fba_liquidation_event (
    _fivetran_id text,
    financial_event_group_id text,
    liquidation_fee_amount_currency_amount double precision,
    liquidation_fee_amount_currency_code text,
    liquidation_proceeds_amount_currency_amount double precision,
    liquidation_proceeds_amount_currency_code text,
    original_removal_order_id text,
    posted_date timestamp,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (financial_event_group_id) REFERENCES financial_event_group(financial_event_group_id)
);

CREATE TABLE vendor_direct_fulfillment_shipping_label (
    purchase_order_number text,
    label_format text,
    selling_party_address_address_line_1 text,
    selling_party_address_address_line_2 text,
    selling_party_address_address_line_3 text,
    selling_party_address_attention text,
    selling_party_address_city text,
    selling_party_address_country_code text,
    selling_party_address_county text,
    selling_party_address_district text,
    selling_party_address_name text,
    selling_party_address_phone text,
    selling_party_address_postal_code text,
    selling_party_address_state_or_region text,
    selling_party_party_id text,
    ship_from_party_address_address_line_1 text,
    ship_from_party_address_address_line_2 text,
    ship_from_party_address_address_line_3 text,
    ship_from_party_address_attention text,
    ship_from_party_address_city text,
    ship_from_party_address_country_code text,
    ship_from_party_address_county text,
    ship_from_party_address_district text,
    ship_from_party_address_name text,
    ship_from_party_address_phone text,
    ship_from_party_address_postal_code text,
    ship_from_party_address_state_or_region text,
    ship_from_party_party_id text,
    PRIMARY KEY (purchase_order_number),
    FOREIGN KEY (purchase_order_number) REFERENCES vendor_direct_fulfillment_order(purchase_order_number)
);

CREATE TABLE cpt_offer_listing_count_type (
    asin text,
    "condition" text,
    count text,
    PRIMARY KEY (asin)
);

CREATE TABLE financial_solution_provider_credit_event (
    _fivetran_id text,
    financial_event_group_id text,
    marketplace_country_code text,
    marketplace_id text,
    provider_id text,
    provider_store_name text,
    provider_transaction_type text,
    seller_id text,
    seller_order_id text,
    seller_store_name text,
    transaction_amount_currency_amount double precision,
    transaction_amount_currency_code text,
    transaction_creation_date timestamp,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (financial_event_group_id) REFERENCES financial_event_group(financial_event_group_id)
);

CREATE TABLE return_reason_code (
    return_reason_code text,
    description text,
    translated_description text,
    PRIMARY KEY (return_reason_code)
);

CREATE TABLE vendor_direct_fulfillment_order (
    customer_order_number text,
    purchase_order_number text,
    address_address_line_1 text,
    address_address_line_2 text,
    address_address_line_3 text,
    address_attention text,
    address_city text,
    address_country_code text,
    address_county text,
    address_district text,
    address_name text,
    address_phone text,
    address_postal_code text,
    address_state_or_region text,
    bill_to_party_address_address_line_1 text,
    bill_to_party_address_address_line_2 text,
    bill_to_party_address_address_line_3 text,
    bill_to_party_address_attention text,
    bill_to_party_address_city text,
    bill_to_party_address_country_code text,
    bill_to_party_address_county text,
    bill_to_party_address_district text,
    bill_to_party_address_name text,
    bill_to_party_address_phone text,
    bill_to_party_address_postal_code text,
    bill_to_party_address_state_or_region text,
    bill_to_party_party_id text,
    bill_to_party_tax_registration_tax_registration_number text,
    bill_to_party_tax_registration_tax_registration_type text,
    is_gift boolean,
    is_priority_shipment boolean,
    is_pslip_required boolean,
    is_scheduled_delivery_shipment boolean,
    message_to_customer text,
    order_date timestamp,
    order_status text,
    promised_delivery_date timestamp,
    required_ship_date timestamp,
    selling_party_address_address_line_1 text,
    selling_party_address_address_line_2 text,
    selling_party_address_address_line_3 text,
    selling_party_address_attention text,
    selling_party_address_city text,
    selling_party_address_country_code text,
    selling_party_address_county text,
    selling_party_address_district text,
    selling_party_address_name text,
    selling_party_address_phone text,
    selling_party_address_postal_code text,
    selling_party_address_state_or_region text,
    selling_party_party_id text,
    selling_party_tax_registration_tax_registration_number text,
    selling_party_tax_registration_tax_registration_type text,
    ship_from_party_address_address_line_1 text,
    ship_from_party_address_address_line_2 text,
    ship_from_party_address_address_line_3 text,
    ship_from_party_address_attention text,
    ship_from_party_address_city text,
    ship_from_party_address_country_code text,
    ship_from_party_address_county text,
    ship_from_party_address_district text,
    ship_from_party_address_name text,
    ship_from_party_address_phone text,
    ship_from_party_address_postal_code text,
    ship_from_party_address_state_or_region text,
    ship_from_party_party_id text,
    ship_from_party_tax_registration_tax_registration_number text,
    ship_from_party_tax_registration_tax_registration_type text,
    ship_method text,
    PRIMARY KEY (customer_order_number, purchase_order_number)
);

CREATE TABLE merchant_fulfillment_shipment_item (
    order_item_id text,
    shipment_id text,
    item_description text,
    item_weight_unit text,
    item_weight_value double precision,
    quantity bigint,
    PRIMARY KEY (order_item_id, shipment_id),
    FOREIGN KEY (order_item_id) REFERENCES order_item(order_item_id),
    FOREIGN KEY (shipment_id) REFERENCES merchant_fulfillment_shipment(id)
);

CREATE TABLE shipment_document (
    shipment_id text,
    "type" text,
    tracking_id text,
    contents text,
    format text,
    package_client_reference_id text,
    PRIMARY KEY (shipment_id, "type"),
    FOREIGN KEY (tracking_id) REFERENCES tracking(id)
);

CREATE TABLE vendor_retail_procurement_shipment (
    transaction_date text,
    vendor_shipment_identifier text,
    bill_of_lading_number text,
    buyer_reference_number text,
    carrier_assignment_date text,
    carrier_details_code text,
    carrier_details_email text,
    carrier_details_name text,
    carrier_details_phone text,
    carrier_details_shipment_reference_number text,
    current_shipment_status text,
    currentshipment_status_date text,
    estimated_delivery_date text,
    package_label_create_date text,
    requested_pick_up text,
    scheduled_pick_up text,
    selling_party_address_line_1 text,
    selling_party_address_line_2 text,
    selling_party_address_line_3 text,
    selling_party_attention text,
    selling_party_city text,
    selling_party_country_code text,
    selling_party_county text,
    selling_party_district text,
    selling_party_name text,
    selling_party_party_id text,
    selling_party_phone text,
    selling_party_postal_code text,
    selling_party_state_or_region text,
    ship_from_party_address_line_1 text,
    ship_from_party_address_line_2 text,
    ship_from_party_address_line_3 text,
    ship_from_party_attention text,
    ship_from_party_city text,
    ship_from_party_country_code text,
    ship_from_party_county text,
    ship_from_party_district text,
    ship_from_party_name text,
    ship_from_party_party_id text,
    ship_from_party_phone text,
    ship_from_party_postal_code text,
    ship_from_party_state_or_region text,
    ship_mode text,
    ship_to_party_address_line_1 text,
    ship_to_party_address_line_2 text,
    ship_to_party_address_line_3 text,
    ship_to_party_attention text,
    ship_to_party_city text,
    ship_to_party_country_code text,
    ship_to_party_county text,
    ship_to_party_district text,
    ship_to_party_name text,
    ship_to_party_party_id text,
    ship_to_party_phone text,
    ship_to_party_postal_code text,
    ship_to_party_state_or_region text,
    shipment_confirm_date text,
    shipment_create_date text,
    shipment_delivery_date text,
    shipment_freight_term text,
    shipped_date text,
    transaction_type text,
    transportation_mode text,
    -- import_details_* (dynamic column),
    -- shipment_measurements_* (dynamic column),
    PRIMARY KEY (transaction_date, vendor_shipment_identifier)
);

CREATE TABLE financial_affordability_expense_event (
    _fivetran_id text,
    financial_event_group_id text,
    amazon_order_id text,
    base_expense_currency_amount double precision,
    base_expense_currency_code text,
    event_type text,
    marketplace_id text,
    posted_date timestamp,
    tax_type_cgst_currency_amount double precision,
    tax_type_cgst_currency_code text,
    tax_type_igst_currency_amount double precision,
    tax_type_igst_currency_code text,
    tax_type_sgst_currency_amount double precision,
    tax_type_sgst_currency_code text,
    total_expense_currency_amount double precision,
    total_expense_currency_code text,
    transaction_type text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (financial_event_group_id) REFERENCES financial_event_group(financial_event_group_id)
);

CREATE TABLE financial_trial_shipment_event (
    _fivetran_id text,
    financial_event_group_id text,
    amazon_order_id text,
    posted_date timestamp,
    sku text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (financial_event_group_id) REFERENCES financial_event_group(financial_event_group_id)
);

CREATE TABLE non_partnered_small_parcel_package_output (
    "index" integer,
    shipment_id text,
    carrier_name text,
    package_status text,
    tracking_id text,
    PRIMARY KEY ("index", shipment_id)
);

CREATE TABLE financial_charge_instrument (
    "index" integer,
    debt_recovery_event_id text,
    amount_currency_amount double precision,
    amount_currency_code text,
    description text,
    tail text,
    PRIMARY KEY ("index", debt_recovery_event_id),
    FOREIGN KEY (debt_recovery_event_id) REFERENCES financial_debt_recovery_event(_fivetran_id)
);

CREATE TABLE easyship_package (
    package_id text,
    amazon_order_id text,
    invoice_invoice_date timestamp,
    invoice_invoice_number text,
    package_identifier text,
    package_status text,
    tracking_id text,
    -- package_* (dynamic column),
    -- time_slot_* (dynamic column),
    PRIMARY KEY (package_id, amazon_order_id),
    FOREIGN KEY (amazon_order_id) REFERENCES orders(amazon_order_id)
);

CREATE TABLE listed_item (
    sku text,
    item_procurement_amount text,
    item_procurement_currency_code text,
    PRIMARY KEY (sku)
);

CREATE TABLE amazon_prep_fees_detail (
    "index" integer,
    seller_sku text,
    fee_per_unit_currency_code text,
    fee_per_unit_value text,
    prep_instruction text,
    PRIMARY KEY ("index", seller_sku)
);

CREATE TABLE financial_value_added_service_charge_event (
    _fivetran_id text,
    financial_event_group_id text,
    description text,
    posted_date timestamp,
    transaction_amount_currency_amount double precision,
    transaction_amount_currency_code text,
    transaction_type text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (financial_event_group_id) REFERENCES financial_event_group(financial_event_group_id)
);

CREATE TABLE content_meta_data_record (
    content_reference_key text,
    marketplace_id text,
    "name" text,
    "status" text,
    update_time timestamp,
    PRIMARY KEY (content_reference_key, marketplace_id)
);

CREATE TABLE item_offer_summary (
    asin text,
    competitive_price_threshold_amount double precision,
    competitive_price_threshold_currency_code text,
    list_price_amount double precision,
    list_price_currency_code text,
    offers_available_time timestamp,
    suggested_lower_price_plus_shipping_amount double precision,
    suggested_lower_price_plus_shipping_currency_code text,
    total_offer_count bigint,
    PRIMARY KEY (asin),
    FOREIGN KEY (asin) REFERENCES catalog(asin)
);

CREATE TABLE vendor_retail_procurement_order (
    purchase_order_date timestamp,
    purchase_order_number text,
    bill_to_party_address_line_1 text,
    bill_to_party_address_line_2 text,
    bill_to_party_address_line_3 text,
    bill_to_party_address_type text,
    bill_to_party_city text,
    bill_to_party_country text,
    bill_to_party_country_code text,
    bill_to_party_district text,
    bill_to_party_district_or_county text,
    bill_to_party_municipality text,
    bill_to_party_name text,
    bill_to_party_party_id text,
    bill_to_party_phone text,
    bill_to_party_postal_code text,
    bill_to_party_state_or_region text,
    bill_to_party_tax_registration_number text,
    bill_to_party_tax_registration_type text,
    billable_weight_unit_of_measure text,
    billable_weight_value double precision,
    buying_party_address_line_1 text,
    buying_party_address_line_2 text,
    buying_party_address_line_3 text,
    buying_party_address_type text,
    buying_party_city text,
    buying_party_country text,
    buying_party_country_code text,
    buying_party_district text,
    buying_party_district_or_county text,
    buying_party_municipality text,
    buying_party_name text,
    buying_party_party_id text,
    buying_party_phone text,
    buying_party_postal_code text,
    buying_party_state_or_region text,
    buying_party_tax_registration_number text,
    buying_party_tax_registration_type text,
    deal_code text,
    delivery_window text,
    estimated_ship_by_date text,
    handling_instructions text,
    import_containers text,
    international_commercial_terms text,
    method_of_payment text,
    payment_method text,
    port_of_delivery text,
    purchase_order_changed_date timestamp,
    purchase_order_state text,
    purchase_order_state_changed_date timestamp,
    purchase_order_type text,
    seal_number text,
    selling_party_address_line_1 text,
    selling_party_address_line_2 text,
    selling_party_address_line_3 text,
    selling_party_address_type text,
    selling_party_city text,
    selling_party_country text,
    selling_party_country_code text,
    selling_party_district text,
    selling_party_district_or_county text,
    selling_party_municipality text,
    selling_party_name text,
    selling_party_party_id text,
    selling_party_phone text,
    selling_party_postal_code text,
    selling_party_state_or_region text,
    selling_party_tax_registration_number text,
    selling_party_tax_registration_type text,
    ship_to_party_address_line_1 text,
    ship_to_party_address_line_2 text,
    ship_to_party_address_line_3 text,
    ship_to_party_address_type text,
    ship_to_party_city text,
    ship_to_party_country text,
    ship_to_party_country_code text,
    ship_to_party_district text,
    ship_to_party_district_or_county text,
    ship_to_party_municipality text,
    ship_to_party_name text,
    ship_to_party_party_id text,
    ship_to_party_phone text,
    ship_to_party_postal_code text,
    ship_to_party_state_or_region text,
    ship_to_party_tax_registration_number text,
    ship_to_party_tax_registration_type text,
    ship_window text,
    shipping_instructions text,
    PRIMARY KEY (purchase_order_date, purchase_order_number)
);

CREATE TABLE financial_shipment_direct_payment (
    "index" integer,
    shipment_event_id text,
    currency_amount double precision,
    currency_code text,
    payment_type text,
    shipment_event_type text,
    PRIMARY KEY ("index", shipment_event_id),
    FOREIGN KEY (shipment_event_id) REFERENCES financial_shipment_event(_fivetran_id)
);

CREATE TABLE inbound_shipment_item_prep_detail (
    "index" integer,
    shipment_id text,
    prep_instruction text,
    prep_owner text,
    PRIMARY KEY ("index", shipment_id),
    FOREIGN KEY (shipment_id) REFERENCES inbound_shipment_info(shipment_id)
);

CREATE TABLE additional_seller_input (
    additional_input_field_name text,
    shipment_id text,
    data_type text,
    value_as_address_address_line_1 text,
    value_as_address_address_line_2 text,
    value_as_address_address_line_3 text,
    value_as_address_city text,
    value_as_address_country_code text,
    value_as_address_district_or_county text,
    value_as_address_email text,
    value_as_address_name text,
    value_as_address_phone text,
    value_as_address_postal_code text,
    value_as_address_state_or_province_code text,
    value_as_boolean boolean,
    value_as_currency_amount double precision,
    value_as_currency_currency_code text,
    value_as_dimension_unit text,
    value_as_dimension_value bigint,
    value_as_integer bigint,
    value_as_string text,
    value_as_timestamp timestamp,
    value_as_weight_unit text,
    value_as_weight_value double precision,
    PRIMARY KEY (additional_input_field_name, shipment_id),
    FOREIGN KEY (shipment_id) REFERENCES merchant_fulfillment_shipment(id)
);

CREATE TABLE listed_item_offers (
    marketplace_id text,
    offer_type text,
    sku text,
    points_number bigint,
    price_amount text,
    price_currency_code text,
    PRIMARY KEY (marketplace_id, offer_type, sku),
    FOREIGN KEY (sku) REFERENCES listed_item(sku)
);

CREATE TABLE partnered_small_parcel (
    shipment_id text,
    partnered_estimate_confirm_deadline text,
    partnered_estimate_currency_code text,
    partnered_estimate_value text,
    partnered_estimate_void_deadline text,
    PRIMARY KEY (shipment_id),
    FOREIGN KEY (shipment_id) REFERENCES transport_content(shipment_id)
);
