CREATE TABLE contact_email (
    email text,
    contact_id text,
    "type" text,
    PRIMARY KEY (email, contact_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE contact_phone (
    phone text,
    contact_id text,
    country text,
    phone_formatted text,
    "type" text,
    PRIMARY KEY (phone, contact_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE contact (
    id text,
    created_by text,
    lead_id text,
    updated_by text,
    date_created text,
    date_updated text,
    display_name text,
    integration_links jsonb,
    "name" text,
    organization_id text,
    title text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (lead_id) REFERENCES lead(id),
    FOREIGN KEY (updated_by) REFERENCES users(id)
);

CREATE TABLE group_member (
    group_id text,
    user_id text,
    PRIMARY KEY (group_id, user_id),
    FOREIGN KEY (group_id) REFERENCES groups(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE groups (
    id text,
    "name" text,
    organization_id text,
    PRIMARY KEY (id)
);

CREATE TABLE lead_status (
    id text,
    label text,
    organization_id text,
    PRIMARY KEY (id)
);

CREATE TABLE opportunity_status_change_activity (
    id text,
    created_by text,
    new_status_id text,
    old_status_id text,
    opportunity_id text,
    updated_by text,
    user_id text,
    contact_id text,
    date_created text,
    date_updated text,
    lead_id text,
    organization_id text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (new_status_id) REFERENCES opportunity_status(id),
    FOREIGN KEY (old_status_id) REFERENCES opportunity_status(id),
    FOREIGN KEY (opportunity_id) REFERENCES opportunity(id),
    FOREIGN KEY (updated_by) REFERENCES users(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE send_as (
    id text,
    allowed_user_id text,
    allowing_user_id text,
    organization_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (allowed_user_id) REFERENCES users(id),
    FOREIGN KEY (allowing_user_id) REFERENCES users(id)
);

CREATE TABLE lead_custom_field (
    id text,
    created_by text,
    updated_by text,
    accepts_multiple_values text,
    back_reference_is_visible text,
    choices jsonb,
    date_created text,
    date_updated text,
    description text,
    editable_with_roles jsonb,
    is_shared text,
    "name" text,
    organization_id text,
    referenced_custom_type_id text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (updated_by) REFERENCES users(id)
);

CREATE TABLE bulk_email (
    id text,
    created_by text,
    template_id text,
    updated_by text,
    contact_preference text,
    date_created text,
    date_updated text,
    n_leads text,
    n_leads_processed text,
    organization_id text,
    query text,
    send_done_email text,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (template_id) REFERENCES email_template(id),
    FOREIGN KEY (updated_by) REFERENCES users(id)
);

CREATE TABLE bulk_edit (
    id text,
    created_by text,
    lead_status_id text,
    updated_by text,
    date_created text,
    date_updated text,
    n_leads text,
    n_leads_processed text,
    organization_id text,
    query text,
    send_done_email text,
    "status" text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (lead_status_id) REFERENCES lead_status(id),
    FOREIGN KEY (updated_by) REFERENCES users(id)
);

CREATE TABLE email_thread_participant (
    email text,
    email_thread_activity_id text,
    "name" text,
    PRIMARY KEY (email, email_thread_activity_id),
    FOREIGN KEY (email_thread_activity_id) REFERENCES email_thread_activity(id)
);

CREATE TABLE email_thread_activity (
    id text,
    contact_id text,
    created_by text,
    lead_id text,
    updated_by text,
    user_id text,
    activity_at text,
    date_created text,
    date_updated text,
    latest_normalized_subject text,
    n_emails text,
    organization_id text,
    "type" text,
    users jsonb,
    PRIMARY KEY (id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (lead_id) REFERENCES lead(id),
    FOREIGN KEY (updated_by) REFERENCES users(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE lead_status_change_activity (
    id text,
    contact_id text,
    created_by text,
    lead_id text,
    new_status_id text,
    old_status_id text,
    updated_by text,
    user_id text,
    activity_at text,
    date_created text,
    date_updated text,
    organization_id text,
    users jsonb,
    PRIMARY KEY (id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (lead_id) REFERENCES lead(id),
    FOREIGN KEY (new_status_id) REFERENCES lead_status(id),
    FOREIGN KEY (old_status_id) REFERENCES lead_status(id),
    FOREIGN KEY (updated_by) REFERENCES users(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE activity_custom_field (
    id text,
    created_by text,
    updated_by text,
    accepts_multiple_values text,
    choices jsonb,
    custom_activity_type_id text,
    date_created text,
    date_updated text,
    description text,
    editable_with_roles jsonb,
    "name" text,
    organization_id text,
    referenced_custom_type_id text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (updated_by) REFERENCES users(id)
);

CREATE TABLE task_email (
    email text,
    task_id text,
    PRIMARY KEY (email, task_id),
    FOREIGN KEY (task_id) REFERENCES task(id)
);

CREATE TABLE task (
    id text,
    assigned_to text,
    contact_id text,
    created_by text,
    lead_id text,
    updated_by text,
    "date" text,
    date_created text,
    date_updated text,
    is_complete text,
    object_id text,
    object_type text,
    opportunity_note text,
    opportunity_value text,
    opportunity_value_formatted text,
    opportunity_value_period text,
    organization_id text,
    "type" text,
    "view" text,
    PRIMARY KEY (id),
    FOREIGN KEY (assigned_to) REFERENCES users(id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (lead_id) REFERENCES lead(id),
    FOREIGN KEY (updated_by) REFERENCES users(id)
);

CREATE TABLE bulk_sequence_subscription (
    id text,
    created_by text,
    sequence_id text,
    updated_by text,
    action_type text,
    contact_preference text,
    date_created text,
    date_updated text,
    n_leads text,
    n_leads_processed text,
    organization_id text,
    query text,
    send_done_email text,
    sender_account_id text,
    sender_email text,
    sender_name text,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (sequence_id) REFERENCES "sequence"(id),
    FOREIGN KEY (updated_by) REFERENCES users(id)
);

CREATE TABLE dialer_user (
    dialer_id text,
    user_id text,
    is_active text,
    "state" text,
    PRIMARY KEY (dialer_id, user_id),
    FOREIGN KEY (dialer_id) REFERENCES dialer(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE dialer (
    id text,
    caller_id text,
    date_created text,
    date_updated text,
    is_user_dependent text,
    music_preference text,
    organization_id text,
    ring_mode text,
    source_type text,
    source_value text,
    "status" text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE phone_number (
    id text,
    user_id text,
    date_created text,
    date_updated text,
    forward_to text,
    forward_to_enabled text,
    forward_to_formatted text,
    is_group_number text,
    label text,
    number text,
    number_formatted text,
    organization_id text,
    participants jsonb,
    phone_numbers jsonb,
    phone_numbers_formatted jsonb,
    sms_enabled text,
    supports_sms_to_countries jsonb,
    "type" text,
    voicemail_greeting_url text,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    date_created text,
    date_updated text,
    email text,
    email_verification_token_generated_at text,
    email_verified_at text,
    first_name text,
    image text,
    last_name text,
    last_used_timezone text,
    organizations jsonb,
    PRIMARY KEY (id)
);

CREATE TABLE call_activity (
    id text,
    contact_id text,
    created_by text,
    lead_id text,
    sequence_id text,
    sequence_subscription_id text,
    transferred_from_user_id text,
    transferred_to_user_id text,
    updated_by text,
    user_id text,
    activity_at text,
    call_method text,
    coach_legs jsonb,
    cost double precision,
    date_answered text,
    date_created text,
    date_updated text,
    dialer_id text,
    dialer_saved_search_id text,
    direction text,
    disposition text,
    duration text,
    forwarded_to text,
    has_recording text,
    is_forwarded text,
    is_joinable text,
    is_to_group_number text,
    local_country_iso text,
    local_phone text,
    local_phone_formatted text,
    note text,
    organization_id text,
    phone text,
    recording_expires_at text,
    recording_url text,
    remote_country_iso text,
    remote_phone text,
    remote_phone_formatted text,
    "source" text,
    "status" text,
    "type" text,
    users jsonb,
    voicemail_duration text,
    voicemail_url text,
    PRIMARY KEY (id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (lead_id) REFERENCES lead(id),
    FOREIGN KEY (sequence_id) REFERENCES "sequence"(id),
    FOREIGN KEY (sequence_subscription_id) REFERENCES bulk_sequence_subscription(id),
    FOREIGN KEY (transferred_from_user_id) REFERENCES users(id),
    FOREIGN KEY (transferred_to_user_id) REFERENCES users(id),
    FOREIGN KEY (updated_by) REFERENCES users(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE integration_link (
    id text,
    created_by text,
    updated_by text,
    date_created text,
    date_updated text,
    "name" text,
    organization_id text,
    "type" text,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (updated_by) REFERENCES users(id)
);

CREATE TABLE email_template (
    id text,
    created_by text,
    updated_by text,
    attachments jsonb,
    body text,
    date_created text,
    date_updated text,
    is_archived text,
    is_shared text,
    "name" text,
    organization_id text,
    subject text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (updated_by) REFERENCES users(id)
);

CREATE TABLE custom_activity_field (
    id text,
    custom_activity_id text,
    accepts_multiple_values text,
    back_reference_is_visible text,
    converting_to_type text,
    description text,
    editable_with_roles jsonb,
    is_shared text,
    "name" text,
    referenced_custom_type_id text,
    required text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (custom_activity_id) REFERENCES custom_activity(id)
);

CREATE TABLE custom_activity (
    id text,
    created_by text,
    updated_by text,
    api_create_only text,
    date_created text,
    date_updated text,
    description text,
    editable_with_roles jsonb,
    "name" text,
    organization_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (updated_by) REFERENCES users(id)
);

CREATE TABLE connected_account_identity (
    email text,
    connected_account_id text,
    "name" text,
    PRIMARY KEY (email, connected_account_id),
    FOREIGN KEY (connected_account_id) REFERENCES connected_account(id)
);

CREATE TABLE connected_account (
    id text,
    user_id text,
    imap text,
    organization_id text,
    smtp_host text,
    smtp_port text,
    smtp_use_ssl text,
    smtp_username text,
    synced_calendars jsonb,
    "type" text,
    PRIMARY KEY (id, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE "role" (
    id text,
    date_created text,
    date_updated text,
    editable text,
    "name" text,
    organization_id text,
    permission jsonb,
    PRIMARY KEY (id)
);

CREATE TABLE email_activity_attachment (
    _fivetran_id text,
    email_activity_id text,
    content_type text,
    filename text,
    "size" text,
    url text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (email_activity_id) REFERENCES email_activity(id)
);

CREATE TABLE email_activity_to (
    receiver text,
    email_activity_id text,
    PRIMARY KEY (receiver, email_activity_id),
    FOREIGN KEY (email_activity_id) REFERENCES email_activity(id)
);

CREATE TABLE email_body_text (
    _fivetran_id text,
    email_activity_id text,
    expand text,
    text text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (email_activity_id) REFERENCES email_activity(id)
);

CREATE TABLE email_envelope_sender (
    email text,
    email_activity_id text,
    "name" text,
    PRIMARY KEY (email, email_activity_id),
    FOREIGN KEY (email_activity_id) REFERENCES email_activity(id)
);

CREATE TABLE email_envelope_to (
    email text,
    email_activity_id text,
    "name" text,
    PRIMARY KEY (email, email_activity_id),
    FOREIGN KEY (email_activity_id) REFERENCES email_activity(id)
);

CREATE TABLE email_envelope_from (
    email text,
    email_activity_id text,
    "name" text,
    PRIMARY KEY (email, email_activity_id),
    FOREIGN KEY (email_activity_id) REFERENCES email_activity(id)
);

CREATE TABLE email_activity (
    id text,
    contact_id text,
    created_by text,
    followup_sequence_id text,
    lead_id text,
    sequence_id text,
    sequence_subscription_id text,
    template_id text,
    thread_id text,
    updated_by text,
    user_id text,
    activity_at text,
    attachments jsonb,
    bcc jsonb,
    bulk_email_action_id text,
    cc jsonb,
    date_created text,
    date_scheduled text,
    date_sent text,
    date_updated text,
    direction text,
    email_account_id text,
    envelope_bcc jsonb,
    envelope_cc jsonb,
    envelope_date text,
    envelope_in_reply_to text,
    envelope_is_autoreply text,
    envelope_message_id text,
    envelope_subject text,
    followup_sequence_delay text,
    has_reply text,
    in_reply_to_id text,
    message_ids jsonb,
    need_smtp_credentials text,
    opens jsonb,
    opens_summary text,
    organization_id text,
    reference jsonb,
    send_as_id text,
    send_attempts jsonb,
    sender text,
    "status" text,
    subject text,
    "type" text,
    users jsonb,
    PRIMARY KEY (id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (followup_sequence_id) REFERENCES "sequence"(id),
    FOREIGN KEY (lead_id) REFERENCES lead(id),
    FOREIGN KEY (sequence_id) REFERENCES "sequence"(id),
    FOREIGN KEY (sequence_subscription_id) REFERENCES bulk_sequence_subscription(id),
    FOREIGN KEY (template_id) REFERENCES email_template(id),
    FOREIGN KEY (thread_id) REFERENCES email_thread_activity(id),
    FOREIGN KEY (updated_by) REFERENCES users(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE note_activity (
    id text,
    contact_id text,
    created_by text,
    lead_id text,
    updated_by text,
    user_id text,
    activity_at text,
    attachment jsonb,
    date_created text,
    date_updated text,
    note text,
    note_mention jsonb,
    organization_id text,
    "type" text,
    user_name text,
    users jsonb,
    PRIMARY KEY (id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (lead_id) REFERENCES lead(id),
    FOREIGN KEY (updated_by) REFERENCES users(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE sequence_step (
    id text,
    created_by_id text,
    email_template_id text,
    sequence_id text,
    updated_by_id text,
    date_created text,
    date_updated text,
    delay text,
    required text,
    step_allowed_delay text,
    step_type text,
    threading text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_id) REFERENCES users(id),
    FOREIGN KEY (email_template_id) REFERENCES email_template(id),
    FOREIGN KEY (sequence_id) REFERENCES "sequence"(id),
    FOREIGN KEY (updated_by_id) REFERENCES users(id)
);

CREATE TABLE "sequence" (
    id text,
    created_by_id text,
    updated_by_id text,
    date_created text,
    date_updated text,
    "name" text,
    organization_id text,
    schedule_id text,
    "status" text,
    timezone text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_id) REFERENCES users(id),
    FOREIGN KEY (updated_by_id) REFERENCES users(id)
);

CREATE TABLE opportunity_custom_field (
    id text,
    created_by text,
    updated_by text,
    accepts_multiple_values text,
    choices jsonb,
    date_created text,
    date_updated text,
    description text,
    editable_with_roles jsonb,
    "name" text,
    organization_id text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (updated_by) REFERENCES users(id)
);

CREATE TABLE pipline_status (
    id text,
    pipeline_id text,
    label text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES opportunity_status(id),
    FOREIGN KEY (pipeline_id) REFERENCES pipeline(id)
);

CREATE TABLE pipeline (
    id text,
    created_by text,
    updated_by text,
    date_created text,
    date_updated text,
    "name" text,
    organization_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (updated_by) REFERENCES users(id)
);

CREATE TABLE custom_activity_instance (
    id text,
    contact_id text,
    created_by text,
    lead_id text,
    updated_by text,
    user_id text,
    activity_at text,
    custom_activity_type_id text,
    date_created text,
    date_updated text,
    organization_id text,
    "status" text,
    "type" text,
    user_name text,
    users jsonb,
    PRIMARY KEY (id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (lead_id) REFERENCES lead(id),
    FOREIGN KEY (updated_by) REFERENCES users(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE sms_attachment (
    "index" text,
    sms_activity_id text,
    content_type text,
    filename text,
    media_id text,
    "size" text,
    url text,
    PRIMARY KEY ("index", sms_activity_id),
    FOREIGN KEY (sms_activity_id) REFERENCES sms_activity(id)
);

CREATE TABLE sms_activity (
    id text,
    contact_id text,
    created_by text,
    lead_id text,
    updated_by text,
    user_id text,
    cost text,
    date_created text,
    date_sent text,
    date_updated text,
    direction text,
    local_country_iso text,
    local_phone text,
    organization_id text,
    remote_country_iso text,
    remote_phone text,
    remote_phone_formatted text,
    "status" text,
    text text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (lead_id) REFERENCES lead(id),
    FOREIGN KEY (updated_by) REFERENCES users(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE meeting_attendee (
    "index" text,
    meeting_activity_id text,
    contact_id text,
    user_id text,
    is_organizer text,
    "status" text,
    PRIMARY KEY ("index", meeting_activity_id),
    FOREIGN KEY (meeting_activity_id) REFERENCES meeting_activity(id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE meeting_activity (
    id text,
    connected_account_id text,
    contact_id text,
    created_by text,
    lead_id text,
    updated_by text,
    user_id text,
    calendar_event_link text,
    date_created text,
    date_updated text,
    duration text,
    ends_at text,
    is_recurring text,
    location text,
    note text,
    organization_id text,
    "source" text,
    starts_at text,
    "status" text,
    title text,
    users jsonb,
    PRIMARY KEY (id),
    FOREIGN KEY (connected_account_id) REFERENCES connected_account(id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (lead_id) REFERENCES lead(id),
    FOREIGN KEY (updated_by) REFERENCES users(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE opportunity_status (
    id text,
    pipeline_id text,
    label text,
    organization_id text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (pipeline_id) REFERENCES pipeline(id)
);

CREATE TABLE contact_custom_field (
    id text,
    created_by text,
    updated_by text,
    accepts_multiple_values text,
    choices jsonb,
    date_created text,
    date_updated text,
    description text,
    editable_with_roles jsonb,
    "name" text,
    organization_id text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (updated_by) REFERENCES users(id)
);

CREATE TABLE task_completed_activity (
    id text,
    created_by text,
    lead_id text,
    task_id text,
    updated_by text,
    user_id text,
    date_created text,
    date_updated text,
    organization_id text,
    task_text text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (lead_id) REFERENCES lead(id),
    FOREIGN KEY (task_id) REFERENCES task(id),
    FOREIGN KEY (updated_by) REFERENCES users(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE created_activity (
    id text,
    contact_id text,
    created_by text,
    lead_id text,
    updated_by text,
    user_id text,
    activity_at text,
    date_created text,
    date_updated text,
    import_id text,
    organization_id text,
    "source" text,
    users jsonb,
    PRIMARY KEY (id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (lead_id) REFERENCES lead(id),
    FOREIGN KEY (updated_by) REFERENCES users(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE bulk_delete (
    id text,
    created_by text,
    updated_by text,
    date_created text,
    date_updated text,
    n_leads text,
    n_leads_processed text,
    organization_id text,
    query text,
    send_done_email text,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (updated_by) REFERENCES users(id)
);

CREATE TABLE shared_association (
    object_type text,
    shared_custom_field_id text,
    custom_activity_type_id text,
    editable_with_roles jsonb,
    required text,
    PRIMARY KEY (object_type),
    FOREIGN KEY (shared_custom_field_id) REFERENCES shared_custom_field(id)
);

CREATE TABLE shared_custom_field (
    id text,
    created_by text,
    updated_by text,
    accepts_multiple_values text,
    choices jsonb,
    date_created text,
    date_updated text,
    description text,
    editable_with_roles jsonb,
    "name" text,
    organization_id text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (updated_by) REFERENCES users(id)
);

CREATE TABLE opportunity (
    id text,
    contact_id text,
    created_by text,
    lead_id text,
    status_id text,
    updated_by text,
    user_id text,
    annualized_expected_value text,
    annualized_value text,
    confidence text,
    date_created text,
    date_lost text,
    date_updated timestamp,
    date_won text,
    expected_value text,
    integration_links jsonb,
    note text,
    organization_id text,
    status_display_name text,
    "value" text,
    value_currency text,
    value_formatted text,
    value_period text,
    PRIMARY KEY (id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (lead_id) REFERENCES lead(id),
    FOREIGN KEY (status_id) REFERENCES opportunity_status(id),
    FOREIGN KEY (updated_by) REFERENCES users(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE lead_address (
    _fivetran_id text,
    lead_id text,
    address_1 text,
    address_2 text,
    city text,
    country text,
    label text,
    "state" text,
    zipcode text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (lead_id) REFERENCES lead(id)
);

CREATE TABLE lead (
    id text,
    created_by text,
    first_communication_user_id text,
    last_activity_user_id text,
    last_communication_user_id text,
    next_task_user_id text,
    primary_opportunity_pipeline_id text,
    primary_opportunity_status text,
    primary_opportunity_user_id text,
    status_id text,
    updated_by text,
    active_opportunity_value_summary text,
    contacts_summary text,
    date_created text,
    date_updated text,
    description text,
    display_name text,
    first_call_created text,
    first_call_note text,
    first_communication_date text,
    first_communication_summary text,
    first_communication_type text,
    first_source text,
    html_url text,
    integration_links jsonb,
    last_activity_date text,
    last_activity_type text,
    last_call_created text,
    last_call_duration text,
    last_call_note text,
    last_communication_date text,
    last_communication_summary text,
    last_communication_type text,
    last_email_date text,
    last_email_subject text,
    last_incoming_email_date text,
    last_lead_status_change_date text,
    last_note_created text,
    last_outgoing_call_date text,
    local_time text,
    "name" text,
    next_task_date text,
    next_task_due_date text,
    next_task_text text,
    organization_id text,
    primary_address_summary text,
    primary_email text,
    primary_email_type text,
    primary_phone text,
    primary_phone_country text,
    primary_phone_formatted text,
    primary_phone_type text,
    times_communicated text,
    url text,
    won_opportunity_value_summary text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (first_communication_user_id) REFERENCES users(id),
    FOREIGN KEY (last_activity_user_id) REFERENCES users(id),
    FOREIGN KEY (last_communication_user_id) REFERENCES users(id),
    FOREIGN KEY (next_task_user_id) REFERENCES users(id),
    FOREIGN KEY (primary_opportunity_pipeline_id) REFERENCES pipeline(id),
    FOREIGN KEY (primary_opportunity_status) REFERENCES opportunity_status(id),
    FOREIGN KEY (primary_opportunity_user_id) REFERENCES users(id),
    FOREIGN KEY (status_id) REFERENCES lead_status(id),
    FOREIGN KEY (updated_by) REFERENCES users(id)
);
