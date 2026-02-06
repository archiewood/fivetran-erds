CREATE TABLE account_phone_number (
    "index" text,
    account_id text,
    phone_number text,
    PRIMARY KEY ("index", account_id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE account (
    id text,
    brand_status text,
    children_count text,
    contacts_enabled text,
    family_count text,
    has_cumulative_plan text,
    logo text,
    messaging_restricted text,
    multi_user text,
    "name" text,
    office_hour jsonb,
    shortened_link_domain text,
    tcr_campaign jsonb,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE user_by_organization (
    _fivetran_id text,
    account_id text,
    account_created text,
    account_name text,
    end_date text,
    organization_name text,
    parent_account_name text,
    start_date text,
    user_created text,
    user_name text,
    user_role text,
    -- custom_* (dynamic column),
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE message_deliverability (
    _fivetran_id text,
    account_id text,
    account_name text,
    active_user text,
    delivered_messages text,
    delivered_rate text,
    end_date text,
    failed_messages text,
    failed_rate text,
    organization_name text,
    parent_account_name text,
    received_messages text,
    sent_and_received_ratio text,
    sent_messages text,
    start_date text,
    user_name text,
    -- custom_* (dynamic column),
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE user_engagement (
    _fivetran_id text,
    account_id text,
    account_name text,
    active_conversations text,
    active_conversations_response_rate text,
    active_conversations_with_responses text,
    customer_initiated_conversations text,
    end_date text,
    messages_per_conversation text,
    organization_name text,
    parent_account_name text,
    start_date text,
    total_response_rate text,
    user_name text,
    -- custom_* (dynamic column),
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);
