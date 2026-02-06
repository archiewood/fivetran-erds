CREATE TABLE event_insert_user_role (
    event_id text,
    insert_user_role_id text,
    PRIMARY KEY (event_id, insert_user_role_id),
    FOREIGN KEY (event_id) REFERENCES event(id),
    FOREIGN KEY (insert_user_role_id) REFERENCES users(id)
);

CREATE TABLE event_insert_user_badge (
    "index" text,
    event_id text,
    badge_id text,
    date_inserted text,
    "name" text,
    photo_url text,
    url text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE event_update_user_badge (
    "index" text,
    event_id text,
    badge_id text,
    date_inserted text,
    "name" text,
    photo_url text,
    url text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE event (
    id text,
    insert_user_id text,
    last_comment_user_id text,
    update_user_id text,
    all_day_event text,
    body text,
    cta_is_external text,
    cta_label text,
    cta_url text,
    date_ends text,
    date_inserted text,
    date_starts timestamp,
    date_updated text,
    display_organizer text,
    excerpt text,
    foreign_id text,
    foreign_subtype text,
    foreign_type text,
    image_alt text,
    image_url text,
    image_url_src_set jsonb,
    location text,
    location_url text,
    "name" text,
    parent_record_id text,
    parent_record_type text,
    permission_attend text,
    permission_create text,
    permission_edit text,
    permission_member text,
    permission_organizer text,
    permission_view text,
    safe_location_url text,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (insert_user_id) REFERENCES users(id),
    FOREIGN KEY (last_comment_user_id) REFERENCES users(id),
    FOREIGN KEY (update_user_id) REFERENCES users(id)
);

CREATE TABLE comment_insert_user_badge (
    "index" text,
    comment_id text,
    badge_id text,
    date_inserted text,
    "name" text,
    photo_url text,
    url text,
    PRIMARY KEY ("index", comment_id),
    FOREIGN KEY (comment_id) REFERENCES "comment"(id)
);

CREATE TABLE comment_insert_user_role (
    comment_id text,
    insert_user_role_id text,
    PRIMARY KEY (comment_id, insert_user_role_id),
    FOREIGN KEY (comment_id) REFERENCES "comment"(id),
    FOREIGN KEY (insert_user_role_id) REFERENCES users(id)
);

CREATE TABLE comment_reaction (
    comment_id text,
    tag_id text,
    class text,
    count text,
    has_reacted text,
    reaction_value text,
    PRIMARY KEY (comment_id, tag_id),
    FOREIGN KEY (comment_id) REFERENCES "comment"(id),
    FOREIGN KEY (tag_id) REFERENCES tags(id)
);

CREATE TABLE comment_update_user_badge (
    "index" text,
    comment_id text,
    badge_id text,
    date_inserted text,
    "name" text,
    photo_url text,
    url text,
    PRIMARY KEY ("index", comment_id),
    FOREIGN KEY (comment_id) REFERENCES "comment"(id)
);

CREATE TABLE "comment" (
    id text,
    category_id text,
    discussion_id text,
    insert_user_id text,
    update_user_id text,
    body text,
    date_inserted timestamp,
    date_updated text,
    depth text,
    format text,
    "name" text,
    parent_record_id text,
    parent_record_type text,
    score text,
    url text,
    -- report_meta_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (category_id) REFERENCES category(id),
    FOREIGN KEY (discussion_id) REFERENCES discussion(id),
    FOREIGN KEY (insert_user_id) REFERENCES users(id),
    FOREIGN KEY (update_user_id) REFERENCES users(id)
);

CREATE TABLE category_allowed_discussion_type (
    "index" text,
    category_id text,
    allowed_discussion_type text,
    PRIMARY KEY ("index", category_id),
    FOREIGN KEY (category_id) REFERENCES category(id)
);

CREATE TABLE category_breadcrumb (
    "index" text,
    category_id text,
    "name" text,
    url text,
    PRIMARY KEY ("index", category_id),
    FOREIGN KEY (category_id) REFERENCES category(id)
);

CREATE TABLE category_children (
    "index" text,
    category_id text,
    last_post_comment_id text,
    last_post_discussion_id text,
    last_post_insert_user_id text,
    children jsonb,
    PRIMARY KEY ("index", category_id),
    FOREIGN KEY (category_id) REFERENCES category(id),
    FOREIGN KEY (last_post_comment_id) REFERENCES "comment"(id),
    FOREIGN KEY (last_post_discussion_id) REFERENCES discussion(id),
    FOREIGN KEY (last_post_insert_user_id) REFERENCES users(id)
);

CREATE TABLE category (
    id text,
    last_post_insert_user_id text,
    parent_id text,
    custom_permissions text,
    date_inserted text,
    depth text,
    description text,
    display_as text,
    featured text,
    followed text,
    icon_url text,
    icon_url_src_set_10 text,
    icon_url_src_set_1200 text,
    icon_url_src_set_1600 text,
    icon_url_src_set_300 text,
    icon_url_src_set_800 text,
    is_archived text,
    last_post_date_inserted text,
    last_post_discussion_id text,
    last_post_name text,
    last_post_url text,
    "name" text,
    permission jsonb,
    sort text,
    url text,
    urlcode text,
    PRIMARY KEY (id),
    FOREIGN KEY (last_post_insert_user_id) REFERENCES users(id),
    FOREIGN KEY (parent_id) REFERENCES category(id)
);

CREATE TABLE reaction (
    _fivetran_id text,
    tag_id text,
    active text,
    class text,
    custom text,
    description text,
    hidden text,
    "name" text,
    points text,
    reaction_value text,
    sort text,
    url_code text,
    -- attributes_* (dynamic column),
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (tag_id) REFERENCES tags(id)
);

CREATE TABLE search_insert_user_badge (
    "index" text,
    search_id text,
    badge_id text,
    date_inserted text,
    "name" text,
    photo_url text,
    url text,
    PRIMARY KEY ("index", search_id),
    FOREIGN KEY (search_id) REFERENCES search(id)
);

CREATE TABLE search_insert_user_role (
    insert_user_role_id text,
    search_id text,
    PRIMARY KEY (insert_user_role_id, search_id),
    FOREIGN KEY (insert_user_role_id) REFERENCES users(id),
    FOREIGN KEY (search_id) REFERENCES search(id)
);

CREATE TABLE search_tag (
    search_id text,
    tag_id text,
    PRIMARY KEY (search_id, tag_id),
    FOREIGN KEY (search_id) REFERENCES search(id),
    FOREIGN KEY (tag_id) REFERENCES tags(id)
);

CREATE TABLE search_update_user_badge (
    "index" text,
    search_id text,
    badge_id text,
    date_inserted text,
    "name" text,
    photo_url text,
    url text,
    PRIMARY KEY ("index", search_id),
    FOREIGN KEY (search_id) REFERENCES search(id)
);

CREATE TABLE search (
    id text,
    category_id text,
    discussion_id text,
    insert_user_id text,
    update_user_id text,
    body text,
    body_plain_text text,
    date_inserted timestamp,
    date_updated text,
    excerpt text,
    image text,
    is_foreign text,
    legacy_type text,
    "name" text,
    record_type text,
    scope text,
    score text,
    site_domain text,
    site_id text,
    subquery_match_count text,
    "type" text,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (category_id) REFERENCES category(id),
    FOREIGN KEY (discussion_id) REFERENCES discussion(id),
    FOREIGN KEY (insert_user_id) REFERENCES users(id),
    FOREIGN KEY (update_user_id) REFERENCES users(id)
);

CREATE TABLE discussion_insert_user_badge (
    "index" text,
    discussion_id text,
    badge_id text,
    date_inserted text,
    "name" text,
    photo_url text,
    url text,
    PRIMARY KEY ("index", discussion_id),
    FOREIGN KEY (discussion_id) REFERENCES discussion(id)
);

CREATE TABLE discussion_last_user_badge (
    "index" text,
    discussion_id text,
    badge_id text,
    date_inserted text,
    "name" text,
    photo_url text,
    url text,
    PRIMARY KEY ("index", discussion_id),
    FOREIGN KEY (discussion_id) REFERENCES discussion(id)
);

CREATE TABLE discussion_tag (
    discussion_id text,
    tag_id text,
    PRIMARY KEY (discussion_id, tag_id),
    FOREIGN KEY (discussion_id) REFERENCES discussion(id),
    FOREIGN KEY (tag_id) REFERENCES tags(id)
);

CREATE TABLE discussion_update_user_badge (
    "index" text,
    discussion_id text,
    badge_id text,
    date_inserted text,
    "name" text,
    photo_url text,
    url text,
    PRIMARY KEY ("index", discussion_id),
    FOREIGN KEY (discussion_id) REFERENCES discussion(id)
);

CREATE TABLE discussion (
    id text,
    category_id text,
    insert_user_id text,
    last_user_id text,
    resolved_user_id text,
    update_user_id text,
    announce text,
    body text,
    bookmarked text,
    canonical_url text,
    closed text,
    count_unread text,
    count_views text,
    date_inserted timestamp,
    date_last_comment text,
    date_updated text,
    dismissed text,
    excerpt text,
    format text,
    hot text,
    image_alt text,
    image_url text,
    internal_status_id text,
    internal_status_name text,
    internal_status_record_sub_type text,
    internal_status_record_type text,
    internal_status_state text,
    last_post_comment_id text,
    last_post_discussion_id text,
    "name" text,
    pinned text,
    resolved text,
    score text,
    sink text,
    snippet text,
    status_id text,
    status_name text,
    status_record_sub_type text,
    status_record_type text,
    status_state text,
    unread text,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (category_id) REFERENCES category(id),
    FOREIGN KEY (insert_user_id) REFERENCES users(id),
    FOREIGN KEY (last_user_id) REFERENCES users(id),
    FOREIGN KEY (resolved_user_id) REFERENCES users(id),
    FOREIGN KEY (update_user_id) REFERENCES users(id)
);

CREATE TABLE "session" (
    session_id text,
    users_id text,
    date_expires text,
    date_inserted text,
    date_updated text,
    PRIMARY KEY (session_id, users_id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE user_role (
    role_id text,
    user_id text,
    "name" text,
    PRIMARY KEY (role_id, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    banned text,
    bypass_spam text,
    count_visits text,
    date_inserted timestamp,
    date_last_active text,
    date_updated text,
    email text,
    email_confirmed text,
    extended_bio text,
    extended_care_planning text,
    extended_care_projects text,
    extended_concierge text,
    extended_group text,
    extended_partner text,
    hash_method text,
    insert_ip_address text,
    is_admin text,
    is_super_admin text,
    is_sys_admin text,
    label text,
    last_ip_address text,
    "name" text,
    photo_url text,
    points text,
    private text,
    profile_fields_bio text,
    profile_fields_care_planning text,
    profile_fields_care_projects text,
    profile_fields_concierge text,
    profile_fields_group text,
    profile_fields_partner text,
    profile_photo_url text,
    rank_id text,
    rank_name text,
    rank_user_title text,
    show_email text,
    sso_id text,
    url text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE tags (
    id text,
    parent_id text,
    "name" text,
    "type" text,
    url text,
    url_code text,
    PRIMARY KEY (id),
    FOREIGN KEY (parent_id) REFERENCES tags(id)
);
