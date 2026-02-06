-- Tracking tables
-- They have common schema. Naming pattern is <entity>_tracking_history they just refer to a different entity that is tracked:
-- |List of Entities|
-- |-|
-- |creative|
-- |keyword|
-- |placement|
-- |product_target|
-- |Common Schema|
-- |-|
-- id 🔑
-- last_modified  🔑
-- <entity>_id ➤ <entity>_history
-- value

-- Dimension Tables
-- Dimension tables have common schema. They have a naming pattern <entity>_dimension_history.
-- |List of Entities|
-- |-|
-- campaign_dimension_history
-- creative_dimension_history
-- group_dimension_history
-- keyword_dimension_history
-- placement_dimension_history
-- product_target_dimension_history
-- publisher_dimension_history
-- |Common Schema|
-- |-|
-- id  🔑
-- last_modified  🔑
-- <entity>_id  ➤ <entity>_history
-- name
-- value

-- Legend
-- 🔑    =   primary key  
-- ➤     =   foreign key relation

CREATE TABLE group_history (
    id bigint,
    last_modified timestamp,
    campaign_id bigint,
    content_bid text,
    "name" text,
    pub_id bigint,
    search_bid text,
    "status" text,
    PRIMARY KEY (id, last_modified),
    FOREIGN KEY (campaign_id) REFERENCES campaign_history(last_modified)
);

CREATE TABLE creative_history (
    id bigint,
    last_modified timestamp,
    group_id bigint,
    description_1 text,
    description_2 text,
    display_url text,
    display_url_nav_1 text,
    display_url_nav_2 text,
    headline text,
    headline_2 text,
    pub_id bigint,
    "status" text,
    url text,
    PRIMARY KEY (id, last_modified),
    FOREIGN KEY (group_id) REFERENCES group_history(last_modified)
);

CREATE TABLE publisher_history (
    id bigint,
    last_modified timestamp,
    account_id bigint,
    "name" text,
    original_currency text,
    "type" integer,
    PRIMARY KEY (id, last_modified),
    FOREIGN KEY (account_id) REFERENCES account_history(last_modified)
);

CREATE TABLE product_target_fact (
    "date" text,
    conversion_event_id bigint,
    group_id bigint,
    product_target_id bigint,
    avg_cpc text,
    avg_pos text,
    clicks integer,
    conversions integer,
    impressions integer,
    last_modified timestamp,
    publisher_cost text,
    revenue text,
    PRIMARY KEY ("date", conversion_event_id, group_id, product_target_id),
    FOREIGN KEY (conversion_event_id) REFERENCES conversion_event(id),
    FOREIGN KEY (group_id) REFERENCES group_history(last_modified),
    FOREIGN KEY (product_target_id) REFERENCES product_target_history(last_modified)
);

CREATE TABLE campaign_history (
    id bigint,
    last_modified timestamp,
    publisher_id bigint,
    budget text,
    end_date text,
    "name" text,
    pub_id bigint,
    start_date text,
    "status" text,
    PRIMARY KEY (id, last_modified),
    FOREIGN KEY (publisher_id) REFERENCES publisher_history(last_modified)
);

CREATE TABLE creative_fact (
    "date" text,
    conversion_event_id bigint,
    creative_id bigint,
    group_id bigint,
    avg_cpc text,
    avg_pos text,
    clicks integer,
    conversions integer,
    impressions integer,
    last_modified timestamp,
    publisher_cost text,
    revenue text,
    PRIMARY KEY ("date", conversion_event_id, creative_id, group_id),
    FOREIGN KEY (conversion_event_id) REFERENCES conversion_event(id),
    FOREIGN KEY (creative_id) REFERENCES creative_history(last_modified),
    FOREIGN KEY (group_id) REFERENCES group_history(last_modified)
);

CREATE TABLE group_device_fact (
    "date" text,
    id bigint,
    conversion_event_id bigint,
    group_id bigint,
    avg_cpc text,
    avg_pos text,
    clicks integer,
    conversions integer,
    impressions integer,
    last_modified timestamp,
    potential_impressions text,
    publisher_cost text,
    revenue text,
    PRIMARY KEY ("date", id, conversion_event_id, group_id),
    FOREIGN KEY (conversion_event_id) REFERENCES conversion_event(id),
    FOREIGN KEY (group_id) REFERENCES group_history(last_modified)
);

CREATE TABLE product_target_history (
    id bigint,
    last_modified timestamp,
    group_id bigint,
    "name" text,
    pub_id bigint,
    "status" text,
    url text,
    PRIMARY KEY (id, last_modified),
    FOREIGN KEY (group_id) REFERENCES group_history(last_modified)
);

CREATE TABLE keyword_fact (
    "date" text,
    conversion_event_id bigint,
    group_id bigint,
    keyword_id bigint,
    avg_cpc text,
    avg_pos text,
    clicks integer,
    conversions integer,
    impressions integer,
    impressions_on_absolute_top integer,
    impressions_on_top integer,
    last_modified timestamp,
    potential_impressions text,
    potential_impressions_on_absolute_top integer,
    potential_impressions_on_top integer,
    publisher_cost text,
    revenue text,
    search_bid text,
    PRIMARY KEY ("date", conversion_event_id, group_id, keyword_id),
    FOREIGN KEY (conversion_event_id) REFERENCES conversion_event(id),
    FOREIGN KEY (group_id) REFERENCES group_history(last_modified),
    FOREIGN KEY (keyword_id) REFERENCES keyword_history(last_modified)
);

CREATE TABLE keyword_history (
    id bigint,
    last_modified timestamp,
    group_id bigint,
    keyword text,
    match_type text,
    min_bid text,
    pub_id bigint,
    quality_score bigint,
    "status" text,
    url text,
    PRIMARY KEY (id, last_modified),
    FOREIGN KEY (group_id) REFERENCES group_history(last_modified)
);

CREATE TABLE conversion_event (
    id bigint,
    abbreviation text,
    aggregate_to_conversions bigint,
    aggregate_to_revenue bigint,
    alias_id text,
    attribution_date text,
    last_modified timestamp,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE account_history (
    id bigint,
    last_modified timestamp,
    creation_date text,
    currency text,
    "name" text,
    timezone text,
    tracking_id text,
    PRIMARY KEY (id, last_modified)
);

CREATE TABLE placement_history (
    id bigint,
    last_modified timestamp,
    group_id bigint,
    keyword_url text,
    placement text,
    pub_id bigint,
    "status" text,
    PRIMARY KEY (id, last_modified),
    FOREIGN KEY (group_id) REFERENCES group_history(last_modified)
);

CREATE TABLE placement_fact (
    "date" text,
    conversion_event_id bigint,
    group_id bigint,
    placement_id bigint,
    avg_cpc text,
    avg_pos text,
    clicks integer,
    conversions integer,
    impressions integer,
    last_modified timestamp,
    publisher_cost text,
    revenue text,
    PRIMARY KEY ("date", conversion_event_id, group_id, placement_id),
    FOREIGN KEY (conversion_event_id) REFERENCES conversion_event(id),
    FOREIGN KEY (group_id) REFERENCES group_history(last_modified),
    FOREIGN KEY (placement_id) REFERENCES placement_history(last_modified)
);
