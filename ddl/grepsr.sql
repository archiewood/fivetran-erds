CREATE TABLE project_report (
    id text,
    project_id text,
    "name" text,
    service_id text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE project (
    id text,
    created text,
    description text,
    "name" text,
    "status" text,
    PRIMARY KEY (id)
);

CREATE TABLE dataset_column (
    "name" text,
    dataset_project_report_history_id text,
    dataset_project_report_id text,
    PRIMARY KEY ("name", dataset_project_report_history_id, dataset_project_report_id),
    FOREIGN KEY (dataset_project_report_history_id) REFERENCES dataset(project_report_history_id),
    FOREIGN KEY (dataset_project_report_id) REFERENCES dataset(project_report_id)
);

CREATE TABLE dataset (
    project_report_history_id text,
    project_report_id text,
    "name" text,
    "rows" jsonb,
    PRIMARY KEY (project_report_history_id, project_report_id),
    FOREIGN KEY (project_report_history_id) REFERENCES project_report_history(id),
    FOREIGN KEY (project_report_id) REFERENCES project_report(id)
);

CREATE TABLE report_stat_column (
    "name" text,
    report_stat_id text,
    PRIMARY KEY ("name", report_stat_id),
    FOREIGN KEY (report_stat_id) REFERENCES report_stat(id)
);

CREATE TABLE report_stat (
    id text,
    project_report_history_id text,
    project_report_id text,
    "name" text,
    report_name text,
    PRIMARY KEY (id),
    FOREIGN KEY (project_report_history_id) REFERENCES project_report_history(id),
    FOREIGN KEY (project_report_id) REFERENCES project_report(id)
);

CREATE TABLE schedule_parameter (
    _fivetran_id text,
    schedule_id text,
    "name" text,
    "value" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (schedule_id) REFERENCES schedule(id)
);

CREATE TABLE schedule (
    id text,
    project_report_id text,
    end_date text,
    next_update text,
    start_date text,
    PRIMARY KEY (id),
    FOREIGN KEY (project_report_id) REFERENCES project_report(id)
);

CREATE TABLE project_report_history (
    id text,
    project_id text,
    project_report_id text,
    bandwidth_download text,
    bandwidth_upload text,
    created text,
    csv_file text,
    item_count text,
    modified text,
    request_count text,
    run_ended text,
    run_started text,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (project_report_id) REFERENCES project_report(id)
);

CREATE TABLE report_parameter (
    service_id text,
    project_report_id text,
    description text,
    label text,
    "name" text,
    PRIMARY KEY (service_id),
    FOREIGN KEY (project_report_id) REFERENCES project_report(id)
);
