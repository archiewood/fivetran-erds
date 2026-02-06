CREATE TABLE inline_comment_version (
    id text,
    comment_id text,
    comment_body jsonb,
    created_at timestamp,
    PRIMARY KEY (id, comment_id),
    FOREIGN KEY (comment_id) REFERENCES inline_comment(id)
);

CREATE TABLE custom_content_property (
    id text,
    custom_content_id text,
    "key" text,
    "value" text,
    version_created_at text,
    version_message text,
    version_minor_edit text,
    version_number text,
    PRIMARY KEY (id, custom_content_id),
    FOREIGN KEY (custom_content_id) REFERENCES custom_content(id)
);

CREATE TABLE blog_post_version (
    id text,
    blog_post_id text,
    blog_post_body jsonb,
    created_at timestamp,
    page_body jsonb,
    PRIMARY KEY (id, blog_post_id),
    FOREIGN KEY (blog_post_id) REFERENCES blog_post(id)
);

CREATE TABLE footer_comment_version (
    id text,
    comment_id text,
    comment_body jsonb,
    created_at timestamp,
    PRIMARY KEY (id, comment_id),
    FOREIGN KEY (comment_id) REFERENCES footer_comment(id)
);

CREATE TABLE footer_comment (
    id text,
    attachment_id text,
    blog_post_id text,
    page_id text,
    parent_comment_id text,
    "status" text,
    title text,
    version_created_at timestamp,
    version_number text,
    PRIMARY KEY (id),
    FOREIGN KEY (attachment_id) REFERENCES attachment(id),
    FOREIGN KEY (blog_post_id) REFERENCES blog_post(id),
    FOREIGN KEY (page_id) REFERENCES page(id),
    FOREIGN KEY (parent_comment_id) REFERENCES footer_comment(id)
);

CREATE TABLE page_version_detail (
    number text,
    page_id text,
    collaborator jsonb,
    content_type_modifier text,
    created_at text,
    message text,
    minor_edit text,
    next_version text,
    previous_version text,
    PRIMARY KEY (number, page_id),
    FOREIGN KEY (number) REFERENCES page_version(id),
    FOREIGN KEY (page_id) REFERENCES page_version(page_id)
);

CREATE TABLE space_label (
    id text,
    space_id text,
    "name" text,
    prefix text,
    PRIMARY KEY (id, space_id),
    FOREIGN KEY (space_id) REFERENCES space(id)
);

CREATE TABLE space (
    id text,
    created_at text,
    description_plan jsonb,
    description_view jsonb,
    homepage_id text,
    icon_path text,
    "key" text,
    "name" text,
    "status" text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE space_property (
    id text,
    space_id text,
    created_at text,
    created_by text,
    "key" text,
    version_created_at text,
    version_created_by text,
    version_message text,
    version_number text,
    PRIMARY KEY (id, space_id),
    FOREIGN KEY (space_id) REFERENCES space(id)
);

CREATE TABLE child_page (
    id text,
    page_id text,
    space_id text,
    "position" text,
    "status" text,
    title text,
    PRIMARY KEY (id, page_id),
    FOREIGN KEY (page_id) REFERENCES page(id),
    FOREIGN KEY (space_id) REFERENCES space(id)
);

CREATE TABLE attachment_version (
    id text,
    attachment_id text,
    attachment_body jsonb,
    created_at timestamp,
    PRIMARY KEY (id, attachment_id),
    FOREIGN KEY (attachment_id) REFERENCES attachment(id)
);

CREATE TABLE attachment (
    id text,
    blog_post_id text,
    custom_content_id text,
    page_id text,
    "comment" text,
    created_at text,
    file_id text,
    file_size text,
    media_type text,
    media_type_description text,
    "status" text,
    title text,
    version_created_at timestamp,
    version_number text,
    webui_link text,
    PRIMARY KEY (id),
    FOREIGN KEY (blog_post_id) REFERENCES blog_post(id),
    FOREIGN KEY (custom_content_id) REFERENCES custom_content(id),
    FOREIGN KEY (page_id) REFERENCES page(id)
);

CREATE TABLE permitted_footer_comment_operation (
    _fivetran_id text,
    footer_comment_id text,
    operation text,
    target_type text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (footer_comment_id) REFERENCES footer_comment(id)
);

CREATE TABLE page_version (
    id text,
    page_id text,
    created_at timestamp,
    page_body jsonb,
    PRIMARY KEY (id, page_id),
    FOREIGN KEY (page_id) REFERENCES page(id)
);

CREATE TABLE permitted_blog_post_operation (
    _fivetran_id text,
    blog_post_id text,
    operation text,
    target_type text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (blog_post_id) REFERENCES blog_post(id)
);

CREATE TABLE custom_content_version (
    id text,
    custom_id text,
    created_at timestamp,
    custom_body jsonb,
    PRIMARY KEY (id, custom_id),
    FOREIGN KEY (custom_id) REFERENCES custom_content(id)
);

CREATE TABLE permitted_space_operation (
    _fivetran_id text,
    space_id text,
    operation text,
    target_type text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (space_id) REFERENCES space(id)
);

CREATE TABLE blog_post_content_property (
    id text,
    blog_post_id text,
    "key" text,
    "value" text,
    version_created_at text,
    version_message text,
    version_minor_edit text,
    version_number text,
    PRIMARY KEY (id, blog_post_id),
    FOREIGN KEY (blog_post_id) REFERENCES blog_post(id)
);

CREATE TABLE permitted_inline_comment_operation (
    _fivetran_id text,
    inline_comment_id text,
    operation text,
    target_type text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (inline_comment_id) REFERENCES inline_comment(id)
);

CREATE TABLE custom_content_label (
    id text,
    custom_content_id text,
    "name" text,
    prefix text,
    PRIMARY KEY (id, custom_content_id),
    FOREIGN KEY (custom_content_id) REFERENCES custom_content(id)
);

CREATE TABLE attachment_label (
    id text,
    attachment_id text,
    "name" text,
    prefix text,
    PRIMARY KEY (id, attachment_id),
    FOREIGN KEY (attachment_id) REFERENCES attachment(id)
);

CREATE TABLE blog_post_version_detail (
    blog_post_id text,
    number text,
    collaborator jsonb,
    content_type_modifier text,
    created_at text,
    message text,
    minor_edit text,
    next_version text,
    previous_version text,
    PRIMARY KEY (blog_post_id, number),
    FOREIGN KEY (blog_post_id) REFERENCES blog_post_version(blog_post_id),
    FOREIGN KEY (number) REFERENCES blog_post_version(id)
);

CREATE TABLE attachment_version_detail (
    attachment_id text,
    number text,
    collaborator jsonb,
    content_type_modifier text,
    created_at text,
    message text,
    minor_edit text,
    next_version text,
    previous_version text,
    PRIMARY KEY (attachment_id, number),
    FOREIGN KEY (attachment_id) REFERENCES attachment_version(attachment_id),
    FOREIGN KEY (number) REFERENCES attachment_version(id)
);

CREATE TABLE permitted_attachment_operation (
    _fivetran_id text,
    attachment_id text,
    operation text,
    target_type text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (attachment_id) REFERENCES attachment(id)
);

CREATE TABLE page_content_property (
    id text,
    page_id text,
    "key" text,
    version_created_at text,
    version_message text,
    version_minor_edit text,
    version_number text,
    PRIMARY KEY (id, page_id),
    FOREIGN KEY (page_id) REFERENCES page(id)
);

CREATE TABLE footer_comment_version_detail (
    comment_id text,
    number text,
    collaborator jsonb,
    content_type_modifier text,
    created_at text,
    message text,
    minor_edit text,
    next_version text,
    previous_version text,
    PRIMARY KEY (comment_id, number),
    FOREIGN KEY (comment_id) REFERENCES footer_comment_version(comment_id),
    FOREIGN KEY (number) REFERENCES footer_comment_version(id)
);

CREATE TABLE child_custom_content (
    custom_content_id text,
    id text,
    space_id text,
    "status" text,
    title text,
    "type" text,
    PRIMARY KEY (custom_content_id, id),
    FOREIGN KEY (custom_content_id) REFERENCES custom_content(id),
    FOREIGN KEY (id) REFERENCES custom_content(id),
    FOREIGN KEY (space_id) REFERENCES space(id)
);

CREATE TABLE blog_post_label (
    id text,
    blog_post_id text,
    "name" text,
    prefix text,
    PRIMARY KEY (id, blog_post_id),
    FOREIGN KEY (blog_post_id) REFERENCES blog_post(id)
);

CREATE TABLE blog_post (
    id text,
    space_id text,
    created_at timestamp,
    "status" text,
    title text,
    version_created_at timestamp,
    version_number text,
    PRIMARY KEY (id),
    FOREIGN KEY (space_id) REFERENCES space(id)
);

CREATE TABLE label (
    id text,
    "name" text,
    prefix text,
    PRIMARY KEY (id)
);

CREATE TABLE folder (
    id text,
    space_id text,
    parent_id text,
    author_id text,
    created_at text,
    owner_id text,
    "position" text,
    "status" text,
    title text,
    version_created_at text,
    version_message text,
    version_minor_edit text,
    version_number text,
    PRIMARY KEY (id, space_id),
    FOREIGN KEY (space_id) REFERENCES space(id),
    FOREIGN KEY (parent_id) REFERENCES page(id)
);

CREATE TABLE task (
    id text,
    blog_post_id text,
    page_id text,
    space_id text,
    assigned_to text,
    atlas_doc_format jsonb,
    completed_at text,
    completed_by text,
    created_at text,
    created_by text,
    due_at text,
    local_id text,
    "status" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (blog_post_id) REFERENCES blog_post(id),
    FOREIGN KEY (page_id) REFERENCES page(id),
    FOREIGN KEY (space_id) REFERENCES space(id)
);

CREATE TABLE custom_content_version_detail (
    custom_id text,
    number text,
    collaborator jsonb,
    content_type_modifier text,
    created_at text,
    message text,
    minor_edit text,
    next_version text,
    previous_version text,
    PRIMARY KEY (custom_id, number),
    FOREIGN KEY (custom_id) REFERENCES custom_content_version(custom_id),
    FOREIGN KEY (number) REFERENCES custom_content_version(id)
);

CREATE TABLE inline_comment_version_detail (
    comment_id text,
    number text,
    collaborator jsonb,
    content_type_modifier text,
    created_at text,
    message text,
    minor_edit text,
    next_version text,
    previous_version text,
    PRIMARY KEY (comment_id, number),
    FOREIGN KEY (comment_id) REFERENCES inline_comment_version(comment_id),
    FOREIGN KEY (number) REFERENCES inline_comment_version(id)
);

CREATE TABLE permitted_custom_content_operation (
    _fivetran_id text,
    custom_content_id text,
    operation text,
    target_type text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (custom_content_id) REFERENCES custom_content(id)
);

CREATE TABLE permitted_page_operation (
    _fivetran_id text,
    page_id text,
    operation text,
    target_type text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (page_id) REFERENCES page(id)
);

CREATE TABLE attachment_content_property (
    id text,
    attachment_id text,
    "key" text,
    version_created_at text,
    version_message text,
    version_minor_edit text,
    version_number text,
    PRIMARY KEY (id, attachment_id),
    FOREIGN KEY (attachment_id) REFERENCES attachment(id)
);

CREATE TABLE page (
    id text,
    parent_id text,
    space_id text,
    created_at timestamp,
    parent_type text,
    "position" text,
    "status" text,
    title text,
    version_created_at timestamp,
    version_number text,
    PRIMARY KEY (id),
    FOREIGN KEY (parent_id) REFERENCES page(id),
    FOREIGN KEY (space_id) REFERENCES space(id)
);

CREATE TABLE custom_content (
    id text,
    blog_post_id text,
    page_id text,
    space_id text,
    created_at timestamp,
    "status" text,
    title text,
    "type" text,
    version_created_at timestamp,
    version_number text,
    PRIMARY KEY (id),
    FOREIGN KEY (blog_post_id) REFERENCES blog_post(id),
    FOREIGN KEY (page_id) REFERENCES page(id),
    FOREIGN KEY (space_id) REFERENCES space(id)
);

CREATE TABLE space_permission (
    id text,
    space_id text,
    operation_key text,
    operation_target_type text,
    principal_id text,
    principal_type text,
    PRIMARY KEY (id, space_id),
    FOREIGN KEY (space_id) REFERENCES space(id)
);

CREATE TABLE page_label (
    id text,
    page_id text,
    PRIMARY KEY (id, page_id),
    FOREIGN KEY (page_id) REFERENCES page(id)
);

CREATE TABLE inline_comment (
    id text,
    blog_post_id text,
    page_id text,
    parent_comment_id text,
    resolution_last_modified_at text,
    resolution_last_modifier_id text,
    resolution_status text,
    "status" text,
    title text,
    version_created_at timestamp,
    version_number text,
    -- properties_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (blog_post_id) REFERENCES blog_post(id),
    FOREIGN KEY (page_id) REFERENCES page(id),
    FOREIGN KEY (parent_comment_id) REFERENCES inline_comment(id)
);
