CREATE TABLE list (
    id text,
    assignee text,
    folder_id text,
    space_id text,
    archived text,
    content text,
    due_date text,
    folder_access text,
    folder_hidden text,
    "name" text,
    order_index text,
    override_statuses text,
    permission_level text,
    priority text,
    priority_color text,
    space_access text,
    start_date text,
    "status" text,
    status_color text,
    status_hide_label text,
    task_count text,
    PRIMARY KEY (id),
    FOREIGN KEY (assignee) REFERENCES team_member(user_id),
    FOREIGN KEY (folder_id) REFERENCES folder(id),
    FOREIGN KEY (space_id) REFERENCES space(id)
);

CREATE TABLE accessible_custom_field (
    id text,
    list_id text,
    date_created text,
    hide_from_guests text,
    "name" text,
    "type" text,
    type_config jsonb,
    PRIMARY KEY (id, list_id),
    FOREIGN KEY (list_id) REFERENCES list(id)
);

CREATE TABLE space_priority (
    id text,
    space_id text,
    color text,
    order_index text,
    priority text,
    PRIMARY KEY (id),
    FOREIGN KEY (space_id) REFERENCES space(id)
);

CREATE TABLE space_status (
    id text,
    space_id text,
    color text,
    order_index text,
    "status" text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (space_id) REFERENCES space(id)
);

CREATE TABLE space (
    id text,
    team_id text,
    admin_can_manage text,
    archived text,
    avatar text,
    check_unresolved_checklists text,
    check_unresolved_comments text,
    check_unresolved_enabled text,
    check_unresolved_subtasks text,
    checklists_enabled text,
    color text,
    custom_fields_enabled text,
    custom_items_enabled text,
    dependency_warning_enabled text,
    due_date_enabled text,
    due_date_start_date text,
    milestones_enabled text,
    multiple_assignees text,
    multiple_assignees_enabled text,
    "name" text,
    points_enabled text,
    portfolios_enabled text,
    priorities_enabled text,
    private text,
    ramp_dependencies_enabled text,
    remap_closed_due_date text,
    remap_due_date text,
    sprints_enabled text,
    tags_enabled text,
    time_estimates_enabled text,
    time_tracking_enabled text,
    time_tracking_harvest text,
    time_tracking_rollup text,
    zoom_enabled text,
    PRIMARY KEY (id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE view_column_field (
    id text,
    view_id text,
    display text,
    field text,
    hidden text,
    "name" text,
    width text,
    PRIMARY KEY (id, view_id),
    FOREIGN KEY (view_id) REFERENCES "view"(id)
);

CREATE TABLE "view" (
    id text,
    creator_id text,
    team_id text,
    date_created text,
    date_protected text,
    divide_by_subcategory text,
    divide_collapsed jsonb,
    divide_dir text,
    divide_field text,
    filters_fields jsonb,
    filters_op text,
    filters_search text,
    filters_search_custom_fields text,
    filters_search_description text,
    filters_search_name text,
    filters_show_closed text,
    grouping_collapsed text,
    grouping_dir text,
    grouping_field text,
    grouping_ignores text,
    "name" text,
    order_index text,
    parent_id text,
    parent_type text,
    protected text,
    protected_by text,
    protected_note text,
    settings_auto_wrap text,
    settings_collapse_empty_columns text,
    settings_me_checklists text,
    settings_me_comments text,
    settings_me_subtasks text,
    settings_show_assignees text,
    settings_show_closed_subtasks text,
    settings_show_empty_statuses text,
    settings_show_images text,
    settings_show_subtask_parent_names text,
    settings_show_subtasks text,
    settings_show_task_locations text,
    settings_show_timer text,
    settings_time_in_status_view text,
    sorting_fields jsonb,
    team_sidebar_assigned_comments text,
    team_sidebar_assignees jsonb,
    team_sidebar_group_assignees jsonb,
    team_sidebar_unassigned_tasks text,
    "type" text,
    visibility text,
    -- custom_columns_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (creator_id) REFERENCES team_member(user_id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE member (
    id text,
    display_profile text,
    top_tier_user text,
    "type" text,
    verified_ambassador text,
    verified_consultant text,
    viewed_top_tier_user text,
    viewed_verified_ambassador text,
    viewed_verified_consultant text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES team_member(user_id)
);

CREATE TABLE goal_group_member (
    goal_id text,
    id text,
    PRIMARY KEY (goal_id, id),
    FOREIGN KEY (goal_id) REFERENCES goal(id),
    FOREIGN KEY (id) REFERENCES group_member(user_id)
);

CREATE TABLE goal_member (
    goal_id text,
    id text,
    is_creator text,
    PRIMARY KEY (goal_id, id),
    FOREIGN KEY (goal_id) REFERENCES goal(id),
    FOREIGN KEY (id) REFERENCES team_member(user_id)
);

CREATE TABLE goal_owner (
    goal_id text,
    id text,
    PRIMARY KEY (goal_id, id),
    FOREIGN KEY (goal_id) REFERENCES goal(id),
    FOREIGN KEY (id) REFERENCES team_member(user_id)
);

CREATE TABLE goal (
    id text,
    creator_id text,
    folder_id text,
    owner_id text,
    team_id text,
    archived text,
    color text,
    date_created text,
    date_updated text,
    description text,
    due_date text,
    editor_token text,
    key_result_count text,
    last_update text,
    multiple_owners text,
    "name" text,
    percent_completed text,
    pinned text,
    pretty_id text,
    private text,
    start_date text,
    ydoc text,
    PRIMARY KEY (id),
    FOREIGN KEY (creator_id) REFERENCES team_member(user_id),
    FOREIGN KEY (folder_id) REFERENCES folder(id),
    FOREIGN KEY (owner_id) REFERENCES team_member(user_id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE goal_folder_member (
    goal_folder_id text,
    id text,
    added_by text,
    date_added text,
    permission_level text,
    PRIMARY KEY (goal_folder_id, id),
    FOREIGN KEY (goal_folder_id) REFERENCES goal_folder(id),
    FOREIGN KEY (id) REFERENCES team_member(user_id),
    FOREIGN KEY (added_by) REFERENCES team_member(user_id)
);

CREATE TABLE goal_group_member_in_goal_folder (
    "index" text,
    goal_id text,
    id text,
    PRIMARY KEY ("index", goal_id),
    FOREIGN KEY (goal_id) REFERENCES goals_in_goal_folder(id),
    FOREIGN KEY (id) REFERENCES group_member(user_id)
);

CREATE TABLE goal_members_in_goal_folder (
    goal_id text,
    id text,
    is_creator text,
    permission_level text,
    PRIMARY KEY (goal_id, id),
    FOREIGN KEY (goal_id) REFERENCES goals_in_goal_folder(id),
    FOREIGN KEY (id) REFERENCES team_member(user_id)
);

CREATE TABLE goal_owners_in_goal_folder (
    goal_id text,
    id text,
    PRIMARY KEY (goal_id, id),
    FOREIGN KEY (goal_id) REFERENCES goals_in_goal_folder(id),
    FOREIGN KEY (id) REFERENCES team_member(user_id)
);

CREATE TABLE goals_in_goal_folder (
    id text,
    creator_id text,
    folder_id text,
    owner_id text,
    team_id text,
    archived text,
    color text,
    date_created text,
    date_updated text,
    description text,
    due_date text,
    editor_token text,
    key_result_count text,
    last_update text,
    multiple_owners text,
    "name" text,
    percent_completed text,
    pinned text,
    pretty_id text,
    private text,
    start_date text,
    ydoc text,
    PRIMARY KEY (id),
    FOREIGN KEY (creator_id) REFERENCES team_member(user_id),
    FOREIGN KEY (folder_id) REFERENCES folder(id),
    FOREIGN KEY (owner_id) REFERENCES team_member(user_id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE goal_folder (
    id text,
    creator_id text,
    team_id text,
    date_created text,
    goal_count text,
    "name" text,
    private text,
    PRIMARY KEY (id),
    FOREIGN KEY (creator_id) REFERENCES team_member(user_id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE custom_item (
    id text,
    team_id text,
    description text,
    "name" text,
    name_plural text,
    PRIMARY KEY (id, team_id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE sub_task_assignee (
    sub_task_id text,
    id text,
    PRIMARY KEY (sub_task_id, id),
    FOREIGN KEY (id) REFERENCES team_member(user_id)
);

CREATE TABLE sub_task (
    id text,
    creator_id text,
    custom_item_id text,
    folder_id text,
    list_id text,
    parent text,
    space_id text,
    team_id text,
    archived text,
    custom_fields jsonb,
    custom_id text,
    date_closed text,
    date_created text,
    date_done text,
    date_updated text,
    dependency jsonb,
    description text,
    due_date text,
    linked_task jsonb,
    "name" text,
    order_index text,
    point text,
    priority text,
    priority_color text,
    priority_id text,
    priority_order_index text,
    project_id text,
    start_date text,
    status_color text,
    status_order_index text,
    status_status text,
    status_type text,
    tags jsonb,
    text_content text,
    time_estimate text,
    time_spent text,
    url text,
    watcher jsonb,
    PRIMARY KEY (id),
    FOREIGN KEY (creator_id) REFERENCES team_member(user_id),
    FOREIGN KEY (custom_item_id) REFERENCES custom_item(id),
    FOREIGN KEY (folder_id) REFERENCES folder(id),
    FOREIGN KEY (list_id) REFERENCES list(id),
    FOREIGN KEY (parent) REFERENCES sub_task(id),
    FOREIGN KEY (space_id) REFERENCES space(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE users (
    id text,
    color text,
    email text,
    global_font_support text,
    initials text,
    profile_picture text,
    timezone text,
    username text,
    week_start_day text,
    PRIMARY KEY (id)
);

CREATE TABLE folder_list_status (
    id text,
    folder_list_id text,
    color text,
    order_index text,
    "status" text,
    "type" text,
    PRIMARY KEY (id, folder_list_id),
    FOREIGN KEY (folder_list_id) REFERENCES folder_list(id)
);

CREATE TABLE folder_list (
    id text,
    folder_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES list(id),
    FOREIGN KEY (folder_id) REFERENCES folder(id)
);

CREATE TABLE folder (
    id text,
    space_id text,
    archived text,
    hidden text,
    "name" text,
    order_index text,
    override_statuses text,
    permission_level text,
    space_access text,
    statuses jsonb,
    task_count text,
    PRIMARY KEY (id),
    FOREIGN KEY (space_id) REFERENCES space(id)
);

CREATE TABLE task_assignee (
    id text,
    task_id text,
    PRIMARY KEY (id, task_id),
    FOREIGN KEY (id) REFERENCES team_member(user_id),
    FOREIGN KEY (task_id) REFERENCES task(id)
);

CREATE TABLE task_dependency (
    depends_on text,
    task_id text,
    user_id text,
    date_created text,
    "type" text,
    workspace_id text,
    PRIMARY KEY (depends_on, task_id),
    FOREIGN KEY (depends_on) REFERENCES task(id),
    FOREIGN KEY (task_id) REFERENCES task(id),
    FOREIGN KEY (user_id) REFERENCES team_member(user_id)
);

CREATE TABLE task_watcher (
    id text,
    task_id text,
    PRIMARY KEY (id, task_id),
    FOREIGN KEY (id) REFERENCES team_member(user_id),
    FOREIGN KEY (task_id) REFERENCES task(id)
);

CREATE TABLE linked_task (
    id text,
    task_id text,
    user_id text,
    date_created text,
    workspace_id text,
    PRIMARY KEY (id, task_id),
    FOREIGN KEY (user_id) REFERENCES team_member(user_id)
);

CREATE TABLE task_checklist_item (
    id text,
    task_checklist_id text,
    task_id text,
    assignee_id text,
    children jsonb,
    date_created text,
    group_assignee text,
    "name" text,
    order_index text,
    parent text,
    resolved text,
    PRIMARY KEY (id, task_checklist_id, task_id),
    FOREIGN KEY (task_checklist_id) REFERENCES task_checklist(id),
    FOREIGN KEY (task_id) REFERENCES task_checklist(task_id),
    FOREIGN KEY (assignee_id) REFERENCES team_member(user_id)
);

CREATE TABLE task_checklist (
    id text,
    task_id text,
    creator text,
    date_created text,
    "name" text,
    order_index text,
    resolved text,
    unresolved text,
    PRIMARY KEY (id, task_id),
    FOREIGN KEY (task_id) REFERENCES task(id)
);

CREATE TABLE task_tag (
    _fivetran_id text,
    task_id text,
    creator text,
    "name" text,
    tag_bg text,
    tag_fg text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (task_id) REFERENCES task(id)
);

CREATE TABLE task (
    id text,
    creator_id text,
    custom_item_id text,
    folder_id text,
    list_id text,
    space_id text,
    team_id text,
    archived text,
    custom_fields jsonb,
    custom_id text,
    date_closed text,
    date_created text,
    date_done text,
    date_updated text,
    description text,
    due_date text,
    "name" text,
    order_index text,
    point text,
    priority text,
    priority_color text,
    priority_id text,
    priority_order_index text,
    project_id text,
    start_date text,
    status_color text,
    status_order_index text,
    status_status text,
    status_type text,
    text_content text,
    time_estimate text,
    time_spent text,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (creator_id) REFERENCES team_member(user_id),
    FOREIGN KEY (custom_item_id) REFERENCES custom_item(id),
    FOREIGN KEY (folder_id) REFERENCES folder(id),
    FOREIGN KEY (list_id) REFERENCES list(id),
    FOREIGN KEY (space_id) REFERENCES space(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE role_member (
    member_id text,
    role_id text,
    PRIMARY KEY (member_id, role_id),
    FOREIGN KEY (member_id) REFERENCES team_member(user_id),
    FOREIGN KEY (role_id) REFERENCES "role"(id)
);

CREATE TABLE "role" (
    id text,
    team_id text,
    date_created text,
    inherited_role text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE space_tag (
    _fivetran_id text,
    creator text,
    space_id text,
    "name" text,
    tag_bg text,
    tag_fg text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (creator) REFERENCES team_member(user_id),
    FOREIGN KEY (space_id) REFERENCES space(id)
);

CREATE TABLE task_template (
    id text,
    team_id text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE "comment" (
    id text,
    assigned_by_id text,
    assignee_id text,
    list_id text,
    task_id text,
    user_id text,
    view_id text,
    comment_text text,
    "date" text,
    reactions text,
    resolved text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (assigned_by_id) REFERENCES team_member(user_id),
    FOREIGN KEY (assignee_id) REFERENCES team_member(user_id),
    FOREIGN KEY (list_id) REFERENCES list(id),
    FOREIGN KEY (task_id) REFERENCES task(id),
    FOREIGN KEY (user_id) REFERENCES team_member(user_id),
    FOREIGN KEY (view_id) REFERENCES "view"(id)
);

CREATE TABLE view_task (
    task_id text,
    view_id text,
    PRIMARY KEY (task_id, view_id),
    FOREIGN KEY (task_id) REFERENCES sub_task(id),
    FOREIGN KEY (view_id) REFERENCES "view"(id)
);

CREATE TABLE group_member (
    group_id text,
    user_id text,
    PRIMARY KEY (group_id, user_id),
    FOREIGN KEY (group_id) REFERENCES groups(id),
    FOREIGN KEY (user_id) REFERENCES team_member(user_id)
);

CREATE TABLE groups (
    id text,
    team_id text,
    user_id text,
    avatar_attachment_id text,
    avatar_color text,
    avatar_icon text,
    avatar_source text,
    date_created text,
    handle text,
    initials text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (team_id) REFERENCES team(id),
    FOREIGN KEY (user_id) REFERENCES team_member(user_id)
);

CREATE TABLE team_member (
    user_id text,
    team_id text,
    invited_by_id text,
    color text,
    custom_role text,
    date_invited text,
    date_joined text,
    email text,
    initials text,
    last_active text,
    profile_picture text,
    "role" text,
    username text,
    PRIMARY KEY (user_id, team_id),
    FOREIGN KEY (team_id) REFERENCES team(id),
    FOREIGN KEY (invited_by_id) REFERENCES team_member(user_id)
);

CREATE TABLE team (
    id text,
    avatar text,
    color text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE time_entry_task_tag (
    _fivetran_id text,
    creator text,
    task_id text,
    "name" text,
    tag_bg text,
    tag_fg text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (creator) REFERENCES team_member(user_id),
    FOREIGN KEY (task_id) REFERENCES task(id)
);

CREATE TABLE time_entry (
    id text,
    folder_id text,
    list_id text,
    space_id text,
    task_id text,
    team_id text,
    user_id text,
    at_time text,
    billable text,
    description text,
    duration text,
    end_time text,
    "source" text,
    start_time text,
    tags jsonb,
    task_custom_id text,
    task_custom_type text,
    task_name text,
    task_status text,
    task_status_color text,
    task_status_order_index text,
    task_status_type text,
    task_url text,
    w_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (folder_id) REFERENCES folder(id),
    FOREIGN KEY (list_id) REFERENCES list(id),
    FOREIGN KEY (space_id) REFERENCES space(id),
    FOREIGN KEY (task_id) REFERENCES task(id),
    FOREIGN KEY (team_id) REFERENCES team(id),
    FOREIGN KEY (user_id) REFERENCES team_member(user_id)
);
