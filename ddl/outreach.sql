CREATE TABLE account (
    id bigint,
    relationship_creator_id bigint,
    relationship_owner_id bigint,
    relationship_updater_id bigint,
    buyer_intent_score text,
    company_type text,
    created_at timestamp,
    custom_id text,
    description text,
    domain text,
    external_source text,
    followers integer,
    founded_at timestamp,
    industry text,
    linked_in_employees integer,
    linked_in_url text,
    locality text,
    "name" text,
    named boolean,
    natural_name text,
    number_of_employees integer,
    sharing_team_id text,
    touched_at timestamp,
    "type" text,
    updated_at timestamp,
    website_url text,
    PRIMARY KEY (id),
    FOREIGN KEY (relationship_creator_id) REFERENCES users(id),
    FOREIGN KEY (relationship_owner_id) REFERENCES users(id),
    FOREIGN KEY (relationship_updater_id) REFERENCES users(id)
);

CREATE TABLE template_cc_recipient (
    email text,
    template_id bigint,
    PRIMARY KEY (email, template_id),
    FOREIGN KEY (template_id) REFERENCES template(id)
);

CREATE TABLE active_step_task (
    sequence_state_id bigint,
    task_id bigint,
    PRIMARY KEY (sequence_state_id, task_id),
    FOREIGN KEY (sequence_state_id) REFERENCES sequence_state(id),
    FOREIGN KEY (task_id) REFERENCES task(id)
);

CREATE TABLE recipient (
    id bigint,
    created_at timestamp,
    email_hash text,
    recipient_type text,
    "type" text,
    updated_at timestamp,
    "value" text,
    PRIMARY KEY (id)
);

CREATE TABLE email_address (
    id bigint,
    relationship_prospect_id bigint,
    created_at timestamp,
    email text,
    email_type text,
    "order" integer,
    "status" text,
    status_changed_at timestamp,
    "type" text,
    unsubscribed_at timestamp,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (relationship_prospect_id) REFERENCES prospect(id)
);

CREATE TABLE duty (
    id bigint,
    duty_type text,
    symbolic_name text,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE users (
    id bigint,
    relationship_creator_id bigint,
    relationship_mailbox_id bigint,
    relationship_profile_id bigint,
    relationship_role_id bigint,
    relationship_updater_id bigint,
    accounts_view_id integer,
    activity_notifications_disabled boolean,
    bounce_warning_email_enabled boolean,
    bridge_phone text,
    bridge_phone_extension text,
    calls_view_id integer,
    controlled_tab_default text,
    created_at timestamp,
    current_sign_in_at timestamp,
    daily_digest_email_enabled boolean,
    default_ruleset_id integer,
    email text,
    enable_voice_recordings boolean,
    first_name text,
    inbound_bridge_phone text,
    inbound_bridge_phone_extension text,
    inbound_call_behavior text,
    inbound_phone_type text,
    inbound_voicemail_custom_message_text text,
    inbound_voicemail_message_text_voice text,
    inbound_voicemail_prompt_type text,
    kaia_recordings_view_id integer,
    keep_bridge_phone_connected boolean,
    last_name text,
    last_sign_in_at timestamp,
    locked boolean,
    mailbox_error_email_enabled boolean,
    meeting_engagement_notification_enabled boolean,
    "name" text,
    notifications_enabled boolean,
    oce_click_to_dial_everywhere boolean,
    oce_gmail_toolbar boolean,
    oce_gmail_tracking_state text,
    oce_salesforce_email_decorating boolean,
    oce_salesforce_phone_decorating boolean,
    oce_salesforce_phoned_decorating boolean,
    oce_universal_task_flow boolean,
    oce_window_mode boolean,
    opportunities_view_id integer,
    password_expires_at timestamp,
    phone_country_code text,
    phone_number text,
    phone_type text,
    plugin_alert_notification_enabled boolean,
    preferred_voice_region text,
    prefers_local_presence boolean,
    primary_timezone text,
    prospects_view_id integer,
    reports_team_perf_view_id integer,
    reports_view_id integer,
    scim_external_id text,
    scim_source text,
    secondary_timezone text,
    sender_notifications_excluded boolean,
    tasks_view_id integer,
    teams_view_id integer,
    tertiary_timezone text,
    texting_email_notifications boolean,
    title text,
    "type" text,
    unknown_reply_email_enabled boolean,
    updated_at timestamp,
    user_guid text,
    username text,
    users_view_id integer,
    voicemail_notification_enabled boolean,
    weekly_digest_email_enabled boolean,
    PRIMARY KEY (id),
    FOREIGN KEY (relationship_creator_id) REFERENCES users(id),
    FOREIGN KEY (relationship_mailbox_id) REFERENCES mailbox(id),
    FOREIGN KEY (relationship_profile_id) REFERENCES profile(id),
    FOREIGN KEY (relationship_role_id) REFERENCES "role"(id),
    FOREIGN KEY (relationship_updater_id) REFERENCES users(id)
);

CREATE TABLE mailing (
    id bigint,
    relationship_follow_up_sequence_id bigint,
    relationship_mailbox_id bigint,
    relationship_opportunity_id bigint,
    relationship_prospect_id bigint,
    relationship_sequence_id bigint,
    relationship_sequence_state_id bigint,
    relationship_sequence_step_id bigint,
    relationship_task_id bigint,
    relationship_template_id bigint,
    relationship_user_id bigint,
    body_html text,
    bounced_at timestamp,
    click_count integer,
    clicked_at timestamp,
    created_at timestamp,
    delivered_at timestamp,
    error_backtrace text,
    error_reason text,
    follow_up_task_scheduled_at timestamp,
    follow_up_task_type text,
    mailbox_address text,
    mailing_type text,
    marked_as_spam_at timestamp,
    message_id text,
    notify_thread_condition text,
    notify_thread_scheduled_at timestamp,
    notify_thread_status text,
    open_count integer,
    opened_at timestamp,
    override_safety_settings boolean,
    replied_at timestamp,
    retry_at timestamp,
    retry_count integer,
    retry_interval integer,
    scheduled_at timestamp,
    "state" text,
    state_changed_at timestamp,
    subject text,
    track_links boolean,
    track_opens boolean,
    "type" text,
    unsubscribed_at timestamp,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (relationship_follow_up_sequence_id) REFERENCES "sequence"(id),
    FOREIGN KEY (relationship_mailbox_id) REFERENCES mailbox(id),
    FOREIGN KEY (relationship_opportunity_id) REFERENCES opportunity(id),
    FOREIGN KEY (relationship_prospect_id) REFERENCES prospect(id),
    FOREIGN KEY (relationship_sequence_id) REFERENCES "sequence"(id),
    FOREIGN KEY (relationship_sequence_state_id) REFERENCES sequence_state(id),
    FOREIGN KEY (relationship_sequence_step_id) REFERENCES sequence_step(id),
    FOREIGN KEY (relationship_task_id) REFERENCES task(id),
    FOREIGN KEY (relationship_template_id) REFERENCES template(id),
    FOREIGN KEY (relationship_user_id) REFERENCES users(id)
);

CREATE TABLE template_tag (
    tag_name text,
    template_id bigint,
    PRIMARY KEY (tag_name, template_id),
    FOREIGN KEY (template_id) REFERENCES template(id)
);

CREATE TABLE prospect (
    id bigint,
    relationship_account_id bigint,
    relationship_creator_id bigint,
    relationship_owner_id bigint,
    relationship_persona_id bigint,
    relationship_stage_id bigint,
    relationship_updater_id bigint,
    added_at timestamp,
    address_city text,
    address_country text,
    address_state text,
    address_street text,
    address_street_2 text,
    address_zip text,
    angel_list_url text,
    available_at timestamp,
    call_opted_out boolean,
    calls_opt_status text,
    calls_opted_at timestamp,
    campaign_name text,
    click_count integer,
    company text,
    created_at timestamp,
    date_of_birth timestamp,
    degree text,
    email_opted_out boolean,
    emails_opt_status text,
    emails_opted_at timestamp,
    engaged_at timestamp,
    engaged_score text,
    event_name text,
    external_id text,
    external_owner text,
    external_source text,
    facebook_url text,
    first_name text,
    gender text,
    github_url text,
    github_username text,
    google_plus_url text,
    graduation_date timestamp,
    job_start_date timestamp,
    last_name text,
    linked_in_connections integer,
    linked_in_employees integer,
    linked_in_id text,
    linked_in_slug text,
    linked_in_url text,
    middle_name text,
    "name" text,
    nickname text,
    occupation text,
    open_count integer,
    opted_out boolean,
    opted_out_at timestamp,
    personal_note_1 text,
    personal_note_2 text,
    preferred_contact text,
    quora_url text,
    region text,
    reply_count integer,
    school text,
    score text,
    sharing_team_id text,
    "source" text,
    specialties text,
    stack_overflow_id text,
    stack_overflow_url text,
    time_zone text,
    time_zone_iana text,
    time_zone_inferred text,
    title text,
    touched_at timestamp,
    trashed_at timestamp,
    twitter_url text,
    twitter_username text,
    "type" text,
    updated_at timestamp,
    website_url_1 text,
    website_url_2 text,
    website_url_3 text,
    PRIMARY KEY (id),
    FOREIGN KEY (relationship_account_id) REFERENCES account(id),
    FOREIGN KEY (relationship_creator_id) REFERENCES users(id),
    FOREIGN KEY (relationship_owner_id) REFERENCES users(id),
    FOREIGN KEY (relationship_persona_id) REFERENCES persona(id),
    FOREIGN KEY (relationship_stage_id) REFERENCES stage(id),
    FOREIGN KEY (relationship_updater_id) REFERENCES users(id)
);

CREATE TABLE data_connection (
    id text,
    parent_id bigint,
    parent_type text,
    "type" text,
    connection text,
    url text,
    PRIMARY KEY (id, parent_id, parent_type, "type")
);

CREATE TABLE prospect_work_phone (
    phone_number text,
    prospect_id bigint,
    PRIMARY KEY (phone_number, prospect_id),
    FOREIGN KEY (prospect_id) REFERENCES prospect(id)
);

CREATE TABLE sequence_state (
    id bigint,
    relationship_account_id bigint,
    relationship_creator_id bigint,
    relationship_mailbox_id bigint,
    relationship_opportunity_id bigint,
    relationship_prospect_id bigint,
    relationship_sequence_id bigint,
    relationship_sequence_step_id bigint,
    active_at timestamp,
    bounce_count integer,
    call_completed_at timestamp,
    click_count integer,
    created_at timestamp,
    deliver_count integer,
    error_reason text,
    failure_count integer,
    negative_reply_count integer,
    neutral_reply_count integer,
    open_count integer,
    opt_out_count integer,
    pause_reason text,
    positive_reply_count integer,
    replied_at timestamp,
    reply_count integer,
    schedule_count integer,
    "state" text,
    state_changed_at timestamp,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (relationship_account_id) REFERENCES account(id),
    FOREIGN KEY (relationship_creator_id) REFERENCES users(id),
    FOREIGN KEY (relationship_mailbox_id) REFERENCES mailbox(id),
    FOREIGN KEY (relationship_opportunity_id) REFERENCES opportunity(id),
    FOREIGN KEY (relationship_prospect_id) REFERENCES prospect(id),
    FOREIGN KEY (relationship_sequence_id) REFERENCES "sequence"(id),
    FOREIGN KEY (relationship_sequence_step_id) REFERENCES sequence_step(id)
);

CREATE TABLE sequence_step (
    id bigint,
    relationship_call_purpose_id bigint,
    relationship_creator_id bigint,
    relationship_sequence_id bigint,
    relationship_task_priority_id bigint,
    relationship_updater_id bigint,
    bounce_count integer,
    click_count integer,
    created_at timestamp,
    "date" timestamp,
    deliver_count integer,
    display_name text,
    failure_count integer,
    "interval" integer,
    negative_reply_count integer,
    neutral_reply_count integer,
    open_count integer,
    opt_out_count integer,
    "order" integer,
    positive_reply_count integer,
    reply_count integer,
    schedule_count integer,
    step_type text,
    task_autoskip_delay integer,
    task_note text,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (relationship_call_purpose_id) REFERENCES call_purpose(id),
    FOREIGN KEY (relationship_creator_id) REFERENCES users(id),
    FOREIGN KEY (relationship_sequence_id) REFERENCES "sequence"(id),
    FOREIGN KEY (relationship_task_priority_id) REFERENCES task_priority(id),
    FOREIGN KEY (relationship_updater_id) REFERENCES users(id)
);

CREATE TABLE prospect_email (
    email text,
    prospect_id bigint,
    PRIMARY KEY (email, prospect_id),
    FOREIGN KEY (prospect_id) REFERENCES prospect(id)
);

CREATE TABLE task_priority (
    id bigint,
    color bigint,
    created_at timestamp,
    "name" text,
    "type" text,
    updated_at timestamp,
    weight integer,
    PRIMARY KEY (id)
);

CREATE TABLE template_to_recipient (
    email text,
    template_id bigint,
    PRIMARY KEY (email, template_id),
    FOREIGN KEY (template_id) REFERENCES template(id)
);

CREATE TABLE account_tag (
    tag_name text,
    account_id bigint,
    PRIMARY KEY (tag_name, account_id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE sequence_template (
    id bigint,
    relationship_creator_id bigint,
    relationship_sequence_step_id bigint,
    relationship_template_id bigint,
    relationship_updater_id bigint,
    bounce_count integer,
    click_count integer,
    created_at timestamp,
    deliver_count integer,
    enabled boolean,
    enabled_at timestamp,
    failure_count integer,
    is_reply boolean,
    negative_reply_count integer,
    neutral_reply_count integer,
    open_count integer,
    opt_out_count integer,
    positive_reply_count integer,
    reply_count integer,
    schedule_count integer,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (relationship_creator_id) REFERENCES users(id),
    FOREIGN KEY (relationship_sequence_step_id) REFERENCES sequence_step(id),
    FOREIGN KEY (relationship_template_id) REFERENCES template(id),
    FOREIGN KEY (relationship_updater_id) REFERENCES users(id)
);

CREATE TABLE mailing_recipient (
    mailing_id bigint,
    recipient_id bigint,
    PRIMARY KEY (mailing_id, recipient_id),
    FOREIGN KEY (mailing_id) REFERENCES mailing(id),
    FOREIGN KEY (recipient_id) REFERENCES recipient(id)
);

CREATE TABLE user_duty (
    id bigint,
    user_id bigint,
    duty_type text,
    "name" text,
    PRIMARY KEY (id, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE user_email_recipients (
    recipient_id bigint,
    user_id bigint,
    PRIMARY KEY (recipient_id, user_id),
    FOREIGN KEY (recipient_id) REFERENCES recipient(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE user_team (
    team_id bigint,
    user_id bigint,
    PRIMARY KEY (team_id, user_id),
    FOREIGN KEY (team_id) REFERENCES team(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE template_bcc_recipient (
    email text,
    template_id bigint,
    PRIMARY KEY (email, template_id),
    FOREIGN KEY (template_id) REFERENCES template(id)
);

CREATE TABLE sequence_tag (
    tag_name text,
    sequence_id bigint,
    PRIMARY KEY (tag_name, sequence_id),
    FOREIGN KEY (sequence_id) REFERENCES "sequence"(id)
);

CREATE TABLE compliance_request (
    id bigint,
    relationship_requester_id bigint,
    batch_compliance_request_uuid text,
    created_at timestamp,
    object_type text,
    pii jsonb,
    request_object_id text,
    request_type text,
    requester_id integer,
    "state" text,
    "type" text,
    updated_at timestamp,
    uuid text,
    PRIMARY KEY (id),
    FOREIGN KEY (relationship_requester_id) REFERENCES users(id)
);

CREATE TABLE call_purpose (
    id bigint,
    relationship_creator_id bigint,
    created_at timestamp,
    "name" text,
    "order" integer,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (relationship_creator_id) REFERENCES users(id)
);

CREATE TABLE prospect_voip_phone (
    phone_number text,
    prospect_id bigint,
    PRIMARY KEY (phone_number, prospect_id),
    FOREIGN KEY (prospect_id) REFERENCES prospect(id)
);

CREATE TABLE ruleset (
    id bigint,
    relationship_bounced_stage_id bigint,
    relationship_call_task_priority_from_clicks_id bigint,
    relationship_call_task_priority_from_opens_id bigint,
    relationship_call_task_priority_id bigint,
    relationship_completed_stage_id bigint,
    relationship_delivered_stage_id bigint,
    relationship_finished_stage_id bigint,
    relationship_opted_out_stage_id bigint,
    relationship_owner_id bigint,
    relationship_replied_stage_id bigint,
    relationship_started_stage_id bigint,
    apply_completed_stage_in integer,
    auto_resume_ooto_prospects boolean,
    auto_resume_ooto_prospects_expires_in integer,
    auto_resume_ooto_prospects_in integer,
    call_opt_out_action text,
    clicks_needed_before_call_task_created integer,
    created_at timestamp,
    email_opt_out_action text,
    include_unsubscribe_links boolean,
    meeting_booked_action text,
    minimum_prospect_touched_interval integer,
    "name" text,
    ooto_auto_extraction_enabled boolean,
    opens_needed_before_call_task_created integer,
    permit_duplicate_prospects text,
    sequence_exclusivity text,
    sms_opt_out_action text,
    sms_received_action text,
    step_overrides_enabled boolean,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (relationship_bounced_stage_id) REFERENCES stage(id),
    FOREIGN KEY (relationship_call_task_priority_from_clicks_id) REFERENCES task_priority(id),
    FOREIGN KEY (relationship_call_task_priority_from_opens_id) REFERENCES task_priority(id),
    FOREIGN KEY (relationship_call_task_priority_id) REFERENCES task_priority(id),
    FOREIGN KEY (relationship_completed_stage_id) REFERENCES stage(id),
    FOREIGN KEY (relationship_delivered_stage_id) REFERENCES stage(id),
    FOREIGN KEY (relationship_finished_stage_id) REFERENCES stage(id),
    FOREIGN KEY (relationship_opted_out_stage_id) REFERENCES stage(id),
    FOREIGN KEY (relationship_owner_id) REFERENCES users(id),
    FOREIGN KEY (relationship_replied_stage_id) REFERENCES stage(id),
    FOREIGN KEY (relationship_started_stage_id) REFERENCES stage(id)
);

CREATE TABLE profile (
    id bigint,
    created_at timestamp,
    is_admin boolean,
    "name" text,
    special_id text,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE content_category_membership (
    id bigint,
    relationship_content_category_id bigint,
    relationship_creator_id bigint,
    created_at timestamp,
    relationship_content_id bigint,
    relationship_content_type text,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (relationship_content_category_id) REFERENCES content_category(id),
    FOREIGN KEY (relationship_creator_id) REFERENCES users(id)
);

CREATE TABLE phone_number (
    id bigint,
    relationship_prospect_id bigint,
    country_code text,
    created_at timestamp,
    extension text,
    number text,
    "order" bigint,
    phone_type text,
    raw_number text,
    "status" text,
    status_changed_at timestamp,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (relationship_prospect_id) REFERENCES prospect(id)
);

CREATE TABLE mailbox (
    id bigint,
    relationship_creator_id bigint,
    relationship_updater_id bigint,
    relationship_user_id bigint,
    auth_id integer,
    created_at timestamp,
    editable boolean,
    email text,
    email_hash text,
    email_provider text,
    email_signature text,
    ews_endpoint text,
    ews_ssl_verify_mode integer,
    exchange_version text,
    imap_host text,
    imap_port integer,
    imap_ssl boolean,
    max_emails_per_day integer,
    max_mailings_per_day integer,
    max_mailings_per_week integer,
    opt_out_message text,
    opt_out_signature text,
    password text,
    prospect_email_exclusions text,
    provider_id integer,
    provider_type text,
    send_disabled boolean,
    send_errored_at timestamp,
    send_max_retries integer,
    send_method text,
    send_period integer,
    send_requires_sync boolean,
    send_success_at timestamp,
    send_threshold integer,
    sendgrid_api_key text,
    sendgrid_webhook_url text,
    smtp_host text,
    smtp_password text,
    smtp_port integer,
    smtp_ssl boolean,
    smtp_username text,
    sync_active_frequency integer,
    sync_disabled boolean,
    sync_errored_at timestamp,
    sync_finished_at timestamp,
    sync_method text,
    sync_outreach_folder boolean,
    sync_passive_frequency integer,
    sync_success_at timestamp,
    "type" text,
    updated_at timestamp,
    user_id integer,
    username text,
    validate_send boolean,
    validate_sync boolean,
    PRIMARY KEY (id),
    FOREIGN KEY (relationship_creator_id) REFERENCES users(id),
    FOREIGN KEY (relationship_updater_id) REFERENCES users(id),
    FOREIGN KEY (relationship_user_id) REFERENCES users(id)
);

CREATE TABLE "sequence" (
    id bigint,
    relationship_creator_id bigint,
    relationship_owner_id bigint,
    relationship_ruleset_id bigint,
    relationship_updater_id bigint,
    automation_percentage double precision,
    bounce_count integer,
    click_count integer,
    created_at timestamp,
    deliver_count integer,
    description text,
    duration_in_days integer,
    enabled boolean,
    enabled_at timestamp,
    failure_count integer,
    finish_on_reply boolean,
    last_used_at timestamp,
    locked boolean,
    locked_at timestamp,
    max_activations integer,
    "name" text,
    negative_reply_count integer,
    neutral_reply_count integer,
    num_contacted_prospects integer,
    num_replied_prospects integer,
    open_count integer,
    opt_out_count integer,
    positive_reply_count integer,
    primary_reply_action text,
    primary_reply_pause_duration integer,
    reply_count integer,
    schedule_count integer,
    schedule_interval_type text,
    secondary_reply_action text,
    secondary_reply_pause_duration integer,
    sequence_step_count integer,
    sequence_type text,
    share_type text,
    throttle_capacity integer,
    throttle_max_adds_per_day integer,
    throttle_paused boolean,
    throttle_paused_at timestamp,
    transactional boolean,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (relationship_creator_id) REFERENCES users(id),
    FOREIGN KEY (relationship_owner_id) REFERENCES users(id),
    FOREIGN KEY (relationship_ruleset_id) REFERENCES ruleset(id),
    FOREIGN KEY (relationship_updater_id) REFERENCES users(id)
);

CREATE TABLE content_category (
    id bigint,
    relationship_creator_id bigint,
    allow_sequences boolean,
    allow_snippets boolean,
    allow_templates boolean,
    color text,
    created_at timestamp,
    "name" text,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (relationship_creator_id) REFERENCES users(id)
);

CREATE TABLE persona (
    id bigint,
    created_at timestamp,
    description text,
    "name" text,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE prospect_mobile_phone (
    phone_number text,
    prospect_id bigint,
    PRIMARY KEY (phone_number, prospect_id),
    FOREIGN KEY (prospect_id) REFERENCES prospect(id)
);

CREATE TABLE opportunity_prospect_role (
    id bigint,
    relationship_opportunity_id bigint,
    relationship_prospect_id bigint,
    created_at timestamp,
    "primary" boolean,
    "role" text,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (relationship_opportunity_id) REFERENCES opportunity(id),
    FOREIGN KEY (relationship_prospect_id) REFERENCES prospect(id)
);

CREATE TABLE stage (
    id bigint,
    relationship_creator_id bigint,
    relationship_updater_id bigint,
    color text,
    created_at timestamp,
    "name" text,
    "order" integer,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (relationship_creator_id) REFERENCES users(id),
    FOREIGN KEY (relationship_updater_id) REFERENCES users(id)
);

CREATE TABLE custom_field (
    id text,
    properties jsonb,
    "type" text
);

CREATE TABLE prospect_other_phone (
    phone_number text,
    prospect_id bigint,
    PRIMARY KEY (phone_number, prospect_id),
    FOREIGN KEY (prospect_id) REFERENCES prospect(id)
);

CREATE TABLE task (
    id bigint,
    relationship_account_id bigint,
    relationship_call_id bigint,
    relationship_completer_id bigint,
    relationship_creator_id bigint,
    relationship_mailing_id bigint,
    relationship_opportunity_id bigint,
    relationship_owner_id bigint,
    relationship_prospect_id bigint,
    relationship_sequence_id bigint,
    relationship_sequence_state_id bigint,
    relationship_sequence_step_id bigint,
    relationship_sequence_template_id bigint,
    relationship_task_priority_id bigint,
    relationship_template_id bigint,
    "action" text,
    added_at timestamp,
    compiled_sequence_template_html text,
    completed boolean,
    completed_at timestamp,
    created_at timestamp,
    due_at timestamp,
    note text,
    relationship_subject_id bigint,
    relationship_subject_type text,
    scheduled_at timestamp,
    "state" text,
    state_changed_at timestamp,
    task_type text,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (relationship_account_id) REFERENCES account(id),
    FOREIGN KEY (relationship_call_id) REFERENCES "call"(id),
    FOREIGN KEY (relationship_completer_id) REFERENCES users(id),
    FOREIGN KEY (relationship_creator_id) REFERENCES users(id),
    FOREIGN KEY (relationship_mailing_id) REFERENCES mailing(id),
    FOREIGN KEY (relationship_opportunity_id) REFERENCES opportunity(id),
    FOREIGN KEY (relationship_owner_id) REFERENCES users(id),
    FOREIGN KEY (relationship_prospect_id) REFERENCES prospect(id),
    FOREIGN KEY (relationship_sequence_id) REFERENCES "sequence"(id),
    FOREIGN KEY (relationship_sequence_state_id) REFERENCES sequence_state(id),
    FOREIGN KEY (relationship_sequence_step_id) REFERENCES sequence_step(id),
    FOREIGN KEY (relationship_sequence_template_id) REFERENCES sequence_template(id),
    FOREIGN KEY (relationship_task_priority_id) REFERENCES task_priority(id),
    FOREIGN KEY (relationship_template_id) REFERENCES template(id)
);

CREATE TABLE opportunity_stage (
    id bigint,
    relationship_creator_id bigint,
    color text,
    created_at timestamp,
    is_closed boolean,
    "name" text,
    "order" integer,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (relationship_creator_id) REFERENCES users(id)
);

CREATE TABLE prospect_home_phone (
    phone_number text,
    prospect_id bigint,
    PRIMARY KEY (phone_number, prospect_id),
    FOREIGN KEY (prospect_id) REFERENCES prospect(id)
);

CREATE TABLE snippet_tag (
    tag_name text,
    snippet_id bigint,
    PRIMARY KEY (tag_name, snippet_id),
    FOREIGN KEY (snippet_id) REFERENCES snippet(id)
);

CREATE TABLE call_disposition (
    id bigint,
    relationship_creator_id bigint,
    created_at timestamp,
    "name" text,
    "order" integer,
    outcome text,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (relationship_creator_id) REFERENCES users(id)
);

CREATE TABLE call_tag (
    tag_name text,
    call_id bigint,
    PRIMARY KEY (tag_name, call_id),
    FOREIGN KEY (call_id) REFERENCES "call"(id)
);

CREATE TABLE favorite (
    id bigint,
    relationship_creator_id bigint,
    relationship_user_id bigint,
    created_at timestamp,
    target_type text,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (relationship_creator_id) REFERENCES users(id),
    FOREIGN KEY (relationship_user_id) REFERENCES users(id)
);

CREATE TABLE "role" (
    id bigint,
    relationship_parent_role_id bigint,
    created_at timestamp,
    "name" text,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (relationship_parent_role_id) REFERENCES "role"(id)
);

CREATE TABLE mail_alias (
    id bigint,
    relationship_mailbox_id bigint,
    can_send boolean,
    created_at timestamp,
    email text,
    email_hash text,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (relationship_mailbox_id) REFERENCES mailbox(id)
);

CREATE TABLE template (
    id bigint,
    relationship_creator_id bigint,
    relationship_owner_id bigint,
    relationship_updater_id bigint,
    archived boolean,
    archived_at timestamp,
    body_html text,
    body_text text,
    bounce_count integer,
    click_count integer,
    created_at timestamp,
    deliver_count integer,
    failure_count integer,
    last_used_at timestamp,
    "name" text,
    negative_reply_count integer,
    neutral_reply_count integer,
    open_count integer,
    opt_out_count integer,
    positive_reply_count integer,
    reply_count integer,
    schedule_count integer,
    share_type text,
    subject text,
    track_links boolean,
    track_opens boolean,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (relationship_creator_id) REFERENCES users(id),
    FOREIGN KEY (relationship_owner_id) REFERENCES users(id),
    FOREIGN KEY (relationship_updater_id) REFERENCES users(id)
);

CREATE TABLE opportunity_tag (
    tag_name text,
    opportunity_id bigint,
    PRIMARY KEY (tag_name, opportunity_id),
    FOREIGN KEY (opportunity_id) REFERENCES opportunity(id)
);

CREATE TABLE event (
    id bigint,
    relationship_account_id bigint,
    relationship_call_id bigint,
    relationship_mailing_id bigint,
    relationship_opportunity_id bigint,
    relationship_prospect_id bigint,
    relationship_task_id bigint,
    relationship_user_id bigint,
    body text,
    created_at timestamp,
    event_at timestamp,
    external_url text,
    "name" text,
    payload jsonb,
    request_city text,
    request_device text,
    request_host text,
    request_proxied boolean,
    request_region text,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (relationship_account_id) REFERENCES account(id),
    FOREIGN KEY (relationship_call_id) REFERENCES "call"(id),
    FOREIGN KEY (relationship_mailing_id) REFERENCES mailing(id),
    FOREIGN KEY (relationship_opportunity_id) REFERENCES opportunity(id),
    FOREIGN KEY (relationship_prospect_id) REFERENCES prospect(id),
    FOREIGN KEY (relationship_task_id) REFERENCES task(id),
    FOREIGN KEY (relationship_user_id) REFERENCES users(id)
);

CREATE TABLE snippet (
    id bigint,
    relationship_creator_id bigint,
    relationship_owner_id bigint,
    relationship_updater_id bigint,
    body_html text,
    body_text text,
    created_at timestamp,
    "name" text,
    share_type text,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (relationship_creator_id) REFERENCES users(id),
    FOREIGN KEY (relationship_owner_id) REFERENCES users(id),
    FOREIGN KEY (relationship_updater_id) REFERENCES users(id)
);

CREATE TABLE content_category_ownership (
    id bigint,
    relationship_content_category_id bigint,
    relationship_creator_id bigint,
    relationship_owner_id bigint,
    created_at timestamp,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (relationship_content_category_id) REFERENCES content_category(id),
    FOREIGN KEY (relationship_creator_id) REFERENCES users(id),
    FOREIGN KEY (relationship_owner_id) REFERENCES users(id)
);

CREATE TABLE prospect_tag (
    tag_name text,
    prospect_id bigint,
    PRIMARY KEY (tag_name, prospect_id),
    FOREIGN KEY (prospect_id) REFERENCES prospect(id)
);

CREATE TABLE prospect_favorite (
    favorite_id bigint,
    prospect_id bigint,
    PRIMARY KEY (favorite_id, prospect_id),
    FOREIGN KEY (favorite_id) REFERENCES favorite(id),
    FOREIGN KEY (prospect_id) REFERENCES prospect(id)
);

CREATE TABLE "call" (
    id bigint,
    relationship_call_disposition_id bigint,
    relationship_call_purpose_id bigint,
    relationship_opportunity_id bigint,
    relationship_phone_number_id bigint,
    relationship_prospect_id bigint,
    relationship_sequence_id bigint,
    relationship_sequence_state_id bigint,
    relationship_sequence_step_id bigint,
    relationship_task_id bigint,
    relationship_user_id bigint,
    answered_at timestamp,
    completed_at timestamp,
    created_at timestamp,
    dialed_at timestamp,
    direction text,
    external_vendor text,
    "from" text,
    note text,
    outcome text,
    recording_url text,
    returned_at timestamp,
    sequence_action text,
    should_record_call boolean,
    "state" text,
    state_changed_at timestamp,
    "to" text,
    "type" text,
    uid text,
    updated_at timestamp,
    user_call_type text,
    vendor_call_id text,
    voicemail_recording_url text,
    PRIMARY KEY (id),
    FOREIGN KEY (relationship_call_disposition_id) REFERENCES call_disposition(id),
    FOREIGN KEY (relationship_call_purpose_id) REFERENCES call_purpose(id),
    FOREIGN KEY (relationship_opportunity_id) REFERENCES opportunity(id),
    FOREIGN KEY (relationship_phone_number_id) REFERENCES phone_number(id),
    FOREIGN KEY (relationship_prospect_id) REFERENCES prospect(id),
    FOREIGN KEY (relationship_sequence_id) REFERENCES "sequence"(id),
    FOREIGN KEY (relationship_sequence_state_id) REFERENCES sequence_state(id),
    FOREIGN KEY (relationship_sequence_step_id) REFERENCES sequence_step(id),
    FOREIGN KEY (relationship_task_id) REFERENCES task(id),
    FOREIGN KEY (relationship_user_id) REFERENCES users(id)
);

CREATE TABLE opportunity (
    id bigint,
    relationship_account_id bigint,
    relationship_creator_id bigint,
    relationship_opportunity_stage_id bigint,
    relationship_owner_id bigint,
    relationship_stage_id bigint,
    relationship_updater_id bigint,
    amount integer,
    close_date timestamp,
    created_at timestamp,
    currency_type text,
    description text,
    external_created_at timestamp,
    map_link text,
    map_next_steps text,
    map_status text,
    "name" text,
    next_step text,
    opportunity_type text,
    probability integer,
    prospecting_rep_id text,
    sharing_team_id text,
    touched_at timestamp,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (relationship_account_id) REFERENCES account(id),
    FOREIGN KEY (relationship_creator_id) REFERENCES users(id),
    FOREIGN KEY (relationship_opportunity_stage_id) REFERENCES opportunity_stage(id),
    FOREIGN KEY (relationship_owner_id) REFERENCES users(id),
    FOREIGN KEY (relationship_stage_id) REFERENCES stage(id),
    FOREIGN KEY (relationship_updater_id) REFERENCES users(id)
);

CREATE TABLE mailing_reference (
    reference text,
    mailing_id bigint,
    PRIMARY KEY (reference, mailing_id),
    FOREIGN KEY (mailing_id) REFERENCES mailing(id)
);

CREATE TABLE active_step_mailing (
    mailing_id bigint,
    sequence_state_id bigint,
    PRIMARY KEY (mailing_id, sequence_state_id),
    FOREIGN KEY (mailing_id) REFERENCES mailing(id),
    FOREIGN KEY (sequence_state_id) REFERENCES sequence_state(id)
);

CREATE TABLE team (
    id bigint,
    relationship_creator_id bigint,
    relationship_updater_id bigint,
    color text,
    created_at timestamp,
    "name" text,
    scim_external_id text,
    scim_source text,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (relationship_creator_id) REFERENCES users(id),
    FOREIGN KEY (relationship_updater_id) REFERENCES users(id)
);
