CREATE TABLE list_attribute (
    id text,
    workspace_id text,
    target_id text,
    api_slug text,
    config_currency_default_currency_code text,
    config_currency_display_type text,
    config_record_reference_allowed_object_ids jsonb,
    created_at text,
    default_value text,
    description text,
    is_archived text,
    is_default_value_enabled text,
    is_multiselect text,
    is_required text,
    is_system_attribute text,
    is_unique text,
    title text,
    "type" text,
    PRIMARY KEY (id, workspace_id, target_id),
    FOREIGN KEY (target_id) REFERENCES list(id)
);

CREATE TABLE list_attribute_status (
    id text,
    attribute_id text,
    target_id text,
    workspace_id text,
    celebration_enabled text,
    is_archived text,
    target_time_in_status text,
    title text,
    PRIMARY KEY (id, attribute_id, target_id, workspace_id),
    FOREIGN KEY (attribute_id) REFERENCES list_attribute(id),
    FOREIGN KEY (target_id) REFERENCES list(id),
    FOREIGN KEY (workspace_id) REFERENCES workspace_member(workspace_id)
);

CREATE TABLE record_value (
    "name" text,
    record_id text,
    record_object_id text,
    record_workspace_id text,
    "value" text,
    PRIMARY KEY ("name", record_id, record_object_id, record_workspace_id),
    FOREIGN KEY (record_id) REFERENCES record(id),
    FOREIGN KEY (record_object_id) REFERENCES record(object_id),
    FOREIGN KEY (record_workspace_id) REFERENCES record(workspace_id)
);

CREATE TABLE record (
    id text,
    object_id text,
    workspace_id text,
    created_at text,
    PRIMARY KEY (id, object_id, workspace_id),
    FOREIGN KEY (object_id) REFERENCES object(id),
    FOREIGN KEY (workspace_id) REFERENCES workspace_member(workspace_id)
);

CREATE TABLE object (
    id text,
    workspace_id text,
    api_slug text,
    created_at text,
    plural_noun text,
    singular_noun text,
    PRIMARY KEY (id, workspace_id),
    FOREIGN KEY (workspace_id) REFERENCES workspace_member(workspace_id)
);

CREATE TABLE object_attribute_option (
    id text,
    attribute_id text,
    target_id text,
    workspace_id text,
    is_archived text,
    title text,
    PRIMARY KEY (id, attribute_id, target_id, workspace_id),
    FOREIGN KEY (attribute_id) REFERENCES list_attribute(id),
    FOREIGN KEY (target_id) REFERENCES list(id),
    FOREIGN KEY (workspace_id) REFERENCES workspace_member(workspace_id)
);

CREATE TABLE object_attribute_status (
    id text,
    attribute_id text,
    target_id text,
    workspace_id text,
    celebration_enabled text,
    is_archived text,
    target_time_in_status text,
    title text,
    PRIMARY KEY (id, attribute_id, target_id, workspace_id),
    FOREIGN KEY (attribute_id) REFERENCES object_attribute(id),
    FOREIGN KEY (target_id) REFERENCES object(id),
    FOREIGN KEY (workspace_id) REFERENCES workspace_member(workspace_id)
);

CREATE TABLE workspace_member (
    id text,
    workspace_id text,
    access_level text,
    avatar_url text,
    created_at text,
    email_address text,
    first_name text,
    last_name text,
    PRIMARY KEY (id, workspace_id)
);

CREATE TABLE note (
    id text,
    workspace_id text,
    created_by_actor_id text,
    content_plaintext text,
    created_at text,
    created_by_actor_type text,
    object text,
    record_id text,
    title text,
    PRIMARY KEY (id, workspace_id),
    FOREIGN KEY (workspace_id) REFERENCES workspace_member(workspace_id),
    FOREIGN KEY (created_by_actor_id) REFERENCES workspace_member(id)
);

CREATE TABLE object_attribute (
    id text,
    workspace_id text,
    target_id text,
    api_slug text,
    config_currency_default_currency_code text,
    config_currency_display_type text,
    config_record_reference_allowed_object_ids jsonb,
    created_at text,
    default_value text,
    description text,
    is_archived text,
    is_default_value_enabled text,
    is_multiselect text,
    is_required text,
    is_system_attribute text,
    is_unique text,
    title text,
    "type" text,
    PRIMARY KEY (id, workspace_id, target_id),
    FOREIGN KEY (target_id) REFERENCES object(id)
);

CREATE TABLE list_attribute_option (
    id text,
    attribute_id text,
    target_id text,
    workspace_id text,
    is_archived text,
    title text,
    PRIMARY KEY (id, attribute_id, target_id, workspace_id),
    FOREIGN KEY (attribute_id) REFERENCES object_attribute(id),
    FOREIGN KEY (target_id) REFERENCES object(id),
    FOREIGN KEY (workspace_id) REFERENCES workspace_member(workspace_id)
);

CREATE TABLE list_workspace_member_access (
    list_id text,
    workspace_id text,
    workspace_member_id text,
    "level" text,
    PRIMARY KEY (list_id, workspace_id, workspace_member_id),
    FOREIGN KEY (list_id) REFERENCES list(id),
    FOREIGN KEY (workspace_id) REFERENCES list(workspace_id),
    FOREIGN KEY (workspace_member_id) REFERENCES workspace_member(id)
);

CREATE TABLE list (
    id text,
    workspace_id text,
    created_by_actor_id text,
    api_slug text,
    created_at text,
    created_by_actor_type text,
    "name" text,
    parent_object jsonb,
    workspace_access text,
    PRIMARY KEY (id, workspace_id),
    FOREIGN KEY (workspace_id) REFERENCES workspace_member(workspace_id),
    FOREIGN KEY (created_by_actor_id) REFERENCES workspace_member(id)
);

CREATE TABLE entries_value (
    "name" text,
    id text,
    list_id text,
    workspace_id text,
    "value" text,
    PRIMARY KEY ("name", id, list_id, workspace_id),
    FOREIGN KEY (id) REFERENCES entries(id),
    FOREIGN KEY (list_id) REFERENCES entries(list_id),
    FOREIGN KEY (workspace_id) REFERENCES entries(workspace_id)
);

CREATE TABLE entries (
    id text,
    list_id text,
    workspace_id text,
    created_at text,
    parent_object text,
    parent_record_id text,
    PRIMARY KEY (id, list_id, workspace_id),
    FOREIGN KEY (list_id) REFERENCES list(id),
    FOREIGN KEY (workspace_id) REFERENCES workspace_member(workspace_id)
);
