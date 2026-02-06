CREATE TABLE processed_task_count_value (
    id text,
    realm_id text,
    closed text,
    created_at text,
    latest_task_update_datetime text,
    oldest_open_task_datetime text,
    open_task_count text,
    pending text,
    realm_name text,
    realm_tier text,
    total text,
    "type" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (realm_id) REFERENCES realm(id)
);

CREATE TABLE processed_task_count_values_resource (
    id text,
    parent_id text,
    explicit_value text,
    "name" text,
    tier text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (parent_id) REFERENCES processed_task_count_values_resource(id)
);

CREATE TABLE users (
    id text,
    created_at text,
    email text,
    "name" text,
    "status" text,
    "type" text,
    updated text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE user_resource (
    id text,
    parent_id text,
    explicit_value text,
    "name" text,
    tier text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (parent_id) REFERENCES user_resource(id)
);

CREATE TABLE scorecard_order_override (
    id text,
    scorecard_id text,
    "type" text,
    "value" text,
    PRIMARY KEY (id, scorecard_id),
    FOREIGN KEY (scorecard_id) REFERENCES scorecard(id)
);

CREATE TABLE scorecard_value_label (
    "index" text,
    scorecard_id text,
    label text,
    "value" text,
    PRIMARY KEY ("index", scorecard_id),
    FOREIGN KEY (scorecard_id) REFERENCES scorecard(id)
);

CREATE TABLE scorecard (
    id text,
    owner_realm_id text,
    active text,
    created_at text,
    edition_id text,
    has_assessments text,
    has_scores text,
    "name" text,
    "type" text,
    updated_at text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (owner_realm_id) REFERENCES realm(id)
);

CREATE TABLE scorecard_resource (
    id text,
    parent_id text,
    config_display_percentage text,
    config_max_score text,
    config_min_score text,
    created_at text,
    deleted_at text,
    edition_type text,
    explicit_value text,
    image text,
    latest_id text,
    links_self text,
    "name" text,
    owner_realm_id text,
    "status" text,
    tier text,
    "type" text,
    updated_at text,
    user_can_edit text,
    PRIMARY KEY (id),
    FOREIGN KEY (parent_id) REFERENCES scorecard_resource(id)
);

CREATE TABLE scored_value (
    id text,
    assessment_id text,
    scorecard_id text,
    calculated_score text,
    checklist_id text,
    checkpoint_id text,
    created_at text,
    criteria text,
    depth text,
    display_score text,
    display_value text,
    filters text,
    images text,
    "name" text,
    notes text,
    orders text,
    "status" text,
    superset_id text,
    system_id text,
    template_score_id text,
    template_unchanged text,
    "type" text,
    updated_at timestamp,
    "value" text,
    PRIMARY KEY (id),
    FOREIGN KEY (assessment_id) REFERENCES assessment(id),
    FOREIGN KEY (scorecard_id) REFERENCES scorecard(id)
);

CREATE TABLE task (
    id text,
    scorecard_score_id text,
    checkpoint_id text,
    client_id text,
    created_at text,
    description text,
    due_date text,
    meta_notes_required text,
    meta_photos_required text,
    "name" text,
    "status" text,
    "type" text,
    updated_at text,
    vendor_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (scorecard_score_id) REFERENCES scored_value(id)
);

CREATE TABLE task_resource (
    id text,
    collection_name text,
    created_at text,
    custom_properties_generated_conversions_thumb text,
    download_url text,
    file_name text,
    full_url text,
    media_id text,
    "name" text,
    order_column text,
    thumb_url text,
    "type" text,
    updated_at text,
    url text,
    PRIMARY KEY (id)
);

CREATE TABLE assessment_score (
    "index" text,
    assessment_id text,
    calculated_score text,
    display_value text,
    "name" text,
    score text,
    PRIMARY KEY ("index", assessment_id),
    FOREIGN KEY (assessment_id) REFERENCES assessment(id)
);

CREATE TABLE assessment_forecast_score (
    "index" text,
    assessment_id text,
    calculated_score text,
    display_value text,
    forecast_score text,
    "name" text,
    PRIMARY KEY ("index", assessment_id),
    FOREIGN KEY (assessment_id) REFERENCES assessment(id)
);

CREATE TABLE assessment (
    id text,
    access_realm_id text,
    realm_id text,
    client_id text,
    completion_date text,
    created_at text,
    description text,
    end_date text,
    forecast_origin_id text,
    locked text,
    "name" text,
    start_date text,
    "status" text,
    "type" text,
    updated_at timestamp,
    vendor_id text,
    visibility text,
    PRIMARY KEY (id),
    FOREIGN KEY (access_realm_id) REFERENCES realm(id),
    FOREIGN KEY (realm_id) REFERENCES realm(id)
);

CREATE TABLE realm (
    id text,
    realm_parent_id text,
    explicit_value text,
    "name" text,
    tier text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (realm_parent_id) REFERENCES realm(id)
);
