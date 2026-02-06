CREATE TABLE post (
    id text,
    owner_id text,
    archived_at text,
    banner_original text,
    banner_preset text,
    banner_thumb text,
    banner_url text,
    content jsonb,
    html jsonb,
    inserted_at text,
    link_access text,
    markdown jsonb,
    published_at text,
    published_version jsonb,
    "state" text,
    title text,
    updated_at text,
    version text,
    PRIMARY KEY (id),
    FOREIGN KEY (owner_id) REFERENCES users(id)
);

CREATE TABLE topic_ancestor (
    ancestor_id text,
    topic_id text,
    PRIMARY KEY (ancestor_id, topic_id),
    FOREIGN KEY (ancestor_id) REFERENCES topic(id),
    FOREIGN KEY (topic_id) REFERENCES topic(id)
);

CREATE TABLE topic_children (
    children_id text,
    topic_id text,
    PRIMARY KEY (children_id, topic_id),
    FOREIGN KEY (children_id) REFERENCES topic(id),
    FOREIGN KEY (topic_id) REFERENCES topic(id)
);

CREATE TABLE topic_hierarchy (
    hierarchy text,
    topic_id text,
    PRIMARY KEY (hierarchy, topic_id),
    FOREIGN KEY (topic_id) REFERENCES topic(id)
);

CREATE TABLE topic_owner (
    owner_id text,
    topic_id text,
    PRIMARY KEY (owner_id, topic_id),
    FOREIGN KEY (owner_id) REFERENCES users(id),
    FOREIGN KEY (topic_id) REFERENCES topic(id)
);

CREATE TABLE topic_member (
    member_id text,
    topic_id text,
    PRIMARY KEY (member_id, topic_id),
    FOREIGN KEY (member_id) REFERENCES users(id),
    FOREIGN KEY (topic_id) REFERENCES topic(id)
);

CREATE TABLE topic (
    id text,
    organization_id text,
    parent_id text,
    banner_original text,
    banner_thumb text,
    description text,
    inherit_parent text,
    inserted_at text,
    member_editable text,
    "name" text,
    privacy text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (organization_id) REFERENCES organization(id),
    FOREIGN KEY (parent_id) REFERENCES topic(id)
);

CREATE TABLE post_topic (
    post_id text,
    topic_id text,
    PRIMARY KEY (post_id, topic_id),
    FOREIGN KEY (post_id) REFERENCES post(id),
    FOREIGN KEY (topic_id) REFERENCES topic(id)
);

CREATE TABLE organization (
    id text,
    host text,
    inserted_at text,
    "name" text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE users (
    id text,
    organization_id text,
    avatar_original text,
    avatar_thumb text,
    deactivated_at text,
    description text,
    email text,
    inserted_at text,
    "name" text,
    title text,
    "type" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);
