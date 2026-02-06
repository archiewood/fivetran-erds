CREATE TABLE domain (
    id text,
    access text,
    access_code_message_html text,
    catalog_title text,
    marketing_message text,
    "name" text,
    private text,
    PRIMARY KEY (id)
);

CREATE TABLE course_series (
    domain_name text,
    id text,
    offer text,
    published_course_count text,
    series_url text,
    title text,
    visible_on_catalog text,
    PRIMARY KEY (domain_name, id)
);

CREATE TABLE groups (
    id text,
    "name" text,
    user_count text,
    PRIMARY KEY (id)
);

CREATE TABLE users_published_course_all_enrollment (
    enrollment_id text,
    user_id text,
    user_published_course_id text,
    active text,
    course_progress_id text,
    expires_at text,
    PRIMARY KEY (enrollment_id, user_id, user_published_course_id),
    FOREIGN KEY (enrollment_id) REFERENCES published_course_enrollment(id),
    FOREIGN KEY (user_id) REFERENCES users_published_course(user_id),
    FOREIGN KEY (user_published_course_id) REFERENCES users_published_course(course_id)
);

CREATE TABLE users_published_course (
    course_id text,
    id text,
    user_id text,
    domain_name text,
    enrollment_id text,
    certificate text,
    course_lesson_count text,
    course_progress_completed_at text,
    course_progress_completed_lesson_count text,
    course_progress_completed_required_lesson_count text,
    course_progress_credit_unit_plural text,
    course_progress_credits_earned text,
    course_progress_id text,
    course_progress_latest_activity text,
    course_progress_max_score text,
    course_progress_score text,
    course_progress_success_status text,
    course_required_lesson_count text,
    enrolled_at text,
    PRIMARY KEY (course_id, id, user_id),
    FOREIGN KEY (course_id) REFERENCES course(id),
    FOREIGN KEY (id) REFERENCES published_course(id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (domain_name) REFERENCES domain("name"),
    FOREIGN KEY (enrollment_id) REFERENCES published_course_enrollment(id)
);

CREATE TABLE signup_field_option (
    domain_name text,
    id text,
    signup_field_id text,
    "value" text,
    PRIMARY KEY (domain_name, id, signup_field_id),
    FOREIGN KEY (signup_field_id) REFERENCES signup_field(id)
);

CREATE TABLE signup_field (
    domain_name text,
    id text,
    active text,
    help_text text,
    label text,
    orders text,
    regex_validator text,
    regex_validator_error_text text,
    required text,
    "type" text,
    PRIMARY KEY (domain_name, id)
);

CREATE TABLE offer (
    id text,
    domain_name text,
    course_series_id text,
    plan_id text,
    published_course_id text,
    active text,
    currency_code text,
    ends_at text,
    max_quantity text,
    price_cents text,
    sku text,
    starts_at text,
    "type" text,
    PRIMARY KEY (id, domain_name),
    FOREIGN KEY (domain_name) REFERENCES domain("name"),
    FOREIGN KEY (course_series_id) REFERENCES course_series(id),
    FOREIGN KEY (plan_id) REFERENCES plan(id),
    FOREIGN KEY (published_course_id) REFERENCES published_course(id)
);

CREATE TABLE domain_user (
    domain_name text,
    user_id text,
    access_code text,
    access_code_id text,
    active text,
    enrolled_at text,
    expires_at text,
    marketing_option text,
    pool_id text,
    pool_name text,
    PRIMARY KEY (domain_name, user_id)
);

CREATE TABLE published_course_enrollment (
    domain_name text,
    id text,
    published_course_id text,
    user_id text,
    active text,
    enrolled_at text,
    expires_at text,
    offer_price_amount text,
    offer_price_currency_code text,
    order_id text,
    payment_processor text,
    purchase_id text,
    purchase_price_amount text,
    purchase_price_currency_code text,
    purchase_state text,
    purchased_at text,
    quantity text,
    tax_price_cents text,
    PRIMARY KEY (domain_name, id, published_course_id),
    FOREIGN KEY (published_course_id) REFERENCES published_course(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE plan (
    domain_name text,
    id text,
    offer_id text,
    hidden text,
    "name" text,
    short_description text,
    slug text,
    title text,
    url text,
    PRIMARY KEY (domain_name, id),
    FOREIGN KEY (offer_id) REFERENCES offer(id)
);

CREATE TABLE published_course (
    domain_name text,
    id text,
    course_id text,
    offer_id text,
    course_lesson_count text,
    course_required_lesson_count text,
    course_url text,
    hidden text,
    registration_ends_at text,
    registration_required text,
    registration_starts_at text,
    slug text,
    timezone text,
    PRIMARY KEY (domain_name, id, course_id),
    FOREIGN KEY (course_id) REFERENCES course(id),
    FOREIGN KEY (offer_id) REFERENCES offer(id)
);

CREATE TABLE course_label (
    "index" text,
    course_id text,
    label text,
    PRIMARY KEY ("index", course_id),
    FOREIGN KEY (course_id) REFERENCES course(id)
);

CREATE TABLE course (
    id text,
    enforce_sequential_navigation text,
    long_description_html text,
    short_description text,
    title text,
    PRIMARY KEY (id)
);

CREATE TABLE domain_access_code (
    domain_access_code_pool_domain_name text,
    id text,
    domain_access_code_pool_id text,
    active text,
    code text,
    duration text,
    duration_unit text,
    max_uses text,
    use_count text,
    PRIMARY KEY (domain_access_code_pool_domain_name, id, domain_access_code_pool_id),
    FOREIGN KEY (domain_access_code_pool_id) REFERENCES domain_access_code_pool(id)
);

CREATE TABLE quiz (
    id text,
    html text,
    limit_question_count text,
    max_attempts text,
    "name" text,
    passing_percentage_correct text,
    randomize_answer text,
    randomize_question text,
    require_correct_response text,
    show_question_feedback text,
    show_results_on_failure text,
    time_limit_seconds text,
    PRIMARY KEY (id)
);

CREATE TABLE group_user (
    group_id text,
    user_id text,
    created_at text,
    PRIMARY KEY (group_id, user_id),
    FOREIGN KEY (group_id) REFERENCES groups(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE domain_access_code_pool (
    domain_name text,
    id text,
    active text,
    channel text,
    end_date text,
    expire_domain_membership text,
    "name" text,
    start_date text,
    PRIMARY KEY (domain_name, id)
);

CREATE TABLE published_path (
    domain_name text,
    id text,
    offer_id text,
    path_id text,
    path_path_item_count text,
    path_title text,
    path_url text,
    PRIMARY KEY (domain_name, id),
    FOREIGN KEY (offer_id) REFERENCES offer(id)
);

CREATE TABLE published_path_enrollment (
    domain_name text,
    id text,
    published_path_id text,
    user_id text,
    active text,
    enrolled_at text,
    expires_at text,
    offer_price_amount text,
    offer_price_currency_code text,
    order_id text,
    payment_processor text,
    purchase_id text,
    purchase_price_amount text,
    purchase_price_currency_code text,
    purchase_state text,
    purchased_at text,
    quantity text,
    tax_price_cents text,
    PRIMARY KEY (domain_name, id, published_path_id),
    FOREIGN KEY (published_path_id) REFERENCES published_path(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE plan_enrollment (
    id text,
    domain_name text,
    plan_id text,
    user_id text,
    active text,
    enrolled_at text,
    expires_at text,
    offer_price_amount text,
    offer_price_currency_code text,
    order_id text,
    payment_processor text,
    purchase_id text,
    purchase_price_amount text,
    purchase_price_currency_code text,
    purchase_state text,
    purchased_at text,
    quantity text,
    tax_price_cents text,
    PRIMARY KEY (id, domain_name, plan_id),
    FOREIGN KEY (domain_name) REFERENCES plan(domain_name),
    FOREIGN KEY (plan_id) REFERENCES plan(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    completion_count text,
    email text,
    first_name text,
    last_name text,
    latest_activity text,
    registration_count text,
    signed_up_at text,
    PRIMARY KEY (id)
);

CREATE TABLE domain_user_invite (
    domain_name text,
    id text,
    user_id text,
    invite_url text,
    sent_at text,
    token text,
    used_at text,
    PRIMARY KEY (domain_name, id, user_id),
    FOREIGN KEY (user_id) REFERENCES domain_user(user_id)
);
