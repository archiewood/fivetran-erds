CREATE TABLE contact_email (
    _fivetran_id text,
    contact_id text,
    email text,
    "type" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE contact_group (
    id text,
    account_id text,
    contact_id text,
    "name" text,
    object text,
    "path" text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(account_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE contact_im_address (
    _fivetran_id text,
    contact_id text,
    im_address text,
    "type" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE contact_phone_number (
    _fivetran_id text,
    contact_id text,
    number text,
    "type" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE contact_physical_address (
    _fivetran_id text,
    contact_id text,
    city text,
    country text,
    format text,
    postal_code text,
    "state" text,
    street_address text,
    "type" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE contact_web_page (
    _fivetran_id text,
    contact_id text,
    "type" text,
    url text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE contact (
    id text,
    account_id text,
    birthday text,
    company_name text,
    given_name text,
    job_title text,
    manager_name text,
    middle_name text,
    nickname text,
    notes text,
    object text,
    office_location text,
    picture_url text,
    "source" text,
    suffix text,
    surname text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(account_id)
);

CREATE TABLE participant (
    _fivetran_id text,
    event_id text,
    "comment" text,
    email text,
    "name" text,
    phone_number text,
    "status" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE phone (
    phone text,
    event_id text,
    PRIMARY KEY (phone, event_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE event_metadata (
    "name" text,
    event_id text,
    "value" text,
    PRIMARY KEY ("name", event_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE event (
    id text,
    account_id text,
    calendar_id text,
    message_id text,
    busy text,
    conferencing_details_meeting_code text,
    conferencing_provider text,
    customer_event_id text,
    description text,
    hide_participants text,
    ical_uid text,
    location text,
    object text,
    organizer_email text,
    organizer_name text,
    original_start_time text,
    owner text,
    read_only text,
    recurrence_rrule text,
    recurrence_timezone text,
    reminders_reminder_method text,
    reminders_reminder_minutes text,
    "status" text,
    title text,
    updated_at timestamp,
    visibility text,
    when_date_date text,
    when_date_object text,
    when_datespan_end_time text,
    when_datespan_object text,
    when_datespan_start_time text,
    when_time_object text,
    when_time_time text,
    when_time_timezone text,
    when_timespan_end_time text,
    when_timespan_end_timezone text,
    when_timespan_object text,
    when_timespan_start_time text,
    when_timespan_start_timezone text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(account_id),
    FOREIGN KEY (calendar_id) REFERENCES calendar(id),
    FOREIGN KEY (message_id) REFERENCES message(id)
);

CREATE TABLE account (
    id text,
    account_id text,
    email_address text,
    linked_at text,
    "name" text,
    object text,
    organization_unit text,
    provider text,
    sync_state text,
    PRIMARY KEY (id)
);

CREATE TABLE label (
    id text,
    account_id text,
    display_name text,
    "name" text,
    object text,
    provider_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(account_id)
);

CREATE TABLE folder (
    id text,
    account_id text,
    display_name text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(account_id)
);

CREATE TABLE calendar (
    id text,
    account_id text,
    description text,
    is_primary text,
    location text,
    "name" text,
    object text,
    read_only text,
    timezone text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(account_id)
);

CREATE TABLE message_event (
    event_id text,
    message_id text,
    id text,
    PRIMARY KEY (event_id, message_id),
    FOREIGN KEY (message_id) REFERENCES message(id),
    FOREIGN KEY (id) REFERENCES event(id)
);

CREATE TABLE message_file (
    file_id text,
    message_id text,
    id text,
    PRIMARY KEY (file_id, message_id),
    FOREIGN KEY (message_id) REFERENCES message(id),
    FOREIGN KEY (id) REFERENCES file(id)
);

CREATE TABLE message_label (
    label_id text,
    message_id text,
    id text,
    PRIMARY KEY (label_id, message_id),
    FOREIGN KEY (message_id) REFERENCES message(id),
    FOREIGN KEY (id) REFERENCES label(id)
);

CREATE TABLE cid (
    content_id text,
    message_id text,
    PRIMARY KEY (content_id, message_id),
    FOREIGN KEY (message_id) REFERENCES message(id)
);

CREATE TABLE message (
    id text,
    account_id text,
    folder_id text,
    thread_id text,
    body text,
    "date" text,
    object text,
    reply_to_message_id text,
    snippet text,
    starred text,
    subject text,
    unread text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(account_id),
    FOREIGN KEY (folder_id) REFERENCES folder(id),
    FOREIGN KEY (thread_id) REFERENCES thread(id)
);

CREATE TABLE message_sender (
    email text,
    object_type text,
    message_id text,
    "name" text,
    PRIMARY KEY (email, object_type, message_id),
    FOREIGN KEY (message_id) REFERENCES message(id)
);

CREATE TABLE message_recipient (
    email text,
    object_type text,
    message_id text,
    "name" text,
    PRIMARY KEY (email, object_type, message_id),
    FOREIGN KEY (message_id) REFERENCES message(id)
);

CREATE TABLE file (
    id text,
    account_id text,
    content_disposition text,
    content_type text,
    filename text,
    object text,
    "size" text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(account_id)
);

CREATE TABLE job_status (
    id text,
    account_id text,
    "action" text,
    created_at text,
    object text,
    "status" text,
    status_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(account_id)
);

CREATE TABLE draft_event (
    event_id text,
    draft_id text,
    id text,
    PRIMARY KEY (event_id, draft_id),
    FOREIGN KEY (draft_id) REFERENCES draft(id),
    FOREIGN KEY (id) REFERENCES event(id)
);

CREATE TABLE draft_file (
    file_id text,
    draft_id text,
    id text,
    PRIMARY KEY (file_id, draft_id),
    FOREIGN KEY (draft_id) REFERENCES draft(id),
    FOREIGN KEY (id) REFERENCES file(id)
);

CREATE TABLE draft_folder (
    folder_id text,
    draft_id text,
    id text,
    PRIMARY KEY (folder_id, draft_id),
    FOREIGN KEY (draft_id) REFERENCES draft(id),
    FOREIGN KEY (id) REFERENCES folder(id)
);

CREATE TABLE draft_label (
    label_id text,
    draft_id text,
    id text,
    PRIMARY KEY (label_id, draft_id),
    FOREIGN KEY (draft_id) REFERENCES draft(id),
    FOREIGN KEY (id) REFERENCES label(id)
);

CREATE TABLE draft_metadata (
    "name" text,
    draft_id text,
    "value" text,
    PRIMARY KEY ("name", draft_id),
    FOREIGN KEY (draft_id) REFERENCES draft(id)
);

CREATE TABLE draft (
    id text,
    account_id text,
    job_status_id text,
    reply_to_message_id text,
    thread_id text,
    body text,
    content_id text,
    "date" text,
    object text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(account_id),
    FOREIGN KEY (job_status_id) REFERENCES job_status(id),
    FOREIGN KEY (reply_to_message_id) REFERENCES message(reply_to_message_id),
    FOREIGN KEY (thread_id) REFERENCES thread(id)
);

CREATE TABLE draft_sender (
    email text,
    object_type text,
    draft_id text,
    "name" text,
    PRIMARY KEY (email, object_type, draft_id),
    FOREIGN KEY (draft_id) REFERENCES draft(id)
);

CREATE TABLE draft_recipient (
    email text,
    object_type text,
    draft_id text,
    "name" text,
    PRIMARY KEY (email, object_type, draft_id),
    FOREIGN KEY (draft_id) REFERENCES draft(id)
);

CREATE TABLE thread_participant (
    _fivetran_id text,
    thread_id text,
    email text,
    "name" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (thread_id) REFERENCES thread(id)
);

CREATE TABLE thread_draft (
    draft_id text,
    thread_id text,
    id text,
    PRIMARY KEY (draft_id, thread_id),
    FOREIGN KEY (thread_id) REFERENCES thread(id),
    FOREIGN KEY (id) REFERENCES draft(id)
);

CREATE TABLE thread_label (
    label_id text,
    thread_id text,
    id text,
    PRIMARY KEY (label_id, thread_id),
    FOREIGN KEY (thread_id) REFERENCES thread(id),
    FOREIGN KEY (id) REFERENCES label(id)
);

CREATE TABLE thread_folder (
    folder_id text,
    thread_id text,
    id text,
    PRIMARY KEY (folder_id, thread_id),
    FOREIGN KEY (thread_id) REFERENCES thread(id),
    FOREIGN KEY (id) REFERENCES folder(id)
);

CREATE TABLE thread_message (
    message_id text,
    thread_id text,
    id text,
    PRIMARY KEY (message_id, thread_id),
    FOREIGN KEY (thread_id) REFERENCES thread(id),
    FOREIGN KEY (id) REFERENCES message(id)
);

CREATE TABLE thread (
    id text,
    account_id text,
    first_message_timestamp text,
    has_attachments text,
    last_message_received_timestamp text,
    last_message_sent_timestamp text,
    last_updated_timestamp timestamp,
    object text,
    snippet text,
    starred text,
    subject text,
    unread text,
    version text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(account_id)
);
