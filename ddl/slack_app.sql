CREATE TABLE dnd_info (
    _fivetran_id text,
    user_id text,
    dnd_enabled boolean,
    next_dnd_end_ts timestamp,
    next_dnd_start_ts timestamp,
    snooze_enabled boolean,
    snooze_endtime timestamp,
    snooze_is_indefinite boolean,
    snooze_remaining text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE channel_pending_shared (
    pending_shared_id text,
    channel_id text,
    PRIMARY KEY (pending_shared_id, channel_id),
    FOREIGN KEY (channel_id) REFERENCES channel(id)
);

CREATE TABLE channel_shared_team (
    shared_team_id text,
    channel_id text,
    PRIMARY KEY (shared_team_id, channel_id),
    FOREIGN KEY (channel_id) REFERENCES channel(id)
);

CREATE TABLE channel_internal_team (
    internal_team_id text,
    channel_id text,
    PRIMARY KEY (internal_team_id, channel_id),
    FOREIGN KEY (channel_id) REFERENCES channel(id)
);

CREATE TABLE channel_pending_connected_team (
    pending_connected_team_id text,
    channel_id text,
    PRIMARY KEY (pending_connected_team_id, channel_id),
    FOREIGN KEY (channel_id) REFERENCES channel(id)
);

CREATE TABLE previous_channel_name (
    previous_name text,
    channel_id text,
    PRIMARY KEY (previous_name, channel_id),
    FOREIGN KEY (channel_id) REFERENCES channel(id)
);

CREATE TABLE channel (
    id text,
    creator text,
    created timestamp,
    is_archived boolean,
    is_channel boolean,
    is_ext_shared boolean,
    is_general boolean,
    is_group boolean,
    is_im boolean,
    is_moved text,
    is_mpim boolean,
    is_org_shared boolean,
    is_pending_ext_shared boolean,
    is_private boolean,
    is_shared boolean,
    "name" text,
    name_normalized text,
    parent_conversation boolean,
    purpose_creator text,
    purpose_last_set timestamp,
    purpose_value text,
    topic_creator text,
    topic_last_set timestamp,
    topic_value text,
    unlinked text,
    PRIMARY KEY (id),
    FOREIGN KEY (creator) REFERENCES users(id)
);

CREATE TABLE profile_field_possible_value (
    possible_value text,
    profile_field_id text,
    PRIMARY KEY (possible_value, profile_field_id),
    FOREIGN KEY (profile_field_id) REFERENCES profile_field(id)
);

CREATE TABLE profile_field_option (
    "name" text,
    profile_field_id text,
    "value" text,
    PRIMARY KEY ("name", profile_field_id),
    FOREIGN KEY (profile_field_id) REFERENCES profile_field(id)
);

CREATE TABLE profile_field (
    id text,
    hint text,
    is_hidden text,
    label text,
    options_is_protected text,
    ordering text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE scheduled_message (
    id text,
    channel_id text,
    date_created timestamp,
    post_at timestamp,
    text text,
    PRIMARY KEY (id),
    FOREIGN KEY (channel_id) REFERENCES channel(id)
);

CREATE TABLE pin (
    channel_id text,
    message_ts text,
    created_by text,
    pinned_time text,
    PRIMARY KEY (channel_id, message_ts),
    FOREIGN KEY (channel_id) REFERENCES channel(id),
    FOREIGN KEY (message_ts) REFERENCES message(ts),
    FOREIGN KEY (created_by) REFERENCES users(id)
);

CREATE TABLE user_group_prefs_channel (
    public_channel_id text,
    user_group_id text,
    PRIMARY KEY (public_channel_id, user_group_id),
    FOREIGN KEY (user_group_id) REFERENCES user_group(id)
);

CREATE TABLE user_group_prefs_group (
    private_channel_id text,
    user_group_id text,
    PRIMARY KEY (private_channel_id, user_group_id),
    FOREIGN KEY (user_group_id) REFERENCES user_group(id)
);

CREATE TABLE user_group (
    id text,
    created_by text,
    deleted_by text,
    updated_by text,
    auto_type text,
    date_create timestamp,
    date_delete timestamp,
    date_update timestamp,
    description text,
    handle text,
    is_external boolean,
    is_user_group boolean,
    "name" text,
    team_id text,
    user_count text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (deleted_by) REFERENCES users(id),
    FOREIGN KEY (updated_by) REFERENCES users(id)
);

CREATE TABLE team_billing (
    plan text,
    PRIMARY KEY (plan)
);

CREATE TABLE message_reply_user (
    message_channel_id text,
    message_ts text,
    parent_message_ts text,
    reply_user_id text,
    PRIMARY KEY (message_channel_id, message_ts, parent_message_ts, reply_user_id),
    FOREIGN KEY (message_channel_id) REFERENCES message(message_channel_id),
    FOREIGN KEY (message_ts) REFERENCES message(ts),
    FOREIGN KEY (parent_message_ts) REFERENCES message(parent_message_ts),
    FOREIGN KEY (reply_user_id) REFERENCES users(id)
);

CREATE TABLE message_block_element (
    "index" text,
    message_block_index text,
    message_channel_id text,
    message_ts text,
    parent_message_ts text,
    elements text,
    text text,
    "type" text,
    verbatim text,
    -- custom_* (dynamic column),
    PRIMARY KEY ("index", message_block_index, message_channel_id, message_ts, parent_message_ts),
    FOREIGN KEY (message_block_index) REFERENCES message_block("index"),
    FOREIGN KEY (message_channel_id) REFERENCES message_block(message_channel_id),
    FOREIGN KEY (message_ts) REFERENCES message_block(message_ts),
    FOREIGN KEY (parent_message_ts) REFERENCES message_block(parent_message_ts)
);

CREATE TABLE message_block_field (
    "index" text,
    message_block_index text,
    message_channel_id text,
    message_ts text,
    parent_message_ts text,
    text text,
    "type" text,
    verbatim text,
    -- custom_* (dynamic column),
    PRIMARY KEY ("index", message_block_index, message_channel_id, message_ts, parent_message_ts),
    FOREIGN KEY (message_block_index) REFERENCES message_block("index"),
    FOREIGN KEY (message_channel_id) REFERENCES message_block(message_channel_id),
    FOREIGN KEY (message_ts) REFERENCES message_block(message_ts),
    FOREIGN KEY (parent_message_ts) REFERENCES message_block(parent_message_ts)
);

CREATE TABLE message_block (
    "index" text,
    message_channel_id text,
    message_ts text,
    parent_message_ts text,
    block_id text,
    "type" text,
    PRIMARY KEY ("index", message_channel_id, message_ts, parent_message_ts),
    FOREIGN KEY (message_channel_id) REFERENCES message(message_channel_id),
    FOREIGN KEY (message_ts) REFERENCES message(ts),
    FOREIGN KEY (parent_message_ts) REFERENCES message(parent_message_ts)
);

CREATE TABLE message_file (
    id text,
    message_channel_id text,
    message_ts text,
    parent_message_ts text,
    user_id text,
    created timestamp,
    display_as_bot boolean,
    edit_link text,
    editable boolean,
    external_type text,
    filetype text,
    has_rich_preview boolean,
    is_external boolean,
    is_public boolean,
    is_starred boolean,
    lines text,
    lines_more text,
    mimetype text,
    mode text,
    "name" text,
    permalink text,
    permalink_public text,
    pretty_type text,
    preview text,
    preview_highlight text,
    preview_is_truncated boolean,
    public_url_shared boolean,
    "size" text,
    timestamps timestamp,
    title text,
    url_private text,
    url_private_download text,
    PRIMARY KEY (id),
    FOREIGN KEY (message_channel_id) REFERENCES message(message_channel_id),
    FOREIGN KEY (message_ts) REFERENCES message(ts),
    FOREIGN KEY (parent_message_ts) REFERENCES message(parent_message_ts),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE message_attachment (
    _fivetran_id text,
    message_channel_id text,
    message_ts text,
    parent_message_ts text,
    fallback text,
    from_url text,
    id text,
    image_bytes text,
    image_height text,
    image_url text,
    image_width text,
    original_url text,
    service_name text,
    text text,
    title text,
    title_link text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (message_channel_id) REFERENCES message(message_channel_id),
    FOREIGN KEY (message_ts) REFERENCES message(ts),
    FOREIGN KEY (parent_message_ts) REFERENCES message(parent_message_ts)
);

CREATE TABLE message_reaction_user (
    message_channel_id text,
    message_reaction_name text,
    message_ts text,
    parent_message_ts text,
    user_id text,
    PRIMARY KEY (message_channel_id, message_reaction_name, message_ts, parent_message_ts, user_id),
    FOREIGN KEY (message_channel_id) REFERENCES message_reaction(message_channel_id),
    FOREIGN KEY (message_reaction_name) REFERENCES message_reaction("name"),
    FOREIGN KEY (message_ts) REFERENCES message_reaction(message_ts),
    FOREIGN KEY (parent_message_ts) REFERENCES message_reaction(parent_message_ts),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE message_reaction (
    "name" text,
    message_channel_id text,
    message_ts text,
    parent_message_ts text,
    count text,
    PRIMARY KEY ("name", message_channel_id, message_ts, parent_message_ts),
    FOREIGN KEY (message_channel_id) REFERENCES message(message_channel_id),
    FOREIGN KEY (message_ts) REFERENCES message(ts),
    FOREIGN KEY (parent_message_ts) REFERENCES message(parent_message_ts)
);

CREATE TABLE message (
    ts text,
    message_channel_id text,
    parent_message_ts text,
    user_id text,
    edited_ts text,
    edited_user text,
    is_locked text,
    last_read text,
    latest_reply text,
    reply_count text,
    reply_users_count text,
    source_team text,
    subscribed text,
    subtype text,
    team text,
    text text,
    thread_ts text,
    "type" text,
    PRIMARY KEY (ts, message_channel_id, parent_message_ts),
    FOREIGN KEY (message_channel_id) REFERENCES channel(id),
    FOREIGN KEY (parent_message_ts) REFERENCES message(parent_message_ts),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    color text,
    deleted boolean,
    is_admin boolean,
    is_app_user boolean,
    is_bot boolean,
    is_email_confirmed boolean,
    is_owner boolean,
    is_primary_owner boolean,
    is_restricted boolean,
    is_ultra_restricted boolean,
    locale text,
    "name" text,
    profile_always_active text,
    profile_app_api_id text,
    profile_avatar_hash text,
    profile_bot_id text,
    profile_display_name text,
    profile_display_name_normalized text,
    profile_email text,
    profile_fields jsonb,
    profile_first_name text,
    profile_image_192 text,
    profile_image_24 text,
    profile_image_32 text,
    profile_image_48 text,
    profile_image_512 text,
    profile_image_72 text,
    profile_last_name text,
    profile_phone text,
    profile_real_name_normalized text,
    profile_skype text,
    profile_start_date text,
    profile_status_emoji text,
    profile_status_emoji_display_info jsonb,
    profile_status_expiration text,
    profile_status_text text,
    profile_status_text_canonical text,
    profile_team text,
    profile_title text,
    real_name text,
    team_id text,
    time_zone text,
    time_zone_label text,
    time_zone_offset text,
    updated text,
    who_can_share_contact_card text,
    PRIMARY KEY (id)
);

CREATE TABLE bookmark (
    id text,
    channel_id text,
    last_updated_by_user_id text,
    app_id text,
    date_created timestamp,
    date_updated timestamp,
    emoji text,
    entity_id text,
    icon_url text,
    last_updated_by_team_id text,
    link text,
    rank text,
    shortcut_id text,
    title text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (channel_id) REFERENCES channel(id),
    FOREIGN KEY (last_updated_by_user_id) REFERENCES users(id)
);

CREATE TABLE channel_member (
    channel_id text,
    user_id text,
    PRIMARY KEY (channel_id, user_id),
    FOREIGN KEY (channel_id) REFERENCES channel(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE remote_file_channel (
    remote_file_channel text,
    remote_file_id text,
    PRIMARY KEY (remote_file_channel, remote_file_id),
    FOREIGN KEY (remote_file_id) REFERENCES remote_file(id)
);

CREATE TABLE remote_file (
    id text,
    channel_id text,
    user_id text,
    created timestamp,
    deanimate_gif text,
    display_as_bot boolean,
    editable boolean,
    external_type text,
    filetype text,
    image_exif_rotation text,
    is_external boolean,
    is_public boolean,
    mimetype text,
    mode text,
    "name" text,
    original_h text,
    original_w text,
    permalink text,
    permalink_public text,
    pjpeg text,
    pretty_type text,
    public_url_shared boolean,
    "size" text,
    thumb_160 text,
    thumb_360 text,
    thumb_360_gif text,
    thumb_360_h text,
    thumb_360_w text,
    thumb_64 text,
    thumb_80 text,
    timestamps timestamp,
    title text,
    url_private text,
    url_private_download text,
    username text,
    PRIMARY KEY (id, channel_id),
    FOREIGN KEY (channel_id) REFERENCES channel(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE user_group_user (
    user_group_id text,
    user_id text,
    PRIMARY KEY (user_group_id, user_id),
    FOREIGN KEY (user_group_id) REFERENCES user_group(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE team_preference (
    _fivetran_id text,
    allow_message_deletion boolean,
    disable_file_uploads text,
    display_real_names boolean,
    msg_edit_window_mins text,
    who_can_post_general text,
    PRIMARY KEY (_fivetran_id)
);
