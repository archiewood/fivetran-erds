CREATE TABLE first_exposures_report (
    _fivetran_id text,
    group_id text,
    as_of_pst_date text,
    company_id text,
    experiment_group text,
    exposure_type text,
    first_exposure_pst_date text,
    first_exposure_utc timestamp,
    "name" text,
    percents double precision,
    rollout bigint,
    rule text,
    stable_id text,
    unit_id text,
    unit_type text,
    user_dimensions jsonb,
    user_id text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (group_id) REFERENCES experiment_group(_fivetran_id)
);

CREATE TABLE ingestion_run_granular_history (
    ingestion_run_id text,
    "source" text,
    "status" text,
    status_timestamp text,
    PRIMARY KEY (ingestion_run_id, "source", "status")
);

CREATE TABLE ingestion_run (
    id text,
    created_at text,
    last_updated_at text,
    latest_status text,
    "trigger" text,
    PRIMARY KEY (id)
);

CREATE TABLE audit_log (
    id text,
    action_type text,
    change_log text,
    "date" text,
    modifier_email text,
    "name" text,
    tags jsonb,
    target_app_id text,
    "time" text,
    updated_by text,
    updated_by_user_id text,
    PRIMARY KEY (id)
);

CREATE TABLE audit_log_change_rule (
    id text,
    rule_type text,
    audit_log_id text,
    enabled_enviroment jsonb,
    environment text,
    group_name text,
    percentage_pass text,
    rollouts jsonb,
    salt text,
    PRIMARY KEY (id, rule_type, audit_log_id),
    FOREIGN KEY (audit_log_id) REFERENCES audit_log(id)
);

CREATE TABLE audit_log_change_rule_condition (
    _fivetran_id text,
    audit_log_change_rule_id text,
    audit_log_id text,
    rule_type text,
    condition_type text,
    extra_config jsonb,
    operator text,
    "value" jsonb,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (audit_log_change_rule_id) REFERENCES audit_log_change_rule(id),
    FOREIGN KEY (audit_log_id) REFERENCES audit_log_change_rule(audit_log_id),
    FOREIGN KEY (rule_type) REFERENCES audit_log_change_rule(rule_type)
);

CREATE TABLE dynamic_config_holdout (
    "index" text,
    dynamic_config_id text,
    holdout_id text,
    PRIMARY KEY ("index", dynamic_config_id),
    FOREIGN KEY (dynamic_config_id) REFERENCES dynamic_config(id),
    FOREIGN KEY (holdout_id) REFERENCES holdout(id)
);

CREATE TABLE dynamic_config_rule_condition (
    "index" text,
    dynamic_config_id text,
    dynamic_config_rule_name text,
    custom_id text,
    field text,
    operator text,
    target_value jsonb,
    "type" text,
    PRIMARY KEY ("index", dynamic_config_id, dynamic_config_rule_name),
    FOREIGN KEY (dynamic_config_id) REFERENCES dynamic_config_rule(dynamic_config_id),
    FOREIGN KEY (dynamic_config_rule_name) REFERENCES dynamic_config_rule("name")
);

CREATE TABLE dynamic_config_rule (
    "name" text,
    dynamic_config_id text,
    environments jsonb,
    pass_percentage text,
    return_value_key jsonb,
    PRIMARY KEY ("name", dynamic_config_id),
    FOREIGN KEY (dynamic_config_id) REFERENCES dynamic_config(id)
);

CREATE TABLE dynamic_config_tag (
    "index" text,
    dynamic_config_id text,
    tags text,
    PRIMARY KEY ("index", dynamic_config_id),
    FOREIGN KEY (dynamic_config_id) REFERENCES dynamic_config(id)
);

CREATE TABLE dynamic_config (
    id text,
    created_time text,
    creator_email text,
    creator_id text,
    creator_name text,
    default_value_key jsonb,
    description text,
    id_type text,
    is_enabled text,
    last_modified_time text,
    last_modifier_email text,
    last_modifier_id text,
    last_modifier_name text,
    "name" text,
    "status" text,
    target_apps jsonb,
    team text,
    "type" text,
    type_reason text,
    PRIMARY KEY (id)
);

CREATE TABLE experiment_holdout (
    "index" text,
    experiment_id text,
    holdout_id text,
    PRIMARY KEY ("index", experiment_id),
    FOREIGN KEY (experiment_id) REFERENCES experiment(id),
    FOREIGN KEY (holdout_id) REFERENCES holdout(id)
);

CREATE TABLE experiment_group (
    _fivetran_id text,
    experiment_id text,
    description text,
    id text,
    "name" text,
    "size" text,
    -- parameter_values_* (dynamic column),
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (experiment_id) REFERENCES experiment(id)
);

CREATE TABLE experiment_health_check (
    "index" text,
    experiment_id text,
    description text,
    metadata jsonb,
    "name" text,
    "status" text,
    "type" text,
    PRIMARY KEY ("index", experiment_id),
    FOREIGN KEY (experiment_id) REFERENCES experiment(id)
);

CREATE TABLE experiment_primary_metric (
    experiment_id text,
    "name" text,
    "type" text,
    PRIMARY KEY (experiment_id, "name"),
    FOREIGN KEY (experiment_id) REFERENCES experiment(id),
    FOREIGN KEY ("name") REFERENCES metric("name")
);

CREATE TABLE experiment_primary_metric_tag (
    "index" text,
    experiment_id text,
    tags text,
    PRIMARY KEY ("index", experiment_id),
    FOREIGN KEY (experiment_id) REFERENCES experiment(id),
    FOREIGN KEY (tags) REFERENCES metric_tag(tags)
);

CREATE TABLE experiment_secondary_metric (
    experiment_id text,
    "name" text,
    "type" text,
    PRIMARY KEY (experiment_id, "name"),
    FOREIGN KEY (experiment_id) REFERENCES experiment(id),
    FOREIGN KEY ("name") REFERENCES metric("name")
);

CREATE TABLE experiment_secondary_metric_tag (
    "index" text,
    experiment_id text,
    tags text,
    PRIMARY KEY ("index", experiment_id),
    FOREIGN KEY (experiment_id) REFERENCES experiment(id),
    FOREIGN KEY (tags) REFERENCES metric_tag(tags)
);

CREATE TABLE experiment_tag (
    "index" text,
    experiment_id text,
    tags text,
    PRIMARY KEY ("index", experiment_id),
    FOREIGN KEY (experiment_id) REFERENCES experiment(id)
);

CREATE TABLE experiment_allowed_reviewer (
    id text,
    experiment_id text,
    email text,
    "name" text,
    PRIMARY KEY (id, experiment_id),
    FOREIGN KEY (experiment_id) REFERENCES experiment(id)
);

CREATE TABLE experiment_other_matrix (
    "index" text,
    experiment_id text,
    "name" text,
    direction text,
    hypothesized_value text,
    "type" text,
    PRIMARY KEY ("index", experiment_id),
    FOREIGN KEY (experiment_id) REFERENCES experiment(id),
    FOREIGN KEY ("name") REFERENCES metric("name")
);

CREATE TABLE experiment_assignment_source_filter (
    "index" text,
    experiment_id text,
    columns text,
    "condition" text,
    values jsonb,
    PRIMARY KEY ("index", experiment_id),
    FOREIGN KEY (experiment_id) REFERENCES experiment(id)
);

CREATE TABLE experiment_link (
    "index" text,
    experiment_id text,
    title text,
    url text,
    PRIMARY KEY ("index", experiment_id),
    FOREIGN KEY (experiment_id) REFERENCES experiment(id)
);

CREATE TABLE experiment (
    id text,
    layer_id text,
    targeting_gate_id text,
    active_review_description text,
    active_review_id text,
    active_review_status text,
    allocation text,
    allocation_duration text,
    analysis_end_time text,
    analytics_type text,
    assignment_source_experiment_name text,
    assignment_source_name text,
    benjamini_hochberg_per_metric text,
    benjamini_hochberg_per_variant text,
    benjamini_primary_metrics_only text,
    bonferroni_correction text,
    bonferroni_correction_per_metric text,
    cohort_wait_until_end_to_include text,
    cohorted_analysis_duration text,
    cohorted_metrics_mature_after_end text,
    control_group_id text,
    created_time text,
    creator_email text,
    creator_id text,
    creator_name text,
    decision_reason text,
    decision_time text,
    default_confidence_interval text,
    description text,
    duration text,
    end_time text,
    external_experiment_name text,
    fixed_analysis_duration text,
    health_check_status text,
    hypothesis text,
    id_type text,
    identifier_mapping_mode text,
    identity_resolution_source text,
    inline_targeting_rules_json text,
    is_analysis_only text,
    last_modified_time text,
    last_modifier_email text,
    last_modifier_id text,
    last_modifier_name text,
    launched_group_id text,
    "name" text,
    owner_email text,
    owner_id text,
    owner_name text,
    owner_type text,
    review_settings_required_review text,
    scheduled_reload_hour text,
    scheduled_reload_type text,
    secondary_id_type text,
    sequential_testing text,
    start_time text,
    "status" text,
    subtype text,
    target_apps jsonb,
    target_exposure text,
    team text,
    team_id text,
    version text,
    PRIMARY KEY (id),
    FOREIGN KEY (layer_id) REFERENCES layer(id),
    FOREIGN KEY (targeting_gate_id) REFERENCES gate(id)
);

CREATE TABLE pulse_daily_report (
    _fivetran_id text,
    absolute_delta double precision,
    absolute_standard_error double precision,
    company_id text,
    control_mean double precision,
    control_standard_error double precision,
    control_units bigint,
    experiment_group text,
    mean double precision,
    metric_dimension text,
    metric_name text,
    metric_type text,
    "name" text,
    participating_units bigint,
    pst_date text,
    relative_delta double precision,
    relative_standard_error double precision,
    rule text,
    standard_deviation double precision,
    standard_error double precision,
    test_mean double precision,
    test_standard_error double precision,
    test_units bigint,
    total double precision,
    units bigint,
    varpop double precision,
    z_score double precision,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE holdout_tag (
    "index" text,
    holdout_id text,
    tags text,
    PRIMARY KEY ("index", holdout_id),
    FOREIGN KEY (holdout_id) REFERENCES holdout(id)
);

CREATE TABLE holdout (
    id text,
    created_time text,
    creator_email text,
    creator_id text,
    creator_name text,
    description text,
    id_type text,
    is_enabled text,
    is_global text,
    last_modified_time text,
    last_modifier_email text,
    last_modifier_id text,
    last_modifier_name text,
    "name" text,
    pass_percentage text,
    target_apps jsonb,
    targeting_gate_id text,
    team text,
    PRIMARY KEY (id)
);

CREATE TABLE autotune_holdout (
    "index" text,
    autotune_id text,
    holdout_id text,
    PRIMARY KEY ("index", autotune_id),
    FOREIGN KEY (autotune_id) REFERENCES autotune(id),
    FOREIGN KEY (holdout_id) REFERENCES holdout(id)
);

CREATE TABLE autotune_tag (
    "index" text,
    autotune_id text,
    tags text,
    PRIMARY KEY ("index", autotune_id),
    FOREIGN KEY (autotune_id) REFERENCES autotune(id)
);

CREATE TABLE autotune_variant (
    id text,
    autotune_id text,
    json jsonb,
    "name" text,
    PRIMARY KEY (id, autotune_id),
    FOREIGN KEY (autotune_id) REFERENCES autotune(id)
);

CREATE TABLE autotune (
    id text,
    attribution_window text,
    created_time text,
    creator_email text,
    creator_id text,
    creator_name text,
    description text,
    exploration_window text,
    id_type text,
    is_started text,
    last_modified_time text,
    last_modifier_email text,
    last_modifier_id text,
    last_modifier_name text,
    "name" text,
    success_event text,
    success_event_value text,
    target_apps jsonb,
    winner text,
    winner_threshold text,
    PRIMARY KEY (id)
);

CREATE TABLE segment_holdout (
    "index" text,
    segment_id text,
    holdout_id text,
    PRIMARY KEY ("index", segment_id),
    FOREIGN KEY (segment_id) REFERENCES segment(id),
    FOREIGN KEY (holdout_id) REFERENCES holdout(id)
);

CREATE TABLE segment_tag (
    "index" text,
    segment_id text,
    tags text,
    PRIMARY KEY ("index", segment_id),
    FOREIGN KEY (segment_id) REFERENCES segment(id)
);

CREATE TABLE segment_rule_condition_target_value (
    _fivetran_id text,
    segment_id text,
    segment_rule_condition_index text,
    segment_rule_name text,
    target_value text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (segment_id) REFERENCES segment_rule_condition(segment_id),
    FOREIGN KEY (segment_rule_condition_index) REFERENCES segment_rule_condition("index"),
    FOREIGN KEY (segment_rule_name) REFERENCES segment_rule_condition(segment_rule_name)
);

CREATE TABLE segment_rule_condition (
    "index" text,
    segment_id text,
    segment_rule_name text,
    custom_id text,
    field text,
    operator text,
    "type" text,
    PRIMARY KEY ("index", segment_id, segment_rule_name),
    FOREIGN KEY (segment_id) REFERENCES segment_rule(segment_id),
    FOREIGN KEY (segment_rule_name) REFERENCES segment_rule("name")
);

CREATE TABLE segment_rule (
    "name" text,
    segment_id text,
    environments jsonb,
    pass_percentage text,
    PRIMARY KEY ("name", segment_id),
    FOREIGN KEY (segment_id) REFERENCES segment(id)
);

CREATE TABLE segment (
    id text,
    count text,
    created_time text,
    creator_email text,
    creator_id text,
    creator_name text,
    description text,
    id_type text,
    is_enabled text,
    last_modified_time text,
    last_modifier_email text,
    last_modifier_id text,
    last_modifier_name text,
    "name" text,
    "status" text,
    target_apps jsonb,
    team text,
    "type" text,
    type_reason text,
    PRIMARY KEY (id)
);

CREATE TABLE ingestion_status (
    _fivetran_id text,
    date_stamp text,
    ingestion_dataset text,
    ingestion_source text,
    message text,
    row_count text,
    "status" text,
    time_stamp text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE metric_unit_type (
    "index" text,
    metric_id text,
    unit_type text,
    PRIMARY KEY ("index", metric_id),
    FOREIGN KEY (metric_id) REFERENCES metric(id)
);

CREATE TABLE metric_tag (
    "index" text,
    metric_id text,
    tags text,
    PRIMARY KEY ("index", metric_id),
    FOREIGN KEY (metric_id) REFERENCES metric(id)
);

CREATE TABLE metric (
    id text,
    created_time text,
    creator_email text,
    creator_name text,
    description text,
    is_hidden text,
    lineage_events jsonb,
    lineage_metrics jsonb,
    "name" text,
    owner_name text,
    tags jsonb,
    team text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE gate_holdout (
    "index" text,
    gate_id text,
    holdout_id text,
    PRIMARY KEY ("index", gate_id),
    FOREIGN KEY (gate_id) REFERENCES gate(id),
    FOREIGN KEY (holdout_id) REFERENCES holdout(id)
);

CREATE TABLE gate_rule_condition_target_value (
    _fivetran_id text,
    gate_id text,
    gate_rule_condition_index text,
    gate_rule_name text,
    target_value text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (gate_id) REFERENCES gate_rule_condition(gate_id),
    FOREIGN KEY (gate_rule_condition_index) REFERENCES gate_rule_condition("index"),
    FOREIGN KEY (gate_rule_name) REFERENCES gate_rule_condition(gate_rule_name)
);

CREATE TABLE gate_rule_condition (
    "index" text,
    gate_id text,
    gate_rule_name text,
    custom_id text,
    field text,
    operator text,
    "type" text,
    PRIMARY KEY ("index", gate_id, gate_rule_name),
    FOREIGN KEY (gate_id) REFERENCES gate_rule(gate_id),
    FOREIGN KEY (gate_rule_name) REFERENCES gate_rule("name")
);

CREATE TABLE gate_rule (
    "name" text,
    gate_id text,
    environments jsonb,
    pass_percentage text,
    PRIMARY KEY ("name", gate_id),
    FOREIGN KEY (gate_id) REFERENCES gate(id)
);

CREATE TABLE gate_tag (
    "index" text,
    gate_id text,
    tags text,
    PRIMARY KEY ("index", gate_id),
    FOREIGN KEY (gate_id) REFERENCES gate(id)
);

CREATE TABLE gate_allowed_reviewer (
    id text,
    gate_id text,
    email text,
    "name" text,
    PRIMARY KEY (id, gate_id),
    FOREIGN KEY (gate_id) REFERENCES gate(id)
);

CREATE TABLE gate_monitoring_metric (
    "index" text,
    gate_id text,
    "name" text,
    "type" text,
    PRIMARY KEY ("index", gate_id),
    FOREIGN KEY (gate_id) REFERENCES gate(id)
);

CREATE TABLE gate (
    id text,
    active_review_description text,
    active_review_id text,
    active_review_status text,
    checks_per_hour text,
    created_time text,
    creator_email text,
    creator_id text,
    creator_name text,
    description text,
    id_type text,
    is_enabled text,
    last_modified_time text,
    last_modifier_email text,
    last_modifier_id text,
    last_modifier_name text,
    measure_metric_lifts text,
    "name" text,
    owner_email text,
    owner_id text,
    owner_name text,
    owner_type text,
    release_pipeline_id text,
    review_settings_required_review text,
    "status" text,
    target_apps jsonb,
    team text,
    team_id text,
    "type" text,
    type_reason text,
    version text,
    PRIMARY KEY (id)
);

CREATE TABLE layer_tag (
    "index" text,
    layer_id text,
    tags text,
    PRIMARY KEY ("index", layer_id),
    FOREIGN KEY (layer_id) REFERENCES layer(id)
);

CREATE TABLE layer_holdout (
    "index" text,
    layer_id text,
    holdout_id text,
    PRIMARY KEY ("index", layer_id),
    FOREIGN KEY (layer_id) REFERENCES layer(id),
    FOREIGN KEY (holdout_id) REFERENCES holdout(id)
);

CREATE TABLE layer_parameter (
    "index" text,
    layer_id text,
    default_value text,
    "name" text,
    "type" text,
    PRIMARY KEY ("index", layer_id),
    FOREIGN KEY (layer_id) REFERENCES layer(id)
);

CREATE TABLE layer (
    id text,
    created_time text,
    creator_email text,
    creator_id text,
    creator_name text,
    description text,
    id_type text,
    is_implicit_layer text,
    last_modified_time text,
    last_modifier_email text,
    last_modifier_id text,
    last_modifier_name text,
    pass_percentage text,
    target_apps jsonb,
    team text,
    PRIMARY KEY (id)
);

CREATE TABLE event_updated (
    time_uuid text,
    event_name text,
    stable_id text,
    statsig_metadata_sdk_type text,
    statsig_metadata_sdk_version text,
    statsig_metadata_statsig_request_id text,
    statsig_metadata_statsig_tier text,
    time_stamp text,
    user_agent text,
    user_app_version text,
    user_browser_name text,
    user_browser_version text,
    user_country text,
    user_email text,
    user_id text,
    user_ip text,
    user_locale text,
    user_system_name text,
    user_system_version text,
    "value" text,
    -- metadata_* (dynamic column),
    -- user_custom_* (dynamic column),
    PRIMARY KEY (time_uuid)
);

CREATE TABLE event_config_change (
    _fivetran_id text,
    event_name text,
    time_stamp text,
    time_uuid text,
    user_email text,
    user_name text,
    -- metadata_* (dynamic column),
    PRIMARY KEY (_fivetran_id)
);
