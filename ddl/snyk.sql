CREATE TABLE group_organization (
    group_id text,
    id text,
    created_at text,
    url text,
    PRIMARY KEY (group_id, id),
    FOREIGN KEY (id) REFERENCES organization(id)
);

CREATE TABLE group_role (
    "name" text,
    organization_group_id text,
    created_at text,
    description text,
    markdown_parsed text,
    modified_at text,
    public_id text,
    PRIMARY KEY ("name", organization_group_id)
);

CREATE TABLE project_tag (
    "index" text,
    organization_id text,
    project_id text,
    tags text,
    PRIMARY KEY ("index", organization_id, project_id),
    FOREIGN KEY (organization_id) REFERENCES project(organization_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE project_environment (
    "index" text,
    organization_id text,
    project_id text,
    environment text,
    PRIMARY KEY ("index", organization_id, project_id),
    FOREIGN KEY (organization_id) REFERENCES project(organization_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE project_business_criticality (
    "index" text,
    organization_id text,
    project_id text,
    business_criticality text,
    PRIMARY KEY ("index", organization_id, project_id),
    FOREIGN KEY (organization_id) REFERENCES project(organization_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE project_life_cycle (
    "index" text,
    organization_id text,
    project_id text,
    lifecycle text,
    PRIMARY KEY ("index", organization_id, project_id),
    FOREIGN KEY (organization_id) REFERENCES project(organization_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE project_ignored_dependency (
    "index" text,
    organization_id text,
    project_id text,
    ignored_dependency text,
    PRIMARY KEY ("index", organization_id, project_id),
    FOREIGN KEY (organization_id) REFERENCES project(organization_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE project_pull_request_assignee (
    "index" text,
    organization_id text,
    project_id text,
    pull_request_assignee text,
    PRIMARY KEY ("index", organization_id, project_id),
    FOREIGN KEY (organization_id) REFERENCES project(organization_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE project (
    id text,
    organization_id text,
    target_id text,
    build_args_root_workspace text,
    cli_monitored_at text,
    created text,
    importer_id text,
    latest_dependency_total text,
    latest_dependency_total_updated_at text,
    meta_latest_issue_counts_critical text,
    meta_latest_issue_counts_high text,
    meta_latest_issue_counts_low text,
    meta_latest_issue_counts_medium text,
    meta_latest_issue_counts_updated_at text,
    "name" text,
    origin text,
    owner_id text,
    read_only text,
    setting_auto_dependency_upgrade_is_enabled text,
    setting_auto_dependency_upgrade_is_major_upgrade_enabled text,
    setting_auto_dependency_upgrade_limit text,
    setting_auto_dependency_upgrade_minimum_age text,
    setting_auto_remediation_pr_is_backlog_prs_enabled text,
    setting_auto_remediation_pr_is_fresh_prs_enabled text,
    setting_auto_remediation_pr_is_patch_remediation_enabled text,
    setting_manual_remediation_pr_is_patch_remediation_enabled text,
    setting_pull_request_assignment_is_enabled text,
    setting_pull_request_assignment_type text,
    setting_pull_request_fail_only_for_issues_with_fix text,
    setting_pull_request_policy text,
    setting_pull_request_severity_threshold text,
    setting_recurring_test_frequency text,
    "status" text,
    target_file text,
    target_reference text,
    target_runtime text,
    "type" text,
    PRIMARY KEY (id, organization_id),
    FOREIGN KEY (organization_id) REFERENCES organization(id),
    FOREIGN KEY (target_id) REFERENCES target(id)
);

CREATE TABLE member (
    id text,
    organization_id text,
    email text,
    "name" text,
    "role" text,
    username text,
    PRIMARY KEY (id, organization_id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE jira_issue (
    id text,
    organization_id text,
    project_id text,
    "key" text,
    PRIMARY KEY (id, organization_id, project_id),
    FOREIGN KEY (organization_id) REFERENCES project(organization_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE issue_class (
    id text,
    issue_id text,
    organization_id text,
    "source" text,
    "type" text,
    PRIMARY KEY (id, issue_id, organization_id),
    FOREIGN KEY (issue_id) REFERENCES issue(id),
    FOREIGN KEY (organization_id) REFERENCES issue(organization_id)
);

CREATE TABLE issue_coordinate_remedy (
    "index" text,
    issue_coordinate_index text,
    issue_id text,
    organization_id text,
    correlation_id text,
    description text,
    schema_version text,
    "type" text,
    PRIMARY KEY ("index", issue_coordinate_index, issue_id, organization_id),
    FOREIGN KEY (issue_coordinate_index) REFERENCES issue_coordinate("index"),
    FOREIGN KEY (issue_id) REFERENCES issue_coordinate(issue_id),
    FOREIGN KEY (organization_id) REFERENCES issue_coordinate(organization_id)
);

CREATE TABLE issue_coordinate_representation (
    "index" text,
    issue_coordinate_index text,
    issue_id text,
    organization_id text,
    package_name text,
    package_version text,
    PRIMARY KEY ("index", issue_coordinate_index, issue_id, organization_id),
    FOREIGN KEY (issue_coordinate_index) REFERENCES issue_coordinate("index"),
    FOREIGN KEY (issue_id) REFERENCES issue_coordinate(issue_id),
    FOREIGN KEY (organization_id) REFERENCES issue_coordinate(organization_id)
);

CREATE TABLE issue_coordinate (
    "index" text,
    issue_id text,
    organization_id text,
    is_fixable_manually text,
    is_fixable_snyk text,
    is_fixable_upstream text,
    is_patchable text,
    is_pinnable text,
    is_upgradeable text,
    reachability text,
    PRIMARY KEY ("index", issue_id, organization_id),
    FOREIGN KEY (issue_id) REFERENCES issue(id),
    FOREIGN KEY (organization_id) REFERENCES issue(organization_id)
);

CREATE TABLE issue_problem (
    id text,
    issue_id text,
    organization_id text,
    "source" text,
    "type" text,
    updated_at text,
    PRIMARY KEY (id, issue_id, organization_id),
    FOREIGN KEY (issue_id) REFERENCES issue(id),
    FOREIGN KEY (organization_id) REFERENCES issue(organization_id)
);

CREATE TABLE issue_risk_factor (
    "index" text,
    issue_id text,
    organization_id text,
    "name" text,
    updated_at text,
    "value" text,
    PRIMARY KEY ("index", issue_id, organization_id),
    FOREIGN KEY (issue_id) REFERENCES issue(id),
    FOREIGN KEY (organization_id) REFERENCES issue(organization_id)
);

CREATE TABLE issue_test_execution (
    id text,
    issue_id text,
    organization_id text,
    "type" text,
    PRIMARY KEY (id, issue_id, organization_id),
    FOREIGN KEY (issue_id) REFERENCES issue(id),
    FOREIGN KEY (organization_id) REFERENCES issue(organization_id)
);

CREATE TABLE issue (
    id text,
    organization_id text,
    scan_item_id text,
    created_at text,
    description text,
    effective_severity_level text,
    ignore_id text,
    ignored text,
    "key" text,
    resolution_details text,
    resolution_resolved_at text,
    resolution_type text,
    risk_score_model text,
    risk_score_value text,
    "status" text,
    title text,
    tool text,
    "type" text,
    updated_at text,
    PRIMARY KEY (id, organization_id),
    FOREIGN KEY (organization_id) REFERENCES organization(id),
    FOREIGN KEY (scan_item_id) REFERENCES project(id)
);

CREATE TABLE dependency_license (
    id text,
    dependency_id text,
    organization_id text,
    license text,
    title text,
    PRIMARY KEY (id, dependency_id, organization_id),
    FOREIGN KEY (dependency_id) REFERENCES dependency(id),
    FOREIGN KEY (organization_id) REFERENCES dependency(organization_id)
);

CREATE TABLE dependency_with_issue (
    "index" text,
    dependency_id text,
    organization_id text,
    dependencies_with_issue text,
    PRIMARY KEY ("index", dependency_id, organization_id),
    FOREIGN KEY (dependency_id) REFERENCES dependency(id),
    FOREIGN KEY (organization_id) REFERENCES dependency(organization_id)
);

CREATE TABLE dependency_project (
    id text,
    dependency_id text,
    organization_id text,
    "name" text,
    PRIMARY KEY (id, dependency_id, organization_id),
    FOREIGN KEY (dependency_id) REFERENCES dependency(id),
    FOREIGN KEY (organization_id) REFERENCES dependency(organization_id)
);

CREATE TABLE dependency_copyright (
    "index" text,
    dependency_id text,
    organization_id text,
    copyright text,
    PRIMARY KEY ("index", dependency_id, organization_id),
    FOREIGN KEY (dependency_id) REFERENCES dependency(id),
    FOREIGN KEY (organization_id) REFERENCES dependency(organization_id)
);

CREATE TABLE dependency (
    id text,
    organization_id text,
    deprecated_version jsonb,
    first_published_date text,
    is_deprecated text,
    issues_critical text,
    issues_high text,
    issues_low text,
    issues_medium text,
    latest_version text,
    latest_version_published_date text,
    "name" text,
    "type" text,
    version text,
    PRIMARY KEY (id, organization_id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE collection (
    id text,
    organization_id text,
    created_by_id text,
    is_generated text,
    issues_critical_count text,
    issues_high_count text,
    issues_low_count text,
    issues_medium_count text,
    "name" text,
    projects_count text,
    PRIMARY KEY (id, organization_id),
    FOREIGN KEY (organization_id) REFERENCES organization(id),
    FOREIGN KEY (created_by_id) REFERENCES member(id)
);

CREATE TABLE aggregated_issue_severity (
    "index" text,
    aggregated_issue_id text,
    assigner text,
    base_score text,
    cvss_version text,
    modification_time timestamp,
    severity text,
    vector text,
    PRIMARY KEY ("index", aggregated_issue_id),
    FOREIGN KEY (aggregated_issue_id) REFERENCES aggregated_issue(id)
);

CREATE TABLE aggregated_issue_exploit_detail_maturity_level (
    "index" text,
    aggregated_issue_exploit_detail_index text,
    aggregated_issue_id text,
    format text,
    "level" text,
    PRIMARY KEY ("index", aggregated_issue_exploit_detail_index, aggregated_issue_id),
    FOREIGN KEY (aggregated_issue_exploit_detail_index) REFERENCES aggregated_issue_exploit_detail("index"),
    FOREIGN KEY (aggregated_issue_id) REFERENCES aggregated_issue(id)
);

CREATE TABLE aggregated_issue_exploit_detail (
    "index" text,
    aggregated_issue_id text,
    sources jsonb,
    PRIMARY KEY ("index", aggregated_issue_id),
    FOREIGN KEY (aggregated_issue_id) REFERENCES aggregated_issue(id)
);

CREATE TABLE aggregated_issue_patch (
    id text,
    aggregated_issue_id text,
    comments jsonb,
    modification_time timestamp,
    urls jsonb,
    version text,
    PRIMARY KEY (id, aggregated_issue_id),
    FOREIGN KEY (aggregated_issue_id) REFERENCES aggregated_issue(id)
);

CREATE TABLE aggregated_issue_priority_factor (
    "index" text,
    aggregated_issue_id text,
    description text,
    "name" text,
    PRIMARY KEY ("index", aggregated_issue_id),
    FOREIGN KEY (aggregated_issue_id) REFERENCES aggregated_issue(id)
);

CREATE TABLE aggregated_issue_introduced_through (
    "index" text,
    aggregated_issue_id text,
    data text,
    kind text,
    PRIMARY KEY ("index", aggregated_issue_id),
    FOREIGN KEY (aggregated_issue_id) REFERENCES aggregated_issue(id)
);

CREATE TABLE aggregated_issue_ignore_reason (
    "index" text,
    aggregated_issue_id text,
    expires text,
    reason text,
    "source" text,
    PRIMARY KEY ("index", aggregated_issue_id),
    FOREIGN KEY (aggregated_issue_id) REFERENCES aggregated_issue(id)
);

CREATE TABLE aggregated_issue_pkg_info (
    "index" text,
    aggregated_issue_id text,
    pkg_info text,
    PRIMARY KEY ("index", aggregated_issue_id),
    FOREIGN KEY (aggregated_issue_id) REFERENCES aggregated_issue(id),
    FOREIGN KEY (pkg_info) REFERENCES dependency_with_issue(dependencies_with_issue)
);

CREATE TABLE aggregated_issue (
    id text,
    organization_id text,
    project_id text,
    credit jsonb,
    cve jsonb,
    cvss_score text,
    cwe jsonb,
    disclosure_time text,
    exploit_maturity text,
    fix_info_fixed_in jsonb,
    fix_info_is_fixable text,
    fix_info_is_partially_fixable text,
    fix_info_is_patchable text,
    fix_info_is_pinnable text,
    fix_info_is_upgradable text,
    ghsa jsonb,
    is_ignored text,
    is_malicious_package text,
    is_patched text,
    issue_data_description text,
    issue_type text,
    languages text,
    links_path text,
    nearest_fixed_in_version text,
    original_severity text,
    osvdb jsonb,
    "path" text,
    pkg_name text,
    pkg_versions jsonb,
    priority_score text,
    publication_time text,
    semver_unaffected text,
    semver_vulnerable jsonb,
    severity text,
    title text,
    url text,
    violated_policy_public_id text,
    PRIMARY KEY (id, organization_id, project_id),
    FOREIGN KEY (organization_id) REFERENCES project(organization_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE target (
    id text,
    organization_id text,
    created_at text,
    display_name text,
    integration_id text,
    integration_type text,
    is_private text,
    url text,
    PRIMARY KEY (id, organization_id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE license_dependency (
    id text,
    license_id text,
    organization_id text,
    package_manager text,
    PRIMARY KEY (id, license_id, organization_id),
    FOREIGN KEY (id) REFERENCES dependency(id),
    FOREIGN KEY (license_id) REFERENCES license(id),
    FOREIGN KEY (organization_id) REFERENCES license(organization_id)
);

CREATE TABLE license_project (
    id text,
    license_id text,
    organization_id text,
    "name" text,
    PRIMARY KEY (id, license_id, organization_id),
    FOREIGN KEY (license_id) REFERENCES license(id),
    FOREIGN KEY (organization_id) REFERENCES license(organization_id)
);

CREATE TABLE license (
    id text,
    organization_id text,
    instruction text,
    severity text,
    PRIMARY KEY (id, organization_id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE organization (
    id text,
    access_requests_enabled text,
    created_at text,
    group_id text,
    is_personal text,
    member_role_id text,
    member_role_name text,
    member_role_type text,
    "name" text,
    slug text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE group_tag (
    "key" text,
    organization_group_id text,
    "value" text,
    PRIMARY KEY ("key", organization_group_id, "value")
);

CREATE TABLE group_member (
    group_id text,
    id text,
    email text,
    group_role text,
    "name" text,
    username text,
    PRIMARY KEY (group_id, id),
    FOREIGN KEY (id) REFERENCES member(id)
);
