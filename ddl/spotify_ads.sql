CREATE TABLE ad_set_audience_exclusion (
    audience_exclusion_id text,
    ad_set_id text,
    ad_set_updated_at timestamp,
    PRIMARY KEY (audience_exclusion_id, ad_set_id, ad_set_updated_at),
    FOREIGN KEY (ad_set_id) REFERENCES ad_set(id),
    FOREIGN KEY (ad_set_updated_at) REFERENCES ad_set(updated_at)
);

CREATE TABLE audience (
    id text,
    updated_at timestamp,
    ad_account_id text,
    created_at timestamp,
    description text,
    "name" text,
    seed_audience_id text,
    size_max integer,
    size_min integer,
    "status" text,
    "type" text,
    PRIMARY KEY (id, updated_at, ad_account_id),
    FOREIGN KEY (ad_account_id) REFERENCES ad_account(id)
);

CREATE TABLE ad_set_geo_target_dma (
    dma_id text,
    ad_set_id text,
    ad_set_updated_at timestamp,
    PRIMARY KEY (dma_id, ad_set_id, ad_set_updated_at),
    FOREIGN KEY (ad_set_id) REFERENCES ad_set(id),
    FOREIGN KEY (ad_set_updated_at) REFERENCES ad_set(updated_at)
);

CREATE TABLE ad_set_geo_target_post_code (
    post_code_id text,
    ad_set_id text,
    ad_set_updated_at timestamp,
    PRIMARY KEY (post_code_id, ad_set_id, ad_set_updated_at),
    FOREIGN KEY (ad_set_id) REFERENCES ad_set(id),
    FOREIGN KEY (ad_set_updated_at) REFERENCES ad_set(updated_at)
);

CREATE TABLE video_asset (
    ad_account_id text,
    id text,
    updated_at timestamp,
    aspect_ratio text,
    created_at timestamp,
    duration_ms integer,
    file_type text,
    "name" text,
    "status" text,
    thumbnail_url text,
    url text,
    PRIMARY KEY (ad_account_id, id, updated_at)
);

CREATE TABLE ad_category (
    id text,
    "name" text,
    parent_category text,
    PRIMARY KEY (id)
);

CREATE TABLE audio_asset (
    ad_account_id text,
    id text,
    updated_at timestamp,
    audio_type text,
    canvas_asset_id text,
    created_at timestamp,
    duration_ms integer,
    file_type text,
    "name" text,
    "status" text,
    url text,
    PRIMARY KEY (ad_account_id, id, updated_at)
);

CREATE TABLE ad_set_interest (
    interest_id text,
    ad_set_id text,
    ad_set_updated_at timestamp,
    PRIMARY KEY (interest_id, ad_set_id, ad_set_updated_at),
    FOREIGN KEY (ad_set_id) REFERENCES ad_set(id),
    FOREIGN KEY (ad_set_updated_at) REFERENCES ad_set(updated_at)
);

CREATE TABLE ad_set_geo_target_city (
    city_id text,
    ad_set_id text,
    ad_set_updated_at timestamp,
    PRIMARY KEY (city_id, ad_set_id, ad_set_updated_at),
    FOREIGN KEY (ad_set_id) REFERENCES ad_set(id),
    FOREIGN KEY (ad_set_updated_at) REFERENCES ad_set(updated_at)
);

CREATE TABLE ad_set (
    id text,
    updated_at timestamp,
    campaign_id text,
    category text,
    geo_target_country_code text,
    target_language text,
    asset_format text,
    bid_micro_amount bigint,
    bid_optimization_goal text,
    bid_strategy text,
    budget_currency text,
    budget_micro_amount bigint,
    budget_type text,
    cost_model text,
    created_at timestamp,
    delivery text,
    end_time timestamp,
    "name" text,
    promotion_goal text,
    promotion_target_id text,
    reject_reason text,
    start_time timestamp,
    "status" text,
    PRIMARY KEY (id, updated_at),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (category) REFERENCES ad_category(id),
    FOREIGN KEY (geo_target_country_code) REFERENCES geo_target(id),
    FOREIGN KEY (target_language) REFERENCES language(id)
);

CREATE TABLE ad_set_platform (
    platform text,
    ad_set_id text,
    ad_set_updated_at timestamp,
    PRIMARY KEY (platform, ad_set_id, ad_set_updated_at),
    FOREIGN KEY (ad_set_id) REFERENCES ad_set(id),
    FOREIGN KEY (ad_set_updated_at) REFERENCES ad_set(updated_at)
);

CREATE TABLE ad_set_artist (
    artist_id text,
    ad_set_id text,
    ad_set_updated_at timestamp,
    PRIMARY KEY (artist_id, ad_set_id, ad_set_updated_at),
    FOREIGN KEY (ad_set_id) REFERENCES ad_set(id),
    FOREIGN KEY (ad_set_updated_at) REFERENCES ad_set(updated_at)
);

CREATE TABLE geo_target (
    id text,
    country_code text,
    "name" text,
    parent_geo_name text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE business (
    id text,
    updated_at timestamp,
    created_at timestamp,
    "name" text,
    "status" text,
    "type" text,
    PRIMARY KEY (id, updated_at)
);

CREATE TABLE ad_set_placement (
    placement text,
    ad_set_id text,
    ad_set_updated_at timestamp,
    PRIMARY KEY (placement, ad_set_id, ad_set_updated_at),
    FOREIGN KEY (ad_set_id) REFERENCES ad_set(id),
    FOREIGN KEY (ad_set_updated_at) REFERENCES ad_set(updated_at)
);

CREATE TABLE ad_account (
    id text,
    updated_at timestamp,
    business_id text,
    ad_account_role text,
    billing_address_city text,
    billing_address_name text,
    billing_address_postal_code text,
    billing_address_region text,
    billing_address_street text,
    billing_address_tax_region text,
    country_code text,
    created_at timestamp,
    currency_code text,
    display_name text,
    industry text,
    legal_entity_name text,
    "name" text,
    "status" text,
    status_reason text,
    tax_id text,
    website text,
    PRIMARY KEY (id, updated_at),
    FOREIGN KEY (business_id) REFERENCES business(id)
);

CREATE TABLE ad_set_genre (
    genre_id text,
    ad_set_id text,
    ad_set_updated_at timestamp,
    PRIMARY KEY (genre_id, ad_set_id, ad_set_updated_at),
    FOREIGN KEY (ad_set_id) REFERENCES ad_set(id),
    FOREIGN KEY (ad_set_updated_at) REFERENCES ad_set(updated_at)
);

CREATE TABLE artist (
    id text,
    images text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE playlist (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE image_asset (
    ad_account_id text,
    id text,
    updated_at timestamp,
    created_at timestamp,
    file_type text,
    image_type text,
    "name" text,
    "status" text,
    url text,
    PRIMARY KEY (ad_account_id, id, updated_at)
);

CREATE TABLE genre (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE ad_set_playlist (
    playlist_id text,
    ad_set_id text,
    ad_set_updated_at timestamp,
    PRIMARY KEY (playlist_id, ad_set_id, ad_set_updated_at),
    FOREIGN KEY (ad_set_id) REFERENCES ad_set(id),
    FOREIGN KEY (ad_set_updated_at) REFERENCES ad_set(updated_at)
);

CREATE TABLE ad_set_podcast_episode_topic (
    podcast_episode_topic_id text,
    ad_set_id text,
    ad_set_updated_at timestamp,
    PRIMARY KEY (podcast_episode_topic_id, ad_set_id, ad_set_updated_at),
    FOREIGN KEY (ad_set_id) REFERENCES ad_set(id),
    FOREIGN KEY (ad_set_updated_at) REFERENCES ad_set(updated_at)
);

CREATE TABLE language (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE ad (
    id text,
    updated_at timestamp,
    ad_account_id text,
    ad_set_id text,
    ad_preview_url text,
    advertiser_name text,
    asset_id text,
    call_to_action_clickthrough_url text,
    call_to_action_language text,
    call_to_action_text text,
    companion_asset_id text,
    created_at timestamp,
    delivery text,
    logo_asset_id text,
    "name" text,
    reject_reason text,
    "status" text,
    tagline text,
    user_uploaded_image text,
    PRIMARY KEY (id, updated_at, ad_account_id),
    FOREIGN KEY (ad_account_id) REFERENCES ad_account(id),
    FOREIGN KEY (ad_set_id) REFERENCES ad_set(id)
);

CREATE TABLE ad_set_gender (
    gender text,
    ad_set_id text,
    ad_set_updated_at timestamp,
    PRIMARY KEY (gender, ad_set_id, ad_set_updated_at),
    FOREIGN KEY (ad_set_id) REFERENCES ad_set(id),
    FOREIGN KEY (ad_set_updated_at) REFERENCES ad_set(updated_at)
);

CREATE TABLE ad_set_audience (
    audience_id text,
    ad_set_id text,
    ad_set_updated_at timestamp,
    PRIMARY KEY (audience_id, ad_set_id, ad_set_updated_at),
    FOREIGN KEY (ad_set_id) REFERENCES ad_set(id),
    FOREIGN KEY (ad_set_updated_at) REFERENCES ad_set(updated_at)
);

CREATE TABLE sensitive_topic (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE interest (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE ad_set_frequency_cap (
    frequency_period integer,
    frequency_unit text,
    ad_set_id text,
    ad_set_updated_at timestamp,
    max_impressions integer,
    PRIMARY KEY (frequency_period, frequency_unit, ad_set_id, ad_set_updated_at),
    FOREIGN KEY (ad_set_id) REFERENCES ad_set(id),
    FOREIGN KEY (ad_set_updated_at) REFERENCES ad_set(updated_at)
);

CREATE TABLE podcast_show (
    id text,
    images text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE ad_third_party_tracking (
    "index" integer,
    ad_id text,
    ad_updated_at timestamp,
    measurement_partner text,
    url text,
    PRIMARY KEY ("index", ad_id, ad_updated_at),
    FOREIGN KEY (ad_id) REFERENCES ad(id),
    FOREIGN KEY (ad_updated_at) REFERENCES ad(updated_at)
);

CREATE TABLE ad_set_conversion_event (
    "index" integer,
    ad_set_id text,
    ad_set_updated_at timestamp,
    tracking_event_type text,
    window_duration_ms integer,
    PRIMARY KEY ("index", ad_set_id, ad_set_updated_at),
    FOREIGN KEY (ad_set_id) REFERENCES ad_set(id),
    FOREIGN KEY (ad_set_updated_at) REFERENCES ad_set(updated_at)
);

CREATE TABLE campaign (
    id text,
    updated_at timestamp,
    ad_account_id text,
    created_at timestamp,
    measurement_partner text,
    "name" text,
    objective text,
    purchase_order text,
    spaa_pixel_id text,
    "status" text,
    PRIMARY KEY (id, updated_at, ad_account_id),
    FOREIGN KEY (ad_account_id) REFERENCES ad_account(id)
);

CREATE TABLE ad_set_geo_target_region (
    region_id text,
    ad_set_id text,
    ad_set_updated_at timestamp,
    PRIMARY KEY (region_id, ad_set_id, ad_set_updated_at),
    FOREIGN KEY (ad_set_id) REFERENCES ad_set(id),
    FOREIGN KEY (ad_set_updated_at) REFERENCES ad_set(updated_at)
);

CREATE TABLE podcast_episode_topic (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE ad_set_sensitive_topic_exclusion (
    sensitive_topic_exclusion_id text,
    ad_set_id text,
    ad_set_updated_at timestamp,
    PRIMARY KEY (sensitive_topic_exclusion_id, ad_set_id, ad_set_updated_at),
    FOREIGN KEY (ad_set_id) REFERENCES ad_set(id),
    FOREIGN KEY (ad_set_updated_at) REFERENCES ad_set(updated_at)
);

CREATE TABLE ad_set_age_range (
    "index" integer,
    ad_set_id text,
    ad_set_updated_at timestamp,
    max integer,
    min integer,
    PRIMARY KEY ("index", ad_set_id, ad_set_updated_at),
    FOREIGN KEY (ad_set_id) REFERENCES ad_set(id),
    FOREIGN KEY (ad_set_updated_at) REFERENCES ad_set(updated_at)
);
