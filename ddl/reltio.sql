CREATE TABLE match (
    tenant_id text,
    entity_id text,
    match_group_id text,
    matched_entity_id text,
    "type" text,
    PRIMARY KEY (tenant_id, entity_id, match_group_id, matched_entity_id),
    FOREIGN KEY (entity_id) REFERENCES entity(id),
    FOREIGN KEY (match_group_id) REFERENCES match_group(id),
    FOREIGN KEY (matched_entity_id) REFERENCES entity(id)
);

CREATE TABLE relation_attribute_type (
    tenant_id text,
    uri text,
    relation_type text,
    parent_attribute text,
    attribute_system boolean,
    description text,
    hidden boolean,
    important boolean,
    label text,
    "name" text,
    searchable boolean,
    skip_in_data_access boolean,
    "type" text,
    values jsonb,
    PRIMARY KEY (tenant_id, uri, relation_type),
    FOREIGN KEY (relation_type) REFERENCES relation_type(id),
    FOREIGN KEY (parent_attribute) REFERENCES relation_attribute_type(uri)
);

CREATE TABLE entity_attribute_type (
    tenant_id text,
    uri text,
    entity_type text,
    parent_attribute text,
    attribute_system boolean,
    description text,
    hidden boolean,
    important boolean,
    label text,
    "name" text,
    searchable boolean,
    skip_in_data_access boolean,
    "type" text,
    values jsonb,
    PRIMARY KEY (tenant_id, uri, entity_type),
    FOREIGN KEY (entity_type) REFERENCES entity_type(id),
    FOREIGN KEY (parent_attribute) REFERENCES entity_attribute_type(uri)
);

CREATE TABLE entity_analytics_attribute_type (
    tenant_id text,
    uri text,
    entity_type text,
    parent_attribute text,
    description text,
    label text,
    max_occurs bigint,
    "name" text,
    "type" text,
    values jsonb,
    PRIMARY KEY (tenant_id, uri, entity_type),
    FOREIGN KEY (entity_type) REFERENCES entity_type(id),
    FOREIGN KEY (parent_attribute) REFERENCES entity_analytics_attribute_type(uri)
);

CREATE TABLE relation_crosswalk (
    id text,
    tenant_id text,
    relation_id text,
    "type" text,
    create_date timestamp,
    delete_date timestamp,
    reltio_load_date timestamp,
    source_table text,
    update_date timestamp,
    uri text,
    "value" text,
    PRIMARY KEY (id, tenant_id, relation_id),
    FOREIGN KEY (relation_id) REFERENCES relation(id),
    FOREIGN KEY ("type") REFERENCES "source"(id)
);

CREATE TABLE relation_type (
    id text,
    tenant_id text,
    description text,
    direction text,
    end_object_directional_context jsonb,
    end_object_object_type_uri text,
    end_object_uri text,
    implicit boolean,
    label text,
    start_object_directional_context jsonb,
    start_object_object_type_uri text,
    start_object_uri text,
    type_color text,
    uri text,
    PRIMARY KEY (id, tenant_id)
);

CREATE TABLE interaction_attribute (
    _fivetran_id text,
    tenant_id text,
    interaction_id text,
    parent_attribute text,
    "type" text,
    ignored text,
    label text,
    lookup_code text,
    lookup_value text,
    "name" text,
    ov boolean,
    uri text,
    "value" text,
    PRIMARY KEY (_fivetran_id, tenant_id, interaction_id),
    FOREIGN KEY (interaction_id) REFERENCES interaction(id),
    FOREIGN KEY (parent_attribute) REFERENCES interaction_attribute(_fivetran_id),
    FOREIGN KEY ("type") REFERENCES interaction_attribute_type(uri)
);

CREATE TABLE entity_analytics_attribute (
    _fivetran_id text,
    tenant_id text,
    entity_id text,
    parent_attribute text,
    "name" text,
    "type" text,
    uri text,
    "value" text,
    PRIMARY KEY (_fivetran_id, tenant_id, entity_id),
    FOREIGN KEY (entity_id) REFERENCES entity(id),
    FOREIGN KEY (parent_attribute) REFERENCES entity_analytics_attribute(_fivetran_id)
);

CREATE TABLE interaction_member (
    tenant_id text,
    interaction_id text,
    member_id text,
    "type" text,
    PRIMARY KEY (tenant_id, interaction_id, member_id, "type"),
    FOREIGN KEY (interaction_id) REFERENCES interaction(id),
    FOREIGN KEY (member_id) REFERENCES entity(id),
    FOREIGN KEY ("type") REFERENCES interaction_member_type(interaction_type)
);

CREATE TABLE interaction (
    id text,
    tenant_id text,
    "type" text,
    created_by text,
    created_time timestamp,
    interaction_timestamp timestamp,
    is_favorite boolean,
    updated_by text,
    updated_time timestamp,
    uri text,
    PRIMARY KEY (id, tenant_id),
    FOREIGN KEY ("type") REFERENCES interaction_type(id)
);

CREATE TABLE interaction_attribute_type (
    tenant_id text,
    uri text,
    interaction_type text,
    parent_attribute text,
    attribute_system boolean,
    description text,
    hidden boolean,
    important boolean,
    label text,
    "name" text,
    searchable boolean,
    skip_in_data_access boolean,
    "type" text,
    values jsonb,
    PRIMARY KEY (tenant_id, uri, interaction_type),
    FOREIGN KEY (interaction_type) REFERENCES interaction_type(id),
    FOREIGN KEY (parent_attribute) REFERENCES interaction_attribute_type(uri)
);

CREATE TABLE entity_tag (
    entity_id text,
    "name" text,
    tenant_id text,
    PRIMARY KEY (entity_id, "name", tenant_id)
);

CREATE TABLE interaction_member_type (
    tenant_id text,
    uri text,
    interaction_type text,
    object_type_uri text,
    label text,
    "name" text,
    PRIMARY KEY (tenant_id, uri, interaction_type),
    FOREIGN KEY (interaction_type) REFERENCES interaction_type(id),
    FOREIGN KEY (object_type_uri) REFERENCES entity_type(uri)
);

CREATE TABLE relation_analytics_attribute (
    _fivetran_id text,
    tenant_id text,
    relation_id text,
    parent_attribute text,
    "name" text,
    "type" text,
    uri text,
    "value" text,
    PRIMARY KEY (_fivetran_id, tenant_id, relation_id),
    FOREIGN KEY (relation_id) REFERENCES relation(id),
    FOREIGN KEY (parent_attribute) REFERENCES relation_analytics_attribute(_fivetran_id)
);

CREATE TABLE entity_crosswalk_attribute (
    tenant_id text,
    attribute text,
    crosswalk_id text,
    entity_id text,
    update_date timestamp,
    PRIMARY KEY (tenant_id, attribute, crosswalk_id, entity_id),
    FOREIGN KEY (attribute) REFERENCES entity_attribute(uri),
    FOREIGN KEY (crosswalk_id) REFERENCES entity_crosswalk(id),
    FOREIGN KEY (entity_id) REFERENCES entity_crosswalk(entity_id)
);

CREATE TABLE relation_attribute (
    _fivetran_id text,
    tenant_id text,
    relation_id text,
    parent_attribute text,
    "type" text,
    ignored text,
    label text,
    lookup_code text,
    lookup_value text,
    "name" text,
    ov boolean,
    uri text,
    "value" text,
    PRIMARY KEY (_fivetran_id, tenant_id, relation_id),
    FOREIGN KEY (relation_id) REFERENCES relation(id),
    FOREIGN KEY (parent_attribute) REFERENCES relation_attribute(_fivetran_id),
    FOREIGN KEY ("type") REFERENCES relation_attribute_type(uri)
);

CREATE TABLE entity (
    id text,
    tenant_id text,
    "type" text,
    winner_id text,
    created_by text,
    created_time timestamp,
    end_date timestamp,
    label text,
    secondary_label text,
    updated_by text,
    updated_time timestamp,
    uri text,
    PRIMARY KEY (id, tenant_id),
    FOREIGN KEY ("type") REFERENCES entity_type(id),
    FOREIGN KEY (winner_id) REFERENCES entity(id)
);

CREATE TABLE interaction_type (
    id text,
    tenant_id text,
    has_members boolean,
    label text,
    uri text,
    PRIMARY KEY (id, tenant_id)
);

CREATE TABLE interaction_crosswalk (
    id text,
    tenant_id text,
    interaction_id text,
    "type" text,
    create_date timestamp,
    delete_date timestamp,
    reltio_load_date timestamp,
    source_table text,
    update_date timestamp,
    uri text,
    "value" text,
    PRIMARY KEY (id, tenant_id, interaction_id),
    FOREIGN KEY (interaction_id) REFERENCES interaction(id),
    FOREIGN KEY ("type") REFERENCES "source"(id)
);

CREATE TABLE relation_crosswalk_attribute (
    tenant_id text,
    attribute text,
    crosswalk_id text,
    relation_id text,
    update_date timestamp,
    PRIMARY KEY (tenant_id, attribute, crosswalk_id, relation_id),
    FOREIGN KEY (attribute) REFERENCES relation_attribute(uri),
    FOREIGN KEY (crosswalk_id) REFERENCES relation_crosswalk(id),
    FOREIGN KEY (relation_id) REFERENCES relation_crosswalk(relation_id)
);

CREATE TABLE "source" (
    id text,
    tenant_id text,
    abbreviation text,
    description text,
    icon text,
    label text,
    uri text,
    PRIMARY KEY (id, tenant_id)
);

CREATE TABLE entity_merge (
    tenant_id text,
    loser_id text,
    winner_id text,
    merge_reason text,
    merge_rules text,
    merged_by text,
    "time" timestamp,
    PRIMARY KEY (tenant_id, loser_id, winner_id),
    FOREIGN KEY (loser_id) REFERENCES entity(id),
    FOREIGN KEY (winner_id) REFERENCES entity(id)
);

CREATE TABLE entity_type (
    id text,
    tenant_id text,
    abstract boolean,
    data_label_pattern text,
    description text,
    extends_type text,
    label text,
    secondary_label_pattern text,
    type_color text,
    uri text,
    PRIMARY KEY (id, tenant_id)
);

CREATE TABLE relation (
    id text,
    tenant_id text,
    end_object_entity_id text,
    start_object_entity_id text,
    "type" text,
    created_by text,
    created_time timestamp,
    end_date timestamp,
    end_object_directional_label text,
    end_ref_ignored boolean,
    end_ref_pinned boolean,
    start_object_directional_label text,
    start_ref_ignored boolean,
    start_ref_pinned boolean,
    updated_by text,
    updated_time timestamp,
    uri text,
    PRIMARY KEY (id, tenant_id),
    FOREIGN KEY (end_object_entity_id) REFERENCES entity(id),
    FOREIGN KEY (start_object_entity_id) REFERENCES entity(id),
    FOREIGN KEY ("type") REFERENCES relation_type(id)
);

CREATE TABLE not_match (
    tenant_id text,
    entity_id text,
    not_match_entity_id text,
    PRIMARY KEY (tenant_id, entity_id, not_match_entity_id),
    FOREIGN KEY (entity_id) REFERENCES entity(id),
    FOREIGN KEY (not_match_entity_id) REFERENCES entity(id)
);

CREATE TABLE match_group (
    id text,
    tenant_id text,
    entity_type text,
    label text,
    rule jsonb,
    score_incremental double precision,
    score_standalone double precision,
    "type" text,
    uri text,
    use_ov_only boolean,
    PRIMARY KEY (id, tenant_id, entity_type),
    FOREIGN KEY (entity_type) REFERENCES entity_type(id)
);

CREATE TABLE entity_attribute (
    _fivetran_id text,
    tenant_id text,
    entity_id text,
    parent_attribute text,
    ref_entity text,
    ref_relation text,
    "type" text,
    ignored text,
    label text,
    lookup_code text,
    lookup_value text,
    "name" text,
    ov boolean,
    relationship_label text,
    uri text,
    "value" text,
    PRIMARY KEY (_fivetran_id, tenant_id, entity_id),
    FOREIGN KEY (entity_id) REFERENCES entity(id),
    FOREIGN KEY (parent_attribute) REFERENCES entity_attribute(_fivetran_id),
    FOREIGN KEY (ref_entity) REFERENCES entity(id),
    FOREIGN KEY (ref_relation) REFERENCES relation(id),
    FOREIGN KEY ("type") REFERENCES entity_attribute_type(uri)
);

CREATE TABLE interaction_crosswalk_attribute (
    tenant_id text,
    attribute text,
    crosswalk_id text,
    interaction_id text,
    update_date timestamp,
    PRIMARY KEY (tenant_id, attribute, crosswalk_id, interaction_id),
    FOREIGN KEY (attribute) REFERENCES interaction_attribute(uri),
    FOREIGN KEY (crosswalk_id) REFERENCES interaction_crosswalk(id),
    FOREIGN KEY (interaction_id) REFERENCES interaction_crosswalk(interaction_id)
);

CREATE TABLE entity_crosswalk (
    id text,
    tenant_id text,
    entity_id text,
    "type" text,
    create_date timestamp,
    delete_date timestamp,
    reltio_load_date timestamp,
    source_table text,
    update_date timestamp,
    uri text,
    "value" text,
    PRIMARY KEY (id, tenant_id, entity_id),
    FOREIGN KEY (entity_id) REFERENCES entity(id),
    FOREIGN KEY ("type") REFERENCES "source"(id)
);
