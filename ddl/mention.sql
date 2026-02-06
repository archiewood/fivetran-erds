CREATE TABLE alert_preference (
    _fivetran_id text,
    account_id text,
    alert_id bigint,
    desktop_notification_frequency text,
    email_notification_frequency text,
    instant_notifications_active boolean,
    push_notification_frequency text,
    stats_email_active boolean,
    trending_email_notification_frequency text,
    trending_sms_notification_frequency text,
    weight bigint,
    PRIMARY KEY (_fivetran_id, account_id, alert_id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (alert_id) REFERENCES alert(id)
);

CREATE TABLE alert_language (
    languages text,
    alert_id bigint,
    PRIMARY KEY (languages, alert_id),
    FOREIGN KEY (alert_id) REFERENCES alert(id)
);

CREATE TABLE alert_source (
    "source" text,
    alert_id bigint,
    PRIMARY KEY ("source", alert_id),
    FOREIGN KEY (alert_id) REFERENCES alert(id)
);

CREATE TABLE alert_country (
    country text,
    alert_id bigint,
    PRIMARY KEY (country, alert_id),
    FOREIGN KEY (alert_id) REFERENCES alert(id)
);

CREATE TABLE alert_blocked_site (
    blocked_site text,
    alert_id bigint,
    PRIMARY KEY (blocked_site, alert_id),
    FOREIGN KEY (alert_id) REFERENCES alert(id)
);

CREATE TABLE alert_included_keyword (
    included_keyword text,
    alert_id bigint,
    PRIMARY KEY (included_keyword, alert_id),
    FOREIGN KEY (alert_id) REFERENCES alert(id)
);

CREATE TABLE alert_required_keyword (
    required_keyword text,
    alert_id bigint,
    PRIMARY KEY (required_keyword, alert_id),
    FOREIGN KEY (alert_id) REFERENCES alert(id)
);

CREATE TABLE alert_excluded_keyword (
    excluded_keyword text,
    alert_id bigint,
    PRIMARY KEY (excluded_keyword, alert_id),
    FOREIGN KEY (alert_id) REFERENCES alert(id)
);

CREATE TABLE alert_monitored_facebook_page (
    url text,
    alert_id bigint,
    block_comments boolean,
    block_self boolean,
    facebook_id text,
    "name" text,
    "type" text,
    valid boolean,
    PRIMARY KEY (url, alert_id),
    FOREIGN KEY (alert_id) REFERENCES alert(id)
);

CREATE TABLE alert_monitored_twitter_account (
    url text,
    alert_id bigint,
    block_comments boolean,
    block_retweets boolean,
    block_self boolean,
    "name" text,
    "type" text,
    valid boolean,
    PRIMARY KEY (url, alert_id),
    FOREIGN KEY (alert_id) REFERENCES alert(id)
);

CREATE TABLE alert (
    id bigint,
    account_id text,
    color text,
    connection_type text,
    created_at timestamp,
    graph_ql_id text,
    group_graph_ql_id text,
    group_id text,
    index_version bigint,
    last_update timestamp,
    look_for_spread boolean,
    "name" text,
    noise_detection boolean,
    paused boolean,
    permissions_can_use_linkedin_sources boolean,
    permissions_can_use_reviews_sources boolean,
    permissions_create_tag boolean,
    permissions_edit boolean,
    permissions_edit_mentions boolean,
    permissions_export_mentions boolean,
    permissions_list_logs boolean,
    permissions_list_tasks boolean,
    permissions_share boolean,
    query_type text,
    quota_used bigint,
    read_access_secret text,
    "role" text,
    sentiment_analysis boolean,
    slack_configuration_is_configured boolean,
    slack_configuration_minimal_influence_score bigint,
    slack_configuration_new_mentions boolean,
    slack_configuration_recurring_recap boolean,
    slack_configuration_timezone text,
    stats_done_tasks_total bigint,
    stats_favorite_mentions_total bigint,
    stats_logs_total bigint,
    stats_mention_folders_archive_total bigint,
    stats_mention_folders_inbox_total bigint,
    stats_mention_folders_spam_total bigint,
    stats_mention_folders_trash_total bigint,
    stats_mention_sources_total bigint,
    stats_tasks_total bigint,
    stats_todo_tasks_total bigint,
    stats_unread_mentions_total bigint,
    stats_unseen_mentions_total bigint,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE share (
    id text,
    account_id text,
    alert_id bigint,
    blocked boolean,
    created_at timestamp,
    last_seen_count bigint,
    permissions_delete boolean,
    permissions_edit boolean,
    "role" text,
    subscriber boolean,
    weight bigint,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (alert_id) REFERENCES alert(id)
);

CREATE TABLE account_group (
    graph_ql_id text,
    id text,
    account_id text,
    PRIMARY KEY (graph_ql_id, id, account_id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE account (
    id text,
    application_notification_enabled boolean,
    bucket bigint,
    client_state text,
    company_name text,
    company_size text,
    created_at timestamp,
    default_desktop_notification_frequency text,
    default_email_notification_frequency text,
    default_push_notification_frequency text,
    default_trending_email_notification_frequency text,
    default_trending_sms_notification_frequency text,
    email text,
    email_subscriptions_quota_exceeded boolean,
    enabled_mfa boolean,
    extended_profile_set boolean,
    grouped_email_notification boolean,
    hide_mark_all_read_mentions boolean,
    language_code text,
    marketing_notification_enabled boolean,
    "name" text,
    permissions_can_access_dashboard_homepage boolean,
    permissions_can_use_linkedin_sources boolean,
    permissions_can_use_reviews_sources boolean,
    permissions_create_alert boolean,
    permissions_create_dashboard boolean,
    permissions_create_report boolean,
    permissions_create_report_blank boolean,
    permissions_create_report_facebook_comparison boolean,
    permissions_create_report_instagram_comparison boolean,
    permissions_create_report_mentions_list boolean,
    permissions_create_report_twitter_comparison boolean,
    permissions_create_scheduled_report boolean,
    permissions_create_team_request boolean,
    permissions_delete_team_reports boolean,
    permissions_edit_modules_report boolean,
    permissions_list_team_reports boolean,
    permissions_publish_access boolean,
    permissions_read_dashboards boolean,
    permissions_read_demoalert boolean,
    permissions_read_integrations boolean,
    permissions_read_plans_notifications boolean,
    permissions_read_quota_stats boolean,
    permissions_read_reports boolean,
    permissions_read_scheduled_reports boolean,
    permissions_read_social_accounts boolean,
    permissions_read_team_members boolean,
    permissions_read_team_requests boolean,
    permissions_read_team_social_accounts boolean,
    permissions_request_demo boolean,
    permissions_respond_access boolean,
    phone text,
    publish_notif_approved_post_email boolean,
    publish_notif_failure_desktop boolean,
    publish_notif_failure_email boolean,
    publish_notif_in_review_post_email boolean,
    publish_notif_ongoing_desktop boolean,
    publish_notif_ongoing_email boolean,
    publish_notif_success_desktop boolean,
    publish_notif_success_email boolean,
    registration_country text,
    respond_notif_assigned_to_you_desktop boolean,
    respond_notif_assigned_to_you_email boolean,
    respond_notif_new_message_desktop boolean,
    respond_notif_new_message_email boolean,
    seen_onboarding bigint,
    signup_values_job_position text,
    signup_values_use_case bigint,
    subscription_advanced_query_access boolean,
    subscription_billing_account_id text,
    subscription_broadcast_sources_access boolean,
    subscription_chart_access boolean,
    subscription_collaborative_features_access boolean,
    subscription_custom boolean,
    subscription_data_export_access boolean,
    subscription_facebook_keyword_access boolean,
    subscription_feature_discovery_add_alert boolean,
    subscription_feature_discovery_add_team boolean,
    subscription_feature_discovery_assign_task boolean,
    subscription_feature_discovery_check_stats boolean,
    subscription_feature_discovery_share_alert boolean,
    subscription_feature_discovery_social_account boolean,
    subscription_geofiltering_access boolean,
    subscription_has_failed_renews boolean,
    subscription_history bigint,
    subscription_history_access boolean,
    subscription_instant_notification_daily_quota bigint,
    subscription_instant_notification_monthly_quota bigint,
    subscription_instant_notification_monthly_quota_usage bigint,
    subscription_is_blocked boolean,
    subscription_max_alerts bigint,
    subscription_max_languages_per_alert bigint,
    subscription_max_members bigint,
    subscription_max_reports bigint,
    subscription_mentions_quota bigint,
    subscription_mentions_remaining bigint,
    subscription_paid_subscription boolean,
    subscription_permissions_can_manage_account boolean,
    subscription_permissions_change_plan boolean,
    subscription_permissions_manage boolean,
    subscription_permissions_manage_team_members boolean,
    subscription_permissions_use_mfa boolean,
    subscription_permissions_use_sms_for_mfa boolean,
    subscription_permissions_view_price boolean,
    subscription_pinterest_crawling_access boolean,
    subscription_plan_code text,
    subscription_plan_group text,
    subscription_plan_name text,
    subscription_plan_team text,
    subscription_prepaid_remaining bigint,
    subscription_prepaid_until timestamp,
    subscription_publish_access boolean,
    subscription_remaining_days_before_churning bigint,
    subscription_resets_at timestamp,
    subscription_respond_access boolean,
    subscription_search_access boolean,
    subscription_seen_onboarding bigint,
    subscription_sentiment_analysis_access boolean,
    subscription_spread_access boolean,
    subscription_statistics_access boolean,
    subscription_team_owner boolean,
    subscription_tiktok_crawling_access boolean,
    subscription_trial_plan boolean,
    subscription_whitelabeling boolean,
    subscription_youtube_crawling_access boolean,
    team_id text,
    timezone text,
    trial_search_count bigint,
    updated_at timestamp,
    validated_mfa boolean,
    PRIMARY KEY (id)
);

CREATE TABLE children_offset_title (
    title bigint,
    children_id text,
    PRIMARY KEY (title, children_id),
    FOREIGN KEY (children_id) REFERENCES children(id)
);

CREATE TABLE children_offset_description (
    description bigint,
    children_id text,
    PRIMARY KEY (description, children_id),
    FOREIGN KEY (children_id) REFERENCES children(id)
);

CREATE TABLE children_offset_description_medium (
    description_medium bigint,
    children_id text,
    PRIMARY KEY (description_medium, children_id),
    FOREIGN KEY (children_id) REFERENCES children(id)
);

CREATE TABLE children_offset_description_short (
    description_short bigint,
    children_id text,
    PRIMARY KEY (description_short, children_id),
    FOREIGN KEY (children_id) REFERENCES children(id)
);

CREATE TABLE children (
    id text,
    account_id text,
    alert_id bigint,
    mention_id text,
    children_children jsonb,
    children_total bigint,
    country text,
    created_at timestamp,
    cumulative_reach bigint,
    direct_reach bigint,
    display_site boolean,
    favorite boolean,
    folder text,
    folder_set_by_user boolean,
    graph_ql_id text,
    language_code text,
    logs jsonb,
    metadata_twitter_id_str text,
    metadata_twitter_user_id_str text,
    parent_id bigint,
    permissions_change_folder boolean,
    permissions_create_task boolean,
    permissions_edit boolean,
    permissions_favorite boolean,
    permissions_share_email boolean,
    permissions_share_facebook boolean,
    published_at timestamp,
    "read" boolean,
    relevance_score bigint,
    source_type text,
    tags jsonb,
    tasks jsonb,
    tone bigint,
    tone_score bigint,
    unique_id text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (alert_id) REFERENCES alert(id),
    FOREIGN KEY (mention_id) REFERENCES mention(id)
);

CREATE TABLE mention_offset_title (
    title bigint,
    mention_id text,
    PRIMARY KEY (title, mention_id),
    FOREIGN KEY (mention_id) REFERENCES mention(id)
);

CREATE TABLE mention_offset_description (
    description bigint,
    mention_id text,
    PRIMARY KEY (description, mention_id),
    FOREIGN KEY (mention_id) REFERENCES mention(id)
);

CREATE TABLE mention_offset_description_medium (
    description_medium bigint,
    mention_id text,
    PRIMARY KEY (description_medium, mention_id),
    FOREIGN KEY (mention_id) REFERENCES mention(id)
);

CREATE TABLE mention_offset_description_short (
    description_short bigint,
    mention_id text,
    PRIMARY KEY (description_short, mention_id),
    FOREIGN KEY (mention_id) REFERENCES mention(id)
);

CREATE TABLE mention (
    id text,
    account_id text,
    alert_id bigint,
    country text,
    created_at timestamp,
    cumulative_reach bigint,
    direct_reach bigint,
    display_site boolean,
    favorite boolean,
    folder text,
    folder_set_by_user boolean,
    graph_ql_id text,
    language_code text,
    logs jsonb,
    metadata_twitter_id_str text,
    metadata_twitter_user_id_str text,
    permissions_change_folder boolean,
    permissions_create_task boolean,
    permissions_edit boolean,
    permissions_favorite boolean,
    permissions_share_email boolean,
    permissions_share_facebook boolean,
    published_at timestamp,
    "read" boolean,
    relevance_score bigint,
    source_type text,
    tags jsonb,
    tasks jsonb,
    tone bigint,
    tone_score bigint,
    unique_id text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (alert_id) REFERENCES alert(id)
);
