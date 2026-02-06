CREATE TABLE waitlist (
    id text,
    event_occurence_id text,
    event_series_id text,
    created_at_date timestamp,
    created_at_formatted text,
    created_at_iso text,
    created_at_time text,
    created_at_timezone text,
    created_at_unix text,
    email text,
    notified_date_date text,
    notified_date_formatted text,
    notified_date_iso text,
    notified_date_time text,
    notified_date_timezone text,
    notified_date_unix text,
    PRIMARY KEY (id),
    FOREIGN KEY (event_occurence_id) REFERENCES event_occurence(id),
    FOREIGN KEY (event_series_id) REFERENCES event_series(id)
);

CREATE TABLE checkin (
    id text,
    event_occurence_id text,
    event_series_id text,
    issued_ticket_id text,
    check_in_at text,
    created_at timestamp,
    quantity text,
    PRIMARY KEY (id),
    FOREIGN KEY (event_occurence_id) REFERENCES event_occurence(id),
    FOREIGN KEY (event_series_id) REFERENCES event_series(id),
    FOREIGN KEY (issued_ticket_id) REFERENCES issued_ticket(id)
);

CREATE TABLE voucher_code (
    id text,
    voucher_id text,
    code text,
    expiry_date text,
    expiry_formatted text,
    expiry_iso text,
    expiry_time text,
    expiry_timezone text,
    expiry_unix text,
    used_date text,
    used_formatted text,
    used_iso text,
    used_time text,
    used_timezone text,
    used_unix text,
    "value" text,
    PRIMARY KEY (id),
    FOREIGN KEY (voucher_id) REFERENCES voucher(id)
);

CREATE TABLE issued_ticket (
    id text,
    event_occurence_id text,
    event_series_id text,
    order_id text,
    ticket_type_id text,
    add_on_id text,
    barcode text,
    barcode_url text,
    checked_in text,
    created_at timestamp,
    custom_question jsonb,
    description text,
    email text,
    first_name text,
    full_name text,
    group_ticket_barcode text,
    last_name text,
    qr_code_url text,
    reference text,
    reservation text,
    "source" text,
    "status" text,
    updated_at text,
    voided_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (event_occurence_id) REFERENCES event_occurence(id),
    FOREIGN KEY (event_series_id) REFERENCES event_series(id),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (ticket_type_id) REFERENCES event_series_default_ticket_type(id)
);

CREATE TABLE product_event_series_id (
    event_series_id text,
    product_id text,
    PRIMARY KEY (event_series_id, product_id),
    FOREIGN KEY (event_series_id) REFERENCES event_series(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE product (
    id text,
    created_at_formatted text,
    created_at_iso text,
    created_at_time text,
    created_at_timezone text,
    created_at_unix text,
    currency text,
    description text,
    instruction text,
    issue_ticket_voucher text,
    linked_to_all_event_series text,
    "name" text,
    price text,
    quantity text,
    "status" text,
    updated_at_date text,
    updated_at_formatted text,
    updated_at_iso text,
    updated_at_time text,
    updated_at_timezone text,
    updated_at_unix text,
    PRIMARY KEY (id)
);

CREATE TABLE order_issued_ticket (
    issued_ticket_id text,
    order_id text,
    PRIMARY KEY (issued_ticket_id, order_id),
    FOREIGN KEY (issued_ticket_id) REFERENCES issued_ticket(id),
    FOREIGN KEY (order_id) REFERENCES orders(id)
);

CREATE TABLE order_line_item (
    id text,
    order_id text,
    booking_fee text,
    description text,
    quantity text,
    total text,
    "type" text,
    "value" text,
    PRIMARY KEY (id, order_id),
    FOREIGN KEY (order_id) REFERENCES orders(id)
);

CREATE TABLE orders (
    id text,
    event_occurence_id text,
    event_series_id text,
    payment_method_id text,
    buyer_detail_custom_questions jsonb,
    buyer_detail_email text,
    buyer_detail_first_name text,
    buyer_detail_last_name text,
    buyer_detail_name text,
    buyer_detail_phone text,
    buyer_details_address_1 text,
    buyer_details_address_2 text,
    buyer_details_address_3 text,
    buyer_details_postal_code text,
    created_at timestamp,
    currency_base_multiplier text,
    currency_code text,
    event_occurence_name text,
    event_summary_venue_name text,
    event_summary_venue_postal_code text,
    marketing_opt_in text,
    meta_data jsonb,
    referral_tag text,
    refund_amount text,
    refunded_voucher_id text,
    "status" text,
    status_message text,
    subtotal text,
    tax text,
    tax_treatment text,
    total text,
    total_paid text,
    txn_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (event_occurence_id) REFERENCES event_occurence(id),
    FOREIGN KEY (event_series_id) REFERENCES event_series(id),
    FOREIGN KEY (payment_method_id) REFERENCES event_series_payment_method(id)
);

CREATE TABLE event_series_voucher_id (
    event_series_id text,
    voucher_id text,
    PRIMARY KEY (event_series_id, voucher_id),
    FOREIGN KEY (event_series_id) REFERENCES event_series(id),
    FOREIGN KEY (voucher_id) REFERENCES voucher(id)
);

CREATE TABLE event_series_payment_method (
    id text,
    event_series_id text,
    external_id text,
    instructions text,
    "name" text,
    "type" text,
    PRIMARY KEY (id, event_series_id),
    FOREIGN KEY (event_series_id) REFERENCES event_series(id)
);

CREATE TABLE event_series_bundle_ticket_type (
    id text,
    event_series_bundle_id text,
    event_series_id text,
    quantity text,
    PRIMARY KEY (id, event_series_bundle_id, event_series_id),
    FOREIGN KEY (event_series_bundle_id) REFERENCES event_series_bundle(id),
    FOREIGN KEY (event_series_id) REFERENCES event_series_bundle(event_series_id)
);

CREATE TABLE event_series_bundle (
    id text,
    event_series_id text,
    booking_fee text,
    description text,
    "name" text,
    price text,
    product jsonb,
    "status" text,
    PRIMARY KEY (id, event_series_id),
    FOREIGN KEY (event_series_id) REFERENCES event_series(id)
);

CREATE TABLE event_series_default_ticket_type (
    id text,
    event_series_id text,
    access_code text,
    booking_fee text,
    description text,
    group_id text,
    has_overrides text,
    max_per_order text,
    min_per_order text,
    "name" text,
    override_id text,
    price text,
    quantity text,
    quantity_held text,
    quantity_issued text,
    quantity_total text,
    sort_order text,
    "status" text,
    "type" text,
    PRIMARY KEY (id, event_series_id),
    FOREIGN KEY (event_series_id) REFERENCES event_series(id)
);

CREATE TABLE event_series_default_group_ticket (
    event_series_default_ticket_group_event_series_id text,
    event_series_default_ticket_group_id text,
    ticket_id text,
    PRIMARY KEY (event_series_default_ticket_group_event_series_id, event_series_default_ticket_group_id, ticket_id),
    FOREIGN KEY (event_series_default_ticket_group_event_series_id) REFERENCES event_series_default_ticket_group(event_series_id),
    FOREIGN KEY (event_series_default_ticket_group_id) REFERENCES event_series_default_ticket_group(id),
    FOREIGN KEY (ticket_id) REFERENCES event_series_default_ticket_type(id)
);

CREATE TABLE event_series_default_ticket_group (
    id text,
    event_series_id text,
    max_per_order text,
    "name" text,
    sort_order text,
    PRIMARY KEY (id, event_series_id),
    FOREIGN KEY (event_series_id) REFERENCES event_series(id)
);

CREATE TABLE event_series (
    id text,
    access_code text,
    add_ons jsonb,
    call_to_action text,
    created_at timestamp,
    currency text,
    default_max_tickets_sold_per_occurrence text,
    description text,
    image_header text,
    image_thumbnail text,
    "name" text,
    next_occurrence_date_date text,
    next_occurrence_date_formatted text,
    next_occurrence_date_iso text,
    next_occurrence_date_time text,
    next_occurrence_date_timezone text,
    next_occurrence_date_unix text,
    online_event text,
    private text,
    revenue text,
    "status" text,
    timezone text,
    total_issued_ticket text,
    total_occurrence text,
    upcoming_occurrence text,
    url text,
    venue_name text,
    venue_postal_code text,
    PRIMARY KEY (id)
);

CREATE TABLE hold_quantity (
    "index" text,
    hold_id text,
    quantity text,
    ticket_type_id text,
    PRIMARY KEY ("index", hold_id),
    FOREIGN KEY (hold_id) REFERENCES hold(id)
);

CREATE TABLE hold (
    id text,
    event_occurence_id text,
    created_at_date text,
    created_at_formatted text,
    created_at_iso text,
    created_at_time text,
    created_at_timezone text,
    created_at_unix text,
    note text,
    total_on_hold text,
    update_at_date text,
    update_at_formatted text,
    update_at_iso text,
    update_at_time text,
    update_at_timezone text,
    update_at_unix text,
    PRIMARY KEY (id),
    FOREIGN KEY (event_occurence_id) REFERENCES event_occurence(id)
);

CREATE TABLE event_override_line (
    "index" text,
    event_override_id text,
    price text,
    quantity text,
    reference_id text,
    reference_type text,
    "status" text,
    PRIMARY KEY ("index", event_override_id),
    FOREIGN KEY (event_override_id) REFERENCES event_override(id)
);

CREATE TABLE event_override (
    id text,
    event_series_id text,
    created_at_date text,
    created_at_formatted text,
    created_at_iso text,
    created_at_time text,
    created_at_timezone text,
    created_at_unix text,
    max_sellable_ticket text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (event_series_id) REFERENCES event_series(id)
);

CREATE TABLE discount_product (
    discount_id text,
    product_id text,
    PRIMARY KEY (discount_id, product_id),
    FOREIGN KEY (discount_id) REFERENCES discount(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE discount_ticket_type (
    "index" text,
    discount_id text,
    ticket_type text,
    PRIMARY KEY ("index", discount_id),
    FOREIGN KEY (discount_id) REFERENCES discount(id),
    FOREIGN KEY (ticket_type) REFERENCES event_series_default_ticket_type(id)
);

CREATE TABLE discount (
    id text,
    booking_fee_amount text,
    booking_fee_percentage text,
    code text,
    expires text,
    face_value_amount text,
    face_value_percentage text,
    max_redemption text,
    "name" text,
    times_redeemed text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE event_occurence (
    id text,
    event_series_id text,
    chk text,
    end_date text,
    end_formatted text,
    end_iso text,
    end_time text,
    end_timezone text,
    end_unix text,
    hidden text,
    override_id text,
    start_date text,
    start_formatted text,
    start_iso text,
    start_time text,
    start_timezone text,
    start_unix text,
    tickets_available text,
    unavailable text,
    unavailable_status text,
    PRIMARY KEY (id, event_series_id),
    FOREIGN KEY (event_series_id) REFERENCES event_series(id)
);

CREATE TABLE voucher (
    id text,
    available_codes text,
    expiry_date text,
    expiry_formatted text,
    expiry_iso text,
    expiry_time text,
    expiry_timezone text,
    expiry_unix text,
    "name" text,
    partial_redemption text,
    total_codes text,
    "type" text,
    "value" text,
    PRIMARY KEY (id)
);
