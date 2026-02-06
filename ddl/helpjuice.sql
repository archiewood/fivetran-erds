CREATE TABLE activity (
    id text,
    owner_id text,
    "action" text,
    created_at text,
    trackable_id text,
    trackable_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (owner_id) REFERENCES users(id)
);

CREATE TABLE groups_users (
    group_id text,
    user_id text,
    PRIMARY KEY (group_id, user_id),
    FOREIGN KEY (group_id) REFERENCES groups(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE groups (
    id text,
    auto_groups jsonb,
    created_at text,
    "name" text,
    smart_load text,
    PRIMARY KEY (id)
);

CREATE TABLE category_published_question (
    question_id text,
    category_id text,
    "name" text,
    url text,
    views text,
    PRIMARY KEY (question_id, category_id),
    FOREIGN KEY (category_id) REFERENCES category(id)
);

CREATE TABLE category (
    id text,
    parent_id text,
    accessibility text,
    codename text,
    description text,
    hierarchy jsonb,
    icon text,
    image_url text,
    "name" text,
    sub_categories jsonb,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (parent_id) REFERENCES category(id)
);

CREATE TABLE users (
    id text,
    created_at text,
    email text,
    first_name text,
    last_name text,
    "name" text,
    role_id text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE article_answer (
    "index" text,
    article_id text,
    body text,
    body_txt text,
    format text,
    updated_at text,
    PRIMARY KEY ("index", article_id),
    FOREIGN KEY (article_id) REFERENCES article(id)
);

CREATE TABLE article_keyword (
    id text,
    article_id text,
    "name" text,
    PRIMARY KEY (id, article_id),
    FOREIGN KEY (article_id) REFERENCES article(id)
);

CREATE TABLE article (
    id text,
    author_id text,
    category_id text,
    accessibility text,
    codename text,
    created_at text,
    description text,
    hierarchy_id text,
    "name" text,
    next_expiration_on text,
    published text,
    updated_at timestamp,
    url text,
    views text,
    PRIMARY KEY (id),
    FOREIGN KEY (author_id) REFERENCES users(id),
    FOREIGN KEY (category_id) REFERENCES category(id)
);
