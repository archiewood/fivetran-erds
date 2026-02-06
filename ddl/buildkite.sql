CREATE TABLE pipeline_tag (
    "name" text,
    pipeline_id text,
    PRIMARY KEY ("name", pipeline_id),
    FOREIGN KEY (pipeline_id) REFERENCES pipeline(id)
);

CREATE TABLE pipeline_step_agent_query_rule (
    pipeline_step_index bigint,
    rule text,
    pipeline_id text,
    PRIMARY KEY (pipeline_step_index, rule, pipeline_id),
    FOREIGN KEY (pipeline_id) REFERENCES pipeline(id)
);

CREATE TABLE pipeline_step (
    pipeline_id text,
    artifact_paths text,
    branch_configuration text,
    command text,
    concurrency text,
    env jsonb,
    "index" bigint,
    "name" text,
    parallelism text,
    timeout_in_minutes text,
    "type" text,
    PRIMARY KEY (pipeline_id),
    FOREIGN KEY (pipeline_id) REFERENCES pipeline(id)
);

CREATE TABLE pipeline (
    id text,
    created_by_id text,
    organization_id text,
    allow_rebuilds boolean,
    archived_at text,
    branch_configuration text,
    builds_url text,
    cancel_running_branch_builds boolean,
    cancel_running_branch_builds_filter text,
    created_at timestamp,
    default_branch text,
    env jsonb,
    "name" text,
    provider jsonb,
    qraphql_id text,
    repository text,
    running_builds_count integer,
    running_jobs_count integer,
    scheduled_builds_count integer,
    scheduled_jobs_count integer,
    skip_queued_branch_builds boolean,
    skip_queued_branch_builds_filter text,
    slug text,
    url text,
    visibility text,
    waiting_jobs_count integer,
    web_url text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_id) REFERENCES users(id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE agent_metadata (
    "name" text,
    agent_id text,
    PRIMARY KEY ("name", agent_id),
    FOREIGN KEY (agent_id) REFERENCES agent(id)
);

CREATE TABLE agent (
    id text,
    creator_id text,
    organization_id text,
    connection_state text,
    created_at timestamp,
    hostname text,
    ip_address text,
    last_job_finished_at timestamp,
    "name" text,
    priority text,
    url text,
    user_agent text,
    version text,
    web_url text,
    PRIMARY KEY (id),
    FOREIGN KEY (creator_id) REFERENCES users(id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE build_job_agent_query_rule (
    rule text,
    build_job_id text,
    PRIMARY KEY (rule, build_job_id),
    FOREIGN KEY (build_job_id) REFERENCES build_job(id)
);

CREATE TABLE build_job (
    id text,
    build_id text,
    agent_id text,
    organization_id text,
    retried_in_job_id text,
    unblocked_by_id text,
    artifact_paths text,
    artifacts_url text,
    build_url text,
    command text,
    created_at timestamp,
    exit_status bigint,
    expired_at timestamp,
    finished_at timestamp,
    graphql_id text,
    log_url text,
    matrix text,
    "name" text,
    parallel_group_index integer,
    parallel_group_total integer,
    priority integer,
    raw_log_url text,
    retried boolean,
    retries_count integer,
    retry_type text,
    runnable_at timestamp,
    scheduled_at timestamp,
    soft_failed boolean,
    started_at timestamp,
    "state" text,
    step_id text,
    step_key text,
    step_signature_algorithm text,
    step_signature_signed_fields jsonb,
    step_signature_value text,
    "type" text,
    unblock_url text,
    unblockable boolean,
    unblocked_at timestamp,
    web_url text,
    PRIMARY KEY (id, build_id),
    FOREIGN KEY (build_id) REFERENCES build(id),
    FOREIGN KEY (agent_id) REFERENCES agent(id),
    FOREIGN KEY (organization_id) REFERENCES organization(id),
    FOREIGN KEY (retried_in_job_id) REFERENCES build(id),
    FOREIGN KEY (unblocked_by_id) REFERENCES users(id)
);

CREATE TABLE build (
    id text,
    creator_id text,
    organization_id text,
    pipeline_id text,
    rebuilt_from_id text,
    blocked boolean,
    blocked_state text,
    branch text,
    commit text,
    created_at timestamp,
    env jsonb,
    finished_at timestamp,
    github_author_email text,
    github_author_name text,
    github_author_username text,
    graphql_id text,
    message text,
    meta_data jsonb,
    number bigint,
    pipeline_slug text,
    pr_number text,
    pr_repo text,
    scheduled_at timestamp,
    "source" text,
    started_at timestamp,
    "state" text,
    tag text,
    url text,
    web_url text,
    PRIMARY KEY (id),
    FOREIGN KEY (creator_id) REFERENCES users(id),
    FOREIGN KEY (organization_id) REFERENCES organization(id),
    FOREIGN KEY (pipeline_id) REFERENCES pipeline(id),
    FOREIGN KEY (rebuilt_from_id) REFERENCES build(id)
);

CREATE TABLE organization (
    id text,
    agents_url text,
    created_at timestamp,
    emojis_url text,
    graph_id text,
    "name" text,
    pipelines_url text,
    slug text,
    url text,
    web_url text,
    PRIMARY KEY (id)
);

CREATE TABLE users (
    id text,
    organization_id text,
    avatar_url text,
    created_at timestamp,
    email text,
    graph_id text,
    is_bot boolean,
    "name" text,
    "role" text,
    sso_mode text,
    PRIMARY KEY (id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);
