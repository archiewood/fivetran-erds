CREATE TABLE knowledge_base_product (
    knowledge_base_id text,
    product_id text,
    PRIMARY KEY (knowledge_base_id, product_id),
    FOREIGN KEY (knowledge_base_id) REFERENCES knowledge_base(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE knowledge_base (
    id text,
    access_level text,
    answer text,
    "comment" text,
    content text,
    created_at text,
    is_favorite text,
    modified_at text,
    page_number text,
    question_number text,
    "source" text,
    subtype jsonb,
    PRIMARY KEY (id)
);

CREATE TABLE topic_update (
    id text,
    topic_id text,
    created_at text,
    message text,
    sp_audience text,
    updated_at text,
    PRIMARY KEY (id, topic_id),
    FOREIGN KEY (topic_id) REFERENCES topic(id)
);

CREATE TABLE topic (
    id text,
    category text,
    created_at text,
    hidden text,
    is_pinned text,
    subject text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE organization (
    id text,
    "name" text,
    plan text,
    primary_domain text,
    sp_custom_domain text,
    PRIMARY KEY (id)
);

CREATE TABLE account_domain (
    "index" text,
    account_id text,
    domain text,
    PRIMARY KEY ("index", account_id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE account (
    id text,
    nda_provider text,
    access_expires_at text,
    created_at text,
    description text,
    is_nda_done text,
    "name" text,
    nda_recipient_email text,
    nda_recipient_first_name text,
    nda_recipient_last_name text,
    num_member text,
    permission_profile_id text,
    review_status text,
    sfdc_account_id text,
    "source" text,
    PRIMARY KEY (id),
    FOREIGN KEY (nda_provider) REFERENCES organization_nda_provider(provider)
);

CREATE TABLE access_request (
    id text,
    product_id text,
    auto_approve_decline_reason text,
    company_name text,
    country text,
    created_at text,
    custom_checkbox_checked text,
    email text,
    first_name text,
    item_kind text,
    item_uid text,
    last_name text,
    relationship text,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE portal_product_card (
    "index" text,
    portal_product_id text,
    card_type text,
    title text,
    PRIMARY KEY ("index", portal_product_id),
    FOREIGN KEY (portal_product_id) REFERENCES product(id)
);

CREATE TABLE portal_product_data (
    id text,
    portal_product_id text,
    card_type text,
    choice text,
    explanation text,
    has_file text,
    href text,
    list_entry jsonb,
    maturity text,
    recurrence text,
    title text,
    PRIMARY KEY (id, portal_product_id),
    FOREIGN KEY (portal_product_id) REFERENCES product(id)
);

CREATE TABLE product (
    id text,
    "name" text,
    show text,
    PRIMARY KEY (id)
);

CREATE TABLE organization_permission_profile (
    id text,
    _fivetran_id text,
    description text,
    "name" text,
    PRIMARY KEY (id, _fivetran_id),
    FOREIGN KEY (_fivetran_id) REFERENCES organization_setting(_fivetran_id)
);

CREATE TABLE organization_nda_provider (
    provider text,
    _fivetran_id text,
    label text,
    member_required_for_nda text,
    PRIMARY KEY (provider, _fivetran_id),
    FOREIGN KEY (_fivetran_id) REFERENCES organization_setting(_fivetran_id)
);

CREATE TABLE organization_setting (
    _fivetran_id text,
    default_expiration text,
    default_nda_provider text,
    member_required_for_default_nda text,
    permission_default_profile_id text,
    PRIMARY KEY (_fivetran_id)
);
