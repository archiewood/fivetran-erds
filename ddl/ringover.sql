CREATE TABLE group_user (
    group_id text,
    user_id text,
    orders text,
    ring_duration text,
    PRIMARY KEY (group_id, user_id),
    FOREIGN KEY (group_id) REFERENCES groups(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE groups (
    id text,
    color text,
    is_jumper text,
    "name" text,
    total_users_count text,
    PRIMARY KEY (id)
);

CREATE TABLE ivr (
    id text,
    color text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE call_survey (
    _fivetran_id text,
    call_id text,
    channel_id text,
    "name" text,
    "value" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (call_id) REFERENCES "call"(call_id)
);

CREATE TABLE profile (
    profile_id text,
    "name" text,
    PRIMARY KEY (profile_id)
);

CREATE TABLE call_tag (
    call_id text,
    id text,
    team_id text,
    user_id text,
    PRIMARY KEY (call_id, id, team_id, user_id),
    FOREIGN KEY (call_id) REFERENCES "call"(call_id),
    FOREIGN KEY (id) REFERENCES tags(id),
    FOREIGN KEY (team_id) REFERENCES "call"(team_id),
    FOREIGN KEY (user_id) REFERENCES "call"(user_id)
);

CREATE TABLE "call" (
    call_id text,
    team_id text,
    user_id text,
    call_user_id text,
    conference_id text,
    contact_id text,
    ivr_id text,
    amd text,
    answered_time text,
    cdr_id text,
    channel_id text,
    contact_number text,
    direction text,
    end_time text,
    fax text,
    from_number text,
    incall_duration text,
    is_archived text,
    last_state text,
    note text,
    record text,
    scenario_id text,
    scenario_name text,
    star text,
    start_time text,
    to_number text,
    total_duration text,
    "type" text,
    voicemail text,
    PRIMARY KEY (call_id, team_id, user_id),
    FOREIGN KEY (team_id) REFERENCES team(id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (call_user_id) REFERENCES users(id),
    FOREIGN KEY (conference_id) REFERENCES team_conference(id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (ivr_id) REFERENCES ivr(id)
);

CREATE TABLE ivr_scenario (
    ivr_id text,
    scenario_id text,
    id text,
    color text,
    is_default text,
    "name" text,
    scenario_type text,
    PRIMARY KEY (ivr_id, scenario_id),
    FOREIGN KEY (id) REFERENCES ivr(id)
);

CREATE TABLE conversation_member (
    conversation_user_id text,
    conversation_id text,
    contact_id text,
    coversation_id text,
    group_id text,
    ivr_id text,
    number_raw text,
    user_id text,
    alphanumeric text,
    is_administrator text,
    picture text,
    table_name text,
    PRIMARY KEY (conversation_user_id, conversation_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (coversation_id) REFERENCES conversation(id),
    FOREIGN KEY (group_id) REFERENCES groups(id),
    FOREIGN KEY (ivr_id) REFERENCES ivr(id),
    FOREIGN KEY (number_raw) REFERENCES number(format_raw),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE conversation_star (
    "index" text,
    conversation_id text,
    team_id text,
    user_id text,
    star text,
    PRIMARY KEY ("index", conversation_id, team_id, user_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id),
    FOREIGN KEY (team_id) REFERENCES conversation(team_id),
    FOREIGN KEY (user_id) REFERENCES conversation(user_id)
);

CREATE TABLE conversation_tag (
    "index" text,
    conversation_id text,
    team_id text,
    user_id text,
    tags text,
    PRIMARY KEY ("index", conversation_id, team_id, user_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id),
    FOREIGN KEY (team_id) REFERENCES conversation(team_id),
    FOREIGN KEY (user_id) REFERENCES conversation(user_id)
);

CREATE TABLE conversation (
    id text,
    team_id text,
    user_id text,
    last_message_id text,
    adminrules_can_invite text,
    adminrules_can_join text,
    adminrules_can_kick text,
    adminrules_can_leave text,
    adminrules_can_view_history text,
    can_thread_in text,
    creation_date text,
    favorite text,
    is_archived text,
    is_commented_by text,
    is_mms_write text,
    is_sms_write text,
    "name" text,
    purpose text,
    total_messages_count text,
    "type" text,
    unread_comment text,
    unread_messages_count text,
    update_date text,
    user_list jsonb,
    PRIMARY KEY (id, team_id, user_id),
    FOREIGN KEY (last_message_id) REFERENCES conversation_message_list(conversation_id)
);

CREATE TABLE number (
    id text,
    conference_id text,
    ivr_id text,
    user_id text,
    format_country text,
    format_country_code text,
    format_e_164_format text,
    format_international text,
    format_international_alt text,
    format_is_short_code text,
    format_national text,
    format_national_alt text,
    format_raw text,
    format_rfc_3966_format text,
    is_callable text,
    is_sms text,
    is_sms_write text,
    label text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (conference_id) REFERENCES team_conference(id),
    FOREIGN KEY (ivr_id) REFERENCES ivr(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE user_snooze_log_list (
    "index" text,
    team_id text,
    user_id text,
    "comment" text,
    creation_date text,
    end_date text,
    label text,
    label_en text,
    label_es text,
    label_fr text,
    "name" text,
    "state" text,
    PRIMARY KEY ("index", team_id, user_id),
    FOREIGN KEY (team_id) REFERENCES user_snooze_log(team_id),
    FOREIGN KEY (user_id) REFERENCES user_snooze_log(user_id)
);

CREATE TABLE user_snooze_log (
    team_id text,
    user_id text,
    PRIMARY KEY (team_id, user_id),
    FOREIGN KEY (team_id) REFERENCES team(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE transcription (
    id text,
    call_id text,
    team_id text,
    user_id text,
    creation_date text,
    provider text,
    standard_id text,
    transcription_cdn_path text,
    transcription_status text,
    PRIMARY KEY (id),
    FOREIGN KEY (call_id) REFERENCES "call"(call_id),
    FOREIGN KEY (team_id) REFERENCES team(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE conversation_message_list (
    message_id text,
    conversation_id text,
    conference_id text,
    contact_id text,
    conversation_user_id text,
    number_raw text,
    team_id text,
    user_id text,
    archive_date text,
    buffer text,
    creation_date text,
    direction text,
    is_archived text,
    is_failed text,
    mdr_uuid text,
    nb_fragment text,
    thread_buffer_section text,
    thread_conversation_id_linked text,
    thread_conversation_sms_id_linked text,
    thread_nb_response text,
    thread_thread_uuid text,
    total_plan text,
    total_price text,
    update_date text,
    PRIMARY KEY (message_id, conversation_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation_message(user_id),
    FOREIGN KEY (conference_id) REFERENCES team_conference(id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (conversation_user_id) REFERENCES conversation_member(conversation_user_id),
    FOREIGN KEY (number_raw) REFERENCES number(format_raw),
    FOREIGN KEY (team_id) REFERENCES team(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE conversation_message (
    conversation_id text,
    team_id text,
    user_id text,
    creation_date text,
    is_archived text,
    is_sms_write text,
    "name" text,
    purpose text,
    "type" text,
    unread_messages_count text,
    update_date text,
    PRIMARY KEY (conversation_id, team_id, user_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id),
    FOREIGN KEY (team_id) REFERENCES team(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE user_planning_time_range (
    "index" text,
    user_id text,
    "day" text,
    ends text,
    "start" text,
    PRIMARY KEY ("index", user_id),
    FOREIGN KEY (user_id) REFERENCES user_planning(user_id)
);

CREATE TABLE user_planning (
    user_id text,
    team_id text,
    is_planning text,
    is_snooze text,
    planning_enable text,
    tz_identifier text,
    tz_now text,
    PRIMARY KEY (user_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE blacklist (
    number text,
    team_id text,
    user_id text,
    "comment" text,
    direction text,
    PRIMARY KEY (number, team_id, user_id),
    FOREIGN KEY (number) REFERENCES number(id),
    FOREIGN KEY (team_id) REFERENCES team(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE team_number (
    id text,
    team_id text,
    PRIMARY KEY (id, team_id),
    FOREIGN KEY (id) REFERENCES number(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE team_ivr (
    id text,
    team_id text,
    PRIMARY KEY (id, team_id),
    FOREIGN KEY (id) REFERENCES ivr(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE team_tag (
    id text,
    team_id text,
    PRIMARY KEY (id, team_id),
    FOREIGN KEY (id) REFERENCES tags(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE team_group (
    id text,
    team_id text,
    PRIMARY KEY (id, team_id),
    FOREIGN KEY (id) REFERENCES groups(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE team_conference (
    id text,
    team_id text,
    "name" text,
    PRIMARY KEY (id, team_id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE team (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE users (
    id text,
    team_id text,
    color text,
    company text,
    concat_name text,
    email text,
    first_name text,
    initial text,
    last_name text,
    picture text,
    PRIMARY KEY (id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE contact_number (
    contact_id text,
    id text,
    team_id text,
    user_id text,
    team_id text,
    user_id text,
    PRIMARY KEY (contact_id, id, team_id, user_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (id) REFERENCES number(id),
    FOREIGN KEY (team_id) REFERENCES team(id),
    FOREIGN KEY (team_id) REFERENCES contact(team_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (user_id) REFERENCES contact(user_id),
    FOREIGN KEY (team_id) REFERENCES team(id),
    FOREIGN KEY (team_id) REFERENCES contact(team_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (user_id) REFERENCES contact(user_id)
);

CREATE TABLE contact (
    id text,
    team_id text,
    user_id text,
    team_id text,
    user_id text,
    color text,
    company text,
    concat_name text,
    creation_date text,
    first_name text,
    im_owner text,
    initial text,
    is_shared text,
    last_name text,
    profile_picture text,
    social_data text,
    social_profile_url text,
    social_service text,
    social_service_id text,
    PRIMARY KEY (id, team_id, user_id),
    FOREIGN KEY (team_id) REFERENCES team(id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (team_id) REFERENCES team(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE tags (
    id text,
    color text,
    creation_date text,
    description text,
    "name" text,
    PRIMARY KEY (id)
);
