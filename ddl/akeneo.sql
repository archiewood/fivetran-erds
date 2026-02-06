CREATE TABLE reference_entity (
    code text,
    image text,
    labels jsonb,
    PRIMARY KEY (code)
);

CREATE TABLE channel (
    code text,
    category_tree text,
    conversion_units jsonb,
    currencies jsonb,
    labels jsonb,
    locales jsonb,
    PRIMARY KEY (code)
);

CREATE TABLE asset_family_transformation (
    "index" text,
    asset_family_code text,
    filename_suffix text,
    label text,
    operations jsonb,
    "source" jsonb,
    target jsonb,
    PRIMARY KEY ("index", asset_family_code),
    FOREIGN KEY (asset_family_code) REFERENCES asset_family(code)
);

CREATE TABLE asset_family_product_link_rule (
    "index" text,
    asset_family_code text,
    assign_assets_to jsonb,
    product_selections jsonb,
    PRIMARY KEY ("index", asset_family_code),
    FOREIGN KEY (asset_family_code) REFERENCES asset_family(code)
);

CREATE TABLE asset_family (
    code text,
    attribute_as_main_media text,
    labels jsonb,
    naming_convention_abort_asset_creation_on_error text,
    naming_convention_pattern text,
    naming_convention_source jsonb,
    sharing_enabled text,
    PRIMARY KEY (code)
);

CREATE TABLE association_type (
    code text,
    is_quantified text,
    is_two_way text,
    labels jsonb,
    PRIMARY KEY (code)
);

CREATE TABLE reference_entity_attribute (
    code text,
    reference_entity text,
    allowed_extensions jsonb,
    decimals_allowed text,
    is_required_for_completeness text,
    is_rich_text_editor text,
    is_textarea text,
    labels jsonb,
    max_characters text,
    max_file_size text,
    max_value text,
    min_value text,
    "type" text,
    validation_regexp text,
    validation_rule text,
    value_per_channel text,
    value_per_locale text,
    PRIMARY KEY (code, reference_entity),
    FOREIGN KEY (reference_entity) REFERENCES reference_entity(code)
);

CREATE TABLE attribute_table_configuration_option (
    "index" text,
    attribute_table_configuration_code text,
    attribute_table_configuration_index text,
    code text,
    labels jsonb,
    PRIMARY KEY ("index", attribute_table_configuration_code, attribute_table_configuration_index),
    FOREIGN KEY (attribute_table_configuration_code) REFERENCES attribute_table_configuration(attribute_code),
    FOREIGN KEY (attribute_table_configuration_index) REFERENCES attribute_table_configuration("index")
);

CREATE TABLE attribute_table_configuration (
    "index" text,
    attribute_code text,
    code text,
    data_type text,
    is_required_for_completeness text,
    labels jsonb,
    validations jsonb,
    PRIMARY KEY ("index", attribute_code),
    FOREIGN KEY (attribute_code) REFERENCES attribute(code)
);

CREATE TABLE attribute (
    code text,
    allowed_extensions jsonb,
    attribute_group text,
    auto_option_sorting text,
    available_locales jsonb,
    date_max text,
    date_min text,
    decimals_allowed text,
    default_metric_unit text,
    default_value text,
    group_labels jsonb,
    guidelines jsonb,
    is_main_identifier text,
    is_read_only text,
    is_unique text,
    labels jsonb,
    localizable text,
    max_characters text,
    max_file_size text,
    metric_family text,
    minimum_input_length text,
    negative_allowed text,
    number_max text,
    number_min text,
    reference_data_name text,
    remove_html_tags text,
    scopable text,
    sort_order text,
    "type" text,
    useable_as_grid_filter text,
    validation_regexp text,
    validation_rule text,
    wysiwyg_enabled text,
    PRIMARY KEY (code)
);

CREATE TABLE product_model_quality_score (
    "index" text,
    product_model_code text,
    data text,
    locale text,
    scope text,
    PRIMARY KEY ("index", product_model_code),
    FOREIGN KEY (product_model_code) REFERENCES product_model(code)
);

CREATE TABLE product_model (
    code text,
    family_code text,
    parent_code text,
    associations jsonb,
    categories jsonb,
    created text,
    family_variant_code text,
    quantified_associations jsonb,
    updated text,
    values jsonb,
    PRIMARY KEY (code),
    FOREIGN KEY (family_code) REFERENCES family(code),
    FOREIGN KEY (parent_code) REFERENCES product_model(code)
);

CREATE TABLE product_media_files (
    _fivetran_id text,
    code text,
    extension text,
    mime_type text,
    original_filename text,
    "size" text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE family_variant (
    code text,
    family_code text,
    labels jsonb,
    variant_attribute_sets jsonb,
    PRIMARY KEY (code, family_code),
    FOREIGN KEY (family_code) REFERENCES family(code)
);

CREATE TABLE product_quality_score (
    "index" text,
    product_uuid text,
    data text,
    locale text,
    scope text,
    PRIMARY KEY ("index", product_uuid),
    FOREIGN KEY (product_uuid) REFERENCES product(uuid)
);

CREATE TABLE product_completeness (
    "index" text,
    product_uuid text,
    data text,
    locale text,
    scope text,
    PRIMARY KEY ("index", product_uuid),
    FOREIGN KEY (product_uuid) REFERENCES product(uuid)
);

CREATE TABLE product (
    uuid text,
    parent_code text,
    associations jsonb,
    categories jsonb,
    created text,
    family_code text,
    groups jsonb,
    is_enabled text,
    quantified_associations jsonb,
    updated text,
    values jsonb,
    PRIMARY KEY (uuid),
    FOREIGN KEY (parent_code) REFERENCES product_model(code)
);

CREATE TABLE reference_entity_attribute_option (
    code text,
    reference_entity_attribute_code text,
    reference_entity_attribute_reference_entity text,
    labels jsonb,
    PRIMARY KEY (code, reference_entity_attribute_code, reference_entity_attribute_reference_entity),
    FOREIGN KEY (reference_entity_attribute_code) REFERENCES reference_entity_attribute(code),
    FOREIGN KEY (reference_entity_attribute_reference_entity) REFERENCES reference_entity_attribute(reference_entity)
);

CREATE TABLE attribute_option (
    code text,
    attribute_code text,
    attribute text,
    labels jsonb,
    sort_order text,
    PRIMARY KEY (code, attribute_code),
    FOREIGN KEY (attribute_code) REFERENCES attribute(code)
);

CREATE TABLE attribute_group_attribute_code (
    attribute_group_code text,
    code text,
    PRIMARY KEY (attribute_group_code, code),
    FOREIGN KEY (attribute_group_code) REFERENCES attribute_group(code),
    FOREIGN KEY (code) REFERENCES attribute(code)
);

CREATE TABLE attribute_group (
    code text,
    attributes jsonb,
    labels jsonb,
    sort_order text,
    PRIMARY KEY (code)
);

CREATE TABLE asset (
    code text,
    asset_family_code text,
    created text,
    updated text,
    values jsonb,
    PRIMARY KEY (code, asset_family_code),
    FOREIGN KEY (asset_family_code) REFERENCES asset_family(code)
);

CREATE TABLE family_attribute_code (
    code text,
    family_code text,
    PRIMARY KEY (code, family_code),
    FOREIGN KEY (code) REFERENCES attribute(code),
    FOREIGN KEY (family_code) REFERENCES family(code)
);

CREATE TABLE family (
    code text,
    attribute_as_image text,
    attribute_as_label text,
    attribute_requirements jsonb,
    labels jsonb,
    PRIMARY KEY (code)
);

CREATE TABLE category (
    code text,
    parent_code text,
    labels jsonb,
    "position" text,
    updated text,
    values jsonb,
    PRIMARY KEY (code),
    FOREIGN KEY (parent_code) REFERENCES category(code)
);

CREATE TABLE reference_entity_record (
    code text,
    reference_entity_code text,
    created text,
    updated text,
    values jsonb,
    PRIMARY KEY (code, reference_entity_code),
    FOREIGN KEY (reference_entity_code) REFERENCES reference_entity(code)
);
