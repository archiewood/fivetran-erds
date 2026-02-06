CREATE TABLE payment (
    id text,
    invoice_number text,
    amount text,
    "comment" text,
    creation_timestamp text,
    currency_code text,
    payment_method text,
    transaction_reference text,
    PRIMARY KEY (id, invoice_number),
    FOREIGN KEY (invoice_number) REFERENCES invoice(invoice_number)
);

CREATE TABLE event_custom_field (
    custom_event_field_id text,
    event_id text,
    "name" text,
    "value" text,
    PRIMARY KEY (custom_event_field_id, event_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE event (
    id text,
    amendment_end_date_time text,
    amendment_start_date_time text,
    attendee_id_mode text,
    attendee_list_paged_url text,
    cancellation_end_date_time text,
    cancellation_start_date_time text,
    event_end_date_time text,
    event_name text,
    event_start_date_time text,
    event_status text,
    event_website_url text,
    registration_end_date_time text,
    registration_start_date_time text,
    session_list_url text,
    time_zone text,
    venue_address text,
    venue_description text,
    venue_image_url text,
    venue_location_url text,
    venue_name text,
    PRIMARY KEY (id)
);

CREATE TABLE orders_attendee (
    person_id text,
    order_id text,
    id text,
    attendee_registration_status text,
    category text,
    check_in_code text,
    payment_status text,
    PRIMARY KEY (person_id, order_id),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (id) REFERENCES people(id)
);

CREATE TABLE orders (
    id text,
    address_line_1 text,
    address_line_2 text,
    all_attendees_completed_status text,
    amount_paid text,
    company text,
    country text,
    created text,
    currency_code text,
    email text,
    first_name text,
    last_modified text,
    last_name text,
    order_reference text,
    order_status text,
    payment_status text,
    phone_number text,
    post_code text,
    total_amount text,
    total_tax_amount text,
    town text,
    us_state text,
    PRIMARY KEY (id)
);

CREATE TABLE unsubscribes (
    id text,
    email text,
    unsubscribed_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (email) REFERENCES people(email)
);

CREATE TABLE session_abstract_co_author (
    abstract_id text,
    id text,
    session_id text,
    PRIMARY KEY (abstract_id, id, session_id),
    FOREIGN KEY (abstract_id) REFERENCES session_abstract(abstract_id),
    FOREIGN KEY (id) REFERENCES people(id),
    FOREIGN KEY (session_id) REFERENCES "session"(id)
);

CREATE TABLE session_abstract_uploaded_file (
    "index" text,
    abstract_id text,
    session_id text,
    file_url text,
    PRIMARY KEY ("index", abstract_id, session_id),
    FOREIGN KEY (abstract_id) REFERENCES session_abstract(abstract_id),
    FOREIGN KEY (session_id) REFERENCES "session"(id)
);

CREATE TABLE session_abstract_uploaded_paper (
    "index" text,
    abstract_id text,
    session_id text,
    paper_url text,
    PRIMARY KEY ("index", abstract_id, session_id),
    FOREIGN KEY (abstract_id) REFERENCES session_abstract(abstract_id),
    FOREIGN KEY (session_id) REFERENCES "session"(id)
);

CREATE TABLE session_abstract (
    abstract_id text,
    session_id text,
    main_author_id text,
    presenting_author_id text,
    abstract_content_url text,
    presentation_end_date_time text,
    presentation_method text,
    presentation_start_date_time text,
    reference_number text,
    summary text,
    title text,
    topic text,
    PRIMARY KEY (abstract_id, session_id),
    FOREIGN KEY (session_id) REFERENCES "session"(id),
    FOREIGN KEY (main_author_id) REFERENCES people(id),
    FOREIGN KEY (presenting_author_id) REFERENCES people(id)
);

CREATE TABLE session_label (
    label_id text,
    session_id text,
    hex_color text,
    "name" text,
    PRIMARY KEY (label_id, session_id),
    FOREIGN KEY (session_id) REFERENCES "session"(id)
);

CREATE TABLE session_restricted_category (
    attendee_category_id text,
    session_id text,
    attendee_category_name text,
    PRIMARY KEY (attendee_category_id, session_id),
    FOREIGN KEY (session_id) REFERENCES "session"(id)
);

CREATE TABLE session_presenter (
    person_id text,
    session_id text,
    id text,
    PRIMARY KEY (person_id, session_id),
    FOREIGN KEY (session_id) REFERENCES "session"(id),
    FOREIGN KEY (id) REFERENCES people(id)
);

CREATE TABLE "session" (
    id text,
    event_id text,
    attended_count text,
    booked_count text,
    capacity text,
    last_modified text,
    live_video_url text,
    location_name text,
    recorded_video_url text,
    session_code text,
    session_end_date_time text,
    session_name text,
    session_start_date_time text,
    session_status text,
    session_summary text,
    session_type text,
    walk_in_count text,
    PRIMARY KEY (id, event_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE invoice_line_item (
    "index" text,
    invoice_number text,
    amount text,
    description text,
    quantity text,
    "type" text,
    unit_price text,
    PRIMARY KEY ("index", invoice_number),
    FOREIGN KEY (invoice_number) REFERENCES invoice(invoice_number)
);

CREATE TABLE invoice (
    invoice_number text,
    event_id text,
    business_unit text,
    creation_timestamp text,
    credit_controller text,
    currency_code text,
    customer_po_number text,
    due_days text,
    external_invoice_reference text,
    grand_total text,
    invoice_address_address_line_1 text,
    invoice_address_address_line_2 text,
    invoice_address_address_line_3 text,
    invoice_address_company text,
    invoice_address_country text,
    invoice_address_email text,
    invoice_address_first_name text,
    invoice_address_last_name text,
    invoice_address_post_code text,
    invoice_address_town text,
    invoice_address_us_state text,
    invoice_address_work_phone_number text,
    invoice_document_url text,
    invoice_recipient_details_url text,
    is_deleted text,
    marked_as_printed text,
    next_related_invoice_number text,
    number_of_attendees text,
    payment_status text,
    previous_related_invoice_number text,
    registration_reference text,
    selected_payment_method text,
    total_before_vat text,
    "type" text,
    vat_applied text,
    vat_registration_number text,
    PRIMARY KEY (invoice_number),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE custom_data (
    "index" text,
    person_id text,
    code text,
    "key" text,
    "value" text,
    PRIMARY KEY ("index", person_id),
    FOREIGN KEY (person_id) REFERENCES attendee_person(person_id)
);

CREATE TABLE booked_session (
    session_id text,
    person_id text,
    detail_url text,
    session_name text,
    PRIMARY KEY (session_id, person_id),
    FOREIGN KEY (person_id) REFERENCES attendee_person(person_id)
);

CREATE TABLE booked_day (
    day_id text,
    person_id text,
    day_name text,
    detail_url text,
    PRIMARY KEY (day_id, person_id),
    FOREIGN KEY (person_id) REFERENCES attendee_person(person_id)
);

CREATE TABLE attended_session (
    session_id text,
    person_id text,
    detail_url text,
    last_update text,
    session_name text,
    PRIMARY KEY (session_id, person_id),
    FOREIGN KEY (person_id) REFERENCES attendee_person(person_id)
);

CREATE TABLE attended_day (
    "index" text,
    person_id text,
    "date" text,
    last_update text,
    PRIMARY KEY ("index", person_id),
    FOREIGN KEY (person_id) REFERENCES attendee_person(person_id)
);

CREATE TABLE custom_registration_data (
    "index" text,
    person_id text,
    code text,
    "key" text,
    "value" text,
    PRIMARY KEY ("index", person_id),
    FOREIGN KEY (person_id) REFERENCES attendee_person(person_id)
);

CREATE TABLE attendee_person (
    person_id text,
    event_id text,
    id text,
    category text,
    check_in_code text,
    marketing_code text,
    payment_status text,
    person_booked_ticket text,
    registration_reference text,
    registration_status text,
    registration_timestamp text,
    PRIMARY KEY (person_id, event_id),
    FOREIGN KEY (event_id) REFERENCES event(id),
    FOREIGN KEY (id) REFERENCES people(id)
);

CREATE TABLE people_custom_data (
    "index" text,
    person_id text,
    code text,
    "key" text,
    "value" text,
    PRIMARY KEY ("index", person_id),
    FOREIGN KEY (person_id) REFERENCES people(id)
);

CREATE TABLE people (
    id text,
    address_line_1 text,
    address_line_2 text,
    address_line_3 text,
    company text,
    country text,
    county text,
    email text,
    external_customer_account text,
    first_name text,
    gender text,
    is_anonymized text,
    job_title text,
    last_modified text,
    last_name text,
    phone_number text,
    picture_thumbnail_url text,
    picture_url text,
    post_code text,
    superseded_by_person_id text,
    superseded_by_person_url text,
    title text,
    town text,
    us_state text,
    username text,
    work_phone_number text,
    PRIMARY KEY (id)
);

CREATE TABLE event_day (
    id text,
    event_id text,
    attended_attendees_url text,
    attended_count text,
    booked_attendees_url text,
    booked_count text,
    capacity text,
    "date" text,
    "name" text,
    walk_in_count text,
    PRIMARY KEY (id, event_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);
