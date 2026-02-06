CREATE TABLE session_data_path (
    _fivetran_id text,
    tree_id text,
    button_text text,
    from_node_id text,
    page_title text,
    question text,
    seconds bigint,
    seq integer,
    "source" text,
    subtree text,
    "time" text,
    to_node_id text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (tree_id) REFERENCES session_data(tree_id)
);

CREATE TABLE session_data (
    session_id text,
    tree_id text,
    browser text,
    duration_seconds bigint,
    ip text,
    last_click_time_pst timestamp,
    last_click_time_utc timestamp,
    notes text,
    os text,
    "result" text,
    "source" text,
    start_time_pst timestamp,
    start_time_utc timestamp,
    time_spent text,
    total_score text,
    tree_name text,
    PRIMARY KEY (session_id, tree_id),
    FOREIGN KEY (session_id) REFERENCES agent_session(id),
    FOREIGN KEY (tree_id) REFERENCES tree(tree_id)
);

CREATE TABLE tree_session (
    session_id text,
    tree_id text,
    agent text,
    duration text,
    last_click_time timestamp,
    resolution_state text,
    start_time timestamp,
    total_score text,
    PRIMARY KEY (session_id, tree_id),
    FOREIGN KEY (session_id) REFERENCES agent_session(id),
    FOREIGN KEY (tree_id) REFERENCES tree(tree_id)
);

CREATE TABLE tree_structure_node_button (
    _fivetran_id text,
    tree_structure_node_node_id text,
    button_link text,
    button_text text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (tree_structure_node_node_id) REFERENCES tree_structure_node(node_id)
);

CREATE TABLE tree_structure_node (
    node_id text,
    tree_id text,
    root_node_id text,
    content text,
    keyword text,
    open_tree_id text,
    page_title text,
    question text,
    success text,
    tags text,
    "type" text,
    PRIMARY KEY (node_id, tree_id),
    FOREIGN KEY (tree_id) REFERENCES tree_structure(tree_id),
    FOREIGN KEY (root_node_id) REFERENCES tree_structure(root_node_id)
);

CREATE TABLE tree_structure (
    root_node_id text,
    tree_id text,
    description text,
    tree_name text,
    PRIMARY KEY (root_node_id, tree_id),
    FOREIGN KEY (tree_id) REFERENCES tree(tree_id)
);

CREATE TABLE session_note (
    note text,
    session_id text,
    PRIMARY KEY (note, session_id),
    FOREIGN KEY (session_id) REFERENCES agent_session(id)
);

CREATE TABLE agent_session (
    id text,
    tree_id text,
    agent text,
    resolution_state text,
    start_time timestamp,
    total_score text,
    PRIMARY KEY (id),
    FOREIGN KEY (tree_id) REFERENCES tree(tree_id)
);

CREATE TABLE form_data (
    session_id text,
    agent text,
    agent_first_name text,
    agent_name text,
    "comment" text,
    organization text,
    PRIMARY KEY (session_id),
    FOREIGN KEY (session_id) REFERENCES agent_session(id)
);

CREATE TABLE event_log (
    session_id text,
    "timestamp" timestamp,
    id text,
    tree_id text,
    data text,
    details text,
    ip text,
    severity text,
    "type" text,
    user_name text,
    PRIMARY KEY (session_id, "timestamp"),
    FOREIGN KEY (id) REFERENCES agent_session(id),
    FOREIGN KEY (tree_id) REFERENCES tree(tree_id)
);

CREATE TABLE tree_variable_var (
    tree_id text,
    variable_name text,
    PRIMARY KEY (tree_id, variable_name)
);

CREATE TABLE tree (
    tree_id text,
    description text,
    "name" text,
    tags text,
    PRIMARY KEY (tree_id)
);
