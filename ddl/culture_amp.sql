CREATE TABLE performance_cycle (
    id text,
    created_at text,
    "name" text,
    processed_at text,
    "state" text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE manager_review_multiple_choice_option (
    "index" text,
    manager_review_id text,
    multiple_choice_index text,
    "option" text,
    PRIMARY KEY ("index", manager_review_id, multiple_choice_index),
    FOREIGN KEY (manager_review_id) REFERENCES manager_review_multiple_choice(manager_review_id),
    FOREIGN KEY (multiple_choice_index) REFERENCES manager_review_multiple_choice("index")
);

CREATE TABLE manager_review_multiple_choice (
    "index" text,
    manager_review_id text,
    answer text,
    text text,
    PRIMARY KEY ("index", manager_review_id),
    FOREIGN KEY (manager_review_id) REFERENCES manager_review(id)
);

CREATE TABLE manager_review_open_text_question (
    "index" text,
    manager_review_id text,
    answer text,
    text text,
    PRIMARY KEY ("index", manager_review_id),
    FOREIGN KEY (manager_review_id) REFERENCES manager_review(id)
);

CREATE TABLE manager_review_performance_rating_bucket (
    "index" text,
    manager_review_id text,
    created_at text,
    description text,
    id text,
    title text,
    updated_at text,
    "value" text,
    PRIMARY KEY ("index", manager_review_id),
    FOREIGN KEY (manager_review_id) REFERENCES manager_review(id)
);

CREATE TABLE manager_review_performance_rating_question (
    "index" text,
    manager_review_id text,
    description text,
    title text,
    PRIMARY KEY ("index", manager_review_id),
    FOREIGN KEY (manager_review_id) REFERENCES manager_review(id)
);

CREATE TABLE manager_review_performance_rating (
    id text,
    manager_review_id text,
    created_at text,
    description text,
    title text,
    updated_at text,
    "value" text,
    PRIMARY KEY (id, manager_review_id),
    FOREIGN KEY (manager_review_id) REFERENCES manager_review(id)
);

CREATE TABLE manager_review (
    id text,
    employee_id text,
    manager_id text,
    performance_cycle_id text,
    completed_at text,
    created_at text,
    processed_at text,
    review_acknowledged text,
    "status" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (employee_id) REFERENCES employee(id),
    FOREIGN KEY (manager_id) REFERENCES employee(id),
    FOREIGN KEY (performance_cycle_id) REFERENCES performance_cycle(id)
);

CREATE TABLE employee (
    id text,
    birth_date text,
    email text,
    end_date text,
    identifier text,
    "name" text,
    processed_at text,
    start_date text,
    PRIMARY KEY (id)
);
