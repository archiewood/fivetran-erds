CREATE TABLE incident_notification (
    id text,
    incident_id text,
    attempted_at text,
    queued_at text,
    PRIMARY KEY (id, incident_id),
    FOREIGN KEY (incident_id) REFERENCES incident(id)
);

CREATE TABLE incident_breakdown (
    "index" text,
    incident_id text,
    id text,
    "name" text,
    "value" text,
    PRIMARY KEY ("index", incident_id),
    FOREIGN KEY (incident_id) REFERENCES incident(id)
);

CREATE TABLE incident (
    id text,
    affected_views text,
    affected_views_per_hour text,
    affected_views_per_hour_on_open text,
    description text,
    error_description text,
    impact text,
    incident_key text,
    measured_value text,
    measured_value_on_close text,
    measurement text,
    notification_rules jsonb,
    resolved_at text,
    sample_size text,
    sample_size_unit text,
    severity text,
    started_at text,
    "status" text,
    threshold text,
    PRIMARY KEY (id)
);

CREATE TABLE space_broadcast (
    id text,
    space_id text,
    live_stream_id text,
    background text,
    layout text,
    passthrough text,
    resolution text,
    "status" text,
    PRIMARY KEY (id, space_id),
    FOREIGN KEY (space_id) REFERENCES space(id),
    FOREIGN KEY (live_stream_id) REFERENCES live_stream(id)
);

CREATE TABLE space (
    id text,
    active_session_id text,
    created_at text,
    passthrough text,
    "status" text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE error (
    id text,
    code text,
    count text,
    description text,
    last_seen text,
    message text,
    notes text,
    percentage text,
    PRIMARY KEY (id)
);

CREATE TABLE delivery_usage (
    _fivetran_id text,
    id text,
    live_stream_id text,
    asset_id text,
    asset_state text,
    created_at text,
    deleted_at text,
    delivered_seconds text,
    delivered_seconds_by_resolution_tier_1080_p text,
    delivered_seconds_by_resolution_tier_720_p text,
    delivered_seconds_by_resolution_tier_audio_only text,
    passthrough text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (id) REFERENCES asset(id),
    FOREIGN KEY (live_stream_id) REFERENCES live_stream(id)
);

CREATE TABLE related_incident (
    related_incident_id text,
    incident_id text,
    PRIMARY KEY (related_incident_id, incident_id),
    FOREIGN KEY (incident_id) REFERENCES incident(id)
);

CREATE TABLE asset_track (
    id text,
    asset_id text,
    closed_captions text,
    language_code text,
    max_channel_layout text,
    max_channels text,
    max_frame_rate text,
    max_height text,
    max_width text,
    "name" text,
    passthrough text,
    "status" text,
    text_source text,
    text_type text,
    "type" text,
    PRIMARY KEY (id, asset_id),
    FOREIGN KEY (asset_id) REFERENCES asset(id)
);

CREATE TABLE asset_error_message (
    message text,
    asset_id text,
    PRIMARY KEY (message, asset_id),
    FOREIGN KEY (asset_id) REFERENCES asset(id)
);

CREATE TABLE asset_static_renditions_file (
    _fivetran_id text,
    asset_id text,
    bitrate text,
    ext text,
    filesize text,
    height text,
    "name" text,
    width text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (asset_id) REFERENCES asset(id)
);

CREATE TABLE asset_recording_time (
    _fivetran_id text,
    asset_id text,
    duration text,
    started_at text,
    "type" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (asset_id) REFERENCES asset(id)
);

CREATE TABLE asset (
    id text,
    live_stream_id text,
    aspect_ratio text,
    created_at text,
    duration text,
    error_type text,
    is_live text,
    master_access text,
    master_status text,
    master_url text,
    max_stored_frame_rate text,
    max_stored_resolution text,
    mp_4_support text,
    non_standard_input_reasons_audio_codec text,
    non_standard_input_reasons_audio_edit_list text,
    non_standard_input_reasons_pixel_aspect_ratio text,
    non_standard_input_reasons_unexpected_media_file_parameters text,
    non_standard_input_reasons_unsupported_pixel_format text,
    non_standard_input_reasons_video_bitrate text,
    non_standard_input_reasons_video_codec text,
    non_standard_input_reasons_video_edit_list text,
    non_standard_input_reasons_video_frame_rate text,
    non_standard_input_reasons_video_gop_size text,
    non_standard_input_reasons_video_resolution text,
    normalize_audio text,
    passthrough text,
    source_asset_id text,
    static_renditions_status text,
    "status" text,
    test text,
    upload_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (live_stream_id) REFERENCES live_stream(id)
);

CREATE TABLE playback (
    id text,
    "type" text,
    parent_id text,
    policy text,
    PRIMARY KEY (id, "type", parent_id),
    FOREIGN KEY (parent_id) REFERENCES live_stream(id)
);

CREATE TABLE livestream_playback_policy (
    playback_policies text,
    live_stream_id text,
    PRIMARY KEY (playback_policies, live_stream_id),
    FOREIGN KEY (live_stream_id) REFERENCES live_stream(id)
);

CREATE TABLE simulcast_target (
    id text,
    live_stream_id text,
    passthrough text,
    "status" text,
    stream_key text,
    url text,
    PRIMARY KEY (id, live_stream_id),
    FOREIGN KEY (live_stream_id) REFERENCES live_stream(id)
);

CREATE TABLE livestream_embedded_subtitle (
    "index" text,
    live_stream_id text,
    language_channel text,
    language_code text,
    "name" text,
    passthrough text,
    PRIMARY KEY ("index", live_stream_id),
    FOREIGN KEY (live_stream_id) REFERENCES live_stream(id)
);

CREATE TABLE livestream_generated_subtitle_transcription_vocabulary (
    transcription_vocabulary_id text,
    livestream_generated_subtitle_index text,
    livestream_generated_subtitle_live_stream_id text,
    PRIMARY KEY (transcription_vocabulary_id, livestream_generated_subtitle_index, livestream_generated_subtitle_live_stream_id),
    FOREIGN KEY (livestream_generated_subtitle_index) REFERENCES livestream_generated_subtitle("index"),
    FOREIGN KEY (livestream_generated_subtitle_live_stream_id) REFERENCES livestream_generated_subtitle(live_stream_id)
);

CREATE TABLE livestream_generated_subtitle (
    "index" text,
    live_stream_id text,
    language_code text,
    "name" text,
    passthrough text,
    PRIMARY KEY ("index", live_stream_id),
    FOREIGN KEY (live_stream_id) REFERENCES live_stream(id)
);

CREATE TABLE live_stream (
    id text,
    active_asset_id text,
    audio_only text,
    created_at text,
    latency_mode text,
    max_continuous_duration text,
    passthrough text,
    reconnect_slate_url text,
    reconnect_window text,
    "status" text,
    stream_key text,
    test text,
    use_slate_for_standard_latency text,
    PRIMARY KEY (id),
    FOREIGN KEY (active_asset_id) REFERENCES asset(id)
);

CREATE TABLE asset_input_info_track (
    "index" text,
    _fivetran_id text,
    channels text,
    duration text,
    encoding text,
    frame_rate text,
    height text,
    sample_rate text,
    sample_size text,
    "type" text,
    width text,
    PRIMARY KEY ("index", _fivetran_id),
    FOREIGN KEY (_fivetran_id) REFERENCES asset_input_info(_fivetran_id)
);

CREATE TABLE asset_input_info (
    _fivetran_id text,
    asset_id text,
    file_container_format text,
    settings_url text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (asset_id) REFERENCES asset(id)
);

CREATE TABLE video_view_event (
    _fivetran_id text,
    video_view_id text,
    event_time text,
    "name" text,
    playback_time text,
    viewer_time text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (video_view_id) REFERENCES video_view(view_id)
);

CREATE TABLE video_view (
    view_id text,
    live_stream_id text,
    video_id text,
    asn text,
    city text,
    country_name text,
    exit_before_video_start text,
    player_error_code text,
    player_error_message text,
    player_mux_plugin_name text,
    player_source_host_name text,
    player_source_url text,
    view_end text,
    view_max_downscale_percentage text,
    view_max_playhead_position text,
    view_max_upscale_percentage text,
    view_playing_time text,
    view_start text,
    view_total_content_playback_time text,
    viewer_device_model text,
    viewer_os_version text,
    weighted_average_bitrate text,
    -- custom_* (dynamic column),
    PRIMARY KEY (view_id),
    FOREIGN KEY (live_stream_id) REFERENCES live_stream(id),
    FOREIGN KEY (video_id) REFERENCES asset(id)
);

CREATE TABLE referrer_allowed_domain (
    allowed_domain text,
    playback_restriction_id text,
    PRIMARY KEY (allowed_domain, playback_restriction_id),
    FOREIGN KEY (playback_restriction_id) REFERENCES playback_restriction(id)
);

CREATE TABLE playback_restriction (
    id text,
    created_at text,
    referrer_allow_no_referrer text,
    updated_at text,
    PRIMARY KEY (id)
);
