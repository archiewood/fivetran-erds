CREATE TABLE student_submission_history (
    "index" text,
    course_id text,
    course_work_id text,
    student_submission_id text,
    grade_change_type text,
    grade_history_actor_user_id text,
    grade_max_points text,
    grade_timestamp text,
    points_earned text,
    "state" text,
    state_history_actor_user_id text,
    state_timestamp text,
    PRIMARY KEY ("index", course_id, course_work_id, student_submission_id),
    FOREIGN KEY (course_id) REFERENCES student_submission(course_id),
    FOREIGN KEY (course_work_id) REFERENCES student_submission(course_work_id),
    FOREIGN KEY (student_submission_id) REFERENCES student_submission(id)
);

CREATE TABLE student_submission_attachment (
    "index" text,
    course_id text,
    course_work_id text,
    student_submission_id text,
    drive_file_alternate_link text,
    drive_file_id text,
    drive_file_thumbnail_url text,
    drive_file_title text,
    form_response_url text,
    form_thumbnail_url text,
    form_title text,
    form_url text,
    link_thumbnail_url text,
    link_title text,
    link_url text,
    youtube_video_alternate_link text,
    youtube_video_id text,
    youtube_video_thumbnail_url text,
    youtube_video_title text,
    PRIMARY KEY ("index", course_id, course_work_id, student_submission_id),
    FOREIGN KEY (course_id) REFERENCES student_submission(course_id),
    FOREIGN KEY (course_work_id) REFERENCES student_submission(course_work_id),
    FOREIGN KEY (student_submission_id) REFERENCES student_submission(id)
);

CREATE TABLE student_submission (
    id text,
    course_id text,
    course_work_id text,
    user_id text,
    alternate_link text,
    assigned_grade text,
    associated_with_developer text,
    course_work_type text,
    creation_time text,
    draft_grade text,
    late text,
    multiple_choice_submission_answer text,
    preview_version text,
    short_answer_submission_answer text,
    "state" text,
    update_time text,
    PRIMARY KEY (id, course_id, course_work_id),
    FOREIGN KEY (course_id) REFERENCES course_work(course_id),
    FOREIGN KEY (course_work_id) REFERENCES course_work(id),
    FOREIGN KEY (user_id) REFERENCES student(id)
);

CREATE TABLE course_material_set (
    "index" text,
    course_id text,
    drive_file_alternate_link text,
    drive_file_id text,
    drive_file_thumbnail_url text,
    drive_file_title text,
    form_response_url text,
    form_thumbnail_url text,
    form_title text,
    form_url text,
    link_thumbnai_lurl text,
    link_title text,
    link_url text,
    title text,
    youtube_video_alternate_link text,
    youtube_video_id text,
    youtube_video_thumbnail_url text,
    youtube_video_title text,
    PRIMARY KEY ("index", course_id),
    FOREIGN KEY (course_id) REFERENCES course(id)
);

CREATE TABLE course_grade_category (
    id text,
    course_id text,
    default_grade_denominator text,
    "name" text,
    weight text,
    PRIMARY KEY (id, course_id),
    FOREIGN KEY (course_id) REFERENCES course(id)
);

CREATE TABLE course (
    id text,
    alternate_link text,
    calendar_id text,
    course_group_email text,
    course_state text,
    creation_time text,
    description_heading text,
    enrollment_code text,
    gradebook_setting_calculation_type text,
    gradebook_setting_display_setting text,
    guardians_enabled text,
    "name" text,
    owner_id text,
    "section" text,
    teacher_folder_alternate_link text,
    teacher_folder_id text,
    teacher_folder_title text,
    teacher_group_email text,
    update_time text,
    PRIMARY KEY (id)
);

CREATE TABLE student_permission (
    "index" text,
    student_course_id text,
    student_id text,
    permission text,
    PRIMARY KEY ("index", student_course_id, student_id),
    FOREIGN KEY (student_course_id) REFERENCES student(course_id),
    FOREIGN KEY (student_id) REFERENCES student(id)
);

CREATE TABLE student (
    id text,
    course_id text,
    profile_email_address text,
    profile_family_name text,
    profile_full_name text,
    profile_given_name text,
    profile_photo_url text,
    profile_verified_teacher text,
    student_work_folder_alternate_link text,
    student_work_folder_id text,
    student_work_folder_title text,
    PRIMARY KEY (id, course_id),
    FOREIGN KEY (course_id) REFERENCES course(id)
);

CREATE TABLE course_work_material (
    "index" text,
    course_id text,
    course_work_id text,
    drive_file_alternate_link text,
    drive_file_id text,
    drive_file_thumbnail_url text,
    drive_file_title text,
    form_response_url text,
    form_thumbnail_url text,
    form_title text,
    form_url text,
    link_thumbnai_lurl text,
    link_title text,
    link_url text,
    share_mode text,
    youtube_video_alternate_link text,
    youtube_video_id text,
    youtube_video_thumbnail_url text,
    youtube_video_title text,
    PRIMARY KEY ("index", course_id, course_work_id),
    FOREIGN KEY (course_id) REFERENCES course_work(course_id),
    FOREIGN KEY (course_work_id) REFERENCES course_work(id)
);

CREATE TABLE course_work_multiple_choice_question (
    "index" text,
    course_id text,
    course_work_id text,
    choice text,
    PRIMARY KEY ("index", course_id, course_work_id),
    FOREIGN KEY (course_id) REFERENCES course_work(course_id),
    FOREIGN KEY (course_work_id) REFERENCES course_work(id)
);

CREATE TABLE course_work_student (
    course_id text,
    course_work_id text,
    student_id text,
    PRIMARY KEY (course_id, course_work_id, student_id),
    FOREIGN KEY (course_id) REFERENCES course_work(course_id),
    FOREIGN KEY (course_work_id) REFERENCES course_work(id),
    FOREIGN KEY (student_id) REFERENCES student(id)
);

CREATE TABLE course_work (
    id text,
    course_id text,
    alternate_link text,
    assignee_mode text,
    associated_with_developer text,
    creation_time text,
    creator_user_id text,
    description text,
    due_date_day text,
    due_date_month text,
    due_date_year text,
    due_time_hours text,
    due_time_minutes text,
    grade_category_default_grade_denominator text,
    grade_category_id text,
    grade_category_name text,
    grade_category_weight text,
    grading_period_id text,
    max_points text,
    preview_version text,
    scheduled_time text,
    "state" text,
    student_work_folder_alternate_link text,
    student_work_folder_id text,
    student_work_folder_title text,
    submission_modification_mode text,
    title text,
    topic_id text,
    update_time timestamp,
    work_type text,
    PRIMARY KEY (id, course_id),
    FOREIGN KEY (course_id) REFERENCES course(id)
);

CREATE TABLE teacher_permission (
    "index" text,
    teacher_course_id text,
    teacher_id text,
    permission text,
    PRIMARY KEY ("index", teacher_course_id, teacher_id),
    FOREIGN KEY (teacher_course_id) REFERENCES teacher(course_id),
    FOREIGN KEY (teacher_id) REFERENCES teacher(id)
);

CREATE TABLE teacher (
    id text,
    course_id text,
    profile_email_address text,
    profile_family_name text,
    profile_full_name text,
    profile_given_name text,
    profile_photo_url text,
    profile_verified_teacher text,
    PRIMARY KEY (id, course_id),
    FOREIGN KEY (course_id) REFERENCES course(id)
);
