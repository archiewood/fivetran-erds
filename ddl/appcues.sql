CREATE TABLE checklist (
    id text,
    account_id text,
    cloned_by text,
    cloned_from text,
    completion_flow_id text,
    created_at text,
    created_by text,
    internal_name text,
    intro_flow_id text,
    is_dismissable text,
    is_sequential text,
    items jsonb,
    published text,
    published_and_dirty text,
    published_at text,
    published_by text,
    rule jsonb,
    "state" text,
    style_beacon_background_color text,
    style_beacon_horizontal_offset text,
    style_beacon_icon text,
    style_beacon_text_color text,
    style_beacon_vertical_offset text,
    style_completion_icon text,
    style_header_icon text,
    style_position text,
    style_primary_color text,
    style_success_color text,
    style_success_image_code text,
    style_type text,
    text_token_beacon_text text,
    text_token_completion_dismiss_text text,
    text_token_completion_text text,
    text_token_completion_title text,
    text_token_description_text text,
    text_token_dismiss_cancel_text text,
    text_token_dismiss_confirm_text text,
    text_token_dismiss_prompt_text text,
    text_token_dismiss_text text,
    text_token_header_text text,
    title text,
    "type" text,
    unpublished_at text,
    unpublished_by text,
    updated_at text,
    updated_by text,
    PRIMARY KEY (id)
);

CREATE TABLE segment (
    id text,
    created_at text,
    created_by text,
    description text,
    "name" text,
    updated_at text,
    updated_by text,
    PRIMARY KEY (id)
);

CREATE TABLE launch_pad_step (
    id text,
    launch_pad_id text,
    actions jsonb,
    children jsonb,
    content jsonb,
    content_type text,
    created_at text,
    created_by text,
    "index" text,
    "name" text,
    parent_id text,
    "rows" jsonb,
    traits jsonb,
    "type" text,
    updated_at text,
    updated_by text,
    PRIMARY KEY (id, launch_pad_id),
    FOREIGN KEY (launch_pad_id) REFERENCES launch_pad(id)
);

CREATE TABLE launch_pad_trait (
    "index" text,
    launch_pad_id text,
    "type" text,
    PRIMARY KEY ("index", launch_pad_id),
    FOREIGN KEY (launch_pad_id) REFERENCES launch_pad(id)
);

CREATE TABLE launch_pad (
    id text,
    account_id text,
    app_id text,
    contains_localized_block text,
    created_at text,
    created_by text,
    experiment text,
    frequency text,
    locked_for_localization text,
    "name" text,
    platform text,
    preview_url text,
    public_name text,
    published text,
    published_at text,
    schema_version text,
    tag_ids jsonb,
    tags jsonb,
    theme text,
    "type" text,
    updated_at text,
    updated_by text,
    url text,
    PRIMARY KEY (id)
);

CREATE TABLE flow (
    id text,
    created_at text,
    created_by text,
    frequency text,
    "name" text,
    published text,
    published_at text,
    updated_at text,
    updated_by text,
    PRIMARY KEY (id)
);

CREATE TABLE pin_step (
    id text,
    pin_id text,
    actions jsonb,
    content jsonb,
    content_type text,
    created_at text,
    created_by text,
    "index" text,
    "name" text,
    parent_id text,
    "type" text,
    updated_at text,
    updated_by text,
    PRIMARY KEY (id, pin_id),
    FOREIGN KEY (pin_id) REFERENCES pin(id)
);

CREATE TABLE pin_trait (
    "type" text,
    pin_id text,
    PRIMARY KEY ("type", pin_id),
    FOREIGN KEY (pin_id) REFERENCES pin(id)
);

CREATE TABLE pin (
    id text,
    account_id text,
    app_id text,
    created_at text,
    created_by text,
    experiment text,
    frequency text,
    locked_for_localization text,
    "name" text,
    platform text,
    preview_url text,
    published text,
    published_at text,
    schema_version text,
    "state" text,
    tags jsonb,
    theme text,
    "type" text,
    updated_at text,
    updated_by text,
    url text,
    PRIMARY KEY (id)
);

CREATE TABLE banner_step_trait (
    "index" text,
    banner_id text,
    banner_step_id text,
    config jsonb,
    "type" text,
    PRIMARY KEY ("index", banner_id, banner_step_id),
    FOREIGN KEY (banner_id) REFERENCES banner_step(banner_id),
    FOREIGN KEY (banner_step_id) REFERENCES banner_step(id)
);

CREATE TABLE banner_step (
    id text,
    banner_id text,
    actions jsonb,
    children jsonb,
    content jsonb,
    content_type text,
    created_at text,
    created_by text,
    "index" text,
    "name" text,
    parent_id text,
    "rows" jsonb,
    "type" text,
    updated_at text,
    updated_by text,
    PRIMARY KEY (id, banner_id),
    FOREIGN KEY (banner_id) REFERENCES banner(id)
);

CREATE TABLE banner_trait (
    "index" text,
    banner_id text,
    config jsonb,
    "type" text,
    PRIMARY KEY ("index", banner_id),
    FOREIGN KEY (banner_id) REFERENCES banner(id)
);

CREATE TABLE banner (
    id text,
    account_id text,
    app_id text,
    contains_localized_block text,
    created_at text,
    created_by text,
    created_by_email text,
    experiment text,
    frequency text,
    locked_for_localization text,
    "name" text,
    platform text,
    preview_url text,
    public_name text,
    published text,
    published_and_dirty text,
    published_at text,
    schema_version text,
    tag_ids jsonb,
    tags jsonb,
    theme text,
    "type" text,
    updated_at text,
    updated_by text,
    updated_by_email text,
    url text,
    PRIMARY KEY (id)
);

CREATE TABLE tags (
    id text,
    created_at text,
    created_by text,
    "name" text,
    updated_at text,
    updated_by text,
    url text,
    PRIMARY KEY (id)
);

CREATE TABLE mobile_step (
    id text,
    mobile_id text,
    actions jsonb,
    content jsonb,
    content_type text,
    created_at text,
    created_by text,
    "index" text,
    "name" text,
    parent_id text,
    "type" text,
    updated_at text,
    updated_by text,
    PRIMARY KEY (id, mobile_id),
    FOREIGN KEY (mobile_id) REFERENCES mobile(id)
);

CREATE TABLE mobile_trait (
    "type" text,
    mobile_id text,
    PRIMARY KEY ("type", mobile_id),
    FOREIGN KEY (mobile_id) REFERENCES mobile(id)
);

CREATE TABLE mobile (
    id text,
    account_id text,
    app_id text,
    created_at text,
    created_by text,
    experiment text,
    frequency text,
    locked_for_localization text,
    "name" text,
    platform text,
    preview_url text,
    published text,
    published_at text,
    schema_version text,
    "state" text,
    tags jsonb,
    theme text,
    "type" text,
    updated_at text,
    updated_by text,
    url text,
    PRIMARY KEY (id)
);

CREATE TABLE event (
    _fivetran_id text,
    attributes jsonb,
    id text,
    "name" text,
    timestamps text,
    user_id text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE user_profile (
    _fivetran_id text,
    email text,
    first_name text,
    last_name text,
    user_id text,
    -- custom_* (dynamic column),
    PRIMARY KEY (_fivetran_id)
);
