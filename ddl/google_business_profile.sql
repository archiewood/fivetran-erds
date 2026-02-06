CREATE TABLE location_additional_phone_number (
    "index" text,
    location_id text,
    phone_number text,
    PRIMARY KEY ("index", location_id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE location_regular_hour_period (
    "index" text,
    location_id text,
    close_day text,
    close_time_hours text,
    close_time_minutes text,
    close_time_nanos text,
    close_time_seconds text,
    open_day text,
    open_time_hours text,
    open_time_minutes text,
    open_time_nanos text,
    open_time_seconds text,
    PRIMARY KEY ("index", location_id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE location_primary_category_hour_type (
    "index" text,
    location_id text,
    display_name text,
    hour_type_id text,
    localized_display_name text,
    primary_category_name text,
    PRIMARY KEY ("index", location_id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE location_primary_category_service_type (
    service_type_id text,
    location_id text,
    display_name text,
    PRIMARY KEY (service_type_id, location_id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE location_additional_category_service_type (
    service_type_id text,
    location_additional_category_index text,
    location_id text,
    display_name text,
    PRIMARY KEY (service_type_id, location_additional_category_index, location_id),
    FOREIGN KEY (location_additional_category_index) REFERENCES location_additional_category("index"),
    FOREIGN KEY (location_id) REFERENCES location_additional_category(location_id)
);

CREATE TABLE location_additional_category_hour_type (
    "index" text,
    location_additional_category_index text,
    location_id text,
    display_name text,
    hour_type_id text,
    localized_display_name text,
    PRIMARY KEY ("index", location_additional_category_index, location_id),
    FOREIGN KEY (location_additional_category_index) REFERENCES location_additional_category("index"),
    FOREIGN KEY (location_id) REFERENCES location_additional_category(location_id)
);

CREATE TABLE location_additional_category (
    "index" text,
    location_id text,
    display_name text,
    "name" text,
    PRIMARY KEY ("index", location_id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE location_special_hour_period (
    "index" text,
    location_id text,
    close_time_hours text,
    close_time_minutes text,
    close_time_nanos text,
    close_time_seconds text,
    closed text,
    end_date_day text,
    end_date_month text,
    end_date_year text,
    open_time_hours text,
    open_time_minutes text,
    open_time_nanos text,
    open_time_seconds text,
    start_date_day text,
    start_date_month text,
    start_date_year text,
    PRIMARY KEY ("index", location_id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE location_service_area_place (
    place_id text,
    location_id text,
    place_name text,
    PRIMARY KEY (place_id, location_id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE location_label (
    "index" text,
    location_id text,
    label text,
    PRIMARY KEY ("index", location_id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE location_relationship_data_children_location (
    place_id text,
    location_id text,
    relation_type text,
    PRIMARY KEY (place_id, location_id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE location_more_hour_period (
    "index" text,
    location_id text,
    location_more_hour_index text,
    close_day text,
    close_time_hours text,
    close_time_minutes text,
    close_time_nanos text,
    close_time_seconds text,
    open_day text,
    open_time_hours text,
    open_time_minutes text,
    open_time_nanos text,
    open_time_seconds text,
    PRIMARY KEY ("index", location_id, location_more_hour_index),
    FOREIGN KEY (location_id) REFERENCES location_more_hour(location_id),
    FOREIGN KEY (location_more_hour_index) REFERENCES location_more_hour("index")
);

CREATE TABLE location_more_hour (
    "index" text,
    location_id text,
    hour_type_id text,
    PRIMARY KEY ("index", location_id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE location_service_item (
    "index" text,
    location_id text,
    free_form_service_item_category text,
    free_form_service_item_label_description text,
    free_form_service_item_label_display_name text,
    free_form_service_item_label_language_code text,
    price_currency_code text,
    price_nanos text,
    price_units text,
    structured_service_description text,
    structured_service_type_id text,
    PRIMARY KEY ("index", location_id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE location (
    id text,
    account_id text,
    ad_word_location_extension_phone text,
    language_code text,
    latitude text,
    longitude text,
    open_info_can_reopen text,
    open_info_status text,
    opening_date_day text,
    opening_date_month text,
    opening_date_year text,
    primary_category_display_name text,
    primary_category_name text,
    primary_phone_number text,
    profile_description text,
    relationship_data_parent_chain text,
    relationship_data_parent_place_id text,
    relationship_data_parent_relation_type text,
    service_area_business_type text,
    service_area_region_code text,
    store_code text,
    storefront_address_administrative_area text,
    storefront_address_language_code text,
    storefront_address_lines jsonb,
    storefront_address_locality text,
    storefront_address_organization text,
    storefront_address_postal_code text,
    storefront_address_recipients jsonb,
    storefront_address_region_code text,
    storefront_address_revision text,
    storefront_address_sorting_code text,
    storefront_address_sub_locality text,
    title text,
    website_uri text,
    -- metadata_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE location_admin (
    id text,
    location_id text,
    account_id text,
    "admin" text,
    pending_invitation text,
    "role" text,
    PRIMARY KEY (id, location_id),
    FOREIGN KEY (location_id) REFERENCES location(id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE account (
    id text,
    account_name text,
    account_number text,
    organization_address_administrative_area text,
    organization_address_language_code text,
    organization_address_lines jsonb,
    organization_address_locality text,
    organization_address_organization text,
    organization_address_postal_code text,
    organization_address_recipients jsonb,
    organization_address_region_code text,
    organization_address_revision text,
    organization_address_sorting_code text,
    organization_address_sub_locality text,
    organization_phone_number text,
    organization_registered_domain text,
    permission_level text,
    primary_owner text,
    "role" text,
    "type" text,
    verification_state text,
    vetted_state text,
    PRIMARY KEY (id)
);

CREATE TABLE location_insight (
    _fivetran_id text,
    location_id text,
    daily_metric text,
    "day" text,
    "month" text,
    "value" text,
    "year" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE media (
    id text,
    account_id text,
    location_id text,
    attribution_profile_name text,
    attribution_profile_photo_url text,
    attribution_profile_url text,
    attribution_take_down_url text,
    create_time text,
    data_ref_resource_name text,
    description text,
    dimension_height_pixel text,
    dimension_width_pixel text,
    google_url text,
    insights_view_count text,
    location_association_category jsonb,
    location_association_price_list_item_id text,
    media_format text,
    source_url text,
    summary text,
    thumbnail_url text,
    PRIMARY KEY (id, account_id, location_id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE local_post_media (
    media_id text,
    account_id text,
    local_post_id text,
    location_id text,
    attribution_profile_name text,
    attribution_profile_photo_url text,
    attribution_profile_url text,
    attribution_take_down_url text,
    create_time text,
    data_ref_resource_name text,
    description text,
    dimension_height_pixel text,
    dimension_width_pixel text,
    google_url text,
    insights_view_count text,
    location_association_category jsonb,
    location_association_price_list_item_id text,
    media_format text,
    source_url text,
    summary text,
    thumbnail_url text,
    PRIMARY KEY (media_id, account_id, local_post_id, location_id),
    FOREIGN KEY (account_id) REFERENCES local_post(account_id),
    FOREIGN KEY (local_post_id) REFERENCES local_post(id),
    FOREIGN KEY (location_id) REFERENCES local_post(location_id)
);

CREATE TABLE local_post (
    id text,
    account_id text,
    location_id text,
    alert_type text,
    call_to_action_type text,
    call_to_action_url text,
    create_time text,
    event_schedule_end_date_day text,
    event_schedule_end_date_month text,
    event_schedule_end_date_year text,
    event_schedule_end_time_hours text,
    event_schedule_end_time_minutes text,
    event_schedule_end_time_nanos text,
    event_schedule_end_time_seconds text,
    event_schedule_start_date_day text,
    event_schedule_start_date_month text,
    event_schedule_start_date_year text,
    event_schedule_start_time_hours text,
    event_schedule_start_time_minutes text,
    event_schedule_start_time_nanos text,
    event_schedule_start_time_seconds text,
    event_title text,
    language_code text,
    offer_coupon_code text,
    offer_redeem_online_url text,
    offer_terms_conditions text,
    search_url text,
    "state" text,
    summary text,
    topic_type text,
    update_time text,
    PRIMARY KEY (id, account_id, location_id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE location_keyword_impression (
    _fivetran_id text,
    location_id text,
    end_date_day text,
    end_date_month text,
    end_date_year text,
    insights_value text,
    insights_value_threshold text,
    search_keyword text,
    start_date_day text,
    start_date_month text,
    start_date_year text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE review (
    id text,
    account_id text,
    location_id text,
    "comment" text,
    create_time text,
    "name" text,
    review_reply_comment text,
    review_reply_update_time text,
    reviewer_display_name text,
    reviewer_is_anonymous text,
    reviewer_profile_photo_url text,
    star_rating text,
    update_time text,
    PRIMARY KEY (id, account_id, location_id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE customer_media (
    id text,
    account_id text,
    location_id text,
    attribution_profile_name text,
    attribution_profile_photo_url text,
    attribution_profile_url text,
    attribution_take_down_url text,
    create_time text,
    data_ref_resource_name text,
    description text,
    dimension_height_pixel text,
    dimension_width_pixel text,
    google_url text,
    insights_view_count text,
    media_format text,
    source_url text,
    thumbnail_url text,
    PRIMARY KEY (id, account_id, location_id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);
