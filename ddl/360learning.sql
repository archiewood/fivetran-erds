CREATE TABLE custom_link (
    id text,
    user_id text,
    custom_link_id text,
    url text,
    PRIMARY KEY (id, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE user_certificate (
    id text,
    user_id text,
    path_id text,
    path_session_id text,
    certificate_outline_id text,
    delivery_date text,
    expiration_date text,
    title text,
    "type" text,
    validity_period text,
    PRIMARY KEY (id, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (path_id) REFERENCES "path"(id),
    FOREIGN KEY (path_session_id) REFERENCES path_session(id)
);

CREATE TABLE user_custom_field (
    id text,
    user_id text,
    "type" text,
    "value" text,
    PRIMARY KEY (id, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE path_step (
    id text,
    path_id text,
    attempts_limit text,
    auto_registration text,
    availability_mode text,
    availability_relative_unit text,
    availability_relative_value text,
    is_examination text,
    min_score text,
    optional text,
    recipient_type text,
    relative_date_unit text,
    relative_date_value text,
    scheduling_condition text,
    scheduling_relative_to text,
    scheduling_relativity text,
    show_correction text,
    show_forum text,
    subtype text,
    time_limit_mode text,
    time_limit_value text,
    "type" text,
    PRIMARY KEY (id, path_id),
    FOREIGN KEY (path_id) REFERENCES "path"(id)
);

CREATE TABLE path_translator (
    translator_id text,
    path_id text,
    path_translation_index text,
    PRIMARY KEY (translator_id, path_id, path_translation_index),
    FOREIGN KEY (path_id) REFERENCES path_translation(path_id),
    FOREIGN KEY (path_translation_index) REFERENCES path_translation("index")
);

CREATE TABLE path_translation (
    "index" text,
    path_id text,
    lang text,
    published text,
    translated_description text,
    translated_name text,
    PRIMARY KEY ("index", path_id),
    FOREIGN KEY (path_id) REFERENCES "path"(id)
);

CREATE TABLE "path" (
    id text,
    author_id text,
    group_id text,
    additional_information text,
    automated_reminders text,
    certificate_id text,
    created_at text,
    default_lang text,
    description text,
    display_classroom_messages text,
    display_forum text,
    estimated_commitment_max text,
    estimated_commitment_min text,
    estimated_duration_unit text,
    estimated_duration_value text,
    linear_progression text,
    mandatory_replay text,
    modified_at text,
    "name" text,
    notification_on_step_create text,
    source_lang text,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (author_id) REFERENCES users(id),
    FOREIGN KEY (group_id) REFERENCES groups(id)
);

CREATE TABLE custom_field (
    id text,
    "name" text,
    target_type text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE path_session_stat (
    _fivetran_id text,
    path_session_id text,
    awaiting_correction text,
    certificate text,
    late text,
    not_yet_started text,
    on_time text,
    session_not_opened text,
    successful text,
    to_retake text,
    unsuccessful text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (path_session_id) REFERENCES path_session(id)
);

CREATE TABLE path_session_instructor (
    instructor_id text,
    path_session_id text,
    PRIMARY KEY (instructor_id, path_session_id),
    FOREIGN KEY (path_session_id) REFERENCES path_session(id)
);

CREATE TABLE path_session_translator (
    translator_id text,
    path_session_id text,
    path_session_translation_index text,
    PRIMARY KEY (translator_id, path_session_id, path_session_translation_index),
    FOREIGN KEY (path_session_id) REFERENCES path_session_translation(path_session_id),
    FOREIGN KEY (path_session_translation_index) REFERENCES path_session_translation("index")
);

CREATE TABLE path_session_translation (
    "index" text,
    path_session_id text,
    lang text,
    published text,
    translated_name text,
    PRIMARY KEY ("index", path_session_id),
    FOREIGN KEY (path_session_id) REFERENCES path_session(id)
);

CREATE TABLE path_session (
    id text,
    group_id text,
    path_id text,
    additional_information text,
    auto_reenroll_delay_days text,
    auto_reenroll_type text,
    created_at text,
    end_date text,
    ip_filtering_active text,
    ip_filtering_authorized_addr text,
    is_audience_builder text,
    main_instructor_id text,
    modified_at text,
    "name" text,
    registration_request_validation text,
    root_session_id text,
    start_date text,
    user_limit text,
    PRIMARY KEY (id),
    FOREIGN KEY (group_id) REFERENCES groups(id),
    FOREIGN KEY (path_id) REFERENCES "path"(id)
);

CREATE TABLE groups (
    id text,
    parent_group_id text,
    background_image_id text,
    banner_image_id text,
    custom text,
    favicon_image_id text,
    logo_image_id text,
    moderation_charter_explicit_consent text,
    moderation_charter_url text,
    "name" text,
    privacy_policy_explicit_consent text,
    privacy_policy_url text,
    public text,
    subdomain text,
    terms_of_use_explicit_consent text,
    terms_of_use_url text,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (parent_group_id) REFERENCES groups(id)
);

CREATE TABLE classroom_media (
    media_id text,
    classroom_id text,
    PRIMARY KEY (media_id, classroom_id),
    FOREIGN KEY (classroom_id) REFERENCES classroom(id)
);

CREATE TABLE classroom (
    id text,
    group_id text,
    created_at text,
    message text,
    modified_at text,
    "name" text,
    training_objective text,
    PRIMARY KEY (id),
    FOREIGN KEY (group_id) REFERENCES groups(id)
);

CREATE TABLE user_reactivated_at (
    reactivated_at text,
    user_id text,
    PRIMARY KEY (reactivated_at, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE user_deleted_at (
    deleted_at text,
    user_id text,
    PRIMARY KEY (deleted_at, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    custom text,
    first_name text,
    job text,
    lang text,
    last_login_date text,
    last_name text,
    mail text,
    organization text,
    phone text,
    "status" text,
    to_be_deactivated_at timestamp,
    username text,
    PRIMARY KEY (id)
);

CREATE TABLE group_user (
    group_id text,
    user_id text,
    "role" text,
    PRIMARY KEY (group_id, user_id),
    FOREIGN KEY (group_id) REFERENCES groups(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE skill_parent (
    id text,
    skill_id text,
    external_id text,
    PRIMARY KEY (id, skill_id),
    FOREIGN KEY (id) REFERENCES skill(id),
    FOREIGN KEY (skill_id) REFERENCES skill(id)
);

CREATE TABLE skill_translation (
    "index" text,
    skill_id text,
    lang text,
    translated_description text,
    translated_name text,
    PRIMARY KEY ("index", skill_id),
    FOREIGN KEY (skill_id) REFERENCES skill(id)
);

CREATE TABLE skill (
    id text,
    creation_date text,
    description text,
    external_id text,
    library_id text,
    modification_date text,
    "name" text,
    "status" text,
    PRIMARY KEY (id)
);

CREATE TABLE course_co_author (
    co_author_id text,
    course_id text,
    PRIMARY KEY (co_author_id, course_id),
    FOREIGN KEY (co_author_id) REFERENCES users(id),
    FOREIGN KEY (course_id) REFERENCES course(id)
);

CREATE TABLE course_translator (
    translator_id text,
    course_id text,
    course_translation_index text,
    PRIMARY KEY (translator_id, course_id, course_translation_index),
    FOREIGN KEY (course_id) REFERENCES course_translation(course_id),
    FOREIGN KEY (course_translation_index) REFERENCES course_translation("index")
);

CREATE TABLE course_translation (
    "index" text,
    course_id text,
    description text,
    lang text,
    "name" text,
    published text,
    PRIMARY KEY ("index", course_id),
    FOREIGN KEY (course_id) REFERENCES course(id)
);

CREATE TABLE course (
    id text,
    author_id text,
    group_id text,
    creation_date text,
    current_version_number text,
    default_lang text,
    description text,
    duration text,
    external_platform text,
    modification_date text,
    "name" text,
    source_lang text,
    "status" text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (author_id) REFERENCES users(id),
    FOREIGN KEY (group_id) REFERENCES groups(id)
);

CREATE TABLE course_stat (
    id text,
    course_id text,
    path_id text,
    path_session_id text,
    user_id text,
    completed_at text,
    first_activity_at text,
    lang text,
    last_activity_at text,
    progress text,
    score text,
    time_spent text,
    version_number text,
    PRIMARY KEY (id),
    FOREIGN KEY (course_id) REFERENCES course(id),
    FOREIGN KEY (path_id) REFERENCES "path"(id),
    FOREIGN KEY (path_session_id) REFERENCES path_session(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);
