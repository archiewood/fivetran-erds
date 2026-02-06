CREATE TABLE review_reviewer_attribute (
    "index" text,
    review_id text,
    title text,
    "type" text,
    "value" text,
    PRIMARY KEY ("index", review_id),
    FOREIGN KEY (review_id) REFERENCES review(id)
);

CREATE TABLE review_attribute_with_rating (
    "index" text,
    review_id text,
    max_label text,
    mid_label text,
    min_label text,
    title text,
    "type" text,
    "value" text,
    PRIMARY KEY ("index", review_id),
    FOREIGN KEY (review_id) REFERENCES review(id)
);

CREATE TABLE review_product_attribute (
    "index" text,
    review_id text,
    title text,
    "type" text,
    "value" text,
    PRIMARY KEY ("index", review_id),
    FOREIGN KEY (review_id) REFERENCES review(id)
);

CREATE TABLE review_tag (
    "index" text,
    review_id text,
    tags text,
    PRIMARY KEY ("index", review_id),
    FOREIGN KEY (review_id) REFERENCES review(id)
);

CREATE TABLE review (
    id text,
    body text,
    contains_profanity text,
    customer_id text,
    date_created timestamp,
    helpful_count text,
    is_recommended text,
    order_id text,
    order_number text,
    product_id text,
    product_name text,
    rating text,
    reply_body text,
    reply_date_created text,
    reply_is_private text,
    reply_raw_body text,
    reviewer_avatar_url text,
    reviewer_display_name text,
    reviewer_email text,
    reviewer_is_verified text,
    reviewer_location_country_code text,
    reviewer_location_country_name text,
    reviewer_location_zone_code text,
    reviewer_name text,
    reviewer_social_connection text,
    reviewer_verified_status text,
    reward_description text,
    reward_integration text,
    reward_is_coupon_upgrade text,
    reward_type text,
    reward_value text,
    sentiment text,
    "status" text,
    subscriber_id text,
    title text,
    unhelpful_count text,
    variant_id text,
    variant_name text,
    PRIMARY KEY (id)
);

CREATE TABLE review_media (
    stream_id text,
    review_id text,
    dynamic_key text,
    full_size_url text,
    is_hidden text,
    large_portrait_thumbnail_url text,
    large_url text,
    thumbnail_url text,
    "type" text,
    PRIMARY KEY (stream_id, review_id),
    FOREIGN KEY (review_id) REFERENCES review(id)
);
