CREATE TABLE measure_group (
    catalog_identifier text,
    id text,
    "index" text,
    parent_id text,
    description text,
    title text,
    PRIMARY KEY (catalog_identifier, id, "index"),
    FOREIGN KEY (parent_id) REFERENCES measure_group(id)
);

CREATE TABLE provenance (
    "index" text,
    catalog_identifier text,
    property_identifier text,
    title text,
    url text,
    PRIMARY KEY ("index", catalog_identifier, property_identifier),
    FOREIGN KEY (catalog_identifier) REFERENCES property(catalog_identifier),
    FOREIGN KEY (property_identifier) REFERENCES property(identifier)
);

CREATE TABLE related_source (
    "index" text,
    catalog_identifier text,
    property_identifier text,
    title text,
    url text,
    PRIMARY KEY ("index", catalog_identifier, property_identifier),
    FOREIGN KEY (catalog_identifier) REFERENCES property(catalog_identifier),
    FOREIGN KEY (property_identifier) REFERENCES property(identifier)
);

CREATE TABLE distribution (
    "index" text,
    catalog_identifier text,
    property_identifier text,
    access_url text,
    download_url text,
    format text,
    languages text,
    media_type text,
    PRIMARY KEY ("index", catalog_identifier, property_identifier),
    FOREIGN KEY (catalog_identifier) REFERENCES property(catalog_identifier),
    FOREIGN KEY (property_identifier) REFERENCES property(identifier)
);

CREATE TABLE property (
    catalog_identifier text,
    identifier text,
    authority text,
    catalog text,
    contact_point text,
    dataset_type text,
    description text,
    frequency text,
    graph_types text,
    languages text,
    license text,
    long_descrition text,
    modification_date text,
    modified text,
    observation_count text,
    observations_modified text,
    publisher text,
    release_date text,
    "source" text,
    "status" text,
    summary text,
    temporal_coverage text,
    title text,
    version text,
    version_notes text,
    version_reason text,
    PRIMARY KEY (catalog_identifier, identifier)
);

CREATE TABLE measure_code (
    catalog_identifier text,
    identifier text,
    "index" text,
    measure_group_id text,
    data_type text,
    decimal text,
    description text,
    presentation_type text,
    title text,
    unit text,
    PRIMARY KEY (catalog_identifier, identifier, "index"),
    FOREIGN KEY (measure_group_id) REFERENCES measure_group(id)
);

CREATE TABLE industries_branches_sbi_2008_code (
    catalog_identifier text,
    identifier text,
    "index" text,
    description text,
    dimention_group_id text,
    title text,
    PRIMARY KEY (catalog_identifier, identifier, "index")
);

CREATE TABLE perioden_codes (
    catalog_identifier text,
    identifier text,
    "index" text,
    description text,
    dimensions_group_id text,
    "status" text,
    title text,
    PRIMARY KEY (catalog_identifier, identifier, "index")
);

CREATE TABLE dimensions (
    catalog_identifier text,
    identifier text,
    contains_codes text,
    contains_groups text,
    description text,
    kind text,
    map_year text,
    release_policy text,
    title text,
    PRIMARY KEY (catalog_identifier, identifier)
);

CREATE TABLE observation (
    catalog_identifier text,
    id text,
    measure text,
    perioden text,
    industries_branches_sbi_2008 text,
    string_value text,
    "value" text,
    value_attribute text,
    PRIMARY KEY (catalog_identifier, id),
    FOREIGN KEY (measure) REFERENCES measure_code(identifier),
    FOREIGN KEY (perioden) REFERENCES perioden_codes(identifier)
);

CREATE TABLE industries_branches_sbi_2008_group (
    catalog_identifier text,
    id text,
    "index" text,
    parent_id text,
    description text,
    title text,
    PRIMARY KEY (catalog_identifier, id, "index"),
    FOREIGN KEY (parent_id) REFERENCES industries_branches_sbi_2008_group(id)
);

CREATE TABLE perioden_groups (
    catalog_identifier text,
    id text,
    "index" text,
    description text,
    parent_id text,
    title text,
    PRIMARY KEY (catalog_identifier, id, "index")
);
