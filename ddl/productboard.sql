CREATE TABLE release_group (
    id text,
    archived boolean,
    description text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE jira_integration_connection (
    feature_id text,
    jira_integration_id text,
    connection_issue_id bigint,
    connection_issue_key text,
    PRIMARY KEY (feature_id, jira_integration_id),
    FOREIGN KEY (feature_id) REFERENCES feature(id),
    FOREIGN KEY (jira_integration_id) REFERENCES jira_integration(id)
);

CREATE TABLE "release" (
    id text,
    release_group_id text,
    archived boolean,
    description text,
    end_date text,
    granularity text,
    "name" text,
    start_date text,
    "state" text,
    PRIMARY KEY (id),
    FOREIGN KEY (release_group_id) REFERENCES release_group(id)
);

CREATE TABLE "option" (
    id text,
    custom_field_id text,
    label text,
    PRIMARY KEY (id),
    FOREIGN KEY (custom_field_id) REFERENCES custom_field(id)
);

CREATE TABLE custom_field (
    id text,
    description text,
    "name" text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE plugin_integration (
    id text,
    created_at timestamp,
    initial_state_label text,
    integration_status text,
    "name" text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE company (
    id text,
    description text,
    domain text,
    "name" text,
    source_origin text,
    source_record_id text,
    PRIMARY KEY (id)
);

CREATE TABLE feature_status (
    id text,
    completed boolean,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE jira_integration (
    id text,
    created_at timestamp,
    integration_status text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE note_follower (
    "index" text,
    note_id text,
    member_email text,
    member_id text,
    member_name text,
    team_id text,
    team_name text,
    PRIMARY KEY ("index", note_id),
    FOREIGN KEY (note_id) REFERENCES note(id)
);

CREATE TABLE note_comment (
    "index" text,
    note_id text,
    content text,
    email text,
    id text,
    timestamps text,
    user_id text,
    PRIMARY KEY ("index", note_id),
    FOREIGN KEY (note_id) REFERENCES note(id)
);

CREATE TABLE note_feature (
    "index" text,
    note_id text,
    id text,
    importance text,
    "type" text,
    PRIMARY KEY ("index", note_id),
    FOREIGN KEY (note_id) REFERENCES note(id),
    FOREIGN KEY (id) REFERENCES product(id)
);

CREATE TABLE note_tag (
    "index" text,
    note_id text,
    tags text,
    PRIMARY KEY ("index", note_id),
    FOREIGN KEY (note_id) REFERENCES note(id)
);

CREATE TABLE note (
    id text,
    company_id text,
    user_id text,
    content text,
    created_at text,
    created_by_email text,
    created_by_id text,
    created_by_name text,
    display_url text,
    external_display_url text,
    owner_email text,
    owner_name text,
    source_origin text,
    source_record_id text,
    "state" text,
    title text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE product (
    id text,
    created_at timestamp,
    description text,
    html text,
    "name" text,
    owner_email text,
    owner_name text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE objective (
    id text,
    parent_id text,
    archived boolean,
    created_at text,
    description text,
    end_date text,
    granularity text,
    html text,
    "level" text,
    "name" text,
    owner_email text,
    owner_name text,
    start_date text,
    "state" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (parent_id) REFERENCES objective(id)
);

CREATE TABLE custom_field_value (
    hierarchy_entity_id text,
    custom_field_id text,
    hierarchy_entity_type text,
    "type" text,
    "value" text,
    PRIMARY KEY (hierarchy_entity_id, custom_field_id),
    FOREIGN KEY (custom_field_id) REFERENCES custom_field(id)
);

CREATE TABLE plugin_integration_connection (
    feature_id text,
    plugin_integration_id text,
    connection_color text,
    connection_hover_label text,
    connection_label text,
    connection_state text,
    connection_target_url text,
    connection_tooltip text,
    PRIMARY KEY (feature_id, plugin_integration_id),
    FOREIGN KEY (feature_id) REFERENCES feature(id),
    FOREIGN KEY (plugin_integration_id) REFERENCES plugin_integration(id)
);

CREATE TABLE feature (
    id text,
    component_id text,
    status_id text,
    archived boolean,
    created_at timestamp,
    description text,
    end_date text,
    granularity text,
    html text,
    "name" text,
    owner_email text,
    owner_name text,
    start_date text,
    "status" text,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (component_id) REFERENCES component(id),
    FOREIGN KEY (status_id) REFERENCES feature_status(id)
);

CREATE TABLE component (
    id text,
    product_id text,
    created_at timestamp,
    description text,
    html text,
    "name" text,
    owner_email text,
    owner_name text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE users (
    id text,
    email text,
    external_id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE feature_release_assignment (
    feature_id text,
    release_id text,
    assigned boolean,
    PRIMARY KEY (feature_id, release_id),
    FOREIGN KEY (feature_id) REFERENCES feature(id),
    FOREIGN KEY (release_id) REFERENCES "release"(id)
);
