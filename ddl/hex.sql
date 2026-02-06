CREATE TABLE project_category (
    "index" text,
    project_id text,
    description text,
    "name" text,
    PRIMARY KEY ("index", project_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE project_schedule (
    "index" text,
    project_id text,
    cadence text,
    custom_cron text,
    custom_timezone text,
    daily_hour text,
    daily_minute text,
    daily_timezone text,
    enabled text,
    hourly_minute text,
    hourly_timezone text,
    monthly_day text,
    monthly_hour text,
    monthly_minute text,
    monthly_timezone text,
    weekly_day_of_week text,
    weekly_hour text,
    weekly_minute text,
    weekly_timezone text,
    PRIMARY KEY ("index", project_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE project (
    id text,
    analytics_app_views_all_time text,
    analytics_app_views_last_fourteen_days text,
    analytics_app_views_last_seven_days text,
    analytics_app_views_last_thirty_days text,
    analytics_last_viewed_at text,
    analytics_published_result_updated_at text,
    archived_at text,
    created_at text,
    creator_email text,
    description text,
    last_edited_at timestamp,
    last_published_at text,
    owner_email text,
    review_required text,
    sharing_collections jsonb,
    sharing_groups jsonb,
    sharing_public_web_access text,
    sharing_support_access text,
    sharing_users jsonb,
    sharing_workspace_access text,
    "status" text,
    title text,
    trashed_at text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE project_run_notification (
    "index" text,
    project_id text,
    run_id text,
    include_success_screenshot text,
    recipient_id text,
    recipient_is_private text,
    recipient_name text,
    recipient_type text,
    screenshot_format jsonb,
    "type" text,
    PRIMARY KEY ("index", project_id, run_id),
    FOREIGN KEY (project_id) REFERENCES project_run(project_id),
    FOREIGN KEY (run_id) REFERENCES project_run(run_id)
);

CREATE TABLE project_run (
    run_id text,
    project_id text,
    elapsed_time text,
    end_time text,
    project_version text,
    run_url text,
    start_time text,
    "status" text,
    trace_id text,
    PRIMARY KEY (run_id, project_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);
