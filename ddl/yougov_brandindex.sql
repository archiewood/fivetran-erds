CREATE TABLE analysis_report (
    "date" text,
    analysis_id text,
    brand_id text,
    custom_sector_label text,
    metric text,
    query_id text,
    region text,
    brand_label text,
    custom_sector_uuid text,
    negatives text,
    negatives_neutrals text,
    neutrals text,
    positives text,
    positives_neutrals text,
    query_index text,
    score text,
    sector_id text,
    sector_label text,
    volume text,
    PRIMARY KEY ("date"),
    FOREIGN KEY (analysis_id) REFERENCES analysis(uuid),
    FOREIGN KEY (brand_id) REFERENCES region_sector_brand(id),
    FOREIGN KEY (custom_sector_label) REFERENCES custom_sector(label),
    FOREIGN KEY (metric) REFERENCES metric("name"),
    FOREIGN KEY (query_id) REFERENCES analysis_query(id),
    FOREIGN KEY (region) REFERENCES region("name")
);

CREATE TABLE analysis_query (
    id text,
    analysis_id text,
    entity_brand_id text,
    entity_region text,
    entity_sector_id text,
    confidence_bound text,
    entity jsonb,
    filters jsonb,
    is_market_scanner text,
    metrics_score_types jsonb,
    moving_average text,
    period_end_date jsonb,
    period_start_date jsonb,
    properties_meta_filter jsonb,
    resample_size text,
    resample_type text,
    scoring text,
    title text,
    uuid text,
    visualization_attributes_color text,
    visualization_attributes_metrics jsonb,
    PRIMARY KEY (id, analysis_id),
    FOREIGN KEY (analysis_id) REFERENCES analysis(id),
    FOREIGN KEY (entity_brand_id) REFERENCES region_sector_brand(id),
    FOREIGN KEY (entity_region) REFERENCES region("name"),
    FOREIGN KEY (entity_sector_id) REFERENCES region_sector(id)
);

CREATE TABLE analysis_tags (
    analysis_id text,
    label text,
    uuid text,
    PRIMARY KEY (analysis_id, label),
    FOREIGN KEY (analysis_id) REFERENCES analysis(id),
    FOREIGN KEY (label) REFERENCES tags(label)
);

CREATE TABLE analysis (
    id text,
    created_at text,
    has_market_scanner text,
    is_listed text,
    is_public text,
    resource_meta_author_email text,
    resource_meta_author_first_name text,
    resource_meta_author_last_name text,
    resource_meta_author_uuid text,
    title text,
    updated_at text,
    uuid text,
    visualization_attributes_chart text,
    visualization_attributes_confidence_bounds text,
    visualization_attributes_options jsonb,
    visualization_attributes_type text,
    visualization_attributes_use_all_entities text,
    visualization_attributes_use_all_filters text,
    visualization_attributes_use_all_metrics text,
    PRIMARY KEY (id)
);

CREATE TABLE ranking (
    id text,
    comparison_period_end_date jsonb,
    comparison_period_start_date jsonb,
    created_at text,
    entities jsonb,
    filters jsonb,
    is_listed text,
    is_market_scanner text,
    is_public text,
    metrics_score_types jsonb,
    period_end_date_days jsonb,
    period_start_date jsonb,
    resource_meta_author_email text,
    resource_meta_author_first_name text,
    resource_meta_author_last_name text,
    resource_meta_author_uuid text,
    scoring text,
    significance_percentages jsonb,
    title text,
    updated_at text,
    uuid text,
    visualization_attributes_type text,
    PRIMARY KEY (id)
);

CREATE TABLE event_tags (
    event_label text,
    label text,
    uuid text,
    PRIMARY KEY (event_label, label),
    FOREIGN KEY (event_label) REFERENCES event(label),
    FOREIGN KEY (label) REFERENCES tags(label)
);

CREATE TABLE event_context (
    "index" text,
    event_label text,
    brand_id text,
    metric text,
    region text,
    sector_id text,
    PRIMARY KEY ("index", event_label),
    FOREIGN KEY (event_label) REFERENCES event(label),
    FOREIGN KEY (brand_id) REFERENCES region_sector_brand(id),
    FOREIGN KEY (metric) REFERENCES metric("name"),
    FOREIGN KEY (region) REFERENCES region("name"),
    FOREIGN KEY (sector_id) REFERENCES region_sector(id)
);

CREATE TABLE event (
    label text,
    created_at text,
    description text,
    end_date text,
    is_global text,
    is_listed text,
    is_public text,
    resource_meta_author_email text,
    resource_meta_author_first_name text,
    resource_meta_author_last_name text,
    resource_meta_author_uuid text,
    updated_at text,
    uuid text,
    PRIMARY KEY (label)
);

CREATE TABLE profiles_dataseries_language (
    code text,
    profiles_dataseries_name text,
    PRIMARY KEY (code, profiles_dataseries_name)
);

CREATE TABLE region_sector (
    id text,
    region text,
    industry_label text,
    is_active text,
    is_market_scanner text,
    label text,
    PRIMARY KEY (id, region),
    FOREIGN KEY (region) REFERENCES region("name"),
    FOREIGN KEY (industry_label) REFERENCES industry_tree(label)
);

CREATE TABLE custom_sector_brand (
    custom_sector_label text,
    region_sector_brand_id text,
    PRIMARY KEY (custom_sector_label, region_sector_brand_id),
    FOREIGN KEY (custom_sector_label) REFERENCES custom_sector(label),
    FOREIGN KEY (region_sector_brand_id) REFERENCES region_sector_brand(id)
);

CREATE TABLE custom_sector_tags (
    custom_sector_label text,
    label text,
    PRIMARY KEY (custom_sector_label, label),
    FOREIGN KEY (custom_sector_label) REFERENCES custom_sector(label),
    FOREIGN KEY (label) REFERENCES tags(label)
);

CREATE TABLE custom_sector (
    label text,
    created_at text,
    has_market_scanner text,
    is_listed text,
    is_public text,
    resource_meta_author_email text,
    resource_meta_author_first_name text,
    resource_meta_author_last_name text,
    resource_meta_author_uuid text,
    updated_at text,
    uuid text,
    PRIMARY KEY (label)
);

CREATE TABLE metric (
    "name" text,
    label text,
    "type" text,
    -- custom_* (dynamic column),
    PRIMARY KEY ("name")
);

CREATE TABLE industry_tree_children_brand (
    id text,
    industry_tree_children_label text,
    industry_tree_label text,
    PRIMARY KEY (id, industry_tree_children_label, industry_tree_label),
    FOREIGN KEY (id) REFERENCES region_sector_brand(id),
    FOREIGN KEY (industry_tree_children_label) REFERENCES industry_tree_children(label),
    FOREIGN KEY (industry_tree_label) REFERENCES industry_tree(label)
);

CREATE TABLE industry_tree_children (
    label text,
    industry_tree_label text,
    children jsonb,
    created_at text,
    parent_uuid text,
    updated_at text,
    uuid text,
    PRIMARY KEY (label, industry_tree_label),
    FOREIGN KEY (industry_tree_label) REFERENCES industry_tree(label)
);

CREATE TABLE industry_tree_brand (
    id text,
    industry_tree_label text,
    PRIMARY KEY (id, industry_tree_label),
    FOREIGN KEY (id) REFERENCES region_sector_brand(id),
    FOREIGN KEY (industry_tree_label) REFERENCES industry_tree(label)
);

CREATE TABLE industry_tree (
    label text,
    region_name text,
    parent_uuid text,
    created_at text,
    updated_at text,
    uuid text,
    PRIMARY KEY (label, region_name),
    FOREIGN KEY (region_name) REFERENCES region("name"),
    FOREIGN KEY (parent_uuid) REFERENCES industry_tree(uuid)
);

CREATE TABLE region (
    "name" text,
    has_market_scanner text,
    label text,
    permitted text,
    PRIMARY KEY ("name")
);

CREATE TABLE region_sector_brand (
    id text,
    region text,
    sector_id text,
    is_active text,
    label text,
    validity_period_end_date text,
    validity_period_start_date text,
    PRIMARY KEY (id, region, sector_id),
    FOREIGN KEY (region) REFERENCES region("name"),
    FOREIGN KEY (sector_id) REFERENCES region_sector(id)
);

CREATE TABLE filter_composite_tags (
    filter_composite_label text,
    label text,
    uuid text,
    PRIMARY KEY (filter_composite_label, label),
    FOREIGN KEY (filter_composite_label) REFERENCES filter_composite(label),
    FOREIGN KEY (label) REFERENCES tags(label)
);

CREATE TABLE filter_composite_response (
    label text,
    filter_composite_label text,
    expression text,
    uuid text,
    PRIMARY KEY (label, filter_composite_label),
    FOREIGN KEY (filter_composite_label) REFERENCES filter_composite(label)
);

CREATE TABLE filter_composite (
    label text,
    region_name text,
    created_at text,
    is_listed text,
    is_public text,
    resource_meta_author_email text,
    resource_meta_author_first_name text,
    resource_meta_author_last_name text,
    resource_meta_author_uuid text,
    updated_at text,
    uuid text,
    valid_in_sectors jsonb,
    PRIMARY KEY (label),
    FOREIGN KEY (region_name) REFERENCES region("name")
);

CREATE TABLE tags (
    label text,
    user_uuid text,
    uuid text,
    visualization_attributes jsonb,
    PRIMARY KEY (label)
);
