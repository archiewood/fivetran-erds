CREATE TABLE house_account (
    id text,
    property_id text,
    account_name text,
    account_status text,
    date_created text,
    is_private text,
    PRIMARY KEY (id),
    FOREIGN KEY (property_id) REFERENCES hotel(id)
);

CREATE TABLE source_tax (
    id text,
    source_id text,
    amount text,
    amount_type text,
    "name" text,
    "type" text,
    PRIMARY KEY (id, source_id),
    FOREIGN KEY (source_id) REFERENCES source_property(id)
);

CREATE TABLE source_fee (
    id text,
    source_id text,
    amount text,
    amount_type text,
    "name" text,
    "type" text,
    PRIMARY KEY (id, source_id),
    FOREIGN KEY (source_id) REFERENCES source_property(id)
);

CREATE TABLE source_property (
    id text,
    property_id text,
    commission text,
    is_third_party text,
    "name" text,
    payment_collect text,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (property_id) REFERENCES hotel(id)
);

CREATE TABLE hotel_detail (
    id text,
    additional_photos jsonb,
    address_1 text,
    address_2 text,
    amenities jsonb,
    check_in_time text,
    check_out_time text,
    city text,
    company_legal_name text,
    country text,
    email text,
    late_check_out_allowed text,
    late_check_out_type text,
    late_check_out_value text,
    latitude text,
    longitude text,
    phone text,
    primary_language text,
    "state" text,
    tax_id text,
    tax_id_2 text,
    terms_and_conditions text,
    zip text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES hotel(id)
);

CREATE TABLE custom_field (
    id text,
    property_id text,
    apply_to text,
    displayed jsonb,
    is_personal text,
    max_characters text,
    "name" text,
    required text,
    short_code text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (property_id) REFERENCES hotel(id)
);

CREATE TABLE hotel (
    id text,
    currency_code text,
    currency_position text,
    currency_symbol text,
    description text,
    image text,
    "name" text,
    timezone text,
    PRIMARY KEY (id)
);

CREATE TABLE payment_allocation_house (
    "index" text,
    payment_id text,
    amount text,
    "name" text,
    reference text,
    "type" text,
    PRIMARY KEY ("index", payment_id),
    FOREIGN KEY (payment_id) REFERENCES payment_house(id)
);

CREATE TABLE payment_house (
    id text,
    guest_id text,
    house_account_id text,
    property_id text,
    reservation_id text,
    room_id text,
    transaction_id text,
    amount text,
    currency text,
    description text,
    is_allocated text,
    is_deleted text,
    is_posted text,
    is_voided text,
    payment_method text,
    quantity text,
    "state" text,
    total_allocated text,
    total_unallocated text,
    user_id text,
    user_name text,
    PRIMARY KEY (id),
    FOREIGN KEY (guest_id) REFERENCES guest(id),
    FOREIGN KEY (house_account_id) REFERENCES house_account(id),
    FOREIGN KEY (property_id) REFERENCES hotel(id),
    FOREIGN KEY (reservation_id) REFERENCES reservation(reservation_id),
    FOREIGN KEY (room_id) REFERENCES room(id),
    FOREIGN KEY (transaction_id) REFERENCES "transaction"(transaction_id)
);

CREATE TABLE allotment_interval (
    "index" text,
    allotment_block_id text,
    room_type_id text,
    availability jsonb,
    end_date text,
    rate_id text,
    restrictions jsonb,
    start_date text,
    PRIMARY KEY ("index", allotment_block_id),
    FOREIGN KEY (allotment_block_id) REFERENCES allotment_block(id),
    FOREIGN KEY (room_type_id) REFERENCES room_type(id)
);

CREATE TABLE allotment_block (
    id text,
    property_id text,
    allotment_block_name text,
    allotment_type text,
    auto_release_release_days text,
    auto_release_release_schedule text,
    auto_release_release_time text,
    auto_release_release_type text,
    group_code text,
    is_auto_release text,
    rate_id text,
    rate_type text,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (property_id) REFERENCES hotel(id)
);

CREATE TABLE room (
    id text,
    room_type_id text,
    blocked text,
    description text,
    "name" text,
    property_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (room_type_id) REFERENCES room_type(id)
);

CREATE TABLE reservation (
    reservation_id text,
    property_id text,
    date_created text,
    date_modified text,
    PRIMARY KEY (reservation_id),
    FOREIGN KEY (property_id) REFERENCES hotel(id)
);

CREATE TABLE "transaction" (
    transaction_id text,
    guest_id text,
    house_account_id text,
    property_id text,
    reservation_id text,
    room_type_id text,
    amount text,
    card_type text,
    category text,
    category_name text,
    check_in text,
    check_out text,
    currency text,
    date_time text,
    date_time_utc text,
    description text,
    is_deleted text,
    modified_date_time text,
    modified_date_time_utc text,
    notes text,
    parent_transaction_id text,
    quantity text,
    room_name text,
    transaction_category text,
    transaction_code text,
    "type" text,
    user_name text,
    PRIMARY KEY (transaction_id),
    FOREIGN KEY (guest_id) REFERENCES guest(id),
    FOREIGN KEY (house_account_id) REFERENCES house_account(id),
    FOREIGN KEY (property_id) REFERENCES hotel(id),
    FOREIGN KEY (reservation_id) REFERENCES reservation(reservation_id),
    FOREIGN KEY (room_type_id) REFERENCES room_type(id)
);

CREATE TABLE reservation_detail_rate_by_room (
    room_type_id text,
    reservation_id text,
    guest_id text,
    room_id text,
    detailed_room_rate_names jsonb,
    rate_id text,
    rate_name text,
    room_status text,
    PRIMARY KEY (room_type_id, reservation_id),
    FOREIGN KEY (reservation_id) REFERENCES reservation_detail_rate(reservation_id),
    FOREIGN KEY (guest_id) REFERENCES guest(id),
    FOREIGN KEY (room_id) REFERENCES room(id)
);

CREATE TABLE reservation_detail_rate_by_day (
    rate_date text,
    reservation_id text,
    "name" text,
    PRIMARY KEY (rate_date, reservation_id),
    FOREIGN KEY (reservation_id) REFERENCES reservation_detail_rate(reservation_id)
);

CREATE TABLE reservation_detail_rate (
    reservation_id text,
    guest_id text,
    balance_detailed_additional_items text,
    balance_detailed_grand_total text,
    balance_detailed_paid text,
    balance_detailed_sub_total text,
    balance_detailed_suggested_deposit text,
    balance_detailed_taxes_fees text,
    check_in text,
    check_out text,
    currency text,
    date_created text,
    date_created_utc text,
    date_modified text,
    date_modified_utc text,
    is_deleted text,
    source_category text,
    source_name text,
    source_payment_collect text,
    PRIMARY KEY (reservation_id),
    FOREIGN KEY (reservation_id) REFERENCES reservation(reservation_id),
    FOREIGN KEY (guest_id) REFERENCES guest(id)
);

CREATE TABLE blocked_room (
    id text,
    room_block_id text,
    room_type_id text,
    PRIMARY KEY (id, room_block_id),
    FOREIGN KEY (id) REFERENCES room(id),
    FOREIGN KEY (room_block_id) REFERENCES blocked(id)
);

CREATE TABLE blocked (
    id text,
    property_id text,
    end_date text,
    reason text,
    start_date text,
    "type" text,
    PRIMARY KEY (id, property_id)
);

CREATE TABLE room_type (
    id text,
    property_id text,
    adults_included text,
    children_included text,
    description text,
    features jsonb,
    is_private text,
    max_guests text,
    name_short text,
    photos jsonb,
    room_rate text,
    room_type_name text,
    rooms_available text,
    type_units text,
    PRIMARY KEY (id),
    FOREIGN KEY (property_id) REFERENCES hotel(id)
);

CREATE TABLE guest_note (
    id text,
    guest_id text,
    note text,
    PRIMARY KEY (id, guest_id),
    FOREIGN KEY (guest_id) REFERENCES guest(id)
);

CREATE TABLE guest (
    id text,
    property_id text,
    reservation_id text,
    address text,
    address_2 text,
    assigned_room text,
    birthdate text,
    cell_phone text,
    city text,
    company_name text,
    company_tax_id text,
    country text,
    document_expiration_date text,
    document_issue_date text,
    document_issuing_country text,
    document_number text,
    document_type text,
    email text,
    end_date text,
    first_name text,
    gender text,
    guest_opt_in text,
    is_anonymized text,
    is_main_guest text,
    is_merged text,
    last_name text,
    new_guest_id text,
    phone text,
    start_date text,
    "state" text,
    "status" text,
    tax_id text,
    zip text,
    PRIMARY KEY (id),
    FOREIGN KEY (property_id) REFERENCES hotel(id),
    FOREIGN KEY (reservation_id) REFERENCES reservation(reservation_id)
);

CREATE TABLE reservation_detail_guest (
    guest_id text,
    reservation_id text,
    room_id text,
    PRIMARY KEY (guest_id, reservation_id),
    FOREIGN KEY (guest_id) REFERENCES guest(id),
    FOREIGN KEY (reservation_id) REFERENCES reservation(reservation_id),
    FOREIGN KEY (room_id) REFERENCES room(id)
);

CREATE TABLE reservation_detail_of_room_assigned (
    reservation_id text,
    room_id text,
    adults text,
    children text,
    daily_rates jsonb,
    end_date text,
    room_total text,
    start_date text,
    PRIMARY KEY (reservation_id, room_id),
    FOREIGN KEY (reservation_id) REFERENCES reservation_detail(reservation_id),
    FOREIGN KEY (room_id) REFERENCES room(id)
);

CREATE TABLE reservation_detail_of_room_unassigned (
    room_type_id text,
    reservation_id text,
    room_id text,
    sub_reservation_id text,
    PRIMARY KEY (room_type_id, reservation_id),
    FOREIGN KEY (reservation_id) REFERENCES reservation_detail(reservation_id),
    FOREIGN KEY (room_id) REFERENCES room_type(id)
);

CREATE TABLE reservation_detail_cards_on_file (
    id text,
    reservation_id text,
    PRIMARY KEY (id, reservation_id),
    FOREIGN KEY (reservation_id) REFERENCES reservation_detail(reservation_id)
);

CREATE TABLE reservation_detail_custom_field (
    "index" text,
    reservation_id text,
    "name" text,
    "value" text,
    PRIMARY KEY ("index", reservation_id),
    FOREIGN KEY (reservation_id) REFERENCES reservation_detail(reservation_id)
);

CREATE TABLE reservation_detail (
    reservation_id text,
    allotment_block_code text,
    source_id text,
    additional_items text,
    balance text,
    checkin_date text,
    checkout_date text,
    date_created text,
    date_modified text,
    grand_total text,
    order_id text,
    paid text,
    "status" text,
    sub_total text,
    suggested_deposit text,
    taxes_fees text,
    third_party_identifier text,
    total_booking_price text,
    PRIMARY KEY (reservation_id),
    FOREIGN KEY (reservation_id) REFERENCES reservation(reservation_id),
    FOREIGN KEY (allotment_block_code) REFERENCES allotment_block(id),
    FOREIGN KEY (source_id) REFERENCES source_property(id)
);

CREATE TABLE payment_allocation_reservation (
    "index" text,
    payment_id text,
    amount text,
    "name" text,
    reference text,
    "type" text,
    PRIMARY KEY ("index", payment_id),
    FOREIGN KEY (payment_id) REFERENCES payment_reservation(id)
);

CREATE TABLE payment_reservation (
    id text,
    guest_id text,
    property_id text,
    reservation_id text,
    room_id text,
    transaction_id text,
    amount text,
    currency text,
    description text,
    guest_checkin text,
    guest_checkout text,
    is_allocated text,
    is_deleted text,
    is_posted text,
    is_voided text,
    method text,
    quantity text,
    "state" text,
    total_allocated text,
    total_unallocated text,
    user_id text,
    username text,
    PRIMARY KEY (id),
    FOREIGN KEY (guest_id) REFERENCES guest(id),
    FOREIGN KEY (property_id) REFERENCES hotel(id),
    FOREIGN KEY (reservation_id) REFERENCES reservation(reservation_id),
    FOREIGN KEY (room_id) REFERENCES room(id),
    FOREIGN KEY (transaction_id) REFERENCES "transaction"(transaction_id)
);

CREATE TABLE payment_allocation_guest (
    "index" text,
    payment_id text,
    amount text,
    "name" text,
    reference text,
    "type" text,
    PRIMARY KEY ("index", payment_id),
    FOREIGN KEY (payment_id) REFERENCES payment_guest(id)
);

CREATE TABLE payment_guest (
    id text,
    guest_id text,
    property_id text,
    transaction_id text,
    amount text,
    currency text,
    description text,
    is_allocated text,
    is_deleted text,
    is_posted text,
    is_voided text,
    method text,
    quantity text,
    "state" text,
    total_allocated text,
    total_unallocated text,
    user_id text,
    user_name text,
    PRIMARY KEY (id),
    FOREIGN KEY (guest_id) REFERENCES guest(id),
    FOREIGN KEY (property_id) REFERENCES hotel(id),
    FOREIGN KEY (transaction_id) REFERENCES "transaction"(transaction_id)
);
