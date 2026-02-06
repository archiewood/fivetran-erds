CREATE TABLE block_children_database (
    id text,
    block_database_id text,
    block_parent_database_id text,
    archived boolean,
    created_by text,
    created_time timestamp,
    has_children boolean,
    last_edited_by text,
    last_edited_time timestamp,
    parent_block_id text,
    parent_type text,
    PRIMARY KEY (id, block_database_id, block_parent_database_id),
    FOREIGN KEY (block_database_id) REFERENCES block_parent_database(block_database_id),
    FOREIGN KEY (block_parent_database_id) REFERENCES block_parent_database(id)
);

CREATE TABLE block_parent_database (
    id text,
    block_database_id text,
    archived boolean,
    created_by text,
    created_time timestamp,
    has_children boolean,
    last_edited_by text,
    last_edited_time timestamp,
    parent_block_id text,
    parent_type text,
    PRIMARY KEY (id, block_database_id),
    FOREIGN KEY (block_database_id) REFERENCES block_database(id)
);

CREATE TABLE page_comment (
    id text,
    block_page_id text,
    created_by text,
    page_id text,
    created_time timestamp,
    discussion_id text,
    last_edited_time timestamp,
    PRIMARY KEY (id, block_page_id),
    FOREIGN KEY (block_page_id) REFERENCES block_page(id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (page_id) REFERENCES page(id)
);

CREATE TABLE page_property (
    id text,
    page_id text,
    "type" text,
    PRIMARY KEY (id, page_id),
    FOREIGN KEY (page_id) REFERENCES page(id)
);

CREATE TABLE page (
    id text,
    created_by text,
    database_id text,
    last_edited_by text,
    parent_page_id text,
    archived boolean,
    block_id text,
    cover text,
    created_time timestamp,
    description jsonb,
    icon text,
    is_inline boolean,
    last_edited_time timestamp,
    object text,
    url text,
    workspace text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (database_id) REFERENCES database_object(id),
    FOREIGN KEY (last_edited_by) REFERENCES users(id),
    FOREIGN KEY (parent_page_id) REFERENCES page(id)
);

CREATE TABLE database_object_property (
    id text,
    database_object_id text,
    color text,
    "name" text,
    "type" text,
    PRIMARY KEY (id, database_object_id),
    FOREIGN KEY (database_object_id) REFERENCES database_object(id)
);

CREATE TABLE database_object (
    id text,
    created_by text,
    last_edited_by text,
    page_id text,
    parent_database_id text,
    archived boolean,
    block_id text,
    cover text,
    created_time timestamp,
    description jsonb,
    icon text,
    is_inline boolean,
    last_edited_time timestamp,
    object text,
    url text,
    workspace text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (last_edited_by) REFERENCES users(id),
    FOREIGN KEY (page_id) REFERENCES page(id),
    FOREIGN KEY (parent_database_id) REFERENCES database_object(id)
);

CREATE TABLE block_comment (
    id text,
    block_database_id text,
    created_by text,
    page_id text,
    created_time timestamp,
    discussion_id text,
    last_edited_time timestamp,
    PRIMARY KEY (id, block_database_id),
    FOREIGN KEY (block_database_id) REFERENCES block_database(id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (page_id) REFERENCES page(id)
);

CREATE TABLE block_parent_page (
    id text,
    block_page_id text,
    archived boolean,
    created_by text,
    created_time timestamp,
    has_children boolean,
    last_edited_by text,
    last_edited_time timestamp,
    parent_block_id text,
    parent_type text,
    PRIMARY KEY (id, block_page_id),
    FOREIGN KEY (block_page_id) REFERENCES block_page(id)
);

CREATE TABLE block_database (
    id text,
    parent_database_id text,
    archived boolean,
    created_by text,
    created_time timestamp,
    has_children boolean,
    last_edited_by text,
    last_edited_time timestamp,
    parent_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (parent_database_id) REFERENCES database_object(id)
);

CREATE TABLE block_children_page (
    id text,
    block_page_id text,
    block_parent_page_id text,
    archived boolean,
    created_by text,
    created_time timestamp,
    has_children boolean,
    last_edited_by text,
    last_edited_time timestamp,
    parent_block_id text,
    parent_type text,
    PRIMARY KEY (id, block_page_id, block_parent_page_id),
    FOREIGN KEY (block_page_id) REFERENCES block_parent_page(block_page_id),
    FOREIGN KEY (block_parent_page_id) REFERENCES block_parent_page(id)
);

CREATE TABLE block_page (
    id text,
    parent_page_id text,
    archived boolean,
    created_by text,
    created_time timestamp,
    has_children boolean,
    last_edited_by text,
    last_edited_time timestamp,
    parent_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (parent_page_id) REFERENCES page(id)
);

CREATE TABLE user_bot (
    _fivetran_id text,
    user_id text,
    workspace_name text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    email text,
    "name" text,
    PRIMARY KEY (id)
);
