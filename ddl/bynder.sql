CREATE TABLE collection (
    id text,
    cover_large text,
    cover_thumbnail text,
    date_created text,
    date_modified text,
    description text,
    filename text,
    is_embeddable text,
    is_public text,
    "name" text,
    user_id text,
    user_name text,
    PRIMARY KEY (id)
);

CREATE TABLE asset_item (
    "index" text,
    asset_id text,
    additional_id text,
    file_name text,
    "name" text,
    public_url text,
    "type" text,
    PRIMARY KEY ("index", asset_id),
    FOREIGN KEY (asset_id) REFERENCES asset(id)
);

CREATE TABLE asset_property_option (
    "index" text,
    asset_id text,
    property_option text,
    PRIMARY KEY ("index", asset_id),
    FOREIGN KEY (asset_id) REFERENCES asset(id)
);

CREATE TABLE asset (
    id text,
    brand_id text,
    archive text,
    copyright text,
    date_created text,
    date_modified text,
    date_published text,
    description text,
    extension jsonb,
    file_size text,
    height text,
    id_hash text,
    is_public text,
    limited text,
    "name" text,
    orientation text,
    original text,
    property_3_d_ai_generated jsonb,
    property_access_right jsonb,
    property_asset_family jsonb,
    property_asset_type jsonb,
    property_brand jsonb,
    property_bu_owner jsonb,
    property_campaign_program jsonb,
    property_central_team jsonb,
    property_content_type jsonb,
    property_context_of_use jsonb,
    property_copyright text,
    property_file_type jsonb,
    property_geographical_areas_authorized jsonb,
    property_marketing_program_name jsonb,
    property_selling_type jsonb,
    property_status jsonb,
    property_supports_authorized jsonb,
    thumbnail_mini text,
    thumbnail_thul text,
    thumbnail_webimage text,
    transform_base_url text,
    "type" text,
    user_created text,
    video_preview_url jsonb,
    watermarked text,
    width text,
    PRIMARY KEY (id),
    FOREIGN KEY (brand_id) REFERENCES brand(id)
);

CREATE TABLE sub_brand (
    id text,
    brand_id text,
    description text,
    image text,
    "name" text,
    PRIMARY KEY (id, brand_id),
    FOREIGN KEY (brand_id) REFERENCES brand(id)
);

CREATE TABLE brand (
    id text,
    description text,
    image text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE tags (
    id text,
    media_count text,
    tag_name text,
    PRIMARY KEY (id)
);
