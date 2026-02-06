CREATE TABLE country (
    country text,
    index_name text,
    start_date text,
    count text,
    end_date text,
    PRIMARY KEY (country, index_name, start_date)
);

CREATE TABLE settings (
    _fivetran_id text,
    index_name text,
    alternatives_as_exact text,
    attribute_for_distinct text,
    attributes_for_faceting text,
    attributes_to_highlight text,
    attributes_to_index text,
    attributes_to_retrieve text,
    attributes_to_snippet text,
    exact_on_single_word_query text,
    highlight_post_tag text,
    highlight_pre_tag text,
    hits_per_page text,
    max_values_per_facet text,
    min_word_size_for_1_typo text,
    min_word_size_for_2_typo text,
    numeric_attributes_to_index text,
    optional_words text,
    pagination_limited_to text,
    query_type text,
    ranking text,
    remove_words_if_no_results text,
    separators_to_index text,
    snippet_ellipsis_text text,
    unretrievable_attributes text,
    version text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (index_name) REFERENCES "index"(index_name)
);

CREATE TABLE click_through_rate (
    "date" text,
    index_name text,
    click_count text,
    rate text,
    tracked_search_count text,
    PRIMARY KEY ("date", index_name)
);

CREATE TABLE search_no_result_rate (
    "date" text,
    index_name text,
    count text,
    no_result_count text,
    rate text,
    PRIMARY KEY ("date", index_name)
);

CREATE TABLE average_click_position (
    "date" text,
    index_name text,
    average text,
    click_count text,
    PRIMARY KEY ("date", index_name)
);

CREATE TABLE click_position (
    _fivetran_id text,
    click_count text,
    end_date text,
    index_name text,
    "position" jsonb,
    start_date text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE index_detail (
    id text,
    index_name text,
    PRIMARY KEY (id),
    FOREIGN KEY (index_name) REFERENCES "index"(index_name)
);

CREATE TABLE rule_condition (
    "index" text,
    rule_id text,
    anchoring text,
    pattern text,
    PRIMARY KEY ("index", rule_id),
    FOREIGN KEY (rule_id) REFERENCES rule(id)
);

CREATE TABLE rule (
    id text,
    index_detail_id text,
    index_name text,
    PRIMARY KEY (id),
    FOREIGN KEY (index_detail_id) REFERENCES index_detail(id),
    FOREIGN KEY (index_name) REFERENCES "index"(index_name)
);

CREATE TABLE index_replica (
    "index" text,
    index_name text,
    replica text,
    PRIMARY KEY ("index", index_name),
    FOREIGN KEY (index_name) REFERENCES "index"(index_name)
);

CREATE TABLE "index" (
    index_name text,
    primary_index text,
    created_at text,
    data_size text,
    entries text,
    file_size text,
    last_build_time_s text,
    number_of_pending_tasks text,
    pending_task text,
    updated_at text,
    virtual text,
    PRIMARY KEY (index_name),
    FOREIGN KEY (primary_index) REFERENCES "index"(index_name)
);

CREATE TABLE search_no_click_rate (
    "date" text,
    index_name text,
    count text,
    no_click_count text,
    rate text,
    PRIMARY KEY ("date", index_name)
);

CREATE TABLE search_count (
    _fivetran_id text,
    count text,
    "date" text,
    index_name text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE filter (
    attribute text,
    index_name text,
    start_date text,
    count text,
    end_date text,
    PRIMARY KEY (attribute, index_name, start_date)
);

CREATE TABLE hit (
    _fivetran_id text,
    click_count text,
    conversion_count text,
    count text,
    end_date text,
    hit text,
    index_name text,
    start_date text,
    tracked_hit_count text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE search (
    _fivetran_id text,
    click_count text,
    conversion_count text,
    count text,
    end_date text,
    index_name text,
    nb_hits text,
    search text,
    start_date text,
    tracked_search_count text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE user_count (
    "date" text,
    index_name text,
    count text,
    PRIMARY KEY ("date", index_name)
);

CREATE TABLE search_no_click (
    _fivetran_id text,
    count text,
    end_date text,
    index_name text,
    nb_hits text,
    search text,
    start_date text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE search_no_result (
    _fivetran_id text,
    count text,
    end_date text,
    index_name text,
    search text,
    start_date text,
    with_filter_count text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE conversion_rate (
    "date" text,
    index_name text,
    conversion_count text,
    rate text,
    tracked_search_count text,
    PRIMARY KEY ("date", index_name)
);
