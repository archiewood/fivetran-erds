CREATE TABLE category (
    id text,
    code text,
    counter text,
    counter_2 text,
    has_child text,
    i_left text,
    i_right text,
    icon text,
    lev text,
    title text,
    title_parent text,
    PRIMARY KEY (id)
);

CREATE TABLE root_category (
    id text,
    i_left text,
    i_right text,
    id_parent text,
    is_root text,
    lev text,
    root_node_id text,
    title text,
    title_parent text,
    PRIMARY KEY (id)
);

CREATE TABLE audience_user (
    audience_uuid text,
    idst text,
    relation_type text,
    PRIMARY KEY (audience_uuid, idst),
    FOREIGN KEY (audience_uuid) REFERENCES audience(uuid),
    FOREIGN KEY (idst) REFERENCES users(id)
);

CREATE TABLE session_additional_field (
    id text,
    course_id text,
    fivetran_id text,
    title text,
    "type" text,
    "value" text,
    visible_to_user text,
    PRIMARY KEY (id, course_id, fivetran_id),
    FOREIGN KEY (course_id) REFERENCES session_enrollment(course_id),
    FOREIGN KEY (fivetran_id) REFERENCES session_enrollment(_fivetran_id)
);

CREATE TABLE session_instructor (
    username text,
    course_id text,
    fivetran_id text,
    session_id text,
    PRIMARY KEY (username, course_id, fivetran_id, session_id),
    FOREIGN KEY (course_id) REFERENCES "session"(course_id),
    FOREIGN KEY (fivetran_id) REFERENCES "session"(fivetran_id),
    FOREIGN KEY (session_id) REFERENCES "session"(id)
);

CREATE TABLE datewise_instructor (
    username text,
    course_id text,
    fivetran_id text,
    session_event_id text,
    session_id text,
    PRIMARY KEY (username, course_id, fivetran_id, session_event_id, session_id),
    FOREIGN KEY (course_id) REFERENCES session_event(course_id),
    FOREIGN KEY (fivetran_id) REFERENCES session_event(fivetran_id),
    FOREIGN KEY (session_event_id) REFERENCES session_event(id),
    FOREIGN KEY (session_id) REFERENCES session_event(session_id)
);

CREATE TABLE session_event (
    id text,
    course_id text,
    fivetran_id text,
    session_id text,
    classroom_id text,
    location_id text,
    allowed_api_grab text,
    allowed_api_link text,
    collaboration_tool text,
    "day" text,
    description text,
    duration text,
    effective_duration text,
    has_recording text,
    is_instructor text,
    join_in_advance_instructor text,
    join_in_advance_user text,
    "name" text,
    recording_status text,
    start_hour text,
    time_begin text,
    time_end text,
    timezone text,
    tool text,
    tool_mapping_field_lms text,
    url text,
    user_status text,
    webinar_tool text,
    webinar_tool_sync_failed text,
    PRIMARY KEY (id, course_id, fivetran_id, session_id),
    FOREIGN KEY (course_id) REFERENCES "session"(course_id),
    FOREIGN KEY (fivetran_id) REFERENCES "session"(fivetran_id),
    FOREIGN KEY (session_id) REFERENCES "session"(id),
    FOREIGN KEY (classroom_id) REFERENCES classroom(id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE "session" (
    id text,
    course_id text,
    fivetran_id text,
    begin_day text,
    begin_time text,
    begin_timezone text,
    can_manage text,
    description text,
    end_date text,
    end_time text,
    end_timezone text,
    evaluation_type text,
    is_instructor text,
    migrated_webinar_session_id text,
    min_dates_for_completion text,
    "name" text,
    score_base text,
    slug_name text,
    start_date text,
    PRIMARY KEY (id, course_id, fivetran_id),
    FOREIGN KEY (course_id) REFERENCES session_enrollment(course_id),
    FOREIGN KEY (fivetran_id) REFERENCES session_enrollment(_fivetran_id)
);

CREATE TABLE session_enrollment (
    _fivetran_id text,
    course_id text,
    "comment" text,
    current_location text,
    evaluation_date text,
    evaluation_name text,
    evaluation_status text,
    evaluation_url text,
    evaluator_avatar text,
    evaluator_firstname text,
    evaluator_lastname text,
    evaluator_username text,
    is_enrolled text,
    score text,
    PRIMARY KEY (_fivetran_id, course_id),
    FOREIGN KEY (course_id) REFERENCES course(id)
);

CREATE TABLE channel_item (
    id text,
    channel_id text,
    inviter_id text,
    owner_id text,
    assets_count text,
    can_enter text,
    can_enter_reason text,
    content_type text,
    courses_count text,
    created text,
    description text,
    domain text,
    duration text,
    expiration_date text,
    external_type text,
    hidden text,
    image_url text,
    inviter_avatar text,
    inviter_full_name text,
    inviter_short_name text,
    is_asset_downloadable text,
    is_error text,
    is_loading text,
    is_new text,
    is_private text,
    is_watched text,
    language_code text,
    language_label text,
    languages text,
    "level" text,
    level_label text,
    link_url text,
    outdated_already_marked text,
    outdated_total_users text,
    publish_date text,
    rating text,
    rating_option text,
    shared_asset_id text,
    "status" text,
    status_id text,
    status_label text,
    title text,
    "type" text,
    type_id text,
    uri text,
    views text,
    PRIMARY KEY (id),
    FOREIGN KEY (channel_id) REFERENCES channel(id),
    FOREIGN KEY (inviter_id) REFERENCES users(id),
    FOREIGN KEY (owner_id) REFERENCES users(id)
);

CREATE TABLE channel (
    id text,
    created text,
    description text,
    icon_background text,
    icon_color text,
    icon_font text,
    is_enabled text,
    is_followed text,
    "name" text,
    notification text,
    predefined_uid text,
    PRIMARY KEY (id)
);

CREATE TABLE manager_subordinate_relation (
    id text,
    manager_id text,
    manager_subordinate_id text,
    PRIMARY KEY (id, manager_id, manager_subordinate_id),
    FOREIGN KEY (manager_subordinate_id) REFERENCES manager_subordinate(id)
);

CREATE TABLE subordinate_manager_type (
    manager_type_id text,
    relation_id text,
    manager_subordinate_id text,
    last_update text,
    "name" text,
    "status" text,
    PRIMARY KEY (manager_type_id, relation_id),
    FOREIGN KEY (manager_subordinate_id) REFERENCES manager_subordinate(id)
);

CREATE TABLE manager_subordinate (
    manager_id text,
    id text,
    actions jsonb,
    active_subordinates_count text,
    expertise text,
    has_dashboard text,
    is_manager text,
    is_new text,
    kpi_expired_certification text,
    kpi_overdue_course text,
    kpi_status text,
    occupation_canonical_code text,
    occupation_canonical_name text,
    occupation_code text,
    occupation_id text,
    occupation_is_custom text,
    occupation_name text,
    pending_subordinates_count text,
    skills_count text,
    skills_suggestion_count text,
    trend text,
    uuid text,
    PRIMARY KEY (manager_id, id),
    FOREIGN KEY (id) REFERENCES users(id)
);

CREATE TABLE user_field (
    id text,
    enabled text,
    inherited text,
    invisible_to_user text,
    mandatory text,
    settings jsonb,
    system_field text,
    title text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE learning_plan_enrollment (
    learning_plan_id text,
    user_id text,
    assignment_type text,
    enrollment_completion_date text,
    enrollment_completion_percentage text,
    enrollment_created_at text,
    enrollment_created_by text,
    enrollment_date_last_updated text,
    enrollment_status text,
    enrollment_time_spent text,
    enrollment_validity_begin_date text,
    enrollment_validity_begin_datetime text,
    enrollment_validity_end_date text,
    enrollment_validity_end_datetime text,
    learning_plan_code text,
    learning_plan_name text,
    username text,
    PRIMARY KEY (learning_plan_id, user_id),
    FOREIGN KEY (learning_plan_id) REFERENCES learning_plan(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE enrollment_approval_pending (
    user_id text,
    course_id text,
    session_id text,
    subscription_date text,
    username text,
    PRIMARY KEY (user_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (course_id) REFERENCES course(id),
    FOREIGN KEY (session_id) REFERENCES "session"(id)
);

CREATE TABLE user_associated_skill (
    _fivetran_id text,
    id text,
    skill_id text,
    expertise text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (id) REFERENCES users(id),
    FOREIGN KEY (skill_id) REFERENCES skill(id)
);

CREATE TABLE skill (
    id text,
    code text,
    content_number text,
    description text,
    is_custom text,
    "name" text,
    predefined_uid text,
    skillsets_number text,
    "source" text,
    title text,
    users_number text,
    PRIMARY KEY (id)
);

CREATE TABLE external_training_additional_field (
    id text,
    external_training_id text,
    title text,
    "type" text,
    "value" text,
    PRIMARY KEY (id, external_training_id),
    FOREIGN KEY (external_training_id) REFERENCES external_training(training_id)
);

CREATE TABLE external_training (
    training_id text,
    course_code text,
    user_id text,
    ceus text,
    from_date text,
    score text,
    to_date text,
    training_institute text,
    training_institute_code text,
    uuid text,
    PRIMARY KEY (training_id),
    FOREIGN KEY (course_code) REFERENCES course(code),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE partner (
    id text,
    course_id text,
    updated_by text,
    active text,
    address text,
    affiliate_code text,
    catalog_visible text,
    city text,
    country text,
    course_visible text,
    description text,
    discount text,
    email text,
    enable_affiliate text,
    logo text,
    logo_full_path text,
    "name" text,
    phone text,
    referral_code text,
    "state" text,
    updated_at text,
    website text,
    PRIMARY KEY (id, course_id),
    FOREIGN KEY (course_id) REFERENCES course(id),
    FOREIGN KEY (updated_by) REFERENCES users(id)
);

CREATE TABLE course (
    id text,
    category_id text,
    affiliate_price text,
    available_seats text,
    can_rate text,
    can_self_unenroll text,
    category_name text,
    code text,
    credits text,
    current_rating text,
    date_last_updated text,
    description text,
    duration text,
    end_date text,
    enrollment_policy text,
    image text,
    img_url text,
    is_affiliate text,
    is_new text,
    is_opened text,
    language_label text,
    languages text,
    max_attempts text,
    "name" text,
    partner_fileds text,
    partner_id text,
    price text,
    rating_option text,
    selling text,
    slug_name text,
    start_date text,
    "type" text,
    uid text,
    PRIMARY KEY (id),
    FOREIGN KEY (category_id) REFERENCES category(id)
);

CREATE TABLE channel_expert (
    channel_id text,
    user_id text,
    PRIMARY KEY (channel_id, user_id),
    FOREIGN KEY (channel_id) REFERENCES channel(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE course_enrollment (
    course_id text,
    username text,
    code text,
    completion_date text,
    enrollment_date text,
    first_name text,
    has_esignature_enabled text,
    last_access text,
    last_name text,
    "name" text,
    score text,
    "status" text,
    time_in_course text,
    "type" text,
    PRIMARY KEY (course_id, username),
    FOREIGN KEY (course_id) REFERENCES course(id),
    FOREIGN KEY (username) REFERENCES users("name")
);

CREATE TABLE audience_labels (
    "index" text,
    audience_uuid text,
    label text,
    PRIMARY KEY ("index", audience_uuid),
    FOREIGN KEY (audience_uuid) REFERENCES audience(uuid)
);

CREATE TABLE audience_rule_set (
    id text,
    audience_uuid text,
    rules jsonb,
    rules_operator text,
    PRIMARY KEY (id, audience_uuid),
    FOREIGN KEY (audience_uuid) REFERENCES audience(uuid)
);

CREATE TABLE audience (
    uuid text,
    created_by_idst text,
    updated_by_idst text,
    description text,
    exclude_deactivated_users text,
    "name" text,
    rule_set_operator text,
    rule_set_status text,
    "type" text,
    updated_at text,
    PRIMARY KEY (uuid),
    FOREIGN KEY (created_by_idst) REFERENCES users(id),
    FOREIGN KEY (updated_by_idst) REFERENCES users(id)
);

CREATE TABLE learning_plan_course (
    id text,
    learning_plan_id text,
    all_courses text,
    category text,
    code text,
    courses_to_be_completed text,
    create_date text,
    is_published text,
    is_required text,
    language_browser_code text,
    language_code text,
    language_name text,
    postpone_access text,
    prerequisites_count text,
    "sequence" text,
    "time" text,
    time_unit text,
    title text,
    "type" text,
    uid text,
    PRIMARY KEY (id, learning_plan_id),
    FOREIGN KEY (id) REFERENCES course(id),
    FOREIGN KEY (learning_plan_id) REFERENCES learning_plan(id)
);

CREATE TABLE ilt_session (
    id text,
    course_id text,
    user_id text,
    attendance text,
    completion_date text,
    enrollment_date text,
    evaluation_comment text,
    evaluation_date text,
    evaluation_score text,
    evaluation_status text,
    evaluator_id text,
    "level" text,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (course_id) REFERENCES course(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE test (
    id text,
    course_id text,
    user_id text,
    fullname text,
    title text,
    PRIMARY KEY (id),
    FOREIGN KEY (course_id) REFERENCES course(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE catalog_content (
    id text,
    item_category text,
    access_status text,
    affiliate_price text,
    course_type text,
    course_user_status text,
    duration text,
    is_affiliate text,
    is_new text,
    is_opened text,
    is_user_enrolled text,
    is_user_subscribed text,
    item_can_enroll text,
    item_code text,
    item_create_date text,
    item_date_end text,
    item_description text,
    item_ecommerce jsonb,
    item_language text,
    item_language_code text,
    item_language_label text,
    item_name text,
    item_policy text,
    item_price text,
    item_rating text,
    item_slug text,
    item_type text,
    item_type_int text,
    item_visibility text,
    number_of_course text,
    partner_field jsonb,
    price_currency_code text,
    price_status text,
    quick_course_launch text,
    selling text,
    total_duration text,
    waiting text,
    PRIMARY KEY (id),
    FOREIGN KEY (item_category) REFERENCES category(id)
);

CREATE TABLE classroom (
    id text,
    location_id text,
    details text,
    equipment text,
    "name" text,
    seats text,
    PRIMARY KEY (id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE subscription_plan (
    id text,
    bundle_id text,
    actions text,
    availability text,
    code text,
    duration text,
    ecommerce_pricing_system_default text,
    enforce_limit text,
    field_1111 text,
    "name" text,
    price text,
    renewal_type text,
    validity_period text,
    validity_units text,
    PRIMARY KEY (id),
    FOREIGN KEY (bundle_id) REFERENCES subscription_bundle(id)
);

CREATE TABLE users_manager (
    _fivetran_id text,
    users_id text,
    username text,
    "name" text,
    title text,
    PRIMARY KEY (_fivetran_id, users_id),
    FOREIGN KEY (users_id) REFERENCES users(id),
    FOREIGN KEY (username) REFERENCES users("name")
);

CREATE TABLE users (
    id text,
    actions jsonb,
    authenticator_app_pair_date text,
    avatar text,
    confirmed text,
    country text,
    create_by_admin text,
    creation_date text,
    currently_logged_users_count text,
    date_format text,
    email text,
    email_validation_status text,
    encoded_username text,
    expiration_date text,
    expired text,
    field_1111 text,
    first_name text,
    fullname text,
    is_manager text,
    lang_code text,
    languages text,
    last_access_date text,
    last_name text,
    last_update text,
    "level" text,
    multi_domains jsonb,
    "name" text,
    newsletter_optout text,
    newsletter_optout_date text,
    request_on text,
    send_notification text,
    "status" text,
    timezone text,
    uuid text,
    version text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE gamification_leaderboard_position (
    "position" text,
    gamification_leaderboard_id text,
    user_id text,
    is_me text,
    last_assign text,
    percentage text,
    points text,
    PRIMARY KEY ("position", gamification_leaderboard_id, user_id),
    FOREIGN KEY (gamification_leaderboard_id) REFERENCES gamification_leaderboard(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE gamification_leaderboard (
    id text,
    users_id text,
    anonymity text,
    defaults text,
    is_active text,
    is_visible text,
    "name" text,
    visible_by jsonb,
    PRIMARY KEY (id, users_id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE subscription_bundle (
    id text,
    actions text,
    code text,
    description text,
    "name" text,
    published text,
    sub_items_id text,
    sub_items_name text,
    "type" text,
    type_id text,
    PRIMARY KEY (id)
);

CREATE TABLE course_learning_plan (
    course_id text,
    learning_plan_id text,
    PRIMARY KEY (course_id, learning_plan_id),
    FOREIGN KEY (course_id) REFERENCES course(id),
    FOREIGN KEY (learning_plan_id) REFERENCES learning_plan(id)
);

CREATE TABLE learning_plan (
    id text,
    code text,
    create_date text,
    date_last_updated text,
    description text,
    image text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE gamification_badge (
    _fivetran_id text,
    users_id text,
    badge_description text,
    badge_name text,
    id text,
    is_shareable text,
    issued_on text,
    total_badges_count text,
    total_score text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE location (
    id text,
    accommodations text,
    address text,
    country text,
    directions text,
    email text,
    images text,
    "name" text,
    other_info text,
    telephone text,
    PRIMARY KEY (id)
);

CREATE TABLE course_learning_objective (
    org_id text,
    course_id text,
    item_id text,
    object_type text,
    parent_id text,
    resource_id text,
    "status" text,
    title text,
    PRIMARY KEY (org_id, course_id),
    FOREIGN KEY (course_id) REFERENCES course(id)
);
