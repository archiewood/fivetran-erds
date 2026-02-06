CREATE TABLE orders_fulfillment_start_instruction (
    "index" text,
    order_id text,
    ebay_supported_fulfillment text,
    fulfillment_instructions_type text,
    max_estimated_delivery_date text,
    min_estimated_delivery_date text,
    ship_to_contact_address_city text,
    ship_to_contact_address_country_code text,
    ship_to_contact_address_line_1 text,
    ship_to_contact_address_line_2 text,
    ship_to_contact_address_postalcode text,
    ship_to_contact_address_state text,
    ship_to_email text,
    ship_to_fullname text,
    ship_to_phone_number text,
    shipping_service_code text,
    PRIMARY KEY ("index", order_id),
    FOREIGN KEY (order_id) REFERENCES order_history(id)
);

CREATE TABLE orders_line_item_refund (
    "index" text,
    orders_line_item_id text,
    orders_line_item_order_id text,
    amount_currency text,
    amount_value text,
    converted_from_currency text,
    converted_from_value text,
    refund_date text,
    refund_id text,
    refund_reference_id text,
    refund_status text,
    PRIMARY KEY ("index", orders_line_item_id, orders_line_item_order_id),
    FOREIGN KEY (orders_line_item_id) REFERENCES orders_line_item(id),
    FOREIGN KEY (orders_line_item_order_id) REFERENCES orders_line_item(order_id)
);

CREATE TABLE orders_line_item_promotion (
    promotion_id text,
    orders_line_item_id text,
    orders_line_item_order_id text,
    amount_currency text,
    amount_value text,
    converted_from_currency text,
    converted_from_value text,
    description text,
    PRIMARY KEY (promotion_id, orders_line_item_id, orders_line_item_order_id),
    FOREIGN KEY (orders_line_item_id) REFERENCES orders_line_item(id),
    FOREIGN KEY (orders_line_item_order_id) REFERENCES orders_line_item(order_id)
);

CREATE TABLE orders_line_item_tax (
    tax_type text,
    orders_line_item_id text,
    orders_line_item_order_id text,
    amount_currency text,
    amount_value text,
    converted_from_currency text,
    converted_from_value text,
    PRIMARY KEY (tax_type, orders_line_item_id, orders_line_item_order_id),
    FOREIGN KEY (orders_line_item_id) REFERENCES orders_line_item(id),
    FOREIGN KEY (orders_line_item_order_id) REFERENCES orders_line_item(order_id)
);

CREATE TABLE orders_line_item_variation_aspect (
    "index" text,
    orders_line_item_id text,
    orders_line_item_order_id text,
    "name" text,
    "value" text,
    PRIMARY KEY ("index", orders_line_item_id, orders_line_item_order_id),
    FOREIGN KEY (orders_line_item_id) REFERENCES orders_line_item(id),
    FOREIGN KEY (orders_line_item_order_id) REFERENCES orders_line_item(order_id)
);

CREATE TABLE orders_line_item (
    id text,
    order_id text,
    buyer_protection text,
    cost_currency text,
    cost_value text,
    fulfillment_status text,
    guaranteed_delivery text,
    item_country_code text,
    item_location text,
    item_postal_code text,
    legacy_item_id text,
    legacy_variation_id text,
    listing_marketplace_id text,
    max_estimated_delivery_date text,
    min_estimated_delivery_date text,
    purchase_marketplace_id text,
    quantity text,
    ship_by_date text,
    shipping_cost_currency text,
    shipping_cost_value text,
    sku text,
    sold_format text,
    sold_via_ad_campaign text,
    title text,
    total_currency text,
    total_value text,
    PRIMARY KEY (id, order_id),
    FOREIGN KEY (order_id) REFERENCES order_history(id)
);

CREATE TABLE orders_payment_refund (
    "index" text,
    orders_payment_order_id text,
    orders_payment_reference_id text,
    amount_currency text,
    amount_value text,
    converted_from_currency text,
    converted_from_value text,
    refund_date text,
    refund_id text,
    refund_reference_id text,
    refund_status text,
    PRIMARY KEY ("index", orders_payment_order_id, orders_payment_reference_id),
    FOREIGN KEY (orders_payment_order_id) REFERENCES orders_payment(order_id),
    FOREIGN KEY (orders_payment_reference_id) REFERENCES orders_payment(reference_id)
);

CREATE TABLE orders_payment_hold (
    "index" text,
    orders_payment_order_id text,
    orders_payment_reference_id text,
    amount_currency text,
    amount_value text,
    expected_release_date text,
    reason text,
    release_date text,
    seller_action_to_release text,
    "state" text,
    PRIMARY KEY ("index", orders_payment_order_id, orders_payment_reference_id),
    FOREIGN KEY (orders_payment_order_id) REFERENCES orders_payment(order_id),
    FOREIGN KEY (orders_payment_reference_id) REFERENCES orders_payment(reference_id)
);

CREATE TABLE orders_payment (
    reference_id text,
    order_id text,
    amount_currency text,
    amount_value text,
    "date" text,
    method text,
    "status" text,
    PRIMARY KEY (reference_id, order_id),
    FOREIGN KEY (order_id) REFERENCES order_history(id)
);

CREATE TABLE order_history (
    id text,
    adjustment_currency text,
    adjustment_value text,
    buyer_contact_address_city text,
    buyer_contact_address_country_code text,
    buyer_contact_address_line_1 text,
    buyer_contact_address_postal_code text,
    buyer_contact_address_state text,
    buyer_email text,
    buyer_fullname text,
    buyer_phone_number text,
    buyer_secondary_phone_number text,
    buyer_tax_address_city text,
    buyer_tax_address_country_code text,
    buyer_tax_address_postal_code text,
    buyer_tax_address_state text,
    buyer_username text,
    cancel_request jsonb,
    cancel_state text,
    creation_date text,
    delivery_cost_currency text,
    delivery_cost_value text,
    delivery_discount_currency text,
    delivery_discount_value text,
    ebay_collect_and_remit_tax text,
    fee_currency text,
    fee_value text,
    fulfillment_href jsonb,
    last_modified_date text,
    legacy_order_id text,
    order_fulfillment_status text,
    order_payment_status text,
    payment_refund jsonb,
    payment_total_due_seller_currency text,
    payment_total_due_seller_value text,
    price_discount_currency text,
    price_discount_value text,
    price_subtotal_currency text,
    price_subtotal_value text,
    sales_record_reference text,
    seller_id text,
    tax_currency text,
    tax_value text,
    total_currency text,
    total_fee_basis_amountcurrency text,
    total_fee_basis_amountvalue text,
    total_marketplace_feecurrency text,
    total_marketplace_feevalue text,
    total_value text,
    PRIMARY KEY (id)
);

CREATE TABLE shipping_fulfillment_line_item (
    line_item_id text,
    shipping_fulfillment_fivetran_id text,
    quantity text,
    PRIMARY KEY (line_item_id, shipping_fulfillment_fivetran_id),
    FOREIGN KEY (line_item_id) REFERENCES orders_line_item(id),
    FOREIGN KEY (shipping_fulfillment_fivetran_id) REFERENCES shipping_fulfillment(_fivetran_id)
);

CREATE TABLE shipping_fulfillment (
    _fivetran_id text,
    order_id text,
    carrier_code text,
    fulfillment_id text,
    service_code text,
    shipped_date text,
    tracking_number text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (order_id) REFERENCES order_history(id)
);

CREATE TABLE payment_dispute_activity (
    activity_date text,
    payment_dispute_id text,
    activity_type text,
    actor text,
    PRIMARY KEY (activity_date, payment_dispute_id),
    FOREIGN KEY (payment_dispute_id) REFERENCES payment_dispute(id)
);

CREATE TABLE payment_dispute_line_item (
    line_item_id text,
    payment_dispute_id text,
    item_id text,
    PRIMARY KEY (line_item_id, payment_dispute_id),
    FOREIGN KEY (line_item_id) REFERENCES orders_line_item(id),
    FOREIGN KEY (payment_dispute_id) REFERENCES payment_dispute(id)
);

CREATE TABLE payment_dispute (
    id text,
    order_id text,
    amount_currency text,
    amount_value text,
    buyer_provided_note text,
    buyer_username text,
    open_date text,
    reason text,
    respond_by_date text,
    revision text,
    seller_response text,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (order_id) REFERENCES order_history(id)
);
