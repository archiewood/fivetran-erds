CREATE TABLE release_phase (
    id text,
    release_id text,
    created_at text,
    description_attachment jsonb,
    description_body text,
    description_created_at text,
    description_id text,
    duration_source text,
    end_on text,
    "name" text,
    progress text,
    progress_source text,
    start_on text,
    "type" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (release_id) REFERENCES "release"(id)
);

CREATE TABLE release_integration_field (
    id text,
    release_id text,
    created_at text,
    integration_id text,
    "name" text,
    service_name text,
    "value" text,
    PRIMARY KEY (id, release_id),
    FOREIGN KEY (release_id) REFERENCES "release"(id)
);

CREATE TABLE release_initiative (
    initiative_id text,
    release_id text,
    PRIMARY KEY (initiative_id, release_id),
    FOREIGN KEY (initiative_id) REFERENCES initiative(id),
    FOREIGN KEY (release_id) REFERENCES "release"(id)
);

CREATE TABLE release_goal (
    goal_id text,
    release_id text,
    PRIMARY KEY (goal_id, release_id),
    FOREIGN KEY (goal_id) REFERENCES goal(id),
    FOREIGN KEY (release_id) REFERENCES "release"(id)
);

CREATE TABLE release_custom_field_score_fact (
    id text,
    release_custom_field_id text,
    release_id text,
    "name" text,
    "value" text,
    PRIMARY KEY (id, release_custom_field_id, release_id),
    FOREIGN KEY (release_custom_field_id) REFERENCES release_custom_field(id),
    FOREIGN KEY (release_id) REFERENCES release_custom_field(release_id)
);

CREATE TABLE release_custom_field (
    id text,
    release_id text,
    attachments jsonb,
    body text,
    created_at text,
    email_value text,
    "key" text,
    "name" text,
    "type" text,
    updated_at text,
    "value" jsonb,
    PRIMARY KEY (id, release_id),
    FOREIGN KEY (release_id) REFERENCES "release"(id)
);

CREATE TABLE "release" (
    id text,
    owner_id text,
    parent_id text,
    product_id text,
    workflow_status_id text,
    comments_count text,
    created_at text,
    created_by_user_id text,
    development_started_on text,
    duration_source text,
    end_date text,
    external_date_resolution text,
    external_release_date text,
    external_release_date_description text,
    master_release text,
    "name" text,
    original_estimate text,
    parking_lot text,
    "position" text,
    progress text,
    progress_source text,
    project_created_at text,
    project_id text,
    project_name text,
    project_product_line text,
    project_reference_prefix text,
    project_workspace_type text,
    reference_num text,
    release_date text,
    released text,
    released_on text,
    remaining_estimate text,
    resource text,
    start_date text,
    status_changed_on text,
    theme_attachments jsonb,
    theme_body text,
    theme_created_at text,
    theme_id text,
    theme_updated_at text,
    updated_at text,
    url text,
    work_done text,
    work_units text,
    workflow_status_times jsonb,
    PRIMARY KEY (id),
    FOREIGN KEY (owner_id) REFERENCES users(id),
    FOREIGN KEY (parent_id) REFERENCES "release"(id),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (workflow_status_id) REFERENCES workflow_status(id)
);

CREATE TABLE strategic_model_component (
    id text,
    strategic_model_id text,
    description text,
    "name" text,
    PRIMARY KEY (id, strategic_model_id),
    FOREIGN KEY (strategic_model_id) REFERENCES strategic_model(id)
);

CREATE TABLE strategic_model (
    id text,
    kind text,
    "name" text,
    project_created_at text,
    project_id text,
    project_name text,
    project_product_line text,
    project_reference_prefix text,
    project_workspace_type text,
    resource text,
    url text,
    PRIMARY KEY (id)
);

CREATE TABLE persona (
    id text,
    product_id text,
    created_at text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE goal_parent (
    goal_id text,
    id text,
    "name" text,
    PRIMARY KEY (goal_id, id),
    FOREIGN KEY (goal_id) REFERENCES goal(id),
    FOREIGN KEY (id) REFERENCES goal(id)
);

CREATE TABLE goal_attachment (
    id text,
    goal_id text,
    content_type text,
    created_at text,
    download_url text,
    file_name text,
    file_size text,
    original_file_size text,
    updated_at text,
    PRIMARY KEY (id, goal_id),
    FOREIGN KEY (goal_id) REFERENCES goal(id)
);

CREATE TABLE goal_integration_field (
    id text,
    goal_id text,
    goal_initiative_id text,
    created_at text,
    integration_id text,
    "name" text,
    service_name text,
    "value" text,
    PRIMARY KEY (id, goal_id, goal_initiative_id),
    FOREIGN KEY (goal_id) REFERENCES goal(id),
    FOREIGN KEY (goal_initiative_id) REFERENCES goal_initiative(id)
);

CREATE TABLE goal_initiative (
    goal_id text,
    id text,
    PRIMARY KEY (goal_id, id),
    FOREIGN KEY (goal_id) REFERENCES goal(id),
    FOREIGN KEY (id) REFERENCES initiative(id)
);

CREATE TABLE goal_feature (
    goal_id text,
    id text,
    PRIMARY KEY (goal_id, id),
    FOREIGN KEY (goal_id) REFERENCES goal(id),
    FOREIGN KEY (id) REFERENCES feature(id)
);

CREATE TABLE goal_release (
    goal_id text,
    id text,
    PRIMARY KEY (goal_id, id),
    FOREIGN KEY (goal_id) REFERENCES goal(id),
    FOREIGN KEY (id) REFERENCES "release"(id)
);

CREATE TABLE goal_custom_field (
    id text,
    goal_id text,
    "key" text,
    "name" text,
    "type" text,
    updated_at text,
    "value" text,
    PRIMARY KEY (id, goal_id),
    FOREIGN KEY (goal_id) REFERENCES goal(id)
);

CREATE TABLE goal_workflow_status_time (
    status_id text,
    goal_id text,
    ended_at text,
    started_at text,
    status_name text,
    PRIMARY KEY (status_id, goal_id),
    FOREIGN KEY (goal_id) REFERENCES goal(id)
);

CREATE TABLE goal (
    id text,
    product_id text,
    success_metric_workflow_status_id text,
    comments_count text,
    created_at text,
    description_body text,
    description_created_at text,
    description_id text,
    effort text,
    "name" text,
    "position" text,
    progress text,
    progress_source text,
    project_created_at text,
    project_id text,
    project_name text,
    project_product_line text,
    project_reference_prefix text,
    project_workspace_type text,
    reference_num text,
    resource text,
    success_metric_description_attachment jsonb,
    success_metric_description_body text,
    success_metric_description_created_at text,
    success_metric_description_id text,
    success_metric_name text,
    updated_at text,
    url text,
    "value" text,
    PRIMARY KEY (id),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (success_metric_workflow_status_id) REFERENCES workflow_status(id)
);

CREATE TABLE workflow_status (
    id text,
    workflow_id text,
    color text,
    complete text,
    "name" text,
    "position" text,
    PRIMARY KEY (id, workflow_id),
    FOREIGN KEY (workflow_id) REFERENCES workflow(id)
);

CREATE TABLE workflow_kind (
    id text,
    workflow_id text,
    "name" text,
    PRIMARY KEY (id, workflow_id),
    FOREIGN KEY (workflow_id) REFERENCES workflow(id)
);

CREATE TABLE workflow (
    id text,
    product_id text,
    "name" text,
    statusable_type text,
    transitions_only text,
    PRIMARY KEY (id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE epic_custom_field_score_fact (
    id text,
    epic_custom_field_id text,
    epic_id text,
    "name" text,
    "value" text,
    PRIMARY KEY (id, epic_custom_field_id, epic_id),
    FOREIGN KEY (epic_custom_field_id) REFERENCES epic_custom_field(id),
    FOREIGN KEY (epic_id) REFERENCES epic_custom_field(epic_id)
);

CREATE TABLE epic_custom_field (
    id text,
    epic_id text,
    attachments jsonb,
    body text,
    created_at text,
    email_value text,
    "key" text,
    "name" text,
    "type" text,
    updated_at text,
    "value" text,
    PRIMARY KEY (id, epic_id),
    FOREIGN KEY (epic_id) REFERENCES epic(id)
);

CREATE TABLE epic_workflow_status_time (
    id text,
    epic_id text,
    ended_at text,
    started_at text,
    status_name text,
    PRIMARY KEY (id, epic_id),
    FOREIGN KEY (epic_id) REFERENCES epic(id)
);

CREATE TABLE epic (
    id text,
    created_by_user_id text,
    owner_id text,
    product_id text,
    release_id text,
    workflow_status_id text,
    assigned_to_user text,
    attachments jsonb,
    comments_count text,
    created_at text,
    description_attachments jsonb,
    description_body text,
    description_created_at text,
    description_id text,
    description_updated_at text,
    due_date text,
    duration_source text,
    epic_links jsonb,
    epic_only_original_estimate text,
    epic_only_remaining_estimate text,
    epic_only_work_done text,
    features jsonb,
    full_tags jsonb,
    goals jsonb,
    initial_estimate text,
    initiative_reference_num text,
    integration_fields jsonb,
    master_feature_only_original_estimate text,
    master_feature_only_remaining_estimate text,
    master_feature_only_work_done text,
    "name" text,
    original_estimate text,
    owner_created_at text,
    owner_email text,
    owner_name text,
    owner_updated_at text,
    "position" text,
    progress text,
    progress_source text,
    project_created_at text,
    project_id text,
    project_name text,
    project_product_line text,
    project_reference_prefix text,
    project_url text,
    project_workspace_type text,
    reference_num text,
    release_created_at text,
    release_integration_fields jsonb,
    release_name text,
    release_parking_lot text,
    release_product_id text,
    release_reference_num text,
    release_resource text,
    release_url text,
    remaining_estimate text,
    resource text,
    score text,
    score_facts jsonb,
    start_date text,
    status_changed_on text,
    tags jsonb,
    time_tracking_events jsonb,
    updated_at text,
    url text,
    use_feature_estimates text,
    work_done text,
    work_units text,
    workflow_status_color text,
    workflow_status_complete text,
    workflow_status_name text,
    workflow_status_position text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_user_id) REFERENCES users(id),
    FOREIGN KEY (owner_id) REFERENCES users(id),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (release_id) REFERENCES "release"(id),
    FOREIGN KEY (workflow_status_id) REFERENCES workflow_status(id)
);

CREATE TABLE record_link (
    id text,
    child_record_id text,
    feature_id text,
    parent_record_id text,
    child_record_created_at text,
    child_record_name text,
    child_record_product_id text,
    child_record_reference_num text,
    child_record_resource text,
    child_record_type text,
    child_record_url text,
    created_at text,
    link_type text,
    link_type_id text,
    parent text,
    parent_record_created_at text,
    parent_record_name text,
    parent_record_product_id text,
    parent_record_reference_num text,
    parent_record_resource text,
    parent_record_type text,
    parent_record_url text,
    PRIMARY KEY (id),
    FOREIGN KEY (child_record_id) REFERENCES record_link(id),
    FOREIGN KEY (feature_id) REFERENCES feature(id),
    FOREIGN KEY (parent_record_id) REFERENCES record_link(id)
);

CREATE TABLE user_product_role (
    product_id text,
    users_id text,
    product_name text,
    "role" text,
    role_description text,
    PRIMARY KEY (product_id, users_id),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE user_role (
    role_id text,
    users_id text,
    "name" text,
    scope_id text,
    scope_name text,
    scope_type text,
    PRIMARY KEY (role_id, users_id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    accessed_at text,
    administer_account text,
    administer_billing text,
    administer_configuration text,
    administrator text,
    created_at text,
    email text,
    enabled text,
    identity_provider_name text,
    identity_provider_type text,
    "name" text,
    paid_seat text,
    paid_seat_group_id text,
    paid_seat_group_name text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE task_assigned_to_user (
    id text,
    task_id text,
    user_id text,
    "status" text,
    PRIMARY KEY (id, task_id),
    FOREIGN KEY (task_id) REFERENCES task(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE task_attachment (
    id text,
    task_id text,
    content_type text,
    created_at text,
    download_url text,
    file_name text,
    file_size text,
    original_file_size text,
    updated_at text,
    PRIMARY KEY (id, task_id),
    FOREIGN KEY (task_id) REFERENCES task(id)
);

CREATE TABLE task (
    id text,
    created_by_user_id text,
    product_id text,
    body text,
    comments_count text,
    created_at text,
    due_date text,
    "name" text,
    "position" text,
    resource text,
    "status" text,
    taskable_id text,
    taskable_name text,
    taskable_reference_num text,
    taskable_resource text,
    taskable_type text,
    taskable_url text,
    updated_at text,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_user_id) REFERENCES users(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE strategic_vision_component (
    id text,
    strategic_vision_id text,
    "name" text,
    title text,
    PRIMARY KEY (id, strategic_vision_id),
    FOREIGN KEY (strategic_vision_id) REFERENCES strategic_vision(id)
);

CREATE TABLE strategic_vision (
    id text,
    created_at text,
    description text,
    "name" text,
    project_created_at text,
    project_id text,
    project_name text,
    project_product_line text,
    project_reference_prefix text,
    project_workspace_type text,
    resource text,
    updated_at text,
    url text,
    PRIMARY KEY (id)
);

CREATE TABLE integration (
    id text,
    created_at text,
    "name" text,
    service_name text,
    PRIMARY KEY (id)
);

CREATE TABLE idea_custom_field (
    id text,
    idea_id text,
    attachments text,
    body text,
    created_at text,
    editor_version text,
    email_value text,
    "key" text,
    "name" text,
    "type" text,
    updated_at text,
    "value" text,
    PRIMARY KEY (id, idea_id),
    FOREIGN KEY (idea_id) REFERENCES idea(id)
);

CREATE TABLE idea_workflow_status_time (
    status_id text,
    idea_id text,
    ended_at text,
    started_at text,
    status_name text,
    PRIMARY KEY (status_id, idea_id),
    FOREIGN KEY (idea_id) REFERENCES idea(id)
);

CREATE TABLE idea (
    id text,
    created_by_user_id text,
    product_id text,
    workflow_status_id text,
    assigned_to_user text,
    categories jsonb,
    created_at text,
    created_by_user_created_at text,
    created_by_user_email text,
    created_by_user_name text,
    created_by_user_updated_at text,
    description_attachments jsonb,
    description_body text,
    description_created_at text,
    description_editor_version text,
    description_id text,
    description_notable_id text,
    description_notable_type text,
    description_updated_at text,
    endorsements_count text,
    full_tags jsonb,
    initial_votes text,
    integration_fields jsonb,
    "name" text,
    reference_num text,
    resource text,
    score text,
    score_facts jsonb,
    status_changed_at text,
    tags jsonb,
    updated_at text,
    url text,
    visibility text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_user_id) REFERENCES users(id),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (workflow_status_id) REFERENCES workflow_status(id)
);

CREATE TABLE idea_user_organizations (
    "index" text,
    idea_user_id text,
    id text,
    PRIMARY KEY ("index", idea_user_id),
    FOREIGN KEY (idea_user_id) REFERENCES idea_user(id),
    FOREIGN KEY (id) REFERENCES idea_organization(id)
);

CREATE TABLE idea_user (
    id text,
    created_at text,
    custom_fields jsonb,
    discovery_interview_count text,
    discovery_last_interview text,
    discovery_last_invite text,
    discovery_next_interview text,
    email text,
    integration_fields jsonb,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE strategic_component (
    id text,
    strategic_position_id text,
    description text,
    "name" text,
    PRIMARY KEY (id, strategic_position_id),
    FOREIGN KEY (strategic_position_id) REFERENCES strategic_position(id)
);

CREATE TABLE strategic_position (
    id text,
    kind text,
    "name" text,
    project_created_at text,
    project_id text,
    project_name text,
    project_product_line text,
    project_reference_prefix text,
    project_workspace_type text,
    resource text,
    url text,
    PRIMARY KEY (id)
);

CREATE TABLE idea_subscription (
    id text,
    idea_id text,
    workflow_status_id text,
    created_at text,
    description_attachments jsonb,
    description_body text,
    description_created_at text,
    description_editor_version text,
    description_id text,
    description_notable_id text,
    description_notable_type text,
    description_updated_at text,
    portal_user_created_at text,
    portal_user_email text,
    portal_user_id text,
    portal_user_name text,
    PRIMARY KEY (id),
    FOREIGN KEY (idea_id) REFERENCES idea(id),
    FOREIGN KEY (workflow_status_id) REFERENCES workflow_status(id)
);

CREATE TABLE feature_custom_field (
    id text,
    feature_id text,
    "key" text,
    "name" text,
    "type" text,
    updated_at text,
    "value" text,
    PRIMARY KEY (id, feature_id),
    FOREIGN KEY (feature_id) REFERENCES feature(id)
);

CREATE TABLE feature (
    id text,
    product_id text,
    release_id text,
    workflow_id text,
    created_at text,
    created_by_user_id text,
    description_attachment jsonb,
    description_body text,
    description_created_at text,
    description_id text,
    description_updated_at text,
    due_date text,
    epic_reference_num text,
    feature_only_original_estimate text,
    feature_only_remaining_estimate text,
    feature_only_work_done text,
    goal_id text,
    initial_estimate text,
    initiative_id text,
    initiative_reference_num text,
    "name" text,
    original_estimate text,
    "position" text,
    progress text,
    progress_source text,
    reference_num text,
    release_reference_num text,
    remaining_estimate text,
    requirement_id text,
    resource text,
    score text,
    start_date text,
    status_changed_on text,
    updated_at text,
    url text,
    use_requirements_estimates text,
    work_done text,
    work_units text,
    PRIMARY KEY (id),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (release_id) REFERENCES "release"(id),
    FOREIGN KEY (workflow_id) REFERENCES workflow(id)
);

CREATE TABLE release_feature (
    feature_id text,
    product_id text,
    release_id text,
    PRIMARY KEY (feature_id),
    FOREIGN KEY (feature_id) REFERENCES feature(id),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (release_id) REFERENCES "release"(id)
);

CREATE TABLE competitor (
    id text,
    product_id text,
    created_at text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE idea_comment (
    id text,
    idea_commenter_idea_user_id text,
    idea_commenter_user_id text,
    idea_id text,
    workflow_status_id text,
    attachments jsonb,
    body text,
    created_at text,
    description_attachments jsonb,
    description_body text,
    description_created_at text,
    description_editor_version text,
    description_id text,
    description_updated_at text,
    idea_commenter_portal_user_created_at text,
    idea_commenter_portal_user_email text,
    idea_commenter_portal_user_id text,
    idea_commenter_portal_user_name text,
    parent_idea_comment_id text,
    visibility text,
    PRIMARY KEY (id),
    FOREIGN KEY (idea_commenter_idea_user_id) REFERENCES idea_user(id),
    FOREIGN KEY (idea_commenter_user_id) REFERENCES users(id),
    FOREIGN KEY (idea_id) REFERENCES idea(id),
    FOREIGN KEY (workflow_status_id) REFERENCES workflow_status(id)
);

CREATE TABLE idea_category (
    id text,
    product_id text,
    created_at text,
    "name" text,
    parent_id text,
    project_id text,
    PRIMARY KEY (id, product_id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE idea_organization (
    id text,
    created_by_user_id text,
    created_at text,
    custom_fields jsonb,
    description_attachments jsonb,
    description_body text,
    description_created_at text,
    description_editor_version text,
    description_id text,
    description_notable_id text,
    description_notable_type text,
    description_updated_at text,
    email_domains text,
    endorsements_count text,
    integration_fields jsonb,
    "name" text,
    reference_num text,
    revenue text,
    updated_at text,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_user_id) REFERENCES users(id)
);

CREATE TABLE creative_brief (
    id text,
    product_id text,
    created_at text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE product (
    id text,
    parent_id text,
    capacity_planning_enabled text,
    children jsonb,
    created_at text,
    default_capacity_units text,
    description_attachments jsonb,
    description_body text,
    description_created_at text,
    description_id text,
    description_updated_at text,
    enhanced_capacity_planning_enabled text,
    has_epics text,
    has_ideas text,
    has_master_features text,
    "name" text,
    product_line text,
    product_line_type text,
    reference_prefix text,
    resource text,
    updated_at text,
    url text,
    workspace_type text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (parent_id) REFERENCES product(id)
);

CREATE TABLE initiative_custom_field_score_fact (
    id text,
    initiative_custom_field_id text,
    initiative_id text,
    "name" text,
    "value" text,
    PRIMARY KEY (id, initiative_custom_field_id, initiative_id),
    FOREIGN KEY (initiative_custom_field_id) REFERENCES initiative_custom_field(id),
    FOREIGN KEY (initiative_id) REFERENCES initiative_custom_field(initiative_id)
);

CREATE TABLE initiative_custom_field (
    id text,
    initiative_id text,
    attachments jsonb,
    body text,
    created_at text,
    email_value text,
    "key" text,
    "name" text,
    "type" text,
    updated_at text,
    "value" jsonb,
    PRIMARY KEY (id, initiative_id),
    FOREIGN KEY (initiative_id) REFERENCES initiative(id)
);

CREATE TABLE initiative_epic (
    epic_id text,
    initiative_id text,
    PRIMARY KEY (epic_id, initiative_id),
    FOREIGN KEY (epic_id) REFERENCES epic(id),
    FOREIGN KEY (initiative_id) REFERENCES initiative(id)
);

CREATE TABLE attachment (
    id text,
    initiative_id text,
    content_type text,
    created_at text,
    download_url text,
    file_name text,
    file_size text,
    original_file_size text,
    updated_at text,
    PRIMARY KEY (id, initiative_id),
    FOREIGN KEY (initiative_id) REFERENCES initiative(id)
);

CREATE TABLE master_feature (
    id text,
    initiative_id text,
    PRIMARY KEY (id, initiative_id),
    FOREIGN KEY (initiative_id) REFERENCES initiative(id)
);

CREATE TABLE initiative_feature (
    id text,
    initiative_id text,
    product_id text,
    created_at text,
    "name" text,
    reference_num text,
    resource text,
    url text,
    PRIMARY KEY (id, initiative_id),
    FOREIGN KEY (initiative_id) REFERENCES initiative(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE workflow_status_time (
    initiative_id text,
    status_id text,
    ended_at text,
    started_at text,
    status_name text,
    PRIMARY KEY (initiative_id, status_id),
    FOREIGN KEY (initiative_id) REFERENCES initiative(id),
    FOREIGN KEY (status_id) REFERENCES workflow_status(id)
);

CREATE TABLE initiative_integration_field (
    id text,
    initiative_id text,
    created_at text,
    integration_id text,
    "name" text,
    service_name text,
    "value" text,
    PRIMARY KEY (id, initiative_id),
    FOREIGN KEY (id) REFERENCES integration(id),
    FOREIGN KEY (initiative_id) REFERENCES initiative(id)
);

CREATE TABLE initiative (
    id text,
    assigned_to_user_id text,
    created_by_user_id text,
    product_id text,
    workflow_status_id text,
    attachment jsonb,
    color text,
    comments_count text,
    created_at text,
    description_body text,
    description_created_at text,
    description_id text,
    duration_source text,
    effort text,
    end_date text,
    initial_estimate text,
    "name" text,
    original_estimate text,
    "position" text,
    presented text,
    progress text,
    progress_source text,
    project_created_at text,
    project_id text,
    project_name text,
    project_product_line text,
    project_reference_prefix text,
    project_workspace_type text,
    reference_num text,
    remaining_estimate text,
    resource text,
    score text,
    score_facts jsonb,
    start_date text,
    "status" text,
    time_frame_id text,
    time_frame_name text,
    time_tracking_events jsonb,
    updated_at text,
    url text,
    "value" text,
    work_done text,
    work_units text,
    PRIMARY KEY (id),
    FOREIGN KEY (assigned_to_user_id) REFERENCES users(id),
    FOREIGN KEY (created_by_user_id) REFERENCES users(id),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (workflow_status_id) REFERENCES workflow_status(id)
);

CREATE TABLE idea_vote (
    id text,
    endorsed_by_idea_user_id text,
    idea_id text,
    idea_organization_id text,
    workflow_status_id text,
    created_at text,
    custom_fields jsonb,
    description_attachments text,
    description_body text,
    description_created_at text,
    description_editor_version text,
    description_id text,
    description_notable_id text,
    description_notable_type text,
    description_updated_at text,
    endorsed_by_portal_user_created_at text,
    endorsed_by_portal_user_email text,
    endorsed_by_portal_user_id text,
    endorsed_by_portal_user_name text,
    endorsed_by_portal_user_updated_at text,
    idea_organization_id_id text,
    integration_fields jsonb,
    link text,
    updated_at text,
    "value" text,
    weight text,
    PRIMARY KEY (id),
    FOREIGN KEY (endorsed_by_idea_user_id) REFERENCES idea_user(id),
    FOREIGN KEY (idea_id) REFERENCES idea(id),
    FOREIGN KEY (idea_organization_id) REFERENCES idea_organization(id),
    FOREIGN KEY (workflow_status_id) REFERENCES workflow_status(id)
);

CREATE TABLE release_epic (
    epic_id text,
    release_id text,
    PRIMARY KEY (epic_id),
    FOREIGN KEY (epic_id) REFERENCES epic(id),
    FOREIGN KEY (release_id) REFERENCES "release"(id)
);

CREATE TABLE requirement_custom_field (
    id text,
    requirement_id text,
    "key" text,
    "name" text,
    "type" text,
    updated_at text,
    "value" text,
    PRIMARY KEY (id, requirement_id),
    FOREIGN KEY (requirement_id) REFERENCES requirement(id)
);

CREATE TABLE requirement_integration_field (
    id text,
    requirement_id text,
    created_at text,
    integration_id text,
    "name" text,
    service_name text,
    "value" text,
    PRIMARY KEY (id, requirement_id),
    FOREIGN KEY (id) REFERENCES integration(id),
    FOREIGN KEY (requirement_id) REFERENCES requirement(id)
);

CREATE TABLE requirement (
    id text,
    assigned_to_user_id text,
    created_by_user_id text,
    feature_id text,
    release_id text,
    workflow_status_id text,
    attachment jsonb,
    comments_count text,
    created_at text,
    description_attachment jsonb,
    description_body text,
    description_created_at text,
    description_id text,
    full_tags jsonb,
    "name" text,
    "position" text,
    reference_num text,
    resource text,
    tags jsonb,
    updated_at text,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (assigned_to_user_id) REFERENCES users(id),
    FOREIGN KEY (created_by_user_id) REFERENCES users(id),
    FOREIGN KEY (feature_id) REFERENCES feature(id),
    FOREIGN KEY (release_id) REFERENCES "release"(id),
    FOREIGN KEY (workflow_status_id) REFERENCES workflow_status(id)
);

CREATE TABLE team (
    id text,
    automatically_calculate_team_members_count text,
    capacity text,
    color text,
    custom_fieldo jsonb,
    end_date text,
    hourly_rate text,
    "name" text,
    project_id text,
    project_name text,
    project_product_line text,
    project_reference_prefix text,
    project_workspace_type text,
    schedule_hours_per_day text,
    schedule_id text,
    schedule_name text,
    schedule_story_points_per_day text,
    schedule_velocity text,
    start_date text,
    team_members_count text,
    team_members_email text,
    team_members_id text,
    team_members_name text,
    team_members_user_id text,
    team_members_virtual text,
    PRIMARY KEY (id)
);
