CREATE TABLE company_property (
    id text,
    created_at timestamp,
    description text,
    integration text,
    kind text,
    last_seen_at timestamp,
    "name" text,
    prop text,
    types jsonb,
    updated_at timestamp,
    values jsonb,
    PRIMARY KEY (id)
);

CREATE TABLE domain (
    id text,
    url_group_id_ text,
    archived_at timestamp,
    created_at timestamp,
    domain text,
    enabled text,
    first_seen_at timestamp,
    host text,
    installed_at timestamp,
    last_seen_at timestamp,
    updated_at timestamp,
    url_group_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (url_group_id_) REFERENCES environment(id)
);

CREATE TABLE environment (
    id text,
    archived_at timestamp,
    created_at timestamp,
    description text,
    "name" text,
    short_name text,
    style_short_name_color text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE micro_survey_response (
    id text,
    profile_company_id text,
    profile_id text,
    survey_id text,
    button_id text,
    button_order text,
    button_text text,
    comment_step_button_selected text,
    comment_step_button_selected_2 text,
    comment_step_dropdown_item text,
    comment_step_dropdown_item_2 text,
    comment_step_input_text text,
    comment_step_input_text_2 text,
    comment_step_other_text text,
    comment_step_other_text_2 text,
    created_at timestamp,
    dropdown_items text,
    finished_at timestamp,
    href text,
    input_text text,
    input_text_2 text,
    other_text text,
    profile_company_uid text,
    profile_uid text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (profile_company_id) REFERENCES company(id),
    FOREIGN KEY (profile_id) REFERENCES user_profile(id),
    FOREIGN KEY (survey_id) REFERENCES micro_survey(id)
);

CREATE TABLE tour_interaction (
    id text,
    profile_company_id text,
    profile_id text,
    tour_id text,
    created_at timestamp,
    defer_count text,
    defer_until text,
    goal_at timestamp,
    group_id text,
    group_kind text,
    profile_company_uid text,
    profile_uid text,
    "state" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (profile_company_id) REFERENCES company(id),
    FOREIGN KEY (profile_id) REFERENCES user_profile(id),
    FOREIGN KEY (tour_id) REFERENCES tour(id)
);

CREATE TABLE rate_limit_group_campaign (
    campaign_id text,
    rate_limit_group_id text,
    PRIMARY KEY (campaign_id, rate_limit_group_id),
    FOREIGN KEY (rate_limit_group_id) REFERENCES rate_limit_group(id)
);

CREATE TABLE rate_limit_group_tag (
    rate_limit_group_id text,
    tag_id text,
    PRIMARY KEY (rate_limit_group_id, tag_id),
    FOREIGN KEY (rate_limit_group_id) REFERENCES rate_limit_group(id),
    FOREIGN KEY (tag_id) REFERENCES tags(id)
);

CREATE TABLE rate_limit_group (
    id text,
    created_at timestamp,
    kind text,
    "name" text,
    rate_limit_kind text,
    rate_limit_size text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE webhook (
    _fivetran_id text,
    id text,
    last_item_at timestamp,
    last_item_error text,
    last_item_state text,
    "name" text,
    uid text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE profile_property (
    id text,
    created_at timestamp,
    description text,
    integration text,
    kind text,
    last_seen_at timestamp,
    "name" text,
    prop text,
    types jsonb,
    updated_at timestamp,
    values jsonb,
    PRIMARY KEY (id)
);

CREATE TABLE experience_delivery (
    id text,
    interaction_id text,
    profile_id text,
    at timestamp,
    at_href text,
    created_at timestamp,
    delivery_ids_at_limit text,
    delivery_ids_limit text,
    delivery_ids_position text,
    from_date timestamp,
    group_kind text,
    idempotency_key text,
    model_id text,
    model_kind text,
    once boolean,
    options text,
    skip_triggers boolean,
    skip_url_match boolean,
    until timestamp,
    updated_at timestamp,
    use_segmentation boolean,
    PRIMARY KEY (id),
    FOREIGN KEY (interaction_id) REFERENCES tour_interaction(id),
    FOREIGN KEY (profile_id) REFERENCES user_profile(id)
);

CREATE TABLE segment_item (
    id text,
    segment_id text,
    created_at timestamp,
    kind text,
    mod text,
    op text,
    prop text,
    "range" text,
    updated_at timestamp,
    "value" text,
    PRIMARY KEY (id),
    FOREIGN KEY (segment_id) REFERENCES segment(id)
);

CREATE TABLE segment (
    id text,
    created_at timestamp,
    "name" text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE launcher_item (
    id text,
    segment_id text,
    campaign_id text,
    created_at timestamp,
    description text,
    hide boolean,
    kind text,
    script text,
    title text,
    updated_at timestamp,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (segment_id) REFERENCES segment(id)
);

CREATE TABLE launcher_tag (
    launcher_id text,
    tag_id text,
    PRIMARY KEY (launcher_id, tag_id),
    FOREIGN KEY (launcher_id) REFERENCES launcher(id),
    FOREIGN KEY (tag_id) REFERENCES tags(id)
);

CREATE TABLE launcher (
    id text,
    segment_id text,
    blocked_domains text,
    created_at timestamp,
    description text,
    empty_state_content text,
    icon_size text,
    list_type text,
    "name" text,
    position_type text,
    preset text,
    published_at timestamp,
    quantifier_url text,
    quantifier_urls jsonb,
    screen_position text,
    search_placeholder text,
    stats_completed_count text,
    stats_exited_count text,
    stats_last_completed_at timestamp,
    stats_last_exited_at timestamp,
    stats_last_started_at timestamp,
    stats_started_count text,
    title text,
    "trigger" text,
    trigger_text text,
    trigger_type text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (segment_id) REFERENCES segment(id)
);

CREATE TABLE zapier_hook (
    _fivetran_id text,
    id text,
    last_item_at timestamp,
    last_item_error text,
    last_item_state text,
    "name" text,
    uid text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE user_profile (
    id text,
    company_id text,
    browser_k text,
    browser_l text,
    browser_n text,
    browser_tz text,
    browser_x text,
    company jsonb,
    created_at timestamp,
    delivery_ids jsonb,
    email text,
    first_name text,
    invited_users_count text,
    last_import_at timestamp,
    last_seen_at timestamp,
    last_seen_session_count text,
    percents text,
    "role" text,
    uid text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (company_id) REFERENCES company(id)
);

CREATE TABLE user_profile_segment (
    id text,
    user_profile_temp_segment_id text,
    PRIMARY KEY (id)
);

CREATE TABLE company (
    id text,
    clv text,
    created_at timestamp,
    domain text,
    last_action_at timestamp,
    "name" text,
    plan text,
    uid text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE data_import_property (
    _fivetran_id text,
    data_import_id text,
    "name" text,
    prop text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (data_import_id) REFERENCES data_import(id)
);

CREATE TABLE data_import_head_column (
    _fivetran_id text,
    data_import_id text,
    "name" text,
    values jsonb,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (data_import_id) REFERENCES data_import(id)
);

CREATE TABLE data_import (
    id text,
    created_at timestamp,
    import_at timestamp,
    kind text,
    model_kind text,
    "name" text,
    on_model_missing text,
    stats_last_import_at timestamp,
    stats_last_import_state text,
    stats_last_row bigint,
    stats_rows_count bigint,
    tag_import_id text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE tooltip_tag (
    tag_id text,
    tooltip_id text,
    PRIMARY KEY (tag_id, tooltip_id),
    FOREIGN KEY (tag_id) REFERENCES tags(id),
    FOREIGN KEY (tooltip_id) REFERENCES tooltip(id)
);

CREATE TABLE tooltip (
    id text,
    created_at timestamp,
    "name" text,
    "position" text,
    published_at timestamp,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE alert_group_campaign (
    campaign_id text,
    alert_group_id text,
    PRIMARY KEY (campaign_id, alert_group_id),
    FOREIGN KEY (alert_group_id) REFERENCES alert_group(id)
);

CREATE TABLE alert_group_experience (
    id text,
    alert_group_id text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (alert_group_id) REFERENCES alert_group(id)
);

CREATE TABLE alert_group_tag (
    alert_group_id text,
    tag_id text,
    PRIMARY KEY (alert_group_id, tag_id),
    FOREIGN KEY (alert_group_id) REFERENCES alert_group(id),
    FOREIGN KEY (tag_id) REFERENCES tags(id)
);

CREATE TABLE alert_group (
    id text,
    created_at timestamp,
    emails jsonb,
    "interval" text,
    kind text,
    last_notified_at timestamp,
    "name" text,
    opt_in_email_at timestamp,
    opt_in_slack_at timestamp,
    published_at timestamp,
    slack_uid text,
    style text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE micro_survey_tag (
    micro_survey_id text,
    tag_id text,
    PRIMARY KEY (micro_survey_id, tag_id),
    FOREIGN KEY (micro_survey_id) REFERENCES micro_survey(id),
    FOREIGN KEY (tag_id) REFERENCES tags(id)
);

CREATE TABLE micro_survey (
    id text,
    segment_id text,
    created_at timestamp,
    last_dropdown_items text,
    "name" text,
    "position" text,
    published_at timestamp,
    rate_unlimit_at text,
    stats_completed_count text,
    stats_exited_count text,
    stats_last_completed_at timestamp,
    stats_last_exited_at timestamp,
    stats_last_started_at timestamp,
    stats_started_count text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (segment_id) REFERENCES segment(id)
);

CREATE TABLE tags (
    id text,
    created_at timestamp,
    description text,
    disabled_at timestamp,
    last_seen_at timestamp,
    models_count text,
    "name" text,
    uid text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE tour_tag (
    tag_id text,
    tour_id text,
    PRIMARY KEY (tag_id, tour_id),
    FOREIGN KEY (tag_id) REFERENCES tags(id),
    FOREIGN KEY (tour_id) REFERENCES tour(id)
);

CREATE TABLE tour (
    id text,
    segment_id text,
    archived_at timestamp,
    created_at timestamp,
    experiment_at timestamp,
    experiment_range text,
    "name" text,
    "position" text,
    published_at timestamp,
    rate_unlimit_at timestamp,
    stats_completed_count text,
    stats_exited_count text,
    stats_last_completed_at timestamp,
    stats_last_exited_at timestamp,
    stats_last_started_at timestamp,
    stats_started_count text,
    style text,
    tour_link_url text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (segment_id) REFERENCES segment(id)
);
