CREATE TABLE lead_history (
    id bigint,
    creator_id bigint,
    owner_id bigint,
    source_id bigint,
    unqualified_reason_id bigint,
    created_at timestamp,
    description text,
    email text,
    facebook text,
    fax text,
    first_name text,
    industry text,
    last_name text,
    linkedin text,
    mobile text,
    organization_name text,
    phone text,
    skype text,
    "status" text,
    title text,
    twitter text,
    updated_at timestamp,
    website text,
    -- address_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (creator_id) REFERENCES "user"(id),
    FOREIGN KEY (owner_id) REFERENCES "user"(id),
    FOREIGN KEY (source_id) REFERENCES "source"(id),
    FOREIGN KEY (unqualified_reason_id) REFERENCES unqualified_reason(id)
);

CREATE TABLE text_message_associated_deal (
    "index" integer,
    text_message_id bigint,
    deal_id bigint,
    PRIMARY KEY ("index", text_message_id),
    FOREIGN KEY (text_message_id) REFERENCES text_message(id),
    FOREIGN KEY (deal_id) REFERENCES deal_history(id)
);

CREATE TABLE note_tag (
    "index" integer,
    note_id bigint,
    "name" text,
    PRIMARY KEY ("index", note_id),
    FOREIGN KEY (note_id) REFERENCES note(id)
);

CREATE TABLE product (
    id bigint,
    active boolean,
    cost double precision,
    cost_currency text,
    created_at timestamp,
    description text,
    max_discount bigint,
    max_markup bigint,
    "name" text,
    sku text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE product_price (
    "index" integer,
    product_id bigint,
    amount double precision,
    currency text,
    PRIMARY KEY ("index", product_id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE tag (
    "name" text,
    resource_id bigint,
    resource_type text,
    PRIMARY KEY ("name", resource_id, resource_type)
);

CREATE TABLE collaboration (
    id bigint,
    creator_id bigint,
    collaborator_id bigint,
    created_at timestamp,
    resource_id bigint,
    resource_type text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (creator_id) REFERENCES "user"(id)
);

CREATE TABLE deal_history (
    id bigint,
    contact_id bigint,
    creator_id bigint,
    last_stage_change_by_id bigint,
    loss_reason_id bigint,
    organization_id bigint,
    owner_id bigint,
    source_id bigint,
    stage_id bigint,
    unqualified_reason_id bigint,
    added_at timestamp,
    created_at timestamp,
    currency text,
    customized_win_likelihood integer,
    dropbox_email text,
    estimated_close_date text,
    hot boolean,
    last_activity_at timestamp,
    last_stage_change_at text,
    "name" text,
    updated_at timestamp,
    "value" text,
    PRIMARY KEY (id),
    FOREIGN KEY (contact_id) REFERENCES contact_history(id),
    FOREIGN KEY (creator_id) REFERENCES "user"(id),
    FOREIGN KEY (last_stage_change_by_id) REFERENCES "user"(id),
    FOREIGN KEY (loss_reason_id) REFERENCES loss_reason(id),
    FOREIGN KEY (organization_id) REFERENCES contact_history(id),
    FOREIGN KEY (owner_id) REFERENCES "user"(id),
    FOREIGN KEY (source_id) REFERENCES "source"(id),
    FOREIGN KEY (stage_id) REFERENCES stage(id),
    FOREIGN KEY (unqualified_reason_id) REFERENCES unqualified_reason(id)
);

CREATE TABLE visit_outcome (
    id bigint,
    created_at timestamp,
    "name" text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE "call" (
    id bigint,
    outcome_id bigint,
    user_id bigint,
    created_at timestamp,
    duration bigint,
    external_id text,
    incoming boolean,
    made_at timestamp,
    missed boolean,
    phone_number text,
    recording_url text,
    resource_id bigint,
    resource_type text,
    summary text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (outcome_id) REFERENCES call_outcome(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE lead_conversion (
    id bigint,
    creator_id bigint,
    deal_id bigint,
    individual_id bigint,
    lead_id bigint,
    organization_id bigint,
    created_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (creator_id) REFERENCES "user"(id),
    FOREIGN KEY (deal_id) REFERENCES deal_history(id),
    FOREIGN KEY (individual_id) REFERENCES contact_history(id),
    FOREIGN KEY (lead_id) REFERENCES lead_history(id),
    FOREIGN KEY (organization_id) REFERENCES contact_history(id)
);

CREATE TABLE unqualified_reason (
    id bigint,
    creator_id bigint,
    created_at timestamp,
    "name" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (creator_id) REFERENCES "user"(id)
);

CREATE TABLE associated_contact (
    contact_id bigint,
    deal_id bigint,
    created_at timestamp,
    "role" text,
    updated_at timestamp,
    PRIMARY KEY (contact_id, deal_id),
    FOREIGN KEY (contact_id) REFERENCES contact_history(id),
    FOREIGN KEY (deal_id) REFERENCES deal_history(id)
);

CREATE TABLE visit (
    id bigint,
    creator_id bigint,
    outcome_id bigint,
    created_at timestamp,
    rep_location_verification_status text,
    resource_address text,
    resource_id bigint,
    resource_type text,
    summary text,
    updated_at timestamp,
    visited_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (creator_id) REFERENCES "user"(id),
    FOREIGN KEY (outcome_id) REFERENCES visit_outcome(id)
);

CREATE TABLE call_associated_deal (
    "index" integer,
    call_id bigint,
    deal_id bigint,
    PRIMARY KEY ("index", call_id),
    FOREIGN KEY (call_id) REFERENCES "call"(id),
    FOREIGN KEY (deal_id) REFERENCES deal_history(id)
);

CREATE TABLE task (
    id bigint,
    creator_id bigint,
    owner_id bigint,
    completed boolean,
    completed_at timestamp,
    content text,
    created_at timestamp,
    due_date timestamp,
    overdue boolean,
    remind_at timestamp,
    resource_id bigint,
    resource_type text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (creator_id) REFERENCES "user"(id),
    FOREIGN KEY (owner_id) REFERENCES "user"(id)
);

CREATE TABLE stage (
    id bigint,
    pipeline_id bigint,
    active boolean,
    category text,
    created_at timestamp,
    likelihood bigint,
    "name" text,
    "position" bigint,
    updated_at timestamp,
    PRIMARY KEY (id, pipeline_id),
    FOREIGN KEY (pipeline_id) REFERENCES pipeline(id)
);

CREATE TABLE note (
    id bigint,
    creator_id bigint,
    content text,
    created_at timestamp,
    is_important boolean,
    resource_id bigint,
    resource_type text,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (creator_id) REFERENCES "user"(id)
);

CREATE TABLE loss_reason (
    id bigint,
    creator_id bigint,
    created_at timestamp,
    "name" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (creator_id) REFERENCES "user"(id)
);

CREATE TABLE "user" (
    id bigint,
    reports_to bigint,
    confirmed boolean,
    created_at timestamp,
    deleted_at timestamp,
    email text,
    group_id bigint,
    group_name text,
    identity_type text,
    invited boolean,
    "name" text,
    phone_number text,
    "role" text,
    "status" text,
    team_name text,
    timezone text,
    updated_at timestamp,
    zendesk_user_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (reports_to) REFERENCES "user"(id)
);

CREATE TABLE line_item (
    id bigint,
    order_id bigint,
    product_id bigint,
    created_at timestamp,
    currency text,
    description text,
    "name" text,
    price double precision,
    quantity bigint,
    sku text,
    updated_at timestamp,
    "value" double precision,
    variation double precision,
    PRIMARY KEY (id),
    FOREIGN KEY (order_id) REFERENCES "order"(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE contact_history (
    id bigint,
    contact_id bigint,
    creator_id bigint,
    owner_id bigint,
    parent_organization_id bigint,
    created_at timestamp,
    customer_status text,
    description text,
    email text,
    facebook text,
    fax text,
    first_name text,
    industry text,
    is_organization boolean,
    last_name text,
    linkedin text,
    mobile text,
    "name" text,
    phone text,
    prospect_status text,
    skype text,
    title text,
    twitter text,
    updated_at timestamp,
    website text,
    -- address_* (dynamic column),
    -- billing_address_* (dynamic column),
    -- shipping_address_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (contact_id) REFERENCES contact_history(id),
    FOREIGN KEY (creator_id) REFERENCES "user"(id),
    FOREIGN KEY (owner_id) REFERENCES "user"(id),
    FOREIGN KEY (parent_organization_id) REFERENCES contact_history(id)
);

CREATE TABLE "order" (
    id bigint,
    deal_id bigint,
    created_at timestamp,
    discount bigint,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (deal_id) REFERENCES deal_history(id)
);

CREATE TABLE text_message (
    id bigint,
    content text,
    created_at timestamp,
    incoming boolean,
    resource_id bigint,
    resource_phone_number text,
    resource_type text,
    sent_at timestamp,
    updated_at timestamp,
    user_id bigint,
    user_phone_number text,
    PRIMARY KEY (id)
);

CREATE TABLE user_role (
    "index" integer,
    user_id bigint,
    "role" text,
    PRIMARY KEY ("index", user_id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE pipeline (
    id bigint,
    created_at timestamp,
    disabled boolean,
    "name" text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE document (
    id bigint,
    resource_id bigint,
    resource_type text,
    creator_id bigint,
    content_type text,
    created_at timestamp,
    download_url text,
    "name" text,
    "size" bigint,
    updated_at timestamp,
    PRIMARY KEY (id, resource_id, resource_type),
    FOREIGN KEY (creator_id) REFERENCES "user"(id)
);

CREATE TABLE call_outcome (
    id bigint,
    creator_id bigint,
    created_at timestamp,
    "name" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (creator_id) REFERENCES "user"(id)
);

CREATE TABLE "source" (
    id bigint,
    creator_id bigint,
    created_at timestamp,
    "name" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (creator_id) REFERENCES "user"(id)
);
