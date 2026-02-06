CREATE TABLE campaign_report (
    _fivetran_id text,
    campaign_id text,
    creative_instance_id text,
    creative_set_id text,
    advertiser_name text,
    attribution_window_days text,
    campaign_name text,
    click_count text,
    click_through_conversion_count text,
    conversion_count text,
    country text,
    creative_body text,
    creative_set_name text,
    creative_title text,
    creative_url text,
    day_or_hour text,
    dismissed_count text,
    impression_count text,
    os text,
    segment text,
    site_visit_count text,
    spend text,
    view_through_conversion_count text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (campaign_id) REFERENCES advertiser_campaign(id),
    FOREIGN KEY (creative_instance_id) REFERENCES advertiser_campaign_ad_set_ads(id),
    FOREIGN KEY (creative_set_id) REFERENCES advertiser_campaign_ad_set(id)
);

CREATE TABLE advertiser_campaign_ad_set_ads (
    id text,
    ad_set_id text,
    advertiser_id text,
    campaign_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (ad_set_id) REFERENCES advertiser_campaign_ad_set(id),
    FOREIGN KEY (advertiser_id) REFERENCES advertiser_campaign_ad_set(advertiser_id),
    FOREIGN KEY (campaign_id) REFERENCES advertiser_campaign_ad_set(campaign_id)
);

CREATE TABLE advertiser_campaign_ad_set (
    id text,
    advertiser_id text,
    campaign_id text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (advertiser_id) REFERENCES advertiser_campaign(advertiser_id),
    FOREIGN KEY (campaign_id) REFERENCES advertiser_campaign(id)
);

CREATE TABLE advertiser_campaign (
    id text,
    advertiser_id text,
    end_at text,
    format text,
    "name" text,
    start_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (advertiser_id) REFERENCES advertiser(id)
);

CREATE TABLE advertiser (
    id text,
    "name" text,
    "state" text,
    PRIMARY KEY (id)
);
