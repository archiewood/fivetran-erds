CREATE TABLE collection (
    id text,
    user_id text,
    created_at text,
    deleted_at text,
    "name" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE contact (
    id text,
    user_id text,
    deleted_at text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE channel_user_group (
    channel_id text,
    id text,
    PRIMARY KEY (channel_id, id),
    FOREIGN KEY (channel_id) REFERENCES channel(id),
    FOREIGN KEY (id) REFERENCES user_group(id)
);

CREATE TABLE shared_space_participant (
    id text,
    asset_id text,
    shared_space_id text,
    user_id text,
    access_granted_at text,
    access_revoked_at text,
    created_at text,
    deleted_at text,
    job_title text,
    organisation text,
    page text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (asset_id) REFERENCES asset(id),
    FOREIGN KEY (shared_space_id) REFERENCES shared_space(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE user_group (
    id text,
    deleted_at text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE share (
    id text,
    creator_id text,
    recipients text,
    revoked_at text,
    salesforce text,
    shared_at text,
    theme text,
    title text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (creator_id) REFERENCES users(id)
);

CREATE TABLE event (
    id text,
    asset_id text,
    channel_id text,
    contact_id text,
    device_id text,
    division_id text,
    share_id text,
    shared_space_id text,
    shared_space_participant_id text,
    user_id text,
    end_time text,
    logged_at text,
    page text,
    start_time text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (asset_id) REFERENCES asset(id),
    FOREIGN KEY (channel_id) REFERENCES channel(id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (device_id) REFERENCES device(id),
    FOREIGN KEY (division_id) REFERENCES division(id),
    FOREIGN KEY (share_id) REFERENCES share(id),
    FOREIGN KEY (shared_space_id) REFERENCES shared_space(id),
    FOREIGN KEY (shared_space_participant_id) REFERENCES shared_space_participant(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE division (
    id text,
    owner_user_id text,
    deleted_at text,
    is_global text,
    is_personal text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (owner_user_id) REFERENCES users(id)
);

CREATE TABLE asset_author (
    asset_id text,
    id text,
    PRIMARY KEY (asset_id, id),
    FOREIGN KEY (asset_id) REFERENCES asset(id),
    FOREIGN KEY (id) REFERENCES users(id)
);

CREATE TABLE tag_category_tag (
    id text,
    tag_category_id text,
    tag_id text,
    PRIMARY KEY (id, tag_category_id),
    FOREIGN KEY (tag_category_id) REFERENCES tag_category(id),
    FOREIGN KEY (tag_id) REFERENCES tags(id)
);

CREATE TABLE shared_space_item (
    id text,
    asset_id text,
    shared_space_id text,
    user_id text,
    created_at text,
    deleted_at text,
    page text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (asset_id) REFERENCES asset(id),
    FOREIGN KEY (shared_space_id) REFERENCES shared_space(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE asset_language (
    code text,
    asset_id text,
    PRIMARY KEY (code, asset_id),
    FOREIGN KEY (asset_id) REFERENCES asset(id)
);

CREATE TABLE asset_tag (
    asset_id text,
    id text,
    PRIMARY KEY (asset_id, id),
    FOREIGN KEY (asset_id) REFERENCES asset(id),
    FOREIGN KEY (id) REFERENCES tags(id)
);

CREATE TABLE collection_item (
    id text,
    collection_id text,
    asset_id text,
    created_at text,
    deleted_at text,
    page text,
    "position" text,
    updated_at text,
    PRIMARY KEY (id, collection_id),
    FOREIGN KEY (collection_id) REFERENCES collection(id),
    FOREIGN KEY (asset_id) REFERENCES asset(id)
);

CREATE TABLE tag_category (
    id text,
    "name" text,
    published_at text,
    PRIMARY KEY (id)
);

CREATE TABLE shared_space (
    id text,
    owner_id text,
    created_at text,
    creator_id text,
    deleted_at text,
    description text,
    last_activity_at text,
    "status" text,
    title text,
    PRIMARY KEY (id),
    FOREIGN KEY (owner_id) REFERENCES users(id)
);

CREATE TABLE user_group_member (
    id text,
    user_id text,
    PRIMARY KEY (id, user_id),
    FOREIGN KEY (id) REFERENCES user_group(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE device (
    id text,
    last_active_user_id text,
    app_used text,
    location text,
    model text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (last_active_user_id) REFERENCES users(id)
);

CREATE TABLE asset (
    id text,
    division_id text,
    original_asset_id text,
    archived_at text,
    created_at text,
    deleted_at text,
    description text,
    display_name text,
    expires_at text,
    is_annotatable text,
    is_division_shared text,
    is_downloadable text,
    is_sensitive text,
    is_shareable text,
    optimized_file_size text,
    original_file_size text,
    released_at text,
    slug text,
    "source" text,
    "status" text,
    "type" text,
    updated_at text,
    uploaded_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (division_id) REFERENCES division(id),
    FOREIGN KEY (original_asset_id) REFERENCES asset(id)
);

CREATE TABLE channel_user (
    channel_id text,
    id text,
    PRIMARY KEY (channel_id, id),
    FOREIGN KEY (channel_id) REFERENCES channel(id),
    FOREIGN KEY (id) REFERENCES users(id)
);

CREATE TABLE asset_country (
    code text,
    asset_id text,
    PRIMARY KEY (code, asset_id),
    FOREIGN KEY (asset_id) REFERENCES asset(id)
);

CREATE TABLE channel (
    id text,
    deleted_at text,
    "name" text,
    "status" text,
    PRIMARY KEY (id)
);

CREATE TABLE division_user_group (
    division_id text,
    id text,
    PRIMARY KEY (division_id, id),
    FOREIGN KEY (division_id) REFERENCES division(id),
    FOREIGN KEY (id) REFERENCES user_group(id)
);

CREATE TABLE users (
    id text,
    manager_id text,
    created_at text,
    deleted_at text,
    email_address text,
    first_name text,
    is_active text,
    is_forgotten text,
    last_name text,
    user_role text,
    PRIMARY KEY (id),
    FOREIGN KEY (manager_id) REFERENCES users(id)
);

CREATE TABLE tags (
    id text,
    "name" text,
    PRIMARY KEY (id)
);
