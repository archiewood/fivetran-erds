CREATE TABLE path_tag (
    id bigint,
    path_id bigint,
    "name" text,
    resource_type text,
    PRIMARY KEY (id, path_id),
    FOREIGN KEY (id) REFERENCES tags(id),
    FOREIGN KEY (path_id) REFERENCES "path"(id)
);

CREATE TABLE content_in_path_content (
    id bigint,
    path_content_id bigint,
    path_id bigint,
    amount text,
    archived_at text,
    archived_by_user_id text,
    "condition" text,
    description text,
    effect text,
    resource_type text,
    title text,
    unit text,
    PRIMARY KEY (id, path_content_id, path_id),
    FOREIGN KEY (path_content_id) REFERENCES path_content(id),
    FOREIGN KEY (path_id) REFERENCES "path"(id)
);

CREATE TABLE path_content (
    id bigint,
    path_id bigint,
    amount text,
    archived_at text,
    archived_by_user_id text,
    "condition" text,
    description text,
    effect text,
    resource_type text,
    title text,
    unit text,
    PRIMARY KEY (id, path_id),
    FOREIGN KEY (id) REFERENCES lesson(id),
    FOREIGN KEY (path_id) REFERENCES "path"(id)
);

CREATE TABLE "path" (
    id bigint,
    archived_at text,
    archived_by_user_id text,
    created_at timestamp,
    is_certification boolean,
    last_updated_at timestamp,
    links_overview text,
    links_shareable text,
    public boolean,
    published_at timestamp,
    publisher_id bigint,
    resource_type text,
    title text,
    PRIMARY KEY (id)
);

CREATE TABLE group_member (
    group_id bigint,
    id bigint,
    should_receive_email boolean,
    PRIMARY KEY (group_id, id),
    FOREIGN KEY (group_id) REFERENCES group_detail(group_id),
    FOREIGN KEY (id) REFERENCES users(id)
);

CREATE TABLE group_manager (
    group_id bigint,
    id bigint,
    PRIMARY KEY (group_id, id),
    FOREIGN KEY (group_id) REFERENCES group_detail(group_id),
    FOREIGN KEY (id) REFERENCES users(id)
);

CREATE TABLE group_detail (
    group_id bigint,
    resource_type text,
    "type" text,
    PRIMARY KEY (group_id),
    FOREIGN KEY (group_id) REFERENCES groups(id)
);

CREATE TABLE groups (
    id bigint,
    archived_at text,
    archived_by_user_id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE group_assignment (
    group_id bigint,
    id bigint,
    assignable_id bigint,
    assignable_type text,
    PRIMARY KEY (group_id, id),
    FOREIGN KEY (group_id) REFERENCES groups(id),
    FOREIGN KEY (id) REFERENCES assignment(id)
);

CREATE TABLE path_assignment (
    id bigint,
    path_id bigint,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES assignment(id),
    FOREIGN KEY (path_id) REFERENCES "path"(id)
);

CREATE TABLE user_learning_library (
    _fivetran_id text,
    users_id bigint,
    total_completed bigint,
    total_views bigint,
    unique_learning_content_views bigint,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE user_assignment (
    id text,
    users_id bigint,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES assignment(id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE assignment_content (
    id bigint,
    assignment_id bigint,
    completed_at timestamp,
    resource_type text,
    score bigint,
    started_at timestamp,
    "status" text,
    PRIMARY KEY (id, assignment_id),
    FOREIGN KEY (assignment_id) REFERENCES assignment(id)
);

CREATE TABLE assignment (
    id bigint,
    assignee_id bigint,
    assignable_id bigint,
    assignable_type text,
    assigned_at timestamp,
    completed_at timestamp,
    due_by timestamp,
    ext_uid text,
    is_certification boolean,
    reassigned_at timestamp,
    resource_type text,
    score bigint,
    started_at timestamp,
    "status" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (assignee_id) REFERENCES users(id)
);

CREATE TABLE lesson_assignment (
    id bigint,
    lesson_id bigint,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES assignment(id),
    FOREIGN KEY (lesson_id) REFERENCES lesson(id)
);

CREATE TABLE lesson_tag (
    id bigint,
    lesson_id bigint,
    PRIMARY KEY (id, lesson_id),
    FOREIGN KEY (id) REFERENCES tags(id),
    FOREIGN KEY (lesson_id) REFERENCES lesson(id)
);

CREATE TABLE lesson (
    id bigint,
    archived_at text,
    archived_by_user_id text,
    created_at timestamp,
    last_updated_at timestamp,
    links_overview text,
    links_shareable text,
    public boolean,
    resource_type text,
    retake_score bigint,
    title text,
    PRIMARY KEY (id)
);

CREATE TABLE lesson_completion_breakdown (
    _fivetran_id text,
    lesson_id bigint,
    total bigint,
    "type" text,
    via_assignment bigint,
    via_other bigint,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (lesson_id) REFERENCES lesson(id)
);

CREATE TABLE custom_user_field_data (
    "index" text,
    user_id bigint,
    custom_user_field_id bigint,
    id bigint,
    "name" text,
    "value" text,
    PRIMARY KEY ("index", user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users (
    id bigint,
    archived_at text,
    archived_by_user_id text,
    business_unit text,
    department text,
    email text,
    ext_uid text,
    hire_date text,
    job_title text,
    locale text,
    location text,
    manager_name text,
    mobile_phone_number text,
    "name" text,
    resource_type text,
    "role" text,
    role_id bigint,
    PRIMARY KEY (id)
);

CREATE TABLE tags (
    id bigint,
    "name" text,
    resource_type text,
    PRIMARY KEY (id)
);
