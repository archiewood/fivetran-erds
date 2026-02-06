-- Note
-- This column are only available when connector sync mode is “packed”. For more information, see our Pack Mode documentation.
-- | Column|
-- |--------|
-- | attrbutes |
CREATE TABLE decision (
    id text,
    campaign_id text,
    experiment_id text,
    variation_id text,
    account_id text,
    client_engine text,
    client_version text,
    is_holdback boolean,
    process_timestamp timestamp,
    referer text,
    revision text,
    session_id text,
    "timestamp" timestamp,
    user_agent text,
    user_ip text,
    visitor_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (campaign_id) REFERENCES campaign_history(id),
    FOREIGN KEY (experiment_id) REFERENCES experiment_history(id),
    FOREIGN KEY (variation_id) REFERENCES experiment_variation_history(experiment_id)
);

CREATE TABLE page (
    id bigint,
    project_id bigint,
    activation_code text,
    activation_type text,
    archived boolean,
    category text,
    conditions text,
    created timestamp,
    edit_url text,
    "key" text,
    last_modified timestamp,
    "name" text,
    page_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

-- Note 
-- This tables are available only when connector sync mode is “unpacked”. For more information, see our Pack Mode documentation.
CREATE TABLE conversion_attribute (
    _fivetran_id text,
    conversion_id text,
    id text,
    "name" text,
    "type" text,
    "value" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (conversion_id) REFERENCES conversion(id)
);

CREATE TABLE campaign_history (
    id bigint,
    last_modified timestamp,
    project_id bigint,
    url_targeting_page_id bigint,
    created timestamp,
    earliest timestamp,
    holdback bigint,
    latest timestamp,
    "name" text,
    "status" text,
    url_targeting_activation_code text,
    url_targeting_activation_type text,
    url_targeting_conditions text,
    url_targeting_edit_url text,
    url_targeting_key text,
    PRIMARY KEY (id, last_modified),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (url_targeting_page_id) REFERENCES page(id)
);

CREATE TABLE experiment_change_history (
    id text,
    experiment_id bigint,
    experiment_last_modified timestamp,
    action_id text,
    allow_additional_redirect boolean,
    async boolean,
    destination text,
    extension_id text,
    "name" text,
    operator text,
    preserve_parameters boolean,
    selector text,
    src text,
    "type" text,
    "value" text,
    -- css_* (dynamic column),
    -- tag_attribute_* (dynamic column),
    PRIMARY KEY (id, experiment_id, experiment_last_modified),
    FOREIGN KEY (experiment_id) REFERENCES experiment_history(id),
    FOREIGN KEY (experiment_last_modified) REFERENCES experiment_history(id),
    FOREIGN KEY (action_id) REFERENCES experiment_variation_action_history(variation_id)
);

CREATE TABLE audience (
    id text,
    project_id bigint,
    archived boolean,
    conditions text,
    created timestamp,
    description text,
    last_modified timestamp,
    "name" text,
    segmentation boolean,
    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE campaign_page_history (
    campaign_id bigint,
    campaign_last_modified timestamp,
    page_id bigint,
    PRIMARY KEY (campaign_id, campaign_last_modified, page_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign_history(id),
    FOREIGN KEY (campaign_last_modified) REFERENCES campaign_history(id),
    FOREIGN KEY (page_id) REFERENCES page(id)
);

CREATE TABLE event (
    id bigint,
    project_id bigint,
    page_id bigint,
    archived boolean,
    category text,
    created timestamp,
    description text,
    event_type text,
    is_classic boolean,
    is_editable boolean,
    "key" text,
    "name" text,
    PRIMARY KEY (id, project_id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (page_id) REFERENCES page(id)
);

CREATE TABLE experiment_change_dependency_history (
    dependent_change_id text,
    change_id text,
    experiment_id bigint,
    experiment_last_modified timestamp,
    PRIMARY KEY (dependent_change_id, change_id, experiment_id, experiment_last_modified),
    FOREIGN KEY (change_id) REFERENCES experiment_change_history(id),
    FOREIGN KEY (experiment_id) REFERENCES experiment_history(id),
    FOREIGN KEY (experiment_last_modified) REFERENCES experiment_history(id)
);

CREATE TABLE project (
    id bigint,
    account_id bigint,
    confidence_threshold double precision,
    created timestamp,
    dcp_service_id bigint,
    description text,
    is_classic boolean,
    last_modified timestamp,
    "name" text,
    platform text,
    socket_token text,
    "status" text,
    -- web_snippet_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE sdk (
    "index" bigint,
    project_id bigint,
    sdk_name text,
    PRIMARY KEY ("index", project_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE campaign_change_history (
    id text,
    campaign_id bigint,
    campaign_last_modified timestamp,
    async boolean,
    "name" text,
    selector text,
    src text,
    "type" text,
    "value" text,
    PRIMARY KEY (id, campaign_id, campaign_last_modified),
    FOREIGN KEY (campaign_id) REFERENCES campaign_history(id),
    FOREIGN KEY (campaign_last_modified) REFERENCES campaign_history(id)
);

-- Note 
-- This tables are available only when connector sync mode is “unpacked”. For more information, see our Pack Mode documentation.
CREATE TABLE conversion_tag (
    "key" text,
    conversion_id text,
    "value" text,
    PRIMARY KEY ("key", conversion_id),
    FOREIGN KEY (conversion_id) REFERENCES conversion(id)
);

CREATE TABLE product_usage (
    "index" bigint,
    plan_id bigint,
    allocation_term_in_months bigint,
    end_time timestamp,
    last_update_time timestamp,
    overage_cents_per_visitor bigint,
    product_name text,
    start_time timestamp,
    usage bigint,
    usage_allowance bigint,
    PRIMARY KEY ("index", plan_id),
    FOREIGN KEY (plan_id) REFERENCES plan(id)
);

CREATE TABLE extension (
    id bigint,
    project_id bigint,
    archived boolean,
    created timestamp,
    description text,
    edit_url text,
    enabled boolean,
    last_modified timestamp,
    "name" text,
    -- implementation_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE field (
    "index" bigint,
    extension_id bigint,
    api_name text,
    default_value text,
    field_type text,
    label text,
    PRIMARY KEY ("index", extension_id),
    FOREIGN KEY (extension_id) REFERENCES extension(id)
);

CREATE TABLE group_entity (
    id bigint,
    group_id bigint,
    kind text,
    weight bigint,
    PRIMARY KEY (id),
    FOREIGN KEY (group_id) REFERENCES "group"(id)
);

CREATE TABLE plan (
    id bigint,
    plan_name text,
    "status" text,
    unit_of_measurement text,
    PRIMARY KEY (id)
);

CREATE TABLE attribute (
    id bigint,
    project_id bigint,
    archived boolean,
    condition_type text,
    description text,
    "key" text,
    last_modified timestamp,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE campaign_metric_history (
    _fivetran_id text,
    campaign_id bigint,
    campaign_last_modified timestamp,
    event_id bigint,
    aggregator text,
    field text,
    scope text,
    winning_direction text,
    PRIMARY KEY (_fivetran_id, campaign_id, campaign_last_modified),
    FOREIGN KEY (campaign_id) REFERENCES campaign_history(id),
    FOREIGN KEY (campaign_last_modified) REFERENCES campaign_history(id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE "group" (
    id bigint,
    project_id bigint,
    archived boolean,
    created timestamp,
    description text,
    last_modified timestamp,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE experiment_history (
    id bigint,
    last_modified timestamp,
    campaign_id bigint,
    project_id bigint,
    url_targeting_page_id bigint,
    allocation_policy text,
    audience_conditions text,
    created timestamp,
    description text,
    earliest timestamp,
    holdback bigint,
    "key" text,
    latest timestamp,
    "name" text,
    schedule_start_time timestamp,
    schedule_stop_time timestamp,
    schedule_time_zone text,
    "status" text,
    "type" text,
    url_targeting_activation_code text,
    url_targeting_activation_type text,
    url_targeting_conditions text,
    url_targeting_edit_url text,
    url_targeting_key text,
    PRIMARY KEY (id, last_modified),
    FOREIGN KEY (campaign_id) REFERENCES campaign_history(id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (url_targeting_page_id) REFERENCES page(id)
);

CREATE TABLE experiment_variation_history (
    id bigint,
    experiment_id bigint,
    experiment_last_modified timestamp,
    archived boolean,
    description text,
    "key" text,
    "name" text,
    "status" text,
    weight bigint,
    PRIMARY KEY (id, experiment_id, experiment_last_modified),
    FOREIGN KEY (experiment_id) REFERENCES experiment_history(id),
    FOREIGN KEY (experiment_last_modified) REFERENCES experiment_history(id)
);

CREATE TABLE campaign_change_dependency_history (
    campaign_id bigint,
    campaign_last_modified timestamp,
    change_id text,
    dependent_change_id text,
    PRIMARY KEY (campaign_id, campaign_last_modified, change_id, dependent_change_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign_history(id),
    FOREIGN KEY (campaign_last_modified) REFERENCES campaign_history(id),
    FOREIGN KEY (change_id) REFERENCES campaign_change_history(id),
    FOREIGN KEY (dependent_change_id) REFERENCES campaign_change_history(id)
);

-- Note 
-- This tables are available only when connector sync mode is “unpacked”. For more information, see our Pack Mode documentation.
CREATE TABLE decision_attribute (
    _fivetran_id text,
    decision_id text,
    id text,
    "name" text,
    "type" text,
    "value" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (decision_id) REFERENCES decision(id)
);

CREATE TABLE experiment_metric_history (
    _fivetran_id text,
    experiment_id bigint,
    experiment_last_modified timestamp,
    event_id bigint,
    aggregator text,
    field text,
    scope text,
    winning_direction text,
    PRIMARY KEY (_fivetran_id, experiment_id, experiment_last_modified),
    FOREIGN KEY (experiment_id) REFERENCES experiment_history(id),
    FOREIGN KEY (experiment_last_modified) REFERENCES experiment_history(id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE project_status (
    last_modified timestamp,
    project_id bigint,
    description text,
    platform text,
    "status" text,
    PRIMARY KEY (last_modified, project_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE list_attribute (
    id bigint,
    project_id bigint,
    account_id bigint,
    archived boolean,
    created timestamp,
    description text,
    key_field text,
    last_modified timestamp,
    list_type text,
    "name" text,
    s_3_path text,
    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE experiment_result_history (
    experiment_id bigint,
    experiment_last_modified timestamp,
    metric_name text,
    metric_variation_id text,
    confidence_threshold double precision,
    end_time timestamp,
    metric_aggregator text,
    metric_conclusion_loser text,
    metric_conclusion_winner text,
    metric_event_id text,
    metric_scope text,
    metric_variation_is_baseline boolean,
    metric_variation_level text,
    metric_variation_lift_confidence_interval jsonb,
    metric_variation_lift_is_most_conclusive boolean,
    metric_variation_lift_is_significant boolean,
    metric_variation_lift_lift_status text,
    metric_variation_lift_significance double precision,
    metric_variation_lift_value double precision,
    metric_variation_name text,
    metric_variation_rate double precision,
    metric_variation_samples double precision,
    metric_variation_value double precision,
    metric_variation_variance double precision,
    metric_winning_direction text,
    PRIMARY KEY (experiment_id, experiment_last_modified, metric_name, metric_variation_id)
);

CREATE TABLE experiment_page_history (
    experiment_id bigint,
    experiment_last_modified timestamp,
    page_id bigint,
    PRIMARY KEY (experiment_id, experiment_last_modified, page_id),
    FOREIGN KEY (experiment_id) REFERENCES experiment_history(id),
    FOREIGN KEY (experiment_last_modified) REFERENCES experiment_history(id),
    FOREIGN KEY (page_id) REFERENCES page(id)
);

-- Note 
-- This tables are available only when connector sync mode is “unpacked”. For more information, see our Pack Mode documentation.
CREATE TABLE conversion_experiment (
    "index" integer,
    conversion_id text,
    campaign_id text,
    experiment_id text,
    variation_id text,
    is_holdback boolean,
    PRIMARY KEY ("index", conversion_id),
    FOREIGN KEY (conversion_id) REFERENCES conversion(id),
    FOREIGN KEY (campaign_id) REFERENCES campaign_history(id),
    FOREIGN KEY (experiment_id) REFERENCES experiment_history(id),
    FOREIGN KEY (variation_id) REFERENCES experiment_variation_history(experiment_id)
);

-- Note
-- These columns are only available when connector sync mode is “packed”. For more information, see our Pack Mode documentation.
-- | Columns|
-- |--------|
-- | attrbutes |
-- | experiments |
-- | tags|
CREATE TABLE conversion (
    id text,
    account_id text,
    client_engine text,
    client_version text,
    entity_id text,
    event_name text,
    event_type text,
    process_timestamp timestamp,
    quantity bigint,
    referer text,
    revenue bigint,
    revision text,
    session_id text,
    "timestamp" timestamp,
    user_agent text,
    user_ip text,
    "value" double precision,
    visitor_id text,
    PRIMARY KEY (id)
);

CREATE TABLE experiment_variation_action_history (
    _fivetran_id text,
    experiment_id bigint,
    experiment_last_modified timestamp,
    variation_id bigint,
    page_id bigint,
    share_link text,
    PRIMARY KEY (_fivetran_id, experiment_id, experiment_last_modified, variation_id),
    FOREIGN KEY (experiment_id) REFERENCES experiment_history(id),
    FOREIGN KEY (experiment_last_modified) REFERENCES experiment_history(id),
    FOREIGN KEY (variation_id) REFERENCES experiment_variation_history(experiment_id),
    FOREIGN KEY (page_id) REFERENCES page(id)
);
