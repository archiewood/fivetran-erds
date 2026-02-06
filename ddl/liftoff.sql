CREATE TABLE creative (
    id text,
    created_at text,
    creative_type text,
    full_html_preview_url text,
    height text,
    "name" text,
    preview_url text,
    width text,
    PRIMARY KEY (id)
);

CREATE TABLE app (
    id text,
    app_store_id text,
    bundle_id text,
    "name" text,
    optimization_event_id text,
    optimization_event_name text,
    platform text,
    "state" text,
    title text,
    PRIMARY KEY (id)
);

CREATE TABLE event (
    id text,
    app_id text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (app_id) REFERENCES app(id)
);

CREATE TABLE campaign (
    id text,
    app_id text,
    campaign_type text,
    max_os_version text,
    min_os_version text,
    "name" text,
    "state" text,
    state_last_changed_at text,
    tracker_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (app_id) REFERENCES app(id)
);

CREATE TABLE report (
    _fivetran_id text,
    app_id text,
    campaign_id text,
    creative_id text,
    ad_format text,
    clicks text,
    country_code text,
    cpa text,
    cpc text,
    cpi text,
    cpm text,
    ctr text,
    "date" text,
    event_number text,
    impressions text,
    installs text,
    publisher_app_store_id text,
    publisher_name text,
    skan_installs_with_conversion_value text,
    skan_installs_with_no_conversion_value text,
    spend text,
    -- custom_* (dynamic column),
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (app_id) REFERENCES app(id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (creative_id) REFERENCES creative(id)
);
