CREATE TABLE board_tag (
    id text,
    board_id text,
    PRIMARY KEY (id, board_id),
    FOREIGN KEY (board_id) REFERENCES board(id)
);

CREATE TABLE board_member (
    id text,
    board_id text,
    member_id text,
    deactivated text,
    member_type text,
    unconfirmed text,
    PRIMARY KEY (id),
    FOREIGN KEY (board_id) REFERENCES board(id),
    FOREIGN KEY (member_id) REFERENCES member(id)
);

CREATE TABLE board_switcher_view (
    _fivetran_id text,
    board_id text,
    enabled text,
    id text,
    view_type text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (board_id) REFERENCES board(id)
);

CREATE TABLE board_premium_feature (
    premium_feature text,
    board_id text,
    PRIMARY KEY (premium_feature, board_id),
    FOREIGN KEY (board_id) REFERENCES board(id)
);

CREATE TABLE board_background_image (
    url text,
    board_id text,
    height text,
    width text,
    PRIMARY KEY (url, board_id),
    FOREIGN KEY (board_id) REFERENCES board(id)
);

CREATE TABLE board_power_up (
    power_up text,
    board_id text,
    PRIMARY KEY (power_up, board_id),
    FOREIGN KEY (board_id) REFERENCES board(id)
);

CREATE TABLE board (
    id text,
    member_creator_id text,
    organization_id text,
    attachment_limit_per_board_disable_at text,
    attachment_limit_per_board_status text,
    attachment_limit_per_board_warn_at text,
    attachment_limit_per_card_disable_at text,
    attachment_limit_per_card_status text,
    attachment_limit_per_card_warn_at text,
    background text,
    background_bottom_color text,
    background_brightness text,
    background_color text,
    background_image text,
    background_tile text,
    background_top_color text,
    board_limit_access_requests_per_board_disable_at text,
    board_limit_access_requests_per_board_status text,
    board_limit_access_requests_per_board_warn_at text,
    board_limit_members_per_board_disable_at text,
    board_limit_members_per_board_status text,
    board_limit_members_per_board_warn_at text,
    board_source_id text,
    calendar_feed_enabled text,
    can_be_enterprise text,
    can_be_org text,
    can_be_private text,
    can_be_public text,
    can_invite text,
    card_aging text,
    card_covers text,
    card_limit_open_per_board_disable_at text,
    card_limit_open_per_board_status text,
    card_limit_open_per_board_warn_at text,
    card_limit_open_per_list_disable_at text,
    card_limit_open_per_list_status text,
    card_limit_open_per_list_warn_at text,
    card_limit_total_per_board_disable_at text,
    card_limit_total_per_board_status text,
    card_limit_total_per_board_warn_at text,
    card_limit_total_per_list_disable_at text,
    card_limit_total_per_list_status text,
    card_limit_total_per_list_warn_at text,
    check_item_limit_per_checklist_disable_at text,
    check_item_limit_per_checklist_status text,
    check_item_limit_per_checklist_warn_at text,
    checklist_limit_per_board_disable_at text,
    checklist_limit_per_board_status text,
    checklist_limit_per_board_warn_at text,
    checklist_limit_per_card_disable_at text,
    checklist_limit_per_card_status text,
    checklist_limit_per_card_warn_at text,
    closed text,
    comments text,
    creation_method text,
    custom_field_limit_per_board_disable_at text,
    custom_field_limit_per_board_status text,
    custom_field_limit_per_board_warn_at text,
    custom_field_option_limit_per_field_disable_at text,
    custom_field_option_limit_per_field_status text,
    custom_field_option_limit_per_field_warn_at text,
    date_closed text,
    date_last_activity text,
    date_last_view text,
    date_plugin_disable text,
    description text,
    emoji jsonb,
    enterprise_id text,
    enterprise_owned text,
    hidden_plugin_board_buttons jsonb,
    hide_votes text,
    invitations text,
    is_template text,
    ix_update text,
    label_limit_per_board_disable_at text,
    label_limit_per_board_status text,
    label_limit_per_board_warn_at text,
    list_limit_open_per_board_disable_at text,
    list_limit_open_per_board_status text,
    list_limit_open_per_board_warn_at text,
    list_limit_total_per_board_disable_at text,
    list_limit_total_per_board_status text,
    list_limit_total_per_board_warn_at text,
    "name" text,
    permission_level text,
    pinned text,
    reaction_limit_per_action_disable_at text,
    reaction_limit_per_action_status text,
    reaction_limit_per_action_warn_at text,
    reaction_limit_unique_per_action_disable_at text,
    reaction_limit_unique_per_action_status text,
    reaction_limit_unique_per_action_warn_at text,
    self_join text,
    short_link text,
    short_url text,
    starred text,
    sticker_limit_per_card_disable_at text,
    sticker_limit_per_card_status text,
    sticker_limit_per_card_warn_at text,
    subscribed text,
    template_gallery text,
    url text,
    voting text,
    PRIMARY KEY (id),
    FOREIGN KEY (member_creator_id) REFERENCES member(id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE organization_tag (
    id text,
    organization_id text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE board_custom_field_option (
    id text,
    board_custom_field_board_id text,
    custom_field_id text,
    color text,
    pos text,
    value_text text,
    PRIMARY KEY (id, board_custom_field_board_id, custom_field_id),
    FOREIGN KEY (board_custom_field_board_id) REFERENCES board_custom_field(board_id),
    FOREIGN KEY (custom_field_id) REFERENCES board_custom_field(id)
);

CREATE TABLE board_custom_field (
    id text,
    board_id text,
    display_card_front text,
    field_group text,
    is_suggested_field text,
    model_type text,
    "name" text,
    pos text,
    "type" text,
    PRIMARY KEY (id, board_id),
    FOREIGN KEY (board_id) REFERENCES board(id)
);

CREATE TABLE message_dismissed (
    id text,
    member_id text,
    count text,
    last_dismissed text,
    "name" text,
    PRIMARY KEY (id, member_id),
    FOREIGN KEY (member_id) REFERENCES member(id)
);

CREATE TABLE organization_admin (
    admin_id text,
    organization_id text,
    PRIMARY KEY (admin_id, organization_id),
    FOREIGN KEY (admin_id) REFERENCES member(id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE enterprise_admin (
    id text,
    member_id text,
    PRIMARY KEY (id, member_id),
    FOREIGN KEY (member_id) REFERENCES member(id)
);

CREATE TABLE member_trophy (
    trophy text,
    member_id text,
    PRIMARY KEY (trophy, member_id),
    FOREIGN KEY (member_id) REFERENCES member(id)
);

CREATE TABLE organization_member (
    member_id text,
    organization_id text,
    PRIMARY KEY (member_id, organization_id),
    FOREIGN KEY (member_id) REFERENCES member(id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE deactivated_enterprise (
    id text,
    member_id text,
    PRIMARY KEY (id, member_id),
    FOREIGN KEY (member_id) REFERENCES member(id)
);

CREATE TABLE member_premium_feature (
    premium_feature text,
    member_id text,
    PRIMARY KEY (premium_feature, member_id),
    FOREIGN KEY (member_id) REFERENCES member(id)
);

CREATE TABLE one_time_message_dismissed (
    one_time_message text,
    member_id text,
    PRIMARY KEY (one_time_message, member_id),
    FOREIGN KEY (member_id) REFERENCES member(id)
);

CREATE TABLE member_product (
    product text,
    member_id text,
    PRIMARY KEY (product, member_id),
    FOREIGN KEY (member_id) REFERENCES member(id)
);

CREATE TABLE member (
    id text,
    member_referrer_id text,
    aa_block_sync_until text,
    aa_email text,
    aa_enrolled_date text,
    aa_id text,
    activity_blocked text,
    avatar_hash text,
    avatar_privacy text,
    avatar_source text,
    avatar_url text,
    bio text,
    board_limit_total_per_member_disable_at text,
    board_limit_total_per_member_status text,
    board_limit_total_per_member_warn_at text,
    color_blind text,
    confirmed text,
    credentials_removed_count text,
    current_offset text,
    current_timezone text,
    domain_claimed text,
    email text,
    emoji jsonb,
    enterprise_id text,
    full_name text,
    full_name_privacy text,
    gold_sunset_free_trial_organization_id text,
    gravatar_hash text,
    initials text,
    is_aa_mastered text,
    ix_update text,
    locale text,
    login_types jsonb,
    marketing_opted_in text,
    marketing_opted_in_date text,
    member_type text,
    minutes_before_deadline_to_notify text,
    minutes_between_summaries text,
    next_date text,
    next_offset text,
    next_timezone text,
    non_public jsonb,
    non_public_available text,
    org_limit_total_per_member_disable_at text,
    org_limit_total_per_member_status text,
    org_limit_total_per_member_warn_at text,
    send_summaries text,
    "status" text,
    timezone text,
    two_factor_enabled text,
    two_factor_needs_new_backups text,
    uploaded_avatar_hash text,
    uploaded_avatar_url text,
    url text,
    username text,
    PRIMARY KEY (id),
    FOREIGN KEY (member_referrer_id) REFERENCES member(id)
);

CREATE TABLE card_label (
    board_id text,
    card_id text,
    label_id text,
    PRIMARY KEY (board_id, card_id, label_id),
    FOREIGN KEY (board_id) REFERENCES board(id),
    FOREIGN KEY (card_id) REFERENCES card(id),
    FOREIGN KEY (label_id) REFERENCES board_label(id)
);

CREATE TABLE card_member (
    card_id text,
    id text,
    PRIMARY KEY (card_id, id),
    FOREIGN KEY (card_id) REFERENCES card(id),
    FOREIGN KEY (id) REFERENCES member(id)
);

CREATE TABLE card_member_voted (
    card_id text,
    card_member_id text,
    PRIMARY KEY (card_id, card_member_id),
    FOREIGN KEY (card_id) REFERENCES card(id),
    FOREIGN KEY (card_member_id) REFERENCES card_member(id)
);

CREATE TABLE card (
    id text,
    attachment_cover_id text,
    board_id text,
    list_id text,
    attachment_cover_brightness text,
    attachment_cover_color text,
    attachment_cover_plugin_id text,
    attachment_cover_size text,
    attachment_cover_uploaded_background_id text,
    badge_attachment_by_type_board text,
    badge_attachment_by_type_card text,
    badge_attachments text,
    badge_check_items text,
    badge_check_items_checked text,
    badge_check_items_earliest_due text,
    badge_comments text,
    badge_description text,
    badge_fogbugz text,
    badge_location text,
    badge_subscribed text,
    badge_viewing_member_voted text,
    badge_votes text,
    card_role text,
    check_item_states jsonb,
    closed text,
    date_last_activity text,
    description text,
    due text,
    due_complete text,
    due_reminder text,
    email text,
    emoji jsonb,
    is_template text,
    manual_cover_attachment text,
    "name" text,
    "position" text,
    short_id text,
    short_link text,
    short_url text,
    "start" text,
    subscribed text,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (attachment_cover_id) REFERENCES card_attachment(id),
    FOREIGN KEY (board_id) REFERENCES board(id),
    FOREIGN KEY (list_id) REFERENCES list(id)
);

CREATE TABLE organization_product (
    product text,
    organization_id text,
    PRIMARY KEY (product, organization_id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE organization_power_up (
    power_up text,
    organization_id text,
    PRIMARY KEY (power_up, organization_id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE organization (
    id text,
    description text,
    display_name text,
    emoji jsonb,
    logo_hash text,
    logo_url text,
    "name" text,
    team_type text,
    url text,
    website text,
    PRIMARY KEY (id)
);

CREATE TABLE card_custom_field_item (
    id text,
    card_id text,
    id_value text,
    model_type text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id, card_id),
    FOREIGN KEY (card_id) REFERENCES card(id)
);

CREATE TABLE card_attachment (
    id text,
    card_id text,
    bytes text,
    "date" text,
    edge_color text,
    file_name text,
    is_upload text,
    member_id text,
    mime_type text,
    "name" text,
    "position" text,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (card_id) REFERENCES card(id)
);

CREATE TABLE organization_action (
    id text,
    member_creator_id text,
    organization_id text,
    app_creator text,
    data jsonb,
    "date" text,
    limits jsonb,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (member_creator_id) REFERENCES member(id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE check_item (
    id text,
    checklist_id text,
    member_id text,
    due text,
    emoji jsonb,
    "name" text,
    "position" text,
    "state" text,
    PRIMARY KEY (id),
    FOREIGN KEY (checklist_id) REFERENCES checklist(id),
    FOREIGN KEY (member_id) REFERENCES member(id)
);

CREATE TABLE checklist (
    id text,
    board_id text,
    card_id text,
    "name" text,
    "position" text,
    PRIMARY KEY (id),
    FOREIGN KEY (board_id) REFERENCES board(id),
    FOREIGN KEY (card_id) REFERENCES card(id)
);

CREATE TABLE board_label (
    id text,
    board_id text,
    color text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (board_id) REFERENCES board(id)
);

CREATE TABLE card_action (
    id text,
    card_id text,
    member_creator_id text,
    app_creator text,
    data jsonb,
    "date" text,
    limits jsonb,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (card_id) REFERENCES card(id),
    FOREIGN KEY (member_creator_id) REFERENCES member(id)
);

CREATE TABLE list_action (
    id text,
    list_id text,
    member_creator_id text,
    app_creator text,
    data jsonb,
    "date" text,
    limits jsonb,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (list_id) REFERENCES list(id),
    FOREIGN KEY (member_creator_id) REFERENCES member(id)
);

CREATE TABLE board_action (
    id text,
    board_id text,
    member_creator_id text,
    app_creator text,
    data jsonb,
    "date" text,
    limits jsonb,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (board_id) REFERENCES board(id),
    FOREIGN KEY (member_creator_id) REFERENCES member(id)
);

CREATE TABLE list (
    id text,
    board_id text,
    closed text,
    "name" text,
    "position" text,
    soft_limit text,
    subscribed text,
    PRIMARY KEY (id),
    FOREIGN KEY (board_id) REFERENCES board(id)
);
