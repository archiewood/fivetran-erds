CREATE TABLE user_group (
    groups_id text,
    user_id text,
    PRIMARY KEY (groups_id, user_id),
    FOREIGN KEY (groups_id) REFERENCES groups(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE groups (
    id text,
    date_added text,
    date_edited text,
    is_automatic text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE prerequisite_course_info (
    course_id text,
    prerequisite_id text,
    PRIMARY KEY (course_id, prerequisite_id),
    FOREIGN KEY (course_id) REFERENCES course(id),
    FOREIGN KEY (prerequisite_id) REFERENCES prerequisite(id)
);

CREATE TABLE prerequisite_competency_definition_info (
    "index" text,
    prerequisite_id text,
    competency_definition_id text,
    PRIMARY KEY ("index", prerequisite_id),
    FOREIGN KEY (prerequisite_id) REFERENCES prerequisite(id)
);

CREATE TABLE prerequisite (
    id text,
    "name" text,
    prerequisite_type text,
    required_number text,
    PRIMARY KEY (id)
);

CREATE TABLE venue (
    id text,
    address text,
    city text,
    country text,
    details text,
    max_class_size text,
    meeting_id text,
    "name" text,
    password text,
    phone_number text,
    postal_code text,
    province text,
    "type" text,
    url text,
    username text,
    PRIMARY KEY (id)
);

CREATE TABLE country (
    id text,
    code text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE chapter_enrollment (
    course_id text,
    id text,
    user_id text,
    chapter_id text,
    lesson_id text,
    session_id text,
    course_enrollment_id text,
    date_completed text,
    date_enrolled text,
    date_started text,
    full_name text,
    "name" text,
    progress text,
    score text,
    "status" text,
    time_spent text,
    PRIMARY KEY (course_id, id, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (chapter_id) REFERENCES chapter(id),
    FOREIGN KEY (lesson_id) REFERENCES lesson(id),
    FOREIGN KEY (session_id) REFERENCES "session"(id)
);

CREATE TABLE lesson (
    course_id text,
    id text,
    chapter_id text,
    description text,
    height text,
    "name" text,
    notes text,
    orders text,
    passing_score text,
    ref_id text,
    "type" text,
    url text,
    use_popup text,
    weight text,
    width text,
    PRIMARY KEY (course_id, id),
    FOREIGN KEY (chapter_id) REFERENCES chapter(id)
);

CREATE TABLE session_schedule (
    id text,
    session_id text,
    venue_id text,
    date_end text,
    date_start text,
    meeting_id text,
    meeting_password text,
    meeting_username text,
    time_zone_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (session_id) REFERENCES "session"(id),
    FOREIGN KEY (venue_id) REFERENCES venue(id)
);

CREATE TABLE department (
    id text,
    parent_id text,
    company_name text,
    currency_id text,
    date_added text,
    date_edited text,
    email_address text,
    external_id text,
    "name" text,
    phone_number text,
    use_department_contact_details text,
    PRIMARY KEY (id),
    FOREIGN KEY (parent_id) REFERENCES department(id)
);

CREATE TABLE curriculum_group_course (
    curriculum_group_id text,
    curriculum_id text,
    id text,
    orders text,
    PRIMARY KEY (curriculum_group_id, curriculum_id, id),
    FOREIGN KEY (curriculum_group_id) REFERENCES curriculum_group(id),
    FOREIGN KEY (curriculum_id) REFERENCES curriculum_group(curriculum_id),
    FOREIGN KEY (id) REFERENCES course(id)
);

CREATE TABLE curriculum_group (
    id text,
    curriculum_id text,
    "name" text,
    orders text,
    required_number_of_courses text,
    PRIMARY KEY (id, curriculum_id),
    FOREIGN KEY (curriculum_id) REFERENCES course(id)
);

CREATE TABLE user_role_info (
    role_id text,
    user_id text,
    id text,
    PRIMARY KEY (role_id, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (id) REFERENCES "role"(id)
);

CREATE TABLE user_email_address (
    "index" text,
    user_id text,
    email_address text,
    PRIMARY KEY ("index", user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE user_custom_field (
    "name" text,
    users_id text,
    "value" text,
    PRIMARY KEY ("name", users_id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    country_id text,
    department_id text,
    language_id text,
    province_id text,
    active_status text,
    address text,
    address_2 text,
    city text,
    date_added text,
    date_edited text,
    date_hired text,
    date_terminated text,
    email_address text,
    external_id text,
    first_name text,
    gender text,
    has_username text,
    is_admin text,
    is_instructor text,
    is_learner text,
    job_title text,
    last_login_date text,
    last_name text,
    location text,
    middle_name text,
    notes text,
    password text,
    phone text,
    postal_code text,
    supervisor_id text,
    username text,
    PRIMARY KEY (id),
    FOREIGN KEY (country_id) REFERENCES country(id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (language_id) REFERENCES languages(id),
    FOREIGN KEY (province_id) REFERENCES province(id)
);

CREATE TABLE tags (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE course_resource (
    course_id text,
    resource_id text,
    PRIMARY KEY (course_id, resource_id),
    FOREIGN KEY (course_id) REFERENCES course(id),
    FOREIGN KEY (resource_id) REFERENCES resource(id)
);

CREATE TABLE course_tag (
    course_id text,
    id text,
    PRIMARY KEY (course_id, id),
    FOREIGN KEY (course_id) REFERENCES course(id),
    FOREIGN KEY (id) REFERENCES tags(id)
);

CREATE TABLE course_prerequisite (
    course_id text,
    id text,
    PRIMARY KEY (course_id, id),
    FOREIGN KEY (course_id) REFERENCES course(id),
    FOREIGN KEY (id) REFERENCES course(id)
);

CREATE TABLE course_editor_info (
    "index" text,
    course_id text,
    editor_id text,
    PRIMARY KEY ("index", course_id),
    FOREIGN KEY (course_id) REFERENCES course(id)
);

CREATE TABLE course_enrollment_info (
    enrollment_course_id text,
    course_id text,
    PRIMARY KEY (enrollment_course_id, course_id),
    FOREIGN KEY (course_id) REFERENCES course(id)
);

CREATE TABLE course_price (
    "index" text,
    course_id text,
    price text,
    PRIMARY KEY ("index", course_id),
    FOREIGN KEY (course_id) REFERENCES course(id)
);

CREATE TABLE course_competency_definition (
    "index" text,
    course_id text,
    competency_definition_id text,
    PRIMARY KEY ("index", course_id),
    FOREIGN KEY (course_id) REFERENCES course(id)
);

CREATE TABLE course (
    id text,
    category_id text,
    access_date text,
    active_status text,
    allow_course_evaluation text,
    audience text,
    certificate_url text,
    company_cost text,
    company_time text,
    date_added text,
    date_edited text,
    description text,
    expire_duration_days text,
    expire_duration_hours text,
    expire_duration_months text,
    expire_duration_years text,
    expire_type text,
    expiry_date text,
    external_id text,
    goals text,
    learner_cost text,
    learner_time text,
    "name" text,
    notes text,
    "type" text,
    vendor text,
    PRIMARY KEY (id),
    FOREIGN KEY (category_id) REFERENCES category(id)
);

CREATE TABLE "role" (
    id text,
    date_added text,
    date_edited text,
    description text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE custom_filed_definition_possible_value (
    id text,
    custom_field_definition_id text,
    "name" text,
    PRIMARY KEY (id, custom_field_definition_id),
    FOREIGN KEY (custom_field_definition_id) REFERENCES custom_field_definition(id)
);

CREATE TABLE custom_field_definition (
    id text,
    behavior text,
    custom_field text,
    is_private text,
    "name" text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE user_enrollment (
    id text,
    user_id text,
    certificate_id text,
    course_collection_id text,
    course_id text,
    course_version_id text,
    enrollment_key_id text,
    accepted_terms_and_conditions text,
    access_date text,
    avatar text,
    course_name text,
    credits text,
    date_added text,
    date_completed text,
    date_due text,
    date_edited text,
    date_expire text,
    date_started text,
    full_name text,
    is_active text,
    job_title text,
    progress text,
    score text,
    "status" text,
    time_spent text,
    time_spent_ticks text,
    PRIMARY KEY (id, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (certificate_id) REFERENCES user_certificate(id),
    FOREIGN KEY (course_collection_id) REFERENCES course(id),
    FOREIGN KEY (course_id) REFERENCES course(id),
    FOREIGN KEY (course_version_id) REFERENCES course_version(id),
    FOREIGN KEY (enrollment_key_id) REFERENCES enrollment_key(id)
);

CREATE TABLE category (
    id text,
    parent_id text,
    description text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (parent_id) REFERENCES category(id)
);

CREATE TABLE course_version (
    id text,
    course_id text,
    date_added text,
    "name" text,
    notes text,
    version_number text,
    PRIMARY KEY (id),
    FOREIGN KEY (course_id) REFERENCES course(id)
);

CREATE TABLE competency (
    id text,
    user_id text,
    category_name text,
    date_acquired text,
    "level" text,
    "name" text,
    PRIMARY KEY (id, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE resource (
    id text,
    description text,
    file text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE question_bank_option (
    id text,
    question_bank_question_id text,
    is_correct text,
    "name" text,
    orders text,
    PRIMARY KEY (id, question_bank_question_id),
    FOREIGN KEY (question_bank_question_id) REFERENCES question_bank_question(id)
);

CREATE TABLE question_bank_question (
    id text,
    question_bank_id text,
    attachment text,
    correct_reply text,
    incorrect_reply text,
    "name" text,
    question_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (question_bank_id) REFERENCES question_bank(id)
);

CREATE TABLE lesson_enrollment (
    id text,
    course_id text,
    lesson_id text,
    chapter_enrollment_id text,
    chapter_id text,
    user_id text,
    attempt text,
    course_enrollment_id text,
    date_added text,
    date_completed text,
    date_edited text,
    date_enrolled text,
    date_started text,
    failure text,
    full_name text,
    last_attempt text,
    "name" text,
    progress text,
    score text,
    "status" text,
    time_spent text,
    "type" text,
    PRIMARY KEY (id, course_id, lesson_id),
    FOREIGN KEY (course_id) REFERENCES lesson(course_id),
    FOREIGN KEY (lesson_id) REFERENCES lesson(id),
    FOREIGN KEY (chapter_enrollment_id) REFERENCES chapter_enrollment(id),
    FOREIGN KEY (chapter_id) REFERENCES chapter(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE session_enrollment (
    id text,
    course_id text,
    session_id text,
    user_id text,
    course_enrollment_id text,
    date_completed text,
    date_edited text,
    date_enrolled text,
    date_started text,
    full_name text,
    "name" text,
    progress text,
    score text,
    "status" text,
    time_spent text,
    PRIMARY KEY (id, course_id, session_id),
    FOREIGN KEY (course_id) REFERENCES "session"(instructor_led_course_id),
    FOREIGN KEY (session_id) REFERENCES "session"(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE attendance (
    id text,
    session_id text,
    session_schedule_id text,
    session_enrollment_id text,
    user_id text,
    date_edited text,
    is_present text,
    PRIMARY KEY (id, session_id, session_schedule_id),
    FOREIGN KEY (session_schedule_id) REFERENCES session_schedule(id),
    FOREIGN KEY (session_enrollment_id) REFERENCES session_enrollment(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE session_instructor_info (
    "index" text,
    course_id text,
    session_id text,
    instructor_id text,
    PRIMARY KEY ("index", course_id, session_id),
    FOREIGN KEY (course_id) REFERENCES "session"(instructor_led_course_id),
    FOREIGN KEY (session_id) REFERENCES "session"(id)
);

CREATE TABLE session_approval_info (
    "index" text,
    course_id text,
    session_id text,
    approval_id text,
    PRIMARY KEY ("index", course_id, session_id),
    FOREIGN KEY (course_id) REFERENCES "session"(instructor_led_course_id),
    FOREIGN KEY (session_id) REFERENCES "session"(id),
    FOREIGN KEY (approval_id) REFERENCES users(id)
);

CREATE TABLE session_schedule_info (
    "index" text,
    course_id text,
    session_id text,
    session_schedule_id text,
    PRIMARY KEY ("index", course_id, session_id),
    FOREIGN KEY (course_id) REFERENCES "session"(instructor_led_course_id),
    FOREIGN KEY (session_id) REFERENCES "session"(id)
);

CREATE TABLE "session" (
    id text,
    instructor_led_course_id text,
    allow_self_enrollment text,
    approval_type text,
    attendance_reminder text,
    date_added text,
    date_edited text,
    description text,
    enrollment_end_date text,
    enrollment_start_date text,
    external_id text,
    is_waitlist_enabled text,
    maximum_class_size text,
    minimum_class_size text,
    "name" text,
    notes text,
    PRIMARY KEY (id, instructor_led_course_id)
);

CREATE TABLE languages (
    id text,
    abbreviation text,
    "name" text,
    native_name text,
    PRIMARY KEY (id)
);

CREATE TABLE coupon_course (
    coupon_id text,
    course_id text,
    PRIMARY KEY (coupon_id, course_id),
    FOREIGN KEY (coupon_id) REFERENCES coupon(id),
    FOREIGN KEY (course_id) REFERENCES course(id)
);

CREATE TABLE coupon (
    id text,
    department_id text,
    code text,
    date_added text,
    date_edited text,
    description text,
    discount text,
    discount_type text,
    expiry_date text,
    is_active text,
    max_uses text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (department_id) REFERENCES department(id)
);

CREATE TABLE user_certificate (
    id text,
    user_id text,
    enrollment_id text,
    acquired_date text,
    course_name text,
    date_added text,
    date_edited text,
    expiry_date text,
    full_name text,
    notes text,
    PRIMARY KEY (id, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (enrollment_id) REFERENCES user_enrollment(id)
);

CREATE TABLE user_session_detail_class (
    id text,
    _fivetran_id text,
    user_id text,
    session_id text,
    venue_id text,
    meeting_description text,
    meeting_url text,
    timezone text,
    utc_end_date text,
    utc_start_date text,
    PRIMARY KEY (id, _fivetran_id, user_id),
    FOREIGN KEY (_fivetran_id) REFERENCES user_session_detail(_fivetran_id),
    FOREIGN KEY (user_id) REFERENCES user_session_detail(user_id),
    FOREIGN KEY (session_id) REFERENCES "session"(id),
    FOREIGN KEY (venue_id) REFERENCES venue(id)
);

CREATE TABLE user_session_detail (
    _fivetran_id text,
    instructor_led_course_id text,
    user_id text,
    approval_type text,
    description text,
    enrollment_count text,
    enrollment_end_date text,
    enrollment_limit text,
    enrollment_minimum text,
    enrollment_start_date text,
    id text,
    is_waitlist_enabled text,
    "name" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (instructor_led_course_id) REFERENCES course(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE chapter_lesson (
    chapter_id text,
    lesson_id text,
    PRIMARY KEY (chapter_id, lesson_id),
    FOREIGN KEY (chapter_id) REFERENCES chapter(id),
    FOREIGN KEY (lesson_id) REFERENCES lesson(id)
);

CREATE TABLE chapter (
    id text,
    "name" text,
    orders text,
    PRIMARY KEY (id)
);

CREATE TABLE question_bank (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE province (
    id text,
    country_id text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (country_id) REFERENCES country(id)
);

CREATE TABLE enrollment_key_course (
    course_id text,
    enrollment_key_id text,
    course_collection_id text,
    session_id text,
    PRIMARY KEY (course_id, enrollment_key_id),
    FOREIGN KEY (course_id) REFERENCES course(id),
    FOREIGN KEY (enrollment_key_id) REFERENCES enrollment_key(id),
    FOREIGN KEY (course_collection_id) REFERENCES course(id),
    FOREIGN KEY (session_id) REFERENCES "session"(id)
);

CREATE TABLE enrollment_key_signup_field (
    "index" text,
    enrollment_key_id text,
    custom_field_definition_id text,
    behavior text,
    default_value text,
    is_behavior_changeable text,
    "name" text,
    "type" text,
    PRIMARY KEY ("index", enrollment_key_id),
    FOREIGN KEY (enrollment_key_id) REFERENCES enrollment_key(id),
    FOREIGN KEY (custom_field_definition_id) REFERENCES custom_field_definition(id)
);

CREATE TABLE enrollment_key (
    id text,
    department_id text,
    language_id text,
    date_added text,
    date_edited text,
    expiry_date text,
    external_id text,
    key_name text,
    max_uses text,
    "name" text,
    send_new_user_message_on_enrollment text,
    start_date text,
    times_used text,
    user_enrollment_id text,
    username_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (language_id) REFERENCES languages(id)
);
