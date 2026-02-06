CREATE TABLE variation_stack (
    "index" text,
    campaign_id text,
    variation_id text,
    workspace_id text,
    creator text,
    depending text,
    el text,
    el_dependent_on text,
    identifier text,
    leading_comments text,
    meta_info jsonb,
    modified text,
    op_name text,
    op_vwo_css_display text,
    original_short_selector_path text,
    parent_short_selector_path text,
    parent_tag text,
    segment_active text,
    segment_class text,
    segment_device text,
    segment_real_device text,
    segment_real_url text,
    segment_url text,
    segment_url_regex text,
    short_selector_path text,
    trailing_comments text,
    variables jsonb,
    xpath text,
    PRIMARY KEY ("index", campaign_id, variation_id, workspace_id),
    FOREIGN KEY (campaign_id) REFERENCES variation(campaign_id),
    FOREIGN KEY (variation_id) REFERENCES variation(id),
    FOREIGN KEY (workspace_id) REFERENCES variation(workspace_id)
);

CREATE TABLE variation (
    id text,
    campaign_id text,
    workspace_id text,
    section_id text,
    editor_data_registered_triggers jsonb,
    heatmap_thumb_url text,
    is_control text,
    is_disabled text,
    "name" text,
    percent_split text,
    screenshots_quick text,
    PRIMARY KEY (id, campaign_id, workspace_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id),
    FOREIGN KEY (section_id) REFERENCES "section"(id)
);

CREATE TABLE campaign_detail_variation (
    campaign_detail_id text,
    id text,
    workspace_id text,
    PRIMARY KEY (campaign_detail_id, id, workspace_id),
    FOREIGN KEY (campaign_detail_id) REFERENCES campaign_detail(id),
    FOREIGN KEY (id) REFERENCES variation(id),
    FOREIGN KEY (workspace_id) REFERENCES campaign_detail(workspace_id)
);

CREATE TABLE campaign_detail_goal (
    campaign_detail_id text,
    id text,
    workspace_id text,
    PRIMARY KEY (campaign_detail_id, id, workspace_id),
    FOREIGN KEY (campaign_detail_id) REFERENCES campaign_detail(id),
    FOREIGN KEY (id) REFERENCES goal(id),
    FOREIGN KEY (workspace_id) REFERENCES campaign_detail(workspace_id)
);

CREATE TABLE campaign_detail (
    id text,
    workspace_id text,
    data_interval_range jsonb,
    device text,
    integrations_clicktaleenabled text,
    integrations_gaenabled text,
    integrations_gaprefix text,
    integrations_gaslot text,
    integrations_gtmenabled text,
    integrations_uadimension text,
    integrations_uaenabled text,
    integrations_uaprefix text,
    is_cross_domain_enabled text,
    is_deleted text,
    is_global_segment_enabled text,
    schedules jsonb,
    thershold_losing_percent text,
    thershold_visitors text,
    thershold_winning_percent text,
    variation_goal_data jsonb,
    PRIMARY KEY (id, workspace_id),
    FOREIGN KEY (id) REFERENCES campaign(id),
    FOREIGN KEY (workspace_id) REFERENCES campaign(workspace_id)
);

CREATE TABLE label (
    id text,
    workspace_id text,
    "name" text,
    PRIMARY KEY (id, workspace_id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id)
);

CREATE TABLE workspace (
    id text,
    company_name text,
    company_size text,
    company_website text,
    created_on text,
    enabled text,
    is_active text,
    is_main_account text,
    "name" text,
    timezone text,
    PRIMARY KEY (id)
);

CREATE TABLE campaign_url (
    "index" text,
    campaign_id text,
    workspace_id text,
    "type" text,
    "value" text,
    PRIMARY KEY ("index", campaign_id, workspace_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (workspace_id) REFERENCES campaign(workspace_id)
);

CREATE TABLE campaign_goal_partial_collection (
    "index" text,
    campaign_id text,
    workspace_id text,
    id text,
    average_data_conversion_count text,
    average_data_conversion_rate text,
    average_data_visitor_count text,
    is_primary text,
    "name" text,
    "type" text,
    PRIMARY KEY ("index", campaign_id, workspace_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (workspace_id) REFERENCES campaign(workspace_id),
    FOREIGN KEY (id) REFERENCES goal(id)
);

CREATE TABLE campaign (
    id text,
    workspace_id text,
    created_by_id text,
    associate_campaign jsonb,
    campaign_group jsonb,
    created_by_image_url text,
    created_on text,
    excluded_urls jsonb,
    is_bayesian text,
    is_deleted text,
    labels jsonb,
    "name" text,
    platform text,
    primary_goal text,
    primary_url text,
    stats_expected_conversion_rate text,
    stats_expected_daily_visitor text,
    stats_expected_improvement_rate text,
    stats_expected_revenue_per_visitor text,
    stats_threshold_of_caring text,
    "status" text,
    "type" text,
    variation_partial_collection jsonb,
    variation_total_count text,
    PRIMARY KEY (id, workspace_id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id),
    FOREIGN KEY (created_by_id) REFERENCES users(id)
);

CREATE TABLE partner (
    _fivetran_id text,
    commission_disbursed text,
    commission_percent text,
    free_users text,
    paid_users text,
    referral_code text,
    sales text,
    total_commission text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE project_language (
    "index" text,
    project_id text,
    workspace_id text,
    languages text,
    PRIMARY KEY ("index", project_id, workspace_id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (workspace_id) REFERENCES project(workspace_id)
);

CREATE TABLE project_environment (
    id text,
    project_id text,
    workspace_id text,
    is_enabled text,
    "name" text,
    token text,
    webhook_is_enabled text,
    webhook_secret_key text,
    webhook_url text,
    PRIMARY KEY (id, project_id, workspace_id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (workspace_id) REFERENCES project(workspace_id)
);

CREATE TABLE project (
    id text,
    workspace_id text,
    created_by_image_url text,
    created_by_name text,
    created_on text,
    modified_on text,
    "name" text,
    PRIMARY KEY (id, workspace_id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id)
);

CREATE TABLE billing_cycle_invoice (
    id text,
    billing_cycle_id text,
    link text,
    "type" text,
    PRIMARY KEY (id, billing_cycle_id),
    FOREIGN KEY (billing_cycle_id) REFERENCES billing_cycle(id)
);

CREATE TABLE billing_cycle_usage (
    "index" text,
    billing_cycle_id text,
    account text,
    visitors_used text,
    PRIMARY KEY ("index", billing_cycle_id),
    FOREIGN KEY (billing_cycle_id) REFERENCES billing_cycle(id)
);

CREATE TABLE billing_cycle (
    id text,
    unique_id text,
    extension_of text,
    extensions text,
    is_current text,
    is_paid text,
    is_v_4_plan_description text,
    is_v_4_plan_id text,
    is_v_4_plan_is_enterprise text,
    is_v_4_plan_is_top_visitor_plan text,
    is_v_4_plan_is_unlimited_plan text,
    is_v_4_plan_is_v_4_plan text,
    is_v_4_plan_price text,
    is_v_4_plan_processor_id text,
    is_v_4_plan_total_visitors text,
    is_v_4_plan_type text,
    research_visitors_allowed text,
    sf_contract_amount text,
    sf_contract_is_paid text,
    sf_contract_is_payment_required text,
    sf_contract_sf_contact_id text,
    visitor_allowed text,
    visitors_used text,
    workspace_from text,
    workspace_to text,
    PRIMARY KEY (id),
    FOREIGN KEY (unique_id) REFERENCES workspace(id)
);

CREATE TABLE goal_css_selector (
    "index" text,
    campaign_id text,
    goal_id text,
    workspace_id text,
    css_selectors text,
    PRIMARY KEY ("index", campaign_id, goal_id, workspace_id),
    FOREIGN KEY (campaign_id) REFERENCES goal(campaign_id),
    FOREIGN KEY (goal_id) REFERENCES goal(id),
    FOREIGN KEY (workspace_id) REFERENCES goal(workspace_id)
);

CREATE TABLE goal (
    id text,
    campaign_id text,
    workspace_id text,
    excluded_urls jsonb,
    is_created_in_editor text,
    is_primary text,
    "name" text,
    p_excluded_urls jsonb,
    p_urls jsonb,
    "type" text,
    urls jsonb,
    PRIMARY KEY (id, campaign_id, workspace_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id)
);

CREATE TABLE feature_variable (
    id text,
    feature_id text,
    workspace_id text,
    data_type text,
    default_value text,
    variable_name text,
    PRIMARY KEY (id, feature_id, workspace_id),
    FOREIGN KEY (feature_id) REFERENCES feature(id),
    FOREIGN KEY (workspace_id) REFERENCES feature(workspace_id)
);

CREATE TABLE feature_associated_campaign (
    id text,
    feature_id text,
    workspace_id text,
    "name" text,
    "status" text,
    "type" text,
    PRIMARY KEY (id, feature_id, workspace_id),
    FOREIGN KEY (feature_id) REFERENCES feature(id),
    FOREIGN KEY (workspace_id) REFERENCES feature(workspace_id)
);

CREATE TABLE feature (
    id text,
    workspace_id text,
    created_by_image_url text,
    created_by_name text,
    created_on text,
    modified_on text,
    "name" text,
    setting_is_editable text,
    PRIMARY KEY (id, workspace_id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id)
);

CREATE TABLE campaign_share_link (
    _fivetran_id text,
    campaign_id text,
    workspace_id text,
    share_link text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id)
);

CREATE TABLE users (
    id text,
    workspace_id text,
    country text,
    created_on text,
    department text,
    email text,
    "name" text,
    permission text,
    phone text,
    title text,
    PRIMARY KEY (id, workspace_id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id)
);

CREATE TABLE section_variation (
    campaign_id text,
    id text,
    section_id text,
    workspace_id text,
    PRIMARY KEY (campaign_id, id, section_id, workspace_id),
    FOREIGN KEY (campaign_id) REFERENCES "section"(campaign_id),
    FOREIGN KEY (id) REFERENCES variation(id),
    FOREIGN KEY (section_id) REFERENCES "section"(id),
    FOREIGN KEY (workspace_id) REFERENCES "section"(workspace_id)
);

CREATE TABLE "section" (
    id text,
    campaign_id text,
    workspace_id text,
    css_selector text,
    "name" text,
    PRIMARY KEY (id, campaign_id, workspace_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id)
);
