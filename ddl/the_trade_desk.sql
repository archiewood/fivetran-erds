-- CUSTOM REPORTING TABLES
-- Reporting tables list available in The Trade Desk UI.

CREATE TABLE bid_list_dimension (
    "index" integer,
    bid_list_id text,
    dimension text,
    PRIMARY KEY ("index", bid_list_id),
    FOREIGN KEY (bid_list_id) REFERENCES bid_list(id)
);

CREATE TABLE campaign_conversion_reporting_column (
    reporting_column_id bigint,
    tracking_tag_id text,
    campaign_id text,
    cross_device_attribution_model_id text,
    include_in_custom_cpa boolean,
    tracking_tag_name text,
    weight double precision,
    PRIMARY KEY (reporting_column_id, tracking_tag_id, campaign_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id)
);

CREATE TABLE campaign_associated_bid_list (
    bid_list_id text,
    campaign_id text,
    is_default_for_dimension boolean,
    is_enabled boolean,
    PRIMARY KEY (bid_list_id, campaign_id),
    FOREIGN KEY (bid_list_id) REFERENCES bid_list(id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id)
);

CREATE TABLE campaign_default_bid_list (
    bid_list_id text,
    campaign_id text,
    PRIMARY KEY (bid_list_id, campaign_id),
    FOREIGN KEY (bid_list_id) REFERENCES bid_list(id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id)
);

CREATE TABLE campaign_flight (
    id text,
    campaign_id text,
    budget_in_advertiser_currency double precision,
    budget_in_impressions bigint,
    daily_target_in_advertiser_currency double precision,
    daily_target_in_impressions bigint,
    end_date_exclusive_utc text,
    start_date_inclusive_utc text,
    PRIMARY KEY (id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id)
);

CREATE TABLE advertiser (
    id text,
    category_id bigint,
    partner_id text,
    advertiser_name text,
    attribution_click_lookback_window_in_seconds bigint,
    attribution_impression_lookback_window_in_seconds bigint,
    availability text,
    click_dedup_window_in_seconds bigint,
    conversion_dedup_window_in_seconds bigint,
    currency_code text,
    default_right_media_offer_type_id bigint,
    description text,
    domain_address text,
    ignore_referral_url_in_conversion boolean,
    industry_category_id bigint,
    is_ballot_measure boolean,
    is_candidate_election boolean,
    logo_url text,
    vetting_status text,
    PRIMARY KEY (id),
    FOREIGN KEY (category_id) REFERENCES advertiser_category(id),
    FOREIGN KEY (partner_id) REFERENCES partner(id)
);

-- Report Metadata
CREATE TABLE report_execution (
    report_execution_id bigint,
    report_schedule_id bigint,
    disabled_reason text,
    last_state_change_utc text,
    report_end_date_exclusive text,
    report_execution_state text,
    report_schedule_name text,
    report_start_date_inclusive text,
    timezone text,
    PRIMARY KEY (report_execution_id),
    FOREIGN KEY (report_schedule_id) REFERENCES report_schedule(report_schedule_id)
);

CREATE TABLE campaign (
    id text,
    advertiser_id text,
    auto_allocator_enabled boolean,
    auto_prioritization_enabled boolean,
    availability text,
    budget_in_impressions bigint,
    campaign_name text,
    campaign_type text,
    created_at_utc text,
    custom_cpaclick_weight double precision,
    custom_cpatype text,
    custom_cpaviewthrough_weight double precision,
    daily_budget_in_impressions bigint,
    deprecate_household_targeting_and_attribution boolean,
    description text,
    end_date text,
    include_defaults_from_advertiser boolean,
    is_ballot_measure boolean,
    minimum_ad_group_spend_in_advertiser_currency double precision,
    objective text,
    pacing_mode text,
    primary_channel text,
    start_date text,
    timezone text,
    PRIMARY KEY (id),
    FOREIGN KEY (advertiser_id) REFERENCES advertiser(id)
);

CREATE TABLE advertiser_associated_bid_list (
    advertiser_id text,
    bid_list_id text,
    is_default_for_dimension boolean,
    is_enabled boolean,
    PRIMARY KEY (advertiser_id, bid_list_id),
    FOREIGN KEY (advertiser_id) REFERENCES advertiser(id),
    FOREIGN KEY (bid_list_id) REFERENCES bid_list(id)
);

CREATE TABLE partner (
    id text,
    partner_name text,
    PRIMARY KEY (id)
);

-- Report Metadata
CREATE TABLE report_schedule (
    report_schedule_id bigint,
    ad_group_filters jsonb,
    advertiser_filters jsonb,
    campaign_filters jsonb,
    creation_date_utc text,
    include_headers boolean,
    is_completed boolean,
    lookback_days bigint,
    partner_filters jsonb,
    report_date_format text,
    report_date_range text,
    report_end_date_exclusive text,
    report_file_format text,
    report_frequency text,
    report_numeric_format text,
    report_schedule_name text,
    report_schedule_status text,
    report_start_date_inclusive text,
    report_template_id bigint,
    requested_by_user_name text,
    schedule_start_date text,
    timezone text,
    PRIMARY KEY (report_schedule_id)
);

-- Report Metadata
CREATE TABLE report_template_header (
    report_template_id text,
    created_by_user_name text,
    format text,
    "name" text,
    "type" text,
    PRIMARY KEY (report_template_id)
);

CREATE TABLE category_mapping (
    "index" integer,
    category_id bigint,
    external_id text,
    taxonomy_id text,
    PRIMARY KEY ("index", category_id),
    FOREIGN KEY (category_id) REFERENCES advertiser_category(id)
);

CREATE TABLE advertiser_candidate_profile (
    political_data_id text,
    advertiser_id text,
    audience_description text,
    candidate_name text,
    disclaimer_notice text,
    election_state text,
    federal_verification_id text,
    file_location_in_s_3 text,
    geo_description text,
    paying_entity_address text,
    paying_entity_email_address text,
    paying_entity_executive_name text,
    paying_entity_executive_title text,
    paying_entity_name text,
    state_verification_id text,
    PRIMARY KEY (political_data_id),
    FOREIGN KEY (advertiser_id) REFERENCES advertiser(id)
);

CREATE TABLE advertiser_default_bid_list (
    advertiser_id text,
    bid_list_id text,
    PRIMARY KEY (advertiser_id, bid_list_id),
    FOREIGN KEY (advertiser_id) REFERENCES advertiser(id),
    FOREIGN KEY (bid_list_id) REFERENCES bid_list(id)
);

CREATE TABLE partner_associated_bid_list (
    bid_list_id text,
    partner_id text,
    is_default_for_dimension boolean,
    is_enabled boolean,
    PRIMARY KEY (bid_list_id, partner_id),
    FOREIGN KEY (bid_list_id) REFERENCES bid_list(id),
    FOREIGN KEY (partner_id) REFERENCES partner(id)
);

CREATE TABLE advertiser_category (
    id bigint,
    "name" text,
    taxonomy_id text,
    taxonomy_name text,
    taxonomy_version text,
    PRIMARY KEY (id)
);

CREATE TABLE bid_list (
    id text,
    adjustment_type text,
    bid_list_type text,
    is_available_for_library_use boolean,
    is_global boolean,
    "name" text,
    owner text,
    owner_id text,
    resolution_type text,
    "source" text,
    PRIMARY KEY (id)
);
