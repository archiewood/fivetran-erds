CREATE TABLE board (
    id text,
    created text,
    is_private text,
    "name" text,
    post_count text,
    private_comments text,
    token text,
    url text,
    PRIMARY KEY (id)
);

CREATE TABLE vote_zendesk_ticket (
    id text,
    vote_id text,
    created text,
    description text,
    subject text,
    url text,
    PRIMARY KEY (id, vote_id),
    FOREIGN KEY (vote_id) REFERENCES vote(id)
);

CREATE TABLE vote (
    id text,
    board_id text,
    by_user_id text,
    voter_user_id text,
    created text,
    post_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (board_id) REFERENCES post(id),
    FOREIGN KEY (by_user_id) REFERENCES users(id),
    FOREIGN KEY (voter_user_id) REFERENCES users(id)
);

CREATE TABLE entry_label (
    id text,
    entry_id text,
    created text,
    entry_count text,
    "name" text,
    url text,
    PRIMARY KEY (id, entry_id),
    FOREIGN KEY (entry_id) REFERENCES entry(id)
);

CREATE TABLE entry_type (
    "name" text,
    entry_id text,
    PRIMARY KEY ("name", entry_id),
    FOREIGN KEY (entry_id) REFERENCES entry(id)
);

CREATE TABLE entry_post (
    entry_id text,
    id text,
    PRIMARY KEY (entry_id, id),
    FOREIGN KEY (entry_id) REFERENCES entry(id),
    FOREIGN KEY (id) REFERENCES post(id)
);

CREATE TABLE entry (
    id text,
    created text,
    last_saved text,
    likes text,
    markdown_details text,
    plaintext_details text,
    published_at text,
    scheduled_for text,
    "status" text,
    title text,
    url text,
    PRIMARY KEY (id)
);

CREATE TABLE post_tag (
    id text,
    post_id text,
    PRIMARY KEY (id, post_id),
    FOREIGN KEY (id) REFERENCES tags(id),
    FOREIGN KEY (post_id) REFERENCES post(id)
);

CREATE TABLE post_linked_task (
    id text,
    post_id text,
    link_id text,
    "name" text,
    "status" text,
    url text,
    PRIMARY KEY (id, post_id),
    FOREIGN KEY (post_id) REFERENCES post(id)
);

CREATE TABLE post_linked_issue (
    id text,
    post_id text,
    "key" text,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (post_id) REFERENCES post(id)
);

CREATE TABLE post_merge_history (
    post_id text,
    created text,
    PRIMARY KEY (post_id),
    FOREIGN KEY (post_id) REFERENCES post(id)
);

CREATE TABLE post (
    id text,
    author_user_id text,
    board_id text,
    by_user_id text,
    category_id text,
    owner_id text,
    comment_count text,
    created text,
    custom_fields jsonb,
    details text,
    eta text,
    image_urls jsonb,
    score text,
    "status" text,
    status_changed_at text,
    title text,
    total_mrr text,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (author_user_id) REFERENCES users(id),
    FOREIGN KEY (board_id) REFERENCES board(id),
    FOREIGN KEY (by_user_id) REFERENCES users(id),
    FOREIGN KEY (category_id) REFERENCES category(id),
    FOREIGN KEY (owner_id) REFERENCES users(id)
);

CREATE TABLE comment_mention (
    comment_id text,
    id text,
    PRIMARY KEY (comment_id, id),
    FOREIGN KEY (comment_id) REFERENCES "comment"(id),
    FOREIGN KEY (id) REFERENCES users(id)
);

CREATE TABLE "comment" (
    id text,
    author_id text,
    board_id text,
    post_id text,
    created text,
    image_urls jsonb,
    internal text,
    like_count text,
    likes text,
    parent_id text,
    private text,
    "status" text,
    "value" text,
    PRIMARY KEY (id),
    FOREIGN KEY (author_id) REFERENCES users(id),
    FOREIGN KEY (board_id) REFERENCES board(id),
    FOREIGN KEY (post_id) REFERENCES post(id)
);

CREATE TABLE company_attribute (
    "name" text,
    company_id text,
    "value" text,
    PRIMARY KEY ("name", company_id),
    FOREIGN KEY (company_id) REFERENCES company(id)
);

CREATE TABLE company (
    id text,
    created text,
    domain text,
    member_count text,
    monthly_spend text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE category (
    id text,
    board_id text,
    created text,
    "name" text,
    parent_id text,
    post_count text,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (board_id) REFERENCES board(id)
);

CREATE TABLE status_change (
    id text,
    changer_user_id text,
    post_id text,
    created text,
    image_urls jsonb,
    "status" text,
    "value" text,
    PRIMARY KEY (id),
    FOREIGN KEY (changer_user_id) REFERENCES users(id),
    FOREIGN KEY (post_id) REFERENCES post(id)
);

CREATE TABLE user_attribute (
    "name" text,
    users_id text,
    "value" text,
    PRIMARY KEY ("name", users_id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    avatar_url text,
    created text,
    email text,
    is_admin text,
    last_activity text,
    "name" text,
    url text,
    user_id text,
    PRIMARY KEY (id)
);

CREATE TABLE opporunity_post (
    id text,
    opportunity_id text,
    PRIMARY KEY (id, opportunity_id),
    FOREIGN KEY (id) REFERENCES post(id),
    FOREIGN KEY (opportunity_id) REFERENCES opportunity(id)
);

CREATE TABLE opportunity (
    id text,
    closed text,
    "name" text,
    salesforce_opportunity_id text,
    "value" text,
    won text,
    PRIMARY KEY (id)
);

CREATE TABLE tags (
    id text,
    board_id text,
    created text,
    "name" text,
    post_count text,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (board_id) REFERENCES board(id)
);
