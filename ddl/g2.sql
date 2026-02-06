CREATE TABLE track_prospect (
    id bigint,
    external_id text,
    first_seen_occurred_at timestamp,
    first_seen_path text,
    first_seen_scope text,
    industry text,
    isp boolean,
    last_seen_occurred_at timestamp,
    last_seen_path text,
    last_seen_scope text,
    organization text,
    saw_first text,
    visitor_id text,
    PRIMARY KEY (id)
);

CREATE TABLE answer (
    id bigint,
    product_id text,
    question_id text,
    survey_response_id bigint,
    created_at timestamp,
    input_type text,
    question_text text,
    question_type text,
    updated_at timestamp,
    "value" text,
    PRIMARY KEY (id),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (question_id) REFERENCES question(id),
    FOREIGN KEY (survey_response_id) REFERENCES survey_response(id)
);

CREATE TABLE resource_subscription (
    id bigint,
    product_uuid text,
    post_url text,
    product_id text,
    subscribed_resource text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (product_uuid) REFERENCES product(id)
);

CREATE TABLE vendor_product (
    product_id text,
    vendor_id text,
    PRIMARY KEY (product_id, vendor_id),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (vendor_id) REFERENCES vendor(id)
);

CREATE TABLE question (
    id bigint,
    survey_response_id bigint,
    description text,
    input_type text,
    is_required boolean,
    question_type text,
    text_template text,
    title text,
    PRIMARY KEY (id),
    FOREIGN KEY (survey_response_id) REFERENCES survey_response(id)
);

CREATE TABLE company (
    id bigint,
    event_stream_id bigint,
    external_id text,
    alexa_global_rank bigint,
    alexa_us_rank bigint,
    annual_revenue text,
    city text,
    company_type text,
    country text,
    country_code text,
    crunchbase text,
    description text,
    domain text,
    domain_aliases jsonb,
    email_provider text,
    employees bigint,
    employees_range text,
    founded_year bigint,
    latitude text,
    legal_name text,
    linkedin text,
    location text,
    longitude text,
    market_cap text,
    "name" text,
    postal_code text,
    raised text,
    site_author text,
    site_h_1 text,
    site_meta text,
    site_title text,
    "state" text,
    state_code text,
    street_name text,
    street_number text,
    sub_premise text,
    tags jsonb,
    tech jsonb,
    time_zone text,
    twitter text,
    twitter_avatar text,
    twitter_bio text,
    twitter_followers bigint,
    twitter_following bigint,
    twitter_id text,
    twitter_location text,
    twitter_site text,
    url text,
    utc_offset bigint,
    PRIMARY KEY (id),
    FOREIGN KEY (event_stream_id) REFERENCES event_stream(id),
    FOREIGN KEY (external_id) REFERENCES track_prospect(id)
);

CREATE TABLE event_stream (
    id bigint,
    visitor_id text,
    category_ids jsonb,
    city text,
    country text,
    country_code text,
    created_at timestamp,
    organization text,
    product_ids jsonb,
    "state" text,
    state_code text,
    tags text,
    "time" timestamp,
    title text,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (visitor_id) REFERENCES track_prospect(id)
);

CREATE TABLE product_rating (
    product_id text,
    main_category_id text,
    category_average_ease_of_setup double precision,
    category_average_ease_of_use double precision,
    category_average_quality_of_support double precision,
    category_name text,
    product_average_ease_of_setup double precision,
    product_average_ease_of_use double precision,
    product_average_quality_of_support double precision,
    PRIMARY KEY (product_id),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (main_category_id) REFERENCES category(id)
);

CREATE TABLE product_feature (
    product_feature_id bigint,
    product_id text,
    question_id bigint,
    available boolean,
    description text,
    percentage double precision,
    review_count bigint,
    section_title text,
    text text,
    PRIMARY KEY (product_feature_id),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (question_id) REFERENCES question(id)
);

CREATE TABLE product (
    id text,
    avg_rating double precision,
    created_at timestamp,
    description text,
    detail_description text,
    domain text,
    image_url text,
    "name" text,
    product_type text,
    product_url text,
    public_detail_url text,
    review_count bigint,
    short_name text,
    slug text,
    star_rating double precision,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE category (
    id text,
    description text,
    "name" text,
    slug text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE product_category (
    category_id text,
    product_id text,
    PRIMARY KEY (category_id, product_id),
    FOREIGN KEY (category_id) REFERENCES category(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE vendor (
    id text,
    company_website text,
    description text,
    "name" text,
    public_product_count bigint,
    slug text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE product_competitor (
    competitor_id text,
    product_id text,
    PRIMARY KEY (competitor_id),
    FOREIGN KEY (competitor_id) REFERENCES product(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE survey_response (
    id bigint,
    product_id text,
    country_name text,
    default_sort double precision,
    ease_of_doing_business_with_text text,
    ease_of_doing_business_with_value double precision,
    ease_of_setup_text text,
    ease_of_setup_value double precision,
    hate_text text,
    hate_value text,
    is_business_partner boolean,
    is_public boolean,
    love_text text,
    love_value text,
    meet_requirement_text text,
    meet_requirement_value double precision,
    moderated_at timestamp,
    percent_complete double precision,
    product_name text,
    recommendation_text text,
    recommendation_value text,
    reference_user_consent text,
    regions jsonb,
    review_source text,
    slug text,
    star_rating double precision,
    "status" text,
    submitted_at timestamp,
    title text,
    updated_at timestamp,
    user_id text,
    user_image_url text,
    user_name text,
    verified_current_user boolean,
    votes_down bigint,
    votes_total bigint,
    votes_up bigint,
    PRIMARY KEY (id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE history_compared_product (
    history_id bigint,
    product_id text,
    product_name text,
    PRIMARY KEY (history_id, product_id),
    FOREIGN KEY (history_id) REFERENCES history(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE history (
    id bigint,
    category_pageview bigint,
    company_country text,
    company_domain text,
    company_name text,
    company_state text,
    comparison_pageview bigint,
    competitor_pageview bigint,
    direct_pageview bigint,
    intent_score bigint,
    last_seen_at timestamp,
    product_profile_pageview bigint,
    sponsored_content_pageview bigint,
    total_pageview bigint,
    visitor_count bigint,
    PRIMARY KEY (id)
);
