CREATE TABLE incident_postmortem (
    incident_id text,
    body text,
    body_draft text,
    body_draft_updated_at text,
    body_updated_at text,
    created_at text,
    custom_tweet text,
    incident_page_id text,
    notify_subscribers text,
    notify_twitter text,
    preview_key text,
    published_at text,
    updated_at text,
    PRIMARY KEY (incident_id),
    FOREIGN KEY (incident_id) REFERENCES incident(id)
);

CREATE TABLE incident_subscriber_component (
    component_id text,
    incident_id text,
    incident_subscriber_id text,
    PRIMARY KEY (component_id, incident_id, incident_subscriber_id),
    FOREIGN KEY (incident_id) REFERENCES incident_subscriber(incident_id),
    FOREIGN KEY (incident_subscriber_id) REFERENCES incident_subscriber(id)
);

CREATE TABLE incident_subscriber (
    id text,
    incident_id text,
    page_access_user_id text,
    created_at text,
    email text,
    endpoint text,
    mode text,
    obfuscated_channel_name text,
    phone_country text,
    phone_number text,
    purge_at text,
    quarantined_at text,
    skip_confirmation_notification text,
    workspace_name text,
    PRIMARY KEY (id, incident_id),
    FOREIGN KEY (incident_id) REFERENCES incident(id),
    FOREIGN KEY (page_access_user_id) REFERENCES page_access_user(id)
);

CREATE TABLE incident_component (
    component_id text,
    incident_id text,
    PRIMARY KEY (component_id, incident_id),
    FOREIGN KEY (component_id) REFERENCES component(id),
    FOREIGN KEY (incident_id) REFERENCES incident(id)
);

CREATE TABLE incident_update (
    id text,
    incident_id text,
    body text,
    created_at text,
    custom_tweet text,
    deliver_notifications text,
    display_at text,
    "status" text,
    tweet_id text,
    twitter_updated_at text,
    updated_at text,
    wants_twitter_update text,
    PRIMARY KEY (id, incident_id),
    FOREIGN KEY (incident_id) REFERENCES incident(id)
);

CREATE TABLE incident (
    id text,
    page_id text,
    auto_transition_deliver_notifications_at_end text,
    auto_transition_deliver_notifications_at_start text,
    auto_transition_to_maintenance_state text,
    auto_transition_to_operational_state text,
    created_at text,
    impact text,
    impact_override text,
    jira_issue_id text,
    monitoring_at text,
    "name" text,
    postmortem_body text,
    postmortem_body_last_updated_at text,
    postmortem_ignored text,
    postmortem_notified_subscribers text,
    postmortem_notified_twitter text,
    postmortem_published_at text,
    resolved_at text,
    scheduled_auto_completed text,
    scheduled_auto_in_progress text,
    scheduled_for text,
    scheduled_remind_prior text,
    scheduled_reminded_at text,
    scheduled_until text,
    shortlink text,
    "status" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (page_id) REFERENCES page(id)
);

CREATE TABLE incident_affected_component (
    component_id text,
    incident_id text,
    incident_update_id text,
    new_status text,
    old_status text,
    PRIMARY KEY (component_id, incident_id, incident_update_id),
    FOREIGN KEY (component_id) REFERENCES component(id),
    FOREIGN KEY (incident_id) REFERENCES incident_update(incident_id),
    FOREIGN KEY (incident_update_id) REFERENCES incident_update(id)
);

CREATE TABLE page_access_user_metric (
    metric_id text,
    page_access_user_id text,
    PRIMARY KEY (metric_id, page_access_user_id),
    FOREIGN KEY (metric_id) REFERENCES metric(id),
    FOREIGN KEY (page_access_user_id) REFERENCES page_access_user(id)
);

CREATE TABLE page_status_embed_config (
    page_id text,
    incident_background_color text,
    incident_text_color text,
    maintenance_background_color text,
    maintenance_text_color text,
    "position" text,
    PRIMARY KEY (page_id),
    FOREIGN KEY (page_id) REFERENCES page(id)
);

CREATE TABLE page_access_user (
    id text,
    page_access_group_id text,
    page_id text,
    created_at text,
    email text,
    external_login text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (page_access_group_id) REFERENCES page_access_group(id),
    FOREIGN KEY (page_id) REFERENCES page(id)
);

CREATE TABLE unsubscribed_component (
    component_id text,
    unsubscribed_id text,
    PRIMARY KEY (component_id, unsubscribed_id),
    FOREIGN KEY (unsubscribed_id) REFERENCES unsubscribed(id)
);

CREATE TABLE unsubscribed (
    id text,
    page_access_user_id text,
    page_id text,
    created_at text,
    email text,
    endpoint text,
    mode text,
    obfuscated_channel_name text,
    phone_country text,
    phone_number text,
    purge_at text,
    quarantined_at text,
    skip_confirmation_notification text,
    workspace_name text,
    PRIMARY KEY (id),
    FOREIGN KEY (page_access_user_id) REFERENCES page_access_user(id),
    FOREIGN KEY (page_id) REFERENCES page(id)
);

CREATE TABLE template_component (
    component_id text,
    template_id text,
    PRIMARY KEY (component_id, template_id),
    FOREIGN KEY (component_id) REFERENCES component(id),
    FOREIGN KEY (template_id) REFERENCES template(id)
);

CREATE TABLE template (
    id text,
    page_id text,
    body text,
    group_id text,
    "name" text,
    should_send_notifications text,
    should_tweet text,
    title text,
    update_status text,
    PRIMARY KEY (id),
    FOREIGN KEY (page_id) REFERENCES page(id)
);

CREATE TABLE subscriber_component (
    component_id text,
    subscriber_id text,
    PRIMARY KEY (component_id, subscriber_id),
    FOREIGN KEY (subscriber_id) REFERENCES subscriber(id)
);

CREATE TABLE subscriber (
    id text,
    page_access_user_id text,
    page_id text,
    created_at timestamp,
    email text,
    endpoint text,
    mode text,
    obfuscated_channel_name text,
    phone_country text,
    phone_number text,
    purge_at text,
    quarantined_at text,
    skip_confirmation_notification text,
    workspace_name text,
    PRIMARY KEY (id),
    FOREIGN KEY (page_access_user_id) REFERENCES page_access_user(id),
    FOREIGN KEY (page_id) REFERENCES page(id)
);

CREATE TABLE page_access_user_component (
    component_id text,
    page_access_user_id text,
    PRIMARY KEY (component_id, page_access_user_id),
    FOREIGN KEY (component_id) REFERENCES component(id),
    FOREIGN KEY (page_access_user_id) REFERENCES page_access_user(id)
);

CREATE TABLE page_access_group_user (
    page_access_group_id text,
    page_access_user_id text,
    PRIMARY KEY (page_access_group_id, page_access_user_id),
    FOREIGN KEY (page_access_group_id) REFERENCES page_access_group(id),
    FOREIGN KEY (page_access_user_id) REFERENCES page_access_user(id)
);

CREATE TABLE page_access_group_metric (
    metric_id text,
    page_access_group_id text,
    PRIMARY KEY (metric_id, page_access_group_id),
    FOREIGN KEY (metric_id) REFERENCES metric(id),
    FOREIGN KEY (page_access_group_id) REFERENCES page_access_group(id)
);

CREATE TABLE page_access_group_component (
    component_id text,
    page_access_group_id text,
    PRIMARY KEY (component_id, page_access_group_id),
    FOREIGN KEY (component_id) REFERENCES component(id),
    FOREIGN KEY (page_access_group_id) REFERENCES page_access_group(id)
);

CREATE TABLE page_access_group (
    id text,
    page_id text,
    created_at text,
    external_identifier text,
    "name" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (page_id) REFERENCES page(id)
);

CREATE TABLE metric (
    id text,
    metrics_provider_id text,
    page_id text,
    backfill_percentage text,
    backfilled text,
    created_at text,
    decimal_places text,
    display text,
    last_fetched_at text,
    metric_identifier text,
    most_recent_data_at text,
    "name" text,
    reference_name text,
    suffix text,
    tooltip_description text,
    updated_at text,
    y_axis_hidden text,
    y_axis_max text,
    y_axis_min text,
    PRIMARY KEY (id),
    FOREIGN KEY (metrics_provider_id) REFERENCES metric_provider(id),
    FOREIGN KEY (page_id) REFERENCES page(id)
);

CREATE TABLE page (
    id text,
    activity_score text,
    allow_email_subscribers text,
    allow_incident_subscribers text,
    allow_page_subscribers text,
    allow_rss_atom_feeds text,
    allow_sms_subscribers text,
    allow_webhook_subscribers text,
    branding text,
    city text,
    country text,
    created_at text,
    css_blues text,
    css_body_background_color text,
    css_border_color text,
    css_font_color text,
    css_graph_color text,
    css_greens text,
    css_light_font_color text,
    css_link_color text,
    css_no_data text,
    css_oranges text,
    css_reds text,
    css_yellows text,
    domain text,
    email_logo_normal_url text,
    email_logo_original_url text,
    email_logo_retina_url text,
    email_logo_size text,
    email_logo_updated_at text,
    favicon_logo_size text,
    favicon_logo_updated_at text,
    favicon_logo_url text,
    headline text,
    hero_cover_normal_url text,
    hero_cover_original_url text,
    hero_cover_retina_url text,
    hero_cover_size text,
    hero_cover_updated_at text,
    hidden_from_search text,
    ip_restrictions text,
    "name" text,
    notifications_email_footer text,
    notifications_from_email text,
    page_description text,
    "state" text,
    subdomain text,
    support_url text,
    time_zone text,
    transactional_logo_normal_url text,
    transactional_logo_original_url text,
    transactional_logo_retina_url text,
    transactional_logo_size text,
    transactional_logo_updated_at text,
    twitter_logo_size text,
    twitter_logo_updated_at text,
    twitter_logo_url text,
    twitter_username text,
    updated_at text,
    url text,
    viewers_must_be_team_members text,
    PRIMARY KEY (id)
);

CREATE TABLE metric_provider (
    id text,
    page_id text,
    created_at text,
    disabled text,
    last_revalidated_at text,
    metric_base_uri text,
    "type" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (page_id) REFERENCES page(id)
);

CREATE TABLE user_permission (
    page_id text,
    user_id text,
    incident_manager text,
    maintenance_manager text,
    page_configuration text,
    PRIMARY KEY (page_id, user_id),
    FOREIGN KEY (page_id) REFERENCES page(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE component (
    id text,
    component_group_id text,
    page_id text,
    automation_email text,
    created_at text,
    description text,
    is_group text,
    "name" text,
    only_show_if_degraded text,
    "position" text,
    showcase text,
    start_date text,
    "status" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (component_group_id) REFERENCES component_group(id),
    FOREIGN KEY (page_id) REFERENCES page(id)
);

CREATE TABLE users (
    id text,
    created_at text,
    email text,
    first_name text,
    last_name text,
    organization text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE component_group (
    id text,
    page_id text,
    created_at text,
    description text,
    "name" text,
    "position" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (page_id) REFERENCES page(id)
);
