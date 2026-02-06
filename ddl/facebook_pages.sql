CREATE TABLE reel_metrics_by_type (
    "date" timestamp,
    "type" text,
    reel_id text,
    post_video_likes_by_reaction_type double precision,
    post_video_social_actions double precision,
    PRIMARY KEY ("date", "type", reel_id),
    FOREIGN KEY (reel_id) REFERENCES reel_history(id)
);

CREATE TABLE page_metrics_by_paid_non_paid (
    "date" timestamp,
    paid_non_paid text,
    page_id text,
    page_fan_adds_by_paid_non_paid_unique double precision,
    page_video_views_by_paid_non_paid double precision,
    PRIMARY KEY ("date", paid_non_paid, page_id),
    FOREIGN KEY (page_id) REFERENCES page(id)
);

CREATE TABLE reel_history (
    id text,
    updated_time timestamp,
    page_id text,
    ad_breaks jsonb,
    backdated_time timestamp,
    backdated_time_granularity text,
    content_category text,
    content_tags jsonb,
    created_time timestamp,
    custom_labels jsonb,
    description text,
    embed_html text,
    embeddable boolean,
    event jsonb,
    from_object jsonb,
    icon text,
    is_crosspost_video boolean,
    is_episode boolean,
    is_instagram_eligible boolean,
    length text,
    live_status text,
    permalink_url text,
    place jsonb,
    premiere_living_room_status text,
    published boolean,
    scheduled_publish_time timestamp,
    "source" text,
    status_processing_progress integer,
    status_value text,
    title text,
    universal_video_id text,
    views bigint,
    PRIMARY KEY (id, updated_time),
    FOREIGN KEY (page_id) REFERENCES page(id)
);

CREATE TABLE reel_metrics_total (
    "date" timestamp,
    reel_id text,
    blue_reels_play_count double precision,
    post_video_avg_time_watched double precision,
    post_video_followers double precision,
    post_video_view_time double precision,
    PRIMARY KEY ("date", reel_id),
    FOREIGN KEY (reel_id) REFERENCES reel_history(id)
);

CREATE TABLE post_metrics_by_video_interval (
    "date" timestamp,
    video_interval integer,
    post_id text,
    post_video_retention_graph double precision,
    post_video_retention_graph_autoplayed double precision,
    post_video_retention_graph_clicked_to_play double precision,
    PRIMARY KEY ("date", video_interval, post_id),
    FOREIGN KEY (post_id) REFERENCES post_history(id)
);

CREATE TABLE page_metrics_by_country (
    country text,
    "date" timestamp,
    page_id text,
    page_follows_country double precision,
    PRIMARY KEY (country, "date", page_id),
    FOREIGN KEY (page_id) REFERENCES page(id)
);

CREATE TABLE post_video_property_history (
    "index" integer,
    post_id text,
    updated_time timestamp,
    href text,
    "name" text,
    text text,
    PRIMARY KEY ("index", post_id, updated_time),
    FOREIGN KEY (post_id) REFERENCES post_history(id),
    FOREIGN KEY (updated_time) REFERENCES post_history(id)
);

CREATE TABLE post_history (
    id text,
    updated_time timestamp,
    page_id text,
    comment_count bigint,
    created_time timestamp,
    full_picture text,
    is_eligible_for_promotion boolean,
    is_expired boolean,
    is_hidden boolean,
    is_instagram_eligible boolean,
    is_published boolean,
    message text,
    parent_id text,
    promotable_id text,
    share_count bigint,
    status_type text,
    -- privacy_* (dynamic column),
    PRIMARY KEY (id, updated_time),
    FOREIGN KEY (page_id) REFERENCES page(id)
);

CREATE TABLE post_tagged_profile_history (
    "index" integer,
    post_id text,
    updated_time timestamp,
    id text,
    length integer,
    "name" text,
    "offset" integer,
    "type" text,
    PRIMARY KEY ("index", post_id, updated_time),
    FOREIGN KEY (post_id) REFERENCES post_history(id),
    FOREIGN KEY (updated_time) REFERENCES post_history(id)
);

CREATE TABLE page_metrics_by_crosspost_status (
    crosspost_status text,
    "date" timestamp,
    page_id text,
    page_daily_video_ad_break_ad_impressions_by_crosspost_status double precision,
    page_daily_video_ad_break_cpm_by_crosspost_status double precision,
    page_daily_video_ad_break_earnings_by_crosspost_status double precision,
    PRIMARY KEY (crosspost_status, "date", page_id),
    FOREIGN KEY (page_id) REFERENCES page(id)
);

CREATE TABLE page_video_thumbnail (
    id text,
    video_id text,
    height bigint,
    is_preferred boolean,
    "name" text,
    scale text,
    uri text,
    width bigint,
    PRIMARY KEY (id),
    FOREIGN KEY (video_id) REFERENCES page_video_history(id)
);

CREATE TABLE post_metrics_by_type (
    "date" timestamp,
    "type" text,
    post_id text,
    post_clicks_by_type double precision,
    post_reactions_by_type_total double precision,
    PRIMARY KEY ("date", "type", post_id),
    FOREIGN KEY (post_id) REFERENCES post_history(id)
);

CREATE TABLE post_attachment_history (
    "index" integer,
    post_id text,
    updated_time timestamp,
    media_image_height integer,
    media_image_src text,
    media_image_width integer,
    media_source text,
    media_type text,
    target_id text,
    target_url text,
    "type" text,
    unshimmed_url text,
    url text,
    PRIMARY KEY ("index", post_id, updated_time),
    FOREIGN KEY (post_id) REFERENCES post_history(id),
    FOREIGN KEY (updated_time) REFERENCES post_history(id)
);

CREATE TABLE post_metrics_by_action_type (
    action_type text,
    "date" timestamp,
    post_id text,
    post_activity_by_action_type double precision,
    post_activity_by_action_type_unique double precision,
    PRIMARY KEY (action_type, "date", post_id),
    FOREIGN KEY (post_id) REFERENCES post_history(id)
);

CREATE TABLE page_metrics_by_city (
    city text,
    "date" timestamp,
    page_id text,
    page_follows_city double precision,
    PRIMARY KEY (city, "date", page_id),
    FOREIGN KEY (page_id) REFERENCES page(id)
);

CREATE TABLE page_metrics_total (
    "date" timestamp,
    page_id text,
    page_actions_post_reactions_anger_total double precision,
    page_actions_post_reactions_haha_total double precision,
    page_actions_post_reactions_like_total double precision,
    page_actions_post_reactions_love_total double precision,
    page_actions_post_reactions_sorry_total double precision,
    page_actions_post_reactions_wow_total double precision,
    page_daily_follows double precision,
    page_daily_follows_unique double precision,
    page_daily_unfollows_unique double precision,
    page_follows double precision,
    page_media_view double precision,
    page_post_engagements double precision,
    page_total_actions double precision,
    page_video_complete_views_30_s double precision,
    page_video_complete_views_30_s_autoplayed double precision,
    page_video_complete_views_30_s_click_to_play double precision,
    page_video_complete_views_30_s_organic double precision,
    page_video_complete_views_30_s_paid double precision,
    page_video_complete_views_30_s_repeat_views double precision,
    page_video_complete_views_30_s_unique double precision,
    page_video_repeat_views double precision,
    page_video_view_time double precision,
    page_video_views double precision,
    page_video_views_autoplayed double precision,
    page_video_views_click_to_play double precision,
    page_video_views_organic double precision,
    page_video_views_paid double precision,
    page_video_views_unique double precision,
    page_views_total double precision,
    PRIMARY KEY ("date", page_id),
    FOREIGN KEY (page_id) REFERENCES page(id)
);

CREATE TABLE post_metrics_by_locale (
    "date" timestamp,
    locale text,
    post_id text,
    post_video_view_time_by_region_id double precision,
    PRIMARY KEY ("date", locale, post_id),
    FOREIGN KEY (post_id) REFERENCES post_history(id)
);

-- NOTE
-- Fields listed below are not supported for the Pages that have been migrated to the New Pages Experience.
--   - affiliation 
--   - app_id
--   - artists_we_like 
--   - attire 
--   - awards 
--   - band_interests 
--   - band_members 
--   - bio 
--   - booking_agent 
--   - built 
--   - company_overview 
--   - culinary_team 
--   - current_location 
--   - directed_by
CREATE TABLE page (
    id text,
    app_id text,
    birthday text,
    can_checkin boolean,
    can_post boolean,
    category text,
    category_list jsonb,
    checkins bigint,
    description text,
    display_subtext text,
    emails jsonb,
    fan_count bigint,
    followers_count bigint,
    global_brand_page_name text,
    has_transitioned_to_new_page_experience boolean,
    hometown text,
    is_always_open boolean,
    is_community_page boolean,
    is_eligible_for_branded_content boolean,
    is_messenger_bot_get_started_enabled boolean,
    is_messenger_platform_bot boolean,
    is_owned boolean,
    is_permanently_closed boolean,
    is_published boolean,
    is_unclaimed boolean,
    "name" text,
    phone text,
    place_type text,
    price_range text,
    promotion_eligible boolean,
    promotion_ineligible_reason text,
    single_line_address text,
    talking_about_count bigint,
    username text,
    website text,
    were_here_count bigint,
    PRIMARY KEY (id)
);

CREATE TABLE page_video_history (
    id text,
    updated_time timestamp,
    page_id text,
    ad_breaks jsonb,
    backdated_time timestamp,
    backdated_time_granularity text,
    content_category text,
    content_tags jsonb,
    created_time timestamp,
    custom_labels jsonb,
    description text,
    embed_html text,
    embeddable boolean,
    event jsonb,
    format jsonb,
    from_object jsonb,
    icon text,
    is_crosspost_video boolean,
    is_crossposting_eligible boolean,
    is_episode boolean,
    is_instagram_eligible boolean,
    length text,
    live_status text,
    permalink_url text,
    picture jsonb,
    place jsonb,
    post_views bigint,
    premiere_living_room_status text,
    privacy jsonb,
    published boolean,
    scheduled_publish_time timestamp,
    "source" text,
    title text,
    universal_video_id text,
    views bigint,
    PRIMARY KEY (id, updated_time),
    FOREIGN KEY (page_id) REFERENCES page(id)
);

CREATE TABLE post_metrics_total (
    "date" timestamp,
    post_id text,
    post_clicks double precision,
    post_media_view double precision,
    post_reactions_anger_total double precision,
    post_reactions_haha_total double precision,
    post_reactions_like_total double precision,
    post_reactions_love_total double precision,
    post_reactions_sorry_total double precision,
    post_reactions_wow_total double precision,
    post_video_ad_break_ad_cpm double precision,
    post_video_ad_break_ad_impressions double precision,
    post_video_ad_break_earnings double precision,
    post_video_avg_time_watched double precision,
    post_video_complete_views_30_s_autoplayed double precision,
    post_video_complete_views_30_s_clicked_to_play double precision,
    post_video_complete_views_30_s_organic double precision,
    post_video_complete_views_30_s_paid double precision,
    post_video_complete_views_30_s_unique double precision,
    post_video_complete_views_organic double precision,
    post_video_complete_views_organic_unique double precision,
    post_video_complete_views_paid double precision,
    post_video_complete_views_paid_unique double precision,
    post_video_length double precision,
    post_video_view_time double precision,
    post_video_view_time_organic double precision,
    post_video_views double precision,
    post_video_views_15_s double precision,
    post_video_views_60_s_excludes_shorter double precision,
    post_video_views_autoplayed double precision,
    post_video_views_clicked_to_play double precision,
    post_video_views_organic double precision,
    post_video_views_organic_unique double precision,
    post_video_views_paid double precision,
    post_video_views_paid_unique double precision,
    post_video_views_sound_on double precision,
    post_video_views_unique double precision,
    PRIMARY KEY ("date", post_id),
    FOREIGN KEY (post_id) REFERENCES post_history(id)
);

CREATE TABLE post_metrics_by_age_gender (
    age_gender text,
    "date" timestamp,
    post_id text,
    post_video_view_time_by_age_bucket_and_gender double precision,
    PRIMARY KEY (age_gender, "date", post_id),
    FOREIGN KEY (post_id) REFERENCES post_history(id)
);

CREATE TABLE post_comment_history (
    _fivetran_id text,
    post_id text,
    can_comment boolean,
    can_hide boolean,
    can_like boolean,
    can_remove boolean,
    can_reply_privately boolean,
    comment_count bigint,
    created_time timestamp,
    from_object jsonb,
    id text,
    like_count bigint,
    message text,
    message_tags jsonb,
    object jsonb,
    parent_id text,
    user_likes boolean,
    -- attachment_* (dynamic column),
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (post_id) REFERENCES post_history(id)
);

CREATE TABLE post_metrics_by_country (
    country text,
    "date" timestamp,
    post_id text,
    post_video_view_time_by_country_id double precision,
    PRIMARY KEY (country, "date", post_id),
    FOREIGN KEY (post_id) REFERENCES post_history(id)
);
