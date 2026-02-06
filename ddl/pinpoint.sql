CREATE TABLE location (
    id text,
    equality_monitoring_template_id text,
    city text,
    country_code text,
    created_at text,
    "name" text,
    postal_code text,
    province text,
    street_address text,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (equality_monitoring_template_id) REFERENCES equality_monitoring_template(id)
);

CREATE TABLE application_custom_attributes_data (
    application_id text,
    custom_attribute_id text,
    PRIMARY KEY (application_id, custom_attribute_id),
    FOREIGN KEY (application_id) REFERENCES application(id),
    FOREIGN KEY (custom_attribute_id) REFERENCES custom_attribute(id)
);

CREATE TABLE application_answer_data (
    answer_id text,
    application_id text,
    PRIMARY KEY (answer_id, application_id),
    FOREIGN KEY (answer_id) REFERENCES answer(id),
    FOREIGN KEY (application_id) REFERENCES application(id)
);

CREATE TABLE application_scorecard_rating_data (
    application_id text,
    scorecard_rating_id text,
    PRIMARY KEY (application_id, scorecard_rating_id),
    FOREIGN KEY (application_id) REFERENCES application(id),
    FOREIGN KEY (scorecard_rating_id) REFERENCES scorecard_rating(id)
);

CREATE TABLE application_scorecard_note_data (
    application_id text,
    scorecard_note_id text,
    PRIMARY KEY (application_id, scorecard_note_id),
    FOREIGN KEY (application_id) REFERENCES application(id),
    FOREIGN KEY (scorecard_note_id) REFERENCES scorecard_note(id)
);

CREATE TABLE application_scorecard_answer_data (
    application_id text,
    scorecard_answer_id text,
    PRIMARY KEY (application_id, scorecard_answer_id),
    FOREIGN KEY (application_id) REFERENCES application(id),
    FOREIGN KEY (scorecard_answer_id) REFERENCES scorecard_answer(id)
);

CREATE TABLE application_comment_data (
    application_id text,
    comment_id text,
    PRIMARY KEY (application_id, comment_id),
    FOREIGN KEY (application_id) REFERENCES application(id),
    FOREIGN KEY (comment_id) REFERENCES "comment"(id)
);

CREATE TABLE application_attachment (
    "index" text,
    application_id text,
    context text,
    filename text,
    url text,
    PRIMARY KEY ("index", application_id),
    FOREIGN KEY (application_id) REFERENCES application(id)
);

CREATE TABLE application_tag (
    "index" text,
    application_id text,
    context text,
    "name" text,
    PRIMARY KEY ("index", application_id),
    FOREIGN KEY (application_id) REFERENCES application(id)
);

CREATE TABLE application (
    id text,
    job_id text,
    stage_id text,
    address_1 text,
    address_2 text,
    average_rating text,
    channel text,
    channel_source text,
    concealed text,
    country text,
    created_at text,
    date_of_birth text,
    email text,
    first_name text,
    full_name text,
    hired_at text,
    internal_candidate text,
    is_demo text,
    last_name text,
    linkedin_url text,
    locale text,
    national_identifier text,
    offers_data jsonb,
    onboarding_application_data text,
    phone text,
    phone_iso_2 text,
    postcode text,
    preferred_pronouns text,
    rejected_at text,
    start_on text,
    summary text,
    town text,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (job_id) REFERENCES job(id),
    FOREIGN KEY (stage_id) REFERENCES stage(id)
);

CREATE TABLE equality_monitoring_option (
    id text,
    created_at text,
    "name" text,
    "position" text,
    "type" text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE division (
    id text,
    created_at text,
    "name" text,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE "comment" (
    id text,
    user_id text,
    body_text text,
    commentable_id text,
    commentable_type text,
    created_at text,
    private_comment text,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE question (
    id text,
    additional_information text,
    created_at text,
    max_num_required_answer_options text,
    multiple_choice_options text,
    num_required_answer_options text,
    question_type text,
    required text,
    title text,
    "type" text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE stage (
    id text,
    basic_type text,
    created_at text,
    description text,
    external_name text,
    "name" text,
    "position" text,
    "type" text,
    updated_at text,
    visible text,
    PRIMARY KEY (id)
);

CREATE TABLE job_question_data (
    job_id text,
    question_id text,
    PRIMARY KEY (job_id, question_id),
    FOREIGN KEY (job_id) REFERENCES job(id),
    FOREIGN KEY (question_id) REFERENCES question(id)
);

CREATE TABLE job_custom_attribute_data (
    custom_attribute_id text,
    job_id text,
    PRIMARY KEY (custom_attribute_id, job_id),
    FOREIGN KEY (custom_attribute_id) REFERENCES custom_attribute(id),
    FOREIGN KEY (job_id) REFERENCES job(id)
);

CREATE TABLE job (
    id text,
    department_id text,
    division_id text,
    hiring_manager_user_id text,
    location_id text,
    recruitment_manager_user_id text,
    structure_custom_group_one_id text,
    application_form_url text,
    benefits text,
    benefits_header text,
    compensation text,
    compensation_currency text,
    compensation_frequency text,
    compensation_maximum text,
    compensation_minimum text,
    compensation_visible text,
    created_at text,
    deadline_at text,
    description text,
    employment_type text,
    employment_type_text text,
    key_responsibilities text,
    key_responsibilities_header text,
    opened_at text,
    "path" text,
    remote text,
    reporting_to text,
    requisition_id text,
    skills_knowledge_expertise text,
    skills_knowledge_expertise_header text,
    "status" text,
    title text,
    "type" text,
    updated_at timestamp,
    url text,
    visibility text,
    workplace_type text,
    workplace_type_text text,
    PRIMARY KEY (id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (division_id) REFERENCES division(id),
    FOREIGN KEY (hiring_manager_user_id) REFERENCES users(id),
    FOREIGN KEY (location_id) REFERENCES location(id),
    FOREIGN KEY (recruitment_manager_user_id) REFERENCES users(id),
    FOREIGN KEY (structure_custom_group_one_id) REFERENCES structure_custom_group_one(id)
);

CREATE TABLE scorecard_note (
    id text,
    user_id text,
    body text,
    scorecard_id text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE scorecard_answer (
    id text,
    user_id text,
    question_id text,
    text_answer text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE answer (
    id text,
    additional_information text,
    boolean_answer text,
    created_at text,
    date_answer text,
    document_answer text,
    multiple_choice_answer text,
    question_type text,
    text_answer text,
    title text,
    "type" text,
    updated_at text,
    url_answer text,
    PRIMARY KEY (id)
);

CREATE TABLE scorecard_rating (
    id text,
    user_id text,
    score text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE job_seeker_custom_attributes_data (
    custom_attribute_id text,
    job_seeker_id text,
    PRIMARY KEY (custom_attribute_id, job_seeker_id),
    FOREIGN KEY (custom_attribute_id) REFERENCES custom_attribute(id),
    FOREIGN KEY (job_seeker_id) REFERENCES job_seeker(id)
);

CREATE TABLE job_seeker_answer_data (
    answer_id text,
    job_seeker_id text,
    PRIMARY KEY (answer_id, job_seeker_id),
    FOREIGN KEY (answer_id) REFERENCES answer(id),
    FOREIGN KEY (job_seeker_id) REFERENCES job_seeker(id)
);

CREATE TABLE job_seeker (
    id text,
    address_1 text,
    address_2 text,
    channel text,
    channel_source text,
    comments_data jsonb,
    country text,
    created_at text,
    date_of_birth text,
    email text,
    first_name text,
    full_name text,
    last_name text,
    locale text,
    phone text,
    phone_iso_2 text,
    pipeline_source text,
    postcode text,
    summary text,
    town text,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE department (
    id text,
    created_at text,
    "name" text,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE equality_monitoring_template (
    id text,
    created_at text,
    "name" text,
    "type" text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE onboarding_application (
    id text,
    application_id text,
    created_at text,
    start_at text,
    "status" text,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (application_id) REFERENCES application(id)
);

CREATE TABLE interview_part_data (
    id text,
    interview_id text,
    "type" text,
    PRIMARY KEY (id, interview_id),
    FOREIGN KEY (interview_id) REFERENCES interview(id)
);

CREATE TABLE interview (
    id text,
    stage_id text,
    created_at text,
    end_at text,
    interviewable_id text,
    interviewable_type text,
    start_at text,
    "status" text,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (stage_id) REFERENCES stage(id)
);

CREATE TABLE structure_custom_group_one (
    id text,
    created_at text,
    "name" text,
    title text,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE equality_monitoring_options_data (
    equality_monitoring_category_id text,
    equality_monitoring_option_id text,
    PRIMARY KEY (equality_monitoring_category_id, equality_monitoring_option_id),
    FOREIGN KEY (equality_monitoring_category_id) REFERENCES equality_monitoring_category(id),
    FOREIGN KEY (equality_monitoring_option_id) REFERENCES equality_monitoring_option(id)
);

CREATE TABLE equality_monitoring_category (
    id text,
    created_at text,
    enabled text,
    "name" text,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE custom_attribute (
    id text,
    created_at text,
    field_name text,
    "type" text,
    updated_at text,
    "value" text,
    PRIMARY KEY (id)
);

CREATE TABLE users (
    id text,
    created_at text,
    email text,
    first_name text,
    last_name text,
    time_zone text,
    "type" text,
    updated_at text,
    PRIMARY KEY (id)
);
