CREATE TABLE group_bsds (
    bsds text,
    group_guid text,
    PRIMARY KEY (bsds, group_guid),
    FOREIGN KEY (group_guid) REFERENCES groups(guid)
);

CREATE TABLE groups (
    guid text,
    organization_guid text,
    created text,
    is_active text,
    modified text,
    "name" text,
    reference jsonb,
    "role" text,
    PRIMARY KEY (guid),
    FOREIGN KEY (organization_guid) REFERENCES organization(guid)
);

CREATE TABLE group_preference (
    group_guid text,
    domain_preference text,
    PRIMARY KEY (group_guid),
    FOREIGN KEY (group_guid) REFERENCES groups(guid)
);

CREATE TABLE organization_bsds (
    bsds text,
    organization_guid text,
    PRIMARY KEY (bsds, organization_guid),
    FOREIGN KEY (organization_guid) REFERENCES organization(guid)
);

CREATE TABLE organization (
    guid text,
    created text,
    is_active text,
    modified text,
    "name" text,
    reference jsonb,
    "role" text,
    tier text,
    tier_display_name text,
    tier_family text,
    PRIMARY KEY (guid)
);

CREATE TABLE qr_code_png (
    id text,
    bitlink_id text,
    group_guid text,
    created text,
    customization_color text,
    customization_exclude_bitly_logo text,
    customization_image_format text,
    customization_is_hidden text,
    customization_logo_image_guid text,
    has_stored text,
    is_customized text,
    is_hidden text,
    link text,
    logo_image_url text,
    modified text,
    qr_code text,
    "type" text,
    PRIMARY KEY (id, bitlink_id),
    FOREIGN KEY (bitlink_id) REFERENCES bitlink(id),
    FOREIGN KEY (group_guid) REFERENCES groups(guid)
);

CREATE TABLE link_click (
    "date" timestamp,
    bitlink_id text,
    clicks text,
    PRIMARY KEY ("date", bitlink_id),
    FOREIGN KEY (bitlink_id) REFERENCES bitlink(id)
);

CREATE TABLE channel (
    guid text,
    created text,
    group_guid text,
    modified text,
    "name" text,
    reference jsonb,
    PRIMARY KEY (guid),
    FOREIGN KEY (guid) REFERENCES groups(guid)
);

CREATE TABLE qr_code_svg (
    id text,
    bitlink_id text,
    group_guid text,
    created text,
    customization_color text,
    customization_exclude_bitly_logo text,
    customization_image_format text,
    customization_is_hidden text,
    customization_logo_image_guid text,
    has_stored text,
    is_customized text,
    is_hidden text,
    link text,
    logo_image_url text,
    modified text,
    qr_code text,
    "type" text,
    PRIMARY KEY (id, bitlink_id),
    FOREIGN KEY (bitlink_id) REFERENCES bitlink(id),
    FOREIGN KEY (group_guid) REFERENCES groups(guid)
);

CREATE TABLE bitlink_tag (
    tags text,
    bitlink_id text,
    group_guid text,
    PRIMARY KEY (tags, bitlink_id, group_guid),
    FOREIGN KEY (bitlink_id) REFERENCES bitlink(id),
    FOREIGN KEY (group_guid) REFERENCES bitlink(group_guid)
);

CREATE TABLE bitlink_launchpad (
    launchpad_id text,
    bitlink_id text,
    group_guid text,
    PRIMARY KEY (launchpad_id, bitlink_id, group_guid),
    FOREIGN KEY (bitlink_id) REFERENCES bitlink(id),
    FOREIGN KEY (group_guid) REFERENCES bitlink(group_guid)
);

CREATE TABLE bitlink_deep_link (
    guid text,
    bitlink_id text,
    group_guid text,
    app_guid text,
    app_uri_path text,
    bitlink text,
    brand_guid text,
    created text,
    install_type text,
    install_url text,
    modified text,
    os text,
    PRIMARY KEY (guid, bitlink_id, group_guid),
    FOREIGN KEY (bitlink_id) REFERENCES bitlink(id),
    FOREIGN KEY (group_guid) REFERENCES bitlink(group_guid)
);

CREATE TABLE bitlink_campaign (
    bitlink_id text,
    campaign_id text,
    group_guid text,
    PRIMARY KEY (bitlink_id, campaign_id, group_guid),
    FOREIGN KEY (bitlink_id) REFERENCES bitlink(id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(guid),
    FOREIGN KEY (group_guid) REFERENCES bitlink(group_guid)
);

CREATE TABLE bitlink (
    id text,
    group_guid text,
    archived text,
    client_id text,
    created_at text,
    created_by text,
    custom_bitlinks jsonb,
    link text,
    long_url text,
    reference jsonb,
    title text,
    PRIMARY KEY (id, group_guid),
    FOREIGN KEY (group_guid) REFERENCES groups(guid)
);

CREATE TABLE user_email (
    email text,
    user_login text,
    is_primary text,
    is_verified text,
    PRIMARY KEY (email, user_login),
    FOREIGN KEY (user_login) REFERENCES users(login)
);

CREATE TABLE users (
    login text,
    default_group_guid text,
    created text,
    is_2_fa_enabled text,
    is_active text,
    is_sso_user text,
    modified text,
    "name" text,
    PRIMARY KEY (login),
    FOREIGN KEY (default_group_guid) REFERENCES groups(guid)
);

CREATE TABLE campaign (
    guid text,
    created_by text,
    group_guid text,
    created text,
    description text,
    modified text,
    "name" text,
    reference jsonb,
    PRIMARY KEY (guid),
    FOREIGN KEY (created_by) REFERENCES users(login),
    FOREIGN KEY (group_guid) REFERENCES groups(guid)
);
