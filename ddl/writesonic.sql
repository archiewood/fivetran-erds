CREATE TABLE content_keyword_response (
    "index" text,
    content_keyword_id text,
    created_at text,
    paragraph text,
    platform_name text,
    query text,
    sentence text,
    sentiment text,
    PRIMARY KEY ("index", content_keyword_id),
    FOREIGN KEY (content_keyword_id) REFERENCES content_keyword(id)
);

CREATE TABLE content_keyword_response_compare (
    "index" text,
    content_keyword_id text,
    created_at text,
    paragraph text,
    platform_name text,
    query text,
    sentence text,
    sentiment text,
    PRIMARY KEY ("index", content_keyword_id),
    FOREIGN KEY (content_keyword_id) REFERENCES content_keyword(id)
);

CREATE TABLE content_keyword (
    id text,
    created_at text,
    created_at_compare text,
    keyword text,
    subtheme text,
    theme text,
    PRIMARY KEY (id)
);

CREATE TABLE performance_summary (
    "date" text,
    website_id text,
    rank text,
    rank_compare text,
    rank_diff text,
    total_mentions text,
    total_mentions_compare text,
    total_mentions_diff text,
    total_prompts text,
    total_prompts_compare text,
    total_prompts_diff text,
    total_results text,
    total_results_compare text,
    total_results_diff text,
    visibility_score text,
    visibility_score_compare text,
    visibility_score_diff text,
    website_name text,
    website_url text,
    PRIMARY KEY ("date", website_id)
);

CREATE TABLE content_citation_mentioned_website (
    "index" text,
    content_citation_id text,
    id text,
    is_competitor text,
    is_self_website text,
    "name" text,
    PRIMARY KEY ("index", content_citation_id),
    FOREIGN KEY (content_citation_id) REFERENCES content_citation(id)
);

CREATE TABLE content_citation_response (
    "index" text,
    content_citation_id text,
    prompt_id text,
    created_at text,
    model_id text,
    model_name text,
    prompt_text text,
    result_id text,
    topic_id text,
    topic_name text,
    PRIMARY KEY ("index", content_citation_id),
    FOREIGN KEY (content_citation_id) REFERENCES content_citation(id),
    FOREIGN KEY (prompt_id) REFERENCES performance_prompt(id)
);

CREATE TABLE content_citation_mentioned_website_compare (
    "index" text,
    content_citation_id text,
    id text,
    is_competitor text,
    is_self_website text,
    "name" text,
    PRIMARY KEY ("index", content_citation_id),
    FOREIGN KEY (content_citation_id) REFERENCES content_citation(id)
);

CREATE TABLE content_citation_response_compare (
    "index" text,
    content_citation_id text,
    created_at text,
    model_id text,
    model_name text,
    prompt_id text,
    prompt_text text,
    result_id text,
    topic_id text,
    topic_name text,
    PRIMARY KEY ("index", content_citation_id),
    FOREIGN KEY (content_citation_id) REFERENCES content_citation(id)
);

CREATE TABLE content_citation (
    id text,
    citation_domain text,
    citation_title text,
    citation_uri text,
    created_at text,
    PRIMARY KEY (id)
);

CREATE TABLE performance_answer_brand_mention (
    "index" text,
    platform_id text,
    prompt_id text,
    website_id text,
    brand_name text,
    rank text,
    sentences jsonb,
    visibility_score text,
    website_url text,
    PRIMARY KEY ("index", platform_id, prompt_id),
    FOREIGN KEY (platform_id) REFERENCES performance_answer(platform_id),
    FOREIGN KEY (prompt_id) REFERENCES performance_answer(prompt_id),
    FOREIGN KEY (website_id) REFERENCES performance_summary(website_id)
);

CREATE TABLE performance_answer (
    "date" text,
    platform_id text,
    prompt_id text,
    answer_text text,
    avg_rank text,
    avg_rank_compare text,
    avg_rank_diff text,
    avg_visibility_score text,
    avg_visibility_score_compare text,
    avg_visibility_score_diff text,
    platform text,
    platform_name text,
    prompt text,
    rank text,
    response text,
    response_id text,
    topic text,
    topic_id text,
    visibility_score text,
    PRIMARY KEY ("date", platform_id, prompt_id),
    FOREIGN KEY (prompt_id) REFERENCES performance_prompt(id)
);

CREATE TABLE performance_prompt (
    "date" text,
    id text,
    avg_rank text,
    avg_rank_compare text,
    avg_rank_diff text,
    avg_visibility_score text,
    avg_visibility_score_compare text,
    avg_visibility_score_diff text,
    prompt_text text,
    topic_id text,
    topic_name text,
    total_mentions text,
    total_mentions_compare text,
    total_mentions_diff text,
    total_models text,
    total_models_compare text,
    total_models_diff text,
    PRIMARY KEY ("date", id)
);
