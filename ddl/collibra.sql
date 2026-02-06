CREATE TABLE scope_domain (
    domain_id text,
    scope_id text,
    PRIMARY KEY (domain_id, scope_id),
    FOREIGN KEY (domain_id) REFERENCES domain(id),
    FOREIGN KEY (scope_id) REFERENCES scope(id)
);

CREATE TABLE scope_community (
    community_id text,
    scope_id text,
    PRIMARY KEY (community_id, scope_id),
    FOREIGN KEY (community_id) REFERENCES community(id),
    FOREIGN KEY (scope_id) REFERENCES scope(id)
);

CREATE TABLE scope (
    id text,
    created_by text,
    last_modified_by text,
    created_on timestamp,
    description text,
    is_system boolean,
    last_modified_on timestamp,
    "name" text,
    resource_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (last_modified_by) REFERENCES users(id)
);

CREATE TABLE relation_type (
    id text,
    created_by text,
    last_modified_by text,
    source_type_id text,
    target_type_id text,
    co_role text,
    created_on timestamp,
    is_system boolean,
    last_modified_on timestamp,
    resource_type text,
    "role" text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (last_modified_by) REFERENCES users(id),
    FOREIGN KEY (source_type_id) REFERENCES asset_type(id),
    FOREIGN KEY (target_type_id) REFERENCES asset_type(id)
);

CREATE TABLE "status" (
    id text,
    created_by text,
    last_modified_by text,
    created_on timestamp,
    is_system boolean,
    last_modified_on timestamp,
    "name" text,
    resource_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (last_modified_by) REFERENCES users(id)
);

CREATE TABLE issue (
    id text,
    created_by text,
    domain_id text,
    last_modified_by text,
    status_id text,
    type_id text,
    articulation_score double precision,
    avg_rating double precision,
    created_on timestamp,
    display_name text,
    excluded_from_auto_hyperlinking boolean,
    is_system boolean,
    last_modified_on timestamp,
    "name" text,
    ratings_count bigint,
    resource_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES asset(id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (domain_id) REFERENCES domain(id),
    FOREIGN KEY (last_modified_by) REFERENCES users(id),
    FOREIGN KEY (status_id) REFERENCES "status"(id),
    FOREIGN KEY (type_id) REFERENCES asset_type(id)
);

CREATE TABLE community (
    id text,
    created_by text,
    last_modified_by text,
    parent_id text,
    created_on timestamp,
    is_system boolean,
    last_modified_on timestamp,
    "name" text,
    parent_name text,
    parent_resource_type text,
    resource_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (last_modified_by) REFERENCES users(id),
    FOREIGN KEY (parent_id) REFERENCES community(id)
);

CREATE TABLE mapping (
    id text,
    created_by text,
    last_modified_by text,
    mapped_resource_id text,
    created_on timestamp,
    description text,
    external_entity_id text,
    external_entity_url text,
    external_system_id text,
    is_system boolean,
    last_modified_on timestamp,
    last_sync_date timestamp,
    resource_type text,
    sync_action text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (last_modified_by) REFERENCES users(id),
    FOREIGN KEY (mapped_resource_id) REFERENCES asset(id)
);

CREATE TABLE domain_type (
    id text,
    created_by text,
    last_modified_by text,
    parent_id text,
    created_on timestamp,
    description text,
    is_system boolean,
    last_modified_on timestamp,
    "name" text,
    parent_name text,
    parent_resource_type text,
    resource_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (last_modified_by) REFERENCES users(id),
    FOREIGN KEY (parent_id) REFERENCES domain_type(id)
);

CREATE TABLE job (
    id text,
    created_by text,
    last_modified_by text,
    user_id text,
    cancelable boolean,
    created_on timestamp,
    end_date timestamp,
    is_system boolean,
    last_modified_on timestamp,
    message text,
    "name" text,
    progress_percentage double precision,
    resource_type text,
    "result" text,
    start_date timestamp,
    "state" text,
    "type" text,
    visibility bigint,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (last_modified_by) REFERENCES users(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE attribute (
    id text,
    asset_id text,
    created_by text,
    last_modified_by text,
    type_id text,
    created_on timestamp,
    is_system boolean,
    last_modified_on timestamp,
    resource_type text,
    "value" text,
    PRIMARY KEY (id),
    FOREIGN KEY (asset_id) REFERENCES asset(id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (last_modified_by) REFERENCES users(id),
    FOREIGN KEY (type_id) REFERENCES attribute_type(id)
);

CREATE TABLE search_view_aggregation (
    "index" text,
    search_view_id text,
    field text,
    limits text,
    PRIMARY KEY ("index", search_view_id),
    FOREIGN KEY (search_view_id) REFERENCES search_view(id)
);

CREATE TABLE search_in_fields_field (
    "index" text,
    search_in_field_index text,
    search_view_id text,
    field text,
    PRIMARY KEY ("index", search_in_field_index, search_view_id),
    FOREIGN KEY (search_in_field_index) REFERENCES search_in_field("index"),
    FOREIGN KEY (search_view_id) REFERENCES search_in_field(search_view_id)
);

CREATE TABLE search_in_field (
    "index" text,
    search_view_id text,
    resource_type text,
    PRIMARY KEY ("index", search_view_id),
    FOREIGN KEY (search_view_id) REFERENCES search_view(id)
);

CREATE TABLE search_view_filter_value (
    "index" text,
    search_view_filter_index text,
    search_view_id text,
    "value" text,
    PRIMARY KEY ("index", search_view_filter_index, search_view_id),
    FOREIGN KEY (search_view_filter_index) REFERENCES search_view_filter("index"),
    FOREIGN KEY (search_view_id) REFERENCES search_view_filter(search_view_id)
);

CREATE TABLE search_view_filter (
    "index" text,
    search_view_id text,
    field text,
    PRIMARY KEY ("index", search_view_id),
    FOREIGN KEY (search_view_id) REFERENCES search_view(id)
);

CREATE TABLE search_view (
    id text,
    "name" text,
    search_request_keywords text,
    search_request_sort_field text,
    search_request_sort_order text,
    PRIMARY KEY (id)
);

CREATE TABLE rating (
    id text,
    asset_id text,
    created_by text,
    last_modified_by text,
    created_on timestamp,
    is_system boolean,
    last_modified_on timestamp,
    rating double precision,
    resource_type text,
    review text,
    PRIMARY KEY (id),
    FOREIGN KEY (asset_id) REFERENCES asset(id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (last_modified_by) REFERENCES users(id)
);

CREATE TABLE view_permission (
    id text,
    base_resource_id text,
    created_by text,
    last_modified_by text,
    user_group_id text,
    user_id text,
    created_on timestamp,
    is_system boolean,
    last_modified_on timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (base_resource_id) REFERENCES community(id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (last_modified_by) REFERENCES users(id),
    FOREIGN KEY (user_group_id) REFERENCES user_group(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE user_additional_email_address (
    email_address text,
    user_id text,
    created_by text,
    last_modified_by text,
    created_on timestamp,
    is_system boolean,
    last_modified_on timestamp,
    "name" text,
    resource_type text,
    PRIMARY KEY (email_address, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (last_modified_by) REFERENCES users(id)
);

CREATE TABLE user_phone_number (
    phone_number text,
    user_id text,
    created_by text,
    last_modified_by text,
    created_on timestamp,
    is_system boolean,
    last_modified_on timestamp,
    resource_type text,
    "type" text,
    PRIMARY KEY (phone_number, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (last_modified_by) REFERENCES users(id)
);

CREATE TABLE user_address (
    _fivetran_id text,
    created_by text,
    last_modified_by text,
    user_id text,
    city text,
    country text,
    created_on timestamp,
    is_system boolean,
    last_modified_on timestamp,
    number text,
    postal_type text,
    resource_type text,
    "state" text,
    street text,
    "type" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (last_modified_by) REFERENCES users(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE user_instant_messaging_account (
    account text,
    user_id text,
    created_by text,
    last_modified_by text,
    created_on timestamp,
    is_system boolean,
    last_modified_on timestamp,
    resource_type text,
    "type" text,
    PRIMARY KEY (account, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (last_modified_by) REFERENCES users(id)
);

CREATE TABLE user_website (
    url text,
    user_id text,
    created_by text,
    last_modified_by text,
    created_on timestamp,
    is_system boolean,
    last_modified_on timestamp,
    resource_type text,
    "type" text,
    PRIMARY KEY (url, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (last_modified_by) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    created_by text,
    last_modified_by text,
    activated boolean,
    api_user text,
    created_on timestamp,
    email_address text,
    enabled boolean,
    first_name text,
    gender text,
    guest_user text,
    is_system boolean,
    languages text,
    last_modified_on timestamp,
    last_name text,
    ldap_user text,
    license_type text,
    resource_type text,
    user_name text,
    user_source text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (last_modified_by) REFERENCES users(id)
);

CREATE TABLE tags (
    id text,
    created_by text,
    last_modified_by text,
    assets_count bigint,
    created_on timestamp,
    is_system boolean,
    last_modified_on timestamp,
    "name" text,
    resource_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (last_modified_by) REFERENCES users(id)
);

CREATE TABLE domain (
    id text,
    community_id text,
    created_by text,
    last_modified_by text,
    type_id text,
    created_on timestamp,
    description text,
    excluded_from_auto_hyperlinking boolean,
    is_system boolean,
    last_modified_on timestamp,
    "name" text,
    resource_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (community_id) REFERENCES community(id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (last_modified_by) REFERENCES users(id),
    FOREIGN KEY (type_id) REFERENCES domain_type(id)
);

CREATE TABLE attachment (
    id text,
    base_resource_id text,
    created_by text,
    last_modified_by text,
    created_on timestamp,
    file_content_type text,
    file_id text,
    file_name text,
    is_system boolean,
    last_modified_on timestamp,
    resource_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (base_resource_id) REFERENCES asset(id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (last_modified_by) REFERENCES users(id)
);

CREATE TABLE attribute_type (
    id text,
    created_by text,
    last_modified_by text,
    created_on timestamp,
    description text,
    is_system boolean,
    last_modified_on timestamp,
    "name" text,
    resource_type text,
    string_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (last_modified_by) REFERENCES users(id)
);

CREATE TABLE user_group (
    id text,
    created_by text,
    last_modified_by text,
    created_on timestamp,
    is_system boolean,
    last_modified_on timestamp,
    locally_managed boolean,
    "name" text,
    resource_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (last_modified_by) REFERENCES users(id)
);

CREATE TABLE comment_mentioned_user (
    comment_id text,
    user_id text,
    base_resource_id text,
    base_resource_type text,
    parent_id text,
    parent_resource_type text,
    PRIMARY KEY (comment_id, user_id),
    FOREIGN KEY (comment_id) REFERENCES "comment"(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE "comment" (
    id text,
    base_resource_id text,
    created_by text,
    last_modified_by text,
    content text,
    created_on timestamp,
    is_system boolean,
    last_modified_on timestamp,
    resource_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (base_resource_id) REFERENCES asset(id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (last_modified_by) REFERENCES users(id)
);

CREATE TABLE role_permission (
    permission text,
    role_id text,
    PRIMARY KEY (permission, role_id),
    FOREIGN KEY (role_id) REFERENCES "role"(id)
);

CREATE TABLE "role" (
    id text,
    created_by text,
    last_modified_by text,
    created_on timestamp,
    description text,
    global boolean,
    is_system boolean,
    last_modified_on timestamp,
    "name" text,
    resource_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (last_modified_by) REFERENCES users(id)
);

CREATE TABLE import (
    synchronization_id text,
    PRIMARY KEY (synchronization_id)
);

CREATE TABLE assignment_asset_type_status (
    assignment_asset_type_id text,
    status_id text,
    PRIMARY KEY (assignment_asset_type_id, status_id),
    FOREIGN KEY (assignment_asset_type_id) REFERENCES assignment_asset_type(id),
    FOREIGN KEY (status_id) REFERENCES "status"(id)
);

CREATE TABLE assignment_asset_type_domain_type (
    assignment_asset_type_id text,
    domain_type_id text,
    PRIMARY KEY (assignment_asset_type_id, domain_type_id),
    FOREIGN KEY (assignment_asset_type_id) REFERENCES assignment_asset_type(id),
    FOREIGN KEY (domain_type_id) REFERENCES domain_type(id)
);

CREATE TABLE assignment_asset_type_characteristic_type (
    id text,
    assignment_asset_type_id text,
    attribute_type_id text,
    assigned_resource_id text,
    assigned_resource_type text,
    is_system boolean,
    maximum_occurences bigint,
    minimum_occurences bigint,
    read_only boolean,
    PRIMARY KEY (id, assignment_asset_type_id),
    FOREIGN KEY (assignment_asset_type_id) REFERENCES assignment_asset_type(id),
    FOREIGN KEY (attribute_type_id) REFERENCES attribute_type(id)
);

CREATE TABLE assignment_asset_type_articulation_rule (
    id text,
    assignment_asset_type_id text,
    created_by text,
    last_modified_by text,
    status_id text,
    created_on timestamp,
    is_system boolean,
    last_modified_on timestamp,
    operation text,
    resource_type text,
    score double precision,
    PRIMARY KEY (id, assignment_asset_type_id),
    FOREIGN KEY (assignment_asset_type_id) REFERENCES assignment_asset_type(id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (last_modified_by) REFERENCES users(id),
    FOREIGN KEY (status_id) REFERENCES "status"(id)
);

CREATE TABLE assignment_asset_type_data_quality_rule (
    assignment_asset_type_id text,
    data_quality_rule_id text,
    PRIMARY KEY (assignment_asset_type_id, data_quality_rule_id),
    FOREIGN KEY (assignment_asset_type_id) REFERENCES assignment_asset_type(id),
    FOREIGN KEY (data_quality_rule_id) REFERENCES data_quality_rule(id)
);

CREATE TABLE assignment_asset_type_validation_rule (
    id text,
    assignment_asset_type_id text,
    "name" text,
    resource_type text,
    PRIMARY KEY (id, assignment_asset_type_id),
    FOREIGN KEY (assignment_asset_type_id) REFERENCES assignment_asset_type(id)
);

CREATE TABLE assignment_asset_type (
    id text,
    asset_type_id text,
    created_by text,
    default_status_id text,
    last_modified_by text,
    scope_id text,
    created_on timestamp,
    is_system boolean,
    last_modified_on timestamp,
    resource_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (asset_type_id) REFERENCES asset_type(id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (default_status_id) REFERENCES "status"(id),
    FOREIGN KEY (last_modified_by) REFERENCES users(id),
    FOREIGN KEY (scope_id) REFERENCES scope(id)
);

CREATE TABLE asset_type (
    id text,
    created_by text,
    last_modified_by text,
    parent_id text,
    created_on timestamp,
    description text,
    display_name_enabled boolean,
    is_system boolean,
    last_modified_on timestamp,
    "name" text,
    parent_resource text,
    rating_enabled boolean,
    resource_type text,
    symbol_data_acronym_code text,
    symbol_data_color text,
    symbol_data_symbol_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (last_modified_by) REFERENCES users(id),
    FOREIGN KEY (parent_id) REFERENCES asset_type(id)
);

CREATE TABLE data_quality_rule_relation_trace_entry (
    _fivetran_id text,
    relation_type_id text,
    out_bound_role_direction boolean,
    role_direction boolean,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (relation_type_id) REFERENCES relation_type(id)
);

CREATE TABLE data_quality_metric (
    id text,
    attribute_type_id text,
    created_by text,
    last_modified_by text,
    count_operation text,
    created_on timestamp,
    is_system boolean,
    last_modified_on timestamp,
    resource_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (attribute_type_id) REFERENCES attribute_type(id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (last_modified_by) REFERENCES users(id)
);

CREATE TABLE data_quality_rule (
    id text,
    categorization_relation_type_id text,
    created_by text,
    last_modified_by text,
    relation_trace_created_by text,
    relation_trace_last_modified_by text,
    created_on timestamp,
    is_system boolean,
    last_modified_on timestamp,
    "name" text,
    relation_trace_created_on timestamp,
    relation_trace_id text,
    relation_trace_is_system boolean,
    relation_trace_last_modified_on timestamp,
    relation_trace_resource_type text,
    resource_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (categorization_relation_type_id) REFERENCES relation_type(id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (last_modified_by) REFERENCES users(id),
    FOREIGN KEY (relation_trace_created_by) REFERENCES users(id),
    FOREIGN KEY (relation_trace_last_modified_by) REFERENCES users(id)
);

CREATE TABLE complex_relation_attribute (
    id text,
    asset_id text,
    created_by text,
    last_modified_by text,
    type_id text,
    created_on timestamp,
    is_system boolean,
    last_modified_on timestamp,
    resource_type text,
    "value" text,
    PRIMARY KEY (id),
    FOREIGN KEY (asset_id) REFERENCES complex_relation(id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (last_modified_by) REFERENCES users(id),
    FOREIGN KEY (type_id) REFERENCES attribute_type(id)
);

CREATE TABLE complex_relation_leg (
    id text,
    asset_id text,
    asset_reference_id text,
    asset_type_id text,
    complex_relation_id text,
    co_role text,
    is_system boolean,
    resource_type text,
    "role" text,
    PRIMARY KEY (id),
    FOREIGN KEY (asset_id) REFERENCES asset(id),
    FOREIGN KEY (asset_reference_id) REFERENCES asset(id),
    FOREIGN KEY (asset_type_id) REFERENCES asset_type(id),
    FOREIGN KEY (complex_relation_id) REFERENCES complex_relation(id)
);

CREATE TABLE complex_relation (
    id text,
    created_by text,
    last_modified_by text,
    type_id text,
    created_on timestamp,
    is_system boolean,
    last_modified_on timestamp,
    resource_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (last_modified_by) REFERENCES users(id),
    FOREIGN KEY (type_id) REFERENCES complex_relation_type(id)
);

CREATE TABLE relation (
    id text,
    created_by text,
    last_modified_by text,
    source_id text,
    target_id text,
    type_id text,
    created_on timestamp,
    is_system boolean,
    last_modified_on timestamp,
    resource_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (last_modified_by) REFERENCES users(id),
    FOREIGN KEY (source_id) REFERENCES asset(id),
    FOREIGN KEY (target_id) REFERENCES asset(id),
    FOREIGN KEY (type_id) REFERENCES relation_type(id)
);

CREATE TABLE asset (
    id text,
    created_by text,
    domain_id text,
    last_modified_by text,
    status_id text,
    type_id text,
    articulation_score double precision,
    avg_rating double precision,
    created_on timestamp,
    description text,
    display_name text,
    excluded_from_auto_hyperlinking boolean,
    is_system boolean,
    last_modified_on timestamp,
    "name" text,
    ratings_count bigint,
    resource_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (domain_id) REFERENCES domain(id),
    FOREIGN KEY (last_modified_by) REFERENCES users(id),
    FOREIGN KEY (status_id) REFERENCES "status"(id),
    FOREIGN KEY (type_id) REFERENCES asset_type(id)
);

CREATE TABLE responsibility (
    id text,
    base_resource_id text,
    created_by text,
    last_modified_by text,
    owner_id text,
    role_id text,
    created_on timestamp,
    is_system boolean,
    last_modified_on timestamp,
    resource_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (base_resource_id) REFERENCES asset(id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (last_modified_by) REFERENCES users(id),
    FOREIGN KEY (owner_id) REFERENCES users(id),
    FOREIGN KEY (role_id) REFERENCES "role"(id)
);

CREATE TABLE complex_relation_type_attribute_type (
    id text,
    attribute_type_id text,
    complex_relation_type_id text,
    created_by text,
    last_modified_by text,
    created_on timestamp,
    is_system boolean,
    last_modified_on timestamp,
    maximum_occurences bigint,
    minimum_occurences bigint,
    read_only boolean,
    resource_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (attribute_type_id) REFERENCES attribute_type(id),
    FOREIGN KEY (complex_relation_type_id) REFERENCES complex_relation_type(id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (last_modified_by) REFERENCES users(id)
);

CREATE TABLE complex_relation_type_leg_type (
    id text,
    asset_type_id text,
    complex_relation_type_id text,
    relation_type_id text,
    co_role text,
    is_system boolean,
    maximum_occurences bigint,
    minimum_occurences bigint,
    resource_type text,
    "role" text,
    PRIMARY KEY (id),
    FOREIGN KEY (asset_type_id) REFERENCES asset_type(id),
    FOREIGN KEY (complex_relation_type_id) REFERENCES complex_relation_type(id),
    FOREIGN KEY (relation_type_id) REFERENCES relation_type(id)
);

CREATE TABLE complex_relation_type (
    id text,
    created_by text,
    last_modified_by text,
    created_on timestamp,
    description text,
    is_system boolean,
    last_modified_on timestamp,
    "name" text,
    resource_type text,
    symbol_data_acronym_code text,
    symbol_data_color text,
    symbol_data_icon_code text,
    symbol_data_symbol_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (last_modified_by) REFERENCES users(id)
);
