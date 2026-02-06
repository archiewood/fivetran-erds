CREATE TABLE organization_tag (
    id text,
    label text,
    "value" text,
    PRIMARY KEY (id)
);

CREATE TABLE region_country (
    geoname_id text,
    label text,
    "type" text,
    "value" text,
    PRIMARY KEY (geoname_id)
);

CREATE TABLE promo_order_advertisement (
    id text,
    promo_id text,
    audio_file text,
    audio_file_duration text,
    audio_file_processing text,
    audio_file_status text,
    created_at text,
    insertion_point text,
    origin_file_name text,
    "position" text,
    updated_at text,
    PRIMARY KEY (id, promo_id),
    FOREIGN KEY (promo_id) REFERENCES orders(id)
);

CREATE TABLE order_target (
    "index" text,
    orders_id text,
    id text,
    "type" text,
    PRIMARY KEY ("index", orders_id),
    FOREIGN KEY (orders_id) REFERENCES orders(id)
);

CREATE TABLE order_frequency_cap (
    "index" text,
    orders_id text,
    "day" text,
    impression text,
    PRIMARY KEY ("index", orders_id),
    FOREIGN KEY (orders_id) REFERENCES orders(id)
);

CREATE TABLE geo_name_id_inclusion (
    "index" text,
    orders_id text,
    "value" text,
    PRIMARY KEY ("index", orders_id),
    FOREIGN KEY (orders_id) REFERENCES orders(id)
);

CREATE TABLE geo_name_id_exclusion (
    "index" text,
    orders_id text,
    "value" text,
    PRIMARY KEY ("index", orders_id),
    FOREIGN KEY (orders_id) REFERENCES orders(id)
);

CREATE TABLE order_geo_target (
    orders_id text,
    target text,
    PRIMARY KEY (orders_id, target),
    FOREIGN KEY (orders_id) REFERENCES orders(id),
    FOREIGN KEY (target) REFERENCES region_country("type")
);

CREATE TABLE order_device_target (
    orders_id text,
    target text,
    PRIMARY KEY (orders_id, target),
    FOREIGN KEY (orders_id) REFERENCES orders(id),
    FOREIGN KEY (target) REFERENCES device(label)
);

CREATE TABLE orders (
    id text,
    campaign_id text,
    ad_placement_type text,
    adhash text,
    audio_status text,
    copy_needed text,
    created_at text,
    end_at text,
    external_id text,
    flight_timezone text,
    geo_exclusion jsonb,
    impressions_cap text,
    impressions_goal text,
    mtm_freeze_at text,
    notes text,
    pacing_type text,
    "position" text,
    price_type text,
    priority text,
    promo text,
    promo_code text,
    region text,
    revenue_cents text,
    revenue_currency text,
    scheduled_at text,
    start_at text,
    "state" text,
    targeted_segment text,
    title text,
    tracking_url jsonb,
    updated_at text,
    vanity_url text,
    PRIMARY KEY (id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id)
);

CREATE TABLE campaign (
    id text,
    advertiser_id text,
    created_at text,
    duration_in_seconds text,
    title text,
    total_budget_cents text,
    total_budget_currency text,
    total_revenue_cent text,
    total_revenue_currency text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (advertiser_id) REFERENCES advertiser(id)
);

CREATE TABLE advertiser (
    id text,
    agency_id text,
    competitive_category text,
    created_at text,
    "name" text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE campaign_order_advertisement (
    id text,
    campaign_id text,
    order_id text,
    audio_file text,
    audio_file_duration text,
    audio_file_processing text,
    created_at text,
    insertion_point text,
    origin_file_name text,
    "position" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (order_id) REFERENCES orders(id)
);

CREATE TABLE nielsen_segment (
    label text,
    "value" text,
    PRIMARY KEY (label),
    FOREIGN KEY (label) REFERENCES orders(targeted_segment)
);

CREATE TABLE network (
    id text,
    code text,
    created_at text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE episode_advertising_tag (
    "index" text,
    episode_id text,
    advertising_tag text,
    PRIMARY KEY ("index", episode_id),
    FOREIGN KEY (episode_id) REFERENCES episode(id)
);

CREATE TABLE episode (
    id text,
    network_id text,
    podcast_id text,
    audio_file text,
    audio_file_processing text,
    audio_file_status text,
    audio_file_updated_at text,
    author text,
    bit_rate text,
    channel_mode text,
    clean_title text,
    created_at text,
    custom_fields jsonb,
    download_url text,
    draft text,
    duration text,
    episode_number text,
    episode_type text,
    expected_adhash text,
    external_id text,
    guid text,
    id_3_file text,
    id_3_file_processing text,
    id_3_file_size text,
    image_file text,
    insertion_point jsonb,
    link text,
    original_filename text,
    original_url text,
    post_count text,
    post_offset text,
    pre_count text,
    pre_offset text,
    pubdate timestamp,
    pubdate_timezone text,
    sample_rate text,
    season_number text,
    "size" text,
    sound_cloud_identifier jsonb,
    spotify_identifier text,
    "status" text,
    subtitle text,
    summary text,
    title text,
    uid text,
    updated_at text,
    vbr text,
    PRIMARY KEY (id),
    FOREIGN KEY (network_id) REFERENCES network(id),
    FOREIGN KEY (podcast_id) REFERENCES podcast(id)
);

CREATE TABLE device (
    label text,
    "value" text,
    PRIMARY KEY (label)
);

CREATE TABLE agency (
    id text,
    address text,
    billing_method text,
    city text,
    commission_percentage text,
    created_at text,
    ein text,
    external_id text,
    "name" text,
    payement_type text,
    "state" text,
    updated_at text,
    zip_code text,
    PRIMARY KEY (id)
);

CREATE TABLE advertiser_category_children (
    label text,
    parent_label text,
    "value" text,
    PRIMARY KEY (label, parent_label),
    FOREIGN KEY (label) REFERENCES advertiser_category(label),
    FOREIGN KEY (parent_label) REFERENCES advertiser_category(label)
);

CREATE TABLE advertiser_category (
    label text,
    "value" text,
    PRIMARY KEY (label)
);

CREATE TABLE podcast_itunes_category (
    "index" text,
    podcast_id text,
    category text,
    PRIMARY KEY ("index", podcast_id),
    FOREIGN KEY (podcast_id) REFERENCES podcast(id)
);

CREATE TABLE podcast_excluded_category (
    "index" text,
    podcast_id text,
    category text,
    PRIMARY KEY ("index", podcast_id),
    FOREIGN KEY (podcast_id) REFERENCES podcast(id)
);

CREATE TABLE podcast_advertising_tag (
    "index" text,
    podcast_id text,
    advertising_tag text,
    PRIMARY KEY ("index", podcast_id),
    FOREIGN KEY (podcast_id) REFERENCES podcast(id)
);

CREATE TABLE podcast_ad_free_feed_url (
    "index" text,
    podcast_id text,
    url text,
    PRIMARY KEY ("index", podcast_id),
    FOREIGN KEY (podcast_id) REFERENCES podcast(id)
);

CREATE TABLE podcast_cloned_feed_url (
    "index" text,
    podcast_id text,
    url text,
    PRIMARY KEY ("index", podcast_id),
    FOREIGN KEY (podcast_id) REFERENCES podcast(id)
);

CREATE TABLE podcast (
    id text,
    network_id text,
    ad_free text,
    author text,
    category text,
    copyright text,
    created_at text,
    default_ad_setting jsonb,
    default_post_count text,
    default_pre_count text,
    episode_limit text,
    explicit_value text,
    external_id text,
    feed_url text,
    google_play_identifier text,
    google_podcasts_identifier text,
    iheart_identifier text,
    image_file text,
    itunes_active text,
    itunes_identifier text,
    itunes_rating text,
    languages text,
    link text,
    main_feed text,
    original_rss_url text,
    owner_email text,
    owner_name text,
    podcast_type text,
    podtrac_enabled text,
    recurring_import text,
    redirect_url text,
    redirected_at text,
    slug text,
    span_opt_in text,
    spotify_identifier text,
    stitcher_identifier text,
    subtitle text,
    summary text,
    title text,
    uid text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (network_id) REFERENCES network(id)
);

CREATE TABLE d_m_a (
    label text,
    "value" text,
    PRIMARY KEY (label),
    FOREIGN KEY (label) REFERENCES region_country(label)
);
