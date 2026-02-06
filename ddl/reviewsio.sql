CREATE TABLE company_review_invitation (
    id text,
    customer_email text,
    customer_name text,
    date_send text,
    email_sent text,
    order_id text,
    resent text,
    "status" text,
    PRIMARY KEY (id)
);

CREATE TABLE product_review_invitation (
    product_id text,
    service_feedback_email_id text,
    brand text,
    description text,
    image text,
    "name" text,
    sku text,
    PRIMARY KEY (product_id),
    FOREIGN KEY (service_feedback_email_id) REFERENCES company_review_invitation(id)
);

CREATE TABLE survey (
    id text,
    active text,
    date_created text,
    date_updated text,
    question_count text,
    responses_count text,
    title text,
    PRIMARY KEY (id)
);

CREATE TABLE review_nugget (
    id text,
    review_id text,
    date_created_nugget text,
    rating text,
    text text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (review_id) REFERENCES review_and_question(id)
);

CREATE TABLE review_photo (
    "index" text,
    review_and_question_id text,
    photo text,
    PRIMARY KEY ("index", review_and_question_id),
    FOREIGN KEY (review_and_question_id) REFERENCES review_and_question(id)
);

CREATE TABLE review_video (
    "index" text,
    review_and_question_id text,
    thumbnail text,
    video text,
    PRIMARY KEY ("index", review_and_question_id),
    FOREIGN KEY (review_and_question_id) REFERENCES review_and_question(id)
);

CREATE TABLE review_tag (
    "index" text,
    review_and_question_id text,
    tags text,
    PRIMARY KEY ("index", review_and_question_id),
    FOREIGN KEY (review_and_question_id) REFERENCES review_and_question(id)
);

CREATE TABLE review_reply (
    "index" text,
    review_and_question_id text,
    author_avatar text,
    author_name text,
    "comment" text,
    date_created text,
    PRIMARY KEY ("index", review_and_question_id),
    FOREIGN KEY (review_and_question_id) REFERENCES review_and_question(id)
);

CREATE TABLE review_and_question (
    id text,
    author_location text,
    author_name text,
    "comment" text,
    date_created text,
    helpful_count text,
    nps text,
    order_id text,
    product_name text,
    rating text,
    sku text,
    "source" text,
    title text,
    "type" text,
    type_label text,
    PRIMARY KEY (id)
);

CREATE TABLE review_attribute (
    id text,
    review_and_question_id text,
    kind text,
    label text,
    "option" text,
    "type" text,
    "value" text,
    PRIMARY KEY (id, review_and_question_id),
    FOREIGN KEY (review_and_question_id) REFERENCES review_and_question(id)
);

CREATE TABLE survey_response_answer (
    question_id text,
    res_id text,
    survey_id text,
    survey_response_id text,
    question text,
    res_image_url text,
    res_response text,
    res_store_widget_survey_submission_id text,
    "type" text,
    widget_survey_active text,
    widget_survey_active_in_shopify text,
    widget_survey_answer_conditions text,
    widget_survey_condition_default text,
    widget_survey_date_created text,
    widget_survey_date_updated text,
    widget_survey_deleted text,
    widget_survey_filters text,
    widget_survey_follow_up text,
    widget_survey_image_capture text,
    widget_survey_mandatory text,
    widget_survey_options text,
    widget_survey_shopify text,
    widget_survey_show_as_button text,
    widget_survey_show_as_images text,
    widget_survey_show_follow_up text,
    widget_survey_store_id text,
    widget_survey_store_widget_survey_campaign_id text,
    widget_survey_thank_you text,
    widget_survey_title text,
    PRIMARY KEY (question_id, res_id, survey_id, survey_response_id),
    FOREIGN KEY (survey_id) REFERENCES survey_response(survey_id),
    FOREIGN KEY (survey_response_id) REFERENCES survey_response(id)
);

CREATE TABLE survey_response (
    id text,
    survey_id text,
    browser text,
    completion_time text,
    country_code text,
    date_created text,
    date_updated text,
    href text,
    ip_address text,
    order_count text,
    tags text,
    total_price text,
    user_id text,
    PRIMARY KEY (id, survey_id),
    FOREIGN KEY (survey_id) REFERENCES survey(id)
);
