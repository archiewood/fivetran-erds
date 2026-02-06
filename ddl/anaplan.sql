-- Note
--  This ERD includes two pre-defined tables, WORKSPACE and MODEL. The other tables depend on your Anaplan configuration.

CREATE TABLE model (
    id text,
    current_workspace_id text,
    active_state text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (current_workspace_id) REFERENCES workspace(id)
);

CREATE TABLE workspace (
    id text,
    active boolean,
    "name" text,
    PRIMARY KEY (id)
);
