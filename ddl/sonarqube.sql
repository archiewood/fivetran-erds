CREATE TABLE project_analyse_event (
    "key" text,
    project_analyse_key text,
    category text,
    description text,
    "name" text,
    PRIMARY KEY ("key", project_analyse_key),
    FOREIGN KEY (project_analyse_key) REFERENCES project_analyse("key")
);

CREATE TABLE project_analyse (
    "key" text,
    project_key text,
    build_string text,
    "date" timestamp,
    manual_new_code_period_baseline boolean,
    project_version text,
    revision text,
    PRIMARY KEY ("key", project_key),
    FOREIGN KEY (project_key) REFERENCES project("key")
);

CREATE TABLE measures_component (
    component_key text,
    metric_key text,
    best_value text,
    period_best_value text,
    period_index text,
    period_value text,
    "value" text,
    PRIMARY KEY (component_key, metric_key),
    FOREIGN KEY (component_key) REFERENCES component("key"),
    FOREIGN KEY (metric_key) REFERENCES metric("key")
);

CREATE TABLE groups (
    "name" text,
    defaults boolean,
    description text,
    managed text,
    members_count integer,
    PRIMARY KEY ("name")
);

CREATE TABLE metric (
    id text,
    "key" text,
    custom boolean,
    description text,
    direction integer,
    domain text,
    hidden boolean,
    "name" text,
    qualitative boolean,
    "type" text,
    PRIMARY KEY (id, "key")
);

CREATE TABLE issue_comment (
    "key" text,
    issue_key text,
    login text,
    created_at timestamp,
    html_text text,
    markdown text,
    updatable boolean,
    PRIMARY KEY ("key", issue_key),
    FOREIGN KEY (issue_key) REFERENCES issue("key"),
    FOREIGN KEY (login) REFERENCES users(login)
);

CREATE TABLE issue_flow_location (
    _fivetran_id text,
    issue_key text,
    component text,
    end_line integer,
    end_offset integer,
    msg text,
    start_line integer,
    start_offset integer,
    PRIMARY KEY (_fivetran_id, issue_key),
    FOREIGN KEY (issue_key) REFERENCES issue("key")
);

CREATE TABLE issue_tag (
    tags text,
    issue_key text,
    PRIMARY KEY (tags, issue_key),
    FOREIGN KEY (issue_key) REFERENCES issue("key")
);

CREATE TABLE issue (
    "key" text,
    project text,
    rule text,
    author text,
    component text,
    creation_date timestamp,
    debt text,
    effort text,
    end_line integer,
    end_offset integer,
    hash text,
    line integer,
    message text,
    resolution text,
    scope text,
    severity text,
    start_line integer,
    start_offset integer,
    "status" text,
    "type" text,
    update_date timestamp,
    PRIMARY KEY ("key", project, rule),
    FOREIGN KEY (project) REFERENCES project("key"),
    FOREIGN KEY (rule) REFERENCES rule("key")
);

CREATE TABLE project_branch (
    "name" text,
    project_key text,
    analysis_date timestamp,
    excluded_from_purge boolean,
    is_main boolean,
    quality_gate_status text,
    "type" text,
    PRIMARY KEY ("name", project_key),
    FOREIGN KEY (project_key) REFERENCES project("key")
);

CREATE TABLE rule_param (
    "key" text,
    rule_key text,
    default_value text,
    description text,
    html_desc text,
    "type" text,
    PRIMARY KEY ("key", rule_key),
    FOREIGN KEY (rule_key) REFERENCES rule("key")
);

CREATE TABLE rule_tag (
    tags text,
    rule_key text,
    PRIMARY KEY (tags, rule_key),
    FOREIGN KEY (rule_key) REFERENCES rule("key")
);

CREATE TABLE rule_sys_tag (
    sys_tag text,
    rule_key text,
    PRIMARY KEY (sys_tag, rule_key),
    FOREIGN KEY (rule_key) REFERENCES rule("key")
);

CREATE TABLE rule (
    "key" text,
    created_at timestamp,
    gap_description text,
    html_desc text,
    html_note text,
    is_external boolean,
    is_template boolean,
    lang text,
    lang_name text,
    "name" text,
    repo text,
    scope text,
    severity text,
    "status" text,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY ("key")
);

CREATE TABLE project_link (
    id text,
    project_key text,
    "name" text,
    "type" text,
    url text,
    PRIMARY KEY (id, project_key),
    FOREIGN KEY (project_key) REFERENCES project("key")
);

CREATE TABLE project_pull_request (
    "key" text,
    project_key text,
    analysis_date timestamp,
    base text,
    branch text,
    bugs integer,
    code_smells integer,
    quality_gate_status text,
    target text,
    title text,
    url text,
    vulnerabilities integer,
    PRIMARY KEY ("key", project_key),
    FOREIGN KEY (project_key) REFERENCES project("key")
);

CREATE TABLE project (
    "key" text,
    last_analysis_date timestamp,
    "name" text,
    qualifier text,
    revision text,
    visibility text,
    PRIMARY KEY ("key")
);

CREATE TABLE measures_component_tree (
    "key" text,
    metric_key text,
    base_component_key text,
    best_value text,
    "name" text,
    "path" text,
    period_best_value text,
    period_index text,
    period_value text,
    qualifier text,
    "value" text,
    PRIMARY KEY ("key", metric_key),
    FOREIGN KEY (metric_key) REFERENCES metric("key"),
    FOREIGN KEY (base_component_key) REFERENCES component("key")
);

CREATE TABLE component_tag (
    tags text,
    component_key text,
    PRIMARY KEY (tags, component_key),
    FOREIGN KEY (component_key) REFERENCES component("key")
);

CREATE TABLE component (
    "key" text,
    project text,
    analysis_date timestamp,
    leak_period_date timestamp,
    "name" text,
    qualifier text,
    version text,
    visibility text,
    PRIMARY KEY ("key"),
    FOREIGN KEY (project) REFERENCES project("key")
);

CREATE TABLE user_group (
    group_name text,
    users_login text,
    PRIMARY KEY (group_name, users_login),
    FOREIGN KEY (group_name) REFERENCES groups("name"),
    FOREIGN KEY (users_login) REFERENCES users(login)
);

CREATE TABLE user_scm_account (
    scm_account text,
    users_login text,
    PRIMARY KEY (scm_account, users_login),
    FOREIGN KEY (users_login) REFERENCES users(login)
);

CREATE TABLE users (
    login text,
    active boolean,
    avatar text,
    email text,
    external_identity text,
    external_provider text,
    last_connection_date timestamp,
    local boolean,
    managed text,
    "name" text,
    sonar_lint_last_connection_date text,
    tokens_count integer,
    PRIMARY KEY (login)
);
