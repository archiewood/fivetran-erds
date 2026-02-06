CREATE TABLE task_link (
    "index" text,
    task_id text,
    description text,
    link text,
    "type" text,
    PRIMARY KEY ("index", task_id),
    FOREIGN KEY (task_id) REFERENCES task(id)
);

CREATE TABLE task (
    id text,
    parent text,
    tasklist_id text,
    completed timestamp,
    deleted boolean,
    due timestamp,
    etag text,
    hidden boolean,
    kind text,
    notes text,
    "position" text,
    self_link text,
    "status" text,
    title text,
    updated timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (parent) REFERENCES task(id),
    FOREIGN KEY (tasklist_id) REFERENCES tasklist(id)
);

CREATE TABLE tasklist (
    id text,
    etag text,
    kind text,
    self_link text,
    title text,
    updated timestamp,
    PRIMARY KEY (id)
);
