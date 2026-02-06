CREATE TABLE task_member (
    id text,
    task_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES member(id),
    FOREIGN KEY (task_id) REFERENCES task(id)
);

CREATE TABLE task_assignee (
    id text,
    task_id text,
    avatar_url text,
    email text,
    full_name text,
    PRIMARY KEY (id),
    FOREIGN KEY (task_id) REFERENCES task(id)
);

CREATE TABLE task (
    id text,
    segment_id text,
    tenant_id text,
    activity jsonb,
    body text,
    created_at text,
    created_by_id text,
    deleted_at text,
    due_date text,
    import_hash text,
    "name" text,
    "status" text,
    "type" text,
    updated_at text,
    updated_by_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (segment_id) REFERENCES member_segment(id),
    FOREIGN KEY (tenant_id) REFERENCES member(tenant_id)
);

CREATE TABLE member_attribute_setting_option (
    "index" text,
    member_attribute_setting_id text,
    "option" text,
    PRIMARY KEY ("index", member_attribute_setting_id),
    FOREIGN KEY (member_attribute_setting_id) REFERENCES member_attribute_setting(id)
);

CREATE TABLE member_attribute_setting (
    id text,
    can_delete text,
    created_at text,
    created_by_id text,
    label text,
    "name" text,
    show text,
    "type" text,
    updated_at timestamp,
    updated_by_id text,
    PRIMARY KEY (id)
);

CREATE TABLE tags (
    id text,
    tenant_id text,
    created_at text,
    created_by_id text,
    deleted_at text,
    import_hash text,
    "name" text,
    updated_at timestamp,
    updated_by_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (tenant_id) REFERENCES member(tenant_id)
);

CREATE TABLE conversation (
    id text,
    conversation_starter_id text,
    segment_id text,
    tenant_id text,
    channel text,
    created_at text,
    created_by_id text,
    last_active text,
    platform text,
    published text,
    slug text,
    title text,
    updated_at timestamp,
    updated_by_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (conversation_starter_id) REFERENCES activity(id),
    FOREIGN KEY (segment_id) REFERENCES member_segment(id),
    FOREIGN KEY (tenant_id) REFERENCES member(tenant_id)
);

CREATE TABLE member_email (
    "index" text,
    member_id text,
    email text,
    PRIMARY KEY ("index", member_id),
    FOREIGN KEY (member_id) REFERENCES member(id)
);

CREATE TABLE member_enriched_by (
    "index" text,
    member_id text,
    enriched_by text,
    PRIMARY KEY ("index", member_id),
    FOREIGN KEY (member_id) REFERENCES member(id)
);

CREATE TABLE member_organization (
    id text,
    member_id text,
    PRIMARY KEY (id, member_id),
    FOREIGN KEY (id) REFERENCES organization(id),
    FOREIGN KEY (member_id) REFERENCES member(id)
);

CREATE TABLE member_segment (
    id text,
    member_id text,
    description text,
    grandparent_name text,
    grandparent_slug text,
    "name" text,
    parent_name text,
    parent_slug text,
    slug text,
    source_id text,
    source_parent_id text,
    "status" text,
    url text,
    PRIMARY KEY (id, member_id),
    FOREIGN KEY (member_id) REFERENCES member(id)
);

CREATE TABLE member_active_on (
    "index" text,
    member_id text,
    active_on text,
    PRIMARY KEY ("index", member_id),
    FOREIGN KEY (member_id) REFERENCES member(id)
);

CREATE TABLE member_identity (
    "index" text,
    member_id text,
    identities text,
    PRIMARY KEY ("index", member_id),
    FOREIGN KEY (member_id) REFERENCES member(id)
);

CREATE TABLE member_tag (
    id text,
    member_id text,
    PRIMARY KEY (id, member_id),
    FOREIGN KEY (id) REFERENCES tags(id),
    FOREIGN KEY (member_id) REFERENCES member(id)
);

CREATE TABLE member (
    id text,
    last_activity_id text,
    active_days_count text,
    affiliation jsonb,
    avatar_url_default text,
    avatar_url_discord text,
    avatar_url_enrichment text,
    avatar_url_github text,
    average_sentiment text,
    bio_default text,
    bio_enrichment text,
    bio_github text,
    contribution jsonb,
    country_default text,
    country_enrichment text,
    created_at text,
    created_by_id text,
    deleted_at text,
    display_name text,
    import_hash text,
    is_hireable_default text,
    is_hireable_github text,
    is_organization_default text,
    is_organization_linkedin text,
    is_team_member_default text,
    joined_at text,
    karma_default text,
    karma_hacker_news text,
    last_active text,
    last_enriched text,
    location_default text,
    location_enrichment text,
    location_github text,
    manually_created text,
    no_merge jsonb,
    note jsonb,
    number_of_open_source_contribution text,
    reach_github text,
    reach_total text,
    reach_twitter text,
    score text,
    seniority_level_default text,
    seniority_level_enrichment text,
    source_id_default text,
    source_id_discord text,
    source_id_hacker_news text,
    task jsonb,
    tenant_id text,
    to_merge jsonb,
    updated_at text,
    updated_by_id text,
    url_default text,
    url_github text,
    url_linkedin text,
    url_twitter text,
    website_url_default text,
    website_url_github text,
    years_of_experience_default text,
    years_of_experience_enrichment text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (last_activity_id) REFERENCES activity(id)
);

CREATE TABLE member_username (
    "index" text,
    member_id text,
    table_name text,
    username text,
    PRIMARY KEY ("index", member_id),
    FOREIGN KEY (member_id) REFERENCES member(id)
);

CREATE TABLE member_education (
    "index" text,
    member_id text,
    campus text,
    end_date text,
    specialization text,
    start_date text,
    table_name text,
    PRIMARY KEY ("index", member_id),
    FOREIGN KEY (member_id) REFERENCES member(id)
);

CREATE TABLE member_expertise (
    "index" text,
    member_id text,
    expertise text,
    table_name text,
    PRIMARY KEY ("index", member_id),
    FOREIGN KEY (member_id) REFERENCES member(id)
);

CREATE TABLE member_attribute_programming_language (
    "index" text,
    member_id text,
    programming_language text,
    table_name text,
    PRIMARY KEY ("index", member_id),
    FOREIGN KEY (member_id) REFERENCES member(id)
);

CREATE TABLE member_work_experience (
    "index" text,
    member_id text,
    company text,
    end_date text,
    location text,
    start_date text,
    table_name text,
    title text,
    PRIMARY KEY ("index", member_id),
    FOREIGN KEY (member_id) REFERENCES member(id)
);

CREATE TABLE member_skill (
    "index" text,
    member_id text,
    skill text,
    table_name text,
    PRIMARY KEY ("index", member_id),
    FOREIGN KEY (member_id) REFERENCES member(id)
);

CREATE TABLE organization_active_on (
    "index" text,
    organization_id text,
    active_on text,
    PRIMARY KEY ("index", organization_id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE organization_identity (
    _fivetran_id text,
    organization_id text,
    created_at text,
    integration_id text,
    "name" text,
    platform text,
    source_id text,
    updated_at text,
    url text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE organization_email (
    "index" text,
    organization_id text,
    email text,
    PRIMARY KEY ("index", organization_id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE organization_phone_number (
    "index" text,
    organization_id text,
    phone_number text,
    PRIMARY KEY ("index", organization_id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE organization_tag (
    "index" text,
    organization_id text,
    tags text,
    PRIMARY KEY ("index", organization_id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE organization (
    id text,
    tenant_id text,
    activity_count text,
    address jsonb,
    affiliated_profile text,
    all_subsidiaries text,
    alternative_domain text,
    alternative_name text,
    attribute jsonb,
    average_employee_tenure text,
    average_tenure_by_level text,
    average_tenure_by_role text,
    created_at text,
    created_by_id text,
    crunchbase_handle text,
    deleted_at text,
    description text,
    direct_subsidiary text,
    display_name text,
    employee text,
    employee_churn_rate text,
    employee_count_by_country text,
    employee_count_by_month text,
    employee_count_by_month_by_level text,
    employee_count_by_month_by_role text,
    employee_growth_rate text,
    founded text,
    geo_location jsonb,
    gics_sector text,
    github_handle text,
    gross_additions_by_month text,
    gross_departures_by_month text,
    headline text,
    immediate_parent text,
    import_hash jsonb,
    industry text,
    is_team_organization text,
    joined_at text,
    last_active text,
    last_enriched_at text,
    linkedin_handle text,
    linkedin_url text,
    location text,
    manually_created text,
    naics text,
    profile text,
    revenue_range_max text,
    revenue_range_min text,
    segment_id text,
    "size" text,
    ticker text,
    twitter_bio text,
    twitter_follower text,
    twitter_following text,
    twitter_handle text,
    twitter_location text,
    "type" text,
    ultimate_parent text,
    updated_at text,
    updated_by_id text,
    weak_identity jsonb,
    website text,
    PRIMARY KEY (id),
    FOREIGN KEY (tenant_id) REFERENCES member(tenant_id)
);

CREATE TABLE member_note (
    id text,
    note_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES member(id),
    FOREIGN KEY (note_id) REFERENCES note(id)
);

CREATE TABLE note (
    id text,
    tenant_id text,
    body text,
    created_at text,
    created_by_id text,
    deleted_at text,
    import_hash text,
    updated_at text,
    updated_by_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (tenant_id) REFERENCES member(tenant_id)
);

CREATE TABLE activity (
    id text,
    conversation_id text,
    member_id text,
    organization_id text,
    parent_id text,
    segment_id text,
    tenant_id text,
    body text,
    channel text,
    created_at text,
    created_by_id text,
    deleted_at text,
    display_channel text,
    display_default text,
    display_formatter jsonb,
    display_short text,
    import_hash text,
    is_contribution text,
    object_member text,
    object_member_id text,
    object_member_username text,
    platform text,
    score text,
    sentiment_label text,
    sentiment_mixed text,
    sentiment_negative text,
    sentiment_neutral text,
    sentiment_positive text,
    sentiment_sentiment text,
    source_id text,
    source_parent_id text,
    task jsonb,
    timestamps text,
    title text,
    "type" text,
    updated_at text,
    updated_by_id text,
    url text,
    username text,
    -- attribute_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id),
    FOREIGN KEY (member_id) REFERENCES member(id),
    FOREIGN KEY (organization_id) REFERENCES organization(id),
    FOREIGN KEY (parent_id) REFERENCES activity(id),
    FOREIGN KEY (segment_id) REFERENCES member_segment(id),
    FOREIGN KEY (tenant_id) REFERENCES member(tenant_id)
);
