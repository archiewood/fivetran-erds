CREATE TABLE schedule_item_speaker (
    _fivetran_id text,
    schedule_item_id text,
    "name" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (schedule_item_id) REFERENCES schedule_item(id)
);

CREATE TABLE schedule_item (
    id text,
    event_id text,
    area text,
    area_id text,
    area_name text,
    created_at text,
    description text,
    "name" text,
    time_end text,
    time_start text,
    updated_at text,
    PRIMARY KEY (id, event_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE report_type (
    id text,
    event_id text,
    "status" text,
    title text,
    "type" text,
    PRIMARY KEY (id, event_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE event (
    id text,
    organization_id text,
    created_at text,
    description text,
    metadata jsonb,
    "name" text,
    published text,
    slug text,
    "status" text,
    time_end text,
    time_start text,
    timezone text,
    "type" text,
    PRIMARY KEY (id, organization_id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE organization (
    id text,
    created_at text,
    email text,
    facebook text,
    "name" text,
    twitter text,
    website text,
    PRIMARY KEY (id)
);

CREATE TABLE booth (
    id text,
    event_id text,
    about text,
    booth_size text,
    created_at text,
    email text,
    facebook text,
    headline text,
    instagram text,
    linkedin text,
    "name" text,
    priority text,
    twitter text,
    updated_at text,
    website text,
    PRIMARY KEY (id, event_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE template (
    id text,
    organization_id text,
    "name" text,
    PRIMARY KEY (id, organization_id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE custom_registration_child_question (
    id text,
    custom_registration_id text,
    event_id text,
    registration_id text,
    external_id text,
    "name" text,
    "type" text,
    "value" text,
    PRIMARY KEY (id, custom_registration_id, event_id, registration_id),
    FOREIGN KEY (custom_registration_id) REFERENCES custom_registration(id),
    FOREIGN KEY (event_id) REFERENCES event(id),
    FOREIGN KEY (registration_id) REFERENCES registration(id)
);

CREATE TABLE custom_registration (
    id text,
    event_id text,
    registration_id text,
    external_id text,
    "name" text,
    "type" text,
    "value" text,
    PRIMARY KEY (id, event_id, registration_id),
    FOREIGN KEY (event_id) REFERENCES event(id),
    FOREIGN KEY (registration_id) REFERENCES registration(id)
);

CREATE TABLE registration (
    id text,
    event_id text,
    magic_link_id text,
    ticket_id text,
    attended text,
    bio text,
    created_at text,
    email text,
    first_check_in text,
    first_name text,
    headline text,
    last_name text,
    linkedin text,
    metadata jsonb,
    phone_number text,
    qr_code_data text,
    qr_code_image_url text,
    question_bank_enabled text,
    refunded text,
    registered_through text,
    timezone text,
    twitter text,
    updated_at text,
    user_id text,
    utm_campaign text,
    utm_content text,
    utm_medium text,
    utm_source text,
    utm_term text,
    website text,
    PRIMARY KEY (id, event_id),
    FOREIGN KEY (event_id) REFERENCES event(id),
    FOREIGN KEY (magic_link_id) REFERENCES magic_link(id),
    FOREIGN KEY (ticket_id) REFERENCES ticket(id)
);

CREATE TABLE download_report (
    _fivetran_id text,
    report_type_id text,
    country text,
    email text,
    first_name text,
    headline text,
    last_name text,
    report_type_title text,
    ticket_type text,
    -- custom_* (dynamic column),
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (report_type_id) REFERENCES report_type(id)
);

CREATE TABLE stage (
    id text,
    event_id text,
    created_at text,
    "name" text,
    updated_at text,
    PRIMARY KEY (id, event_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE magic_link (
    id text,
    ticket_id text,
    registration_id text,
    created_at text,
    email text,
    extra_fields jsonb,
    first_name text,
    headline text,
    last_name text,
    magic_link text,
    metadata jsonb,
    "status" text,
    updated_at text,
    PRIMARY KEY (id, ticket_id),
    FOREIGN KEY (ticket_id) REFERENCES ticket(id),
    FOREIGN KEY (registration_id) REFERENCES registration(id)
);

CREATE TABLE report_list (
    id text,
    event_id text,
    "status" text,
    title text,
    url text,
    PRIMARY KEY (id, event_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE "session" (
    id text,
    event_id text,
    created_at text,
    "name" text,
    updated_at text,
    PRIMARY KEY (id, event_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE schedule_item_tag (
    _fivetran_id text,
    schedule_item_id text,
    id text,
    "name" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (schedule_item_id) REFERENCES schedule_item(id)
);

CREATE TABLE booth_tag (
    _fivetran_id text,
    booth_id text,
    id text,
    "name" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (booth_id) REFERENCES booth(id)
);

CREATE TABLE ticket (
    id text,
    event_id text,
    claimed text,
    count text,
    created_at text,
    description text,
    discount text,
    "name" text,
    price text,
    private text,
    remaining text,
    slug text,
    PRIMARY KEY (id, event_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);
