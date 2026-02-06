CREATE TABLE groups (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE classification (
    id text,
    group_id text,
    parent_classification_id text,
    profile_id text,
    created_at text,
    hierarchy text,
    "level" text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (group_id) REFERENCES groups(id),
    FOREIGN KEY (parent_classification_id) REFERENCES classification(id),
    FOREIGN KEY (profile_id) REFERENCES profile(id)
);

CREATE TABLE additional_info (
    conversation_custom_field_id text,
    group_id text,
    created_at text,
    field text,
    field_name text,
    field_type text,
    field_values text,
    "type" text,
    PRIMARY KEY (conversation_custom_field_id),
    FOREIGN KEY (group_id) REFERENCES groups(id)
);

CREATE TABLE topic (
    id text,
    group_id text,
    created_at text,
    created_by text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (group_id) REFERENCES groups(id)
);

CREATE TABLE message_cluster (
    id text,
    cluster_id text,
    group_id text,
    case_type text,
    classification_1 text,
    classification_1_sentiment text,
    classification_2 text,
    classification_3 text,
    classification_msg text,
    classified_by text,
    classified_comment text,
    classified_date text,
    gender text,
    is_classification_automated text,
    is_classified text,
    languages text,
    likes_count text,
    link text,
    media_type text,
    message_title text,
    profile_id text,
    profile_name text,
    publish_date text,
    sentiment text,
    star_rating text,
    ticket_date text,
    ticket_id text,
    ticket_status text,
    title text,
    unique_contact_id text,
    unique_message_id text,
    user_favourites_count text,
    user_image_url text,
    user_name text,
    user_profile_url text,
    user_unique_name text,
    PRIMARY KEY (id),
    FOREIGN KEY (cluster_id) REFERENCES cluster(id),
    FOREIGN KEY (group_id) REFERENCES groups(id)
);

CREATE TABLE profile (
    id text,
    group_id text,
    created_at text,
    created_by text,
    location_data text,
    logo_html text,
    media text,
    "name" text,
    page_user_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (group_id) REFERENCES groups(id)
);

CREATE TABLE message_profile (
    id text,
    group_id text,
    profile_id text,
    case_type text,
    classification_1 text,
    classification_1_sentiment text,
    classification_2 text,
    classification_3 text,
    classification_msg text,
    classified_by text,
    classified_comment text,
    classified_date text,
    gender text,
    is_classification_automated text,
    is_classified text,
    languages text,
    likes_count text,
    link text,
    media_type text,
    message_title text,
    profile_name text,
    publish_date text,
    sentiment text,
    star_rating text,
    ticket_date text,
    ticket_id text,
    ticket_status text,
    title text,
    unique_contact_id text,
    unique_message_id text,
    user_favourites_count text,
    user_image_url text,
    user_name text,
    user_profile_url text,
    user_unique_name text,
    PRIMARY KEY (id),
    FOREIGN KEY (group_id) REFERENCES groups(id),
    FOREIGN KEY (profile_id) REFERENCES profile(id)
);

CREATE TABLE message_topic (
    id text,
    group_id text,
    topic_id text,
    case_type text,
    classification_1 text,
    classification_1_sentiment text,
    classification_2 text,
    classification_3 text,
    country text,
    gender text,
    is_classification_automated text,
    is_classified text,
    is_replied_tweet text,
    is_retweeted_tweet text,
    languages text,
    likes_count text,
    media_type text,
    profile_id text,
    profile_name text,
    sentiment text,
    shares_count text,
    star_rating text,
    ticket_date text,
    ticket_id text,
    ticket_status text,
    title text,
    unique_contact_id text,
    unique_message_id text,
    user_favourites_count text,
    PRIMARY KEY (id),
    FOREIGN KEY (group_id) REFERENCES groups(id),
    FOREIGN KEY (topic_id) REFERENCES topic(id)
);

CREATE TABLE commenter_type (
    id text,
    group_id text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (group_id) REFERENCES groups(id)
);

CREATE TABLE commenter_level (
    id text,
    group_id text,
    "level" text,
    PRIMARY KEY (id),
    FOREIGN KEY (group_id) REFERENCES groups(id)
);

CREATE TABLE conversation_type (
    id text,
    group_id text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (group_id) REFERENCES groups(id)
);

CREATE TABLE cluster (
    id text,
    group_id text,
    created_at text,
    created_by text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (group_id) REFERENCES groups(id)
);

CREATE TABLE severity (
    id text,
    "type" text,
    group_id text,
    and_contain text,
    color text,
    contain text,
    created_at text,
    display_name text,
    does_not_contain text,
    followers_greater_than text,
    followers_less_than text,
    sentiment_name text,
    sentiments text,
    PRIMARY KEY (id, "type"),
    FOREIGN KEY (group_id) REFERENCES groups(id)
);
