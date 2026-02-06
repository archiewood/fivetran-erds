CREATE TABLE contact_location (
    location text,
    contact_id text,
    PRIMARY KEY (location, contact_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE contact_mapping (
    mapping_business_id text,
    mapping_customer_id text,
    contact_id text,
    PRIMARY KEY (mapping_business_id, mapping_customer_id, contact_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE contact (
    id text,
    contact_type text,
    created text,
    email text,
    first_name text,
    last_activity_on text,
    last_name text,
    native_email_unsub_type text,
    native_sms_unsub_type text,
    phone text,
    "source" text,
    tags jsonb,
    -- custom_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE business_competitor (
    id text,
    enterprise_id text,
    location_address_1 text,
    location_address_2 text,
    location_city text,
    location_country_code text,
    location_country_name text,
    location_latitude double precision,
    location_longitude double precision,
    location_state text,
    location_zip text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (enterprise_id) REFERENCES competitor(enterprise_id)
);

CREATE TABLE competitor (
    enterprise_id text,
    enterprise_name text,
    PRIMARY KEY (enterprise_id)
);

CREATE TABLE keyword_stat (
    _fivetran_id text,
    keyword_id text,
    keyword text,
    occurrence text,
    score text,
    scr text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (keyword_id) REFERENCES keyword(id)
);

CREATE TABLE keyword_adjective (
    _fivetran_id text,
    keyword_id text,
    adjective text,
    average_score double precision,
    occurrence text,
    percentage text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (keyword_id) REFERENCES keyword(id)
);

CREATE TABLE keyword_competitor (
    competitor_id text,
    keyword_id text,
    PRIMARY KEY (competitor_id, keyword_id),
    FOREIGN KEY (competitor_id) REFERENCES business_enterprise(competitor_id),
    FOREIGN KEY (keyword_id) REFERENCES keyword(id)
);

CREATE TABLE keyword (
    id text,
    average_score double precision,
    count text,
    keywords jsonb,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE working_hour (
    _fivetran_id text,
    business_name text,
    hours_of_operation_index text,
    end_hour text,
    start_hour text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (business_name) REFERENCES hours_of_operation(business_name),
    FOREIGN KEY (hours_of_operation_index) REFERENCES hours_of_operation("index")
);

CREATE TABLE hours_of_operation (
    "index" text,
    business_name text,
    "comment" text,
    "day" text,
    is_open text,
    PRIMARY KEY ("index", business_name),
    FOREIGN KEY (business_name) REFERENCES business("name")
);

CREATE TABLE business (
    "name" text,
    alias text,
    avg_rating double precision,
    base_url text,
    business_status text,
    category text,
    cover_business_info_layout text,
    cover_image_url text,
    covid_info jsonb,
    created_date text,
    description text,
    email_id text,
    fax text,
    image_1_url text,
    image_2_url text,
    image_3_url text,
    internal_listing_category text,
    internal_listing_display_category text,
    internal_listing_subcategory_1 text,
    is_address_hidden text,
    is_seoenabled boolean,
    is_service_area_provider text,
    keywords text,
    languages jsonb,
    location_address_1 text,
    location_address_2 text,
    location_city text,
    location_country_code text,
    location_country_name text,
    location_latitude double precision,
    location_longitude double precision,
    location_state text,
    location_zip text,
    logo_url text,
    payment text,
    phone text,
    review_count text,
    services text,
    social_profile_urls_facebook_url text,
    social_profile_urls_google_url text,
    social_profile_urls_linkedin_url text,
    social_profile_urls_twitter_url text,
    social_profile_urls_youtube_url text,
    "status" text,
    timezone text,
    "type" text,
    website_url text,
    working_24_x_7 text,
    PRIMARY KEY ("name")
);

CREATE TABLE category_stat (
    id text,
    insight_id text,
    average_score double precision,
    color_code text,
    competitor boolean,
    count text,
    enterprise_name text,
    grade text,
    PRIMARY KEY (id, insight_id),
    FOREIGN KEY (insight_id) REFERENCES insight_category(id)
);

CREATE TABLE insight_category (
    id text,
    category_name text,
    PRIMARY KEY (id)
);

CREATE TABLE source_list (
    alias text,
    PRIMARY KEY (alias)
);

CREATE TABLE conversation_report (
    id text,
    agg_review_count text,
    alias_1 text,
    business_number text,
    email_click_info_mobile_birdeye text,
    email_click_info_mobile_google text,
    email_click_info_mobile_other_sites text,
    email_click_info_mobile_yelp text,
    email_click_info_pc_birdeye text,
    email_click_info_pc_google text,
    email_click_info_pc_other_sites text,
    email_click_info_pc_yelp text,
    email_click_info_percent double precision,
    email_click_info_total text,
    email_open_info_mobile_android text,
    email_open_info_mobile_ios text,
    email_open_info_mobile_other text,
    email_open_info_pc text,
    email_open_info_percent double precision,
    email_open_info_tablet_android text,
    email_open_info_tablet_ios text,
    email_open_info_tablet_other text,
    email_open_info_total text,
    email_sent_info_email_details jsonb,
    email_sent_info_req_count text,
    email_sent_info_req_reminder_count text,
    email_sent_info_share_req_count text,
    email_sent_info_share_req_reminder_count text,
    email_sent_info_total text,
    heirarchy_groups text,
    is_modifiable text,
    "name" text,
    organic_review_count text,
    reviews jsonb,
    sms_detail_birdeye text,
    sms_detail_google text,
    sms_detail_message_click text,
    sms_detail_message_sent text,
    sms_detail_other_sites text,
    sms_detail_percent double precision,
    sms_detail_yelp text,
    PRIMARY KEY (id)
);

CREATE TABLE answer_child (
    _fivetran_id text,
    answer_index text,
    response_id text,
    answer text,
    conditional boolean,
    hidden boolean,
    max_value text,
    min_value text,
    question_title text,
    question_type text,
    show_date boolean,
    show_time boolean,
    shown_to_customer boolean,
    visible boolean,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (answer_index) REFERENCES answer("index"),
    FOREIGN KEY (response_id) REFERENCES answer(response_id)
);

CREATE TABLE answer (
    "index" text,
    response_id text,
    answer text,
    conditional boolean,
    hidde boolean,
    max_value text,
    min_value text,
    question_title text,
    question_type text,
    show_date boolean,
    show_time boolean,
    shown_to_customer boolean,
    visible boolean,
    PRIMARY KEY ("index", response_id),
    FOREIGN KEY (response_id) REFERENCES response(id)
);

CREATE TABLE response_custom_param (
    "name" text,
    response_id text,
    "value" text,
    PRIMARY KEY ("name", response_id),
    FOREIGN KEY (response_id) REFERENCES response(id)
);

CREATE TABLE response (
    id text,
    survey_id text,
    business_id text,
    business_location_name text,
    business_number text,
    completed boolean,
    customer_id text,
    customer_name text,
    locale text,
    location_name text,
    question_count text,
    request_date text,
    response_date text,
    ticketed boolean,
    PRIMARY KEY (id),
    FOREIGN KEY (survey_id) REFERENCES survey(id)
);

CREATE TABLE employee_business (
    business_id text,
    employee_id text,
    PRIMARY KEY (business_id),
    FOREIGN KEY (employee_id) REFERENCES employee(id)
);

CREATE TABLE employee (
    id text,
    email_id text,
    first_name text,
    image_url text,
    last_name text,
    "name" text,
    phone text,
    PRIMARY KEY (id)
);

CREATE TABLE theme_stat (
    _fivetran_id text,
    theme_id text,
    adjective text,
    count text,
    keyword text,
    negative_count text,
    positive_count text,
    score text,
    scr text,
    theme text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (theme_id) REFERENCES theme(id)
);

CREATE TABLE theme_competitor (
    competitor_id text,
    theme_id text,
    PRIMARY KEY (competitor_id, theme_id),
    FOREIGN KEY (competitor_id) REFERENCES business_enterprise(competitor_id),
    FOREIGN KEY (theme_id) REFERENCES theme(id)
);

CREATE TABLE theme (
    id text,
    average_score double precision,
    count text,
    "name" text,
    negative_count text,
    negative_percentage double precision,
    occurrence text,
    percentage double precision,
    positive_count text,
    positive_percentage double precision,
    themes jsonb,
    PRIMARY KEY (id)
);

CREATE TABLE button_text (
    id text,
    survey_id text,
    locale text,
    locale_text text,
    text_key text,
    PRIMARY KEY (id),
    FOREIGN KEY (survey_id) REFERENCES survey(id)
);

CREATE TABLE question_choice (
    id text,
    question_id text,
    hidden boolean,
    orders text,
    title text,
    PRIMARY KEY (id),
    FOREIGN KEY (question_id) REFERENCES page_question(id)
);

CREATE TABLE page_question (
    id text,
    page_id text,
    add_page_break boolean,
    display_logic jsonb,
    display_question boolean,
    dynamic_choices jsonb,
    edit_answer boolean,
    embed_in_email boolean,
    hidden boolean,
    "interval" boolean,
    is_required boolean,
    maximum_value text,
    minimum_value text,
    "name" text,
    orders text,
    react_element_id text,
    "rows" jsonb,
    show_date boolean,
    show_question_numbers text,
    show_time boolean,
    shown_to_customer boolean,
    skip_logic jsonb,
    skip_question boolean,
    standard_field boolean,
    title text,
    "type" text,
    "value" jsonb,
    visible boolean,
    PRIMARY KEY (id),
    FOREIGN KEY (page_id) REFERENCES page(id)
);

CREATE TABLE page (
    id text,
    survey_id text,
    hidden boolean,
    "name" text,
    orders text,
    page_title text,
    show_question_numbers text,
    thankyou_msg text,
    visible boolean,
    PRIMARY KEY (id),
    FOREIGN KEY (survey_id) REFERENCES survey(id)
);

CREATE TABLE survey_custom_param (
    id text,
    survey_id text,
    "key" text,
    label text,
    PRIMARY KEY (id),
    FOREIGN KEY (survey_id) REFERENCES survey(id)
);

CREATE TABLE survey (
    id text,
    business_name text,
    brand_name text,
    business_id text,
    cloneable boolean,
    created timestamp,
    default_locale text,
    hide_birdeye_logo boolean,
    hide_locale_menu boolean,
    insights_enabled boolean,
    last_modified timestamp,
    "name" text,
    owner_email text,
    owner_name text,
    progressbar_position text,
    question_count text,
    responses text,
    show_business_name boolean,
    show_location_ques text,
    show_logo text,
    show_progress_bar boolean,
    show_question_number boolean,
    show_survey_title boolean,
    show_title text,
    "status" text,
    str_created_date text,
    str_last_modified_date text,
    supported_locales jsonb,
    survey_type text,
    thankyou_msg text,
    theme_color text,
    theme_text_color text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (business_name) REFERENCES business("name")
);

CREATE TABLE business_enterprise (
    competitor_id text,
    enterprise_id text,
    alias text,
    child_count text,
    "name" text,
    PRIMARY KEY (competitor_id),
    FOREIGN KEY (enterprise_id) REFERENCES competitor(enterprise_id)
);

CREATE TABLE review_extra_param (
    "name" text,
    review_id text,
    "value" text,
    PRIMARY KEY ("name", review_id),
    FOREIGN KEY (review_id) REFERENCES review(id)
);

CREATE TABLE review (
    id text,
    business_name text,
    business_id text,
    business_type text,
    comments text,
    customer_id text,
    enable_reply boolean,
    featured text,
    rating double precision,
    response text,
    response_date text,
    review_date text,
    review_url text,
    reviewer_city text,
    reviewer_email_id text,
    reviewer_facebook_id text,
    reviewer_first_name text,
    reviewer_last_name text,
    reviewer_nickname text,
    reviewer_phone text,
    reviewer_state text,
    reviewer_thumbnail_url text,
    source_type text,
    "status" text,
    title text,
    unique_review_url text,
    PRIMARY KEY (id),
    FOREIGN KEY (business_name) REFERENCES business("name")
);

CREATE TABLE aggregation (
    id text,
    aggregation_status text,
    source_alias text,
    source_name text,
    source_url text,
    PRIMARY KEY (id)
);

CREATE TABLE conversation_message (
    id text,
    conversation_id text,
    attachments jsonb,
    channel text,
    direction text,
    message_date text,
    message_status text,
    sent_at text,
    text text,
    user_id text,
    PRIMARY KEY (id, conversation_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id)
);

CREATE TABLE conversation (
    id text,
    contact_id text,
    assigned_to_email_id text,
    assigned_to_id text,
    assigned_to_name text,
    assigned_to_type text,
    contact_created_date text,
    contact_team text,
    contact_updated_date text,
    conversation_start_date text,
    last_message_received_on text,
    last_used_channel text,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);
