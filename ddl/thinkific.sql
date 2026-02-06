CREATE TABLE collection (
    id text,
    created_at text,
    defaults text,
    description text,
    "name" text,
    slug text,
    PRIMARY KEY (id)
);

CREATE TABLE groups (
    id text,
    created_at text,
    "name" text,
    token text,
    PRIMARY KEY (id)
);

CREATE TABLE group_analyst (
    group_analyst text,
    temp_group_analyst_group_id text,
    PRIMARY KEY (group_analyst, temp_group_analyst_group_id)
);

CREATE TABLE course_administrator_user (
    administrator_user_id text,
    course_id text,
    PRIMARY KEY (administrator_user_id, course_id),
    FOREIGN KEY (administrator_user_id) REFERENCES users(id),
    FOREIGN KEY (course_id) REFERENCES course(id)
);

CREATE TABLE course_chapter (
    chapter_id text,
    course_id text,
    PRIMARY KEY (chapter_id, course_id),
    FOREIGN KEY (chapter_id) REFERENCES chapter(id),
    FOREIGN KEY (course_id) REFERENCES course(id)
);

CREATE TABLE course (
    id text,
    instructor_id text,
    product_id text,
    user_id text,
    banner_image_url text,
    contact_information text,
    course_card_image_url text,
    course_card_text text,
    description text,
    duration text,
    intro_video_wistia_identifier text,
    intro_video_youtube text,
    keyword text,
    "name" text,
    reviews_enabled text,
    slug text,
    subtitle text,
    PRIMARY KEY (id),
    FOREIGN KEY (instructor_id) REFERENCES instructor(id),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE instructor (
    id text,
    user_id text,
    avatar_url text,
    bio text,
    created_at text,
    email text,
    first_name text,
    last_name text,
    slug text,
    title text,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE enrollment (
    id text,
    course_id text,
    user_id text,
    activated_at text,
    completed text,
    completed_at text,
    created_at text,
    expired text,
    expiry_date text,
    is_free_trial text,
    percentage_completed text,
    started_at text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (course_id) REFERENCES course(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE product_collection (
    collection_id text,
    product_id text,
    PRIMARY KEY (collection_id, product_id),
    FOREIGN KEY (collection_id) REFERENCES collection(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE product_price (
    id text,
    product_id text,
    currency text,
    custom_first_price text,
    days_until_expiry text,
    "interval" text,
    interval_count text,
    is_primary text,
    label text,
    number_of_payments text,
    pay_button_text text,
    payment_type text,
    price text,
    price_name text,
    trial_interval text,
    trial_interval_count text,
    PRIMARY KEY (id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE related_product (
    product_id text,
    related_product_id text,
    PRIMARY KEY (product_id, related_product_id),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (related_product_id) REFERENCES product(id)
);

CREATE TABLE product (
    id text,
    card_image_url text,
    created_at text,
    days_until_expiry text,
    description text,
    has_certificate text,
    hidden text,
    instructor_name text,
    keyword text,
    "name" text,
    "position" text,
    price text,
    private text,
    productable_id text,
    productable_type text,
    seo_description text,
    seo_title text,
    slug text,
    "status" text,
    subscription text,
    PRIMARY KEY (id)
);

CREATE TABLE orders (
    id text,
    coupon_id text,
    product_id text,
    user_id text,
    affiliate_referral_code text,
    amount_cent text,
    amount_dollar text,
    coupon_code text,
    created_at text,
    "status" text,
    subscription text,
    PRIMARY KEY (id),
    FOREIGN KEY (coupon_id) REFERENCES coupon(id),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE content (
    id text,
    chapter_id text,
    contentable_type text,
    free text,
    "name" text,
    "position" text,
    take_url text,
    PRIMARY KEY (id),
    FOREIGN KEY (chapter_id) REFERENCES chapter(id)
);

CREATE TABLE product_publish_request_coupon (
    coupon_id text,
    product_publish_request_id text,
    PRIMARY KEY (coupon_id, product_publish_request_id),
    FOREIGN KEY (coupon_id) REFERENCES coupon(id),
    FOREIGN KEY (product_publish_request_id) REFERENCES product_publish_request(id)
);

CREATE TABLE product_publish_request (
    id text,
    amount text,
    description text,
    discount_type text,
    duration text,
    expires_at text,
    "name" text,
    starts_at text,
    PRIMARY KEY (id)
);

CREATE TABLE custom_profile_field_definition (
    id text,
    field_type text,
    label text,
    required text,
    PRIMARY KEY (id)
);

CREATE TABLE site_script_page_scope (
    "index" text,
    site_script_id text,
    page_scope text,
    PRIMARY KEY ("index", site_script_id),
    FOREIGN KEY (site_script_id) REFERENCES site_script(id)
);

CREATE TABLE site_script (
    id text,
    category text,
    description text,
    load_method text,
    location text,
    "name" text,
    src text,
    PRIMARY KEY (id)
);

CREATE TABLE coupon (
    id text,
    promotion_id text,
    code text,
    created_at text,
    note text,
    quantity text,
    quantity_used text,
    PRIMARY KEY (id),
    FOREIGN KEY (promotion_id) REFERENCES promotion(id)
);

CREATE TABLE chapter_content (
    content_id text,
    chapter_id text,
    PRIMARY KEY (content_id, chapter_id),
    FOREIGN KEY (chapter_id) REFERENCES chapter(id)
);

CREATE TABLE chapter (
    id text,
    description text,
    duration_in_second text,
    "name" text,
    "position" text,
    PRIMARY KEY (id)
);

CREATE TABLE promotion (
    id text,
    amount text,
    description text,
    discount_type text,
    duration text,
    expires_at text,
    "name" text,
    starts_at text,
    PRIMARY KEY (id)
);

CREATE TABLE course_review (
    id text,
    course_id text,
    user_id text,
    approved text,
    created_at text,
    rating text,
    review_text text,
    title text,
    PRIMARY KEY (id),
    FOREIGN KEY (course_id) REFERENCES course(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users_role (
    "index" text,
    users_id text,
    "role" text,
    PRIMARY KEY ("index", users_id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE users_administered_course (
    administered_course_id text,
    users_id text,
    PRIMARY KEY (administered_course_id, users_id),
    FOREIGN KEY (administered_course_id) REFERENCES course(id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE users_custom_profile_field (
    id text,
    users_id text,
    custom_profile_field_definition_id text,
    label text,
    "value" text,
    PRIMARY KEY (id, users_id),
    FOREIGN KEY (users_id) REFERENCES users(id),
    FOREIGN KEY (custom_profile_field_definition_id) REFERENCES custom_profile_field_definition(id)
);

CREATE TABLE users (
    id text,
    affiliate_code text,
    affiliate_commission text,
    affiliate_commission_type text,
    affiliate_payout_email text,
    avatar_url text,
    bio text,
    company text,
    created_at text,
    email text,
    external_source text,
    first_name text,
    full_name text,
    headline text,
    last_name text,
    PRIMARY KEY (id)
);
