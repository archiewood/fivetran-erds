CREATE TABLE report_data_metrics (
    "index" text,
    report_data_fivetran_id text,
    "key" text,
    "type" text,
    "value" text,
    PRIMARY KEY ("index", report_data_fivetran_id),
    FOREIGN KEY (report_data_fivetran_id) REFERENCES report_data(_fivetran_id)
);

CREATE TABLE report_data (
    _fivetran_id text,
    report_template_id text,
    children jsonb,
    end_date text,
    item_key text,
    item_value text,
    start_date text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (report_template_id) REFERENCES report_template(id)
);

CREATE TABLE agent_team (
    "index" text,
    agent_id text,
    team_id text,
    PRIMARY KEY ("index", agent_id),
    FOREIGN KEY (agent_id) REFERENCES agent(id)
);

CREATE TABLE agent (
    id text,
    deactivated text,
    default_group_id text,
    email text,
    group_id text,
    is_deleted text,
    location_id text,
    "name" text,
    photo text,
    role_id text,
    shift_template_id text,
    tymeshift_account_id text,
    user_id text,
    PRIMARY KEY (id)
);

CREATE TABLE agent_activity (
    id text,
    agent_id text,
    duration text,
    end_time text,
    event_type text,
    general_task_id text,
    is_paid text,
    lock_interval text,
    start_time text,
    ticket_id text,
    "type" text,
    user_id text,
    workstreams jsonb,
    PRIMARY KEY (id),
    FOREIGN KEY (agent_id) REFERENCES agent(id)
);

CREATE TABLE report_template (
    id text,
    agent_id jsonb,
    created_at text,
    created_by text,
    dimension_group_by jsonb,
    dimension_interval text,
    file_structure text,
    filter_activity_type_id text,
    filter_group_id jsonb,
    filter_interval jsonb,
    filter_location_id jsonb,
    filter_scopes jsonb,
    filter_status jsonb,
    filter_tags jsonb,
    filter_team_id jsonb,
    filter_ticket_customfield_option_key jsonb,
    filter_ticket_id jsonb,
    filter_ticket_via_type jsonb,
    filter_timeoff_reason_id jsonb,
    is_default text,
    metrics jsonb,
    "name" text,
    timezone text,
    tymeshift_account_id text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE published_schedule_workstream (
    id text,
    published_schedule_id text,
    taskable_id text,
    color text,
    created_at text,
    end_time text,
    "name" text,
    shift_id text,
    start_time text,
    taskable_type text,
    PRIMARY KEY (id, published_schedule_id),
    FOREIGN KEY (published_schedule_id) REFERENCES published_schedule(id),
    FOREIGN KEY (taskable_id) REFERENCES workstream(id)
);

CREATE TABLE published_schedule_general_task (
    id text,
    published_schedule_id text,
    taskable_id text,
    created_at text,
    end_time text,
    shift_id text,
    start_time text,
    taskable_type text,
    PRIMARY KEY (id, published_schedule_id),
    FOREIGN KEY (published_schedule_id) REFERENCES published_schedule(id),
    FOREIGN KEY (taskable_id) REFERENCES general_task(id)
);

CREATE TABLE published_schedule_task (
    id text,
    published_schedule_id text,
    color text,
    created_at text,
    end_time text,
    "name" text,
    shift_id text,
    start_time text,
    taskable_id text,
    taskable_type text,
    PRIMARY KEY (id, published_schedule_id),
    FOREIGN KEY (published_schedule_id) REFERENCES published_schedule(id)
);

CREATE TABLE published_schedule (
    id text,
    agent_id text,
    end_time text,
    parent_id text,
    published text,
    schedule_id text,
    start_time text,
    tymeshift_account_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (agent_id) REFERENCES agent(id)
);

CREATE TABLE time_off (
    id text,
    time_off jsonb,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES agent(id)
);

CREATE TABLE contact_method_key (
    "index" text,
    workstream_id text,
    contact_method_key text,
    PRIMARY KEY ("index", workstream_id),
    FOREIGN KEY (workstream_id) REFERENCES workstream(id)
);

CREATE TABLE workstream_condition_all (
    "index" text,
    workstream_id text,
    field text,
    operator text,
    "value" text,
    PRIMARY KEY ("index", workstream_id),
    FOREIGN KEY (workstream_id) REFERENCES workstream(id)
);

CREATE TABLE workstream_condition_any (
    "index" text,
    workstream_id text,
    field text,
    operator text,
    "value" text,
    PRIMARY KEY ("index", workstream_id),
    FOREIGN KEY (workstream_id) REFERENCES workstream(id)
);

CREATE TABLE inbound_volume_adjustment (
    id text,
    workstream_id text,
    active text,
    change text,
    change_type text,
    end_time text,
    "name" text,
    start_time text,
    tymeshift_account_id text,
    PRIMARY KEY (id, workstream_id),
    FOREIGN KEY (workstream_id) REFERENCES workstream(id)
);

CREATE TABLE availability_hour (
    "index" text,
    workstream_id text,
    day_of_the_week text,
    end_time text,
    is_active text,
    start_time text,
    PRIMARY KEY ("index", workstream_id),
    FOREIGN KEY (workstream_id) REFERENCES workstream(id)
);

CREATE TABLE workstream_agent (
    agent_id text,
    workstream_id text,
    PRIMARY KEY (agent_id, workstream_id),
    FOREIGN KEY (agent_id) REFERENCES agent(id),
    FOREIGN KEY (workstream_id) REFERENCES workstream(id)
);

CREATE TABLE workstream (
    id text,
    actual_algorithm text,
    color text,
    condition_id text,
    condition_tymeshift_account_id text,
    contact_method_group text,
    deleted_at text,
    description text,
    exclude_inbound_volume_outliers text,
    forecast_algorithm text,
    full_time_equivalent_availability text,
    full_time_equivalent_availability_timezone text,
    full_time_equivalent_average_handle_time text,
    full_time_equivalent_average_handle_time_type text,
    full_time_equivalent_channel text,
    full_time_equivalent_concurrency text,
    full_time_equivalent_id text,
    full_time_equivalent_max_occupancy_rate text,
    full_time_equivalent_minimum_staffing text,
    full_time_equivalent_shrinkage text,
    full_time_equivalent_target_service_level text,
    full_time_equivalent_target_time text,
    full_time_equivalent_tymeshift_account_id text,
    full_time_equivalent_workstream_id text,
    ignore_data_prior_to_date text,
    imported_historical_volume text,
    inbound_volume_outlier jsonb,
    is_deleted text,
    "name" text,
    orders text,
    priority text,
    tymeshift_account_id text,
    use_all_zendesk_data text,
    visible text,
    PRIMARY KEY (id)
);

CREATE TABLE task_permitted_team (
    permitted_team_id text,
    general_task_id text,
    PRIMARY KEY (permitted_team_id, general_task_id),
    FOREIGN KEY (general_task_id) REFERENCES general_task(id)
);

CREATE TABLE task_permitted_team_without_scoping (
    permitted_team_id_without_scoping text,
    general_task_id text,
    PRIMARY KEY (permitted_team_id_without_scoping, general_task_id),
    FOREIGN KEY (general_task_id) REFERENCES general_task(id)
);

CREATE TABLE general_task (
    id text,
    color text,
    deleted_at text,
    exclude_occupancy text,
    is_deleted text,
    is_paid text,
    job_id text,
    "name" text,
    permitted_team_preset text,
    productive_time text,
    talk_status text,
    PRIMARY KEY (id)
);
