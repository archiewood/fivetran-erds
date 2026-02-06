CREATE TABLE project (
    id text,
    user_slug text,
    "name" text,
    organization_id text,
    organization_name text,
    organization_slug text,
    slug text,
    vcs_info_default_branch text,
    vcs_info_provider text,
    vcs_info_vcs_url text,
    PRIMARY KEY (id),
    FOREIGN KEY (user_slug) REFERENCES user_collaboration(slug)
);

CREATE TABLE project_branch (
    branch_name text,
    project_id text,
    PRIMARY KEY (branch_name, project_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE workflow_recent_run (
    id text,
    project_id text,
    workflow_id text,
    branch text,
    created_at timestamp,
    credits_used double precision,
    duration double precision,
    "status" text,
    stopped_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (workflow_id) REFERENCES workflow(id)
);

CREATE TABLE user_collaboration (
    slug text,
    avatar_url text,
    id text,
    "name" text,
    vcs_type text,
    PRIMARY KEY (slug)
);

CREATE TABLE workflow_job_dependency (
    dependency text,
    job_id text,
    PRIMARY KEY (dependency, job_id),
    FOREIGN KEY (job_id) REFERENCES workflow_job(id)
);

CREATE TABLE workflow_job (
    id text,
    project_id text,
    workflow_id text,
    approval_request_id text,
    approved_by text,
    canceled_by text,
    job_number text,
    "name" text,
    project_slug text,
    started_at timestamp,
    "status" text,
    stopped_at timestamp,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (workflow_id) REFERENCES workflow(id)
);

CREATE TABLE context (
    id text,
    user_slug text,
    created_at timestamp,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (user_slug) REFERENCES user_collaboration(slug)
);

CREATE TABLE flaky_test (
    _fivetran_id text,
    project_id text,
    workflow_id text,
    classname text,
    file text,
    job_name text,
    job_number double precision,
    pipeline_number double precision,
    "source" text,
    test_name text,
    time_wasted integer,
    times_flaked integer,
    workflow_created_at timestamp,
    workflow_name text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (workflow_id) REFERENCES workflow(id)
);

CREATE TABLE pipeline_error (
    _fivetran_id text,
    pipeline_id text,
    message text,
    "type" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (pipeline_id) REFERENCES pipeline(id)
);

CREATE TABLE pipeline (
    id text,
    project_id text,
    created_at timestamp,
    number double precision,
    project_slug text,
    "state" text,
    trigger_actor_avatar_url text,
    trigger_actor_login text,
    trigger_received_at timestamp,
    trigger_type text,
    updated_at timestamp,
    vcs_branch text,
    vcs_commit_body text,
    vcs_commit_subject text,
    vcs_origin_repository_url text,
    vcs_provider_name text,
    vcs_review_id text,
    vcs_review_url text,
    vcs_revision text,
    vcs_tags text,
    vcs_target_repository_url text,
    -- trigger_parameters_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE schedule_day_of_month (
    "date" integer,
    schedule_id text,
    PRIMARY KEY ("date", schedule_id),
    FOREIGN KEY (schedule_id) REFERENCES schedule(id)
);

CREATE TABLE schedule_month (
    "month" text,
    schedule_id text,
    PRIMARY KEY ("month", schedule_id),
    FOREIGN KEY (schedule_id) REFERENCES schedule(id)
);

CREATE TABLE schedule_hour_of_day (
    "hour" integer,
    schedule_id text,
    PRIMARY KEY ("hour", schedule_id),
    FOREIGN KEY (schedule_id) REFERENCES schedule(id)
);

CREATE TABLE schedule_day_of_week (
    "day" text,
    schedule_id text,
    PRIMARY KEY ("day", schedule_id),
    FOREIGN KEY (schedule_id) REFERENCES schedule(id)
);

CREATE TABLE schedule (
    id text,
    project_id text,
    actor_id text,
    actor_login text,
    actor_name text,
    created_at timestamp,
    description text,
    "name" text,
    parameters_branch text,
    parameters_deploy_prod boolean,
    project_slug text,
    timetable_per_hour integer,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE job_parallel_run (
    _fivetran_id text,
    job_number text,
    project_id text,
    "index" double precision,
    "status" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (job_number) REFERENCES job(number),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE job_message (
    _fivetran_id text,
    job_number text,
    project_id text,
    message text,
    reason text,
    "type" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (job_number) REFERENCES job(number),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE job_context (
    "name" text,
    job_number text,
    project_id text,
    PRIMARY KEY ("name"),
    FOREIGN KEY (job_number) REFERENCES job(number),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE job (
    number text,
    project_id text,
    latest_workflow_name text,
    pipeline_id text,
    created_at timestamp,
    duration double precision,
    executor_resource_class text,
    executor_type text,
    "name" text,
    organization_name text,
    parallelism text,
    queued_at timestamp,
    started_at timestamp,
    "status" text,
    stopped_at timestamp,
    web_url text,
    PRIMARY KEY (number, project_id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (latest_workflow_name) REFERENCES workflow(id),
    FOREIGN KEY (pipeline_id) REFERENCES pipeline(id)
);

CREATE TABLE job_artifact (
    _fivetran_id text,
    job_number text,
    project_id text,
    node_index double precision,
    "path" text,
    url text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (job_number) REFERENCES job(number),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE workflow (
    id text,
    pipeline_id text,
    project_id text,
    canceled_by text,
    created_at timestamp,
    errored_by text,
    "name" text,
    project_slug text,
    started_by text,
    "status" text,
    stopped_at timestamp,
    tags text,
    PRIMARY KEY (id),
    FOREIGN KEY (pipeline_id) REFERENCES pipeline(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);
