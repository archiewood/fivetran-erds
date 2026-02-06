CREATE TABLE "action" (
    id text,
    account_id text,
    entity_id text,
    allow_attachment_on_open text,
    allow_attachment_on_return text,
    auto_return_linked_action text,
    blocked_by_reservation_action_id text,
    change_return_name text,
    created_at text,
    deactivate_depreciation text,
    feature_id text,
    fields_counter text,
    has_all_entities text,
    has_all_statuses text,
    icon text,
    is_active text,
    is_auto_returnable text,
    is_creating_entity_objects text,
    is_default text,
    is_returnable text,
    is_system text,
    "key" text,
    "name" text,
    on_mobile_perform_group_action_before_scan_record text,
    on_web_perform_group_action_before_scan_record text,
    ordering text,
    perform_on_not_returned text,
    return_name text,
    track_gps text,
    "type" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES users(account_id),
    FOREIGN KEY (entity_id) REFERENCES groups(id)
);

CREATE TABLE groups (
    id text,
    icon text,
    "key" text,
    "name" text,
    PRIMARY KEY (id)
);

-- The Asset Panda API refers to Assets as a Group Object
CREATE TABLE group_object (
    id text,
    group_id text,
    action_objects jsonb,
    created_at text,
    display_name text,
    display_with_secondary text,
    entity_id text,
    has_audit_history text,
    is_archived text,
    is_deletable text,
    is_editable text,
    is_locked text,
    object_appreciation text,
    object_depreciation text,
    object_version_ids text,
    secondary_name text,
    share_url text,
    updated_at text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id, group_id),
    FOREIGN KEY (group_id) REFERENCES groups(id)
);

CREATE TABLE action_group (
    action_id text,
    id text,
    attachments_in_replication text,
    default_status_id text,
    filter_fields_by text,
    filter_fields_by_status text,
    require_comment_on_object_delete text,
    show_associated text,
    show_linked text,
    track_gps text,
    PRIMARY KEY (action_id, id),
    FOREIGN KEY (action_id) REFERENCES "action"(id),
    FOREIGN KEY (id) REFERENCES groups(id)
);

CREATE TABLE users (
    id text,
    account_id text,
    email text,
    first_name text,
    integ_ad_sid text,
    is_active text,
    is_admin text,
    last_name text,
    template_rule_id text,
    PRIMARY KEY (id)
);

CREATE TABLE action_field (
    id text,
    action_id text,
    entity_id text,
    is_only_embedded text,
    is_open_field text,
    is_required text,
    "key" text,
    "name" text,
    "type" text,
    PRIMARY KEY (id, action_id),
    FOREIGN KEY (action_id) REFERENCES "action"(id),
    FOREIGN KEY (entity_id) REFERENCES groups(id)
);
