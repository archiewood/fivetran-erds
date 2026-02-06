CREATE TABLE employee_goal (
    employee_id integer,
    goal_id integer,
    PRIMARY KEY (employee_id, goal_id),
    FOREIGN KEY (employee_id) REFERENCES employee(id),
    FOREIGN KEY (goal_id) REFERENCES goal(id)
);

CREATE TABLE goal (
    id integer,
    completed_at timestamp,
    description text,
    due_date text,
    percent_complete integer,
    "status" text,
    title text,
    PRIMARY KEY (id)
);

CREATE TABLE time_off_policy (
    id integer,
    type_id integer,
    effective_date text,
    "name" text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (type_id) REFERENCES time_off_type(id)
);

CREATE TABLE training_category (
    id integer,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE employee_time_off_policy (
    employee_id integer,
    policy_id integer,
    accrual_start_date text,
    PRIMARY KEY (employee_id, policy_id),
    FOREIGN KEY (employee_id) REFERENCES employee(id),
    FOREIGN KEY (policy_id) REFERENCES time_off_policy(id)
);

CREATE TABLE account_user (
    id integer,
    employee_id integer,
    email text,
    first_name text,
    last_login timestamp,
    last_name text,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (employee_id) REFERENCES employee(id)
);

CREATE TABLE time_off_request (
    id integer,
    employee_id integer,
    amount text,
    created_at text,
    end_date text,
    "name" text,
    notes_employee text,
    notes_manager text,
    start_date text,
    "status" text,
    status_changed_at text,
    status_changed_by integer,
    type_id integer,
    unit text,
    PRIMARY KEY (id),
    FOREIGN KEY (employee_id) REFERENCES employee(id)
);

CREATE TABLE time_off_type (
    id integer,
    "name" text,
    units text,
    PRIMARY KEY (id)
);

CREATE TABLE employee_dependent (
    id integer,
    employee_id integer,
    address_line_1 text,
    address_line_2 text,
    city text,
    country text,
    date_of_birth text,
    first_name text,
    gender text,
    is_student text,
    is_us_citizen text,
    last_name text,
    masked_sin text,
    masked_ssn text,
    middle_name text,
    relationship text,
    "state" text,
    zip_code text,
    PRIMARY KEY (id),
    FOREIGN KEY (employee_id) REFERENCES employee(id)
);

CREATE TABLE employee (
    id integer,
    last_changed timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE milestone (
    id integer,
    goal_id integer,
    completed_at timestamp,
    current_value integer,
    end_value integer,
    start_value integer,
    title text,
    updated_at timestamp,
    updated_by integer,
    PRIMARY KEY (id, goal_id),
    FOREIGN KEY (goal_id) REFERENCES goal(id)
);

CREATE TABLE training (
    id integer,
    employee_id integer,
    type_id integer,
    completed_at text,
    cost text,
    credits text,
    hours text,
    instructor text,
    notes text,
    PRIMARY KEY (id),
    FOREIGN KEY (employee_id) REFERENCES employee(id),
    FOREIGN KEY (type_id) REFERENCES training_type(id)
);

CREATE TABLE training_type (
    id integer,
    category_id integer,
    description text,
    due_from_hire_date_amount text,
    due_from_hire_date_unit text,
    frequency integer,
    link_url text,
    "name" text,
    renewable boolean,
    required boolean,
    PRIMARY KEY (id),
    FOREIGN KEY (category_id) REFERENCES training_category(id)
);
