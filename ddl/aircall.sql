CREATE TABLE webhook (
    id text,
    active text,
    created_at text,
    events jsonb,
    url text,
    PRIMARY KEY (id)
);

CREATE TABLE user_number (
    number_id text,
    user_id text,
    PRIMARY KEY (number_id, user_id),
    FOREIGN KEY (number_id) REFERENCES numbers(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE numbers (
    id text,
    availability_status text,
    country text,
    created_at text,
    digits text,
    is_ivr text,
    is_open text,
    live_recording_activated text,
    messages_after_hours text,
    messages_callback_later text,
    messages_closed text,
    messages_ivr text,
    messages_ringing_tone text,
    messages_unanswered_call text,
    messages_voicemail text,
    messages_waiting text,
    messages_welcome text,
    "name" text,
    priority text,
    time_zone text,
    PRIMARY KEY (id)
);

CREATE TABLE call_sentiment_participant (
    call_sentiment_id text,
    "index" text,
    call_id text,
    phone_number text,
    "type" text,
    "value" text,
    PRIMARY KEY (call_sentiment_id, "index", call_id),
    FOREIGN KEY (call_id) REFERENCES "call"(id)
);

CREATE TABLE call_playbook_result_topic (
    "index" text,
    call_id text,
    call_playbook_result_id text,
    "name" text,
    "result" text,
    PRIMARY KEY ("index", call_id, call_playbook_result_id),
    FOREIGN KEY (call_id) REFERENCES call_playbook_result(call_id),
    FOREIGN KEY (call_playbook_result_id) REFERENCES call_playbook_result(id)
);

CREATE TABLE call_playbook_result (
    id text,
    call_id text,
    user_id text,
    adherence_score text,
    created_at text,
    number_id text,
    playbook_id text,
    playbook_name text,
    PRIMARY KEY (id, call_id),
    FOREIGN KEY (call_id) REFERENCES "call"(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE call_summary (
    id text,
    call_id text,
    content text,
    created_at text,
    PRIMARY KEY (id, call_id),
    FOREIGN KEY (call_id) REFERENCES "call"(id)
);

CREATE TABLE contact_email (
    id text,
    contact_id text,
    label text,
    "value" text,
    PRIMARY KEY (id, contact_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE contact_number (
    id text,
    contact_id text,
    label text,
    "value" text,
    PRIMARY KEY (id, contact_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE contact (
    id text,
    company_name text,
    created_at text,
    first_name text,
    information text,
    is_shared text,
    last_name text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE user_availability (
    user_id text,
    availability text,
    PRIMARY KEY (user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE call_topic_content (
    call_topic_id text,
    "index" text,
    call_id text,
    call_topic_created_at text,
    content_id text,
    PRIMARY KEY (call_topic_id, "index", call_id),
    FOREIGN KEY (call_id) REFERENCES "call"(id)
);

CREATE TABLE call_action_item (
    id text,
    call_id text,
    created_by text,
    updated_by text,
    ai_generated text,
    content text,
    created_at text,
    updated_at text,
    PRIMARY KEY (id, call_id),
    FOREIGN KEY (call_id) REFERENCES "call"(id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (updated_by) REFERENCES users(id)
);

CREATE TABLE team_user (
    team_id text,
    user_id text,
    PRIMARY KEY (team_id, user_id),
    FOREIGN KEY (team_id) REFERENCES team(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE team (
    id text,
    created_at text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE users (
    id text,
    availability_status text,
    available text,
    created_at text,
    email text,
    languages text,
    "name" text,
    time_zone text,
    wrap_up_time text,
    PRIMARY KEY (id)
);

CREATE TABLE tags (
    id text,
    color text,
    description text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE call_comment (
    comment_id text,
    call_id text,
    posted_by text,
    content text,
    posted_at text,
    PRIMARY KEY (comment_id, call_id),
    FOREIGN KEY (call_id) REFERENCES "call"(id),
    FOREIGN KEY (posted_by) REFERENCES users(id)
);

CREATE TABLE call_tag (
    call_id text,
    tag_id text,
    tagged_by text,
    created_at text,
    PRIMARY KEY (call_id, tag_id),
    FOREIGN KEY (call_id) REFERENCES "call"(id),
    FOREIGN KEY (tag_id) REFERENCES tags(id),
    FOREIGN KEY (tagged_by) REFERENCES users(id)
);

CREATE TABLE call_participant (
    "index" text,
    call_id text,
    id text,
    phone_number text,
    "type" text,
    PRIMARY KEY ("index", call_id),
    FOREIGN KEY (call_id) REFERENCES "call"(id)
);

CREATE TABLE call_team (
    call_id text,
    team_id text,
    created_at text,
    PRIMARY KEY (call_id, team_id),
    FOREIGN KEY (call_id) REFERENCES "call"(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE call_ivr_options_selected (
    id text,
    call_id text,
    branch text,
    created_at text,
    "key" text,
    title text,
    transition_ended_at text,
    transition_started_at text,
    PRIMARY KEY (id, call_id),
    FOREIGN KEY (call_id) REFERENCES "call"(id)
);

CREATE TABLE "call" (
    id text,
    number_id text,
    user_id text,
    answered_at text,
    archived text,
    asset text,
    assigned_to text,
    contact text,
    cost text,
    direction text,
    duration text,
    ended_at text,
    missed_call_reason text,
    raw_digits text,
    recording text,
    sid text,
    started_at text,
    "status" text,
    transferred_by text,
    transferred_to text,
    voicemail text,
    PRIMARY KEY (id),
    FOREIGN KEY (number_id) REFERENCES numbers(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE dialer_campaign (
    id text,
    user_id text,
    created_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE dialer_campaign_number (
    _fivetran_id text,
    user_id text,
    called text,
    created_at text,
    number_id text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE call_transcription_content_utterance (
    "index" text,
    call_id text,
    call_transcription_id text,
    end_time text,
    participant_type text,
    phone_number text,
    start_time text,
    text text,
    PRIMARY KEY ("index", call_id, call_transcription_id),
    FOREIGN KEY (call_id) REFERENCES call_transcription(call_id),
    FOREIGN KEY (call_transcription_id) REFERENCES call_transcription(id)
);

CREATE TABLE call_transcription (
    id text,
    call_id text,
    call_created_at text,
    "type" text,
    PRIMARY KEY (id, call_id),
    FOREIGN KEY (call_id) REFERENCES "call"(id)
);

CREATE TABLE aircall_to_partner_campaign (
    id text,
    company_id text,
    created_at text,
    external_id text,
    numbers jsonb,
    update_message text,
    update_status text,
    updated_at text,
    PRIMARY KEY (id)
);
