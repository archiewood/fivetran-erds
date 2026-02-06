CREATE TABLE mediation_group_country (
    "index" text,
    application_id text,
    mediation_group_id text,
    country text,
    PRIMARY KEY ("index", application_id, mediation_group_id),
    FOREIGN KEY (application_id) REFERENCES mediation_group(application_id),
    FOREIGN KEY (mediation_group_id) REFERENCES mediation_group(id)
);

CREATE TABLE mediation_group_instance (
    id text,
    application_id text,
    mediation_group_id text,
    countries_rate jsonb,
    group_rate text,
    is_bidder text,
    "name" text,
    network_name text,
    PRIMARY KEY (id, application_id, mediation_group_id),
    FOREIGN KEY (application_id) REFERENCES mediation_group(application_id),
    FOREIGN KEY (mediation_group_id) REFERENCES mediation_group(id)
);

CREATE TABLE mediation_group (
    id text,
    application_id text,
    ab_test text,
    ad_format text,
    floor_price text,
    group_name text,
    mediation_ad_unit_name text,
    mediation_unit_id text,
    "position" text,
    segments jsonb,
    PRIMARY KEY (id, application_id),
    FOREIGN KEY (application_id) REFERENCES application(id)
);

CREATE TABLE application (
    id text,
    app_name text,
    app_status text,
    bundle_id text,
    bundle_ref_id text,
    ccpa text,
    coppa text,
    creation_date text,
    icon text,
    network_reporting_api_iron_source text,
    platform text,
    taxonomy text,
    PRIMARY KEY (id)
);

CREATE TABLE application_advertising_unit (
    _fivetran_id text,
    application_id text,
    active_network_name text,
    "type" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (application_id) REFERENCES application(id)
);

CREATE TABLE creative_asset (
    creative_id text,
    id text,
    title_id text,
    usage_type text,
    PRIMARY KEY (creative_id, id),
    FOREIGN KEY (creative_id) REFERENCES creative(id),
    FOREIGN KEY (id) REFERENCES asset(id),
    FOREIGN KEY (title_id) REFERENCES title(id)
);

CREATE TABLE creative (
    id text,
    title_id text,
    languages text,
    "name" text,
    orientation text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (title_id) REFERENCES title(id)
);

CREATE TABLE audience (
    id text,
    bundle_id text,
    description text,
    has_active_campaigns text,
    last_modified text,
    "name" text,
    platform text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE asset (
    id text,
    title_id text,
    duration text,
    "name" text,
    orientation text,
    "source" text,
    "type" text,
    "value" text,
    PRIMARY KEY (id),
    FOREIGN KEY (title_id) REFERENCES title(id)
);

CREATE TABLE bidding (
    _fivetran_id text,
    campaign_report_fivetran_id text,
    application_id text,
    bid text,
    country text,
    PRIMARY KEY (_fivetran_id, campaign_report_fivetran_id),
    FOREIGN KEY (campaign_report_fivetran_id) REFERENCES campaign_report(_fivetran_id)
);

CREATE TABLE campaign_report (
    _fivetran_id text,
    ad_unit_name text,
    application_name text,
    campaign_name text,
    clicks text,
    completions text,
    country text,
    creative_name text,
    "date" text,
    device_type text,
    id text,
    impressions text,
    os text,
    spend text,
    title_name text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE placement (
    id text,
    application_id text,
    ab_version text,
    ad_delivery text,
    ad_unit text,
    capping_enabled text,
    capping_interval text,
    capping_limit text,
    "name" text,
    pacing_enabled text,
    pacing_minutes text,
    PRIMARY KEY (id, application_id),
    FOREIGN KEY (application_id) REFERENCES application(id)
);

CREATE TABLE title (
    id text,
    advertiser_id text,
    bundle_id text,
    "name" text,
    operating_system text,
    PRIMARY KEY (id)
);
