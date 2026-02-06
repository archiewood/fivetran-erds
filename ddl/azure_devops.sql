CREATE TABLE commit_parents (
    commit_id text,
    parent_commit_id text,
    PRIMARY KEY (commit_id, parent_commit_id),
    FOREIGN KEY (commit_id) REFERENCES commit(id),
    FOREIGN KEY (parent_commit_id) REFERENCES commit(id)
);

CREATE TABLE commit_change_counts (
    change_counts_name text,
    commit_id text,
    change_counts_value text,
    PRIMARY KEY (change_counts_name, commit_id),
    FOREIGN KEY (commit_id) REFERENCES commit(id)
);

CREATE TABLE commit (
    id text,
    push_by_id text,
    repository_id text,
    author_date text,
    author_email text,
    author_name text,
    "comment" text,
    comment_truncated boolean,
    committed_date text,
    committed_email text,
    committed_name text,
    push_date text,
    push_id integer,
    remote_url text,
    tree_id text,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (push_by_id) REFERENCES users(id),
    FOREIGN KEY (repository_id) REFERENCES repository(id)
);

CREATE TABLE project (
    id text,
    team_id text,
    abbreviation text,
    capabilities_process_template_name text,
    capabilities_process_template_type_id text,
    capabilities_version_control_git_enabled text,
    capabilities_version_control_source_control_type text,
    capabilities_version_control_tfvc_enabled text,
    default_team_image_url text,
    description text,
    last_update_time text,
    "name" text,
    revision integer,
    "state" text,
    url text,
    visibility text,
    PRIMARY KEY (id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE repository (
    id text,
    parent_repository_id text,
    project_id text,
    default_branch text,
    is_disabled boolean,
    is_fork boolean,
    "name" text,
    remote_url text,
    "size" bigint,
    ssh_url text,
    url text,
    valid_remote_urls jsonb,
    web_url text,
    PRIMARY KEY (id),
    FOREIGN KEY (parent_repository_id) REFERENCES repository(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE plan (
    id text,
    created_by_id text,
    modified_by_id text,
    project_id text,
    created_date text,
    description text,
    modified_date text,
    "name" text,
    revision integer,
    "type" text,
    user_permissions text,
    -- custom_properties_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_id) REFERENCES users(id),
    FOREIGN KEY (modified_by_id) REFERENCES users(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE item (
    object_id text,
    project_id text,
    repository_id text,
    commit_id text,
    latest_processed_change text,
    content text,
    git_object_type text,
    is_folder boolean,
    is_symlink boolean,
    original_object_id text,
    "path" text,
    url text,
    PRIMARY KEY (object_id, project_id, repository_id),
    FOREIGN KEY (repository_id) REFERENCES repository(id),
    FOREIGN KEY (commit_id) REFERENCES commit(id),
    FOREIGN KEY (latest_processed_change) REFERENCES commit(id)
);

CREATE TABLE installed_extension_scope (
    "index" text,
    installed_extension_id text,
    scope text,
    PRIMARY KEY ("index", installed_extension_id),
    FOREIGN KEY (installed_extension_id) REFERENCES installed_extension(id)
);

CREATE TABLE installed_extension_contribution_authentication_schema (
    id text,
    installed_extension_contribution_id text,
    installed_extension_id text,
    "type" text,
    description text,
    input_mode text,
    is_confidential text,
    "name" text,
    validation_datatype text,
    validation_is_required text,
    value_default_value text,
    value_input_id text,
    value_is_disabled text,
    PRIMARY KEY (id, installed_extension_contribution_id, installed_extension_id, "type")
);

CREATE TABLE installed_extension_contribution_target (
    "index" text,
    installed_extension_id text,
    target text,
    PRIMARY KEY ("index", installed_extension_id),
    FOREIGN KEY (installed_extension_id) REFERENCES installed_extension_contribution(installed_extension_id)
);

CREATE TABLE installed_extension_contribution_constraint (
    "index" text,
    installed_extension_id text,
    "name" text,
    property_extension_id text,
    PRIMARY KEY ("index", installed_extension_id),
    FOREIGN KEY (installed_extension_id) REFERENCES installed_extension_contribution(installed_extension_id)
);

CREATE TABLE installed_extension_contribution_restricted (
    "index" text,
    installed_extension_id text,
    member text,
    PRIMARY KEY ("index", installed_extension_id),
    FOREIGN KEY (installed_extension_id) REFERENCES installed_extension_contribution(installed_extension_id)
);

CREATE TABLE installed_extension_contribution (
    id text,
    installed_extension_id text,
    description text,
    properties_attribute text,
    properties_display_name text,
    properties_name text,
    properties_version text,
    property_url_display_name text,
    property_url_help_text text,
    property_url_is_visible text,
    property_url_value text,
    "type" text,
    PRIMARY KEY (id, installed_extension_id),
    FOREIGN KEY (installed_extension_id) REFERENCES installed_extension(id)
);

CREATE TABLE installed_extension_contribution_type (
    id text,
    installed_extension_id text,
    description text,
    indexed text,
    "name" text,
    properties jsonb,
    visible_to text,
    PRIMARY KEY (id, installed_extension_id),
    FOREIGN KEY (installed_extension_id) REFERENCES installed_extension(id)
);

CREATE TABLE installed_extension_file (
    "index" text,
    installed_extension_id text,
    asset_type text,
    languages text,
    "source" text,
    PRIMARY KEY ("index", installed_extension_id),
    FOREIGN KEY (installed_extension_id) REFERENCES installed_extension(id)
);

CREATE TABLE installed_extension (
    id text,
    base_uri text,
    extension_name text,
    fallback_base_uri text,
    install_state_flag text,
    install_state_last_updated text,
    last_published text,
    manifest_version text,
    publisher_id text,
    publisher_name text,
    registration_id text,
    version text,
    PRIMARY KEY (id)
);

CREATE TABLE query (
    id text,
    created_by_id text,
    last_executed_by_id text,
    last_modified_by_id text,
    project_id text,
    created_date text,
    has_children boolean,
    is_deleted boolean,
    is_folder boolean,
    is_public boolean,
    last_executed_date text,
    last_modified_date text,
    "name" text,
    "path" text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_id) REFERENCES users(id),
    FOREIGN KEY (last_executed_by_id) REFERENCES users(id),
    FOREIGN KEY (last_modified_by_id) REFERENCES users(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE users (
    id text,
    access_level_account_license_type text,
    access_level_assignment_source text,
    access_level_git_hub_license_type text,
    access_level_license_display_name text,
    access_level_licensing_source text,
    access_level_msdn_license_type text,
    access_level_status text,
    access_level_status_message text,
    date_created text,
    last_access_date timestamp,
    user_descriptor text,
    user_directory_alias text,
    user_display_name text,
    user_domain text,
    user_is_deleted_in_origin boolean,
    user_legacy_descriptor text,
    user_mail_address text,
    user_meta_type text,
    user_origin text,
    user_origin_id text,
    user_principal_name text,
    user_subject_kind text,
    user_url text,
    PRIMARY KEY (id)
);

CREATE TABLE backlog (
    id text,
    project_id text,
    team_id text,
    color text,
    is_hidden boolean,
    "name" text,
    rank integer,
    "type" text,
    work_item_count_limit integer,
    PRIMARY KEY (id, project_id, team_id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE process_work_item_type_state (
    id text,
    process_work_item_type_reference_name text,
    color text,
    customization_type text,
    "name" text,
    orders text,
    state_category text,
    url text,
    PRIMARY KEY (id, process_work_item_type_reference_name),
    FOREIGN KEY (process_work_item_type_reference_name) REFERENCES process_work_item_type(reference_name)
);

CREATE TABLE process_work_item_type (
    reference_name text,
    process_type_id text,
    color text,
    customization text,
    description text,
    icon text,
    inherit text,
    is_disabled text,
    "name" text,
    PRIMARY KEY (reference_name, process_type_id),
    FOREIGN KEY (process_type_id) REFERENCES process(process_type_id)
);

CREATE TABLE "status" (
    geography_id text,
    geography_name text,
    service_id text,
    "status" text,
    PRIMARY KEY (geography_id, geography_name, service_id)
);

CREATE TABLE project_property (
    "name" text,
    project_id text,
    "value" jsonb,
    PRIMARY KEY ("name", project_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE backlog_work_item (
    backlog_id text,
    project_id text,
    team_id text,
    work_item_id text,
    PRIMARY KEY (backlog_id, project_id, team_id, work_item_id),
    FOREIGN KEY (backlog_id) REFERENCES backlog(id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (team_id) REFERENCES team(id),
    FOREIGN KEY (work_item_id) REFERENCES work_item(id)
);

CREATE TABLE work_item_revision (
    revision text,
    id text,
    project_id text,
    multiline_fields_format jsonb,
    -- custom_* (dynamic column),
    PRIMARY KEY (revision, id, project_id),
    FOREIGN KEY (id) REFERENCES work_item(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE users_groups (
    group_id text,
    user_id text,
    PRIMARY KEY (group_id, user_id),
    FOREIGN KEY (group_id) REFERENCES groups(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE pull_request_commit (
    commit_id text,
    pull_request_id integer,
    PRIMARY KEY (commit_id, pull_request_id),
    FOREIGN KEY (commit_id) REFERENCES commit(id),
    FOREIGN KEY (pull_request_id) REFERENCES pull_request(id)
);

CREATE TABLE pull_request_reviewer (
    pull_request_id integer,
    reviewer_id text,
    PRIMARY KEY (pull_request_id, reviewer_id),
    FOREIGN KEY (pull_request_id) REFERENCES pull_request(id),
    FOREIGN KEY (reviewer_id) REFERENCES users(id)
);

CREATE TABLE pull_request_work_item (
    pull_request_id integer,
    work_item_id text,
    PRIMARY KEY (pull_request_id, work_item_id),
    FOREIGN KEY (pull_request_id) REFERENCES pull_request(id),
    FOREIGN KEY (work_item_id) REFERENCES work_item(id)
);

CREATE TABLE pull_request (
    id integer,
    auto_complete_set_by text,
    closed_by text,
    created_by text,
    fork_source text,
    last_merge_commit text,
    last_merge_source_commit text,
    last_merge_target_commit text,
    repository_id text,
    artifact_id text,
    closed_date text,
    code_review_id integer,
    completion_queue_time text,
    creation_date text,
    description text,
    has_multiple_merge_bases boolean,
    is_draft boolean,
    merge_failure_message text,
    merge_failure_type text,
    merge_id text,
    merge_status text,
    remote_url text,
    source_ref_name text,
    "status" text,
    supports_iterations boolean,
    target_ref_name text,
    title text,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (auto_complete_set_by) REFERENCES users(id),
    FOREIGN KEY (closed_by) REFERENCES users(id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (fork_source) REFERENCES repository(id),
    FOREIGN KEY (last_merge_commit) REFERENCES commit(id),
    FOREIGN KEY (last_merge_source_commit) REFERENCES commit(id),
    FOREIGN KEY (last_merge_target_commit) REFERENCES commit(id),
    FOREIGN KEY (repository_id) REFERENCES repository(id)
);

CREATE TABLE process (
    process_type_id text,
    parent_process_type_id text,
    customization_type text,
    description text,
    is_default text,
    is_enabled text,
    "name" text,
    reference_name text,
    PRIMARY KEY (process_type_id),
    FOREIGN KEY (parent_process_type_id) REFERENCES process(process_type_id)
);

CREATE TABLE blocked_approver (
    "index" text,
    approval_id text,
    project_id text,
    id text,
    descriptor text,
    display_name text,
    is_deleted_in_origin text,
    url text,
    PRIMARY KEY ("index", approval_id, project_id),
    FOREIGN KEY (approval_id) REFERENCES approval(id),
    FOREIGN KEY (project_id) REFERENCES approval(project_id),
    FOREIGN KEY (id) REFERENCES users(id)
);

CREATE TABLE approval_step_history (
    "index" text,
    approval_id text,
    approval_step_index text,
    project_id text,
    assigned_to_id text,
    created_by_id text,
    "comment" text,
    created_on text,
    PRIMARY KEY ("index", approval_id, approval_step_index, project_id),
    FOREIGN KEY (approval_id) REFERENCES approval_step(approval_id),
    FOREIGN KEY (approval_step_index) REFERENCES approval_step("index"),
    FOREIGN KEY (project_id) REFERENCES approval_step(project_id),
    FOREIGN KEY (assigned_to_id) REFERENCES users(id),
    FOREIGN KEY (created_by_id) REFERENCES users(id)
);

CREATE TABLE approval_step (
    "index" text,
    approval_id text,
    project_id text,
    actual_approver_id text,
    assigned_approver_id text,
    last_modified_by_id text,
    "comment" text,
    history text,
    initiated_on text,
    last_modified_on text,
    orders text,
    permission text,
    "status" text,
    PRIMARY KEY ("index", approval_id, project_id),
    FOREIGN KEY (approval_id) REFERENCES approval(id),
    FOREIGN KEY (project_id) REFERENCES approval(project_id),
    FOREIGN KEY (actual_approver_id) REFERENCES users(id),
    FOREIGN KEY (assigned_approver_id) REFERENCES users(id),
    FOREIGN KEY (last_modified_by_id) REFERENCES users(id)
);

CREATE TABLE approval (
    id text,
    project_id text,
    created_on text,
    execution_order text,
    instructions text,
    iteration text,
    last_modified_on text,
    last_updated_date text,
    min_required_approvers text,
    "name" text,
    passed_tests text,
    permission text,
    post_process_state text,
    revision text,
    started_date text,
    "state" text,
    "status" text,
    total_tests text,
    url text,
    PRIMARY KEY (id, project_id)
);

CREATE TABLE groups (
    id text,
    description text,
    descriptor text,
    display_name text,
    domain text,
    legacy_descriptor text,
    mail_address text,
    origin text,
    principal_name text,
    subject_kind text,
    url text,
    PRIMARY KEY (id)
);

CREATE TABLE label (
    id text,
    pull_request_id integer,
    active boolean,
    "name" text,
    url text,
    PRIMARY KEY (id, pull_request_id),
    FOREIGN KEY (pull_request_id) REFERENCES pull_request(id)
);

CREATE TABLE team_identity_property (
    _fivetran_id text,
    team_id text,
    "type" text,
    "value" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE team_groups (
    group_id text,
    team_id text,
    PRIMARY KEY (group_id, team_id),
    FOREIGN KEY (group_id) REFERENCES groups(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE team (
    id text,
    project_id text,
    description text,
    identity_custom_display_name text,
    identity_descriptor text,
    identity_is_active text,
    identity_is_container text,
    identity_member_of jsonb,
    identity_members jsonb,
    identity_meta_type_id text,
    identity_provider_display_name text,
    identity_resource_version text,
    identity_social_descriptor text,
    identity_subject_descriptor text,
    identity_unique_user_id text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE work_item_relation (
    "index" text,
    work_item_id text,
    related_work_item_id text,
    attribute_is_locked text,
    attribute_name text,
    rel text,
    url text,
    PRIMARY KEY ("index", work_item_id),
    FOREIGN KEY (work_item_id) REFERENCES work_item(id),
    FOREIGN KEY (related_work_item_id) REFERENCES work_item(id)
);

CREATE TABLE work_item (
    id text,
    project_id text,
    team_id text,
    revision text,
    url text,
    -- custom_* (dynamic column),
    -- system_assigned_to_* (dynamic column),
    -- system_changed_by_* (dynamic column),
    -- system_created_by_* (dynamic column),
    PRIMARY KEY (id, project_id, team_id)
);

CREATE TABLE board_row (
    id text,
    board_id text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (board_id) REFERENCES board(id)
);

CREATE TABLE board_column (
    id text,
    board_id text,
    column_type text,
    description text,
    is_split text,
    item_limit text,
    "name" text,
    state_mappings_epic text,
    PRIMARY KEY (id),
    FOREIGN KEY (board_id) REFERENCES board(id)
);

CREATE TABLE board (
    id text,
    project_id text,
    team_id text,
    can_edit boolean,
    done_field_reference_name text,
    is_valid boolean,
    "name" text,
    revision integer,
    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE project_pipeline (
    id text,
    project_id text,
    configuration jsonb,
    folder text,
    "name" text,
    revision text,
    url text,
    PRIMARY KEY (id, project_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);
