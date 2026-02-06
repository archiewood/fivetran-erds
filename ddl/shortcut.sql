CREATE TABLE group_workspace_member (
    groups_id text,
    id text,
    PRIMARY KEY (groups_id, id),
    FOREIGN KEY (groups_id) REFERENCES groups(id),
    FOREIGN KEY (id) REFERENCES workspace_member(id)
);

CREATE TABLE group_workflow (
    groups_id text,
    id text,
    PRIMARY KEY (groups_id, id),
    FOREIGN KEY (groups_id) REFERENCES groups(id),
    FOREIGN KEY (id) REFERENCES workflow(id)
);

CREATE TABLE groups (
    id text,
    app_url text,
    archived text,
    color text,
    color_key text,
    description text,
    display_icon_created_at text,
    display_icon_entity_type text,
    display_icon_id text,
    display_icon_updated_at text,
    display_icon_url text,
    entity_type text,
    global_id text,
    mention_name text,
    "name" text,
    num_epics_started text,
    num_stories text,
    num_stories_backlog text,
    num_stories_started text,
    PRIMARY KEY (id)
);

CREATE TABLE authenticated_member (
    id text,
    mention_name text,
    "name" text,
    workspace_2_estimate_scale jsonb,
    workspace_2_url_slug text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES workspace_member(id)
);

CREATE TABLE custom_field_value (
    id text,
    custom_field_id text,
    color_key text,
    enabled text,
    entity_type text,
    "position" text,
    "value" text,
    PRIMARY KEY (id, custom_field_id),
    FOREIGN KEY (custom_field_id) REFERENCES custom_field(id)
);

CREATE TABLE custom_field (
    id text,
    canonical_name text,
    created_at text,
    description text,
    enabled text,
    entity_type text,
    field_type text,
    fixed_position text,
    icon_set_identifier text,
    "name" text,
    "position" text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE label (
    id text,
    app_url text,
    archived text,
    color text,
    created_at text,
    description text,
    entity_type text,
    external_id text,
    global_id text,
    "name" text,
    stats_num_epics text,
    stats_num_epics_completed text,
    stats_num_epics_in_progress text,
    stats_num_epics_total text,
    stats_num_epics_unstarted text,
    stats_num_points_backlog text,
    stats_num_points_completed text,
    stats_num_points_in_progress text,
    stats_num_points_total text,
    stats_num_points_unstarted text,
    stats_num_related_documents text,
    stats_num_stories_backlog text,
    stats_num_stories_completed text,
    stats_num_stories_in_progress text,
    stats_num_stories_total text,
    stats_num_stories_unestimated text,
    stats_num_stories_unstarted text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE iteration_associated_group (
    group_id text,
    iteration_id text,
    associated_stories_count text,
    PRIMARY KEY (group_id, iteration_id),
    FOREIGN KEY (group_id) REFERENCES groups(id),
    FOREIGN KEY (iteration_id) REFERENCES iteration(id)
);

CREATE TABLE iteration_label (
    iteration_id text,
    label_id text,
    PRIMARY KEY (iteration_id, label_id),
    FOREIGN KEY (iteration_id) REFERENCES iteration(id),
    FOREIGN KEY (label_id) REFERENCES label(id)
);

CREATE TABLE iteration_follower (
    iteration_id text,
    workspace_member_id text,
    PRIMARY KEY (iteration_id, workspace_member_id),
    FOREIGN KEY (iteration_id) REFERENCES iteration(id),
    FOREIGN KEY (workspace_member_id) REFERENCES workspace_member(id)
);

CREATE TABLE iteration_mention (
    id text,
    iteration_id text,
    PRIMARY KEY (id, iteration_id),
    FOREIGN KEY (id) REFERENCES workspace_member(id),
    FOREIGN KEY (iteration_id) REFERENCES iteration(id)
);

CREATE TABLE iteration_member_mention (
    id text,
    iteration_id text,
    PRIMARY KEY (id, iteration_id),
    FOREIGN KEY (id) REFERENCES workspace_member(id),
    FOREIGN KEY (iteration_id) REFERENCES iteration(id)
);

CREATE TABLE iteration_group (
    group_id text,
    iteration_id text,
    PRIMARY KEY (group_id, iteration_id),
    FOREIGN KEY (group_id) REFERENCES groups(id),
    FOREIGN KEY (iteration_id) REFERENCES iteration(id)
);

CREATE TABLE iteration (
    id text,
    group_mention_ids jsonb,
    app_url text,
    created_at text,
    end_date text,
    entity_type text,
    global_id text,
    "name" text,
    start_date text,
    stats_num_epics text,
    stats_num_epics_completed text,
    stats_num_epics_in_progress text,
    stats_num_epics_total text,
    stats_num_epics_unstarted text,
    stats_num_points_backlog text,
    stats_num_points_completed text,
    stats_num_points_in_progress text,
    stats_num_points_total text,
    stats_num_points_unstarted text,
    stats_num_related_documents text,
    stats_num_stories_backlog text,
    stats_num_stories_completed text,
    stats_num_stories_in_progress text,
    stats_num_stories_total text,
    stats_num_stories_unestimated text,
    stats_num_stories_unstarted text,
    "status" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (group_mention_ids) REFERENCES groups(id)
);

CREATE TABLE project_follower (
    project_id text,
    workspace_member_id text,
    PRIMARY KEY (project_id, workspace_member_id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (workspace_member_id) REFERENCES workspace_member(id)
);

CREATE TABLE project (
    id text,
    team_id text,
    workflow_id text,
    abbreviation text,
    app_url text,
    archived text,
    color text,
    created_at text,
    days_to_thermometer text,
    description text,
    entity_type text,
    external_id text,
    iteration_length text,
    "name" text,
    show_thermometer text,
    start_time text,
    stats_num_points text,
    stats_num_related_documents text,
    stats_num_stories text,
    updated_at text,
    PRIMARY KEY (id, team_id),
    FOREIGN KEY (workflow_id) REFERENCES workflow(id)
);

CREATE TABLE epic_associated_group (
    epic_id text,
    group_id text,
    associated_stories_count text,
    PRIMARY KEY (epic_id, group_id),
    FOREIGN KEY (epic_id) REFERENCES epic(id),
    FOREIGN KEY (group_id) REFERENCES groups(id)
);

CREATE TABLE epic_objective (
    objective_id text,
    epic_id text,
    id text,
    PRIMARY KEY (objective_id, epic_id),
    FOREIGN KEY (epic_id) REFERENCES epic(id),
    FOREIGN KEY (id) REFERENCES objective(id)
);

CREATE TABLE epic_label (
    epic_id text,
    id text,
    PRIMARY KEY (epic_id, id),
    FOREIGN KEY (epic_id) REFERENCES epic(id),
    FOREIGN KEY (id) REFERENCES label(id)
);

CREATE TABLE epic_project (
    epic_id text,
    id text,
    PRIMARY KEY (epic_id, id),
    FOREIGN KEY (epic_id) REFERENCES epic(id),
    FOREIGN KEY (id) REFERENCES project(id)
);

CREATE TABLE epic (
    id text,
    epic_state_id text,
    group_id text,
    requested_by_id text,
    app_url text,
    archived text,
    completed text,
    completed_at text,
    completed_at_override text,
    created_at text,
    deadline text,
    entity_type text,
    external_id text,
    global_id text,
    milestone_id text,
    "name" text,
    planned_start_date text,
    "position" text,
    productboard_id text,
    productboard_name text,
    productboard_plugin_id text,
    productboard_url text,
    started text,
    started_at text,
    started_at_override text,
    "state" text,
    stats_average_cycle_time text,
    stats_average_lead_time text,
    stats_last_story_update text,
    stats_num_points text,
    stats_num_points_backlog text,
    stats_num_points_done text,
    stats_num_points_started text,
    stats_num_points_unstarted text,
    stats_num_related_documents text,
    stats_num_stories_backlog text,
    stats_num_stories_done text,
    stats_num_stories_started text,
    stats_num_stories_total text,
    stats_num_stories_unestimated text,
    stats_num_stories_unstarted text,
    stories_without_projects text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (epic_state_id) REFERENCES epic_workflow_state(id),
    FOREIGN KEY (group_id) REFERENCES groups(id),
    FOREIGN KEY (requested_by_id) REFERENCES workspace_member(id)
);

CREATE TABLE epic_comment (
    id text,
    epic_id text,
    app_url text,
    author_id text,
    created_at text,
    deleted text,
    entity_type text,
    external_id text,
    group_mention_ids jsonb,
    member_mention_ids jsonb,
    mention_ids jsonb,
    text text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (epic_id) REFERENCES epic(id)
);

CREATE TABLE epic_workflow_state (
    id text,
    epic_workflow_id text,
    created_at text,
    description text,
    entity_type text,
    global_id text,
    "name" text,
    "position" text,
    "type" text,
    updated_at text,
    PRIMARY KEY (id, epic_workflow_id),
    FOREIGN KEY (epic_workflow_id) REFERENCES epic_workflow(id)
);

CREATE TABLE epic_workflow (
    id text,
    default_epic_state_id text,
    created_at text,
    entity_type text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (default_epic_state_id) REFERENCES epic_workflow_state(id)
);

CREATE TABLE category (
    id text,
    archived text,
    color text,
    created_at text,
    entity_type text,
    external_id text,
    "name" text,
    "type" text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE objective_category (
    id text,
    objective_id text,
    PRIMARY KEY (id, objective_id),
    FOREIGN KEY (id) REFERENCES category(id),
    FOREIGN KEY (objective_id) REFERENCES objective(id)
);

CREATE TABLE objective (
    id text,
    app_url text,
    archived text,
    completed text,
    completed_at text,
    completed_at_override text,
    created_at text,
    description text,
    entity_type text,
    global_id text,
    key_result_id jsonb,
    "name" text,
    "position" text,
    started text,
    started_at text,
    started_at_override text,
    "state" text,
    stats_average_cycle_time text,
    stats_average_lead_time text,
    stats_num_related_documents text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE file_mention (
    file_id text,
    id text,
    PRIMARY KEY (file_id, id),
    FOREIGN KEY (file_id) REFERENCES file(id),
    FOREIGN KEY (id) REFERENCES workspace_member(id)
);

CREATE TABLE file_member_mention (
    file_id text,
    id text,
    PRIMARY KEY (file_id, id),
    FOREIGN KEY (file_id) REFERENCES file(id),
    FOREIGN KEY (id) REFERENCES workspace_member(id)
);

CREATE TABLE file_group_mention (
    file_id text,
    id text,
    PRIMARY KEY (file_id, id),
    FOREIGN KEY (file_id) REFERENCES file(id),
    FOREIGN KEY (id) REFERENCES groups(id)
);

CREATE TABLE file (
    id text,
    uploader_id text,
    content_type text,
    created_at text,
    description text,
    entity_type text,
    external_id text,
    filename text,
    "name" text,
    "size" text,
    thumbnail_url text,
    updated_at text,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (uploader_id) REFERENCES workspace_member(id)
);

CREATE TABLE entity_template_label (
    entity_template_id text,
    id text,
    PRIMARY KEY (entity_template_id, id),
    FOREIGN KEY (entity_template_id) REFERENCES entity_template(id),
    FOREIGN KEY (id) REFERENCES label(id)
);

CREATE TABLE entity_template_follower (
    entity_template_id text,
    id text,
    PRIMARY KEY (entity_template_id, id),
    FOREIGN KEY (entity_template_id) REFERENCES entity_template(id),
    FOREIGN KEY (id) REFERENCES workspace_member(id)
);

CREATE TABLE entity_template_owner (
    entity_template_id text,
    id text,
    PRIMARY KEY (entity_template_id, id),
    FOREIGN KEY (entity_template_id) REFERENCES entity_template(id),
    FOREIGN KEY (id) REFERENCES workspace_member(id)
);

CREATE TABLE entity_template_task (
    _fivetran_id text,
    entity_template_id text,
    complete text,
    description text,
    "position" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (entity_template_id) REFERENCES entity_template(id)
);

CREATE TABLE entity_template_file (
    entity_template_id text,
    id text,
    PRIMARY KEY (entity_template_id, id),
    FOREIGN KEY (entity_template_id) REFERENCES entity_template(id),
    FOREIGN KEY (id) REFERENCES file(id)
);

CREATE TABLE entity_template_linked_file (
    entity_template_id text,
    id text,
    PRIMARY KEY (entity_template_id, id),
    FOREIGN KEY (entity_template_id) REFERENCES entity_template(id),
    FOREIGN KEY (id) REFERENCES linked_file(id)
);

CREATE TABLE entity_template_external (
    link text,
    entity_template_id text,
    PRIMARY KEY (link, entity_template_id),
    FOREIGN KEY (entity_template_id) REFERENCES entity_template(id)
);

CREATE TABLE entity_template (
    id text,
    author_id text,
    epic_id text,
    group_id text,
    project_id text,
    workflow_state_id text,
    created_at text,
    deadline text,
    description text,
    entity_type text,
    estimate text,
    external_links text,
    last_used_at text,
    linked_files jsonb,
    "name" text,
    story_type text,
    updated_at text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (author_id) REFERENCES workspace_member(id),
    FOREIGN KEY (epic_id) REFERENCES epic(id),
    FOREIGN KEY (group_id) REFERENCES groups(id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (workflow_state_id) REFERENCES workflow_state(id)
);

CREATE TABLE epic_story_custom_field (
    id text,
    story_id text,
    value_id text,
    PRIMARY KEY (id, story_id, value_id),
    FOREIGN KEY (story_id) REFERENCES epic_story(id),
    FOREIGN KEY (value_id) REFERENCES custom_field_value(id)
);

CREATE TABLE epic_story_task (
    id text,
    epic_story_id text,
    PRIMARY KEY (id, epic_story_id),
    FOREIGN KEY (epic_story_id) REFERENCES epic_story(id)
);

CREATE TABLE epic_story_file (
    epic_story_id text,
    id text,
    PRIMARY KEY (epic_story_id, id),
    FOREIGN KEY (epic_story_id) REFERENCES epic_story(id),
    FOREIGN KEY (id) REFERENCES file(id)
);

CREATE TABLE epic_story_previous_iteration (
    epic_story_id text,
    id text,
    PRIMARY KEY (epic_story_id, id),
    FOREIGN KEY (epic_story_id) REFERENCES epic_story(id),
    FOREIGN KEY (id) REFERENCES iteration(id)
);

CREATE TABLE epic_story_label (
    epic_story_id text,
    id text,
    PRIMARY KEY (epic_story_id, id),
    FOREIGN KEY (epic_story_id) REFERENCES epic_story(id),
    FOREIGN KEY (id) REFERENCES label(id)
);

CREATE TABLE epic_story_follower (
    epic_story_id text,
    id text,
    PRIMARY KEY (epic_story_id, id),
    FOREIGN KEY (epic_story_id) REFERENCES epic_story(id),
    FOREIGN KEY (id) REFERENCES workspace_member(id)
);

CREATE TABLE epic_story_owner (
    epic_story_id text,
    id text,
    PRIMARY KEY (epic_story_id, id),
    FOREIGN KEY (epic_story_id) REFERENCES epic_story(id),
    FOREIGN KEY (id) REFERENCES workspace_member(id)
);

CREATE TABLE epic_story_comment (
    epic_story_id text,
    id text,
    PRIMARY KEY (epic_story_id, id),
    FOREIGN KEY (epic_story_id) REFERENCES epic_story(id),
    FOREIGN KEY (id) REFERENCES epic_comment(id)
);

CREATE TABLE epic_story_linked_file (
    epic_story_id text,
    id text,
    PRIMARY KEY (epic_story_id, id),
    FOREIGN KEY (epic_story_id) REFERENCES epic_story(id),
    FOREIGN KEY (id) REFERENCES linked_file(id)
);

CREATE TABLE epic_story_mention (
    epic_story_id text,
    id text,
    PRIMARY KEY (epic_story_id, id),
    FOREIGN KEY (epic_story_id) REFERENCES epic_story(id),
    FOREIGN KEY (id) REFERENCES epic_workflow(id)
);

CREATE TABLE epic_story_member_mention (
    epic_story_id text,
    id text,
    PRIMARY KEY (epic_story_id, id),
    FOREIGN KEY (epic_story_id) REFERENCES epic_story(id),
    FOREIGN KEY (id) REFERENCES epic_workflow(id)
);

CREATE TABLE epic_story_group_mention (
    epic_story_id text,
    id text,
    PRIMARY KEY (epic_story_id, id),
    FOREIGN KEY (epic_story_id) REFERENCES epic_story(id),
    FOREIGN KEY (id) REFERENCES epic_workflow(id)
);

CREATE TABLE epic_story (
    id text,
    epic_id text,
    group_id text,
    iteration_id text,
    project_id text,
    requested_by_id text,
    workflow_id text,
    workflow_state_id text,
    app_url text,
    archived text,
    blocked text,
    blocker text,
    completed text,
    completed_at text,
    completed_at_override text,
    created_at text,
    cycle_time text,
    deadline text,
    entity_type text,
    estimate text,
    external_id text,
    external_links jsonb,
    global_id text,
    lead_time text,
    moved_at text,
    "name" text,
    num_tasks_completed text,
    "position" text,
    started text,
    started_at text,
    started_at_override text,
    stats_num_related_documents text,
    story_links text,
    story_template_id text,
    story_type text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (epic_id) REFERENCES epic(id),
    FOREIGN KEY (group_id) REFERENCES groups(id),
    FOREIGN KEY (iteration_id) REFERENCES iteration(id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (requested_by_id) REFERENCES workspace_member(id),
    FOREIGN KEY (workflow_id) REFERENCES workflow(id),
    FOREIGN KEY (workflow_state_id) REFERENCES workflow_state(id)
);

CREATE TABLE external_story_link (
    id text,
    external_link_stories_id text,
    created_at text,
    entity_type text,
    object_id text,
    subject_id text,
    subject_workflow_state_id text,
    "type" text,
    updated_at text,
    verb text,
    PRIMARY KEY (id, external_link_stories_id),
    FOREIGN KEY (external_link_stories_id) REFERENCES external_link_stories(id)
);

CREATE TABLE external_link_stories (
    id text,
    entity_template_external_link text,
    created_at text,
    entity_type text,
    external_id text,
    full_name text,
    "name" text,
    "type" text,
    updated_at text,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (entity_template_external_link) REFERENCES entity_template_external(link)
);

CREATE TABLE story_custom_field (
    id text,
    story_id text,
    value_id text,
    PRIMARY KEY (id, story_id, value_id),
    FOREIGN KEY (story_id) REFERENCES story(id),
    FOREIGN KEY (value_id) REFERENCES custom_field_value(id)
);

CREATE TABLE story_owner (
    id text,
    story_id text,
    PRIMARY KEY (id, story_id),
    FOREIGN KEY (id) REFERENCES workspace_member(id),
    FOREIGN KEY (story_id) REFERENCES story(id)
);

CREATE TABLE story_comment_member_mention (
    id text,
    story_comment_id text,
    PRIMARY KEY (id, story_comment_id),
    FOREIGN KEY (id) REFERENCES workspace_member(id),
    FOREIGN KEY (story_comment_id) REFERENCES story_comment(id)
);

CREATE TABLE story_comment_mention (
    id text,
    story_comment_id text,
    PRIMARY KEY (id, story_comment_id),
    FOREIGN KEY (id) REFERENCES workspace_member(id),
    FOREIGN KEY (story_comment_id) REFERENCES story_comment(id)
);

CREATE TABLE story_comment_group_mention (
    id text,
    story_comment_id text,
    PRIMARY KEY (id, story_comment_id),
    FOREIGN KEY (id) REFERENCES groups(id),
    FOREIGN KEY (story_comment_id) REFERENCES story_comment(id)
);

CREATE TABLE story_comment (
    id text,
    author_id text,
    parent_id text,
    story_id text,
    app_url text,
    blocker text,
    created_at text,
    deleted text,
    entity_type text,
    external_id text,
    "position" text,
    text text,
    unblocks_parent text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (author_id) REFERENCES workspace_member(id),
    FOREIGN KEY (parent_id) REFERENCES story_comment(id),
    FOREIGN KEY (story_id) REFERENCES story(id)
);

CREATE TABLE story_commit (
    id text,
    author_id text,
    repository_id text,
    story_id text,
    author_email text,
    author_identity_entity_type text,
    author_identity_name text,
    author_identity_type text,
    created_at text,
    entity_type text,
    hash text,
    message text,
    timestamps text,
    updated_at text,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (author_id) REFERENCES workspace_member(id),
    FOREIGN KEY (repository_id) REFERENCES repository(id),
    FOREIGN KEY (story_id) REFERENCES story(id)
);

CREATE TABLE story_task_owner (
    id text,
    story_task_id text,
    PRIMARY KEY (id, story_task_id),
    FOREIGN KEY (id) REFERENCES workspace_member(id),
    FOREIGN KEY (story_task_id) REFERENCES story_task(id)
);

CREATE TABLE story_task_member_mention (
    id text,
    story_task_id text,
    PRIMARY KEY (id, story_task_id),
    FOREIGN KEY (id) REFERENCES workspace_member(id),
    FOREIGN KEY (story_task_id) REFERENCES story_task(id)
);

CREATE TABLE story_task_mention (
    id text,
    story_task_id text,
    PRIMARY KEY (id, story_task_id),
    FOREIGN KEY (id) REFERENCES workspace_member(id),
    FOREIGN KEY (story_task_id) REFERENCES story_task(id)
);

CREATE TABLE story_task_group_mention (
    id text,
    story_task_id text,
    PRIMARY KEY (id, story_task_id),
    FOREIGN KEY (id) REFERENCES groups(id),
    FOREIGN KEY (story_task_id) REFERENCES story_task(id)
);

CREATE TABLE story_task (
    id text,
    story_id text,
    complete text,
    completed_at text,
    created_at text,
    description text,
    entity_type text,
    external_id text,
    "position" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (story_id) REFERENCES story(id)
);

CREATE TABLE story_branch_pr_vcs_label (
    id text,
    story_branch_pr_id text,
    color text,
    description text,
    entity_type text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (story_branch_pr_id) REFERENCES story_branch_pr(id)
);

CREATE TABLE story_branch_pr (
    id text,
    repository_id text,
    story_branch_id text,
    branch_id text,
    branch_name text,
    closed text,
    created_at text,
    draft text,
    entity_type text,
    has_overlapping_stories text,
    merged text,
    num_added text,
    num_commits text,
    num_modified text,
    num_removed text,
    number text,
    overlapping_stories text,
    review_status text,
    target_branch_id text,
    target_branch_name text,
    title text,
    updated_at text,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (repository_id) REFERENCES repository(id),
    FOREIGN KEY (story_branch_id) REFERENCES story_branch(id)
);

CREATE TABLE story_branch (
    id text,
    repository_id text,
    story_id text,
    created_at text,
    deleted text,
    entity_type text,
    merged_branch_ids text,
    "name" text,
    persistent text,
    updated_at text,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (repository_id) REFERENCES repository(id),
    FOREIGN KEY (story_id) REFERENCES story(id)
);

CREATE TABLE story_linked_file (
    id text,
    story_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES linked_file(id),
    FOREIGN KEY (story_id) REFERENCES story(id)
);

CREATE TABLE story_file (
    id text,
    story_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES file(id),
    FOREIGN KEY (story_id) REFERENCES story(id)
);

CREATE TABLE story_label (
    id text,
    story_id text,
    PRIMARY KEY (id, story_id),
    FOREIGN KEY (id) REFERENCES label(id),
    FOREIGN KEY (story_id) REFERENCES story(id)
);

CREATE TABLE story (
    id text,
    epic_id text,
    group_id text,
    iteration_id text,
    project_id text,
    requested_by_id text,
    story_template_id text,
    workflow_id text,
    workflow_state_id text,
    app_url text,
    archived text,
    blocked text,
    blocker text,
    completed text,
    completed_at text,
    completed_at_override text,
    created_at text,
    cycle_time text,
    deadline text,
    description text,
    entity_type text,
    estimate text,
    external_id text,
    external_links text,
    lead_time text,
    moved_at text,
    "name" text,
    "position" text,
    started text,
    started_at text,
    started_at_override text,
    stats text,
    story_type text,
    synced_item_external_id text,
    synced_item_url text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (epic_id) REFERENCES epic(id),
    FOREIGN KEY (group_id) REFERENCES groups(id),
    FOREIGN KEY (iteration_id) REFERENCES iteration(id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (requested_by_id) REFERENCES workspace_member(id),
    FOREIGN KEY (story_template_id) REFERENCES entity_template(id),
    FOREIGN KEY (workflow_id) REFERENCES workflow(id),
    FOREIGN KEY (workflow_state_id) REFERENCES workflow_state(id)
);

CREATE TABLE workspace_member_group (
    group_id text,
    workspace_member_id text,
    PRIMARY KEY (group_id, workspace_member_id),
    FOREIGN KEY (group_id) REFERENCES groups(id),
    FOREIGN KEY (workspace_member_id) REFERENCES workspace_member(id)
);

CREATE TABLE workspace_member (
    id text,
    created_at text,
    created_without_invite text,
    disabled text,
    entity_type text,
    global_id text,
    profile_deactivated text,
    profile_display_icon_created_at text,
    profile_display_icon_entity_type text,
    profile_display_icon_id text,
    profile_display_icon_updated_at text,
    profile_display_icon_url text,
    profile_email_address text,
    profile_entity_type text,
    profile_gravatar_hash text,
    profile_id text,
    profile_is_owner text,
    profile_mention_name text,
    profile_name text,
    profile_two_factor_auth_activated text,
    "role" text,
    "state" text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE linked_file_group_mention (
    group_mention_id text,
    linked_file_id text,
    PRIMARY KEY (group_mention_id, linked_file_id),
    FOREIGN KEY (group_mention_id) REFERENCES groups(id),
    FOREIGN KEY (linked_file_id) REFERENCES linked_file(id)
);

CREATE TABLE linked_file_mention (
    id text,
    linked_file_id text,
    PRIMARY KEY (id, linked_file_id),
    FOREIGN KEY (id) REFERENCES workspace_member(id),
    FOREIGN KEY (linked_file_id) REFERENCES linked_file(id)
);

CREATE TABLE linked_file_member_mention (
    id text,
    linked_file_id text,
    PRIMARY KEY (id, linked_file_id),
    FOREIGN KEY (id) REFERENCES workspace_member(id),
    FOREIGN KEY (linked_file_id) REFERENCES linked_file(id)
);

CREATE TABLE linked_file (
    id text,
    uploader_id text,
    content_type text,
    created_at text,
    description text,
    entity_type text,
    "name" text,
    "size" text,
    thumbnail_url text,
    "type" text,
    updated_at text,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (uploader_id) REFERENCES workspace_member(id)
);

CREATE TABLE repository (
    id text,
    created_at text,
    entity_type text,
    external_id text,
    full_name text,
    "name" text,
    "type" text,
    updated_at text,
    url text,
    PRIMARY KEY (id)
);

CREATE TABLE workflow_state (
    id text,
    workflow_id text,
    created_at text,
    description text,
    entity_type text,
    global_id text,
    "name" text,
    num_stories text,
    num_story_templates text,
    "position" text,
    "type" text,
    updated_at text,
    verb text,
    PRIMARY KEY (id, workflow_id),
    FOREIGN KEY (workflow_id) REFERENCES workflow(id)
);

CREATE TABLE workflow (
    id text,
    default_state_id text,
    project_id jsonb,
    team_id text,
    auto_assign_owner text,
    created_at text,
    description text,
    entity_type text,
    "name" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (default_state_id) REFERENCES workflow_state(id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (team_id) REFERENCES project(team_id)
);
