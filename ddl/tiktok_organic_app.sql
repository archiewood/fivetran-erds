CREATE TABLE business_benchmark (
    _fivetran_id text,
    average_comments text,
    average_engagement_rate text,
    average_follower_count text,
    average_follower_growth text,
    average_likes text,
    average_shares text,
    average_video_count text,
    average_video_views text,
    business_category text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE profile_audience_age (
    "index" text,
    profile_username text,
    age text,
    percentage text,
    PRIMARY KEY ("index", profile_username),
    FOREIGN KEY (profile_username) REFERENCES profile(username)
);

CREATE TABLE profile_audience_country (
    "index" text,
    profile_username text,
    country text,
    percentage text,
    PRIMARY KEY ("index", profile_username),
    FOREIGN KEY (profile_username) REFERENCES profile(username)
);

CREATE TABLE profile_audience_city (
    "index" text,
    profile_username text,
    city_name text,
    percentage text,
    PRIMARY KEY ("index", profile_username),
    FOREIGN KEY (profile_username) REFERENCES profile(username)
);

CREATE TABLE profile_metric_audience_activity (
    "hour" text,
    "date" text,
    profile_username text,
    count text,
    PRIMARY KEY ("hour", "date", profile_username),
    FOREIGN KEY ("date") REFERENCES profile_metric("date"),
    FOREIGN KEY (profile_username) REFERENCES profile_metric(profile_username)
);

CREATE TABLE profile_metric (
    "date" text,
    profile_username text,
    address_clicks text,
    app_download_clicks text,
    bio_link_clicks text,
    comments text,
    daily_lost_followers text,
    daily_new_followers text,
    daily_total_followers text,
    email_clicks text,
    engaged_audience text,
    followers_count text,
    lead_submissions text,
    likes text,
    phone_number_clicks text,
    profile_views text,
    shares text,
    unique_video_views text,
    video_views text,
    PRIMARY KEY ("date", profile_username),
    FOREIGN KEY (profile_username) REFERENCES profile(username)
);

CREATE TABLE profile_audience_gender (
    "index" text,
    profile_username text,
    gender text,
    percentage text,
    PRIMARY KEY ("index", profile_username),
    FOREIGN KEY (profile_username) REFERENCES profile(username)
);

CREATE TABLE profile (
    username text,
    bio_description text,
    display_name text,
    followers_count text,
    following_count text,
    is_business_account text,
    is_verified text,
    profile_deep_link text,
    profile_image text,
    total_likes text,
    videos_count text,
    PRIMARY KEY (username)
);

CREATE TABLE replies_to_comment (
    id text,
    parent_comment_id text,
    username text,
    video_id text,
    create_time timestamp,
    display_name text,
    liked text,
    likes text,
    owner text,
    pinned text,
    profile_image text,
    replies text,
    "status" text,
    text text,
    unique_identifier text,
    PRIMARY KEY (id),
    FOREIGN KEY (parent_comment_id) REFERENCES "comment"(id),
    FOREIGN KEY (username) REFERENCES profile(username),
    FOREIGN KEY (video_id) REFERENCES video(id)
);

CREATE TABLE video_impression_source (
    "index" text,
    video_id text,
    impression_source text,
    percentage text,
    PRIMARY KEY ("index", video_id),
    FOREIGN KEY (video_id) REFERENCES video(id)
);

CREATE TABLE video_audience_gender (
    "index" text,
    video_id text,
    gender text,
    percentage text,
    PRIMARY KEY ("index", video_id),
    FOREIGN KEY (video_id) REFERENCES video(id)
);

CREATE TABLE video_audience_type (
    "index" text,
    video_id text,
    percentage text,
    "type" text,
    PRIMARY KEY ("index", video_id),
    FOREIGN KEY (video_id) REFERENCES video(id)
);

CREATE TABLE video_engagement_like (
    "index" text,
    video_id text,
    percentage text,
    "second" text,
    PRIMARY KEY ("index", video_id),
    FOREIGN KEY (video_id) REFERENCES video(id)
);

CREATE TABLE video_audience_city (
    "index" text,
    video_id text,
    city_name text,
    percentage text,
    PRIMARY KEY ("index", video_id),
    FOREIGN KEY (video_id) REFERENCES video(id)
);

CREATE TABLE video_audience_country (
    "index" text,
    video_id text,
    country text,
    percentage text,
    PRIMARY KEY ("index", video_id),
    FOREIGN KEY (video_id) REFERENCES video(id)
);

CREATE TABLE video_view_retention (
    "index" text,
    video_id text,
    percentage text,
    "second" text,
    PRIMARY KEY ("index", video_id),
    FOREIGN KEY (video_id) REFERENCES video(id)
);

CREATE TABLE video (
    id text,
    address_clicks text,
    app_download_clicks text,
    average_time_watched text,
    caption text,
    comments text,
    create_time text,
    email_clicks text,
    embed_url text,
    favorites text,
    full_video_watched_rate text,
    lead_submissions text,
    likes text,
    new_followers text,
    phone_number_clicks text,
    profile_views text,
    reach text,
    share_url text,
    shares text,
    thumbnail_url text,
    total_time_watched text,
    video_duration text,
    video_views text,
    website_clicks text,
    PRIMARY KEY (id)
);

CREATE TABLE "comment" (
    id text,
    parent_comment_id text,
    username text,
    video_id text,
    create_time timestamp,
    display_name text,
    liked text,
    likes text,
    owner text,
    pinned text,
    profile_image text,
    replies text,
    "status" text,
    text text,
    unique_identifier text,
    PRIMARY KEY (id),
    FOREIGN KEY (parent_comment_id) REFERENCES "comment"(id),
    FOREIGN KEY (username) REFERENCES profile(username),
    FOREIGN KEY (video_id) REFERENCES video(id)
);
