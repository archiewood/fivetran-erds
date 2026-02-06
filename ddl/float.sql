CREATE TABLE task_people_id (
    people_id text,
    task_id text,
    PRIMARY KEY (people_id, task_id),
    FOREIGN KEY (people_id) REFERENCES people(id),
    FOREIGN KEY (task_id) REFERENCES task(id)
);

CREATE TABLE task (
    id text,
    created_by text,
    modified_by text,
    parent_task_id text,
    people_id text,
    phase_id text,
    project_id text,
    root_task_id text,
    billable text,
    created text,
    end_date text,
    "hour" text,
    modified text,
    "name" text,
    note text,
    repeat_end_date text,
    repeat_state text,
    start_date text,
    start_time text,
    "status" text,
    task_meta_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES account(id),
    FOREIGN KEY (modified_by) REFERENCES account(id),
    FOREIGN KEY (parent_task_id) REFERENCES task(id),
    FOREIGN KEY (people_id) REFERENCES people(id),
    FOREIGN KEY (phase_id) REFERENCES phase(id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (root_task_id) REFERENCES task(id)
);

CREATE TABLE project_tag (
    "index" text,
    project_id text,
    tags text,
    PRIMARY KEY ("index", project_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE project_team (
    people_id text,
    project_id text,
    hourly_rate text,
    PRIMARY KEY (people_id, project_id),
    FOREIGN KEY (people_id) REFERENCES people(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE project (
    id text,
    client_id text,
    project_manager text,
    active text,
    all_pms_schedule text,
    budget_per_phase text,
    budget_total text,
    budget_type text,
    color text,
    created text,
    default_hourly_rate text,
    locked_task_list text,
    modified text,
    "name" text,
    non_billable text,
    note text,
    tentative text,
    PRIMARY KEY (id),
    FOREIGN KEY (client_id) REFERENCES client(client_id),
    FOREIGN KEY (project_manager) REFERENCES account(id)
);

CREATE TABLE timeoff_type (
    id text,
    created_by text,
    active text,
    approval_required text,
    color text,
    timeoff_type_name text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES account(id)
);

CREATE TABLE department (
    id text,
    parent_id text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (parent_id) REFERENCES department(id)
);

CREATE TABLE milestone (
    id text,
    phase_id text,
    project_id text,
    created text,
    "date" text,
    end_date text,
    modified text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (phase_id) REFERENCES phase(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE public_holiday (
    id text,
    dates jsonb,
    "name" text,
    region text,
    PRIMARY KEY (id)
);

CREATE TABLE client (
    client_id text,
    "name" text,
    PRIMARY KEY (client_id)
);

CREATE TABLE team_holiday (
    id text,
    "date" text,
    end_date text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE phase_team (
    people_id text,
    phase_id text,
    hourly_rate text,
    PRIMARY KEY (people_id, phase_id),
    FOREIGN KEY (people_id) REFERENCES people(id),
    FOREIGN KEY (phase_id) REFERENCES phase(id)
);

CREATE TABLE phase (
    id text,
    project_id text,
    active text,
    budget_total text,
    color text,
    created text,
    default_hourly_rate text,
    end_date text,
    modified text,
    "name" text,
    non_billable text,
    note text,
    start_date text,
    tentative text,
    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE "status" (
    id text,
    created_by text,
    modified_by text,
    people_id text,
    created text,
    end_date text,
    modified text,
    repeat_end text,
    repeat_state text,
    start_date text,
    status_name text,
    status_type_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES account(id),
    FOREIGN KEY (modified_by) REFERENCES account(id),
    FOREIGN KEY (people_id) REFERENCES people(id)
);

CREATE TABLE account (
    id text,
    department_filter_id text,
    people_id text,
    access text,
    account_type text,
    active text,
    avatar text,
    budget_right text,
    created text,
    department_filter jsonb,
    edit_right text,
    email text,
    modified text,
    "name" text,
    timezone text,
    view_right text,
    PRIMARY KEY (id),
    FOREIGN KEY (department_filter_id) REFERENCES department(id),
    FOREIGN KEY (people_id) REFERENCES people(id)
);

CREATE TABLE report_people (
    end_date text,
    start_date text,
    people_id text,
    billable text,
    capacity text,
    co_hour text,
    co_hours_history text,
    my_hour text,
    my_hours_history text,
    non_billable text,
    overtime text,
    scheduled text,
    timeoff text,
    unscheduled text,
    -- wk_day_hrs_* (dynamic column),
    PRIMARY KEY (end_date, start_date, people_id),
    FOREIGN KEY (people_id) REFERENCES people(id)
);

CREATE TABLE report_project (
    end_date text,
    start_date text,
    project_id text,
    billable text,
    scheduled text,
    PRIMARY KEY (end_date, start_date, project_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE timeoffs_people_id (
    people_id text,
    timeoff_id text,
    id text,
    PRIMARY KEY (people_id, timeoff_id),
    FOREIGN KEY (timeoff_id) REFERENCES timeoff(id),
    FOREIGN KEY (id) REFERENCES people(id)
);

CREATE TABLE timeoff (
    id text,
    created_by text,
    modified_by text,
    status_creator_id text,
    timeoff_type_id text,
    created text,
    end_date text,
    full_day text,
    "hour" text,
    modified text,
    repeat_end text,
    repeat_state text,
    start_date text,
    start_time text,
    "status" text,
    status_note text,
    timeoff_note text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES account(id),
    FOREIGN KEY (modified_by) REFERENCES account(id),
    FOREIGN KEY (status_creator_id) REFERENCES account(id),
    FOREIGN KEY (timeoff_type_id) REFERENCES timeoff_type(id)
);

CREATE TABLE people_tag (
    "index" text,
    "name" text,
    people_id text,
    "type" text,
    PRIMARY KEY ("index", "name", people_id),
    FOREIGN KEY (people_id) REFERENCES people(id)
);

CREATE TABLE people_work_day_hour (
    "index" text,
    people_id text,
    work_days_hour text,
    PRIMARY KEY ("index", people_id),
    FOREIGN KEY (people_id) REFERENCES people(id)
);

CREATE TABLE people (
    id text,
    department_id text,
    active text,
    auto_email text,
    avatar_file text,
    contractor text,
    created text,
    default_hourly_rate text,
    email text,
    employee_type text,
    end_date text,
    job_title text,
    modified text,
    "name" text,
    non_work_day text,
    note text,
    people_type_id text,
    region_id text,
    role_id text,
    start_date text,
    work_days_hours_history text,
    PRIMARY KEY (id),
    FOREIGN KEY (department_id) REFERENCES department(id)
);

CREATE TABLE logged_time (
    id text,
    created_by text,
    modified_by text,
    people_id text,
    phase_id text,
    project_id text,
    task_id text,
    billable text,
    created text,
    "date" text,
    "hour" text,
    locked text,
    locked_date text,
    modified text,
    note text,
    task_meta_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES account(id),
    FOREIGN KEY (modified_by) REFERENCES account(id),
    FOREIGN KEY (people_id) REFERENCES people(id),
    FOREIGN KEY (phase_id) REFERENCES phase(id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (task_id) REFERENCES task(id)
);
