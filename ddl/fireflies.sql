CREATE TABLE user_integration (
    integration_id text,
    users_id text,
    PRIMARY KEY (integration_id, users_id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE user_group_member (
    id text,
    user_group_id text,
    users_id text,
    email text,
    first_name text,
    last_name text,
    PRIMARY KEY (id, user_group_id, users_id),
    FOREIGN KEY (user_group_id) REFERENCES user_group(id),
    FOREIGN KEY (users_id) REFERENCES user_group(users_id)
);

CREATE TABLE user_group (
    id text,
    users_id text,
    handle text,
    "name" text,
    PRIMARY KEY (id, users_id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    email text,
    is_admin boolean,
    minutes_consumed text,
    "name" text,
    recent_meeting text,
    PRIMARY KEY (id)
);

CREATE TABLE transcript_sentence (
    "index" text,
    transcript_id text,
    ai_filters_date_and_time text,
    ai_filters_metric text,
    ai_filters_pricing text,
    ai_filters_question text,
    ai_filters_sentiment text,
    ai_filters_task text,
    ai_filters_text_cleanup text,
    end_time text,
    raw_text text,
    speaker_id text,
    speaker_name text,
    start_time text,
    text text,
    PRIMARY KEY ("index", transcript_id),
    FOREIGN KEY (transcript_id) REFERENCES transcript(id)
);

CREATE TABLE transcript_app_preview_output (
    "index" text,
    transcript_id text,
    user_id text,
    app_id text,
    created_at text,
    prompt text,
    response text,
    title text,
    PRIMARY KEY ("index", transcript_id),
    FOREIGN KEY (transcript_id) REFERENCES transcript(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE transcript_meeting_attendee (
    "index" text,
    transcript_id text,
    display_name text,
    email text,
    "name" text,
    phone_number text,
    PRIMARY KEY ("index", transcript_id),
    FOREIGN KEY (transcript_id) REFERENCES transcript(id)
);

CREATE TABLE transcript_meeting_attendance (
    "index" text,
    transcript_id text,
    join_time timestamp,
    leave_time timestamp,
    "name" text,
    PRIMARY KEY ("index", transcript_id),
    FOREIGN KEY (transcript_id) REFERENCES transcript(id)
);

CREATE TABLE transcript_speaker (
    id text,
    transcript_id text,
    "name" text,
    PRIMARY KEY (id, transcript_id),
    FOREIGN KEY (transcript_id) REFERENCES transcript(id)
);

CREATE TABLE transcript_analytics_speaker (
    id text,
    transcript_id text,
    duration text,
    duration_pct text,
    filler_words text,
    longest_monologue text,
    monologues_count text,
    "name" text,
    questions text,
    word_count text,
    words_per_minute text,
    PRIMARY KEY (id, transcript_id),
    FOREIGN KEY (transcript_id) REFERENCES transcript(id)
);

CREATE TABLE transcript (
    id text,
    user_id text,
    audio_url text,
    cal_id text,
    calendar_id text,
    calendar_type text,
    channels jsonb,
    created_date timestamp,
    date_times text,
    duration text,
    fireflies_users jsonb,
    meeting_date timestamp,
    meeting_info_is_bot_joined boolean,
    meeting_info_is_silent_meeting boolean,
    meeting_info_summary_status text,
    meeting_link text,
    metrics text,
    negative_pct text,
    neutral_pct text,
    organizer_email text,
    participants jsonb,
    positive_pct text,
    privacy text,
    questions text,
    summary_action_items text,
    summary_bullet_gist text,
    summary_extended_sections jsonb,
    summary_gist text,
    summary_keywords jsonb,
    summary_meeting_type text,
    summary_notes text,
    summary_outline text,
    summary_overview text,
    summary_short_overview text,
    summary_short_summary text,
    summary_shorthand_bullet text,
    summary_topics_discussed jsonb,
    summary_transcript_chapters jsonb,
    tasks text,
    title text,
    transcript_url text,
    video_url text,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE bite_caption (
    "index" text,
    bite_id text,
    end_time timestamp,
    speaker_id text,
    speaker_name text,
    start_time timestamp,
    text text,
    PRIMARY KEY ("index", bite_id),
    FOREIGN KEY (bite_id) REFERENCES bite(id)
);

CREATE TABLE bite_source (
    "index" text,
    bite_id text,
    src text,
    "type" text,
    PRIMARY KEY ("index", bite_id),
    FOREIGN KEY (bite_id) REFERENCES bite(id)
);

CREATE TABLE bite_privacy (
    privacy_id text,
    bite_id text,
    PRIMARY KEY (privacy_id, bite_id),
    FOREIGN KEY (bite_id) REFERENCES bite(id)
);

CREATE TABLE bite (
    id text,
    transcript_id text,
    created_from_id text,
    user_id text,
    created_at timestamp,
    created_from_description text,
    created_from_duration text,
    created_from_name text,
    created_from_type text,
    end_time text,
    media_type text,
    "name" text,
    preview text,
    start_time text,
    "status" text,
    summary text,
    summary_status text,
    thumbnail text,
    PRIMARY KEY (id, transcript_id),
    FOREIGN KEY (transcript_id) REFERENCES transcript(id),
    FOREIGN KEY (created_from_id) REFERENCES transcript(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);
