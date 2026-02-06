CREATE TABLE user_group (
    id text,
    project_id text,
    description text,
    "name" text,
    "type" text,
    uid text,
    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE attachment (
    id text,
    created_by text,
    modified_by text,
    parent_item_id text,
    parent_project_id text,
    project_id text,
    attachment_id text,
    created_date text,
    description text,
    document_key text,
    file_name text,
    file_size text,
    global_id text,
    item_type text,
    last_activity_date text,
    last_locked_date text,
    locked text,
    locked_by text,
    mime_type text,
    modified_date text,
    "name" text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (modified_by) REFERENCES users(id),
    FOREIGN KEY (parent_item_id) REFERENCES item(id),
    FOREIGN KEY (parent_project_id) REFERENCES project(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE test_cycle (
    id text,
    attachment_id text,
    created_by text,
    modified_by text,
    parent_item_id text,
    parent_project_id text,
    project_id text,
    created_date text,
    description text,
    document_key text,
    global_id text,
    item_type text,
    last_activity_date text,
    modified_date text,
    "name" text,
    "status" text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (attachment_id) REFERENCES attachment(id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (modified_by) REFERENCES users(id),
    FOREIGN KEY (parent_item_id) REFERENCES item(id),
    FOREIGN KEY (parent_project_id) REFERENCES project(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE item (
    id text,
    created_by text,
    modified_by text,
    parent_item_id text,
    parent_project_id text,
    project_id text,
    child_item_type text,
    created_date text,
    description text,
    document_key text,
    global_id text,
    global_sort_order text,
    item_type text,
    last_activity_date text,
    last_locked_date text,
    locked text,
    locked_by text,
    modified_date text,
    "name" text,
    "sequence" text,
    sort_order text,
    "status" text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (modified_by) REFERENCES users(id),
    FOREIGN KEY (parent_item_id) REFERENCES item(id),
    FOREIGN KEY (parent_project_id) REFERENCES project(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE "comment" (
    id text,
    created_by text,
    item_id text,
    modified_by text,
    project_id text,
    body_text text,
    comment_type text,
    created_date text,
    deleted text,
    in_reply_to text,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (item_id) REFERENCES item(id),
    FOREIGN KEY (modified_by) REFERENCES users(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE category (
    path_id text,
    "name" text,
    "path" text,
    PRIMARY KEY (path_id)
);

CREATE TABLE item_type_widget (
    "index" text,
    item_type_id text,
    "name" text,
    synchronize text,
    PRIMARY KEY ("index", item_type_id),
    FOREIGN KEY (item_type_id) REFERENCES item_type(id)
);

CREATE TABLE item_type_field (
    id text,
    item_type_id text,
    parent_item_type_id text,
    picklist_id text,
    control_style text,
    field_type text,
    infotip text,
    label text,
    "name" text,
    pick_list_id text,
    read_only text,
    read_only_allow_overwrite text,
    required text,
    synchronize text,
    text_type text,
    trigger_suspect text,
    PRIMARY KEY (id, item_type_id),
    FOREIGN KEY (item_type_id) REFERENCES item_type(id),
    FOREIGN KEY (parent_item_type_id) REFERENCES item_type(id),
    FOREIGN KEY (picklist_id) REFERENCES picklist(id)
);

CREATE TABLE item_type (
    id text,
    category text,
    description text,
    display text,
    display_plural text,
    image text,
    is_system text,
    type_key text,
    PRIMARY KEY (id)
);

CREATE TABLE relationship_set_mapped_project (
    project_id text,
    relationship_set_id text,
    active text,
    "name" text,
    PRIMARY KEY (project_id, relationship_set_id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (relationship_set_id) REFERENCES relationship_set(id)
);

CREATE TABLE relationship_set_rule (
    id text,
    relationship_set_id text,
    from_item_type_id text,
    relationship_type_id text,
    to_item_type_id text,
    for_coverage text,
    PRIMARY KEY (id, relationship_set_id),
    FOREIGN KEY (relationship_set_id) REFERENCES relationship_set(id),
    FOREIGN KEY (from_item_type_id) REFERENCES item_type(id),
    FOREIGN KEY (relationship_type_id) REFERENCES relationship_type(id),
    FOREIGN KEY (to_item_type_id) REFERENCES item_type(id)
);

CREATE TABLE relationship_set (
    id text,
    is_exclusive text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE picklist (
    id text,
    description text,
    "name" text,
    picklist_type text,
    PRIMARY KEY (id)
);

CREATE TABLE test_run_baselined_applied_category_snapshot (
    "index" text,
    test_run_id text,
    category_path_sequence text,
    item_version_number_applied text,
    PRIMARY KEY ("index", test_run_id),
    FOREIGN KEY (test_run_id) REFERENCES test_run(id)
);

CREATE TABLE test_run_group (
    "index" text,
    test_run_id text,
    groups text,
    PRIMARY KEY ("index", test_run_id),
    FOREIGN KEY (test_run_id) REFERENCES test_run(id)
);

CREATE TABLE test_run (
    id text,
    created_by text,
    item_type_id text,
    modified_by text,
    project_id text,
    created_date text,
    document_key text,
    fields_key text,
    global_id text,
    last_activity_date text,
    modified_date text,
    sort_order_from_test_group text,
    test_case_version_number text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (item_type_id) REFERENCES item_type(id),
    FOREIGN KEY (modified_by) REFERENCES users(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE project (
    id text,
    created_by text,
    modified_by text,
    parent_id text,
    project_manager_id text,
    created_date text,
    description text,
    is_folder text,
    modified_date text,
    "name" text,
    project_group text,
    project_key text,
    status_id text,
    text_1 text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (modified_by) REFERENCES users(id),
    FOREIGN KEY (parent_id) REFERENCES project(id),
    FOREIGN KEY (project_manager_id) REFERENCES users(id)
);

CREATE TABLE picklist_option (
    id text,
    picklist_id text,
    active text,
    archived text,
    color text,
    defaults text,
    description text,
    info_tip text,
    "name" text,
    sort_order text,
    "value" text,
    PRIMARY KEY (id),
    FOREIGN KEY (picklist_id) REFERENCES picklist(id)
);

CREATE TABLE "release" (
    id text,
    project_id text,
    active text,
    archived text,
    "date" text,
    deleted text,
    description text,
    item_count text,
    "name" text,
    "type" text,
    PRIMARY KEY (id, project_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE base_line (
    id text,
    project_id text,
    created_by text,
    origin_item_id text,
    origin_project_id text,
    origin_release_id text,
    origin_test_cycle_id text,
    origin_test_plan_id text,
    baseline_key text,
    baseline_pick_list_option text,
    created_date text,
    description text,
    filter text,
    "name" text,
    origin_simple_filter text,
    signed text,
    "source" text,
    source_key text,
    source_name text,
    "type" text,
    PRIMARY KEY (id, project_id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (origin_item_id) REFERENCES item(id),
    FOREIGN KEY (origin_project_id) REFERENCES project(id),
    FOREIGN KEY (origin_release_id) REFERENCES "release"(id),
    FOREIGN KEY (origin_test_cycle_id) REFERENCES test_cycle(id),
    FOREIGN KEY (origin_test_plan_id) REFERENCES test_plan(id)
);

CREATE TABLE test_plan_baselined_applied_category_snapshot (
    "index" text,
    test_plan_id text,
    category_path_sequence text,
    item_version_number_applied text,
    PRIMARY KEY ("index", test_plan_id),
    FOREIGN KEY (test_plan_id) REFERENCES test_plan(id)
);

CREATE TABLE test_plan (
    id text,
    project_id text,
    created_by text,
    item_type_id text,
    modified_by text,
    archived text,
    created_date text,
    document_key text,
    fields_key text,
    global_id text,
    last_activity_date text,
    modified_date text,
    PRIMARY KEY (id, project_id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (item_type_id) REFERENCES item_type(id),
    FOREIGN KEY (modified_by) REFERENCES users(id)
);

CREATE TABLE relationship_type (
    id text,
    is_default text,
    "name" text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE relationship (
    id text,
    project_id text,
    from_item text,
    relationship_type text,
    to_item text,
    suspect text,
    PRIMARY KEY (id, project_id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (from_item) REFERENCES item(id),
    FOREIGN KEY (relationship_type) REFERENCES relationship_type(id),
    FOREIGN KEY (to_item) REFERENCES item(id)
);

CREATE TABLE users (
    id text,
    active text,
    authentication_id text,
    authentication_name text,
    custom_data jsonb,
    email text,
    first_name text,
    last_name text,
    license_type text,
    location text,
    phone text,
    title text,
    "type" text,
    uid text,
    username text,
    PRIMARY KEY (id)
);

CREATE TABLE activity (
    id text,
    project_id text,
    item_id text,
    item_type_id text,
    user_id text,
    "action" text,
    "date" text,
    details text,
    event_type text,
    object_type text,
    user_comment text,
    user_name text,
    PRIMARY KEY (id, project_id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (item_id) REFERENCES item(id),
    FOREIGN KEY (item_type_id) REFERENCES item_type(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE tags (
    id text,
    project_id text,
    "name" text,
    PRIMARY KEY (id, project_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);
