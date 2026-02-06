CREATE TABLE contact (
    id text,
    address_city text,
    address_country text,
    address_email text,
    address_mobile text,
    address_phone text,
    address_state text,
    address_street_1 text,
    address_street_2 text,
    address_zip text,
    created_at text,
    created_by text,
    deleted_at text,
    "name" text,
    "position" text,
    title text,
    "type" text,
    updated_at text,
    updated_by text,
    works_at text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE account_client_contact (
    account_id text,
    id text,
    is_active text,
    is_primary text,
    PRIMARY KEY (account_id, id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (id) REFERENCES contact(id)
);

CREATE TABLE account_team (
    id text,
    account_id text,
    email text,
    "name" text,
    "role" text,
    share text,
    "type" text,
    PRIMARY KEY (id, account_id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE account_type (
    "index" text,
    account_id text,
    "type" text,
    PRIMARY KEY ("index", account_id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE account (
    id text,
    parent_account_id text,
    address_city text,
    address_country text,
    address_email text,
    address_mobile text,
    address_phone text,
    address_state text,
    address_street_1 text,
    address_street_2 text,
    address_zip text,
    category text,
    created_at text,
    created_by text,
    deleted_at text,
    discount text,
    holding_company text,
    legacy_id text,
    "name" text,
    note text,
    region text,
    segment text,
    shell_record text,
    sub_category text,
    updated_at text,
    updated_by text,
    website text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (parent_account_id) REFERENCES account(id)
);

CREATE TABLE deal_member (
    id text,
    deal_id text,
    user_id text,
    product text,
    "role" text,
    seller_type text,
    share text,
    PRIMARY KEY (id, deal_id),
    FOREIGN KEY (deal_id) REFERENCES deal(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE deal_contact (
    deal_id text,
    id text,
    email text,
    "role" text,
    PRIMARY KEY (deal_id, id),
    FOREIGN KEY (deal_id) REFERENCES deal(id),
    FOREIGN KEY (id) REFERENCES contact(id)
);

CREATE TABLE deal_integration (
    id text,
    deal_id text,
    external_id text,
    external_type text,
    PRIMARY KEY (id, deal_id),
    FOREIGN KEY (deal_id) REFERENCES deal(id)
);

CREATE TABLE deal (
    id text,
    advertiser_id text,
    advertiser_name text,
    agency_id text,
    agency_name text,
    budget text,
    budget_loc text,
    closed_at text,
    closed_comments text,
    closed_reason text,
    created_at text,
    created_by text,
    currency text,
    deleted_at text,
    end_date text,
    lead_id text,
    "name" text,
    next_steps text,
    "source" text,
    stage_id text,
    stage_name text,
    start_date text,
    "type" text,
    updated_at text,
    updated_by text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE user_team_member (
    id text,
    users_id text,
    PRIMARY KEY (id, users_id),
    FOREIGN KEY (id) REFERENCES users(id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    average_deal_size text,
    created_at text,
    created_by text,
    email text,
    employee_id text,
    first_name text,
    is_active text,
    last_name text,
    team_created_at text,
    team_deleted_at text,
    team_id text,
    team_leader_email text,
    team_leader_id text,
    team_members_count text,
    team_name text,
    team_parent_id text,
    team_parent_name text,
    team_top_parent_id text,
    team_top_parent_name text,
    team_type text,
    team_updated_at text,
    title text,
    "type" text,
    updated_at text,
    updated_by text,
    win_rate text,
    PRIMARY KEY (id)
);

CREATE TABLE activity_contact (
    activity_id text,
    id text,
    PRIMARY KEY (activity_id, id),
    FOREIGN KEY (activity_id) REFERENCES activity(id),
    FOREIGN KEY (id) REFERENCES contact(id)
);

CREATE TABLE activity (
    id text,
    deal_id text,
    advertiser_id text,
    advertiser_name text,
    agency_id text,
    agency_name text,
    "comment" text,
    created_at text,
    created_by text,
    happened_at text,
    lead_id text,
    lead_name text,
    publisher_id text,
    publisher_name text,
    type_id text,
    type_name text,
    updated_at text,
    updated_by text,
    user_name text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (deal_id) REFERENCES deal(id)
);
