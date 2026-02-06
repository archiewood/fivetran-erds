CREATE TABLE attendee_analytics (
    account_id text,
    event_id text,
    session_id text,
    ticket_id text,
    attended_type text,
    attendee_email text,
    attendee_first_name text,
    attendee_last_name text,
    checkin_time timestamp,
    checkout_time timestamp,
    created timestamp,
    modified timestamp,
    session_name text,
    PRIMARY KEY (account_id, event_id, session_id, ticket_id),
    FOREIGN KEY (event_id) REFERENCES event(id),
    FOREIGN KEY (session_id) REFERENCES "session"(id),
    FOREIGN KEY (ticket_id) REFERENCES registration_type(ticket_id)
);

CREATE TABLE contact (
    id text,
    event_id text,
    created timestamp,
    modified timestamp,
    -- contact_properties_* (dynamic column),
    PRIMARY KEY (id, event_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE event_template (
    id text,
    created timestamp,
    description text,
    event_type text,
    icon text,
    modified timestamp,
    "name" text,
    "status" text,
    PRIMARY KEY (id)
);

CREATE TABLE event_type (
    "index" text,
    event_id text,
    "type" text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE event_category (
    "index" text,
    event_id text,
    category text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE event (
    id text,
    archived text,
    attendance_type text,
    cover_photo_url text,
    created timestamp,
    description text,
    end_date timestamp,
    header_logo_url text,
    languages text,
    modified timestamp,
    "name" text,
    short_code text,
    start_date timestamp,
    "status" text,
    support_email text,
    timezone text,
    twitter_hashtag text,
    venue_address_1 text,
    venue_city text,
    venue_country text,
    venue_display_address text,
    venue_id text,
    venue_name text,
    venue_state text,
    website_url text,
    PRIMARY KEY (id)
);

CREATE TABLE registration (
    id text,
    contact_id text,
    event_id text,
    flow_id text,
    ticket_id text,
    charge text,
    checked_in text,
    checked_in_date timestamp,
    checkedout_date timestamp,
    created timestamp,
    currency text,
    fees text,
    form_submission_status text,
    invoice text,
    magic_link text,
    manage_registration_link text,
    modified timestamp,
    order_id text,
    order_type text,
    payment_date timestamp,
    payment_method text,
    payment_status text,
    price text,
    promo_code text,
    registration_date timestamp,
    social_promo text,
    swapped text,
    tax text,
    ticket_name text,
    validity text,
    virtual_checkin text,
    -- custom_billing_address_* (dynamic column),
    -- custom_properties_* (dynamic column),
    -- custom_utm_params_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (event_id) REFERENCES event(id),
    FOREIGN KEY (flow_id) REFERENCES registration_flow(id),
    FOREIGN KEY (ticket_id) REFERENCES registration_type(ticket_id)
);

CREATE TABLE event_goal (
    id text,
    event_id text,
    created timestamp,
    date_period text,
    end_timestamp timestamp,
    goal_value text,
    "interval" text,
    modified timestamp,
    start_timestamp timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE session_registration_setting (
    event_id text,
    allow_overlapping_registration text,
    capacity_limit text,
    capacity_limit_enabled text,
    capacity_limit_reached text,
    capacity_limit_reached_enabled text,
    capacity_unlimit text,
    capacity_unlimit_enabled text,
    -- custom_* (dynamic column),
    PRIMARY KEY (event_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE session_recording_view (
    id text,
    event_id text,
    session_id text,
    ticket_id text,
    email text,
    viewed_at text,
    PRIMARY KEY (id, event_id, session_id),
    FOREIGN KEY (event_id) REFERENCES event(id),
    FOREIGN KEY (session_id) REFERENCES "session"(id),
    FOREIGN KEY (ticket_id) REFERENCES registration_type(ticket_id)
);

CREATE TABLE session_rate (
    contact_id text,
    event_id text,
    session_id text,
    feedback text,
    rated text,
    score text,
    PRIMARY KEY (contact_id, event_id, session_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (event_id) REFERENCES event(id),
    FOREIGN KEY (session_id) REFERENCES "session"(id)
);

CREATE TABLE session_speaker (
    id text,
    event_id text,
    session_id text,
    speaker_id text,
    "role" text,
    PRIMARY KEY (id, event_id, session_id),
    FOREIGN KEY (event_id) REFERENCES "session"(event_id),
    FOREIGN KEY (session_id) REFERENCES "session"(id),
    FOREIGN KEY (speaker_id) REFERENCES speaker(id)
);

CREATE TABLE session_filter (
    id text,
    event_id text,
    session_id text,
    tags jsonb,
    PRIMARY KEY (id, event_id, session_id),
    FOREIGN KEY (event_id) REFERENCES "session"(event_id),
    FOREIGN KEY (session_id) REFERENCES "session"(id)
);

CREATE TABLE session_attachment (
    id text,
    event_id text,
    session_id text,
    display_name text,
    file_name text,
    icon text,
    "position" text,
    "type" text,
    PRIMARY KEY (id, event_id, session_id),
    FOREIGN KEY (event_id) REFERENCES "session"(event_id),
    FOREIGN KEY (session_id) REFERENCES "session"(id)
);

CREATE TABLE session_sponsor (
    "index" text,
    event_id text,
    session_id text,
    sponsor_id text,
    PRIMARY KEY ("index", event_id, session_id),
    FOREIGN KEY (event_id) REFERENCES "session"(event_id),
    FOREIGN KEY (session_id) REFERENCES "session"(id)
);

CREATE TABLE recording_authorization (
    "index" text,
    event_id text,
    recording_session_id text,
    session_id text,
    recording_authorization text,
    PRIMARY KEY ("index", event_id, recording_session_id, session_id),
    FOREIGN KEY (event_id) REFERENCES recording_session(event_id),
    FOREIGN KEY (recording_session_id) REFERENCES recording_session(id),
    FOREIGN KEY (session_id) REFERENCES recording_session(session_id)
);

CREATE TABLE recording_session (
    id text,
    event_id text,
    session_id text,
    broadcast_recording text,
    custom_asset_id text,
    external_asset_id text,
    original_asset_id text,
    recording_is_ready text,
    recording_primary_asset_type text,
    PRIMARY KEY (id, event_id, session_id),
    FOREIGN KEY (event_id) REFERENCES "session"(event_id),
    FOREIGN KEY (session_id) REFERENCES "session"(id)
);

CREATE TABLE preroll_session (
    id text,
    event_id text,
    session_id text,
    account_id text,
    asset_id text,
    future_asset_id text,
    PRIMARY KEY (id, event_id, session_id),
    FOREIGN KEY (event_id) REFERENCES "session"(event_id),
    FOREIGN KEY (session_id) REFERENCES "session"(id)
);

CREATE TABLE video_producer_session (
    "index" text,
    event_id text,
    session_id text,
    associated_provider_livestream_id text,
    guest_url text,
    host_url text,
    restream_video_producer_id text,
    video_producer_id text,
    video_producer_title text,
    PRIMARY KEY ("index", event_id, session_id),
    FOREIGN KEY (event_id) REFERENCES "session"(event_id),
    FOREIGN KEY (session_id) REFERENCES "session"(id)
);

CREATE TABLE session_asset (
    id text,
    event_id text,
    session_id text,
    account_id text,
    asset_association_id text,
    asset_id text,
    asset_is_primary text,
    asset_is_ready text,
    asset_media text,
    asset_metadata jsonb,
    asset_type text,
    creation_date_time timestamp,
    PRIMARY KEY (id, event_id, session_id),
    FOREIGN KEY (event_id) REFERENCES "session"(event_id),
    FOREIGN KEY (session_id) REFERENCES "session"(id)
);

CREATE TABLE "session" (
    id text,
    event_id text,
    location_id text,
    sublocation_id text,
    allow_rating text,
    associated_contact jsonb,
    background_color text,
    description text,
    description_html text,
    enable_recording_session text,
    enable_virtual_session text,
    end_date timestamp,
    end_minute text,
    external_id text,
    hidden text,
    image_type text,
    image_url text,
    moderator jsonb,
    private text,
    registration text,
    registration_capacity text,
    registration_capacity_enable text,
    registration_count text,
    registration_full text,
    registration_visibility text,
    session_card_size text,
    session_type text,
    start_date timestamp,
    start_minute text,
    text_color text,
    title text,
    virtual_session_details jsonb,
    -- onsite_visibility_* (dynamic column),
    PRIMARY KEY (id, event_id),
    FOREIGN KEY (event_id) REFERENCES event(id),
    FOREIGN KEY (location_id) REFERENCES agenda_setting_location(id),
    FOREIGN KEY (sublocation_id) REFERENCES agenda_setting_sublocation(id)
);

CREATE TABLE registration_type (
    ticket_id text,
    event_id text,
    currency_code text,
    "name" text,
    per_order_max text,
    per_order_min text,
    price text,
    quantity text,
    sale_method text,
    tax_rate text,
    PRIMARY KEY (ticket_id, event_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE session_checkin (
    event_id text,
    session_id text,
    ticket_id text,
    created timestamp,
    done_by_organizer text,
    overrule text,
    "status" text,
    PRIMARY KEY (event_id, session_id, ticket_id),
    FOREIGN KEY (event_id) REFERENCES event(id),
    FOREIGN KEY (session_id) REFERENCES "session"(id),
    FOREIGN KEY (ticket_id) REFERENCES registration_type(ticket_id)
);

CREATE TABLE agenda_setting_filter_url_filter_tag (
    id text,
    event_id text,
    filter_id text,
    "name" text,
    PRIMARY KEY (id, event_id, filter_id),
    FOREIGN KEY (event_id) REFERENCES agenda_setting_filter_url_filter(event_id),
    FOREIGN KEY (filter_id) REFERENCES agenda_setting_filter_url_filter(id)
);

CREATE TABLE agenda_setting_filter_url_filter (
    id text,
    event_id text,
    filter_url_id text,
    "name" text,
    "type" text,
    visible text,
    PRIMARY KEY (id, event_id, filter_url_id),
    FOREIGN KEY (event_id) REFERENCES agenda_setting_filter_url(event_id),
    FOREIGN KEY (filter_url_id) REFERENCES agenda_setting_filter_url(id)
);

CREATE TABLE agenda_setting_filter_url_location_sublocation (
    id text,
    event_id text,
    filter_url_id text,
    filter_url_location_id text,
    "name" text,
    PRIMARY KEY (id, event_id, filter_url_id, filter_url_location_id),
    FOREIGN KEY (event_id) REFERENCES agenda_setting_filter_url_location(event_id),
    FOREIGN KEY (filter_url_id) REFERENCES agenda_setting_filter_url_location(filter_url_id),
    FOREIGN KEY (filter_url_location_id) REFERENCES agenda_setting_filter_url_location(id)
);

CREATE TABLE agenda_setting_filter_url_location (
    id text,
    event_id text,
    filter_url_id text,
    "name" text,
    PRIMARY KEY (id, event_id, filter_url_id),
    FOREIGN KEY (event_id) REFERENCES agenda_setting_filter_url(id),
    FOREIGN KEY (filter_url_id) REFERENCES agenda_setting_filter_url(id)
);

CREATE TABLE agenda_setting_filter_url (
    id text,
    event_id text,
    end_date text,
    end_time text,
    "name" text,
    start_date text,
    start_time text,
    PRIMARY KEY (id, event_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE agenda_setting_filter_tag (
    id text,
    event_id text,
    filter_id text,
    "name" text,
    PRIMARY KEY (id, event_id, filter_id),
    FOREIGN KEY (event_id) REFERENCES agenda_setting_filter(event_id),
    FOREIGN KEY (filter_id) REFERENCES agenda_setting_filter(id)
);

CREATE TABLE agenda_setting_filter (
    id text,
    event_id text,
    "name" text,
    "type" text,
    visible text,
    PRIMARY KEY (id, event_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE agenda_setting_sublocation (
    id text,
    event_id text,
    location_id text,
    "name" text,
    PRIMARY KEY (id, event_id, location_id),
    FOREIGN KEY (event_id) REFERENCES agenda_setting_location(event_id),
    FOREIGN KEY (location_id) REFERENCES agenda_setting_location(id)
);

CREATE TABLE agenda_setting_location (
    id text,
    event_id text,
    "name" text,
    PRIMARY KEY (id, event_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE partner_custom_button (
    "index" text,
    event_id text,
    partner_id text,
    "name" text,
    url text,
    PRIMARY KEY ("index", event_id, partner_id),
    FOREIGN KEY (event_id) REFERENCES partner(event_id),
    FOREIGN KEY (partner_id) REFERENCES partner(id)
);

CREATE TABLE partner_mobile_custom_button (
    "index" text,
    event_id text,
    partner_id text,
    "name" text,
    url text,
    PRIMARY KEY ("index", event_id, partner_id),
    FOREIGN KEY (event_id) REFERENCES partner(event_id),
    FOREIGN KEY (partner_id) REFERENCES partner(id)
);

CREATE TABLE partner (
    id text,
    event_id text,
    booth text,
    contact_email text,
    contact_phone text,
    created timestamp,
    description text,
    email text,
    external_id text,
    facebook text,
    "level" text,
    linkedin text,
    logo text,
    modified timestamp,
    "name" text,
    position_in_list text,
    promoted_offer text,
    twitter text,
    "type" text,
    visible text,
    website text,
    PRIMARY KEY (id, event_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE speaker (
    id text,
    event_id text,
    bio text,
    blog text,
    company text,
    country text,
    created timestamp,
    email text,
    first_name text,
    hidden text,
    last_name text,
    linked_in text,
    modified timestamp,
    photo_set_blur text,
    photo_set_large text,
    photo_set_medium text,
    photo_set_small text,
    prefix text,
    title text,
    twitter_handle text,
    web text,
    PRIMARY KEY (id, event_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE contact_list (
    id text,
    event_id text,
    created timestamp,
    "name" text,
    "size" text,
    "type" text,
    PRIMARY KEY (id, event_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE session_starring (
    event_id text,
    session_id text,
    contact_id text,
    starred text,
    PRIMARY KEY (event_id, session_id),
    FOREIGN KEY (event_id) REFERENCES event(id),
    FOREIGN KEY (session_id) REFERENCES "session"(id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE registration_property_value (
    "index" text,
    flow_id text,
    "value" text,
    PRIMARY KEY ("index", flow_id),
    FOREIGN KEY (flow_id) REFERENCES registration_type_property(flow_id)
);

CREATE TABLE registration_type_property (
    "index" text,
    flow_id text,
    label text,
    "name" text,
    "type" text,
    PRIMARY KEY ("index", flow_id),
    FOREIGN KEY (flow_id) REFERENCES registration_form(flow_id)
);

CREATE TABLE registration_form (
    flow_id text,
    event_id text,
    PRIMARY KEY (flow_id),
    FOREIGN KEY (flow_id) REFERENCES registration_flow(id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE registration_flow (
    id text,
    event_id text,
    active text,
    flow_name text,
    PRIMARY KEY (id, event_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);
