CREATE TABLE scorecard_question (
    question_id text,
    scorecard_id text,
    updater_user_id text,
    created text,
    is_overall boolean,
    question_revision_id text,
    question_text text,
    updated text,
    PRIMARY KEY (question_id),
    FOREIGN KEY (scorecard_id) REFERENCES scorecard(id),
    FOREIGN KEY (updater_user_id) REFERENCES users(id)
);

CREATE TABLE scorecard (
    id text,
    updater_user_id text,
    workspace_id text,
    created timestamp,
    enabled boolean,
    "name" text,
    updated timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (updater_user_id) REFERENCES users(id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id)
);

CREATE TABLE contact_entity_schema (
    "name" text,
    integration_id text,
    is_deleted boolean,
    label text,
    last_modified timestamp,
    reference_to text,
    "type" text,
    PRIMARY KEY ("name", integration_id),
    FOREIGN KEY (integration_id) REFERENCES crm(integration_id)
);

CREATE TABLE entity_value (
    entity text,
    "name" text,
    integration_id text,
    "value" text,
    PRIMARY KEY (entity, "name", integration_id),
    FOREIGN KEY (integration_id) REFERENCES crm(integration_id)
);

CREATE TABLE call_in_folder (
    call_id text,
    library_folder_id text,
    added_by text,
    created timestamp,
    note text,
    snippet_from_second integer,
    snippet_to_second integer,
    PRIMARY KEY (call_id, library_folder_id),
    FOREIGN KEY (call_id) REFERENCES "call"(id),
    FOREIGN KEY (library_folder_id) REFERENCES library_folder(id),
    FOREIGN KEY (added_by) REFERENCES users(id)
);

CREATE TABLE permission_call_access (
    permission_profile_id text,
    user_id text,
    PRIMARY KEY (permission_profile_id, user_id),
    FOREIGN KEY (permission_profile_id) REFERENCES permission_profile(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE permission_library_folder_access (
    permission_profile_id text,
    user_id text,
    PRIMARY KEY (permission_profile_id, user_id),
    FOREIGN KEY (permission_profile_id) REFERENCES permission_profile(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE permission_deal_access (
    permission_profile_id text,
    user_id text,
    PRIMARY KEY (permission_profile_id, user_id),
    FOREIGN KEY (permission_profile_id) REFERENCES permission_profile(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE permission_forecast_access (
    permission_profile_id text,
    user_id text,
    PRIMARY KEY (permission_profile_id, user_id),
    FOREIGN KEY (permission_profile_id) REFERENCES permission_profile(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE permission_forecast_edit_submission_access (
    permission_profile_id text,
    user_id text,
    PRIMARY KEY (permission_profile_id, user_id),
    FOREIGN KEY (permission_profile_id) REFERENCES permission_profile(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE permission_forecast_edit_target_access (
    permission_profile_id text,
    user_id text,
    PRIMARY KEY (permission_profile_id, user_id),
    FOREIGN KEY (permission_profile_id) REFERENCES permission_profile(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE permission_coaching_access (
    permission_profile_id text,
    user_id text,
    PRIMARY KEY (permission_profile_id, user_id),
    FOREIGN KEY (permission_profile_id) REFERENCES permission_profile(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE permission_insight_access (
    permission_profile_id text,
    user_id text,
    PRIMARY KEY (permission_profile_id, user_id),
    FOREIGN KEY (permission_profile_id) REFERENCES permission_profile(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE permission_email_access (
    permission_profile_id text,
    user_id text,
    PRIMARY KEY (permission_profile_id, user_id),
    FOREIGN KEY (permission_profile_id) REFERENCES permission_profile(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE permission_profile (
    id text,
    workspace_id text,
    account boolean,
    activity boolean,
    calls_access_permission_level text,
    calls_and_search boolean,
    coaching boolean,
    create_edit_and_delete_deals_boards boolean,
    crm_data_import boolean,
    crm_data_inline_editing boolean,
    deal_access_permission_level text,
    deals boolean,
    deals_inline_editing boolean,
    delete_calls boolean,
    delete_emails boolean,
    description text,
    download_call_media boolean,
    emails_access_permission_level text,
    engage_manage_company_sequences boolean,
    engage_manage_company_templates boolean,
    export_calls_and_coaching_data_to_csv boolean,
    forecast boolean,
    forecast_access_permission_level text,
    forecast_edit_submissions_access_permission_level text,
    forecast_edit_targets_access_permission_level text,
    forecast_manage boolean,
    initiatives boolean,
    insights_access_permission_level text,
    library boolean,
    library_folder_access_permission_level text,
    manage_general_business_settings boolean,
    manage_scorecards boolean,
    manually_schedule_and_upload_calls boolean,
    market boolean,
    "name" text,
    private_calls boolean,
    score_calls boolean,
    share_calls_with_customers boolean,
    team_stats boolean,
    trim_calls boolean,
    PRIMARY KEY (id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id)
);

CREATE TABLE lead_entity_schema (
    "name" text,
    integration_id text,
    is_deleted boolean,
    label text,
    last_modified timestamp,
    reference_to text,
    "type" text,
    PRIMARY KEY ("name", integration_id),
    FOREIGN KEY (integration_id) REFERENCES crm(integration_id)
);

CREATE TABLE language_keywords (
    keyword text,
    tracker_language text,
    PRIMARY KEY (keyword, tracker_language),
    FOREIGN KEY (tracker_language) REFERENCES tracker_language(tracker_language)
);

CREATE TABLE tracker_language (
    tracker_language text,
    tracker_id text,
    include_related_forms text,
    PRIMARY KEY (tracker_language, tracker_id),
    FOREIGN KEY (tracker_id) REFERENCES tracker(tracker_id)
);

CREATE TABLE tracker_said_in_topic (
    keyword text,
    tracker_id text,
    PRIMARY KEY (keyword, tracker_id),
    FOREIGN KEY (tracker_id) REFERENCES tracker(tracker_id)
);

CREATE TABLE tracker_said_in_call_parts (
    keyword text,
    tracker_id text,
    PRIMARY KEY (keyword, tracker_id),
    FOREIGN KEY (tracker_id) REFERENCES tracker(tracker_id)
);

CREATE TABLE tracker (
    tracker_id text,
    creator_user_id text,
    updater_user_id text,
    workspace_id text,
    affiliation text,
    created timestamp,
    filter_query text,
    part_of_question text,
    said_at text,
    said_at_interval bigint,
    tracker_name text,
    updated timestamp,
    PRIMARY KEY (tracker_id),
    FOREIGN KEY (creator_user_id) REFERENCES users(id),
    FOREIGN KEY (updater_user_id) REFERENCES users(id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id)
);

CREATE TABLE manual_call_integration (
    _fivetran_id text,
    account_crm_id text,
    deal_crm_id text,
    manual_call_id text,
    manual_user_id text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (account_crm_id) REFERENCES call_context_integration("name"),
    FOREIGN KEY (deal_crm_id) REFERENCES call_context_integration("name"),
    FOREIGN KEY (manual_call_id) REFERENCES manual_call(id),
    FOREIGN KEY (manual_user_id) REFERENCES manual_call(user_id)
);

CREATE TABLE manual_call (
    id text,
    user_id text,
    created text,
    PRIMARY KEY (id, user_id),
    FOREIGN KEY (id) REFERENCES "call"(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE user_email_alias (
    email text,
    user_id text,
    PRIMARY KEY (email, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE user_meeting_url (
    url text,
    user_id text,
    PRIMARY KEY (url, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE user_spoken_language (
    languages text,
    user_id text,
    is_primary text,
    PRIMARY KEY (languages, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    manager_id text,
    active boolean,
    created text,
    email_address text,
    emails_imported boolean,
    extension text,
    first_name text,
    gong_connect_enabled boolean,
    last_name text,
    meeting_consent_page_url text,
    non_recorded_meetings_imported boolean,
    phone_number text,
    prevent_email_import boolean,
    prevent_web_conference_recording boolean,
    telephony_calls_imported boolean,
    title text,
    web_conferences_recorded boolean,
    PRIMARY KEY (id),
    FOREIGN KEY (manager_id) REFERENCES users(id)
);

CREATE TABLE crm (
    integration_id text,
    owner_email text,
    "name" text,
    PRIMARY KEY (integration_id),
    FOREIGN KEY (owner_email) REFERENCES users(id)
);

CREATE TABLE call_public_comment (
    id text,
    call_id text,
    commenter_user_id text,
    in_reply_to text,
    audio_end_time text,
    audio_start_time text,
    "comment" text,
    during_call text,
    posted text,
    PRIMARY KEY (id, call_id),
    FOREIGN KEY (call_id) REFERENCES "call"(id),
    FOREIGN KEY (commenter_user_id) REFERENCES users(id),
    FOREIGN KEY (in_reply_to) REFERENCES call_public_comment(id)
);

CREATE TABLE call_content_action_item (
    _fivetran_id text,
    call_id text,
    snippet text,
    snippet_end_time text,
    snippet_start_time text,
    speaker_id text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (call_id) REFERENCES "call"(id)
);

CREATE TABLE call_structure (
    _fivetran_id text,
    call_id text,
    duration text,
    "name" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (call_id) REFERENCES "call"(id)
);

CREATE TABLE call_topic (
    _fivetran_id text,
    call_id text,
    duration text,
    "name" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (call_id) REFERENCES "call"(id)
);

CREATE TABLE call_context_integration (
    "name" text,
    object_id text,
    call_id text,
    object_type text,
    systems text,
    timing text,
    "value" jsonb,
    PRIMARY KEY ("name", object_id, call_id),
    FOREIGN KEY (call_id) REFERENCES "call"(id)
);

CREATE TABLE call_interaction (
    "name" text,
    call_id text,
    "value" text,
    PRIMARY KEY ("name", call_id),
    FOREIGN KEY (call_id) REFERENCES "call"(id)
);

CREATE TABLE call_participant_integration (
    "name" text,
    object_id text,
    call_id text,
    call_participant_id text,
    object_type text,
    systems text,
    timing text,
    "value" text,
    PRIMARY KEY ("name", object_id, call_id),
    FOREIGN KEY (call_id) REFERENCES "call"(id),
    FOREIGN KEY (call_participant_id) REFERENCES call_participant(id)
);

CREATE TABLE call_participant (
    id text,
    call_id text,
    user_id text,
    affiliation text,
    email_address text,
    methods jsonb,
    "name" text,
    phone_number text,
    speaker_id text,
    title text,
    PRIMARY KEY (id, call_id),
    FOREIGN KEY (call_id) REFERENCES "call"(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE call_speaker (
    id text,
    call_id text,
    user_id text,
    talk_time text,
    PRIMARY KEY (id, call_id),
    FOREIGN KEY (call_id) REFERENCES "call"(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE call_video (
    _fivetran_id text,
    call_id text,
    duration text,
    "name" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (call_id) REFERENCES "call"(id)
);

CREATE TABLE "call" (
    id text,
    workspace_id text,
    primary_user_id text,
    calendar_event_id text,
    client_unique_id text,
    company_question_count text,
    custom_data text,
    direction text,
    duration integer,
    is_private boolean,
    languages text,
    media text,
    media_audio_url text,
    media_video_url text,
    meeting_url text,
    non_company_question_count text,
    purpose text,
    scheduled text,
    scope text,
    sdr_disposition text,
    started text,
    systems text,
    title text,
    url text,
    PRIMARY KEY (id, workspace_id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id),
    FOREIGN KEY (primary_user_id) REFERENCES users(id)
);

CREATE TABLE call_tracker (
    _fivetran_id text,
    call_id text,
    id text,
    "name" text,
    phrase text,
    speaker_id text,
    start_time text,
    "type" text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE user_setting_history (
    setting text,
    "time" text,
    user_id text,
    "value" boolean,
    PRIMARY KEY (setting, "time", user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE account_entity_schema (
    "name" text,
    integration_id text,
    is_deleted boolean,
    label text,
    last_modified timestamp,
    reference_to text,
    "type" text,
    PRIMARY KEY ("name", integration_id),
    FOREIGN KEY (integration_id) REFERENCES crm(integration_id)
);

CREATE TABLE transcript (
    call_id text,
    "index" text,
    workspace_id text,
    sentence jsonb,
    speaker_id text,
    topic text,
    PRIMARY KEY (call_id, "index", workspace_id)
);

CREATE TABLE workspace (
    id text,
    description text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE engage_flow (
    id text,
    user_email_address text,
    folder_id text,
    creation_date timestamp,
    "name" text,
    visibility text,
    PRIMARY KEY (id, user_email_address),
    FOREIGN KEY (folder_id) REFERENCES library_folder(id)
);

CREATE TABLE answered_scorecard_answer (
    answered_scorecard_id text,
    question_id text,
    answer_text text,
    is_overall boolean,
    not_applicable text,
    question_revision_id text,
    score text,
    PRIMARY KEY (answered_scorecard_id, question_id),
    FOREIGN KEY (answered_scorecard_id) REFERENCES answered_scorecard(id),
    FOREIGN KEY (question_id) REFERENCES scorecard_question(question_id)
);

CREATE TABLE answered_scorecard (
    id text,
    call_id text,
    scorecard_id text,
    reviewed_user_id text,
    reviewer_user_id text,
    call_start_time text,
    review_time text,
    visibility_type text,
    PRIMARY KEY (id, call_id, scorecard_id),
    FOREIGN KEY (call_id) REFERENCES "call"(id),
    FOREIGN KEY (scorecard_id) REFERENCES scorecard(id),
    FOREIGN KEY (reviewed_user_id) REFERENCES users(id),
    FOREIGN KEY (reviewer_user_id) REFERENCES users(id)
);

CREATE TABLE library_folder (
    id text,
    created_by text,
    parent_folder_id text,
    workspace_id text,
    "name" text,
    updated text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (parent_folder_id) REFERENCES library_folder(id),
    FOREIGN KEY (workspace_id) REFERENCES workspace(id)
);

CREATE TABLE deal_entity_schema (
    "name" text,
    integration_id text,
    is_deleted boolean,
    label text,
    last_modified timestamp,
    reference_to text,
    "type" text,
    PRIMARY KEY ("name", integration_id),
    FOREIGN KEY (integration_id) REFERENCES crm(integration_id)
);
