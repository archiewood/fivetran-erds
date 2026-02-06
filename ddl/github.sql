CREATE TABLE ide_code_completion_editor_model (
    editor_name text,
    "name" text,
    organization text,
    report_date text,
    custom_model_training_date text,
    is_custom_model boolean,
    total_engaged_users bigint,
    PRIMARY KEY (editor_name, "name", organization, report_date),
    FOREIGN KEY (organization) REFERENCES copilot_metric(organization),
    FOREIGN KEY (report_date) REFERENCES copilot_metric("date")
);

CREATE TABLE repository_clone (
    timestamp_value timestamp,
    repository_id bigint,
    count_value integer,
    uniques integer,
    PRIMARY KEY (timestamp_value, repository_id),
    FOREIGN KEY (repository_id) REFERENCES repository(id)
);

CREATE TABLE dotcom_pull_request_repository (
    "name" text,
    organization text,
    report_date text,
    total_engaged_users bigint,
    PRIMARY KEY ("name", organization, report_date),
    FOREIGN KEY (organization) REFERENCES copilot_metric(organization),
    FOREIGN KEY (report_date) REFERENCES copilot_metric("date")
);

CREATE TABLE workflow_run (
    id bigint,
    actor_id bigint,
    head_sha text,
    repository_id bigint,
    triggering_actor_id bigint,
    workflow_id bigint,
    conclusion text,
    created_at timestamp,
    event text,
    head_branch text,
    "name" text,
    run_attempt bigint,
    run_number bigint,
    run_started_at timestamp,
    "status" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (actor_id) REFERENCES "user"(id),
    FOREIGN KEY (head_sha) REFERENCES commit(sha),
    FOREIGN KEY (repository_id) REFERENCES repository(id),
    FOREIGN KEY (triggering_actor_id) REFERENCES "user"(id),
    FOREIGN KEY (workflow_id) REFERENCES workflow(id)
);

CREATE TABLE issue (
    id bigint,
    milestone_id bigint,
    repository_id bigint,
    user_id bigint,
    body text,
    closed_at timestamp,
    created_at timestamp,
    locked boolean,
    number bigint,
    pull_request boolean,
    "state" text,
    state_reason text,
    title text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (milestone_id) REFERENCES milestone(id),
    FOREIGN KEY (repository_id) REFERENCES repository(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE "user" (
    id bigint,
    bio text,
    blog text,
    company text,
    created_at timestamp,
    hireable boolean,
    location text,
    login text,
    "name" text,
    site_admin boolean,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE user_email (
    email text,
    user_id bigint,
    "name" text,
    PRIMARY KEY (email),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE ide_code_completions_total_language (
    "name" text,
    organization text,
    report_date text,
    total_engaged_users bigint,
    PRIMARY KEY ("name", organization, report_date),
    FOREIGN KEY (organization) REFERENCES copilot_metric(organization),
    FOREIGN KEY (report_date) REFERENCES copilot_metric("date")
);

CREATE TABLE security_advisory (
    ghsa_id text,
    cve_id text,
    cvss_score double precision,
    cvss_vector_string text,
    description text,
    published_at timestamp,
    severity text,
    updated_at timestamp,
    withdrawn_at timestamp,
    PRIMARY KEY (ghsa_id)
);

CREATE TABLE workflow_run_job (
    id bigint,
    run_id bigint,
    check_run_url text,
    completed_at text,
    conclusion text,
    created_at text,
    head_branch text,
    head_sha text,
    html_url text,
    labels jsonb,
    "name" text,
    node_id text,
    run_attempt integer,
    run_url text,
    runner_group_id integer,
    runner_group_name text,
    runner_id integer,
    runner_name text,
    started_at text,
    "status" text,
    url text,
    workflow_name text,
    PRIMARY KEY (id),
    FOREIGN KEY (run_id) REFERENCES workflow_run(id)
);

CREATE TABLE commit (
    sha text,
    author_email text,
    committer_email text,
    repository_id bigint,
    author_date timestamp,
    author_name text,
    committer_date timestamp,
    committer_name text,
    message text,
    PRIMARY KEY (sha),
    FOREIGN KEY (author_email) REFERENCES user_email(email),
    FOREIGN KEY (committer_email) REFERENCES user_email(email),
    FOREIGN KEY (repository_id) REFERENCES repository(id)
);

CREATE TABLE dotcom_chat_model (
    "name" text,
    organization text,
    report_date text,
    custom_model_training_date text,
    is_custom_model boolean,
    total_chats bigint,
    total_engaged_users bigint,
    PRIMARY KEY ("name", organization, report_date),
    FOREIGN KEY (organization) REFERENCES copilot_metric(organization),
    FOREIGN KEY (report_date) REFERENCES copilot_metric("date")
);

CREATE TABLE repo_team (
    repository_id bigint,
    team_id bigint,
    permission text,
    PRIMARY KEY (repository_id, team_id),
    FOREIGN KEY (repository_id) REFERENCES repository(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE issue_closed_history (
    closed boolean,
    updated_at timestamp,
    issue_id bigint,
    actor_id bigint,
    commit_sha text,
    PRIMARY KEY (closed, updated_at, issue_id),
    FOREIGN KEY (issue_id) REFERENCES issue(id),
    FOREIGN KEY (actor_id) REFERENCES "user"(id),
    FOREIGN KEY (commit_sha) REFERENCES commit(sha)
);

CREATE TABLE requested_reviewer_history (
    created_at timestamp,
    requested_id bigint,
    pull_request_id bigint,
    actor_id bigint,
    removed boolean,
    requested_reviewer_type text,
    PRIMARY KEY (created_at, requested_id, pull_request_id),
    FOREIGN KEY (pull_request_id) REFERENCES pull_request(id),
    FOREIGN KEY (actor_id) REFERENCES "user"(id)
);

CREATE TABLE ide_code_completion_editor_model_team (
    editor_name text,
    "name" text,
    organization text,
    report_date text,
    team_id bigint,
    custom_model_training_date text,
    is_custom_model boolean,
    total_engaged_users bigint,
    PRIMARY KEY (editor_name, "name", organization, report_date, team_id),
    FOREIGN KEY (organization) REFERENCES copilot_metric_team(organization),
    FOREIGN KEY (report_date) REFERENCES copilot_metric_team("date"),
    FOREIGN KEY (team_id) REFERENCES copilot_metric_team(team_id)
);

CREATE TABLE issue_assignee_history (
    updated_at timestamp,
    issue_id bigint,
    user_id bigint,
    assigner_id bigint,
    assigned boolean,
    PRIMARY KEY (updated_at, issue_id, user_id),
    FOREIGN KEY (issue_id) REFERENCES issue(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id),
    FOREIGN KEY (assigner_id) REFERENCES "user"(id)
);

CREATE TABLE pull_request_review (
    id bigint,
    commit_sha text,
    pull_request_id bigint,
    user_id bigint,
    body text,
    "state" text,
    submitted_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (commit_sha) REFERENCES commit(sha),
    FOREIGN KEY (pull_request_id) REFERENCES pull_request(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE branch_commit_relation (
    branch_name text,
    commit_sha text,
    PRIMARY KEY (branch_name, commit_sha),
    FOREIGN KEY (commit_sha) REFERENCES commit(sha)
);

CREATE TABLE dotcom_pull_request_repository_model (
    "name" text,
    repository_name text,
    organization text,
    report_date text,
    custom_model_training_date text,
    is_custom_model boolean,
    total_engaged_users bigint,
    total_pr_summaries_created bigint,
    PRIMARY KEY ("name", repository_name, organization, report_date),
    FOREIGN KEY (organization) REFERENCES copilot_metric(organization),
    FOREIGN KEY (report_date) REFERENCES copilot_metric("date")
);

CREATE TABLE copilot_metric_team (
    "date" text,
    organization text,
    team_id bigint,
    dotcom_chat_total_engaged_users bigint,
    dotcom_pull_request_total_engaged_users bigint,
    ide_chat_total_engaged_users bigint,
    ide_code_completion_total_engaged_users bigint,
    total_active_users bigint,
    total_engaged_users bigint,
    PRIMARY KEY ("date", organization, team_id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE workflow (
    id bigint,
    repository_id bigint,
    created_at timestamp,
    "name" text,
    "path" text,
    "state" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (repository_id) REFERENCES repository(id)
);

CREATE TABLE issue_comment (
    id bigint,
    issue_id bigint,
    user_id bigint,
    body text,
    created_at timestamp,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (issue_id) REFERENCES issue(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE issue_label_history (
    updated_at timestamp,
    issue_id bigint,
    label_id bigint,
    actor_id bigint,
    labeled boolean,
    PRIMARY KEY (updated_at, issue_id, label_id),
    FOREIGN KEY (issue_id) REFERENCES issue(id),
    FOREIGN KEY (label_id) REFERENCES label(id),
    FOREIGN KEY (actor_id) REFERENCES "user"(id)
);

CREATE TABLE security_vulnerability (
    _fivetran_id text,
    package_ecosystem text,
    package_name text,
    patched_version_identifier text,
    severity text,
    vulnerable_version_range text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE dotcom_chat_model_team (
    "name" text,
    organization text,
    report_date text,
    team_id bigint,
    custom_model_training_date text,
    is_custom_model boolean,
    total_chats bigint,
    total_engaged_users bigint,
    PRIMARY KEY ("name", organization, report_date, team_id),
    FOREIGN KEY (organization) REFERENCES copilot_metric_team(organization),
    FOREIGN KEY (report_date) REFERENCES copilot_metric_team("date"),
    FOREIGN KEY (team_id) REFERENCES copilot_metric_team(team_id)
);

CREATE TABLE security_alert (
    number bigint,
    repository_id bigint,
    dismissed_by bigint,
    security_advisory_ghsa_id text,
    vulnerability_id text,
    created_at timestamp,
    dependency_manifest_path text,
    dependency_package_ecosystem text,
    dependency_package_name text,
    dependency_scope text,
    dismissed_at timestamp,
    dismissed_comment text,
    dismissed_reason text,
    fixed_at timestamp,
    "state" text,
    updated_at timestamp,
    PRIMARY KEY (number, repository_id),
    FOREIGN KEY (repository_id) REFERENCES repository(id),
    FOREIGN KEY (dismissed_by) REFERENCES "user"(id),
    FOREIGN KEY (security_advisory_ghsa_id) REFERENCES security_advisory(ghsa_id),
    FOREIGN KEY (vulnerability_id) REFERENCES security_vulnerability(_fivetran_id)
);

CREATE TABLE ide_code_completions_total_language_team (
    "name" text,
    organization text,
    report_date text,
    team_id bigint,
    total_engaged_users bigint,
    PRIMARY KEY ("name", organization, report_date, team_id),
    FOREIGN KEY (organization) REFERENCES copilot_metric_team(organization),
    FOREIGN KEY (report_date) REFERENCES copilot_metric_team("date"),
    FOREIGN KEY (team_id) REFERENCES copilot_metric_team(team_id)
);

CREATE TABLE workflow_run_job_step (
    number integer,
    workflow_run_job_id bigint,
    completed_at text,
    conclusion text,
    "name" text,
    started_at text,
    "status" text,
    PRIMARY KEY (number, workflow_run_job_id),
    FOREIGN KEY (workflow_run_job_id) REFERENCES workflow_run_job(id)
);

CREATE TABLE pull_request (
    id bigint,
    base_repo_id bigint,
    base_user_id bigint,
    head_repo_id bigint,
    head_user_id bigint,
    issue_id bigint,
    active_lock_reason text,
    base_label text,
    base_ref text,
    base_sha text,
    closed_at timestamp,
    created_at timestamp,
    draft boolean,
    head_label text,
    head_ref text,
    head_sha text,
    merge_commit_sha text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (base_repo_id) REFERENCES repository(id),
    FOREIGN KEY (base_user_id) REFERENCES "user"(id),
    FOREIGN KEY (head_repo_id) REFERENCES repository(id),
    FOREIGN KEY (head_user_id) REFERENCES "user"(id),
    FOREIGN KEY (issue_id) REFERENCES issue(id)
);

CREATE TABLE commit_file (
    commit_sha text,
    filename text,
    additions bigint,
    changes bigint,
    deletions bigint,
    "status" text,
    PRIMARY KEY (commit_sha, filename)
);

CREATE TABLE security_reference (
    url text,
    security_advisory_ghsa_id text,
    PRIMARY KEY (url, security_advisory_ghsa_id),
    FOREIGN KEY (security_advisory_ghsa_id) REFERENCES security_advisory(ghsa_id)
);

CREATE TABLE project_v_2_item (
    id bigint,
    creator_id bigint,
    milestone_id bigint,
    parent_issue_id bigint,
    project_v_2_id bigint,
    repository_id bigint,
    archived_at timestamp,
    created_at timestamp,
    "status" text,
    updated_at timestamp,
    -- content_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (creator_id) REFERENCES "user"(id),
    FOREIGN KEY (milestone_id) REFERENCES milestone(id),
    FOREIGN KEY (parent_issue_id) REFERENCES issue(id),
    FOREIGN KEY (project_v_2_id) REFERENCES project_v_2(id),
    FOREIGN KEY (repository_id) REFERENCES repository(id)
);

CREATE TABLE dotcom_pull_request_repository_model_team (
    "name" text,
    repository_name text,
    organization text,
    report_date text,
    team_id bigint,
    custom_model_training_date text,
    is_custom_model boolean,
    total_engaged_users bigint,
    total_pr_summaries_created bigint,
    PRIMARY KEY ("name", repository_name, organization, report_date, team_id),
    FOREIGN KEY (organization) REFERENCES copilot_metric_team(organization),
    FOREIGN KEY (report_date) REFERENCES copilot_metric_team("date"),
    FOREIGN KEY (team_id) REFERENCES copilot_metric_team(team_id)
);

CREATE TABLE security_cwe (
    cwe_id text,
    "name" text,
    PRIMARY KEY (cwe_id)
);

CREATE TABLE page_view (
    timestamp_value timestamp,
    repository_id bigint,
    count_value integer,
    uniques integer,
    PRIMARY KEY (timestamp_value, repository_id),
    FOREIGN KEY (repository_id) REFERENCES repository(id)
);

CREATE TABLE issue_referenced (
    referenced_at timestamp,
    issue_id bigint,
    actor_id bigint,
    commit_sha text,
    PRIMARY KEY (referenced_at, issue_id),
    FOREIGN KEY (issue_id) REFERENCES issue(id),
    FOREIGN KEY (actor_id) REFERENCES "user"(id),
    FOREIGN KEY (commit_sha) REFERENCES commit(sha)
);

CREATE TABLE ide_chat_editor_model_team (
    editor_name text,
    "name" text,
    organization text,
    report_date text,
    team_id bigint,
    custom_model_training_date text,
    is_custom_model boolean,
    total_chat_copy_events bigint,
    total_chat_insertion_events bigint,
    total_chats bigint,
    total_engaged_users bigint,
    PRIMARY KEY (editor_name, "name", organization, report_date, team_id),
    FOREIGN KEY (organization) REFERENCES copilot_metric_team(organization),
    FOREIGN KEY (report_date) REFERENCES copilot_metric_team("date"),
    FOREIGN KEY (team_id) REFERENCES copilot_metric_team(team_id)
);

CREATE TABLE security_advisory_cwe (
    cwe_id text,
    security_advisory_id text,
    PRIMARY KEY (cwe_id, security_advisory_id),
    FOREIGN KEY (cwe_id) REFERENCES security_cwe(cwe_id),
    FOREIGN KEY (security_advisory_id) REFERENCES security_advisory(ghsa_id)
);

CREATE TABLE pull_request_review_comments (
    id bigint,
    pull_request_id bigint,
    parent_comment_id bigint,
    pull_request_review_id bigint,
    user_id bigint,
    body text,
    created_at timestamp,
    reaction_minus_count integer,
    reaction_plus_count integer,
    updated_at timestamp,
    PRIMARY KEY (id, pull_request_id),
    FOREIGN KEY (pull_request_id) REFERENCES pull_request(id),
    FOREIGN KEY (parent_comment_id) REFERENCES pull_request_review_comments(id),
    FOREIGN KEY (pull_request_review_id) REFERENCES pull_request_review(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE copilot_metric (
    "date" text,
    organization text,
    dotcom_chat_total_engaged_users bigint,
    dotcom_pull_request_total_engaged_users bigint,
    ide_chat_total_engaged_users bigint,
    ide_code_completion_total_engaged_users bigint,
    total_active_users bigint,
    total_engaged_users bigint,
    PRIMARY KEY ("date", organization)
);

CREATE TABLE deployment_status (
    id bigint,
    creator_id bigint,
    deployment_id bigint,
    created_at timestamp,
    description text,
    environment text,
    "state" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (creator_id) REFERENCES "user"(id),
    FOREIGN KEY (deployment_id) REFERENCES deployment(id)
);

CREATE TABLE project_v_2_custom_field (
    project_v_2_field_id bigint,
    project_v_2_item_id bigint,
    data_type text,
    "name" text,
    "value" text,
    PRIMARY KEY (project_v_2_field_id, project_v_2_item_id),
    FOREIGN KEY (project_v_2_item_id) REFERENCES project_v_2(id)
);

CREATE TABLE pull_request_review_dismissed (
    pull_request_review_id bigint,
    actor_id bigint,
    dismissal_commit_sha text,
    created_at timestamp,
    dismissal_message text,
    "state" text,
    PRIMARY KEY (pull_request_review_id),
    FOREIGN KEY (pull_request_review_id) REFERENCES pull_request_review(id),
    FOREIGN KEY (actor_id) REFERENCES "user"(id),
    FOREIGN KEY (dismissal_commit_sha) REFERENCES commit(sha)
);

CREATE TABLE workflow_run_attempt (
    run_attempt bigint,
    id bigint,
    actor_id bigint,
    head_sha text,
    repository_id bigint,
    triggering_actor_id bigint,
    workflow_id bigint,
    conclusion text,
    created_at timestamp,
    event text,
    head_branch text,
    "name" text,
    run_number bigint,
    run_started_at timestamp,
    "status" text,
    updated_at timestamp,
    PRIMARY KEY (run_attempt, id),
    FOREIGN KEY (id) REFERENCES workflow_run(id),
    FOREIGN KEY (actor_id) REFERENCES "user"(id),
    FOREIGN KEY (head_sha) REFERENCES commit(sha),
    FOREIGN KEY (repository_id) REFERENCES repository(id),
    FOREIGN KEY (triggering_actor_id) REFERENCES "user"(id),
    FOREIGN KEY (workflow_id) REFERENCES workflow(id)
);

CREATE TABLE issue_mention (
    updated_at timestamp,
    issue_id bigint,
    user_id bigint,
    PRIMARY KEY (updated_at, issue_id, user_id),
    FOREIGN KEY (issue_id) REFERENCES issue(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE ide_code_completion_editor_team (
    "name" text,
    organization text,
    report_date text,
    team_id bigint,
    total_engaged_users bigint,
    PRIMARY KEY ("name", organization, report_date, team_id),
    FOREIGN KEY (organization) REFERENCES copilot_metric_team(organization),
    FOREIGN KEY (report_date) REFERENCES copilot_metric_team("date"),
    FOREIGN KEY (team_id) REFERENCES copilot_metric_team(team_id)
);

CREATE TABLE ide_code_completion_editor_model_language_team (
    editor_name text,
    model_name text,
    "name" text,
    organization text,
    report_date text,
    team_id bigint,
    total_code_acceptances bigint,
    total_code_lines_accepted bigint,
    total_code_lines_suggested bigint,
    total_code_suggestions bigint,
    total_engaged_users bigint,
    PRIMARY KEY (editor_name, model_name, "name", organization, report_date, team_id),
    FOREIGN KEY (organization) REFERENCES copilot_metric_team(organization),
    FOREIGN KEY (report_date) REFERENCES copilot_metric_team("date"),
    FOREIGN KEY (team_id) REFERENCES copilot_metric_team(team_id)
);

CREATE TABLE repository (
    id bigint,
    owner_id bigint,
    archived boolean,
    created_at timestamp,
    default_branch text,
    description text,
    fork boolean,
    forks_count integer,
    full_name text,
    homepage text,
    language text,
    "name" text,
    private boolean,
    watchers_count integer,
    PRIMARY KEY (id),
    FOREIGN KEY (owner_id) REFERENCES "user"(id)
);

CREATE TABLE ide_code_completion_editor_model_language (
    editor_name text,
    model_name text,
    "name" text,
    organization text,
    report_date text,
    total_code_acceptances bigint,
    total_code_lines_accepted bigint,
    total_code_lines_suggested bigint,
    total_code_suggestions bigint,
    total_engaged_users bigint,
    PRIMARY KEY (editor_name, model_name, "name", organization, report_date),
    FOREIGN KEY (organization) REFERENCES copilot_metric(organization),
    FOREIGN KEY (report_date) REFERENCES copilot_metric("date")
);

CREATE TABLE repository_topic (
    "name" text,
    repository_id bigint,
    PRIMARY KEY ("name", repository_id),
    FOREIGN KEY (repository_id) REFERENCES repository(id)
);

CREATE TABLE ide_chat_editor_team (
    "name" text,
    organization text,
    report_date text,
    team_id bigint,
    total_engaged_users bigint,
    PRIMARY KEY ("name", organization, report_date, team_id),
    FOREIGN KEY (organization) REFERENCES copilot_metric_team(organization),
    FOREIGN KEY (report_date) REFERENCES copilot_metric_team("date"),
    FOREIGN KEY (team_id) REFERENCES copilot_metric_team(team_id)
);

CREATE TABLE issue_renamed (
    updated_at timestamp,
    issue_id bigint,
    actor_id bigint,
    from_name text,
    to_name text,
    PRIMARY KEY (updated_at, issue_id),
    FOREIGN KEY (issue_id) REFERENCES issue(id),
    FOREIGN KEY (actor_id) REFERENCES "user"(id)
);

CREATE TABLE asset (
    id bigint,
    release_id bigint,
    uploader_id bigint,
    content_type text,
    created_at timestamp,
    download_count integer,
    label text,
    "name" text,
    "size" bigint,
    "state" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (release_id) REFERENCES "release"(id),
    FOREIGN KEY (uploader_id) REFERENCES "user"(id)
);

CREATE TABLE commit_pull_request (
    commit_sha text,
    pull_request_id bigint,
    PRIMARY KEY (commit_sha, pull_request_id),
    FOREIGN KEY (commit_sha) REFERENCES commit(sha),
    FOREIGN KEY (pull_request_id) REFERENCES pull_request(id)
);

CREATE TABLE ide_chat_editor_model (
    editor_name text,
    "name" text,
    organization text,
    report_date text,
    custom_model_training_date text,
    is_custom_model boolean,
    total_chat_copy_events bigint,
    total_chat_insertion_events bigint,
    total_chats bigint,
    total_engaged_users bigint,
    PRIMARY KEY (editor_name, "name", organization, report_date),
    FOREIGN KEY (organization) REFERENCES copilot_metric(organization),
    FOREIGN KEY (report_date) REFERENCES copilot_metric("date")
);

CREATE TABLE ide_code_completion_editor (
    "name" text,
    organization text,
    report_date text,
    total_engaged_users bigint,
    PRIMARY KEY ("name", organization, report_date),
    FOREIGN KEY (organization) REFERENCES copilot_metric(organization),
    FOREIGN KEY (report_date) REFERENCES copilot_metric("date")
);

CREATE TABLE milestone (
    id bigint,
    creator_id bigint,
    repository_id bigint,
    closed_at timestamp,
    created_at timestamp,
    description text,
    due_on timestamp,
    is_deleted boolean,
    number bigint,
    "state" text,
    title text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (creator_id) REFERENCES "user"(id),
    FOREIGN KEY (repository_id) REFERENCES repository(id)
);

CREATE TABLE team (
    id bigint,
    org_id bigint,
    parent_id bigint,
    description text,
    "name" text,
    privacy text,
    slug text,
    PRIMARY KEY (id),
    FOREIGN KEY (org_id) REFERENCES "user"(id),
    FOREIGN KEY (parent_id) REFERENCES team(id)
);

CREATE TABLE issue_label (
    issue_id bigint,
    label_id bigint,
    PRIMARY KEY (issue_id, label_id),
    FOREIGN KEY (issue_id) REFERENCES issue(id),
    FOREIGN KEY (label_id) REFERENCES label(id)
);

CREATE TABLE repository_property (
    "name" text,
    repository_id bigint,
    "value" text,
    PRIMARY KEY ("name", repository_id),
    FOREIGN KEY (repository_id) REFERENCES repository(id)
);

CREATE TABLE commit_parent (
    commit_sha text,
    parent_sha text,
    PRIMARY KEY (commit_sha, parent_sha),
    FOREIGN KEY (commit_sha) REFERENCES commit(sha),
    FOREIGN KEY (parent_sha) REFERENCES commit(sha)
);

CREATE TABLE deployment (
    id bigint,
    commit_sha text,
    creator_id bigint,
    created_at timestamp,
    description text,
    environment text,
    original_environment text,
    payload jsonb,
    production_environment boolean,
    ref text,
    task text,
    transient_environment boolean,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (commit_sha) REFERENCES commit(sha),
    FOREIGN KEY (creator_id) REFERENCES "user"(id)
);

CREATE TABLE dotcom_pull_request_repository_team (
    "name" text,
    organization text,
    report_date text,
    team_id bigint,
    total_engaged_users bigint,
    PRIMARY KEY ("name", organization, report_date, team_id),
    FOREIGN KEY (organization) REFERENCES copilot_metric_team(organization),
    FOREIGN KEY (report_date) REFERENCES copilot_metric_team("date"),
    FOREIGN KEY (team_id) REFERENCES copilot_metric_team(team_id)
);

CREATE TABLE repo_collaborator (
    repository_id bigint,
    user_id bigint,
    "admin" boolean,
    maintain boolean,
    pull boolean,
    push boolean,
    role_name text,
    site_admin boolean,
    triage boolean,
    PRIMARY KEY (repository_id, user_id),
    FOREIGN KEY (repository_id) REFERENCES repository(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE label (
    id bigint,
    color text,
    description text,
    is_default boolean,
    "name" text,
    url text,
    PRIMARY KEY (id)
);

CREATE TABLE security_advisory_vulnerability (
    security_advisory_id text,
    vulnerability_id text,
    PRIMARY KEY (security_advisory_id, vulnerability_id),
    FOREIGN KEY (security_advisory_id) REFERENCES security_advisory(ghsa_id),
    FOREIGN KEY (vulnerability_id) REFERENCES security_vulnerability(_fivetran_id)
);

CREATE TABLE commit_check_run (
    id bigint,
    commit_sha text,
    app_id bigint,
    app_name text,
    check_suite_id bigint,
    completed_at timestamp,
    conclusion text,
    external_id text,
    "name" text,
    started_at timestamp,
    "status" text,
    PRIMARY KEY (id, commit_sha),
    FOREIGN KEY (commit_sha) REFERENCES commit(sha)
);

CREATE TABLE stargazer (
    login text,
    repository_id bigint,
    starred_at timestamp,
    PRIMARY KEY (login, repository_id),
    FOREIGN KEY (repository_id) REFERENCES repository(id)
);

CREATE TABLE team_membership (
    team_id bigint,
    user_id bigint,
    PRIMARY KEY (team_id, user_id),
    FOREIGN KEY (team_id) REFERENCES team(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE issue_milestone_history (
    updated_at timestamp,
    issue_id bigint,
    actor_id bigint,
    milestone_id bigint,
    milestoned boolean,
    PRIMARY KEY (updated_at, issue_id),
    FOREIGN KEY (issue_id) REFERENCES issue(id),
    FOREIGN KEY (actor_id) REFERENCES "user"(id),
    FOREIGN KEY (milestone_id) REFERENCES milestone(id)
);

CREATE TABLE ide_chat_editor (
    "name" text,
    organization text,
    report_date text,
    total_engaged_users bigint,
    PRIMARY KEY ("name", organization, report_date),
    FOREIGN KEY (organization) REFERENCES copilot_metric(organization),
    FOREIGN KEY (report_date) REFERENCES copilot_metric("date")
);

CREATE TABLE commit_status (
    id bigint,
    commit_sha text,
    context text,
    created_at timestamp,
    description text,
    "state" text,
    target_url text,
    updated_at timestamp,
    PRIMARY KEY (id, commit_sha),
    FOREIGN KEY (commit_sha) REFERENCES commit(sha)
);

CREATE TABLE "release" (
    id bigint,
    author_id bigint,
    repository_id bigint,
    body text,
    created_at timestamp,
    draft boolean,
    "name" text,
    prerelease boolean,
    published_at timestamp,
    tag_name text,
    target_commitish text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (author_id) REFERENCES "user"(id),
    FOREIGN KEY (repository_id) REFERENCES repository(id)
);

CREATE TABLE issue_assignee (
    issue_id bigint,
    user_id bigint,
    PRIMARY KEY (issue_id, user_id),
    FOREIGN KEY (issue_id) REFERENCES issue(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE workflow_run_pull_request (
    pull_request_id bigint,
    workflow_run_id bigint,
    PRIMARY KEY (pull_request_id, workflow_run_id),
    FOREIGN KEY (pull_request_id) REFERENCES pull_request(id),
    FOREIGN KEY (workflow_run_id) REFERENCES workflow_run(id)
);

CREATE TABLE issue_merged (
    merged_at timestamp,
    commit_sha text,
    issue_id bigint,
    actor_id bigint,
    PRIMARY KEY (merged_at, commit_sha, issue_id),
    FOREIGN KEY (commit_sha) REFERENCES commit(sha),
    FOREIGN KEY (issue_id) REFERENCES issue(id),
    FOREIGN KEY (actor_id) REFERENCES "user"(id)
);

CREATE TABLE issue_locked_history (
    updated_at timestamp,
    issue_id bigint,
    actor_id bigint,
    locked boolean,
    PRIMARY KEY (updated_at, issue_id),
    FOREIGN KEY (issue_id) REFERENCES issue(id),
    FOREIGN KEY (actor_id) REFERENCES "user"(id)
);

CREATE TABLE project_v_2 (
    id bigint,
    creator_id bigint,
    deleted_by_id bigint,
    latest_status_update_creator_id bigint,
    owner_id bigint,
    closed_at timestamp,
    created_at timestamp,
    deleted_at timestamp,
    description text,
    is_public boolean,
    is_template boolean,
    latest_status_update_body text,
    latest_status_update_created_at timestamp,
    latest_status_update_id bigint,
    latest_status_update_start_date text,
    latest_status_update_status text,
    latest_status_update_target_date text,
    latest_status_update_updated_at timestamp,
    number bigint,
    short_description text,
    "state" text,
    title text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (creator_id) REFERENCES "user"(id),
    FOREIGN KEY (deleted_by_id) REFERENCES "user"(id),
    FOREIGN KEY (latest_status_update_creator_id) REFERENCES "user"(id),
    FOREIGN KEY (owner_id) REFERENCES "user"(id)
);

CREATE TABLE pull_request_ready_for_review_history (
    created_at timestamp,
    pull_request_id bigint,
    actor_id bigint,
    ready_for_review boolean,
    PRIMARY KEY (created_at, pull_request_id),
    FOREIGN KEY (pull_request_id) REFERENCES pull_request(id),
    FOREIGN KEY (actor_id) REFERENCES "user"(id)
);
