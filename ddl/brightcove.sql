CREATE TABLE live_analytics_time_series_video_impression_data_point (
    _fivetran_id text,
    dimensions_video text,
    _timestamp text,
    dimensions_account text,
    "value" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (dimensions_video) REFERENCES video(id)
);

CREATE TABLE live_analytics_time_series_video_view_data_point (
    _fivetran_id text,
    dimensions_video text,
    _timestamp text,
    dimensions_account text,
    "value" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (dimensions_video) REFERENCES video(id)
);

CREATE TABLE live_analytics_time_series_second_viewed_data_point (
    _fivetran_id text,
    dimensions_video text,
    _timestamp text,
    dimensions_account text,
    "value" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (dimensions_video) REFERENCES video(id)
);

CREATE TABLE live_analytics_time_series_fingerprint_count_data_point (
    _fivetran_id text,
    dimensions_video text,
    _timestamp text,
    dimensions_account text,
    "value" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (dimensions_video) REFERENCES video(id)
);

CREATE TABLE live_analytics_time_series_ccu_data_point (
    _fivetran_id text,
    dimensions_video text,
    _timestamp text,
    dimensions_account text,
    "value" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (dimensions_video) REFERENCES video(id)
);

CREATE TABLE video_engagement_value (
    "index" text,
    video_engagement_type text,
    video_id text,
    "value" text,
    PRIMARY KEY ("index", video_engagement_type, video_id),
    FOREIGN KEY (video_engagement_type) REFERENCES video_engagement("type"),
    FOREIGN KEY (video_id) REFERENCES video_engagement(video_id)
);

CREATE TABLE video_engagement (
    "type" text,
    video_id text,
    video_duration text,
    PRIMARY KEY ("type", video_id),
    FOREIGN KEY (video_id) REFERENCES video(id)
);

CREATE TABLE video_cue_point (
    "index" text,
    video_id text,
    force_stop text,
    metadata text,
    "name" text,
    "time" text,
    "type" text,
    PRIMARY KEY ("index", video_id),
    FOREIGN KEY (video_id) REFERENCES video(id)
);

CREATE TABLE video_country (
    "index" text,
    video_id text,
    country text,
    PRIMARY KEY ("index", video_id),
    FOREIGN KEY (video_id) REFERENCES video(id)
);

CREATE TABLE video_label (
    "index" text,
    video_id text,
    label text,
    PRIMARY KEY ("index", video_id),
    FOREIGN KEY (video_id) REFERENCES video(id)
);

CREATE TABLE video_tag (
    "index" text,
    video_id text,
    tag_name text,
    PRIMARY KEY ("index", video_id),
    FOREIGN KEY (video_id) REFERENCES video(id)
);

CREATE TABLE video_text_track (
    id text,
    video_id text,
    default_ text,
    kind text,
    label text,
    mime_type text,
    src text,
    srclang text,
    "status" text,
    PRIMARY KEY (id, video_id),
    FOREIGN KEY (video_id) REFERENCES video(id)
);

CREATE TABLE video_transcript (
    id text,
    video_id text,
    account_id text,
    label text,
    "source" jsonb,
    src text,
    srclang text,
    "status" text,
    PRIMARY KEY (id, video_id),
    FOREIGN KEY (video_id) REFERENCES video(id)
);

CREATE TABLE video_variant (
    "index" text,
    video_id text,
    description text,
    language_ text,
    long_description text,
    "name" text,
    -- custom_* (dynamic column),
    PRIMARY KEY ("index", video_id),
    FOREIGN KEY (video_id) REFERENCES video(id)
);

CREATE TABLE video (
    id text,
    ad_keys text,
    clip_source_video_id text,
    complete text,
    created_at text,
    created_by_email text,
    created_by_id text,
    created_by_type text,
    delivery_type text,
    description text,
    digital_master_id text,
    drm_disabled text,
    duration text,
    economics text,
    folder_id text,
    forensic_watermarking text,
    geo_exclude_countries text,
    geo_restricted text,
    has_digital_master text,
    image_portrait_src text,
    image_poster_src text,
    image_square_src text,
    image_thumbnail_src text,
    image_ultra_wide_src text,
    image_wide_src text,
    link_text text,
    link_url text,
    long_description text,
    "name" text,
    offline_enabled text,
    original_filename text,
    playback_rights_id text,
    projection text,
    published_at text,
    reference_id text,
    schedule_ends_at text,
    schedule_starts_at text,
    sharing_by_external_acct text,
    sharing_by_id text,
    sharing_by_reference text,
    sharing_source_id text,
    sharing_to_external_acct text,
    "state" text,
    updated_at timestamp,
    updated_by_email text,
    updated_by_id text,
    updated_by_type text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE video_image_source (
    "index" text,
    video_id text,
    height text,
    object_type text,
    src text,
    width text,
    PRIMARY KEY ("index", video_id),
    FOREIGN KEY (video_id) REFERENCES video(id)
);

CREATE TABLE analytics_report (
    _fivetran_id text,
    video_id text,
    ad_mode_begin text,
    ad_mode_complete text,
    bytes_delivered text,
    "date" text,
    engagement_score text,
    play_rate text,
    play_request text,
    temp_summary_summary_account text,
    temp_summary_summary_ad_mode_begin text,
    temp_summary_summary_ad_mode_complete text,
    temp_summary_summary_bytes_delivered text,
    temp_summary_summary_engagement_score text,
    temp_summary_summary_play_rate text,
    temp_summary_summary_play_request text,
    temp_summary_summary_video_download_cancellation text,
    temp_summary_summary_video_download_complete text,
    temp_summary_summary_video_download_error text,
    temp_summary_summary_video_download_request text,
    temp_summary_summary_video_engagement_1 text,
    temp_summary_summary_video_engagement_100 text,
    temp_summary_summary_video_engagement_25 text,
    temp_summary_summary_video_engagement_50 text,
    temp_summary_summary_video_engagement_75 text,
    temp_summary_summary_video_impression text,
    temp_summary_summary_video_percent_viewed text,
    temp_summary_summary_video_seconds_viewed text,
    temp_summary_summary_video_view text,
    video_complete text,
    video_created_at text,
    video_description text,
    video_download_cancellation text,
    video_download_complete text,
    video_download_error text,
    video_download_request text,
    video_duration text,
    video_economics text,
    video_engagement_1 text,
    video_engagement_100 text,
    video_engagement_25 text,
    video_engagement_50 text,
    video_engagement_75 text,
    video_impression text,
    video_long_description text,
    video_name text,
    video_percent_viewed text,
    video_reference_id text,
    video_seconds_viewed text,
    video_state text,
    video_tag jsonb,
    video_updated_at text,
    video_view text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (video_id) REFERENCES video(id)
);

CREATE TABLE live_analytics_event (
    _fivetran_id text,
    video_id text,
    dimensions_country text,
    totals_alive_ss_ad_start text,
    totals_live_unique_viewers text,
    totals_video_seconds_viewed text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (video_id) REFERENCES video(id)
);

CREATE TABLE all_time_video_view (
    _fivetran_id text,
    video_id text,
    all_time_video_view text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (video_id) REFERENCES video(id)
);
