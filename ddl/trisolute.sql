CREATE TABLE keyword_category (
    category text,
    "index" text,
    keyword_added text,
    keyword_keyword text,
    PRIMARY KEY (category, "index", keyword_added, keyword_keyword),
    FOREIGN KEY (keyword_added) REFERENCES keyword(added),
    FOREIGN KEY (keyword_keyword) REFERENCES keyword(keyword)
);

CREATE TABLE keyword (
    added text,
    keyword text,
    crawl_interval text,
    ignored text,
    priority text,
    relevance text,
    "source" text,
    updated text,
    PRIMARY KEY (added, keyword)
);

CREATE TABLE serp_drilldown_keyword (
    keyword text,
    object_type text,
    total_ranking_count text,
    PRIMARY KEY (keyword, object_type)
);

CREATE TABLE serp_publisher (
    publisher text,
    keyword text,
    object_type text,
    ranking_count text,
    PRIMARY KEY (publisher, keyword, object_type),
    FOREIGN KEY (keyword) REFERENCES serp_drilldown_keyword(keyword),
    FOREIGN KEY (object_type) REFERENCES serp_drilldown_keyword(object_type)
);

CREATE TABLE ranking_detail (
    _fivetran_id text,
    ranking_identifier text,
    ranking_keyword text,
    amp text,
    crawl_date text,
    device text,
    object_type text,
    "position" text,
    position_in_ranking_type text,
    ranking_lost text,
    ranking_type text,
    title text,
    url text,
    video text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (ranking_identifier) REFERENCES ranking(identifier),
    FOREIGN KEY (ranking_keyword) REFERENCES ranking(keyword)
);

CREATE TABLE ranking (
    identifier text,
    keyword text,
    news_tab_crawl_date text,
    news_tab_title text,
    news_tab_url text,
    object_type text,
    PRIMARY KEY (identifier, keyword)
);

CREATE TABLE keyword_without_article_ranking (
    _fivetran_id text,
    amp text,
    crawl_date text,
    device text,
    keyword_with_article_identifier text,
    keyword_with_article_keyword text,
    "position" text,
    position_in_ranking_type text,
    ranking_lost text,
    ranking_type text,
    title text,
    url text,
    video text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE keyword_with_article (
    _fivetran_id text,
    keyword text,
    identifier text,
    news_tab_crawl_date text,
    news_tab_title text,
    news_tab_url text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (keyword) REFERENCES keyword(keyword)
);

CREATE TABLE serp_drilldown_article (
    "type" text,
    url text,
    score_percentage_within_top_hit text,
    title text,
    PRIMARY KEY ("type", url)
);

CREATE TABLE missing_topic (
    date_filter text,
    "key" text,
    PRIMARY KEY (date_filter, "key"),
    FOREIGN KEY ("key") REFERENCES keyword(keyword)
);

CREATE TABLE serp_visibility_value (
    "date" text,
    publisher text,
    object_type text,
    "value" text,
    PRIMARY KEY ("date", publisher)
);

CREATE TABLE articles_without_ranking_keyword (
    "index" text,
    title text,
    url text,
    keyword text,
    PRIMARY KEY ("index", title, url)
);

CREATE TABLE category_distribution_chart (
    category text,
    "date" text,
    publisher text,
    "value" text,
    PRIMARY KEY (category, "date", publisher)
);

CREATE TABLE google_news_visibility_chart (
    "date" text,
    google_chart_publisher text,
    "value" text,
    PRIMARY KEY ("date", google_chart_publisher)
);

CREATE TABLE general_keyword_category (
    "index" text,
    general_keyword_keyword text,
    general_object text,
    category text,
    PRIMARY KEY ("index", general_keyword_keyword, general_object),
    FOREIGN KEY (general_keyword_keyword) REFERENCES general_keyword(keyword),
    FOREIGN KEY (general_object) REFERENCES general_keyword("type")
);

CREATE TABLE general_keyword (
    keyword text,
    "type" text,
    relevance text,
    PRIMARY KEY (keyword, "type")
);

CREATE TABLE topic_coverage_chart (
    "date" text,
    publisher text,
    "value" text,
    PRIMARY KEY ("date", publisher)
);

CREATE TABLE indexed_article (
    indexed text,
    url text,
    title text,
    PRIMARY KEY (indexed, url)
);

CREATE TABLE index_rate_chart (
    "date" text,
    index_chart_publisher text,
    "value" text,
    PRIMARY KEY ("date", index_chart_publisher)
);
