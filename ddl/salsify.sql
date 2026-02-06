CREATE TABLE record_type (
    _fivetran_id text,
    created_at text,
    id text,
    localized_name text,
    "name" text,
    updated_at text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE product_digital_asset (
    digital_asset_id text,
    product_id text,
    PRIMARY KEY (digital_asset_id, product_id),
    FOREIGN KEY (digital_asset_id) REFERENCES digital_asset(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE product (
    id text,
    parent_id text,
    created_at text,
    profile_asset_id text,
    relation_updated_at text,
    system_id text,
    updated_at text,
    version text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (parent_id) REFERENCES product(id)
);

CREATE TABLE record_digital_asset (
    digital_asset_id text,
    record_id text,
    PRIMARY KEY (digital_asset_id, record_id),
    FOREIGN KEY (digital_asset_id) REFERENCES digital_asset(id),
    FOREIGN KEY (record_id) REFERENCES record(id)
);

CREATE TABLE record (
    id text,
    parent_id text,
    created_at text,
    relation_updated_at text,
    system_id text,
    updated_at text,
    version text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (parent_id) REFERENCES record(id)
);

CREATE TABLE digital_asset (
    id text,
    asset_height text,
    asset_resource_type text,
    asset_width text,
    bytes text,
    created_at text,
    etag text,
    filename text,
    format text,
    "name" text,
    source_url text,
    "status" text,
    system_id text,
    updated_at text,
    url text,
    widen_file_upload_date text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id)
);
