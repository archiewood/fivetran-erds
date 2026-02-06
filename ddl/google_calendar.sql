CREATE TABLE conference_data_entrypoint (
    "index" text,
    event_id text,
    access_code text,
    entrypoint_type text,
    label text,
    meeting_code text,
    passcode text,
    password text,
    pin text,
    uri text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE reminder_override (
    "index" text,
    event_id text,
    method text,
    minutes text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE attendee (
    email text,
    event_id text,
    additional_guests text,
    "comment" text,
    display_name text,
    optional text,
    organizer text,
    resource text,
    response_status text,
    self text,
    PRIMARY KEY (email, event_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE attachment (
    _fivetran_id text,
    event_id text,
    file_id text,
    file_url text,
    icon_link text,
    mime_type text,
    title text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE recurrence (
    recurrence text,
    event_id text,
    PRIMARY KEY (recurrence, event_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE event_gadget_preference (
    "name" text,
    event_id text,
    "value" text,
    PRIMARY KEY ("name", event_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE event_private_property (
    "name" text,
    event_id text,
    "value" text,
    PRIMARY KEY ("name", event_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE event_shared_property (
    "name" text,
    event_id text,
    "value" text,
    PRIMARY KEY ("name", event_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE event (
    id text,
    calendar_list_id text,
    recurring_event_id text,
    anyone_can_add_self text,
    attendees_omitted text,
    conference_id text,
    conference_solution_type text,
    created text,
    creator_display_name text,
    creator_email text,
    creator_id text,
    creator_self text,
    description text,
    end_date text,
    end_date_time text,
    end_time_unspecified text,
    end_time_zone text,
    etag text,
    event_type text,
    gadget_display text,
    gadget_height text,
    gadget_icon_link text,
    gadget_link text,
    gadget_title text,
    gadget_type text,
    gadget_width text,
    guests_can_invite_others text,
    guests_can_modify text,
    guests_can_see_other_guests text,
    hangout_link text,
    html_link text,
    i_cal_uid text,
    icon_uri text,
    kind text,
    location text,
    locked text,
    "name" text,
    notes text,
    organizer_display_name text,
    organizer_email text,
    organizer_id text,
    organizer_self text,
    original_start_date text,
    original_start_time_date text,
    original_start_time_zone text,
    private_copy text,
    request_id text,
    "sequence" text,
    signature text,
    start_date text,
    start_date_time text,
    start_time_zone text,
    "status" text,
    status_code text,
    summary text,
    title text,
    transparency text,
    "type" text,
    updated timestamp,
    url text,
    use_default text,
    visibility text,
    PRIMARY KEY (id),
    FOREIGN KEY (calendar_list_id) REFERENCES calendar_list(id),
    FOREIGN KEY (recurring_event_id) REFERENCES event(id)
);

CREATE TABLE access_control_list (
    id text,
    calendar_list_id text,
    etag text,
    kind text,
    "role" text,
    scope_type text,
    scope_value text,
    PRIMARY KEY (id),
    FOREIGN KEY (calendar_list_id) REFERENCES calendar_list(id)
);

CREATE TABLE setting (
    id text,
    etag text,
    kind text,
    "value" text,
    PRIMARY KEY (id)
);

CREATE TABLE default_reminder (
    _fivetran_id text,
    calendar_list_id text,
    method text,
    minutes text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (calendar_list_id) REFERENCES calendar_list(id)
);

CREATE TABLE allowed_conference_solution_type (
    solution_type text,
    calendar_list_id text,
    PRIMARY KEY (solution_type, calendar_list_id),
    FOREIGN KEY (calendar_list_id) REFERENCES calendar_list(id)
);

CREATE TABLE notification_setting (
    _fivetran_id text,
    calendar_list_id text,
    method text,
    "type" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (calendar_list_id) REFERENCES calendar_list(id)
);

CREATE TABLE calendar_list (
    id text,
    access_role text,
    background_color text,
    deleted text,
    description text,
    etag text,
    foreground_color text,
    hidden text,
    is_primary text,
    kind text,
    location text,
    selected text,
    summary text,
    summary_override text,
    time_zone text,
    PRIMARY KEY (id)
);
