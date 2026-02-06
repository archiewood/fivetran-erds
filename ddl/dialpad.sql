CREATE TABLE channel_member (
    id text,
    channel_id text,
    "name" text,
    PRIMARY KEY (id, channel_id),
    FOREIGN KEY (channel_id) REFERENCES channel(id)
);

CREATE TABLE channel (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE office_phone_number (
    "index" text,
    office_id text,
    phone_number text,
    PRIMARY KEY ("index", office_id),
    FOREIGN KEY (office_id) REFERENCES office(id)
);

CREATE TABLE office_routing_option_closed_dtmf (
    "index" text,
    office_id text,
    input text,
    option_action text,
    option_action_target_id text,
    option_action_target_type text,
    PRIMARY KEY ("index", office_id),
    FOREIGN KEY (office_id) REFERENCES office(id)
);

CREATE TABLE office_routing_option_open_dtmf (
    "index" text,
    office_id text,
    input text,
    option_action text,
    option_action_target_id text,
    option_action_target_type text,
    PRIMARY KEY ("index", office_id),
    FOREIGN KEY (office_id) REFERENCES office(id)
);

CREATE TABLE office (
    id text,
    availability_status text,
    country text,
    e_911_address_address text,
    e_911_address_address_2 text,
    e_911_address_city text,
    e_911_address_country text,
    e_911_address_state text,
    e_911_address_zip text,
    first_action text,
    friday_hours jsonb,
    monday_hours jsonb,
    "name" text,
    no_operators_action text,
    ring_seconds text,
    routing_option_closed_action text,
    routing_option_closed_operator_routing text,
    routing_option_closed_try_dial_operator text,
    routing_option_open_action text,
    routing_option_open_action_target_id text,
    routing_option_open_action_target_type text,
    routing_option_open_operator_routing text,
    routing_option_open_try_dial_operator text,
    setting_allow_device_guest_login text,
    setting_block_caller_id_disabled text,
    setting_bridged_target_recording_allowed text,
    setting_disable_desk_phone_self_provision text,
    setting_disable_ivr_voicemail text,
    setting_no_recording_message_on_user_call text,
    setting_set_caller_id_disabled text,
    "state" text,
    thursday_hours jsonb,
    timezone text,
    tuesday_hours jsonb,
    wednesday_hours jsonb,
    PRIMARY KEY (id)
);

CREATE TABLE number (
    id text,
    company_id text,
    office_id text,
    target_id text,
    area_code text,
    "status" text,
    target_type text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (office_id) REFERENCES office(id),
    FOREIGN KEY (target_id) REFERENCES users(id)
);

CREATE TABLE call_center_phone_number (
    "index" text,
    call_center_id text,
    phone_number text,
    PRIMARY KEY ("index", call_center_id),
    FOREIGN KEY (call_center_id) REFERENCES call_center(id)
);

CREATE TABLE call_center_routing_option_closed_dtmf (
    "index" text,
    call_center_id text,
    input text,
    option_action text,
    option_action_target_id text,
    option_action_target_type text,
    PRIMARY KEY ("index", call_center_id),
    FOREIGN KEY (call_center_id) REFERENCES call_center(id)
);

CREATE TABLE call_center_routing_option_open_dtmf (
    "index" text,
    call_center_id text,
    input text,
    option_action text,
    option_action_target_id text,
    option_action_target_type text,
    PRIMARY KEY ("index", call_center_id),
    FOREIGN KEY (call_center_id) REFERENCES call_center(id)
);

CREATE TABLE call_center (
    id text,
    office_id text,
    advanced_setting_auto_call_recording_inbound text,
    advanced_setting_auto_call_recording_outbound text,
    advanced_setting_max_wrap_up_seconds text,
    alert_cc_service_level text,
    alert_cc_service_level_seconds text,
    availability_status text,
    country text,
    first_action text,
    friday_hours jsonb,
    group_description text,
    hold_queue_announce_position text,
    hold_queue_announcement_interval_seconds text,
    hold_queue_max_hold_count text,
    hold_queue_max_hold_seconds text,
    hold_queue_queue_callback_dtmf text,
    hold_queue_queue_callback_threshold text,
    hold_queue_queue_escape_dtmf text,
    hours_on text,
    monday_hours jsonb,
    "name" text,
    no_operators_action text,
    ring_second text,
    routing_option_closed_action text,
    routing_option_closed_operator_routing text,
    routing_option_closed_try_dial_operator text,
    routing_option_open_action text,
    routing_option_open_action_target_id text,
    routing_option_open_action_target_type text,
    routing_option_open_operator_routing text,
    routing_option_open_try_dial_operator text,
    "state" text,
    thursday_hours jsonb,
    timezone text,
    tuesday_hours jsonb,
    voice_intelligence_allow_pause text,
    voice_intelligence_auto_start text,
    wednesday_hours jsonb,
    PRIMARY KEY (id),
    FOREIGN KEY (office_id) REFERENCES office(id)
);

CREATE TABLE call_transcript (
    _fivetran_id text,
    call_id text,
    contact_id text,
    content text,
    "name" text,
    "time" text,
    "type" text,
    user_id text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (call_id) REFERENCES "call"(id)
);

CREATE TABLE contact_phone_number (
    "index" text,
    contact_id text,
    phone_number text,
    PRIMARY KEY ("index", contact_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE contact_email (
    "index" text,
    contact_id text,
    email text,
    PRIMARY KEY ("index", contact_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE contact (
    id text,
    company_name text,
    display_name text,
    extension text,
    first_name text,
    job_title text,
    last_name text,
    owner_id text,
    primary_email text,
    primary_phone text,
    trunk_group text,
    "type" text,
    urls jsonb,
    PRIMARY KEY (id)
);

CREATE TABLE company (
    id text,
    account_type text,
    country text,
    domain text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE department_phone_number (
    "index" text,
    department_id text,
    phone_number text,
    PRIMARY KEY ("index", department_id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (phone_number) REFERENCES number(id)
);

CREATE TABLE department_routing_option_closed_dtmf (
    "index" text,
    department_id text,
    input text,
    option_action text,
    option_action_target_id text,
    option_action_target_type text,
    PRIMARY KEY ("index", department_id),
    FOREIGN KEY (department_id) REFERENCES department(id)
);

CREATE TABLE department_routing_option_open_dtmf (
    "index" text,
    department_id text,
    input text,
    option_action text,
    option_action_target_id text,
    option_action_target_type text,
    PRIMARY KEY ("index", department_id),
    FOREIGN KEY (department_id) REFERENCES department(id)
);

CREATE TABLE department (
    id text,
    office_id text,
    auto_call_recording text,
    availability_status text,
    country text,
    first_action text,
    friday_hours jsonb,
    group_description text,
    hold_queue_allow_queuing text,
    hold_queue_max_hold_count text,
    hold_queue_max_hold_seconds text,
    hours_on text,
    monday_hours jsonb,
    "name" text,
    no_operators_action text,
    ring_seconds text,
    routing_option_closed_action text,
    routing_option_closed_operator_routing text,
    routing_option_closed_try_dial_operator text,
    routing_option_open_action text,
    routing_option_open_action_target_id text,
    routing_option_open_action_target_type text,
    routing_option_open_operator_routing text,
    routing_option_open_try_dial_operator text,
    "state" text,
    thursday_hours jsonb,
    timezone text,
    tuesday_hours jsonb,
    voice_intelligence_allow_pause text,
    voice_intelligence_auto_start text,
    wednesday_hours jsonb,
    PRIMARY KEY (id),
    FOREIGN KEY (office_id) REFERENCES office(id)
);

CREATE TABLE call_center_operator_duty_status (
    operator_id text,
    duty_status_reason text,
    duty_status_started text,
    on_duty text,
    on_duty_started text,
    on_duty_status text,
    PRIMARY KEY (operator_id),
    FOREIGN KEY (operator_id) REFERENCES call_center_operator(id)
);

CREATE TABLE call_router (
    id text,
    office_id text,
    default_target_id text,
    default_target_type text,
    enabled text,
    "name" text,
    routing_url text,
    signature_algo text,
    signature_secret text,
    signature_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (office_id) REFERENCES office(id)
);

CREATE TABLE office_license (
    _fivetran_id text,
    office_id text,
    additional_number_line text,
    contact_center_line text,
    fax_line text,
    room_line text,
    sell_line text,
    talk_line text,
    tollfree_additional_number_line text,
    tollfree_room_line text,
    uberconference_line text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (office_id) REFERENCES office(id)
);

CREATE TABLE call_center_operator_skill (
    call_center_id text,
    user_id text,
    skill_level text,
    PRIMARY KEY (call_center_id, user_id),
    FOREIGN KEY (call_center_id) REFERENCES call_center(id),
    FOREIGN KEY (user_id) REFERENCES call_center_operator(id)
);

CREATE TABLE user_admin_office_id (
    "index" text,
    user_id text,
    id text,
    PRIMARY KEY ("index", user_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (id) REFERENCES office(id)
);

CREATE TABLE user_forward_number (
    "index" text,
    user_id text,
    number text,
    PRIMARY KEY ("index", user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE user_group_detail (
    "index" text,
    user_id text,
    do_not_disturb text,
    id text,
    "role" text,
    "type" text,
    PRIMARY KEY ("index", user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE user_phone_number (
    "index" text,
    user_id text,
    phone_number text,
    PRIMARY KEY ("index", user_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (phone_number) REFERENCES number(id)
);

CREATE TABLE users (
    id text,
    company_id text,
    office_id text,
    country text,
    date_active text,
    date_added text,
    date_first_login text,
    do_not_disturb text,
    extension text,
    first_name text,
    image_url text,
    is_admin text,
    is_available text,
    is_on_duty text,
    is_online text,
    is_super_admin text,
    job_title text,
    languages text,
    last_name text,
    license text,
    location text,
    muted text,
    "state" text,
    status_message text,
    timezone text,
    PRIMARY KEY (id),
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (office_id) REFERENCES office(id)
);

CREATE TABLE room_phone_number (
    "index" text,
    room_id text,
    phone_number text,
    PRIMARY KEY ("index", room_id),
    FOREIGN KEY (room_id) REFERENCES room(id)
);

CREATE TABLE room (
    id text,
    company_id text,
    office_id text,
    country text,
    image_url text,
    is_free text,
    is_on_duty text,
    "name" text,
    "state" text,
    PRIMARY KEY (id),
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (office_id) REFERENCES office(id)
);

CREATE TABLE call_center_operator_admin (
    "index" text,
    call_center_operator_id text,
    office_id text,
    PRIMARY KEY ("index", call_center_operator_id),
    FOREIGN KEY (call_center_operator_id) REFERENCES call_center_operator(id),
    FOREIGN KEY (office_id) REFERENCES office(id)
);

CREATE TABLE call_center_operator_forwarded_number (
    "index" text,
    call_center_operator_id text,
    number text,
    PRIMARY KEY ("index", call_center_operator_id),
    FOREIGN KEY (call_center_operator_id) REFERENCES call_center_operator(id)
);

CREATE TABLE call_center_operator_email (
    "index" text,
    call_center_operator_id text,
    email text,
    PRIMARY KEY ("index", call_center_operator_id),
    FOREIGN KEY (call_center_operator_id) REFERENCES call_center_operator(id)
);

CREATE TABLE call_center_operator_group_detail (
    id text,
    call_center_operator_id text,
    do_not_disturb text,
    "role" text,
    "type" text,
    PRIMARY KEY (id, call_center_operator_id),
    FOREIGN KEY (call_center_operator_id) REFERENCES call_center_operator(id)
);

CREATE TABLE call_center_operator_phone_number (
    "index" text,
    call_center_operator_id text,
    phone_number text,
    PRIMARY KEY ("index", call_center_operator_id),
    FOREIGN KEY (call_center_operator_id) REFERENCES call_center_operator(id)
);

CREATE TABLE call_center_operator (
    id text,
    call_center_id text,
    company_id text,
    office_id text,
    country text,
    date_active text,
    date_added text,
    date_first_login text,
    do_not_disturb text,
    duty_status_reason text,
    duty_status_started text,
    extension text,
    first_name text,
    image_url text,
    is_admin text,
    is_available text,
    is_on_duty text,
    is_online text,
    is_super_admin text,
    job_title text,
    languages text,
    last_name text,
    license text,
    location text,
    muted text,
    on_duty_started text,
    on_duty_status text,
    "state" text,
    status_message text,
    timezone text,
    PRIMARY KEY (id, call_center_id),
    FOREIGN KEY (call_center_id) REFERENCES call_center(id),
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (office_id) REFERENCES office(id)
);

CREATE TABLE room_deskphone (
    id text,
    room_id text,
    byod text,
    mac_address text,
    "name" text,
    owner_id text,
    owner_type text,
    port text,
    realm text,
    ring_notification text,
    "type" text,
    PRIMARY KEY (id, room_id),
    FOREIGN KEY (room_id) REFERENCES room(id)
);

CREATE TABLE coaching_team (
    id text,
    company_id text,
    office_id text,
    allow_trainee_eavesdrop text,
    country text,
    "name" text,
    phone_numbers jsonb,
    ring_seconds text,
    "state" text,
    team_description text,
    PRIMARY KEY (id),
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (office_id) REFERENCES office(id)
);

CREATE TABLE coaching_team_member_admin (
    "index" text,
    coaching_team_id text,
    coaching_team_member_id text,
    office_id text,
    PRIMARY KEY ("index", coaching_team_id, coaching_team_member_id),
    FOREIGN KEY (coaching_team_id) REFERENCES coaching_team_member(coaching_team_id),
    FOREIGN KEY (coaching_team_member_id) REFERENCES coaching_team_member(id),
    FOREIGN KEY (office_id) REFERENCES office(id)
);

CREATE TABLE coaching_team_member_forward_number (
    "index" text,
    coaching_team_id text,
    coaching_team_member_id text,
    number text,
    PRIMARY KEY ("index", coaching_team_id, coaching_team_member_id),
    FOREIGN KEY (coaching_team_id) REFERENCES coaching_team_member(coaching_team_id),
    FOREIGN KEY (coaching_team_member_id) REFERENCES coaching_team_member(id)
);

CREATE TABLE coaching_team_member_email (
    "index" text,
    coaching_team_id text,
    coaching_team_member_id text,
    email text,
    PRIMARY KEY ("index", coaching_team_id, coaching_team_member_id),
    FOREIGN KEY (coaching_team_id) REFERENCES coaching_team_member(coaching_team_id),
    FOREIGN KEY (coaching_team_member_id) REFERENCES coaching_team_member(id)
);

CREATE TABLE coaching_team_member_phone_number (
    "index" text,
    coaching_team_id text,
    coaching_team_member_id text,
    phone_number text,
    PRIMARY KEY ("index", coaching_team_id, coaching_team_member_id),
    FOREIGN KEY (coaching_team_id) REFERENCES coaching_team_member(coaching_team_id),
    FOREIGN KEY (coaching_team_member_id) REFERENCES coaching_team_member(id)
);

CREATE TABLE coaching_team_member (
    id text,
    coaching_team_id text,
    company_id text,
    office_id text,
    country text,
    date_active text,
    date_added text,
    date_first_login text,
    do_not_disturb text,
    extension text,
    first_name text,
    image_url text,
    is_admin text,
    is_available text,
    is_on_duty text,
    is_online text,
    is_super_admin text,
    job_title text,
    languages text,
    last_name text,
    license text,
    location text,
    muted text,
    "name" text,
    "role" text,
    "state" text,
    status_message text,
    timezone text,
    PRIMARY KEY (id, coaching_team_id),
    FOREIGN KEY (coaching_team_id) REFERENCES coaching_team(id),
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (office_id) REFERENCES office(id)
);

CREATE TABLE call_recording_detail (
    id text,
    call_id text,
    duration text,
    recording_type text,
    start_time text,
    url text,
    PRIMARY KEY (id, call_id),
    FOREIGN KEY (call_id) REFERENCES "call"(id)
);

CREATE TABLE call_routing_breadcrumb (
    "index" text,
    call_id text,
    breadcrumb_type text,
    "date" text,
    request jsonb,
    response jsonb,
    url text,
    PRIMARY KEY ("index", call_id),
    FOREIGN KEY (call_id) REFERENCES "call"(id)
);

CREATE TABLE "call" (
    id text,
    contact_id text,
    admin_call_recording_share_links jsonb,
    call_recording_share_links jsonb,
    csat_recording_urls jsonb,
    csat_score text,
    csat_transcriptions jsonb,
    custom_data text,
    date_connected text,
    date_ended text,
    date_rang text,
    date_started text,
    direction text,
    duration text,
    entry_point_call_id text,
    entry_point_target_email text,
    entry_point_target_id text,
    entry_point_target_name text,
    entry_point_target_phone text,
    entry_point_target_type text,
    event_timestamp text,
    external_number text,
    group_id text,
    internal_number text,
    is_transferred text,
    labels jsonb,
    master_call_id text,
    mos_score text,
    operator_call_id text,
    proxy_target_email text,
    proxy_target_id text,
    proxy_target_name text,
    proxy_target_phone text,
    proxy_target_type text,
    screen_recording_urls jsonb,
    "state" text,
    target_email text,
    target_id text,
    target_name text,
    target_phone text,
    target_type text,
    total_duration text,
    transcription_text text,
    voicemail_share_link text,
    was_recorded text,
    PRIMARY KEY (id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);
