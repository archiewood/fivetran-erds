CREATE TABLE pre_condition (
    id text,
    assignee_account_id text,
    reporter_account_id text,
    assignee_account_type text,
    assignee_active text,
    assignee_display_name text,
    assignee_pixel_16_16 text,
    assignee_pixel_24_24 text,
    assignee_pixel_32_32 text,
    assignee_pixel_48_48 text,
    assignee_self text,
    assignee_time_zone text,
    definition text,
    kind text,
    "name" text,
    reporter_account_type text,
    reporter_active text,
    reporter_display_name text,
    reporter_pixel_16_16 text,
    reporter_pixel_24_24 text,
    reporter_pixel_32_32 text,
    reporter_pixel_48_48 text,
    reporter_self text,
    reporter_time_zone text,
    PRIMARY KEY (id),
    FOREIGN KEY (assignee_account_id) REFERENCES test(assignee_account_id),
    FOREIGN KEY (reporter_account_id) REFERENCES test(reporter_account_id)
);

CREATE TABLE test_run (
    id text,
    execution_test_id text,
    status_name text,
    test_id text,
    assignee_id text,
    examples text,
    executed_by_id text,
    finished_on text,
    gherkin text,
    last_modified text,
    started_on text,
    status_color text,
    status_description text,
    PRIMARY KEY (id),
    FOREIGN KEY (execution_test_id) REFERENCES expanded_test(id),
    FOREIGN KEY (status_name) REFERENCES status_detail("name"),
    FOREIGN KEY (test_id) REFERENCES test(id)
);

CREATE TABLE test_execution (
    id text,
    assignee_account_id text,
    reporter_account_id text,
    assignee_account_type text,
    assignee_active text,
    assignee_display_name text,
    assignee_pixel_16_16 text,
    assignee_pixel_24_24 text,
    assignee_pixel_32_32 text,
    assignee_pixel_48_48 text,
    assignee_self text,
    assignee_time_zone text,
    reporter_account_type text,
    reporter_active text,
    reporter_display_name text,
    reporter_pixel_16_16 text,
    reporter_pixel_24_24 text,
    reporter_pixel_32_32 text,
    reporter_pixel_48_48 text,
    reporter_self text,
    reporter_time_zone text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES test_plan(id),
    FOREIGN KEY (assignee_account_id) REFERENCES test(assignee_account_id),
    FOREIGN KEY (reporter_account_id) REFERENCES test(reporter_account_id)
);

CREATE TABLE test_set (
    id text,
    assignee_account_id text,
    reporter_account_id text,
    assignee_account_type text,
    assignee_active text,
    assignee_display_name text,
    assignee_pixel_16_16 text,
    assignee_pixel_24_24 text,
    assignee_pixel_32_32 text,
    assignee_pixel_48_48 text,
    assignee_self text,
    assignee_time_zone text,
    reporter_account_type text,
    reporter_active text,
    reporter_display_name text,
    reporter_pixel_16_16 text,
    reporter_pixel_24_24 text,
    reporter_pixel_32_32 text,
    reporter_pixel_48_48 text,
    reporter_self text,
    reporter_time_zone text,
    PRIMARY KEY (id),
    FOREIGN KEY (assignee_account_id) REFERENCES test(assignee_account_id),
    FOREIGN KEY (reporter_account_id) REFERENCES test(reporter_account_id)
);

CREATE TABLE status_detail (
    _fivetran_id text,
    color text,
    description text,
    final text,
    "name" text,
    object text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE test_plan (
    id text,
    assignee_account_id text,
    reporter_account_id text,
    assignee_account_type text,
    assignee_active text,
    assignee_display_name text,
    assignee_pixel_16_16 text,
    assignee_pixel_24_24 text,
    assignee_pixel_32_32 text,
    assignee_pixel_48_48 text,
    assignee_self text,
    assignee_time_zone text,
    reporter_account_type text,
    reporter_active text,
    reporter_display_name text,
    reporter_pixel_16_16 text,
    reporter_pixel_24_24 text,
    reporter_pixel_32_32 text,
    reporter_pixel_48_48 text,
    reporter_self text,
    reporter_time_zone text,
    PRIMARY KEY (id),
    FOREIGN KEY (assignee_account_id) REFERENCES test(assignee_account_id),
    FOREIGN KEY (reporter_account_id) REFERENCES test(reporter_account_id)
);

CREATE TABLE test_step_attachment (
    id text,
    test_step_id text,
    filename text,
    PRIMARY KEY (id, test_step_id),
    FOREIGN KEY (test_step_id) REFERENCES test_step(id)
);

CREATE TABLE test_step (
    id text,
    test_id text,
    "action" text,
    data text,
    "result" text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (test_id) REFERENCES test(id)
);

CREATE TABLE test (
    id text,
    assignee_account_id text,
    assignee_account_type text,
    assignee_active text,
    assignee_display_name text,
    assignee_pixel_16_16 text,
    assignee_pixel_24_24 text,
    assignee_pixel_32_32 text,
    assignee_pixel_48_48 text,
    assignee_self text,
    assignee_time_zone text,
    kind text,
    "name" text,
    reporter_account_id text,
    reporter_account_type text,
    reporter_active text,
    reporter_display_name text,
    reporter_pixel_16_16 text,
    reporter_pixel_24_24 text,
    reporter_pixel_32_32 text,
    reporter_pixel_48_48 text,
    reporter_self text,
    reporter_time_zone text,
    PRIMARY KEY (id)
);

CREATE TABLE expanded_test_attachment (
    id text,
    expanded_test_step_id text,
    filename text,
    PRIMARY KEY (id, expanded_test_step_id),
    FOREIGN KEY (expanded_test_step_id) REFERENCES expanded_test_step(id)
);

CREATE TABLE expanded_test_step (
    id text,
    expanded_test_id text,
    "action" text,
    called_test_issue_id text,
    data text,
    parent_test_issue_id text,
    "result" text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (expanded_test_id) REFERENCES expanded_test(id)
);

CREATE TABLE expanded_test (
    id text,
    assignee_account_id text,
    reporter_account_id text,
    assignee_account_type text,
    assignee_active text,
    assignee_display_name text,
    assignee_pixel_16_16 text,
    assignee_pixel_24_24 text,
    assignee_pixel_32_32 text,
    assignee_pixel_48_48 text,
    assignee_self text,
    assignee_time_zone text,
    kind text,
    "name" text,
    reporter_account_type text,
    reporter_active text,
    reporter_display_name text,
    reporter_pixel_16_16 text,
    reporter_pixel_24_24 text,
    reporter_pixel_32_32 text,
    reporter_pixel_48_48 text,
    reporter_self text,
    reporter_time_zone text,
    warnings jsonb,
    PRIMARY KEY (id),
    FOREIGN KEY (assignee_account_id) REFERENCES test(assignee_account_id),
    FOREIGN KEY (reporter_account_id) REFERENCES test(reporter_account_id)
);
