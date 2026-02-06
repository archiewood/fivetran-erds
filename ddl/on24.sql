CREATE TABLE event_media (
    event_id text,
    "index" text,
    audio jsonb,
    poll jsonb,
    slide jsonb,
    urls jsonb,
    video jsonb,
    video_clip jsonb,
    PRIMARY KEY (event_id, "index")
);

CREATE TABLE presenter (
    id text,
    event_id text,
    access_mode text,
    client_id text,
    end_time text,
    is_practice_session text,
    session_id text,
    start_time text,
    PRIMARY KEY (id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE attendee_question (
    question_id text,
    attendee_id text,
    presenter_id text,
    answer_content text,
    answer_create_timestamp text,
    content text,
    create_timestamp text,
    privacy text,
    PRIMARY KEY (question_id, attendee_id),
    FOREIGN KEY (attendee_id) REFERENCES attendee(id),
    FOREIGN KEY (presenter_id) REFERENCES presenter(id)
);

CREATE TABLE attendee_poll_answer (
    "index" text,
    attendee_id text,
    poll_id text,
    answer text,
    answer_code text,
    PRIMARY KEY ("index", attendee_id, poll_id),
    FOREIGN KEY (attendee_id) REFERENCES attendee_poll(attendee_id),
    FOREIGN KEY (poll_id) REFERENCES attendee_poll(poll_id)
);

CREATE TABLE attendee_poll (
    attendee_id text,
    poll_id text,
    question text,
    question_id text,
    submitted_timestamp text,
    PRIMARY KEY (attendee_id, poll_id),
    FOREIGN KEY (attendee_id) REFERENCES attendee(id),
    FOREIGN KEY (poll_id) REFERENCES poll(id)
);

CREATE TABLE attendee_resource (
    attendee_id text,
    resource_id text,
    viewed text,
    viewed_timestamp text,
    PRIMARY KEY (attendee_id, resource_id),
    FOREIGN KEY (attendee_id) REFERENCES attendee(id),
    FOREIGN KEY (resource_id) REFERENCES resource(resource_id)
);

CREATE TABLE attendee_survey_answer (
    "index" text,
    attendee_id text,
    question_id text,
    survey_id text,
    answer text,
    answer_code text,
    PRIMARY KEY ("index", attendee_id, question_id, survey_id),
    FOREIGN KEY (attendee_id) REFERENCES attendee_survey(attendee_id),
    FOREIGN KEY (question_id) REFERENCES attendee_survey(question_id),
    FOREIGN KEY (survey_id) REFERENCES attendee_survey(survey_id)
);

CREATE TABLE attendee_survey (
    question_id text,
    attendee_id text,
    survey_id text,
    question text,
    question_code text,
    submitted_timestamp text,
    PRIMARY KEY (question_id, attendee_id, survey_id),
    FOREIGN KEY (attendee_id) REFERENCES attendee(id),
    FOREIGN KEY (survey_id) REFERENCES survey(id)
);

CREATE TABLE attendee_twitter_widget (
    "index" text,
    attendee_id text,
    "date" text,
    tweet_description text,
    PRIMARY KEY ("index", attendee_id),
    FOREIGN KEY (attendee_id) REFERENCES attendee(id)
);

CREATE TABLE attendee_call_to_action (
    attendee_id text,
    cta_id text,
    "action" text,
    clicks text,
    cta_name text,
    "date" text,
    PRIMARY KEY (attendee_id, cta_id),
    FOREIGN KEY (attendee_id) REFERENCES attendee(id),
    FOREIGN KEY (cta_id) REFERENCES call_to_action(id)
);

CREATE TABLE attendee_test_widget (
    "index" text,
    attendee_id text,
    correct_answers_needed text,
    correct_answers_provided text,
    retries text,
    test_widget_result text,
    PRIMARY KEY ("index", attendee_id),
    FOREIGN KEY (attendee_id) REFERENCES attendee(id)
);

CREATE TABLE attendee_certification (
    id text,
    attendee_id text,
    certification_timestamp text,
    credit text,
    "name" text,
    "result" text,
    url text,
    PRIMARY KEY (id, attendee_id),
    FOREIGN KEY (attendee_id) REFERENCES attendee(id)
);

CREATE TABLE attendee_conversion (
    id text,
    attendee_id text,
    "action" text,
    "name" text,
    submitted_timestamp text,
    "type" text,
    PRIMARY KEY (id, attendee_id),
    FOREIGN KEY (attendee_id) REFERENCES attendee(id)
);

CREATE TABLE attendee_location_visit (
    id text,
    attendee_id text,
    code text,
    cumulative_visit_duration text,
    "name" text,
    sponsor_id text,
    visit text,
    visit_duration text,
    PRIMARY KEY (id, attendee_id),
    FOREIGN KEY (attendee_id) REFERENCES attendee(id)
);

CREATE TABLE attendee_breakout (
    id text,
    attendee_id text,
    cumulative_live_minute text,
    "name" text,
    "role" text,
    PRIMARY KEY (id, attendee_id),
    FOREIGN KEY (attendee_id) REFERENCES attendee(id)
);

CREATE TABLE attendee (
    id text,
    event_id text,
    answered_poll text,
    answered_survey text,
    answered_survey_question text,
    archive_minute text,
    archive_viewed text,
    asked_question text,
    attendance_partner_ref text,
    campaign_code text,
    certification_credit text,
    certification_timestamp text,
    certification_widget_result text,
    client_id text,
    cumulative_archive_minute text,
    cumulative_live_minute text,
    email text,
    engagement_score text,
    ext_event_user_cd text,
    first_archive_activity text,
    first_live_activity text,
    is_blocked text,
    last_archive_activity text,
    last_live_activity text,
    launch_mode text,
    live_minute text,
    live_viewed text,
    partner_ref text,
    resource_downloaded text,
    source_campaign_code text,
    source_event_id text,
    test_widget_result text,
    user_profile_url text,
    user_status text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE registrant (
    id text,
    event_id text,
    address_street_1 text,
    address_street_2 text,
    attendee_type text,
    browser text,
    campaign_code text,
    city text,
    client_id text,
    company text,
    company_industry text,
    company_size text,
    country text,
    create_timestamp text,
    email text,
    email_format text,
    engagement_prediction text,
    event_email text,
    ext_event_user_cd text,
    fax text,
    first_name text,
    home_phone text,
    ip_address text,
    job_function text,
    job_title text,
    last_activity text,
    last_name text,
    marketing_email text,
    notes text,
    os text,
    other text,
    partner_ref text,
    source_campaign_code text,
    source_event_id text,
    "state" text,
    user_profile_url text,
    user_status text,
    username text,
    utm_campaign text,
    utm_content text,
    utm_medium text,
    utm_source text,
    utm_term text,
    work_phone text,
    zip text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE lead_business_interest (
    "index" text,
    lead_email text,
    business text,
    PRIMARY KEY ("index", lead_email),
    FOREIGN KEY (lead_email) REFERENCES lead(email)
);

CREATE TABLE lead_segment (
    "index" text,
    lead_email text,
    segment text,
    PRIMARY KEY ("index", lead_email),
    FOREIGN KEY (lead_email) REFERENCES lead(email)
);

CREATE TABLE lead (
    email text,
    engagement_level text,
    user_profile_url text,
    -- custom_* (dynamic column),
    PRIMARY KEY (email),
    FOREIGN KEY (email) REFERENCES attendee(email)
);

CREATE TABLE call_to_action (
    id text,
    event_id text,
    "action" text,
    action_type text,
    "name" text,
    total_click text,
    unique_click text,
    PRIMARY KEY (id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE event_analytics (
    "index" text,
    event_id text,
    attendee_who_downloaded_resource text,
    average_archive_minute text,
    average_cumulative_archive_minute text,
    average_cumulative_live_minute text,
    average_live_minute text,
    event_engagement_score text,
    live_attendee text,
    noshow_count text,
    number_of_cta_click text,
    number_of_demo_conversion text,
    number_of_drift text,
    number_of_freetrial_request text,
    number_of_groupchat_message_submitted text,
    number_of_meeting_conversion text,
    number_of_poll_pushed text,
    number_of_poll_response text,
    number_of_question_answered text,
    number_of_question_asked text,
    number_of_resource_available text,
    number_of_survey_presented text,
    number_of_survey_response text,
    number_of_test_passed text,
    number_of_test_submitted text,
    ondemand_attendee text,
    registration_page_hit text,
    share_this_widget_total_view text,
    share_this_widget_unique_view text,
    total_attendee text,
    total_registrant text,
    twitter_widget_total_view text,
    twitter_widget_unique_view text,
    unique_attendee_resource_download text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE event_partner_refstat (
    "index" text,
    event_id text,
    code text,
    count text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE event_tag (
    "index" text,
    event_id text,
    tags text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE event_funnel_stage (
    "index" text,
    event_id text,
    stage text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE event_speaker (
    "index" text,
    event_id text,
    company text,
    description text,
    "name" text,
    title text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE event_encoder (
    "index" text,
    event_id text,
    encoder text,
    stream_id text,
    url text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE event_survey_url (
    "index" text,
    event_id text,
    urls text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE event_category (
    "index" text,
    event_id text,
    category text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE event_track (
    "index" text,
    event_id text,
    track text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE event_liveday (
    "index" text,
    event_id text,
    id text,
    live_end_time text,
    live_start_time text,
    title text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE event_content (
    "index" text,
    event_id text,
    "status" text,
    title text,
    "type" text,
    url text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE event_sponsor_staff (
    "index" text,
    event_id text,
    event_sponsor_id text,
    company text,
    email text,
    first_name text,
    last_name text,
    "role" text,
    title text,
    PRIMARY KEY ("index", event_id, event_sponsor_id),
    FOREIGN KEY (event_id) REFERENCES event_sponsor(event_id),
    FOREIGN KEY (event_sponsor_id) REFERENCES event_sponsor(id)
);

CREATE TABLE event_sponsor (
    id text,
    event_id text,
    "name" text,
    PRIMARY KEY (id, event_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE event_account_tag (
    "index" text,
    event_id text,
    group_id text,
    group_name text,
    tag_id text,
    tag_name text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE event (
    id text,
    application text,
    archive_end text,
    archive_start text,
    audience_key text,
    audience_url text,
    category text,
    client_id text,
    content_type text,
    create_timestamp text,
    description text,
    display_timezone_cd text,
    event_duration text,
    event_location text,
    event_profile text,
    event_type text,
    ext_audience_url text,
    good_after text,
    good_till text,
    industry text,
    is_active text,
    is_elite_expired text,
    is_hybrid_event text,
    keyword text,
    last_modified text,
    last_updated text,
    live_end text,
    live_start text,
    locale_country_cd text,
    locale_language_cd text,
    "name" text,
    pm_url text,
    presenter_media_audio_file text,
    presenter_media_video_file text,
    preview_url text,
    promotional_summary text,
    qanda_email text,
    reg_notification_required text,
    reg_required text,
    report_url text,
    scheduled_event_duration text,
    service_type text,
    single_file_archive text,
    sponsor text,
    stream_type text,
    upload_url text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE attendee_session (
    id text,
    event_id text,
    browser text,
    duration text,
    email text,
    end_time text,
    ext_event_user_cd text,
    first_name text,
    ip_address text,
    last_name text,
    launch_mode text,
    media_stream text,
    os text,
    start_time text,
    stream_source text,
    usage text,
    PRIMARY KEY (id, event_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE poll_summary (
    "index" text,
    poll_id text,
    answer text,
    answer_code text,
    percentage text,
    PRIMARY KEY ("index", poll_id),
    FOREIGN KEY (poll_id) REFERENCES poll(id)
);

CREATE TABLE poll (
    id text,
    event_id text,
    question text,
    question_id text,
    total_vote text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE survey_answer (
    "index" text,
    question_id text,
    survey_id text,
    answer text,
    answer_code text,
    percentage text,
    PRIMARY KEY ("index", question_id, survey_id),
    FOREIGN KEY (question_id) REFERENCES survey_question(question_id),
    FOREIGN KEY (survey_id) REFERENCES survey_question(survey_id)
);

CREATE TABLE survey_question (
    question_id text,
    survey_id text,
    question text,
    question_type text,
    response text,
    PRIMARY KEY (question_id, survey_id),
    FOREIGN KEY (survey_id) REFERENCES survey(id)
);

CREATE TABLE survey (
    id text,
    event_id text,
    code text,
    PRIMARY KEY (id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE group_chat_message (
    "index" text,
    group_chat_id text,
    event_user_id text,
    chat_message text,
    create_timestamp text,
    PRIMARY KEY ("index", group_chat_id),
    FOREIGN KEY (group_chat_id) REFERENCES group_chat(id),
    FOREIGN KEY (event_user_id) REFERENCES attendee(id)
);

CREATE TABLE group_chat (
    id text,
    event_id text,
    "name" text,
    total_view text,
    unique_viewer text,
    PRIMARY KEY (id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE content_activity (
    client_id text,
    event_id text,
    average_viewing_duration text,
    "comment" text,
    content_type text,
    description text,
    dislike text,
    download text,
    likes text,
    share text,
    total_view text,
    total_viewing_duration text,
    unique_viewer text,
    PRIMARY KEY (client_id, event_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE resource (
    event_id text,
    resource_id text,
    resource_name text,
    total_download text,
    "type" text,
    unique_download text,
    PRIMARY KEY (event_id, resource_id)
);

CREATE TABLE email_notification (
    id text,
    event_id text,
    activated text,
    body text,
    email_from text,
    from_label text,
    good_after text,
    reply_to text,
    subject text,
    "type" text,
    when_to_send text,
    PRIMARY KEY (id, event_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE presenter_chat (
    presenter_id text,
    access_mode text,
    chat_id text,
    content text,
    create_timestamp text,
    email text,
    first_name text,
    last_name text,
    PRIMARY KEY (presenter_id),
    FOREIGN KEY (presenter_id) REFERENCES presenter(id)
);
