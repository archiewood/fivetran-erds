CREATE TABLE site_allowed_file_type (
    allowed_file_type text,
    site_id text,
    PRIMARY KEY (allowed_file_type, site_id),
    FOREIGN KEY (site_id) REFERENCES site(id)
);

CREATE TABLE site_plan_feature_active (
    feature_active text,
    site_id text,
    PRIMARY KEY (feature_active, site_id),
    FOREIGN KEY (site_id) REFERENCES site(id)
);

CREATE TABLE site_jetpack_module (
    jetpack_module text,
    site_id text,
    PRIMARY KEY (jetpack_module, site_id),
    FOREIGN KEY (site_id) REFERENCES site(id)
);

CREATE TABLE site_user_interaction (
    user_interaction text,
    site_id text,
    PRIMARY KEY (user_interaction, site_id),
    FOREIGN KEY (site_id) REFERENCES site(id)
);

CREATE TABLE site (
    id text,
    description text,
    is_coming_soon text,
    is_core_site_editor_enabled text,
    is_following text,
    is_fse_active text,
    is_fse_eligible text,
    is_multisite text,
    is_private text,
    is_vip text,
    is_wpcom_atomic text,
    jetpack text,
    jetpack_connection text,
    lang text,
    launch_status text,
    logo_id text,
    logo_size jsonb,
    logo_url text,
    meta_links_comments text,
    meta_links_help text,
    meta_links_posts text,
    meta_links_self text,
    meta_links_xmlrpc text,
    "name" text,
    organization_id text,
    p_2_thumbnail_elements text,
    plan_billing_period text,
    plan_expired text,
    plan_is_free text,
    plan_license_key text,
    plan_product_id text,
    plan_product_name text,
    plan_product_name_short text,
    plan_product_slug text,
    plan_user_is_owner text,
    products jsonb,
    quota_percent_used text,
    quota_space_allowed text,
    quota_space_available text,
    quota_space_used text,
    single_user_site text,
    site_migration jsonb,
    site_owner text,
    subscribers_count text,
    update_plugins text,
    update_themes text,
    update_total text,
    update_translations text,
    update_wordpress text,
    url text,
    user_can_manage text,
    visible text,
    was_ecommerce_trial text,
    zendesk_site_meta_addon text,
    zendesk_site_meta_plan text,
    -- capability_* (dynamic column),
    -- option_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE post_metadata (
    id text,
    post_id text,
    "key" text,
    "value" text,
    PRIMARY KEY (id, post_id),
    FOREIGN KEY (post_id) REFERENCES post(id)
);

CREATE TABLE post (
    id text,
    author_id text,
    category_id text,
    site_id text,
    attachment_count text,
    attachments jsonb,
    capabilities_delete_post text,
    capabilities_edit_post text,
    capabilities_publish_post text,
    content text,
    "date" text,
    discussion_comment_count text,
    discussion_comment_status text,
    discussion_comments_open text,
    discussion_ping_status text,
    discussion_pings_open text,
    excerpt text,
    featured_image text,
    format text,
    geo text,
    global_id text,
    guid text,
    i_like text,
    is_following text,
    is_reblogged text,
    like_count text,
    likes_enabled text,
    menu_order text,
    meta_links_help text,
    meta_links_likes text,
    meta_links_replies text,
    meta_links_self text,
    meta_links_site text,
    modified timestamp,
    other_urls jsonb,
    page_template text,
    parent text,
    password text,
    post_thumbnail_guid text,
    post_thumbnail_height text,
    post_thumbnail_id text,
    post_thumbnail_mime_type text,
    post_thumbnail_url text,
    post_thumbnail_width text,
    publicize_urls jsonb,
    sharing_enabled text,
    short_url text,
    slug text,
    "status" text,
    sticky text,
    tags jsonb,
    title text,
    "type" text,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (author_id) REFERENCES users(id),
    FOREIGN KEY (category_id) REFERENCES category(id),
    FOREIGN KEY (site_id) REFERENCES site(id)
);

CREATE TABLE "comment" (
    id text,
    author_id text,
    post_id text,
    site_id text,
    can_moderate text,
    content text,
    "date" text,
    i_like text,
    i_replied text,
    like_count text,
    meta_links_help text,
    meta_links_likes text,
    meta_links_post text,
    meta_links_replies text,
    meta_links_self text,
    meta_links_site text,
    parent jsonb,
    post_link text,
    post_title text,
    post_type text,
    raw_content text,
    short_url text,
    "status" text,
    "type" text,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (author_id) REFERENCES users(id),
    FOREIGN KEY (post_id) REFERENCES post(id),
    FOREIGN KEY (site_id) REFERENCES site(id)
);

CREATE TABLE category (
    id text,
    site_id text,
    description text,
    feed_url text,
    meta_links_help text,
    meta_links_self text,
    meta_links_site text,
    "name" text,
    parent text,
    post_count text,
    slug text,
    PRIMARY KEY (id),
    FOREIGN KEY (site_id) REFERENCES site(id)
);

CREATE TABLE connected_applications_permission (
    "name" text,
    connected_application_id text,
    description text,
    PRIMARY KEY ("name", connected_application_id),
    FOREIGN KEY (connected_application_id) REFERENCES connected_application(id)
);

CREATE TABLE connected_application (
    id text,
    site_id text,
    authorized text,
    description text,
    icon text,
    scope text,
    title text,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (site_id) REFERENCES site(id)
);

CREATE TABLE user_role (
    "role" text,
    user_id text,
    PRIMARY KEY ("role", user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    site_id text,
    avatar_url text,
    email text,
    first_name text,
    ip_address text,
    is_super_admin text,
    last_name text,
    login text,
    "name" text,
    nice_name text,
    profile_url text,
    site_visible text,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (site_id) REFERENCES site(id)
);

CREATE TABLE tags (
    id text,
    site_id text,
    description text,
    feed_url text,
    meta_links_help text,
    meta_links_self text,
    meta_links_site text,
    "name" text,
    post_count text,
    slug text,
    PRIMARY KEY (id),
    FOREIGN KEY (site_id) REFERENCES site(id)
);
