CREATE TABLE advertisers_rtb (
    _fivetran_id text,
    advertiser_data_id text,
    hidden text,
    text text,
    "value" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (advertiser_data_id) REFERENCES advertiser_data(id)
);

CREATE TABLE advertiser_data (
    id text,
    created_at text,
    currency text,
    features_enabled jsonb,
    "name" text,
    properties_campaign_type text,
    properties_is_archived text,
    properties_permission jsonb,
    "status" text,
    url text,
    PRIMARY KEY (id)
);

CREATE TABLE rtb_summary_stat_all_post (
    _fivetran_id text,
    advertiser_data_id text,
    campaign_cost text,
    clicks_count text,
    conversions_count text,
    conversions_value text,
    cr text,
    ctr text,
    "day" text,
    device_type text,
    imps_count text,
    subcampaign text,
    subcampaign_hash text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (advertiser_data_id) REFERENCES advertiser_data(id)
);

CREATE TABLE offer (
    id text,
    advertiser_data_id text,
    category_name text,
    currency text,
    full_name text,
    identifier text,
    image_details jsonb,
    "name" text,
    price text,
    "status" text,
    updated_at text,
    url text,
    -- custom_property_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (advertiser_data_id) REFERENCES advertiser_data(id)
);

CREATE TABLE rtb_summary_stat_post_view (
    _fivetran_id text,
    advertiser_data_id text,
    campaign_cost text,
    clicks_count text,
    conversions_count text,
    conversions_value text,
    cr text,
    ctr text,
    "day" text,
    device_type text,
    imps_count text,
    subcampaign text,
    subcampaign_hash text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (advertiser_data_id) REFERENCES advertiser_data(id)
);

CREATE TABLE conversion_all (
    _fivetran_id text,
    advertiser_data_id text,
    class text,
    commission_value text,
    cookie_hash text,
    hash text,
    identifier text,
    last_click_time text,
    last_impression_time text,
    "time" text,
    "value" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (advertiser_data_id) REFERENCES advertiser_data(id)
);

CREATE TABLE top_hosts_stat_click (
    _fivetran_id text,
    advertiser_data_id text,
    host text,
    "value" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (advertiser_data_id) REFERENCES advertiser_data(id)
);

CREATE TABLE top_in_apps_stat_imps (
    _fivetran_id text,
    advertiser_data_id text,
    app_name text,
    "value" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (advertiser_data_id) REFERENCES advertiser_data(id)
);

CREATE TABLE rtb_summary_stat_branding (
    _fivetran_id text,
    advertiser_data_id text,
    campaign_cost text,
    clicks_count text,
    ctr text,
    "day" text,
    device_type text,
    imps_count text,
    subcampaign text,
    subcampaign_hash text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (advertiser_data_id) REFERENCES advertiser_data(id)
);

CREATE TABLE rtb_stat_post_view (
    _fivetran_id text,
    advertiser_data_id text,
    campaign_cost text,
    clicks_count text,
    conversions_count text,
    conversions_value text,
    cr text,
    ctr text,
    "day" text,
    device_type text,
    imps_count text,
    subcampaign text,
    subcampaign_hash text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (advertiser_data_id) REFERENCES advertiser_data(id)
);

CREATE TABLE rtb_stat_attributed (
    _fivetran_id text,
    advertiser_data_id text,
    campaign_cost text,
    clicks_count text,
    conversions_count text,
    conversions_value text,
    cr text,
    ctr text,
    "day" text,
    device_type text,
    imps_count text,
    subcampaign text,
    subcampaign_hash text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (advertiser_data_id) REFERENCES advertiser_data(id)
);

CREATE TABLE rtb_stat_branding (
    _fivetran_id text,
    advertiser_data_id text,
    campaign_cost text,
    clicks_count text,
    ctr text,
    "day" text,
    device_type text,
    imps_count text,
    subcampaign text,
    subcampaign_hash text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (advertiser_data_id) REFERENCES advertiser_data(id)
);

CREATE TABLE campaign (
    id text,
    advertiser_data_id text,
    rate_card_id text,
    budget_daily text,
    budget_monthly text,
    creative_id jsonb,
    is_editable text,
    "name" text,
    "status" text,
    updated_at text,
    PRIMARY KEY (id, advertiser_data_id),
    FOREIGN KEY (advertiser_data_id) REFERENCES advertiser_data(id),
    FOREIGN KEY (rate_card_id) REFERENCES rate_card(id)
);

CREATE TABLE conversion_attributed (
    _fivetran_id text,
    advertiser_data_id text,
    class text,
    commission_value text,
    cookie_hash text,
    hash text,
    identifier text,
    last_click_time text,
    last_impression_time text,
    "time" text,
    "value" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (advertiser_data_id) REFERENCES advertiser_data(id)
);

CREATE TABLE advertisers_with_hash_contact_person (
    login text,
    advertisers_detail_id text,
    email text,
    "name" text,
    PRIMARY KEY (login),
    FOREIGN KEY (advertisers_detail_id) REFERENCES advertisers_detail(id)
);

CREATE TABLE advertisers_detail (
    id text,
    country text,
    feed_identifier text,
    properties_maximal_cpc text,
    properties_minimal_cpc text,
    version text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES advertiser_data(id)
);

CREATE TABLE top_in_apps_stat_click (
    _fivetran_id text,
    advertiser_data_id text,
    app_name text,
    "value" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (advertiser_data_id) REFERENCES advertiser_data(id)
);

CREATE TABLE creatives_preview (
    _fivetran_id text,
    advertiser_data_id text,
    rtb_creative_id text,
    height text,
    offers_number text,
    preview_url text,
    width text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (advertiser_data_id) REFERENCES advertiser_data(id),
    FOREIGN KEY (rtb_creative_id) REFERENCES rtb_creative(id)
);

CREATE TABLE rtb_creative (
    id text,
    advertiser_data_id text,
    "status" text,
    PRIMARY KEY (id, advertiser_data_id),
    FOREIGN KEY (advertiser_data_id) REFERENCES advertiser_data(id)
);

CREATE TABLE billing (
    _fivetran_id text,
    advertiser_data_id text,
    balance text,
    credit text,
    "day" text,
    debit text,
    operation text,
    "position" text,
    record_number text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (advertiser_data_id) REFERENCES advertiser_data(id)
);

CREATE TABLE top_hosts_stat_imps (
    _fivetran_id text,
    advertiser_data_id text,
    host text,
    "value" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (advertiser_data_id) REFERENCES advertiser_data(id)
);

CREATE TABLE conversion_all_post_click (
    _fivetran_id text,
    advertiser_data_id text,
    class text,
    commission_value text,
    cookie_hash text,
    hash text,
    identifier text,
    last_click_time text,
    last_impression_time text,
    "time" text,
    "value" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (advertiser_data_id) REFERENCES advertiser_data(id)
);

CREATE TABLE conversion_post_view (
    _fivetran_id text,
    advertiser_data_id text,
    class text,
    commission_value text,
    cookie_hash text,
    hash text,
    identifier text,
    last_click_time text,
    last_impression_time text,
    "time" text,
    "value" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (advertiser_data_id) REFERENCES advertiser_data(id)
);

CREATE TABLE rtb_stat_all_conversions (
    _fivetran_id text,
    advertiser_data_id text,
    campaign_cost text,
    clicks_count text,
    conversions_count text,
    conversions_value text,
    cr text,
    ctr text,
    "day" text,
    device_type text,
    imps_count text,
    subcampaign text,
    subcampaign_hash text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (advertiser_data_id) REFERENCES advertiser_data(id)
);

CREATE TABLE client (
    company_name text,
    advertiser_data_id text,
    city text,
    country text,
    email text,
    postal_code text,
    street_1 text,
    street_2 text,
    vat_number text,
    PRIMARY KEY (company_name, advertiser_data_id),
    FOREIGN KEY (advertiser_data_id) REFERENCES advertiser_data(id)
);

CREATE TABLE offer_category (
    category_id text,
    advertiser_data_id text,
    active_offers_number text,
    identifier text,
    "name" text,
    PRIMARY KEY (category_id),
    FOREIGN KEY (advertiser_data_id) REFERENCES advertiser_data(id)
);

CREATE TABLE win_rate_stat (
    _fivetran_id text,
    advertiser_data_id text,
    "day" text,
    total text,
    won text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (advertiser_data_id) REFERENCES advertiser_data(id)
);

CREATE TABLE rate_card (
    id text,
    advertiser_data_id text,
    category_rate_card text,
    cpa_post_click_buyer text,
    cpa_post_click_shopper text,
    cpa_post_click_visitor text,
    cpa_post_view_buyer text,
    cpa_post_view_shopper text,
    cpa_post_view_visitor text,
    cpc_buyer text,
    cpc_shopper text,
    cpc_visitor text,
    cpm_buyer text,
    cpm_shopper text,
    cpm_visitor text,
    cps_post_click_buyer text,
    cps_post_click_shopper text,
    cps_post_click_visitor text,
    cps_post_view_buyer text,
    cps_post_view_shopper text,
    cps_post_view_visitor text,
    PRIMARY KEY (id),
    FOREIGN KEY (advertiser_data_id) REFERENCES advertiser_data(id)
);

CREATE TABLE rtb_stat_all_post (
    _fivetran_id text,
    advertiser_data_id text,
    campaign_cost text,
    clicks_count text,
    conversions_count text,
    conversions_value text,
    cr text,
    ctr text,
    "day" text,
    device_type text,
    imps_count text,
    subcampaign text,
    subcampaign_hash text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (advertiser_data_id) REFERENCES advertiser_data(id)
);

CREATE TABLE last_seen_tags_stat (
    _fivetran_id text,
    advertiser_data_id text,
    clicks_count jsonb,
    imps_count jsonb,
    last_tag_hour text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (advertiser_data_id) REFERENCES advertiser_data(id)
);

CREATE TABLE users (
    id text,
    count_convention text,
    email text,
    is_client_user text,
    is_demo_user text,
    is_force_logged_in text,
    is_mfa_enabled text,
    login text,
    mfa_suggest text,
    permission jsonb,
    should_change_password text,
    PRIMARY KEY (id)
);
