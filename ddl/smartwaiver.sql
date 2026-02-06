CREATE TABLE checkin (
    "date" text,
    waiver_id text,
    first_name text,
    is_minor text,
    last_name text,
    "position" text,
    PRIMARY KEY ("date", waiver_id),
    FOREIGN KEY (waiver_id) REFERENCES waiver(id)
);

CREATE TABLE waiver_custom_field (
    "index" text,
    waiver_id text,
    display_text text,
    "value" text,
    PRIMARY KEY ("index", waiver_id),
    FOREIGN KEY (waiver_id) REFERENCES waiver(id)
);

CREATE TABLE waiver_tag (
    "index" text,
    waiver_id text,
    tag_name text,
    PRIMARY KEY ("index", waiver_id),
    FOREIGN KEY (waiver_id) REFERENCES waiver(id)
);

CREATE TABLE waiver_flag (
    "index" text,
    waiver_id text,
    display_text text,
    reason text,
    PRIMARY KEY ("index", waiver_id),
    FOREIGN KEY (waiver_id) REFERENCES waiver(id)
);

CREATE TABLE waiver_participant_custom_field (
    "index" text,
    waiver_id text,
    waiver_participant_index text,
    display_text text,
    "value" text,
    PRIMARY KEY ("index", waiver_id, waiver_participant_index),
    FOREIGN KEY (waiver_id) REFERENCES waiver_participant(waiver_id),
    FOREIGN KEY (waiver_participant_index) REFERENCES waiver_participant("index")
);

CREATE TABLE waiver_participant_tag (
    "index" text,
    waiver_id text,
    waiver_participant_index text,
    participant_tag text,
    PRIMARY KEY ("index", waiver_id, waiver_participant_index),
    FOREIGN KEY (waiver_id) REFERENCES waiver_participant(waiver_id),
    FOREIGN KEY (waiver_participant_index) REFERENCES waiver_participant("index")
);

CREATE TABLE waiver_participant_flag (
    "index" text,
    waiver_id text,
    waiver_participant_index text,
    display_text text,
    reason text,
    PRIMARY KEY ("index", waiver_id, waiver_participant_index),
    FOREIGN KEY (waiver_id) REFERENCES waiver_participant(waiver_id),
    FOREIGN KEY (waiver_participant_index) REFERENCES waiver_participant("index")
);

CREATE TABLE waiver_participant (
    "index" text,
    waiver_id text,
    dob text,
    first_name text,
    gender text,
    is_minor text,
    last_name text,
    middle_name text,
    minor_expired text,
    phone text,
    PRIMARY KEY ("index", waiver_id),
    FOREIGN KEY (waiver_id) REFERENCES waiver(id)
);

CREATE TABLE waiver (
    id text,
    template_id text,
    address_city text,
    address_country text,
    address_line_one text,
    address_line_two text,
    address_state text,
    address_zip text,
    auto_tag text,
    client_ip text,
    created_on text,
    dob text,
    drivers_license_number text,
    drivers_license_state text,
    email text,
    emergency_contact_first_name text,
    emergency_contact_last_name text,
    emergency_contact_name text,
    emergency_contact_phone text,
    expiration_date text,
    expired text,
    first_name text,
    guardian_dob text,
    guardian_first_name text,
    guardian_last_name text,
    guardian_middle_name text,
    guardian_phone text,
    guardian_relationship text,
    insurance_carrier text,
    insurance_policy_number text,
    is_minor text,
    kiosk text,
    last_name text,
    marketing_allowed text,
    marketing_allowed_checkbox text,
    middle_name text,
    pdf text,
    photos text,
    prefill_id text,
    test_ec text,
    title text,
    verified text,
    PRIMARY KEY (id),
    FOREIGN KEY (template_id) REFERENCES template(id)
);

CREATE TABLE template_vanity_url (
    url text,
    template_id text,
    PRIMARY KEY (url, template_id),
    FOREIGN KEY (template_id) REFERENCES template(id)
);

CREATE TABLE template (
    id text,
    kiosk_url text,
    published_on text,
    published_version text,
    title text,
    web_url text,
    webhook_email_validation_required text,
    webhook_endpoint text,
    PRIMARY KEY (id)
);
