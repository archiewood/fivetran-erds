CREATE TABLE credit (
    _fivetran_id text,
    estimate_credits_used_until_end_of_billing_period text,
    monthly_total text,
    next_billing_period text,
    remaining_credits_monthly text,
    remaining_credits_onetime text,
    used_credits_monthly text,
    used_credits_onetime text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE collector (
    id text,
    "state" text,
    PRIMARY KEY (id)
);

CREATE TABLE dashboard (
    id text,
    view_id text,
    last_update text,
    title text,
    PRIMARY KEY (id),
    FOREIGN KEY (view_id) REFERENCES "view"(project_id)
);

CREATE TABLE report (
    id text,
    view_id text,
    last_update text,
    title text,
    PRIMARY KEY (id),
    FOREIGN KEY (view_id) REFERENCES "view"(project_id)
);

CREATE TABLE "view" (
    project_id text,
    title text,
    PRIMARY KEY (project_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE topic_node (
    id text,
    resource_topic_id text,
    resource_id text,
    description text,
    title text,
    PRIMARY KEY (id, resource_topic_id),
    FOREIGN KEY (resource_topic_id) REFERENCES resource_topic(id),
    FOREIGN KEY (resource_id) REFERENCES resource_topic(resource_id)
);

CREATE TABLE resource_topic (
    id text,
    resource_id text,
    description text,
    title text,
    PRIMARY KEY (id, resource_id),
    FOREIGN KEY (resource_id) REFERENCES resource(id)
);

CREATE TABLE resource_event (
    id text,
    resource_id text,
    title text,
    PRIMARY KEY (id, resource_id),
    FOREIGN KEY (resource_id) REFERENCES resource(id)
);

CREATE TABLE filter_node (
    id text,
    resource_filter_id text,
    resource_id text,
    description text,
    title text,
    PRIMARY KEY (id, resource_filter_id),
    FOREIGN KEY (resource_filter_id) REFERENCES resource_filter(id),
    FOREIGN KEY (resource_id) REFERENCES resource_filter(resource_id)
);

CREATE TABLE resource_filter (
    id text,
    resource_id text,
    description text,
    title text,
    PRIMARY KEY (id, resource_id),
    FOREIGN KEY (resource_id) REFERENCES resource(id)
);

CREATE TABLE channel_node (
    id text,
    resource_channel_id text,
    resource_id text,
    title text,
    "type" text,
    PRIMARY KEY (id, resource_channel_id, resource_id),
    FOREIGN KEY (resource_channel_id) REFERENCES resource_channel(id),
    FOREIGN KEY (resource_id) REFERENCES resource_channel(resource_id)
);

CREATE TABLE resource_channel (
    id text,
    resource_id text,
    title text,
    PRIMARY KEY (id, resource_id),
    FOREIGN KEY (resource_id) REFERENCES resource(id)
);

CREATE TABLE resource (
    id text,
    project_id text,
    title text,
    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE task_message (
    "name" text,
    task_id text,
    PRIMARY KEY ("name", task_id),
    FOREIGN KEY (task_id) REFERENCES task(id)
);

CREATE TABLE task (
    id text,
    creation_date text,
    processed text,
    progress text,
    "status" text,
    target text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE project_import_type (
    "name" text,
    project_id text,
    PRIMARY KEY ("name", project_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE project (
    id text,
    account_id text,
    account_name text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE collector_data_source_type (
    "index" text,
    collector_id text,
    indexed text,
    search_indexed text,
    source_type text,
    PRIMARY KEY ("index", collector_id, indexed, search_indexed),
    FOREIGN KEY (collector_id) REFERENCES collector_data(collector_id),
    FOREIGN KEY (indexed) REFERENCES collector_data(indexed),
    FOREIGN KEY (search_indexed) REFERENCES collector_data(search_indexed)
);

CREATE TABLE collector_data_collection (
    "index" text,
    collector_id text,
    indexed text,
    search_indexed text,
    collection_id text,
    PRIMARY KEY ("index", collector_id, indexed, search_indexed),
    FOREIGN KEY (collector_id) REFERENCES collector_data(collector_id),
    FOREIGN KEY (indexed) REFERENCES collector_data(indexed),
    FOREIGN KEY (search_indexed) REFERENCES collector_data(search_indexed)
);

CREATE TABLE collector_data_token_content (
    "index" text,
    collector_id text,
    indexed text,
    search_indexed text,
    token_content text,
    PRIMARY KEY ("index", collector_id, indexed, search_indexed),
    FOREIGN KEY (collector_id) REFERENCES collector_data(collector_id),
    FOREIGN KEY (indexed) REFERENCES collector_data(indexed),
    FOREIGN KEY (search_indexed) REFERENCES collector_data(search_indexed)
);

CREATE TABLE collector_data_token_title (
    "index" text,
    collector_id text,
    indexed text,
    search_indexed text,
    token_title text,
    PRIMARY KEY ("index", collector_id, indexed, search_indexed),
    FOREIGN KEY (collector_id) REFERENCES collector_data(collector_id),
    FOREIGN KEY (indexed) REFERENCES collector_data(indexed),
    FOREIGN KEY (search_indexed) REFERENCES collector_data(search_indexed)
);

CREATE TABLE collector_data (
    indexed text,
    search_indexed text,
    collector_id text,
    article_extended_attribute_douyin_collect text,
    article_extended_attribute_douyin_share_num text,
    article_extended_attribute_douyin_video_likes text,
    article_extended_attribute_num_comments text,
    article_extended_attribute_url_views text,
    content text,
    domain_url text,
    extra_author_attribute_gender text,
    extra_author_attribute_id text,
    extra_author_attribute_name text,
    extra_source_attribute_id text,
    extra_source_attribute_name text,
    extra_source_attribute_world_data_city text,
    extra_source_attribute_world_data_continent text,
    extra_source_attribute_world_data_country text,
    extra_source_attribute_world_data_country_code text,
    extra_source_attribute_world_data_latitude text,
    extra_source_attribute_world_data_longitude text,
    extra_source_attribute_world_data_region text,
    extra_source_attribute_world_data_resolution text,
    fluency_level text,
    host_url text,
    lang text,
    matched_appearance text,
    parent_url text,
    porn_level text,
    post_type jsonb,
    published text,
    root_url text,
    sentiment text,
    source_extended_attribute_alexa_pageviews text,
    source_extended_attribute_alexa_unique_visitors text,
    source_extended_attribute_douyin_reach text,
    title text,
    url text,
    word_count text,
    PRIMARY KEY (indexed, search_indexed, collector_id),
    FOREIGN KEY (collector_id) REFERENCES collector(id)
);

CREATE TABLE collector_highlighted_data_project_profile (
    id text,
    collector_highlighted_data_fivetran_id text,
    category text,
    title text,
    "type" text,
    PRIMARY KEY (id, collector_highlighted_data_fivetran_id),
    FOREIGN KEY (collector_highlighted_data_fivetran_id) REFERENCES collector_highlighted_data(_fivetran_id)
);

CREATE TABLE collector_highlighted_data (
    _fivetran_id text,
    collector_id text,
    matched_project_id text,
    content_snippet text,
    title_snippet text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (collector_id) REFERENCES collector(id),
    FOREIGN KEY (matched_project_id) REFERENCES project(id)
);

CREATE TABLE tags (
    id text,
    project_id text,
    label text,
    PRIMARY KEY (id, project_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);
