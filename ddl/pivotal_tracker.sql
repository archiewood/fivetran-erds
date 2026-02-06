CREATE TABLE iteration_story (
    iteration_number text,
    iteration_project_id text,
    story_id text,
    PRIMARY KEY (iteration_number, iteration_project_id, story_id),
    FOREIGN KEY (iteration_number) REFERENCES iteration(number),
    FOREIGN KEY (iteration_project_id) REFERENCES iteration(project_id),
    FOREIGN KEY (story_id) REFERENCES story(id)
);

CREATE TABLE iteration (
    number text,
    project_id text,
    finish text,
    length text,
    "start" text,
    team_strength text,
    PRIMARY KEY (number, project_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE task (
    id text,
    project_id text,
    story_id text,
    complete text,
    created_at text,
    description text,
    "position" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES story(project_id),
    FOREIGN KEY (story_id) REFERENCES story(id)
);

CREATE TABLE project (
    id text,
    account_id text,
    current_iteration_number text,
    atom_enabled text,
    automatic_planning text,
    bugs_and_chores_are_estimatable text,
    created_at text,
    enable_following text,
    enable_incoming_emails text,
    enable_tasks text,
    has_google_domain text,
    initial_velocity text,
    iteration_length text,
    "name" text,
    number_of_done_iterations_to_show text,
    point_scale text,
    point_scale_is_custom text,
    profile_content text,
    project_type text,
    public text,
    show_priority_icon text,
    show_priority_icon_in_all_panels text,
    show_story_priority text,
    start_date text,
    start_time text,
    time_zone_kind text,
    time_zone_offsets text,
    time_zone_olson_name text,
    updated_at text,
    velocity_averaged_over text,
    version text,
    week_start_day text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (current_iteration_number) REFERENCES iteration(number)
);

CREATE TABLE epic (
    id text,
    label_id text,
    project_id text,
    created_at text,
    "name" text,
    updated_at text,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (label_id) REFERENCES label(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE story_transition (
    project_id text,
    story_id text,
    occurred_at text,
    performed_by_id text,
    project_version text,
    "state" text,
    PRIMARY KEY (project_id, story_id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (story_id) REFERENCES story(id)
);

CREATE TABLE project_integration (
    id text,
    project_id text,
    active text,
    base_url text,
    can_import text,
    created_at text,
    import_api_url text,
    is_other text,
    kind text,
    "name" text,
    story_name text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE account_membership (
    id text,
    account_id text,
    "admin" text,
    created_at text,
    email text,
    initial text,
    "name" text,
    owner text,
    person_id text,
    project_creator text,
    updated_at text,
    username text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE "release" (
    id text,
    project_id text,
    accepted_at text,
    created_at text,
    current_state text,
    deadline text,
    labels jsonb,
    "name" text,
    updated_at text,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE story_label (
    label_id text,
    story_id text,
    PRIMARY KEY (label_id, story_id),
    FOREIGN KEY (label_id) REFERENCES label(id),
    FOREIGN KEY (story_id) REFERENCES story(id)
);

CREATE TABLE story_owner (
    "index" text,
    story_id text,
    owner_id text,
    PRIMARY KEY ("index", story_id),
    FOREIGN KEY (story_id) REFERENCES story(id)
);

CREATE TABLE story (
    id text,
    project_id text,
    accepted_at text,
    created_at text,
    current_state text,
    description text,
    estimate text,
    "name" text,
    owned_by_id text,
    requested_by_id text,
    story_priority text,
    story_type text,
    updated_at text,
    url text,
    PRIMARY KEY (id, project_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE project_membership (
    id text,
    project_id text,
    created_at text,
    favorite text,
    kind text,
    last_viewed_at text,
    person_email text,
    person_id text,
    person_initial text,
    person_kind text,
    person_name text,
    person_username text,
    project_color text,
    "role" text,
    updated_at text,
    wants_comment_notification_email text,
    will_receive_mention_notification_or_email text,
    PRIMARY KEY (id, project_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE "comment" (
    id text,
    project_id text,
    story_id text,
    created_at text,
    person_id text,
    text text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES story(project_id),
    FOREIGN KEY (story_id) REFERENCES story(id)
);

CREATE TABLE account (
    id text,
    created_at text,
    "name" text,
    plan text,
    "status" text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE review (
    id text,
    project_id text,
    story_id text,
    created_at text,
    review_type_id text,
    "status" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES story(project_id),
    FOREIGN KEY (story_id) REFERENCES story(id)
);

CREATE TABLE label (
    id text,
    project_id text,
    created_at text,
    "name" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE activity_change (
    "index" text,
    activity_guid text,
    change_type text,
    id text,
    "name" text,
    new_value jsonb,
    original_value jsonb,
    story_priority text,
    story_type text,
    PRIMARY KEY ("index", activity_guid),
    FOREIGN KEY (activity_guid) REFERENCES activity(guid)
);

CREATE TABLE activity_primary_resource (
    "index" text,
    activity_guid text,
    id text,
    kind text,
    "name" text,
    story_priority text,
    story_type text,
    url text,
    PRIMARY KEY ("index", activity_guid),
    FOREIGN KEY (activity_guid) REFERENCES activity(guid)
);

CREATE TABLE activity (
    guid text,
    project_id text,
    highlight text,
    message text,
    occurred_at text,
    performed_by text,
    project_version text,
    secondary_resource jsonb,
    PRIMARY KEY (guid),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE blocker (
    id text,
    project_id text,
    story_id text,
    created_at text,
    description text,
    person_id text,
    resolved text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES story(project_id),
    FOREIGN KEY (story_id) REFERENCES story(id)
);
