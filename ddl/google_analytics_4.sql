CREATE TABLE accounts (
    "name" text,
    create_time timestamp,
    display_name text,
    region_code text,
    update_time timestamp,
    PRIMARY KEY ("name")
);

CREATE TABLE custom_dimensions (
    "name" text,
    description text,
    disallow_ads_personalization boolean,
    display_name text,
    parameter_name text,
    scope text,
    PRIMARY KEY ("name")
);

CREATE TABLE google_ads_links (
    "name" text,
    ads_personalization_enabled boolean,
    can_manage_clients boolean,
    create_time timestamp,
    creator_email_address text,
    customer_id text,
    update_time timestamp,
    PRIMARY KEY ("name")
);

CREATE TABLE properties (
    "name" text,
    account text,
    create_time timestamp,
    currency_code text,
    delete_time timestamp,
    display_name text,
    expire_time timestamp,
    industry_category text,
    parent text,
    property_type text,
    service_level text,
    time_zone text,
    update_time timestamp,
    PRIMARY KEY ("name")
);

CREATE TABLE conversion_events (
    "name" text,
    create_time timestamp,
    custom boolean,
    deletable boolean,
    event_name text,
    PRIMARY KEY ("name")
);

CREATE TABLE custom_metrics (
    "name" text,
    description text,
    display_name text,
    measurement_unit text,
    parameter_name text,
    restricted_metric_type jsonb,
    scope text,
    PRIMARY KEY ("name")
);
