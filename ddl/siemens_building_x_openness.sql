CREATE TABLE country (
    id text,
    partition_id text,
    continent_code text,
    continent_label text,
    label text,
    PRIMARY KEY (id, partition_id),
    FOREIGN KEY (partition_id) REFERENCES account_user_group_relationship_access(id)
);

CREATE TABLE medium_consumption_cost (
    timestamps timestamp,
    medium_consumption_list_id text,
    partition_id text,
    "value" text,
    PRIMARY KEY (timestamps, medium_consumption_list_id, partition_id),
    FOREIGN KEY (medium_consumption_list_id) REFERENCES medium_consumption_list(id),
    FOREIGN KEY (partition_id) REFERENCES account_user_group_relationship_access(id)
);

CREATE TABLE equipment_type (
    id text,
    partition_id text,
    parent_id text,
    create_by text,
    created_at timestamp,
    deprecated text,
    description text,
    domain text,
    iri text,
    "name" text,
    updated_at timestamp,
    updated_by text,
    PRIMARY KEY (id, partition_id),
    FOREIGN KEY (partition_id) REFERENCES account_user_group_relationship_access(id),
    FOREIGN KEY (parent_id) REFERENCES equipment_type(id)
);

CREATE TABLE medium_consumption_list (
    id text,
    partition_id text,
    base_discipline jsonb,
    base_unit text,
    entity_name text,
    entity_reference_id text,
    entity_reference_type text,
    PRIMARY KEY (id, partition_id),
    FOREIGN KEY (partition_id) REFERENCES account_user_group_relationship_access(id)
);

CREATE TABLE point (
    id text,
    device_id text,
    partition_id text,
    commanding_semantic text,
    create_by text,
    created_at timestamp,
    data_type text,
    description text,
    enum jsonb,
    "function" text,
    is_active text,
    maximum text,
    minimum text,
    "name" text,
    precision text,
    source_type text,
    system_attributes jsonb,
    tags jsonb,
    timestamps timestamp,
    unit text,
    updated_at timestamp,
    updated_by text,
    "value" text,
    PRIMARY KEY (id, device_id, partition_id),
    FOREIGN KEY (device_id) REFERENCES device(id),
    FOREIGN KEY (partition_id) REFERENCES account_user_group_relationship_access(id)
);

CREATE TABLE point_value (
    id text,
    partition_id text,
    point_id text,
    quality_of_value text,
    target_value text,
    timestamps timestamp,
    "value" text,
    PRIMARY KEY (id, partition_id, point_id),
    FOREIGN KEY (partition_id) REFERENCES account_user_group_relationship_access(id),
    FOREIGN KEY (point_id) REFERENCES point(id)
);

CREATE TABLE medium_consumption_emission (
    timestamps timestamp,
    medium_consumption_list_id text,
    partition_id text,
    "value" text,
    PRIMARY KEY (timestamps, medium_consumption_list_id, partition_id),
    FOREIGN KEY (medium_consumption_list_id) REFERENCES medium_consumption_list(id),
    FOREIGN KEY (partition_id) REFERENCES account_user_group_relationship_access(id)
);

CREATE TABLE point_group (
    id text,
    partition_id text,
    create_by text,
    created_at timestamp,
    entity_id text,
    entity_type text,
    "name" text,
    updated_at timestamp,
    updated_by text,
    PRIMARY KEY (id, partition_id),
    FOREIGN KEY (partition_id) REFERENCES account_user_group_relationship_access(id)
);

CREATE TABLE event (
    id text,
    device_id text,
    partition_id text,
    produced_by_id text,
    source_id text,
    active text,
    category text,
    created_at timestamp,
    message text,
    opens text,
    "state" text,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id, device_id, partition_id),
    FOREIGN KEY (device_id) REFERENCES device(id),
    FOREIGN KEY (partition_id) REFERENCES account_user_group_relationship_access(id),
    FOREIGN KEY (produced_by_id) REFERENCES device(id),
    FOREIGN KEY (source_id) REFERENCES point(id)
);

CREATE TABLE address (
    id text,
    partition_id text,
    country_code text,
    country_name text,
    create_by text,
    created_at timestamp,
    locality text,
    postal_code text,
    region text,
    street text,
    updated_at timestamp,
    updated_by text,
    -- additional_prop_* (dynamic column),
    PRIMARY KEY (id, partition_id),
    FOREIGN KEY (partition_id) REFERENCES account_user_group_relationship_access(id),
    FOREIGN KEY (country_code) REFERENCES country(id)
);

CREATE TABLE team_member (
    id text,
    partition_id text,
    team_id text,
    "type" text,
    PRIMARY KEY (id, partition_id, team_id),
    FOREIGN KEY (partition_id) REFERENCES account_user_group_relationship_access(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE equipment_relationship_control (
    equipment_id text,
    id text,
    PRIMARY KEY (equipment_id, id),
    FOREIGN KEY (equipment_id) REFERENCES equipment(id),
    FOREIGN KEY (id) REFERENCES device(id)
);

CREATE TABLE equipment_feed (
    id text,
    equipment_id text,
    PRIMARY KEY (id, equipment_id),
    FOREIGN KEY (equipment_id) REFERENCES equipment(id)
);

CREATE TABLE equipment (
    id text,
    equipment_type_id text,
    location_id text,
    partition_id text,
    create_by text,
    created_at timestamp,
    external_id text,
    installation_date text,
    manufactured_by text,
    manufacturing_year text,
    model text,
    "name" text,
    notes text,
    part_of_id text,
    part_of_type text,
    partition_type text,
    serial_number text,
    updated_at timestamp,
    updated_by text,
    PRIMARY KEY (id),
    FOREIGN KEY (equipment_type_id) REFERENCES equipment_type(id),
    FOREIGN KEY (location_id) REFERENCES location(id),
    FOREIGN KEY (partition_id) REFERENCES account_user_group_relationship_access(id)
);

CREATE TABLE team_location (
    id text,
    team_id text,
    partition_id text,
    PRIMARY KEY (id, team_id),
    FOREIGN KEY (id) REFERENCES location(id),
    FOREIGN KEY (team_id) REFERENCES team(id),
    FOREIGN KEY (partition_id) REFERENCES account_user_group_relationship_access(id)
);

CREATE TABLE team (
    id text,
    partition_id text,
    create_by text,
    created_at timestamp,
    customer_id text,
    customer_type text,
    description text,
    domain text,
    location_count text,
    member_count text,
    "name" text,
    updated_at timestamp,
    updated_by text,
    PRIMARY KEY (id, partition_id),
    FOREIGN KEY (partition_id) REFERENCES account_user_group_relationship_access(id)
);

CREATE TABLE time_zone (
    id text,
    partition_id text,
    label text,
    PRIMARY KEY (id, partition_id),
    FOREIGN KEY (partition_id) REFERENCES account_user_group_relationship_access(id)
);

CREATE TABLE account_user_group_relationship_access (
    id text,
    account_user_group_id text,
    "type" text,
    PRIMARY KEY (id, account_user_group_id),
    FOREIGN KEY (account_user_group_id) REFERENCES account_user_group(id)
);

CREATE TABLE account_user_group_relationship_authorized_role (
    id text,
    account_user_group_id text,
    "type" text,
    PRIMARY KEY (id, account_user_group_id),
    FOREIGN KEY (account_user_group_id) REFERENCES account_user_group(id)
);

CREATE TABLE account_user_group (
    id text,
    description text,
    is_machine_enabled text,
    is_system_defined text,
    "name" text,
    owned_by_id text,
    owned_by_type text,
    PRIMARY KEY (id)
);

CREATE TABLE medium_consumption (
    timestamps timestamp,
    medium_consumption_list_id text,
    partition_id text,
    "value" text,
    PRIMARY KEY (timestamps, medium_consumption_list_id, partition_id),
    FOREIGN KEY (medium_consumption_list_id) REFERENCES medium_consumption_list(id),
    FOREIGN KEY (partition_id) REFERENCES account_user_group_relationship_access(id)
);

CREATE TABLE location_tag_user_defined_value (
    user_defined_value text,
    location_id text,
    partition_id text,
    PRIMARY KEY (user_defined_value, location_id, partition_id),
    FOREIGN KEY (location_id) REFERENCES location(id),
    FOREIGN KEY (partition_id) REFERENCES location(partition_id)
);

CREATE TABLE location (
    id text,
    partition_id text,
    postal_address_id text,
    create_by text,
    created_at timestamp,
    description text,
    external_id text,
    geo_area_geometry_coordinates jsonb,
    geo_area_geometry_type text,
    geo_location_geometry_coordinates jsonb,
    geo_location_geometry_type text,
    label text,
    primary_contact_email text,
    primary_contact_name text,
    primary_contact_phone text,
    time_zone text,
    "type" text,
    updated_at timestamp,
    updated_by text,
    user_defined_marker_tag text,
    PRIMARY KEY (id, partition_id),
    FOREIGN KEY (partition_id) REFERENCES account_user_group_relationship_access(id),
    FOREIGN KEY (postal_address_id) REFERENCES address(id)
);

CREATE TABLE device_feature (
    id text,
    device_id text,
    device_partition_id text,
    "type" text,
    PRIMARY KEY (id, device_id, device_partition_id),
    FOREIGN KEY (device_id) REFERENCES device(id),
    FOREIGN KEY (device_partition_id) REFERENCES device(partition_id)
);

CREATE TABLE device (
    id text,
    partition_id text,
    location_id text,
    gateway_id text,
    gateway_type text,
    model_name text,
    profile_external_id text,
    profile_name text,
    profile_notes text,
    serial_number text,
    PRIMARY KEY (id, partition_id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE device_connectivity (
    id text,
    partition_id text,
    device_id text,
    last_seen_at timestamp,
    "status" text,
    status_note text,
    PRIMARY KEY (id, partition_id),
    FOREIGN KEY (device_id) REFERENCES device(id)
);

CREATE TABLE building_type (
    id text,
    partition_id text,
    label text,
    PRIMARY KEY (id, partition_id),
    FOREIGN KEY (partition_id) REFERENCES account_user_group_relationship_access(id)
);
