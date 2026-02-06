CREATE TABLE team (
    id bigint,
    allow_automated_email_steps boolean,
    call_recording_disabled boolean,
    click_tracking_default boolean,
    created_at timestamp,
    custom_tracking_domain text,
    deactivated boolean,
    dispositions_required boolean,
    email_daily_limit bigint,
    group_privacy_setting text,
    license_limit text,
    local_dial_enabled boolean,
    "name" text,
    plan text,
    record_by_default boolean,
    sentiments_required boolean,
    team_visibility_default text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE team_tag (
    id bigint,
    "name" text,
    PRIMARY KEY (id)
);

-- action_details_id  is a foreign key reference to EMAIL_DETAIL, CALL_INSTRUCTION, INTEGRATION_DETAIL or OTHER_DETAIL based on value of column `type`
CREATE TABLE "action" (
    id bigint,
    cadence_id bigint,
    person_id bigint,
    step_id bigint,
    task_id bigint,
    user_id bigint,
    action_details_id bigint,
    created_at timestamp,
    due boolean,
    due_on timestamp,
    multitouch_group_id bigint,
    "status" text,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (cadence_id) REFERENCES cadence(id),
    FOREIGN KEY (person_id) REFERENCES people(id),
    FOREIGN KEY (step_id) REFERENCES step(id),
    FOREIGN KEY (task_id) REFERENCES task(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE phone_number_assignment (
    id bigint,
    user_id bigint,
    number text,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE call_sentiment (
    id bigint,
    created_at timestamp,
    "name" text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE cadence (
    id bigint,
    added_stage_id bigint,
    bounced_stage_id bigint,
    cadence_priority_id bigint,
    creator_id bigint,
    finished_stage_id bigint,
    owner_id bigint,
    replied_stage_id bigint,
    archived_at timestamp,
    cadence_framework_id bigint,
    cadence_function text,
    created_at timestamp,
    draft boolean,
    "name" text,
    opt_out_link_included boolean,
    remove_bounces_enabled boolean,
    remove_replies_enabled boolean,
    shared boolean,
    team_cadence boolean,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (added_stage_id) REFERENCES person_stage(id),
    FOREIGN KEY (bounced_stage_id) REFERENCES person_stage(id),
    FOREIGN KEY (cadence_priority_id) REFERENCES cadence_priority(id),
    FOREIGN KEY (creator_id) REFERENCES users(id),
    FOREIGN KEY (finished_stage_id) REFERENCES person_stage(id),
    FOREIGN KEY (owner_id) REFERENCES users(id),
    FOREIGN KEY (replied_stage_id) REFERENCES person_stage(id)
);

CREATE TABLE "call" (
    id bigint,
    action_id bigint,
    cadence_id bigint,
    called_person_id bigint,
    crm_activity_id bigint,
    note_id bigint,
    step_id bigint,
    task_id bigint,
    user_id bigint,
    call_to text,
    created_at timestamp,
    disposition text,
    duration double precision,
    sentiment text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (action_id) REFERENCES "action"(id),
    FOREIGN KEY (cadence_id) REFERENCES cadence(id),
    FOREIGN KEY (called_person_id) REFERENCES people(id),
    FOREIGN KEY (crm_activity_id) REFERENCES crm_activity(id),
    FOREIGN KEY (note_id) REFERENCES note(id),
    FOREIGN KEY (step_id) REFERENCES step(id),
    FOREIGN KEY (task_id) REFERENCES task(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE people_tag (
    "index" integer,
    people_id bigint,
    tag_name text,
    PRIMARY KEY ("index", people_id),
    FOREIGN KEY (people_id) REFERENCES people(id)
);

CREATE TABLE email_template_tag (
    "index" integer,
    email_template_id bigint,
    tag_name text,
    PRIMARY KEY ("index", email_template_id),
    FOREIGN KEY (email_template_id) REFERENCES email_template(id)
);

CREATE TABLE call_instruction (
    id bigint,
    created_at timestamp,
    instructions text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE step (
    id bigint,
    cadence_id bigint,
    created_at timestamp,
    "day" integer,
    detail_id bigint,
    disabled boolean,
    display_name text,
    "name" text,
    step_number text,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (cadence_id) REFERENCES cadence(id)
);

CREATE TABLE users (
    id bigint,
    group_id bigint,
    phone_number_assignment_id bigint,
    team_id bigint,
    active boolean,
    bcc_email_address text,
    click_to_call_enabled boolean,
    created_at timestamp,
    crm_connected boolean,
    email text,
    email_client_configured boolean,
    email_client_email_address text,
    email_signature text,
    email_signature_click_tracking_disabled boolean,
    email_signature_type text,
    first_name text,
    from_address text,
    full_email_address text,
    guid text,
    job_role text,
    last_name text,
    local_dial_enabled boolean,
    "name" text,
    sending_email_address text,
    slack_username text,
    team_admin boolean,
    time_zone text,
    twitter_handle text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (group_id) REFERENCES groups(id),
    FOREIGN KEY (phone_number_assignment_id) REFERENCES phone_number_assignment(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE call_recording (
    "index" integer,
    call_id bigint,
    PRIMARY KEY ("index", call_id),
    FOREIGN KEY (call_id) REFERENCES "call"(id)
);

CREATE TABLE meeting_attendee (
    "index" integer,
    meeting_id bigint,
    deleted_at timestamp,
    email text,
    "name" text,
    organizer boolean,
    "status" text,
    status_changed boolean,
    PRIMARY KEY ("index", meeting_id),
    FOREIGN KEY (meeting_id) REFERENCES meeting(id)
);

CREATE TABLE account_stage (
    id bigint,
    account_stage_order integer,
    created_at timestamp,
    "name" text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE email_detail (
    id bigint,
    email_template_id bigint,
    created_at timestamp,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (email_template_id) REFERENCES email_template(id)
);

CREATE TABLE email_template (
    id bigint,
    email_template_attachment_id text,
    group_id bigint,
    team_template_id text,
    template_owner_id bigint,
    archived_at timestamp,
    body text,
    body_preview text,
    cadence_template boolean,
    click_tracking_enabled boolean,
    created_at timestamp,
    last_used_at timestamp,
    open_tracking_enabled boolean,
    shared boolean,
    subject text,
    title text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (email_template_attachment_id) REFERENCES email_template_attachment(id),
    FOREIGN KEY (group_id) REFERENCES groups(id),
    FOREIGN KEY (team_template_id) REFERENCES team_template(id),
    FOREIGN KEY (template_owner_id) REFERENCES users(id)
);

CREATE TABLE crm_activity_field (
    id bigint,
    created_at timestamp,
    crm_object_type text,
    field text,
    field_type text,
    salesforce_object_type text,
    "source" text,
    title text,
    updated_at timestamp,
    "value" text,
    PRIMARY KEY (id)
);

CREATE TABLE team_template_attachment (
    id bigint,
    team_template_id text,
    attachment_file_size double precision,
    attachment_id bigint,
    download_url text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (team_template_id) REFERENCES team_template(id)
);

CREATE TABLE crm_user (
    id bigint,
    user_id bigint,
    created_at timestamp,
    crm_id text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE people_contact_restriction (
    "index" integer,
    people_id bigint,
    contact_restriction text,
    PRIMARY KEY ("index", people_id),
    FOREIGN KEY (people_id) REFERENCES people(id)
);

CREATE TABLE cadence_membership (
    id bigint,
    cadence_id bigint,
    latest_action_id bigint,
    person_id bigint,
    user_id bigint,
    added_at timestamp,
    created_at timestamp,
    current_state text,
    currently_on_cadence boolean,
    person_deleted boolean,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (cadence_id) REFERENCES cadence(id),
    FOREIGN KEY (latest_action_id) REFERENCES "action"(id),
    FOREIGN KEY (person_id) REFERENCES people(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE account (
    id bigint,
    account_tier_id bigint,
    company_stage_id bigint,
    creator_id bigint,
    last_contacted_person_id bigint,
    last_created_by_id bigint,
    owner_id bigint,
    archieved_at timestamp,
    city text,
    company_type text,
    conversational_name text,
    country text,
    created_at timestamp,
    crm_id text,
    crm_object_type text,
    crm_url text,
    description text,
    do_not_contact boolean,
    domain text,
    founded_date text,
    industry text,
    last_contacted_at timestamp,
    last_contacted_type text,
    linkedin_url text,
    locale text,
    "name" text,
    owner_crm_id text,
    people_count text,
    phone text,
    postal_code text,
    revenue_range text,
    "size" text,
    "state" text,
    street text,
    twitter_handle text,
    updated_at timestamp,
    website text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_tier_id) REFERENCES account_tier(id),
    FOREIGN KEY (company_stage_id) REFERENCES account_stage(id),
    FOREIGN KEY (creator_id) REFERENCES users(id),
    FOREIGN KEY (last_contacted_person_id) REFERENCES people(id),
    FOREIGN KEY (last_created_by_id) REFERENCES users(id),
    FOREIGN KEY (owner_id) REFERENCES users(id)
);

CREATE TABLE account_tier (
    id bigint,
    account_tier_order integer,
    created_at timestamp,
    "name" text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE people (
    id bigint,
    account_id bigint,
    import_id bigint,
    last_completed_step_cadence_id bigint,
    last_completed_step_id bigint,
    last_contacted_by_id bigint,
    most_recent_cadence_id bigint,
    owner_id bigint,
    person_stage_id bigint,
    bouncing boolean,
    city text,
    country text,
    created_at timestamp,
    crm_id text,
    crm_object_type text,
    crm_url text,
    display_name text,
    do_not_contact boolean,
    email_address text,
    eu_resident boolean,
    first_name text,
    full_email_address text,
    home_phone text,
    job_seniority text,
    last_contacted_at timestamp,
    last_contacted_type text,
    last_name text,
    last_replied_at timestamp,
    linkedin_url text,
    locale text,
    mobile_phone text,
    owner_crm_id text,
    person_company_industry text,
    person_company_name text,
    person_company_website text,
    personal_email_address text,
    personal_website text,
    phone text,
    phone_extension text,
    secondary_email_address text,
    "state" text,
    title text,
    twitter_handle text,
    updated_at timestamp,
    work_city text,
    work_country text,
    work_state text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (import_id) REFERENCES import(id),
    FOREIGN KEY (last_completed_step_cadence_id) REFERENCES cadence(id),
    FOREIGN KEY (last_completed_step_id) REFERENCES step(id),
    FOREIGN KEY (last_contacted_by_id) REFERENCES users(id),
    FOREIGN KEY (most_recent_cadence_id) REFERENCES cadence(id),
    FOREIGN KEY (owner_id) REFERENCES users(id),
    FOREIGN KEY (person_stage_id) REFERENCES person_stage(id)
);

CREATE TABLE opportunity (
    id bigint,
    account_id bigint,
    creator_id bigint,
    most_recent_cadence_id bigint,
    most_recent_step_account_id bigint,
    most_recent_step_id bigint,
    owner_id bigint,
    account_crm_id text,
    account_name text,
    amount text,
    close_date text,
    created_at timestamp,
    created_by_crm_id text,
    created_date timestamp,
    crm_id text,
    crm_last_updated_date timestamp,
    crm_type text,
    crm_url text,
    currency_iso_code text,
    is_closed boolean,
    is_won boolean,
    most_recent_step_number integer,
    "name" text,
    opportunity_type text,
    opportunity_window_person_id bigint,
    opportunity_window_started_at timestamp,
    owner_crm_id text,
    owner_crm_name text,
    probability text,
    stage_name text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (creator_id) REFERENCES users(id),
    FOREIGN KEY (most_recent_cadence_id) REFERENCES cadence(id),
    FOREIGN KEY (most_recent_step_account_id) REFERENCES users(id),
    FOREIGN KEY (most_recent_step_id) REFERENCES step(id),
    FOREIGN KEY (owner_id) REFERENCES users(id)
);

CREATE TABLE call_data_record (
    id bigint,
    call_id bigint,
    called_person_id bigint,
    user_id bigint,
    call_from text,
    call_to text,
    call_type text,
    call_uuid text,
    created_at timestamp,
    direction text,
    duration double precision,
    "status" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (call_id) REFERENCES "call"(id),
    FOREIGN KEY (called_person_id) REFERENCES people(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE person_stage (
    id bigint,
    created_at timestamp,
    "name" text,
    person_stage_order integer,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE cadence_priority (
    id bigint,
    created_at timestamp,
    "name" text,
    priority integer,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE email_template_attachment (
    id bigint,
    email_template_id bigint,
    attachment_file_size double precision,
    attachment_id text,
    created_at timestamp,
    download_url text,
    "name" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (email_template_id) REFERENCES email_template(id)
);

CREATE TABLE import (
    id bigint,
    created_at timestamp,
    current_people_count bigint,
    imported_people_count bigint,
    "name" text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE integration_detail (
    id bigint,
    created_at timestamp,
    instructions text,
    integration_id bigint,
    integration_name text,
    integration_step_type_guid text,
    integration_step_type_icon text,
    integration_step_type_label text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE team_template_tag (
    "index" integer,
    team_template_id text,
    tag_name text,
    PRIMARY KEY ("index", team_template_id),
    FOREIGN KEY (team_template_id) REFERENCES team_template(id)
);

CREATE TABLE task (
    id bigint,
    created_by_user_id bigint,
    person_id bigint,
    user_id bigint,
    created_at timestamp,
    current_state text,
    description text,
    due_at timestamp,
    due_date text,
    subject text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_user_id) REFERENCES users(id),
    FOREIGN KEY (person_id) REFERENCES people(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE team_template (
    id text,
    attachment_id text,
    last_modified_user_id bigint,
    archived_at timestamp,
    body text,
    body_preview text,
    click_tracking_enabled boolean,
    created_at timestamp,
    last_modified_at timestamp,
    last_used_at timestamp,
    open_tracking_enabled boolean,
    subject text,
    title text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (attachment_id) REFERENCES team_template_attachment(id),
    FOREIGN KEY (last_modified_user_id) REFERENCES users(id)
);

CREATE TABLE calendar_event (
    id text,
    all_day text,
    body_html text,
    busy boolean,
    calendar_id text,
    canceled_at timestamp,
    created_at timestamp,
    creator text,
    description text,
    end_time timestamp,
    html_link text,
    i_cal_uid text,
    location text,
    organizer text,
    provider text,
    recurring text,
    start_time timestamp,
    "status" text,
    tenant_id bigint,
    title text,
    updated_at timestamp,
    user_guid text,
    PRIMARY KEY (id)
);

CREATE TABLE calendar_event_attendee (
    "index" integer,
    calendar_event_id text,
    PRIMARY KEY ("index", calendar_event_id),
    FOREIGN KEY (calendar_event_id) REFERENCES calendar_event(id)
);

CREATE TABLE other_detail (
    id bigint,
    created_at timestamp,
    instructions text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE call_disposition (
    id bigint,
    created_at timestamp,
    "name" text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE meeting (
    id bigint,
    cadence_id bigint,
    person_id bigint,
    step_id bigint,
    account_id text,
    all_day boolean,
    booked_by_meetings_settings_email_address text,
    booked_by_user_guid text,
    calendar_id text,
    calendar_type text,
    canceled_at timestamp,
    created_at timestamp,
    crm_reference_what_crm_id text,
    crm_reference_what_crm_object_label text,
    crm_reference_what_crm_object_type text,
    crm_reference_what_crm_url text,
    crm_reference_what_description_1 text,
    crm_reference_what_description_2 text,
    crm_reference_what_description_3 text,
    crm_reference_who_crm_id text,
    crm_reference_who_crm_object_label text,
    crm_reference_who_crm_object_type text,
    crm_reference_who_crm_url text,
    crm_reference_who_description_1 text,
    crm_reference_who_description_2 text,
    crm_reference_who_description_3 text,
    description text,
    end_time timestamp,
    event_id text,
    event_source text,
    i_cal_uid text,
    location text,
    meeting_type text,
    no_show boolean,
    owned_by_meetings_settings_email_address text,
    recipient_email text,
    recipient_name text,
    start_time timestamp,
    "status" text,
    strict_attribution boolean,
    task_id text,
    title text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (cadence_id) REFERENCES cadence(id),
    FOREIGN KEY (person_id) REFERENCES people(id),
    FOREIGN KEY (step_id) REFERENCES step(id)
);

CREATE TABLE cadence_tag (
    "index" integer,
    cadence_id bigint,
    tag_name text,
    PRIMARY KEY ("index", cadence_id),
    FOREIGN KEY (cadence_id) REFERENCES cadence(id)
);

-- associated_with_id is a foreign key reference to PERSON or ACCOUNT depending on value of column `type`
CREATE TABLE note (
    id bigint,
    call_id bigint,
    user_id bigint,
    associated_type text,
    associated_with_id bigint,
    content text,
    created_at timestamp,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (call_id) REFERENCES "call"(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE meeting_setting_times_available (
    "day" text,
    meeting_setting_id bigint,
    enabled boolean,
    end_time text,
    is_valid boolean,
    start_time text,
    PRIMARY KEY ("day", meeting_setting_id),
    FOREIGN KEY (meeting_setting_id) REFERENCES meeting_setting(id)
);

CREATE TABLE opportunity_tag (
    "index" integer,
    opportunity_id bigint,
    tag_name text,
    PRIMARY KEY ("index", opportunity_id),
    FOREIGN KEY (opportunity_id) REFERENCES opportunity(id)
);

CREATE TABLE meeting_setting (
    id bigint,
    active_meeting_created_at timestamp,
    active_meeting_updated_at timestamp,
    active_meeting_url text,
    allow_booking_on_behalf boolean,
    allow_booking_overtime boolean,
    allow_event_overlap boolean,
    availability_limit bigint,
    availability_limit_enabled boolean,
    buffer_time_duration bigint,
    calendar_type text,
    created_at timestamp,
    default_meeting_length bigint,
    description text,
    email_address text,
    enable_calendar_sync boolean,
    enable_dynamic_location boolean,
    location text,
    primary_calendar_connection_failed boolean,
    primary_calendar_id text,
    primary_calendar_name text,
    schedule_buffer_enabled boolean,
    schedule_delay bigint,
    share_event_detail boolean,
    time_zone text,
    title text,
    updated_at timestamp,
    user_guid text,
    user_slug text,
    PRIMARY KEY (id)
);

CREATE TABLE crm_activity (
    id bigint,
    person_id bigint,
    user_id bigint,
    activity_type text,
    created_at timestamp,
    crm_id text,
    description text,
    error text,
    subject text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (person_id) REFERENCES people(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE meeting_guest (
    "index" integer,
    meeting_id bigint,
    guest text,
    PRIMARY KEY ("index", meeting_id),
    FOREIGN KEY (meeting_id) REFERENCES meeting(id)
);

CREATE TABLE success (
    id bigint,
    latest_action_id bigint,
    latest_cadence_id bigint,
    latest_call_id bigint,
    latest_email_id bigint,
    latest_step_id bigint,
    person_id bigint,
    user_id bigint,
    created_at timestamp,
    succeeded_at timestamp,
    success_window_started_at timestamp,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (latest_action_id) REFERENCES "action"(id),
    FOREIGN KEY (latest_cadence_id) REFERENCES cadence(id),
    FOREIGN KEY (latest_call_id) REFERENCES "call"(id),
    FOREIGN KEY (latest_email_id) REFERENCES email(id),
    FOREIGN KEY (latest_step_id) REFERENCES step(id),
    FOREIGN KEY (person_id) REFERENCES people(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE groups (
    id bigint,
    parent_id bigint,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (parent_id) REFERENCES groups(id)
);

CREATE TABLE account_tag (
    "index" integer,
    account_id bigint,
    tag_name text,
    PRIMARY KEY ("index", account_id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE email (
    id bigint,
    action_id bigint,
    cadence_id bigint,
    crm_activity_id bigint,
    email_template_id bigint,
    recipient_id bigint,
    step_id bigint,
    task_id bigint,
    user_id bigint,
    bounced boolean,
    click_tracking boolean,
    created_at timestamp,
    error_message text,
    mailing_id bigint,
    personalization text,
    recipient_email_address text,
    send_after timestamp,
    sent_at timestamp,
    "status" text,
    subject text,
    updated_at timestamp,
    view_tracking boolean,
    PRIMARY KEY (id),
    FOREIGN KEY (action_id) REFERENCES "action"(id),
    FOREIGN KEY (cadence_id) REFERENCES cadence(id),
    FOREIGN KEY (crm_activity_id) REFERENCES crm_activity(id),
    FOREIGN KEY (email_template_id) REFERENCES email_template(id),
    FOREIGN KEY (recipient_id) REFERENCES people(id),
    FOREIGN KEY (step_id) REFERENCES step(id),
    FOREIGN KEY (task_id) REFERENCES task(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);
