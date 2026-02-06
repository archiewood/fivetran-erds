CREATE TABLE location (
    _fivetran_id text,
    episode_id text,
    rank text,
    starts_percent text,
    starts_total text,
    url text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (episode_id) REFERENCES episode(id)
);

CREATE TABLE browser (
    _fivetran_id text,
    podcast_id text,
    downloads_percent text,
    downloads_total text,
    end_date text,
    "name" text,
    rank text,
    start_date text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (podcast_id) REFERENCES podcast(id)
);

CREATE TABLE application (
    _fivetran_id text,
    podcast_id text,
    downloads_percent text,
    downloads_total text,
    end_date text,
    "name" text,
    rank text,
    start_date text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (podcast_id) REFERENCES podcast(id)
);

CREATE TABLE author (
    id text,
    podcast_author_id text,
    email text,
    facebook_handle text,
    facebook_link text,
    href text,
    instagram_handle text,
    instagram_link text,
    "name" text,
    remove text,
    twitter_handle text,
    twitter_link text,
    "update" text,
    updated_at text,
    user_id text,
    website_domain text,
    website_link text,
    youtube_handle text,
    youtube_link text,
    PRIMARY KEY (id),
    FOREIGN KEY (podcast_author_id) REFERENCES podcast_author(id)
);

CREATE TABLE last_seven (
    podcast_id text,
    href text,
    total text,
    PRIMARY KEY (podcast_id),
    FOREIGN KEY (podcast_id) REFERENCES podcast(id)
);

CREATE TABLE speed (
    _fivetran_id text,
    episode_id text,
    percentage text,
    speed text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (episode_id) REFERENCES episode(id)
);

CREATE TABLE hours_listened (
    podcast_id text,
    href text,
    total text,
    PRIMARY KEY (podcast_id),
    FOREIGN KEY (podcast_id) REFERENCES podcast(id)
);

CREATE TABLE listener_analytics (
    "interval" text,
    podcast_id text,
    percents text,
    total text,
    PRIMARY KEY ("interval", podcast_id),
    FOREIGN KEY (podcast_id) REFERENCES podcast(id)
);

CREATE TABLE time_of_week (
    _fivetran_id text,
    podcast_id text,
    count text,
    day_of_week text,
    hour_of_day text,
    hour_of_week text,
    rank text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (podcast_id) REFERENCES podcast(id)
);

CREATE TABLE listener (
    id text,
    podcast_id text,
    href text,
    listeners_total text,
    number text,
    published_at text,
    season_href text,
    season_number text,
    title text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (podcast_id) REFERENCES podcast(id)
);

CREATE TABLE category_subcategories_collection (
    "index" text,
    _fivetran_id text,
    label text,
    rss_label text,
    "value" text,
    PRIMARY KEY ("index", _fivetran_id),
    FOREIGN KEY (_fivetran_id) REFERENCES category(_fivetran_id)
);

CREATE TABLE category (
    _fivetran_id text,
    label text,
    rss_label text,
    "value" text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE listening_method (
    _fivetran_id text,
    podcast_id text,
    downloads_percent text,
    downloads_total text,
    end_date text,
    "name" text,
    rank text,
    start_date text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (podcast_id) REFERENCES podcast(id)
);

CREATE TABLE analytics_download (
    "interval" text,
    podcast_episode_id text,
    downloads_percent text,
    downloads_total text,
    PRIMARY KEY ("interval", podcast_episode_id)
);

CREATE TABLE analytics_download_collection (
    id text,
    podcast_episode_id text,
    is_primary text,
    "name" text,
    published_at text,
    scheduled_for text,
    "status" text,
    PRIMARY KEY (id, podcast_episode_id)
);

CREATE TABLE podcast_keyword (
    id text,
    podcast_id text,
    "delete" text,
    href text,
    "value" text,
    PRIMARY KEY (id),
    FOREIGN KEY (podcast_id) REFERENCES podcast(id)
);

CREATE TABLE operating_system (
    _fivetran_id text,
    podcast_id text,
    downloads_percent text,
    downloads_total text,
    end_date text,
    "name" text,
    rank text,
    start_date text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (podcast_id) REFERENCES podcast(id)
);

CREATE TABLE listen (
    episode_id text,
    "interval" text,
    downloads_percent text,
    downloads_total text,
    PRIMARY KEY (episode_id, "interval")
);

CREATE TABLE timezone (
    _fivetran_id text,
    common text,
    label text,
    offsets text,
    "value" text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE average_completion (
    id text,
    episode_id text,
    avg_completion text,
    href text,
    seconds_played text,
    PRIMARY KEY (id),
    FOREIGN KEY (episode_id) REFERENCES episode(id)
);

CREATE TABLE top_ten (
    id text,
    podcast_id text,
    season_id text,
    count text,
    legacy_id text,
    number text,
    published_at text,
    rank text,
    season_number text,
    title text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (podcast_id) REFERENCES podcast(id),
    FOREIGN KEY (season_id) REFERENCES podcast_season(number)
);

CREATE TABLE podcast_category_collection (
    _fivetran_id text,
    podcast_category_id text,
    href text,
    label text,
    "value" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (podcast_category_id) REFERENCES podcast_category(id)
);

CREATE TABLE podcast_category (
    id text,
    podcast_id text,
    created_at text,
    href text,
    label text,
    "value" text,
    PRIMARY KEY (id),
    FOREIGN KEY (podcast_id) REFERENCES podcast(id)
);

CREATE TABLE device_class (
    _fivetran_id text,
    podcast_id text,
    downloads_percent text,
    downloads_total text,
    end_date text,
    "name" text,
    rank text,
    start_date text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (podcast_id) REFERENCES podcast(id)
);

CREATE TABLE podcast_season (
    _fivetran_id text,
    podcast_id text,
    href text,
    number text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (podcast_id) REFERENCES podcast(id)
);

CREATE TABLE listener_podcast (
    end_date text,
    start_date text,
    podcast_id text,
    href text,
    total text,
    PRIMARY KEY (end_date, start_date, podcast_id),
    FOREIGN KEY (podcast_id) REFERENCES podcast(id)
);

CREATE TABLE marker (
    id text,
    episode_id text,
    ad_limit text,
    ad_type text,
    href text,
    max_duration_millisecond text,
    "name" text,
    offset_millisecond text,
    offset_second text,
    PRIMARY KEY (id),
    FOREIGN KEY (episode_id) REFERENCES episode(id)
);

CREATE TABLE episode_keyword (
    id text,
    episode_id text,
    "delete" text,
    href text,
    "value" text,
    PRIMARY KEY (id),
    FOREIGN KEY (episode_id) REFERENCES episode(id)
);

CREATE TABLE episode_feed (
    id text,
    episode_id text,
    ad_free_feed_url text,
    "delete" text,
    description text,
    enable_episode_number text,
    enabled text,
    enclosure_url text,
    expires_at text,
    external_feed_url text,
    feed_url text,
    has_ad_free_variant text,
    href text,
    image_url text,
    is_ad_free text,
    is_explicit text,
    is_primary text,
    "name" text,
    no_index text,
    preferred_bitrate text,
    publish text,
    published_at text,
    redirect_url text,
    regenerate_ad_free text,
    reimport text,
    rss_limit text,
    schedule text,
    scheduled_for text,
    "status" text,
    title text,
    unexpire text,
    unpublish text,
    unschedule text,
    "update" text,
    PRIMARY KEY (id),
    FOREIGN KEY (episode_id) REFERENCES episode(id)
);

CREATE TABLE episode_marker (
    id text,
    episode_id text,
    ad_limit text,
    ad_type text,
    href text,
    max_duration_millisecond text,
    "name" text,
    offset_millisecond text,
    PRIMARY KEY (id),
    FOREIGN KEY (episode_id) REFERENCES episode(id)
);

CREATE TABLE episode_author (
    id text,
    episode_id text,
    href text,
    "name" text,
    remove text,
    PRIMARY KEY (id),
    FOREIGN KEY (episode_id) REFERENCES episode(id)
);

CREATE TABLE episode (
    id text,
    podcast_id text,
    ad_free_audio_file_url text,
    analytics_href text,
    audio_content_type text,
    audio_file_ad_free_url text,
    audio_file_delete text,
    audio_file_href text,
    audio_file_name text,
    audio_file_path text,
    audio_file_path_tc text,
    audio_file_size text,
    audio_file_url text,
    audio_href text,
    audio_status text,
    campaign_preview_href text,
    created_at text,
    custom_url text,
    dashboard_link text,
    days_since_release text,
    "delete" text,
    description text,
    duration text,
    enclosure_url text,
    episode_url text,
    guid text,
    href text,
    image_path text,
    image_url text,
    is_explicit text,
    is_hidden text,
    is_published text,
    long_description text,
    number text,
    publish text,
    published_at text,
    recast_color text,
    recast_image text,
    recast_image_url text,
    schedule text,
    scheduled_for text,
    season_href text,
    season_number text,
    sign_url text,
    slug text,
    sponsor_href text,
    "status" text,
    title text,
    token text,
    transcription text,
    "type" text,
    unschedule text,
    "update" text,
    updated_at text,
    upload_complete text,
    warning jsonb,
    waveform_json text,
    waveform_pack text,
    PRIMARY KEY (id),
    FOREIGN KEY (podcast_id) REFERENCES podcast(id)
);

CREATE TABLE device (
    _fivetran_id text,
    podcast_id text,
    downloads_percent text,
    downloads_total text,
    end_date text,
    "name" text,
    rank text,
    start_date text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (podcast_id) REFERENCES podcast(id)
);

CREATE TABLE location_analytics (
    id text,
    podcast_id text,
    downloads_percent text,
    downloads_total text,
    "name" text,
    rank text,
    "state" text,
    states_href text,
    PRIMARY KEY (id),
    FOREIGN KEY (podcast_id) REFERENCES podcast(id)
);

CREATE TABLE embed_episode (
    id text,
    podcast_id text,
    avg_completion_href text,
    href text,
    number text,
    published_at text,
    rank text,
    season_href text,
    season_number text,
    "start" text,
    stream text,
    title text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (podcast_id) REFERENCES podcast(id)
);

CREATE TABLE average_download (
    podcast_id text,
    href text,
    total text,
    PRIMARY KEY (podcast_id),
    FOREIGN KEY (podcast_id) REFERENCES podcast(id)
);

CREATE TABLE network_type (
    _fivetran_id text,
    podcast_id text,
    downloads_percent text,
    downloads_total text,
    end_date text,
    "name" text,
    rank text,
    start_date text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (podcast_id) REFERENCES podcast(id)
);

CREATE TABLE podcast_distribution_channel (
    id text,
    podcast_id text,
    distribution_channel_href text,
    distribution_channel_id text,
    distribution_channel_name text,
    href text,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (podcast_id) REFERENCES podcast(id)
);

CREATE TABLE podcast_author (
    id text,
    podcast_id text,
    href text,
    "name" text,
    remove text,
    PRIMARY KEY (id),
    FOREIGN KEY (podcast_id) REFERENCES podcast(id)
);

CREATE TABLE provider (
    _fivetran_id text,
    podcast_id text,
    downloads_percent text,
    downloads_total text,
    end_date text,
    "name" text,
    rank text,
    start_date text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (podcast_id) REFERENCES podcast(id)
);

CREATE TABLE web_player (
    _fivetran_id text,
    podcast_id text,
    downloads_percent text,
    downloads_total text,
    "name" text,
    rank text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (podcast_id) REFERENCES podcast(id)
);

CREATE TABLE podcast_current_user_permission_label (
    "index" text,
    podcast_id text,
    label_name text,
    PRIMARY KEY ("index", podcast_id),
    FOREIGN KEY (podcast_id) REFERENCES podcast(id)
);

CREATE TABLE podcast_current_user_permission_app_key (
    "index" text,
    podcast_id text,
    app_key_name text,
    PRIMARY KEY ("index", podcast_id),
    FOREIGN KEY (podcast_id) REFERENCES podcast(id)
);

CREATE TABLE podcast_account (
    id text,
    podcast_id text,
    podcast_account_id text,
    account_owner_email text,
    account_owner_id text,
    account_owner_image_url text,
    account_owner_name text,
    href text,
    is_custom_plan text,
    is_default text,
    "name" text,
    PRIMARY KEY (id, podcast_id),
    FOREIGN KEY (podcast_id) REFERENCES podcast(id),
    FOREIGN KEY (podcast_account_id) REFERENCES podcast(account_id)
);

CREATE TABLE podcast (
    id text,
    account_id text,
    current_user_permission_app_key text,
    current_user_permission_can_create_episode text,
    current_user_permission_can_delete text,
    current_user_permission_can_edit text,
    current_user_permission_can_edit_ad_creative text,
    current_user_permission_can_edit_admin_permission text,
    current_user_permission_can_edit_advanced text,
    current_user_permission_can_edit_marker text,
    current_user_permission_can_edit_permission text,
    current_user_permission_can_publish text,
    current_user_permission_can_upload text,
    current_user_permission_can_view text,
    current_user_permission_can_view_ad_creative text,
    current_user_permission_can_view_analytics text,
    current_user_permission_can_view_episode text,
    current_user_permission_label text,
    current_user_permission_name text,
    current_user_permission_rank text,
    display_owner_email text,
    episode_count text,
    href text,
    image_url text,
    import text,
    is_migration text,
    is_pending_invitation text,
    permission_app_key text,
    permission_app_keys jsonb,
    permission_can_create_episode text,
    permission_can_delete text,
    permission_can_edit text,
    permission_can_edit_ad_creative text,
    permission_can_edit_admin_permission text,
    permission_can_edit_advanced text,
    permission_can_edit_marker text,
    permission_can_edit_permission text,
    permission_can_publish text,
    permission_can_upload text,
    permission_can_view text,
    permission_can_view_ad_creative text,
    permission_can_view_analytics text,
    permission_can_view_episode text,
    permission_id text,
    permission_label text,
    permission_labels jsonb,
    permission_name text,
    permission_rank text,
    "status" text,
    title text,
    PRIMARY KEY (id)
);
