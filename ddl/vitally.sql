CREATE TABLE project_template (
    id text,
    project_category_id text,
    created_at text,
    description text,
    "name" text,
    project_name text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (project_category_id) REFERENCES project_category(id)
);

CREATE TABLE note_user (
    note_id text,
    user_id text,
    PRIMARY KEY (note_id, user_id),
    FOREIGN KEY (note_id) REFERENCES note(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE note_author (
    id text,
    note_id text,
    license_status text,
    "name" text,
    PRIMARY KEY (id, note_id),
    FOREIGN KEY (id) REFERENCES users(id),
    FOREIGN KEY (note_id) REFERENCES note(id)
);

CREATE TABLE note_tag (
    note_tag_id text,
    note_id text,
    PRIMARY KEY (note_tag_id, note_id),
    FOREIGN KEY (note_id) REFERENCES note(id)
);

CREATE TABLE note (
    id text,
    account_id text,
    note_category_id text,
    organization_id text,
    archived_at text,
    created_at text,
    "date" text,
    external_id text,
    note text,
    subject text,
    updated_at text,
    -- note_trait_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (note_category_id) REFERENCES note_category(id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE project (
    id text,
    account_id text,
    organization_id text,
    project_category_id text,
    template_id text,
    actual_completion_date text,
    actual_start_date text,
    archived_at text,
    created_at text,
    duration_in_days text,
    "name" text,
    owned_by_user_id text,
    project_status_id text,
    target_completion_date text,
    target_start_date text,
    -- project_trait_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES task_project(task_project_id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (organization_id) REFERENCES organization(id),
    FOREIGN KEY (project_category_id) REFERENCES project_category(id),
    FOREIGN KEY (template_id) REFERENCES project_template(id)
);

CREATE TABLE project_category (
    id text,
    created_at text,
    "name" text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE custom_trait (
    field_type text,
    id text,
    created_at text,
    label text,
    "path" text,
    "type" text,
    PRIMARY KEY (field_type, id)
);

CREATE TABLE custom_object_field (
    "index" text,
    custom_object_id text,
    created_at text,
    id text,
    label text,
    "path" text,
    "type" text,
    PRIMARY KEY ("index", custom_object_id),
    FOREIGN KEY (custom_object_id) REFERENCES custom_object(id)
);

CREATE TABLE custom_object (
    id text,
    created_at text,
    label text,
    "name" text,
    sync_active text,
    updated_at text,
    write_mode text,
    PRIMARY KEY (id)
);

CREATE TABLE conversation_message_to (
    conversation_id text,
    conversation_message_id text,
    id text,
    "type" text,
    PRIMARY KEY (conversation_id, conversation_message_id, id),
    FOREIGN KEY (conversation_id) REFERENCES conversation_message(conversation_id),
    FOREIGN KEY (conversation_message_id) REFERENCES conversation_message(id),
    FOREIGN KEY (id) REFERENCES users(id)
);

CREATE TABLE conversation_message_cc (
    conversation_id text,
    conversation_message_id text,
    id text,
    "type" text,
    PRIMARY KEY (conversation_id, conversation_message_id, id),
    FOREIGN KEY (conversation_id) REFERENCES conversation_message(conversation_id),
    FOREIGN KEY (conversation_message_id) REFERENCES conversation_message(id),
    FOREIGN KEY (id) REFERENCES users(id)
);

CREATE TABLE conversation_message (
    conversation_id text,
    id text,
    from_id text,
    bcc jsonb,
    created_at text,
    external_id text,
    from_type text,
    message text,
    time_stamp text,
    "type" text,
    updated_at text,
    PRIMARY KEY (conversation_id, id),
    FOREIGN KEY (from_id) REFERENCES users(id)
);

CREATE TABLE conversation_account (
    account_id text,
    conversation_id text,
    PRIMARY KEY (account_id, conversation_id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id)
);

CREATE TABLE conversation_user (
    conversation_id text,
    user_id text,
    PRIMARY KEY (conversation_id, user_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE conversation_admin (
    admin_id text,
    conversation_id text,
    email text,
    license_status text,
    "name" text,
    PRIMARY KEY (admin_id, conversation_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id),
    FOREIGN KEY (email) REFERENCES users(email)
);

CREATE TABLE conversation_organization (
    conversation_id text,
    organization_id text,
    PRIMARY KEY (conversation_id, organization_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE conversation (
    id text,
    created_at text,
    external_id text,
    external_url text,
    "source" text,
    subject text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE user_account (
    account_id text,
    user_id text,
    PRIMARY KEY (account_id, user_id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE user_segment (
    id text,
    user_id text,
    "name" text,
    PRIMARY KEY (id, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE user_trait_site_competitor (
    site_competitor text,
    user_id text,
    PRIMARY KEY (site_competitor, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    avatar text,
    created_at text,
    deactivated_at text,
    email text,
    external_id text,
    first_known text,
    join_date text,
    last_inbound_message_timestamp text,
    last_outbound_message_timestamp text,
    last_seen_timestamp text,
    "name" text,
    unsubscribed_from_conversations text,
    unsubscribed_from_conversations_at text,
    updated_at text,
    -- user_trait_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE nps_response_account (
    account_id text,
    nps_response_id text,
    user_id text,
    PRIMARY KEY (account_id, nps_response_id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (nps_response_id) REFERENCES nps_response(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE nps_response (
    id text,
    user_id text,
    created_at text,
    dismissed_at text,
    external_id text,
    feedback text,
    responded_at text,
    score text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE task_project (
    task_project_id text,
    task_id text,
    account_id text,
    organization_id text,
    project_category_id text,
    actual_completion_date text,
    actual_start_date text,
    archived_at text,
    created_at text,
    duration_in_days text,
    "name" text,
    owned_by_vitally_user_id text,
    project_status_id text,
    target_completion_date text,
    target_start_date text,
    updated_at text,
    -- task_project_trait_* (dynamic column),
    PRIMARY KEY (task_project_id, task_id),
    FOREIGN KEY (task_id) REFERENCES task(id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (organization_id) REFERENCES organization(id),
    FOREIGN KEY (project_category_id) REFERENCES project_category(id)
);

CREATE TABLE task_tag (
    task_tag_id text,
    task_id text,
    PRIMARY KEY (task_tag_id, task_id),
    FOREIGN KEY (task_id) REFERENCES task(id)
);

CREATE TABLE task (
    id text,
    account_id text,
    assigned_to_user_id text,
    completed_by_user_id text,
    organization_id text,
    task_category_id text,
    archived_at text,
    completed_at text,
    created_at text,
    description text,
    due_date text,
    external_id text,
    "name" text,
    updated_at text,
    user_license_status text,
    -- task_trait_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (assigned_to_user_id) REFERENCES users(id),
    FOREIGN KEY (completed_by_user_id) REFERENCES users(id),
    FOREIGN KEY (organization_id) REFERENCES organization(id),
    FOREIGN KEY (task_category_id) REFERENCES task_category(id)
);

CREATE TABLE organization_segment (
    id text,
    organization_id text,
    "name" text,
    PRIMARY KEY (id, organization_id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE organization (
    id text,
    account_owner_id text,
    churned_at text,
    created_at text,
    csm_id text,
    external_id text,
    mrr text,
    "name" text,
    next_renewal_date text,
    segments jsonb,
    trial_end_date text,
    updated_at text,
    users_count text,
    -- organization_trait_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (account_owner_id) REFERENCES users(id)
);

CREATE TABLE note_category (
    id text,
    created_at text,
    "name" text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE task_category (
    id text,
    created_at text,
    "name" text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE account_segment (
    id text,
    account_id text,
    "name" text,
    PRIMARY KEY (id, account_id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE account_key_role_breakout (
    id text,
    account_key_role_id text,
    key_role_account_id text,
    created_at text,
    label text,
    PRIMARY KEY (id, account_key_role_id, key_role_account_id),
    FOREIGN KEY (account_key_role_id) REFERENCES account_key_role(id),
    FOREIGN KEY (key_role_account_id) REFERENCES account_key_role(account_id)
);

CREATE TABLE account_key_role (
    id text,
    account_id text,
    assigned_at text,
    created_at text,
    vitally_user text,
    vitally_user_license_status text,
    PRIMARY KEY (id, account_id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE account (
    id text,
    account_owner_id text,
    organization_id text,
    account_executive_id text,
    churned_at text,
    created_at text,
    csm_id text,
    external_id text,
    first_seen_timestamp text,
    health_score text,
    last_inbound_message_timestamp text,
    last_outbound_message_timestamp text,
    last_seen_timestamp text,
    mrr text,
    "name" text,
    next_renewal_date text,
    nps_detractor_count text,
    nps_passive_count text,
    nps_promoter_count text,
    nps_score text,
    trial_end_date text,
    updated_at text,
    users_count text,
    -- account_trait_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (account_owner_id) REFERENCES users(id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);
