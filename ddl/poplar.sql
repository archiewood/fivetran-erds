CREATE TABLE active_campaign (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE audience (
    id text,
    description text,
    member_count text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE campaign_mailing (
    id text,
    campaign_id text,
    creative_id text,
    address_1 text,
    address_2 text,
    address_city text,
    address_company text,
    address_external_id text,
    address_name text,
    address_postal_code text,
    address_state_name text,
    back_url text,
    created_at text,
    front_url text,
    merge_tags jsonb,
    pdf_url text,
    send_at text,
    "state" text,
    total_cost text,
    PRIMARY KEY (id, campaign_id),
    FOREIGN KEY (campaign_id) REFERENCES active_campaign(id),
    FOREIGN KEY (creative_id) REFERENCES campaign_creative(id)
);

CREATE TABLE campaign_creative_rate (
    "index" text,
    campaign_id text,
    creative_id text,
    "name" text,
    offset_minimum text,
    price text,
    rate_type text,
    PRIMARY KEY ("index", campaign_id, creative_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign_creative(campaign_id),
    FOREIGN KEY (creative_id) REFERENCES campaign_creative(id)
);

CREATE TABLE campaign_creative (
    id text,
    campaign_id text,
    creative_type text,
    format text,
    image_format text,
    is_default text,
    mail_type text,
    merge_tags jsonb,
    "name" text,
    thumbnail_url text,
    PRIMARY KEY (id, campaign_id),
    FOREIGN KEY (campaign_id) REFERENCES active_campaign(id)
);
