CREATE TABLE member_activity_in_an_organization_tag (
    tags text,
    member_activity_id text,
    PRIMARY KEY (tags, member_activity_id),
    FOREIGN KEY (member_activity_id) REFERENCES member_activity_in_an_organization(id)
);

CREATE TABLE member_activity_organization_property (
    "name" text,
    member_activity_in_an_organization_id text,
    "value" text,
    PRIMARY KEY ("name", member_activity_in_an_organization_id),
    FOREIGN KEY (member_activity_in_an_organization_id) REFERENCES member_activity_in_an_organization(id)
);

CREATE TABLE member_activity_in_an_organization (
    id text,
    member_id text,
    organization_id text,
    workspace_activity_type_id text,
    workspace_id text,
    "action" text,
    activity_link text,
    activity_type_id text,
    attribute_type text,
    created_at timestamp,
    "key" text,
    occurred_at timestamp,
    orbit_url text,
    "type" text,
    updated_at timestamp,
    weight text,
    PRIMARY KEY (id),
    FOREIGN KEY (member_id) REFERENCES member_in_workspace(id),
    FOREIGN KEY (organization_id) REFERENCES organization(id),
    FOREIGN KEY (workspace_activity_type_id) REFERENCES workspace_activity_type(id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id)
);

CREATE TABLE member_activity_tag (
    tags text,
    member_activity_id text,
    PRIMARY KEY (tags, member_activity_id),
    FOREIGN KEY (member_activity_id) REFERENCES member_activity(id)
);

CREATE TABLE member_activity_property (
    "name" text,
    member_activity_id text,
    "value" text,
    PRIMARY KEY ("name", member_activity_id),
    FOREIGN KEY (member_activity_id) REFERENCES member_activity(id)
);

CREATE TABLE member_activity (
    id text,
    member_id text,
    workspace_activity_type_id text,
    workspace_id text,
    "action" text,
    activity_type_id text,
    attribute_type text,
    created_at timestamp,
    "key" text,
    occurred_at timestamp,
    orbit_url text,
    "type" text,
    updated_at timestamp,
    weight text,
    PRIMARY KEY (id),
    FOREIGN KEY (member_id) REFERENCES member_in_workspace(id),
    FOREIGN KEY (workspace_activity_type_id) REFERENCES workspace_activity_type(id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id)
);

CREATE TABLE workspace_activity_tag (
    tags text,
    activity_id text,
    PRIMARY KEY (tags, activity_id),
    FOREIGN KEY (activity_id) REFERENCES workspace_activity(id)
);

CREATE TABLE workspace_activity_property (
    "name" text,
    workspace_activity_id text,
    "value" text,
    PRIMARY KEY ("name", workspace_activity_id),
    FOREIGN KEY (workspace_activity_id) REFERENCES workspace_activity(id)
);

CREATE TABLE workspace_activity (
    id text,
    member_id text,
    workspace_activity_type_id text,
    workspace_id text,
    "action" text,
    activity_link text,
    activity_type_id text,
    attribute_type text,
    created_at timestamp,
    g_created_at timestamp,
    g_html_url text,
    g_merged boolean,
    g_merged_at timestamp,
    g_merged_by text,
    g_number text,
    g_title text,
    is_pull_request boolean,
    "key" text,
    occurred_at timestamp,
    orbit_url text,
    repository_id text,
    repository_type text,
    "type" text,
    weight text,
    PRIMARY KEY (id),
    FOREIGN KEY (member_id) REFERENCES member_in_workspace(id),
    FOREIGN KEY (workspace_activity_type_id) REFERENCES workspace_activity_type(id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id)
);

CREATE TABLE report (
    timeframe_end_date text,
    timeframe_start_date text,
    workspace_id text,
    id text,
    activity_foo_activity_active_count text,
    activity_foo_activity_active_delta text,
    activity_foo_activity_count text,
    activity_foo_activity_delta text,
    activity_foo_activity_new_count text,
    activity_foo_activity_new_delta text,
    activity_foo_activity_returning_count text,
    activity_foo_activity_returning_delta text,
    activity_foo_activity_source text,
    activity_spec_activity_active_count text,
    activity_spec_activity_active_delta text,
    activity_spec_activity_count text,
    activity_spec_activity_delta text,
    activity_spec_activity_new_count text,
    activity_spec_activity_new_delta text,
    activity_spec_activity_returning_count text,
    activity_spec_activity_returning_delta text,
    activity_spec_activity_source text,
    activity_total_count text,
    activity_total_delta text,
    member_active_count text,
    member_active_delta text,
    member_new_count text,
    member_new_delta text,
    member_returning_count text,
    member_returning_delta text,
    overview_members_on_orbit_level_1_count text,
    overview_members_on_orbit_level_2_count text,
    overview_members_on_orbit_level_3_count text,
    overview_members_on_orbit_level_4_count text,
    overview_members_on_orbit_level_none_count text,
    overview_total_members_count text,
    timeframe_end_date_last text,
    timeframe_start_date_last text,
    PRIMARY KEY (timeframe_end_date, timeframe_start_date, workspace_id),
    FOREIGN KEY (id) REFERENCES workspace(id)
);

CREATE TABLE member_in_an_organisation (
    member_id text,
    organization_id text,
    workspace_id text,
    PRIMARY KEY (member_id, organization_id),
    FOREIGN KEY (member_id) REFERENCES member_in_workspace(id),
    FOREIGN KEY (organization_id) REFERENCES organization(id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id)
);

CREATE TABLE member_in_workspace_identity (
    id text,
    workspace_id text,
    email text,
    "name" text,
    "source" text,
    source_host text,
    "type" text,
    uid text,
    username text,
    PRIMARY KEY (id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id)
);

CREATE TABLE organization (
    id text,
    workspace_id text,
    active_since text,
    created_at timestamp,
    crunchbase text,
    email_addresses text,
    employees_count text,
    estimated_annual_revenue text,
    facebook text,
    facebook_followers text,
    founded_in text,
    industry text,
    last_active text,
    linkedin text,
    location text,
    members_count text,
    "name" text,
    organization_type text,
    updated_at timestamp,
    website text,
    PRIMARY KEY (id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id)
);

CREATE TABLE note (
    id text,
    member_id text,
    workspace_id text,
    body text,
    created_at timestamp,
    updated_at timestamp,
    user_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (member_id) REFERENCES member_in_workspace(id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id)
);

CREATE TABLE member_in_workspace_tag (
    tags text,
    member_id text,
    PRIMARY KEY (tags, member_id),
    FOREIGN KEY (member_id) REFERENCES member_in_workspace(id)
);

CREATE TABLE member_identity (
    identity_id text,
    member_id text,
    PRIMARY KEY (identity_id, member_id),
    FOREIGN KEY (identity_id) REFERENCES member_in_workspace_identity(id),
    FOREIGN KEY (member_id) REFERENCES member_in_workspace(id)
);

CREATE TABLE member_in_workspace_tag_list (
    tag_list text,
    member_id text,
    PRIMARY KEY (tag_list, member_id),
    FOREIGN KEY (member_id) REFERENCES member_in_workspace(id)
);

CREATE TABLE member_in_workspace (
    id text,
    workspace_id text,
    activities_count text,
    activities_score text,
    avatar_url text,
    bio text,
    birthday text,
    company text,
    created boolean,
    created_at timestamp,
    deleted_at timestamp,
    devto text,
    discord text,
    discourse text,
    email text,
    first_activity_occurred_at timestamp,
    github text,
    github_followers text,
    languages text,
    last_activity_occurred_at timestamp,
    linkedin text,
    location text,
    love double precision,
    merged_at timestamp,
    "name" text,
    orbit_level text,
    orbit_url text,
    pronouns text,
    reach text,
    shipping_address text,
    slug text,
    "source" text,
    teammate boolean,
    title text,
    topics text,
    tshirt text,
    updated_at timestamp,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id)
);

CREATE TABLE workspace (
    id text,
    member_id text,
    workspace_activity_id text,
    created_at timestamp,
    "name" text,
    repository_data jsonb,
    slug text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (member_id) REFERENCES member_in_workspace(id),
    FOREIGN KEY (workspace_activity_id) REFERENCES workspace_activity(id)
);

CREATE TABLE workspace_activity_type (
    id text,
    workspace_id text,
    channel text,
    "key" text,
    "name" text,
    short_name text,
    "source" text,
    weight text,
    PRIMARY KEY (id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id)
);
