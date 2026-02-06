CREATE TABLE visit_by_trend (
    "date" text,
    api_id text,
    panel_visit text,
    visit text,
    visit_duration_segmentation text,
    PRIMARY KEY ("date", api_id),
    FOREIGN KEY (api_id) REFERENCES entity(api_id)
);

CREATE TABLE entity (
    api_id text,
    address_city text,
    address_country_code text,
    address_formatted_address text,
    address_short_formatted_address text,
    address_state text,
    address_street_name text,
    address_zip_code text,
    category_infocategory text,
    category_infogroup text,
    category_infosub_category text,
    is_flagged text,
    is_permitted text,
    "name" text,
    parent_chain_api_id text,
    parent_chain_name text,
    parent_tag_api_id text,
    parent_tag_name text,
    placer_url text,
    region_cbsa_code text,
    region_cbsa_name text,
    region_code text,
    region_dma_code text,
    region_dma_name text,
    region_state_code text,
    region_state_name text,
    region_type text,
    PRIMARY KEY (api_id)
);

CREATE TABLE sub_entity (
    sub_entity_api_id text,
    entity_api_id text,
    flagged text,
    "name" text,
    region_code text,
    region_type text,
    store_id text,
    PRIMARY KEY (sub_entity_api_id, entity_api_id),
    FOREIGN KEY (entity_api_id) REFERENCES entity(api_id)
);

CREATE TABLE visit_by_hour (
    bins text,
    end_date text,
    start_date text,
    api_id text,
    estimated_foot_traffic text,
    near_by_radius text,
    visit_duration_segmentation text,
    PRIMARY KEY (bins, end_date, start_date, api_id),
    FOREIGN KEY (api_id) REFERENCES entity(api_id)
);

CREATE TABLE visit_by_opening_hour (
    "index" text,
    api_id text,
    "day" text,
    from_hour text,
    to_hour text,
    PRIMARY KEY ("index", api_id),
    FOREIGN KEY (api_id) REFERENCES entity(api_id)
);
