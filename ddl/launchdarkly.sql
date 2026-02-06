CREATE TABLE audit_log_access (
    "index" text,
    audit_log_id text,
    "action" text,
    resource text,
    PRIMARY KEY ("index", audit_log_id),
    FOREIGN KEY (audit_log_id) REFERENCES audit_log(id)
);

CREATE TABLE audit_log_target_resource (
    "index" text,
    audit_log_id text,
    resource text,
    PRIMARY KEY ("index", audit_log_id),
    FOREIGN KEY (audit_log_id) REFERENCES audit_log(id)
);

CREATE TABLE audit_log (
    id text,
    account_id text,
    app_id text,
    app_is_scim text,
    app_maintainer_name text,
    app_name text,
    "comment" text,
    "date" text,
    description text,
    kind text,
    member_email text,
    member_first_name text,
    member_id text,
    member_last_name text,
    "name" text,
    parent_name text,
    parent_resource text,
    short_description text,
    subject_avatar_url text,
    subject_name text,
    target_name text,
    title text,
    title_verb text,
    token_ending text,
    token_id text,
    token_name text,
    token_service_token text,
    -- app_links_* (dynamic column),
    -- links_* (dynamic column),
    -- member_links_* (dynamic column),
    -- parent_links_* (dynamic column),
    -- subject_links_* (dynamic column),
    -- target_links_* (dynamic column),
    -- token_links_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE project_tag (
    "index" text,
    project_key text,
    tags text,
    PRIMARY KEY ("index", project_key),
    FOREIGN KEY (project_key) REFERENCES project("key")
);

CREATE TABLE project (
    "key" text,
    id text,
    include_in_snippet_by_default text,
    "name" text,
    using_environment_id text,
    using_mobile_key text,
    PRIMARY KEY ("key")
);

CREATE TABLE flag_default_project_tag (
    "index" text,
    _fivetran_id text,
    tags text,
    PRIMARY KEY ("index", _fivetran_id),
    FOREIGN KEY (_fivetran_id) REFERENCES flag_default_project(_fivetran_id)
);

CREATE TABLE flag_default_project (
    _fivetran_id text,
    project_key text,
    false_description text,
    false_display_name text,
    off_variation text,
    on_variation text,
    temporary text,
    true_description text,
    true_display_name text,
    using_environment_id text,
    using_mobile_key text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (project_key) REFERENCES project("key")
);

CREATE TABLE tags (
    "index" text,
    environment_key text,
    tags text,
    PRIMARY KEY ("index", environment_key),
    FOREIGN KEY (environment_key) REFERENCES environment("key")
);

CREATE TABLE required_approval_tag (
    "index" text,
    environment_key text,
    tags text,
    PRIMARY KEY ("index", environment_key),
    FOREIGN KEY (environment_key) REFERENCES environment("key")
);

CREATE TABLE environment (
    "key" text,
    project_key text,
    bypass_approvals_for_pending_changes text,
    can_apply_declined_changes text,
    can_review_own_request text,
    color text,
    confirm_change text,
    default_track_event text,
    default_ttl text,
    id text,
    min_num_approvals text,
    "name" text,
    require_comment text,
    required text,
    secure_mode text,
    service_config jsonb,
    service_kind text,
    PRIMARY KEY ("key"),
    FOREIGN KEY (project_key) REFERENCES project("key")
);

CREATE TABLE feature_flag_variation (
    id text,
    feature_flag_key text,
    feature_flag_project_key text,
    description text,
    "name" text,
    "value" text,
    PRIMARY KEY (id, feature_flag_key, feature_flag_project_key),
    FOREIGN KEY (feature_flag_key) REFERENCES feature_flag("key"),
    FOREIGN KEY (feature_flag_project_key) REFERENCES feature_flag(project_key)
);

CREATE TABLE feature_flag_tag (
    "index" text,
    feature_flag_key text,
    feature_flag_project_key text,
    tags text,
    PRIMARY KEY ("index", feature_flag_key, feature_flag_project_key),
    FOREIGN KEY (feature_flag_key) REFERENCES feature_flag("key"),
    FOREIGN KEY (feature_flag_project_key) REFERENCES feature_flag(project_key)
);

CREATE TABLE feature_flag_experiment_environment (
    "index" text,
    feature_flag_key text,
    feature_flag_project_key text,
    main_metric_key text,
    environment text,
    PRIMARY KEY ("index", feature_flag_key, feature_flag_project_key, main_metric_key),
    FOREIGN KEY (feature_flag_key) REFERENCES feature_flag_experiment(feature_flag_key),
    FOREIGN KEY (feature_flag_project_key) REFERENCES feature_flag_experiment(feature_flag_project_key),
    FOREIGN KEY (main_metric_key) REFERENCES feature_flag_experiment(main_metric_key)
);

CREATE TABLE feature_flag_experiment (
    feature_flag_key text,
    feature_flag_project_key text,
    main_metric_key text,
    metric_key text,
    -- environment_setting_* (dynamic column),
    PRIMARY KEY (feature_flag_key, feature_flag_project_key, main_metric_key),
    FOREIGN KEY (feature_flag_key) REFERENCES feature_flag("key"),
    FOREIGN KEY (feature_flag_project_key) REFERENCES feature_flag(project_key),
    FOREIGN KEY (main_metric_key) REFERENCES metric("key"),
    FOREIGN KEY (metric_key) REFERENCES metric("key")
);

CREATE TABLE feature_flag_environment_rule_clause (
    id text,
    feature_flag_environment_index text,
    feature_flag_environment_rule_id text,
    feature_flag_key text,
    feature_flag_project_key text,
    attribute text,
    context_kind text,
    negate text,
    op text,
    values jsonb,
    PRIMARY KEY (id, feature_flag_environment_index, feature_flag_environment_rule_id, feature_flag_key, feature_flag_project_key),
    FOREIGN KEY (feature_flag_environment_index) REFERENCES feature_flag_environment_rule(feature_flag_environment_index),
    FOREIGN KEY (feature_flag_environment_rule_id) REFERENCES feature_flag_environment_rule(id),
    FOREIGN KEY (feature_flag_key) REFERENCES feature_flag_environment_rule(feature_flag_key),
    FOREIGN KEY (feature_flag_project_key) REFERENCES feature_flag_environment_rule(feature_flag_project_key)
);

CREATE TABLE feature_flag_environment_rule_rollout_variation (
    "index" text,
    feature_flag_environment_index text,
    feature_flag_environment_rule_id text,
    feature_flag_key text,
    feature_flag_project_key text,
    untracked text,
    variation text,
    weight text,
    PRIMARY KEY ("index", feature_flag_environment_index, feature_flag_environment_rule_id, feature_flag_key, feature_flag_project_key),
    FOREIGN KEY (feature_flag_environment_index) REFERENCES feature_flag_environment_rule(feature_flag_environment_index),
    FOREIGN KEY (feature_flag_environment_rule_id) REFERENCES feature_flag_environment_rule(id),
    FOREIGN KEY (feature_flag_key) REFERENCES feature_flag_environment_rule(feature_flag_key),
    FOREIGN KEY (feature_flag_project_key) REFERENCES feature_flag_environment_rule(feature_flag_project_key)
);

CREATE TABLE feature_flag_environment_rule (
    id text,
    feature_flag_environment_index text,
    feature_flag_key text,
    feature_flag_project_key text,
    description text,
    ref text,
    rollout_bucket_by text,
    rollout_context_kind text,
    rollout_experiment_allocation_can_reshuffle text,
    rollout_experiment_allocation_default_variation text,
    rollout_seed text,
    track_event text,
    variation text,
    PRIMARY KEY (id, feature_flag_environment_index, feature_flag_key, feature_flag_project_key),
    FOREIGN KEY (feature_flag_environment_index) REFERENCES feature_flag_environment("index"),
    FOREIGN KEY (feature_flag_key) REFERENCES feature_flag_environment(feature_flag_key),
    FOREIGN KEY (feature_flag_project_key) REFERENCES feature_flag_environment(feature_flag_project_key)
);

CREATE TABLE feature_flag_environment_fallthrough_rollout_variation (
    "index" text,
    feature_flag_environment_index text,
    feature_flag_key text,
    feature_flag_project_key text,
    untracked text,
    variation text,
    weight text,
    PRIMARY KEY ("index", feature_flag_environment_index, feature_flag_key, feature_flag_project_key),
    FOREIGN KEY (feature_flag_environment_index) REFERENCES feature_flag_environment("index"),
    FOREIGN KEY (feature_flag_key) REFERENCES feature_flag_environment(feature_flag_key),
    FOREIGN KEY (feature_flag_project_key) REFERENCES feature_flag_environment(feature_flag_project_key)
);

CREATE TABLE feature_flag_environment_target (
    "index" text,
    feature_flag_environment_index text,
    feature_flag_key text,
    feature_flag_project_key text,
    context_kind text,
    values jsonb,
    variation text,
    PRIMARY KEY ("index", feature_flag_environment_index, feature_flag_key, feature_flag_project_key),
    FOREIGN KEY (feature_flag_environment_index) REFERENCES feature_flag_environment("index"),
    FOREIGN KEY (feature_flag_key) REFERENCES feature_flag_environment(feature_flag_key),
    FOREIGN KEY (feature_flag_project_key) REFERENCES feature_flag_environment(feature_flag_project_key)
);

CREATE TABLE feature_flag_environment_context_target (
    "index" text,
    feature_flag_environment_index text,
    feature_flag_key text,
    feature_flag_project_key text,
    context_kind text,
    values jsonb,
    variation text,
    PRIMARY KEY ("index", feature_flag_environment_index, feature_flag_key, feature_flag_project_key),
    FOREIGN KEY (feature_flag_environment_index) REFERENCES feature_flag_environment("index"),
    FOREIGN KEY (feature_flag_key) REFERENCES feature_flag_environment(feature_flag_key),
    FOREIGN KEY (feature_flag_project_key) REFERENCES feature_flag_environment(feature_flag_project_key)
);

CREATE TABLE feature_flag_environment_prerequisite (
    "index" text,
    feature_flag_environment_index text,
    feature_flag_key text,
    feature_flag_project_key text,
    "key" text,
    variation text,
    PRIMARY KEY ("index", feature_flag_environment_index, feature_flag_key, feature_flag_project_key),
    FOREIGN KEY (feature_flag_environment_index) REFERENCES feature_flag_environment("index"),
    FOREIGN KEY (feature_flag_key) REFERENCES feature_flag_environment(feature_flag_key),
    FOREIGN KEY (feature_flag_project_key) REFERENCES feature_flag_environment(feature_flag_project_key)
);

CREATE TABLE feature_flag_environment_action_denied (
    "index" text,
    feature_flag_environment_index text,
    feature_flag_key text,
    feature_flag_project_key text,
    "action" text,
    reason jsonb,
    PRIMARY KEY ("index", feature_flag_environment_index, feature_flag_key, feature_flag_project_key),
    FOREIGN KEY (feature_flag_environment_index) REFERENCES feature_flag_environment("index"),
    FOREIGN KEY (feature_flag_key) REFERENCES feature_flag_environment(feature_flag_key),
    FOREIGN KEY (feature_flag_project_key) REFERENCES feature_flag_environment(feature_flag_project_key)
);

CREATE TABLE feature_flag_environment_action_allowed (
    "index" text,
    feature_flag_environment_index text,
    feature_flag_key text,
    feature_flag_project_key text,
    "action" text,
    reason jsonb,
    PRIMARY KEY ("index", feature_flag_environment_index, feature_flag_key, feature_flag_project_key),
    FOREIGN KEY (feature_flag_environment_index) REFERENCES feature_flag_environment("index"),
    FOREIGN KEY (feature_flag_key) REFERENCES feature_flag_environment(feature_flag_key),
    FOREIGN KEY (feature_flag_project_key) REFERENCES feature_flag_environment(feature_flag_project_key)
);

CREATE TABLE feature_flag_environment_evaluation (
    "index" text,
    feature_flag_environment_index text,
    feature_flag_key text,
    feature_flag_project_key text,
    context_kind text,
    PRIMARY KEY ("index", feature_flag_environment_index, feature_flag_key, feature_flag_project_key),
    FOREIGN KEY (feature_flag_environment_index) REFERENCES feature_flag_environment("index"),
    FOREIGN KEY (feature_flag_key) REFERENCES feature_flag_environment(feature_flag_key),
    FOREIGN KEY (feature_flag_project_key) REFERENCES feature_flag_environment(feature_flag_project_key)
);

CREATE TABLE feature_flag_environment (
    "index" text,
    feature_flag_key text,
    feature_flag_project_key text,
    archived text,
    debug_events_until_date text,
    environment_name text,
    fallthrough_rollout_bucket_by text,
    fallthrough_rollout_context_kind text,
    fallthrough_rollout_experiment_allocation_can_reshuffle text,
    fallthrough_rollout_experiment_allocation_default_variation text,
    fallthrough_rollout_seed text,
    fallthrough_variation text,
    is_on text,
    last_modified text,
    migration_setting_check_ratio text,
    off_variation text,
    salt text,
    sel text,
    site_href text,
    site_type text,
    summary_prerequisite text,
    track_event text,
    track_event_fallthrough text,
    version text,
    -- summary_variations_* (dynamic column),
    PRIMARY KEY ("index", feature_flag_key, feature_flag_project_key),
    FOREIGN KEY (feature_flag_key) REFERENCES feature_flag("key"),
    FOREIGN KEY (feature_flag_project_key) REFERENCES feature_flag(project_key)
);

CREATE TABLE feature_flag (
    "key" text,
    project_key text,
    associated_maintainer_id text,
    associated_maintainer_team_key text,
    maintainer_id text,
    maintainer_team_key text,
    archived text,
    archived_date text,
    baseline_idx text,
    creation_date text,
    deprecated text,
    deprecated_date text,
    description text,
    include_in_snippet text,
    kind text,
    maintainer_email text,
    maintainer_first_name text,
    maintainer_last_name text,
    maintainer_role text,
    migration_setting_context_kind text,
    migration_setting_stage_count text,
    "name" text,
    off_variation text,
    on_variation text,
    purpose text,
    temporary text,
    using_environment_id text,
    using_mobile_key text,
    version text,
    -- custom_property_* (dynamic column),
    PRIMARY KEY ("key", project_key),
    FOREIGN KEY (associated_maintainer_id) REFERENCES maintainer(id),
    FOREIGN KEY (associated_maintainer_team_key) REFERENCES team("key"),
    FOREIGN KEY (maintainer_id) REFERENCES maintainer(id),
    FOREIGN KEY (maintainer_team_key) REFERENCES team("key")
);

CREATE TABLE rule_clause (
    id text,
    environment_key text,
    project_key text,
    segment_key text,
    segment_rule_id text,
    attribute text,
    negate text,
    op text,
    values jsonb,
    PRIMARY KEY (id, environment_key, project_key, segment_key, segment_rule_id),
    FOREIGN KEY (environment_key) REFERENCES segment_rule(environment_key),
    FOREIGN KEY (project_key) REFERENCES segment_rule(project_key),
    FOREIGN KEY (segment_key) REFERENCES segment_rule(segment_key),
    FOREIGN KEY (segment_rule_id) REFERENCES segment_rule(id)
);

CREATE TABLE segment_rule (
    id text,
    environment_key text,
    project_key text,
    segment_key text,
    bucket_by text,
    rollout_context_kind text,
    weight text,
    PRIMARY KEY (id, environment_key, project_key, segment_key),
    FOREIGN KEY (environment_key) REFERENCES segment(environment_key),
    FOREIGN KEY (project_key) REFERENCES segment(project_key),
    FOREIGN KEY (segment_key) REFERENCES segment("key")
);

CREATE TABLE segment_tags (
    "index" text,
    environment_key text,
    project_key text,
    segment_key text,
    tags text,
    PRIMARY KEY ("index", environment_key, project_key, segment_key),
    FOREIGN KEY (environment_key) REFERENCES segment(environment_key),
    FOREIGN KEY (project_key) REFERENCES segment(project_key),
    FOREIGN KEY (segment_key) REFERENCES segment("key")
);

CREATE TABLE segment_flag (
    environment_key text,
    "key" text,
    project_key text,
    segment_key text,
    PRIMARY KEY (environment_key, "key", project_key, segment_key),
    FOREIGN KEY (environment_key) REFERENCES segment(environment_key),
    FOREIGN KEY ("key") REFERENCES feature_flag("key"),
    FOREIGN KEY (project_key) REFERENCES segment(project_key),
    FOREIGN KEY (segment_key) REFERENCES segment("key")
);

CREATE TABLE segment_included_contexts (
    "index" text,
    environment_key text,
    project_key text,
    segment_key text,
    context_kind text,
    values jsonb,
    PRIMARY KEY ("index", environment_key, project_key, segment_key),
    FOREIGN KEY (environment_key) REFERENCES segment(environment_key),
    FOREIGN KEY (project_key) REFERENCES segment(project_key),
    FOREIGN KEY (segment_key) REFERENCES segment("key")
);

CREATE TABLE segment_excluded_contexts (
    "index" text,
    environment_key text,
    project_key text,
    segment_key text,
    context_kind text,
    values jsonb,
    PRIMARY KEY ("index", environment_key, project_key, segment_key),
    FOREIGN KEY (environment_key) REFERENCES segment(environment_key),
    FOREIGN KEY (project_key) REFERENCES segment(project_key),
    FOREIGN KEY (segment_key) REFERENCES segment("key")
);

CREATE TABLE segment (
    "key" text,
    environment_key text,
    project_key text,
    creation_date text,
    deleted text,
    description text,
    external text,
    external_link text,
    generation text,
    import_in_progress text,
    "name" text,
    unbounded text,
    unbounded_context_kind text,
    version text,
    -- unbounded_metadata_* (dynamic column),
    PRIMARY KEY ("key", environment_key, project_key),
    FOREIGN KEY (environment_key) REFERENCES environment("key"),
    FOREIGN KEY (project_key) REFERENCES project("key")
);

CREATE TABLE segment_access (
    _fivetran_id text,
    environment_key text,
    project_key text,
    segment_key text,
    access_type text,
    "action" text,
    actions jsonb,
    effect text,
    not_actions jsonb,
    not_resources jsonb,
    resources jsonb,
    role_name text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (environment_key) REFERENCES segment(environment_key),
    FOREIGN KEY (project_key) REFERENCES segment(project_key),
    FOREIGN KEY (segment_key) REFERENCES segment("key")
);

CREATE TABLE segment_target (
    "index" text,
    target_key text,
    environment_key text,
    project_key text,
    segment_key text,
    object_type text,
    PRIMARY KEY ("index", target_key, environment_key, project_key, segment_key),
    FOREIGN KEY (environment_key) REFERENCES segment(environment_key),
    FOREIGN KEY (project_key) REFERENCES segment(project_key),
    FOREIGN KEY (segment_key) REFERENCES segment("key")
);

CREATE TABLE metric_tag (
    "index" text,
    metric_key text,
    tags text,
    PRIMARY KEY ("index", metric_key),
    FOREIGN KEY (metric_key) REFERENCES metric("key")
);

CREATE TABLE metric_randomization_unit (
    "index" text,
    metric_key text,
    randomization_unit text,
    PRIMARY KEY ("index", metric_key),
    FOREIGN KEY (metric_key) REFERENCES metric("key")
);

CREATE TABLE metric (
    "key" text,
    associated_maintainer_id text,
    maintainer_id text,
    project_key text,
    attached_flag_count text,
    creation_date text,
    description text,
    event_key text,
    experiment_count text,
    id text,
    is_numeric text,
    kind text,
    last_modified_date text,
    "name" text,
    success_criteria text,
    unit text,
    PRIMARY KEY ("key"),
    FOREIGN KEY (associated_maintainer_id) REFERENCES maintainer(id),
    FOREIGN KEY (maintainer_id) REFERENCES maintainer(id),
    FOREIGN KEY (project_key) REFERENCES project("key")
);

CREATE TABLE metric_access (
    _fivetran_id text,
    metric_key text,
    access_type text,
    "action" text,
    actions jsonb,
    effect text,
    not_actions jsonb,
    not_resources jsonb,
    resources jsonb,
    role_name text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (metric_key) REFERENCES metric("key")
);

CREATE TABLE role_project (
    project_key text,
    role_key text,
    role_team_key text,
    PRIMARY KEY (project_key, role_key, role_team_key),
    FOREIGN KEY (project_key) REFERENCES project("key"),
    FOREIGN KEY (role_key) REFERENCES "role"("key"),
    FOREIGN KEY (role_team_key) REFERENCES "role"(team_key)
);

CREATE TABLE "role" (
    "key" text,
    team_key text,
    applied_on text,
    "name" text,
    PRIMARY KEY ("key", team_key),
    FOREIGN KEY (team_key) REFERENCES team("key")
);

CREATE TABLE team_project (
    "key" text,
    team_key text,
    PRIMARY KEY ("key", team_key),
    FOREIGN KEY ("key") REFERENCES project("key"),
    FOREIGN KEY (team_key) REFERENCES team("key")
);

CREATE TABLE maintainer (
    id text,
    team_key text,
    email text,
    first_name text,
    last_name text,
    "role" text,
    PRIMARY KEY (id, team_key),
    FOREIGN KEY (team_key) REFERENCES team("key")
);

CREATE TABLE team (
    "key" text,
    creation_date text,
    description text,
    identity_provider_sync text,
    last_modified text,
    maintainers_total_count text,
    members_total_count text,
    "name" text,
    project_total_count text,
    roles_total_count text,
    version text,
    PRIMARY KEY ("key")
);

CREATE TABLE team_access (
    _fivetran_id text,
    team_key text,
    access_type text,
    "action" text,
    actions jsonb,
    effect text,
    not_actions jsonb,
    not_resources jsonb,
    resources jsonb,
    role_name text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (team_key) REFERENCES team("key")
);
