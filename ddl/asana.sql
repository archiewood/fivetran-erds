CREATE TABLE custom_field (
    id text,
    portfolio_id text,
    project_id text,
    workspace_id text,
    description text,
    "name" text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (portfolio_id) REFERENCES portfolio(id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id)
);

CREATE TABLE task (
    id text,
    assignee_id text,
    completed_by_id text,
    created_by_id text,
    parent_id text,
    workspace_id text,
    actual_time_minutes integer,
    completed boolean,
    completed_at timestamp,
    created_at timestamp,
    due_at timestamp,
    due_on timestamp,
    liked boolean,
    modified_at timestamp,
    "name" text,
    notes text,
    num_likes integer,
    resource_subtype text,
    start_on timestamp,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (assignee_id) REFERENCES "user"(id),
    FOREIGN KEY (completed_by_id) REFERENCES "user"(id),
    FOREIGN KEY (created_by_id) REFERENCES "user"(id),
    FOREIGN KEY (parent_id) REFERENCES task(id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id)
);

CREATE TABLE project (
    id text,
    owner_id text,
    team_id text,
    workspace_id text,
    archived boolean,
    color text,
    created_at timestamp,
    current_status text,
    current_status_color text,
    due_date timestamp,
    modified_at timestamp,
    "name" text,
    notes text,
    public boolean,
    start_on timestamp,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (owner_id) REFERENCES "user"(id),
    FOREIGN KEY (team_id) REFERENCES team(id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id)
);

CREATE TABLE "user" (
    id text,
    email text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE attachment (
    id text,
    parent_id text,
    created_at timestamp,
    download_url text,
    host text,
    "name" text,
    view_url text,
    PRIMARY KEY (id),
    FOREIGN KEY (parent_id) REFERENCES task(id)
);

CREATE TABLE tag (
    id text,
    workspace_id text,
    color text,
    created_at timestamp,
    message text,
    "name" text,
    notes text,
    PRIMARY KEY (id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id)
);

CREATE TABLE portfolio_member (
    portfolio_id text,
    user_id text,
    PRIMARY KEY (portfolio_id, user_id),
    FOREIGN KEY (portfolio_id) REFERENCES portfolio(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE goal_follower (
    goal_id text,
    user_id text,
    PRIMARY KEY (goal_id, user_id),
    FOREIGN KEY (goal_id) REFERENCES goal(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE story (
    id text,
    created_by_id text,
    target_id text,
    created_at timestamp,
    hearted boolean,
    num_hearts integer,
    "source" text,
    text text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_id) REFERENCES "user"(id),
    FOREIGN KEY (target_id) REFERENCES task(id)
);

CREATE TABLE "section" (
    id text,
    project_id text,
    created_at timestamp,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE task_follower (
    task_id text,
    user_id text,
    PRIMARY KEY (task_id, user_id),
    FOREIGN KEY (task_id) REFERENCES task(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE team (
    id text,
    organization_id text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE time_tracking (
    id text,
    task_id text,
    created_by_id text,
    created_at timestamp,
    duration_minutes double precision,
    entered_on timestamp,
    PRIMARY KEY (id, task_id),
    FOREIGN KEY (task_id) REFERENCES task(id),
    FOREIGN KEY (created_by_id) REFERENCES "user"(id)
);

CREATE TABLE goal_status (
    id text,
    created_by_id text,
    goal_id text,
    created_at timestamp,
    modified_at timestamp,
    status_type text,
    text text,
    title text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_id) REFERENCES "user"(id),
    FOREIGN KEY (goal_id) REFERENCES goal(id)
);

CREATE TABLE project_task (
    project_id text,
    task_id text,
    PRIMARY KEY (project_id, task_id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (task_id) REFERENCES task(id)
);

CREATE TABLE task_tag (
    tag_id text,
    task_id text,
    PRIMARY KEY (tag_id, task_id),
    FOREIGN KEY (tag_id) REFERENCES tag(id),
    FOREIGN KEY (task_id) REFERENCES task(id)
);

CREATE TABLE story_heart (
    story_id text,
    user_id text,
    PRIMARY KEY (story_id, user_id),
    FOREIGN KEY (story_id) REFERENCES story(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE tag_follower (
    tag_id text,
    user_id text,
    PRIMARY KEY (tag_id, user_id),
    FOREIGN KEY (tag_id) REFERENCES tag(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE project_status (
    id text,
    author_id text,
    created_by_id text,
    project_id text,
    color text,
    created_at timestamp,
    modified_at timestamp,
    text text,
    title text,
    PRIMARY KEY (id),
    FOREIGN KEY (author_id) REFERENCES "user"(id),
    FOREIGN KEY (created_by_id) REFERENCES "user"(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE goal_relationship (
    id text,
    goal_id text,
    contribution_weight double precision,
    resource_subtype text,
    supporting_resource_gid text,
    supporting_resource_name text,
    supporting_resource_resource_type text,
    PRIMARY KEY (id, goal_id),
    FOREIGN KEY (goal_id) REFERENCES goal(id)
);

CREATE TABLE portfolio_item (
    id text,
    portfolio_id text,
    resource_type text,
    PRIMARY KEY (id, portfolio_id),
    FOREIGN KEY (portfolio_id) REFERENCES portfolio(id)
);

CREATE TABLE goal (
    id text,
    owner_id text,
    team_id text,
    workspace_id text,
    due_on timestamp,
    liked boolean,
    "name" text,
    notes text,
    num_likes integer,
    start_on timestamp,
    "status" text,
    -- metric_* (dynamic column),
    -- time_period_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (owner_id) REFERENCES "user"(id),
    FOREIGN KEY (team_id) REFERENCES team(id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id)
);

CREATE TABLE workspace (
    id text,
    is_organization boolean,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE organization (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE task_section (
    section_id text,
    task_id text,
    PRIMARY KEY (section_id, task_id),
    FOREIGN KEY (section_id) REFERENCES "section"(id),
    FOREIGN KEY (task_id) REFERENCES task(id)
);

CREATE TABLE portfolio (
    id text,
    created_by_id text,
    owner_id text,
    workspace_id text,
    color text,
    created_at timestamp,
    due_on timestamp,
    "name" text,
    start_on timestamp,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_id) REFERENCES "user"(id),
    FOREIGN KEY (owner_id) REFERENCES "user"(id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id)
);
