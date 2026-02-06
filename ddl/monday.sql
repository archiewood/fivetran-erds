CREATE TABLE workspace_owner_subscriber (
    user_id bigint,
    workspace_id bigint,
    PRIMARY KEY (user_id, workspace_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id)
);

CREATE TABLE workspace_user_subscriber (
    user_id bigint,
    workspace_id bigint,
    PRIMARY KEY (user_id, workspace_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id)
);

CREATE TABLE workspace_team_subscriber (
    team_id bigint,
    workspace_id bigint,
    PRIMARY KEY (team_id, workspace_id),
    FOREIGN KEY (team_id) REFERENCES team(id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id)
);

CREATE TABLE workspace (
    id bigint,
    created_at timestamp,
    description text,
    kind text,
    "name" text,
    "state" text,
    PRIMARY KEY (id)
);

CREATE TABLE asset (
    id text,
    updates_id text,
    uploaded_by_id bigint,
    created_at timestamp,
    file_extension text,
    file_size bigint,
    "name" text,
    public_url text,
    url text,
    url_thumbnail text,
    PRIMARY KEY (id, updates_id),
    FOREIGN KEY (updates_id) REFERENCES updates(id),
    FOREIGN KEY (uploaded_by_id) REFERENCES users(id)
);

CREATE TABLE reply (
    id text,
    update_id text,
    creator_id text,
    body text,
    created_at text,
    text_body text,
    updated_at timestamp,
    PRIMARY KEY (id, update_id),
    FOREIGN KEY (update_id) REFERENCES updates(id),
    FOREIGN KEY (creator_id) REFERENCES users(id)
);

CREATE TABLE updates (
    id text,
    creator_id text,
    item_id text,
    body text,
    created_at timestamp,
    text_body text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (creator_id) REFERENCES users(id),
    FOREIGN KEY (item_id) REFERENCES item(id)
);

CREATE TABLE activity_log (
    id text,
    board_id text,
    user_id text,
    account_id text,
    created_at text,
    data text,
    entity text,
    event text,
    PRIMARY KEY (id, board_id),
    FOREIGN KEY (board_id) REFERENCES board(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE column_value_tag (
    board_id text,
    column_value_id text,
    id text,
    item_id text,
    PRIMARY KEY (board_id, column_value_id, id, item_id),
    FOREIGN KEY (board_id) REFERENCES column_value(board_id),
    FOREIGN KEY (column_value_id) REFERENCES column_value(id),
    FOREIGN KEY (id) REFERENCES tags(id),
    FOREIGN KEY (item_id) REFERENCES column_value(item_id)
);

CREATE TABLE column_value_item_id (
    board_id text,
    column_value_id text,
    id text,
    item_id text,
    PRIMARY KEY (board_id, column_value_id, id, item_id),
    FOREIGN KEY (board_id) REFERENCES column_value(board_id),
    FOREIGN KEY (column_value_id) REFERENCES column_value(id),
    FOREIGN KEY (id) REFERENCES item(id),
    FOREIGN KEY (item_id) REFERENCES column_value(item_id)
);

CREATE TABLE column_value_mirror_item (
    board_id text,
    column_value_id text,
    id text,
    item_id text,
    PRIMARY KEY (board_id, column_value_id, id, item_id),
    FOREIGN KEY (board_id) REFERENCES column_value(board_id),
    FOREIGN KEY (column_value_id) REFERENCES column_value(id),
    FOREIGN KEY (id) REFERENCES board(id),
    FOREIGN KEY (item_id) REFERENCES column_value(item_id)
);

CREATE TABLE time_tracking_history (
    id text,
    board_id text,
    column_value_id text,
    item_id text,
    ended_user_id text,
    started_user_id text,
    created_at text,
    ended_at text,
    manually_entered_end_date text,
    manually_entered_end_time text,
    manually_entered_start_date text,
    manually_entered_start_time text,
    started_at text,
    "status" text,
    updated_at text,
    PRIMARY KEY (id, board_id, column_value_id, item_id),
    FOREIGN KEY (board_id) REFERENCES column_value(board_id),
    FOREIGN KEY (column_value_id) REFERENCES column_value(id),
    FOREIGN KEY (item_id) REFERENCES column_value(item_id),
    FOREIGN KEY (ended_user_id) REFERENCES users(id),
    FOREIGN KEY (started_user_id) REFERENCES users(id)
);

CREATE TABLE person_team (
    id text,
    board_id text,
    column_value_id text,
    item_id text,
    kind text,
    PRIMARY KEY (id, board_id, column_value_id, item_id),
    FOREIGN KEY (board_id) REFERENCES column_value(board_id),
    FOREIGN KEY (column_value_id) REFERENCES column_value(id),
    FOREIGN KEY (item_id) REFERENCES column_value(item_id)
);

CREATE TABLE column_value (
    id text,
    board_id text,
    item_id text,
    checked text,
    "date" text,
    direction text,
    display_value text,
    duration text,
    from_date text,
    "hour" text,
    icon text,
    "index" text,
    is_done text,
    label text,
    label_style_border text,
    label_style_color text,
    "minute" text,
    number text,
    rating text,
    running text,
    started_at text,
    symbol text,
    text text,
    "time" text,
    to_date text,
    update_id text,
    updated_at text,
    "value" text,
    visualization_type text,
    PRIMARY KEY (id, board_id, item_id),
    FOREIGN KEY (board_id) REFERENCES item(board_id),
    FOREIGN KEY (item_id) REFERENCES item(id)
);

CREATE TABLE item_subscriber (
    board_id text,
    id bigint,
    item_id text,
    PRIMARY KEY (board_id, id, item_id),
    FOREIGN KEY (board_id) REFERENCES item(board_id),
    FOREIGN KEY (id) REFERENCES users(id),
    FOREIGN KEY (item_id) REFERENCES item(id)
);

CREATE TABLE item (
    id text,
    board_id text,
    creator_id text,
    group_id text,
    parent_item_id text,
    created_at timestamp,
    email text,
    "name" text,
    "state" text,
    updated_at timestamp,
    PRIMARY KEY (id, board_id),
    FOREIGN KEY (board_id) REFERENCES board(id),
    FOREIGN KEY (creator_id) REFERENCES users(id),
    FOREIGN KEY (group_id) REFERENCES groups(id),
    FOREIGN KEY (parent_item_id) REFERENCES item(id)
);

CREATE TABLE team_user (
    team_id bigint,
    user_id bigint,
    PRIMARY KEY (team_id, user_id),
    FOREIGN KEY (team_id) REFERENCES team(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE team (
    id bigint,
    "name" text,
    picture_url text,
    PRIMARY KEY (id)
);

CREATE TABLE users (
    id bigint,
    account_id bigint,
    birthday text,
    country_code text,
    created_at timestamp,
    current_language text,
    email text,
    enabled boolean,
    encrypt_api_token text,
    is_admin boolean,
    is_guest boolean,
    is_pending boolean,
    is_verified boolean,
    is_view_only boolean,
    join_date text,
    location text,
    mobile_phone text,
    "name" text,
    phone text,
    photo_original text,
    photo_small text,
    photo_thumb text,
    photo_thumb_small text,
    photo_tiny text,
    time_zone_identifier text,
    title text,
    url text,
    utc_hours_diff bigint,
    PRIMARY KEY (id)
);

CREATE TABLE tags (
    id bigint,
    color text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE board_view (
    id text,
    board_id text,
    "name" text,
    settings_str text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (board_id) REFERENCES board(id)
);

CREATE TABLE columns (
    board_id text,
    id text,
    archived boolean,
    description text,
    settings_str text,
    title text,
    "type" text,
    width bigint,
    PRIMARY KEY (board_id, id),
    FOREIGN KEY (board_id) REFERENCES board(id),
    FOREIGN KEY (id) REFERENCES column_value(id)
);

CREATE TABLE groups (
    id text,
    board_id text,
    archived text,
    color text,
    deleted boolean,
    "position" text,
    title text,
    PRIMARY KEY (id, board_id),
    FOREIGN KEY (board_id) REFERENCES board(id)
);

CREATE TABLE board_owner (
    board_id text,
    user_id bigint,
    PRIMARY KEY (board_id, user_id),
    FOREIGN KEY (board_id) REFERENCES board(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE board_subscriber (
    board_id text,
    user_id bigint,
    PRIMARY KEY (board_id, user_id),
    FOREIGN KEY (board_id) REFERENCES board(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE board_tag (
    board_id text,
    tag_id bigint,
    PRIMARY KEY (board_id, tag_id),
    FOREIGN KEY (board_id) REFERENCES board(id),
    FOREIGN KEY (tag_id) REFERENCES tags(id)
);

CREATE TABLE board_update (
    board_id text,
    id text,
    PRIMARY KEY (board_id, id),
    FOREIGN KEY (board_id) REFERENCES board(id),
    FOREIGN KEY (id) REFERENCES updates(id)
);

CREATE TABLE board (
    id text,
    owner_id bigint,
    top_group_id text,
    workspace_id bigint,
    board_folder_id text,
    board_kind text,
    description text,
    "name" text,
    permission text,
    "state" text,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (owner_id) REFERENCES users(id),
    FOREIGN KEY (top_group_id) REFERENCES groups(id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id)
);
