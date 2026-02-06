CREATE TABLE location (
    id text,
    address_1 text,
    address_2 text,
    address_3 text,
    country_code text,
    notes text,
    timezone text,
    title text,
    PRIMARY KEY (id)
);

CREATE TABLE groups (
    id text,
    created_at text,
    description text,
    number_of_members text,
    title text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE course_instructor (
    id text,
    course_id text,
    created_at text,
    enrollment_count text,
    updated_at text,
    version text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES users(id),
    FOREIGN KEY (course_id) REFERENCES course(id)
);

CREATE TABLE course_custom_data_field_value (
    "index" text,
    course_id text,
    definition_id text,
    "value" jsonb,
    PRIMARY KEY ("index", course_id, definition_id),
    FOREIGN KEY (course_id) REFERENCES course(id),
    FOREIGN KEY (definition_id) REFERENCES custom_data_field_definition(id)
);

CREATE TABLE course (
    id text,
    owner_id text,
    source_id text,
    allow_users_rate_course text,
    cataloged text,
    course_length_unit text,
    created_at text,
    credits_to_be_awarded text,
    date_published text,
    description_text text,
    difficulty_level text,
    due_date_after_enrollment text,
    due_date_reminder_days text,
    due_date_reminder_days_2 text,
    due_days_after_enrollment text,
    keywords text,
    license_expire text,
    license_has_unlimited_enrollments text,
    license_is_open_ended text,
    license_number_enrollments_purchased text,
    manager_can_enroll text,
    minute_length text,
    "name" text,
    num_completed text,
    num_enrolled text,
    num_failed text,
    num_in_progress text,
    num_not_started text,
    num_passed text,
    num_pending_review text,
    number_of_modules text,
    number_of_reviews text,
    number_of_stars text,
    objectives_text text,
    price text,
    published_status_id text,
    reference_code text,
    sellable text,
    send_due_date_reminders text,
    thumbnail_image_url text,
    version text,
    PRIMARY KEY (id),
    FOREIGN KEY (owner_id) REFERENCES users(id),
    FOREIGN KEY (source_id) REFERENCES course(id)
);

CREATE TABLE group_membership (
    group_id text,
    id text,
    locale text,
    PRIMARY KEY (group_id, id),
    FOREIGN KEY (group_id) REFERENCES groups(id),
    FOREIGN KEY (id) REFERENCES users(id)
);

CREATE TABLE custom_data_field_definition (
    id text,
    custom_type text,
    label text,
    type_id text,
    PRIMARY KEY (id)
);

CREATE TABLE enrollment (
    id text,
    course_id text,
    group_id text,
    user_id text,
    cert_expires_at text,
    certificate_name text,
    course_access_expires_at text,
    date_completed text,
    date_enrolled text,
    date_lastaccessed text,
    date_started text,
    due_date text,
    from_catalog text,
    from_store text,
    has_attempts_remaining text,
    is_overdue text,
    percentage text,
    percentage_complete text,
    "status" text,
    unenrolled text,
    updated_at text,
    was_recertified text,
    PRIMARY KEY (id),
    FOREIGN KEY (course_id) REFERENCES course(id),
    FOREIGN KEY (group_id) REFERENCES groups(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE module (
    id text,
    course_id text,
    creator_id text,
    location_id text,
    assignment_passing_percentage text,
    assignment_question_text text,
    component_type text,
    created_at text,
    description_text text,
    end_at text,
    exam_id text,
    location_state_code text,
    max_capacity text,
    number_enrolled_on_session text,
    number_of_linked_courses text,
    "sequence" text,
    session_id text,
    session_tutor_id text,
    start_at text,
    tags text,
    timezone text,
    title text,
    training_id text,
    tutor_email text,
    tutor_first_name text,
    tutor_last_name text,
    tutor_username text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (course_id) REFERENCES course(id),
    FOREIGN KEY (creator_id) REFERENCES users(id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE group_manager (
    id text,
    group_id text,
    user_id text,
    can_create_users text,
    created_at text,
    number_of_courses text,
    number_of_members text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (group_id) REFERENCES groups(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE group_course (
    id text,
    course_id text,
    group_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (course_id) REFERENCES course(id),
    FOREIGN KEY (group_id) REFERENCES groups(id)
);

CREATE TABLE markcomplete (
    id text,
    user_id text,
    action_source_type text,
    created_at text,
    date_completed text,
    notes text,
    percentage text,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE learning_path (
    id text,
    cataloged text,
    created_at text,
    credits_to_be_awarded text,
    date_published text,
    description_text text,
    difficulty_level text,
    due_date_after_enrollment text,
    due_date_reminder_days text,
    due_date_reminder_days_2 text,
    due_days_after_enrollment text,
    keywords text,
    minute_length text,
    "name" text,
    path_length_unit text,
    price text,
    published_status_id text,
    sellable text,
    send_due_date_reminder text,
    thumbnail_image_url text,
    PRIMARY KEY (id)
);

CREATE TABLE learning_path_enrollment (
    id text,
    learning_path_id text,
    user_id text,
    cert_expires_at text,
    certificate_name text,
    date_completed text,
    date_enrolled text,
    date_last_accessed text,
    date_started text,
    due_date text,
    percentage text,
    "status" text,
    unenrolled text,
    was_recertified text,
    PRIMARY KEY (id),
    FOREIGN KEY (learning_path_id) REFERENCES learning_path(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE user_custom_data_field_value (
    "index" text,
    definition_id text,
    user_id text,
    "value" jsonb,
    PRIMARY KEY ("index", definition_id, user_id),
    FOREIGN KEY (definition_id) REFERENCES custom_data_field_definition(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE user_custom_data (
    "name" text,
    user_id text,
    "value" text,
    PRIMARY KEY ("name", user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    account_expires text,
    can_act_as_instructor text,
    can_delete_users text,
    can_enroll text,
    can_manage_sessions text,
    can_manage_trainings text,
    can_mark_complete text,
    can_move_groups text,
    can_unenroll_users text,
    created_at text,
    email text,
    enabled text,
    first_name text,
    is_salesforce_contact text,
    languages text,
    last_name text,
    last_sign_in_at text,
    locale text,
    membership_type text,
    number_of_badges text,
    number_of_enrollments text,
    number_of_enrollments_accessed text,
    number_of_points text,
    sf_contact_id text,
    sf_user_id text,
    sign_in_count text,
    timezone_id text,
    tutor_can_create_courses text,
    tutor_can_edit_their_courses text,
    updated_at text,
    user_type text,
    username text,
    PRIMARY KEY (id)
);

CREATE TABLE group_invitie_custom_data_field_definition (
    id text,
    label text,
    type_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES group_invitie_custom_data_field_value(definition_id)
);

CREATE TABLE group_invitie_custom_data_field_value (
    definition_id text,
    group_invitie_id text,
    "value" text,
    PRIMARY KEY (definition_id, group_invitie_id),
    FOREIGN KEY (group_invitie_id) REFERENCES group_invitie(id)
);

CREATE TABLE group_invitie (
    id text,
    group_id text,
    accept_url text,
    created_at text,
    expires_at text,
    first_name text,
    invite_email_address text,
    invite_status text,
    last_name text,
    last_reminder_sent_at text,
    num_reminders_sent text,
    sf_contact_id text,
    sf_user_id text,
    user_type text,
    username text,
    PRIMARY KEY (id),
    FOREIGN KEY (group_id) REFERENCES groups(id)
);

CREATE TABLE group_invite_course_enrollment (
    id text,
    course_id text,
    group_id text,
    group_invite_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (course_id) REFERENCES course(id),
    FOREIGN KEY (group_id) REFERENCES groups(id),
    FOREIGN KEY (group_invite_id) REFERENCES group_invitie(id)
);
