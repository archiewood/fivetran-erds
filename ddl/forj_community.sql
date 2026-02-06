CREATE TABLE user_activity_sms_reply (
    id text,
    member_id text,
    receiver_id text,
    comment_type text,
    content text,
    created_at text,
    deleted text,
    feed_type text,
    post_id text,
    post_name text,
    post_type text,
    target_id text,
    target_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (member_id) REFERENCES users(id),
    FOREIGN KEY (receiver_id) REFERENCES users(id)
);

CREATE TABLE group_field_option (
    "option" text,
    group_field_id text,
    group_id text,
    PRIMARY KEY ("option", group_field_id, group_id),
    FOREIGN KEY (group_field_id) REFERENCES group_field(id),
    FOREIGN KEY (group_id) REFERENCES group_field(group_id)
);

CREATE TABLE group_field (
    id text,
    group_id text,
    editable text,
    "name" text,
    other_option_flag text,
    placeholder text,
    required text,
    "type" text,
    unique_name text,
    PRIMARY KEY (id, group_id),
    FOREIGN KEY (group_id) REFERENCES groups(id)
);

CREATE TABLE group_member_posting_permission (
    permission text,
    group_id text,
    PRIMARY KEY (permission, group_id),
    FOREIGN KEY (group_id) REFERENCES groups(id)
);

CREATE TABLE groups (
    id text,
    parent_group text,
    primary_admin_user_id text,
    created_at text,
    default_emails_frequency text,
    email text,
    email_comments_to_all text,
    hidden_email text,
    logo_url text,
    members_count text,
    members_visible text,
    mini_thumb_url text,
    "name" text,
    posts_moderation text,
    privacy text,
    requires_approval text,
    small_thumb_url text,
    thumb_url text,
    updated_at text,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (parent_group) REFERENCES groups(id),
    FOREIGN KEY (primary_admin_user_id) REFERENCES users(id)
);

CREATE TABLE user_activity_view (
    id text,
    group_id text,
    member_id text,
    receiver_id text,
    created_at text,
    deleted text,
    feed_type text,
    post_id text,
    post_name text,
    post_type text,
    target_id text,
    target_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (group_id) REFERENCES groups(id),
    FOREIGN KEY (member_id) REFERENCES users(id),
    FOREIGN KEY (receiver_id) REFERENCES users(id)
);

CREATE TABLE user_activity_pending_post (
    id text,
    group_id text,
    receiver_id text,
    created_at text,
    feed_type text,
    post_id text,
    post_name text,
    post_type text,
    target_id text,
    target_name text,
    target_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (group_id) REFERENCES groups(id),
    FOREIGN KEY (receiver_id) REFERENCES users(id)
);

CREATE TABLE user_activity_vote (
    id text,
    group_id text,
    member_id text,
    receiver_id text,
    created_at text,
    deleted text,
    feed_type text,
    poll_name text,
    post_id text,
    post_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (group_id) REFERENCES groups(id),
    FOREIGN KEY (member_id) REFERENCES users(id),
    FOREIGN KEY (receiver_id) REFERENCES users(id)
);

CREATE TABLE user_activity_rsvp (
    id text,
    group_id text,
    member_id text,
    created_at text,
    deleted text,
    event_id text,
    event_name text,
    feed_type text,
    post_id text,
    post_type text,
    "status" text,
    target_id text,
    target_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (group_id) REFERENCES groups(id),
    FOREIGN KEY (member_id) REFERENCES users(id)
);

CREATE TABLE user_activity_reaction (
    id text,
    group_id text,
    member_id text,
    receiver_id text,
    content text,
    created_at text,
    deleted text,
    feed_type text,
    item_id text,
    item_type text,
    post_id text,
    post_name text,
    post_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (group_id) REFERENCES groups(id),
    FOREIGN KEY (member_id) REFERENCES users(id),
    FOREIGN KEY (receiver_id) REFERENCES users(id)
);

CREATE TABLE user_activity_comment (
    id text,
    group_id text,
    member_id text,
    receiver_id text,
    comment_type text,
    content text,
    created_at text,
    deleted text,
    feed_type text,
    post_id text,
    post_name text,
    post_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (group_id) REFERENCES groups(id),
    FOREIGN KEY (member_id) REFERENCES users(id),
    FOREIGN KEY (receiver_id) REFERENCES users(id)
);

CREATE TABLE user_activity (
    id text,
    group_id text,
    member_id text,
    receiver_id text,
    conversation_id text,
    created_at text,
    deleted text,
    feed_type text,
    post_id text,
    post_name text,
    post_type text,
    target_id text,
    target_name text,
    target_type text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (group_id) REFERENCES groups(id),
    FOREIGN KEY (member_id) REFERENCES users(id),
    FOREIGN KEY (receiver_id) REFERENCES users(id)
);

CREATE TABLE user_activity_mention (
    id text,
    group_id text,
    member_id text,
    receiver_id text,
    content text,
    created_at text,
    deleted text,
    feed_type text,
    mention_object text,
    mentioned text,
    post_id text,
    post_name text,
    post_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (group_id) REFERENCES groups(id),
    FOREIGN KEY (member_id) REFERENCES users(id),
    FOREIGN KEY (receiver_id) REFERENCES users(id)
);

CREATE TABLE user_activity_add_member (
    id text,
    group_id text,
    member_id text,
    created_at text,
    deleted text,
    members_count text,
    PRIMARY KEY (id),
    FOREIGN KEY (group_id) REFERENCES groups(id),
    FOREIGN KEY (member_id) REFERENCES users(id)
);

CREATE TABLE user_activity_post_approved (
    id text,
    group_id text,
    receiver_id text,
    created_at text,
    deleted text,
    feed_type text,
    post_id text,
    post_name text,
    post_type text,
    target_id text,
    target_name text,
    target_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (group_id) REFERENCES groups(id),
    FOREIGN KEY (receiver_id) REFERENCES users(id)
);

CREATE TABLE user_activity_join_group (
    id text,
    group_id text,
    member_id text,
    created_at text,
    deleted text,
    PRIMARY KEY (id),
    FOREIGN KEY (group_id) REFERENCES groups(id),
    FOREIGN KEY (member_id) REFERENCES users(id)
);

CREATE TABLE user_activity_conversation (
    id text,
    initiator_id text,
    member_id text,
    participant_id text,
    conversation_id text,
    created_at text,
    deleted text,
    PRIMARY KEY (id),
    FOREIGN KEY (initiator_id) REFERENCES users(id),
    FOREIGN KEY (member_id) REFERENCES users(id),
    FOREIGN KEY (participant_id) REFERENCES users(id)
);

CREATE TABLE user_activity_pending_applicant (
    id text,
    group_id text,
    member_id text,
    created_at text,
    deleted text,
    PRIMARY KEY (id),
    FOREIGN KEY (group_id) REFERENCES groups(id),
    FOREIGN KEY (member_id) REFERENCES users(id)
);

CREATE TABLE user_activity_post_message (
    id text,
    group_id text,
    member_id text,
    receiver_id text,
    comment_type text,
    content text,
    created_at text,
    deleted text,
    feed_type text,
    post_id text,
    post_name text,
    post_type text,
    target_id text,
    target_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (group_id) REFERENCES groups(id),
    FOREIGN KEY (member_id) REFERENCES users(id),
    FOREIGN KEY (receiver_id) REFERENCES users(id)
);

CREATE TABLE user_activity_post (
    id text,
    group_id text,
    member_id text,
    receiver_id text,
    content text,
    created_at text,
    deleted text,
    feed_type text,
    post_id text,
    post_name text,
    post_type text,
    target_id text,
    target_name text,
    target_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (group_id) REFERENCES groups(id),
    FOREIGN KEY (member_id) REFERENCES users(id),
    FOREIGN KEY (receiver_id) REFERENCES users(id)
);

CREATE TABLE user_activity_comment_reply (
    id text,
    group_id text,
    member_id text,
    comment_type text,
    content text,
    created_at text,
    deleted text,
    feed_type text,
    post_id text,
    post_name text,
    post_type text,
    target_id text,
    target_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (group_id) REFERENCES groups(id),
    FOREIGN KEY (member_id) REFERENCES users(id)
);

CREATE TABLE user_group (
    id text,
    user_id text,
    is_admin text,
    last_invited_in text,
    "status" text,
    PRIMARY KEY (id, user_id),
    FOREIGN KEY (id) REFERENCES groups(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE user_custom_field (
    "name" text,
    users_id text,
    "value" text,
    PRIMARY KEY ("name", users_id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    avatar_mini_thumb_url text,
    avatar_small_thumb_url text,
    avatar_thumb_url text,
    avatar_url text,
    created_at text,
    email text,
    first_name text,
    is_registered text,
    last_name text,
    "name" text,
    updated_at text,
    PRIMARY KEY (id)
);
