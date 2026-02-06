CREATE TABLE user_assessment_activity (
    assessment_id text,
    user_id text,
    user_email text,
    assessment_title text,
    assigned_by text,
    assigned_due_date text,
    assigned_on text,
    highest_proficiency_level text,
    interacted_with_guidance text,
    last_activity_date text,
    number_of_attempt text,
    number_of_completed_assessment text,
    total_time_spent text,
    PRIMARY KEY (assessment_id, user_id),
    FOREIGN KEY (user_email) REFERENCES user_activity(user_email)
);

CREATE TABLE learning_activity_attempt (
    user_email text,
    course_id text,
    item_id text,
    course_category text,
    item_completion_ratio text,
    item_completion_time text,
    item_final_result text,
    item_marked_complete text,
    item_start_time text,
    item_title text,
    item_type text,
    item_views text,
    PRIMARY KEY (user_email),
    FOREIGN KEY (user_email) REFERENCES user_activity(user_email),
    FOREIGN KEY (course_id) REFERENCES course(id),
    FOREIGN KEY (item_id) REFERENCES learning_path_section_item(id)
);

CREATE TABLE course_category (
    category text,
    "index" text,
    course_id text,
    PRIMARY KEY (category, "index", course_id),
    FOREIGN KEY (course_id) REFERENCES course(id)
);

CREATE TABLE course_topic (
    "index" text,
    course_id text,
    id text,
    title text,
    url text,
    PRIMARY KEY ("index", course_id),
    FOREIGN KEY (course_id) REFERENCES course(id)
);

CREATE TABLE course_promo_video (
    "index" text,
    course_id text,
    file text,
    label text,
    "type" text,
    PRIMARY KEY ("index", course_id),
    FOREIGN KEY (course_id) REFERENCES course(id)
);

CREATE TABLE course_instructor (
    "index" text,
    instructor text,
    course_id text,
    PRIMARY KEY ("index", instructor, course_id),
    FOREIGN KEY (course_id) REFERENCES course(id)
);

CREATE TABLE course_requirement_list (
    "index" text,
    requirement_list text,
    course_id text,
    PRIMARY KEY ("index", requirement_list, course_id),
    FOREIGN KEY (course_id) REFERENCES course(id)
);

CREATE TABLE course_learn_list (
    learning_list text,
    course_id text,
    PRIMARY KEY (learning_list, course_id),
    FOREIGN KEY (course_id) REFERENCES course(id)
);

CREATE TABLE course_caption_language (
    caption_language text,
    course_id text,
    PRIMARY KEY (caption_language, course_id),
    FOREIGN KEY (course_id) REFERENCES course(id)
);

CREATE TABLE course_caption_locale (
    "index" text,
    course_id text,
    english_title text,
    locale text,
    title text,
    PRIMARY KEY ("index", course_id),
    FOREIGN KEY (course_id) REFERENCES course(id)
);

CREATE TABLE course (
    id text,
    accreditation jsonb,
    description text,
    estimated_content_length text,
    estimated_content_length_video text,
    has_closed_caption text,
    headline text,
    images_size_100_x_100 text,
    images_size_125_h text,
    images_size_200_h text,
    images_size_240_x_135 text,
    images_size_304_x_171 text,
    images_size_480_x_270 text,
    images_size_48_x_27 text,
    images_size_50_x_50 text,
    images_size_750_x_422 text,
    images_size_75_x_75 text,
    images_size_96_x_54 text,
    is_custom text,
    is_imported text,
    is_practice_test_course text,
    last_update_date text,
    "level" text,
    locale_locale text,
    mobile_native_deeplink text,
    num_lectures text,
    num_practice_tests text,
    num_quizzes text,
    num_videos text,
    primary_category_id text,
    primary_category_title text,
    primary_category_url text,
    primary_subcategory_id text,
    primary_subcategory_title text,
    primary_subcategory_url text,
    title text,
    url text,
    xapi_activity_id text,
    PRIMARY KEY (id)
);

CREATE TABLE user_path_activity (
    id text,
    user_email text,
    completion_ratio text,
    is_path_assigned text,
    is_private_path text,
    is_pro_path text,
    lms_user_id text,
    path_assigned_by text,
    path_assigned_due_date text,
    path_assigned_on text,
    path_completion_date text,
    path_consumed_minutes text,
    path_enrolled_date text,
    path_first_activity_date text,
    path_last_activity_date text,
    PRIMARY KEY (id),
    FOREIGN KEY (user_email) REFERENCES user_activity(user_email)
);

CREATE TABLE user_activity (
    user_email text,
    last_date_visit text,
    num_completed_courses text,
    num_completed_lectures text,
    num_completed_quizzes text,
    num_new_assigned_courses text,
    num_new_enrolled_courses text,
    num_new_started_courses text,
    num_video_consumed_minutes text,
    num_web_visited_days text,
    user_external_id text,
    user_is_deactivated text,
    user_joined_date text,
    user_name text,
    user_role text,
    user_surname text,
    PRIMARY KEY (user_email)
);

CREATE TABLE learning_path_editor (
    "index" text,
    learning_path_id text,
    display_name text,
    email text,
    lms_user_id text,
    PRIMARY KEY ("index", learning_path_id),
    FOREIGN KEY (learning_path_id) REFERENCES learning_path(id)
);

CREATE TABLE learning_path_section_item (
    id text,
    section_id text,
    duration text,
    number_of_items text,
    orders text,
    resource_url text,
    thumbnail_size_100_x_100 text,
    thumbnail_size_125_h text,
    thumbnail_size_200_h text,
    thumbnail_size_240_x_135 text,
    thumbnail_size_304_x_171 text,
    thumbnail_size_480_x_270 text,
    thumbnail_size_48_x_27 text,
    thumbnail_size_50_x_50 text,
    thumbnail_size_750_x_422 text,
    thumbnail_size_75_x_75 text,
    thumbnail_size_96_x_54 text,
    title text,
    "type" text,
    url text,
    PRIMARY KEY (id, section_id),
    FOREIGN KEY (section_id) REFERENCES learning_path_section(id)
);

CREATE TABLE learning_path_section (
    id text,
    learning_path_id text,
    description text,
    orders text,
    title text,
    PRIMARY KEY (id, learning_path_id),
    FOREIGN KEY (learning_path_id) REFERENCES learning_path(id)
);

CREATE TABLE learning_path_locale (
    "index" text,
    learning_path_id text,
    locale text,
    PRIMARY KEY ("index", learning_path_id),
    FOREIGN KEY (learning_path_id) REFERENCES learning_path(id)
);

CREATE TABLE learning_path_category (
    "index" text,
    learning_path_id text,
    category text,
    PRIMARY KEY ("index", learning_path_id),
    FOREIGN KEY (learning_path_id) REFERENCES learning_path(id)
);

CREATE TABLE learning_path_folder (
    id text,
    learning_path_id text,
    description text,
    title text,
    PRIMARY KEY (id, learning_path_id),
    FOREIGN KEY (learning_path_id) REFERENCES learning_path(id)
);

CREATE TABLE learning_path (
    title text,
    id text,
    created text,
    description text,
    estimated_content_length text,
    is_pro_path text,
    last_modified text,
    number_of_content_item text,
    url text,
    PRIMARY KEY (title, id),
    FOREIGN KEY (id) REFERENCES user_path_activity(id)
);

CREATE TABLE user_course_activity (
    user_id text,
    course_id text,
    user_email text,
    assigned_by text,
    completion_ratio text,
    course_category text,
    course_completion_date text,
    course_duration text,
    course_enroll_date text,
    course_first_completion_date text,
    course_last_accessed_date text,
    course_start_date text,
    course_title text,
    is_assigned text,
    is_user_deactivated text,
    lms_user_id text,
    num_video_consumed_minutes text,
    user_external_id text,
    user_name text,
    user_role text,
    user_surname text,
    PRIMARY KEY (user_id, course_id),
    FOREIGN KEY (course_id) REFERENCES course(id),
    FOREIGN KEY (user_email) REFERENCES user_activity(user_email)
);

CREATE TABLE user_lab_activtiy (
    lab_id text,
    user_email text,
    lab_assigned_by text,
    lab_assigned_due_date text,
    lab_assigned_on text,
    lab_completed text,
    lab_started text,
    lab_title text,
    last_activity_date text,
    total_time_spent text,
    PRIMARY KEY (lab_id, user_email),
    FOREIGN KEY (user_email) REFERENCES user_activity(user_email)
);
