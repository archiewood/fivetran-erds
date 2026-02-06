CREATE TABLE recipient_stage (
    _fivetran_id text,
    recipient_id text,
    accepted text,
    bounced text,
    click text,
    declined text,
    download text,
    failed_error text,
    from_email text,
    from_name text,
    has_files text,
    has_link text,
    has_open text,
    initial_scheduled_at text,
    opens text,
    ordinal text,
    processed_at text,
    replied text,
    schedule text,
    scheduled_at text,
    scheduled_end text,
    scheduled_start text,
    scheduled_timezone text,
    sender_replied text,
    sending_error text,
    sent_at text,
    stage_id text,
    "state" text,
    task_assignee text,
    task_created_at text,
    task_id text,
    task_message_status text,
    task_status text,
    tentative text,
    "trigger" text,
    "type" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (recipient_id) REFERENCES recipient(id)
);

CREATE TABLE recipient (
    id text,
    sequence_id text,
    completed_reason text,
    created_at text,
    event_click text,
    event_download text,
    event_open text,
    last_stage_sent_ordinal text,
    rst_failed text,
    "state" text,
    to_email text,
    to_name text,
    user_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (sequence_id) REFERENCES "sequence"(id)
);

CREATE TABLE contact (
    id text,
    email text,
    google_contact_id text,
    "name" text,
    saleforce_id text,
    time_stamp text,
    used_count text,
    user_id text,
    -- analytics_* (dynamic column),
    -- locked_* (dynamic column),
    -- meta_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE groups (
    id text,
    "name" text,
    shared jsonb,
    url text,
    user_id text,
    PRIMARY KEY (id)
);

CREATE TABLE contact_group (
    contact_id text,
    groups_id text,
    google_contact_id text,
    PRIMARY KEY (contact_id, groups_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (groups_id) REFERENCES groups(id)
);

CREATE TABLE meeting_invite_event (
    _fivetran_id text,
    meeting_invite_id text,
    message_id text,
    custom_ text,
    guest_email text,
    guest_name text,
    id text,
    ip_address text,
    responded_at text,
    user_agent text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (meeting_invite_id) REFERENCES meeting_invite_timeslot(meeting_invite_id),
    FOREIGN KEY (message_id) REFERENCES message(id)
);

CREATE TABLE meeting_invite_timeslot (
    "index" text,
    meeting_invite_id text,
    end_ text,
    "start" text,
    PRIMARY KEY ("index", meeting_invite_id),
    FOREIGN KEY (meeting_invite_id) REFERENCES meeting_invite(id)
);

CREATE TABLE meeting_invite (
    id text,
    additional_guest jsonb,
    allow_double_booking text,
    any_room_in_building jsonb,
    calendar_id text,
    calendar_name text,
    created_by text,
    creation_date text,
    description text,
    guest_can_modify text,
    include_message_link text,
    integration_zoom text,
    locale text,
    location text,
    meeting_type_id text,
    room_and_resource jsonb,
    timezone text,
    title text,
    user_id text,
    PRIMARY KEY (id)
);

CREATE TABLE sequence_search_stage (
    id text,
    sequence_search_id text,
    delegator_email text,
    delegator_name text,
    did_exit_from text,
    did_unsubscribe_from text,
    failed_error text,
    from_email text,
    from_name text,
    initial_scheduled_at text,
    is_active text,
    is_completed text,
    is_last_processed_stage text,
    is_next_stage text,
    is_paused text,
    is_scheduled text,
    message_id text,
    num_click text,
    num_delivered text,
    num_download text,
    num_open text,
    ordinal text,
    processed_at text,
    saleforce_task_assignee text,
    saleforce_task_created_at text,
    saleforce_task_id text,
    saleforce_task_status text,
    scheduled_at text,
    sending_error text,
    sent_at text,
    "state" text,
    task_assignee_id text,
    task_created_at text,
    task_id text,
    task_status text,
    "trigger" text,
    "type" text,
    was_accepted text,
    was_bounced text,
    was_clicked text,
    was_declined text,
    was_delivered text,
    was_delivered_with_tracked_file text,
    was_delivered_with_tracked_invite text,
    was_delivered_with_tracked_link text,
    was_delivered_with_tracked_open text,
    was_downloaded text,
    was_opened text,
    was_processed text,
    was_replied text,
    was_sender_replied text,
    was_sent text,
    was_task_created text,
    was_task_deleted text,
    was_tentative text,
    PRIMARY KEY (id, sequence_search_id),
    FOREIGN KEY (sequence_search_id) REFERENCES sequence_search(id)
);

CREATE TABLE sequence_search (
    id text,
    completed_at text,
    completed_reason text,
    created_at text,
    domain text,
    email text,
    last_stage_sent_ordinal text,
    last_stage_sent_processed_at text,
    "name" text,
    recipient_id text,
    sequence_id text,
    sequence_name text,
    "state" text,
    to_email text,
    to_name text,
    user_id text,
    PRIMARY KEY (id)
);

CREATE TABLE insight_report (
    id text,
    user_id text,
    created_at text,
    query text,
    shared jsonb,
    title text,
    "type" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES contact(user_id)
);

CREATE TABLE snippet (
    id text,
    archived_at text,
    created_at text,
    custom_shortcut text,
    deleted_at text,
    is_inline text,
    "name" text,
    saved_at text,
    saved_by text,
    shared jsonb,
    "source" text,
    tag_id text,
    tag_name text,
    title text,
    user_id text,
    PRIMARY KEY (id)
);

CREATE TABLE sequence_folder (
    sequence_id text,
    folder_id text,
    PRIMARY KEY (sequence_id, folder_id),
    FOREIGN KEY (folder_id) REFERENCES folder(id)
);

CREATE TABLE folder (
    id text,
    created_at text,
    "name" text,
    saved_at text,
    shared jsonb,
    user_id text,
    PRIMARY KEY (id)
);

CREATE TABLE unsubscribe (
    id text,
    message_id text,
    team_id text,
    email text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (message_id) REFERENCES message(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE message_team (
    message_id text,
    team_id text,
    PRIMARY KEY (message_id, team_id),
    FOREIGN KEY (message_id) REFERENCES message(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE message_snippet (
    message_id text,
    snippet_id text,
    PRIMARY KEY (message_id, snippet_id),
    FOREIGN KEY (message_id) REFERENCES message(id),
    FOREIGN KEY (snippet_id) REFERENCES snippet(id)
);

CREATE TABLE message_crms_connected (
    "index" text,
    message_id text,
    log_to text,
    "name" text,
    PRIMARY KEY ("index", message_id),
    FOREIGN KEY (message_id) REFERENCES message(id)
);

CREATE TABLE message_to (
    "index" text,
    message_id text,
    email text,
    "name" text,
    PRIMARY KEY ("index", message_id),
    FOREIGN KEY (message_id) REFERENCES message(id)
);

CREATE TABLE message_cc (
    "index" text,
    message_id text,
    email text,
    "name" text,
    PRIMARY KEY ("index", message_id),
    FOREIGN KEY (message_id) REFERENCES message(id)
);

CREATE TABLE message_bcc (
    "index" text,
    message_id text,
    email text,
    "name" text,
    PRIMARY KEY ("index", message_id),
    FOREIGN KEY (message_id) REFERENCES message(id)
);

CREATE TABLE message_attachment (
    "index" text,
    message_id text,
    "name" text,
    "size" text,
    "type" text,
    PRIMARY KEY ("index", message_id),
    FOREIGN KEY (message_id) REFERENCES message(id)
);

CREATE TABLE message (
    id text,
    sequence_id text,
    body text,
    created text,
    error_response text,
    file_tracking_enabled text,
    follow_up_description text,
    follow_up_trigger text,
    follow_up_unparsed_date text,
    from_email text,
    from_is_delegated text,
    from_name text,
    link_tracking_enabled text,
    notification_enabled text,
    scheduled text,
    sending_error text,
    sent text,
    subject text,
    sync_to_org text,
    tracking_enabled text,
    updated_at text,
    user_has_modified text,
    user_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (sequence_id) REFERENCES "sequence"(id)
);

CREATE TABLE code_snippet (
    id text,
    background text,
    code text,
    created_at text,
    html text,
    languages text,
    theme text,
    title text,
    user_id text,
    PRIMARY KEY (id)
);

CREATE TABLE sequence_variable (
    "index" text,
    sequence_id text,
    variable text,
    PRIMARY KEY ("index", sequence_id),
    FOREIGN KEY (sequence_id) REFERENCES "sequence"(id)
);

CREATE TABLE sequence_stage (
    "index" text,
    sequence_id text,
    stage_id text,
    PRIMARY KEY ("index", sequence_id),
    FOREIGN KEY (sequence_id) REFERENCES "sequence"(id)
);

CREATE TABLE sequence_bcc (
    "index" text,
    sequence_id text,
    email text,
    "name" text,
    PRIMARY KEY ("index", sequence_id),
    FOREIGN KEY (sequence_id) REFERENCES "sequence"(id)
);

CREATE TABLE sequence_cc (
    "index" text,
    sequence_id text,
    email text,
    "name" text,
    PRIMARY KEY ("index", sequence_id),
    FOREIGN KEY (sequence_id) REFERENCES "sequence"(id)
);

CREATE TABLE "sequence" (
    id text,
    created_at text,
    file_track_enabled text,
    link_track_enabled text,
    "name" text,
    notification_enabled text,
    sync_org text,
    timezone text,
    updated_at text,
    user_id text,
    PRIMARY KEY (id)
);

CREATE TABLE live_feed_event (
    _fivetran_id text,
    message_id text,
    city text,
    country text,
    file_name text,
    id text,
    is_mobile text,
    link_text text,
    link_url text,
    opereting_system text,
    program text,
    recipient_email text,
    recipient_name text,
    region text,
    time_stamp text,
    "type" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (message_id) REFERENCES message(id)
);

CREATE TABLE rule_action (
    id text,
    rule_id text,
    body text,
    created_at text,
    delta_ text,
    delta_unit text,
    is_paused text,
    modified_at text,
    subject text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (rule_id) REFERENCES rule(id)
);

CREATE TABLE rule (
    id text,
    created_at text,
    filter text,
    is_paused text,
    modified_at text,
    "name" text,
    trigger_event_name text,
    trigger_type text,
    user_id text,
    PRIMARY KEY (id)
);

CREATE TABLE meeting_type_guest (
    "index" text,
    meeting_type_id text,
    email text,
    "name" text,
    required text,
    PRIMARY KEY ("index", meeting_type_id),
    FOREIGN KEY (meeting_type_id) REFERENCES meeting_type(id)
);

CREATE TABLE meeting_type_custom (
    "index" text,
    meeting_type_id text,
    label text,
    label_valid text,
    required text,
    "type" text,
    PRIMARY KEY ("index", meeting_type_id),
    FOREIGN KEY (meeting_type_id) REFERENCES meeting_type(id)
);

CREATE TABLE meeting_type_calendar (
    calendar_id text,
    meeting_type_id text,
    PRIMARY KEY (calendar_id, meeting_type_id),
    FOREIGN KEY (calendar_id) REFERENCES meeting_invite(calendar_id),
    FOREIGN KEY (meeting_type_id) REFERENCES meeting_type(id)
);

CREATE TABLE meeting_type_rule (
    meeting_type_id text,
    rule_id text,
    PRIMARY KEY (meeting_type_id, rule_id),
    FOREIGN KEY (meeting_type_id) REFERENCES meeting_type(id),
    FOREIGN KEY (rule_id) REFERENCES rule(id)
);

CREATE TABLE meeting_type (
    id text,
    any_room_in_building jsonb,
    buffer text,
    copy_of text,
    created_at text,
    day_end text,
    day_start text,
    day_unit text,
    description text,
    duration_min text,
    end_date text,
    guest_can_modify_invite text,
    include_message_link text,
    integration_zoom text,
    link text,
    location text,
    "name" text,
    page_title text,
    prevent_book jsonb,
    reduced_interval text,
    room_and_resource jsonb,
    round_queue jsonb,
    start_date text,
    title text,
    updated_at text,
    use_specific_date text,
    user_id text,
    PRIMARY KEY (id)
);

CREATE TABLE meeting_type_day (
    _fivetran_id text,
    meeting_type_id text,
    "day" text,
    enabled text,
    end_time text,
    start_time text,
    PRIMARY KEY (_fivetran_id, meeting_type_id)
);

CREATE TABLE live_feed_recipient (
    "index" text,
    live_feed_id text,
    email text,
    "name" text,
    PRIMARY KEY ("index", live_feed_id),
    FOREIGN KEY (live_feed_id) REFERENCES live_feed(id)
);

CREATE TABLE live_feed (
    id text,
    message_id text,
    from_email text,
    from_name text,
    include_in_team_live_feed text,
    last_event_at text,
    last_event_by_email text,
    last_event_by_name text,
    last_event_type text,
    num_click text,
    num_download text,
    num_open text,
    perma_link text,
    sent text,
    service text,
    service_thread_id text,
    show_content_team_feed text,
    subject text,
    tracking_muted text,
    user_id text,
    was_accepted text,
    was_bounced text,
    was_declined text,
    was_replied text,
    was_tentative text,
    PRIMARY KEY (id),
    FOREIGN KEY (message_id) REFERENCES message(id)
);

CREATE TABLE team_member (
    member_id text,
    team_id text,
    accepted text,
    accepted_at text,
    created_at text,
    email text,
    invited_at text,
    "name" text,
    "role" text,
    user_id text,
    PRIMARY KEY (member_id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE team (
    id text,
    created_at text,
    modified_at text,
    "name" text,
    PRIMARY KEY (id)
);
