CREATE TABLE board_item (
    "index" text,
    board_id text,
    "type" text,
    PRIMARY KEY ("index", board_id),
    FOREIGN KEY (board_id) REFERENCES board(id)
);

CREATE TABLE board_groups_shared_with (
    "index" text,
    board_id text,
    groups_shared_with text,
    PRIMARY KEY ("index", board_id),
    FOREIGN KEY (board_id) REFERENCES board(id)
);

CREATE TABLE board (
    id text,
    collection_id text,
    last_modified_by_user text,
    board_group_id text,
    default_list boolean,
    description text,
    favorited boolean,
    favorited_date timestamp,
    last_modified timestamp,
    number_of_facts bigint,
    removed boolean,
    slug text,
    title text,
    PRIMARY KEY (id),
    FOREIGN KEY (collection_id) REFERENCES collection(id),
    FOREIGN KEY (last_modified_by_user) REFERENCES team_member(id)
);

CREATE TABLE collection_team_domain (
    domain text,
    collection_id text,
    capture boolean,
    domain text,
    verification_code text,
    verified boolean,
    PRIMARY KEY (domain, collection_id),
    FOREIGN KEY (collection_id) REFERENCES collection(id)
);

CREATE TABLE collection (
    id text,
    default_group_id text,
    billable_users bigint,
    clear_profile_pic boolean,
    collection_created boolean,
    company_name text,
    date_created timestamp,
    default_user_type text,
    deleted boolean,
    domain text,
    edition_code text,
    edition_features text,
    edition_id text,
    edition_key text,
    edition_name text,
    edition_usage text,
    file_sharing_disabled boolean,
    hubspot_contact_data text,
    "name" text,
    profile_pic_url text,
    sfdc_integration_installed boolean,
    sfdc_integration_state text,
    slack_command_installed boolean,
    slack_command_state text,
    "status" text,
    team_creation_token text,
    total_users bigint,
    trial_expiration_date text,
    use_case text,
    user_role text,
    zendesk_assist_installed boolean,
    zendesk_assist_state text,
    zendesk_knowledge_installed boolean,
    zendesk_knowledge_state text,
    zoom_chat_state text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (default_group_id) REFERENCES user_group(id)
);

CREATE TABLE user_group_member (
    id text,
    user_group_id text,
    PRIMARY KEY (id, user_group_id),
    FOREIGN KEY (id) REFERENCES team_member(id),
    FOREIGN KEY (user_group_id) REFERENCES user_group(id)
);

CREATE TABLE user_group (
    id text,
    date_created timestamp,
    expert_id_rank bigint,
    group_identifier text,
    managed_by_scim boolean,
    modifiable boolean,
    "name" text,
    number_of_cards_as_verifier bigint,
    number_of_members bigint,
    "role" text,
    single_user boolean,
    user_modifiable boolean,
    PRIMARY KEY (id)
);

CREATE TABLE team_member_group (
    group_id text,
    team_member_id text,
    PRIMARY KEY (group_id, team_member_id),
    FOREIGN KEY (group_id) REFERENCES user_group(id),
    FOREIGN KEY (team_member_id) REFERENCES team_member(id)
);

CREATE TABLE team_member_user_profile_use_case_list (
    "index" text,
    team_member_id text,
    description text,
    PRIMARY KEY ("index", team_member_id),
    FOREIGN KEY (team_member_id) REFERENCES team_member(id)
);

CREATE TABLE team_member (
    id text,
    highest_role text,
    managed_by_scim boolean,
    number_of_cards_as_verifier bigint,
    token text,
    user_attributes text,
    user_email text,
    user_first_name text,
    user_last_name text,
    user_profile_pic_url text,
    user_profile_role text,
    user_profile_role_level text,
    user_role text,
    user_status text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE alert (
    id text,
    card_id text,
    group_id text,
    sent_by_user text,
    card_title text,
    collection_hex_color text,
    date_sent timestamp,
    note text,
    percent_read bigint,
    read_count bigint,
    unread_count bigint,
    user_role text,
    user_role_level text,
    PRIMARY KEY (id),
    FOREIGN KEY (card_id) REFERENCES card(id),
    FOREIGN KEY (group_id) REFERENCES user_group(id),
    FOREIGN KEY (sent_by_user) REFERENCES team_member(id)
);

CREATE TABLE event (
    _fivetran_id text,
    team_id text,
    "user" text,
    event_date timestamp,
    event_type text,
    id text,
    "type" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (team_id) REFERENCES team(id),
    FOREIGN KEY ("user") REFERENCES team_member(id)
);

CREATE TABLE card_tag (
    card_id text,
    tag_id text,
    PRIMARY KEY (card_id, tag_id),
    FOREIGN KEY (card_id) REFERENCES card(id),
    FOREIGN KEY (tag_id) REFERENCES tags(id)
);

CREATE TABLE card_collaborator (
    card_id text,
    id text,
    date_created text,
    removed boolean,
    "type" text,
    PRIMARY KEY (card_id, id),
    FOREIGN KEY (card_id) REFERENCES card(id),
    FOREIGN KEY (id) REFERENCES team_member(id)
);

CREATE TABLE card_verifier (
    card_id text,
    id text,
    date_created timestamp,
    "type" text,
    PRIMARY KEY (card_id, id),
    FOREIGN KEY (card_id) REFERENCES card(id),
    FOREIGN KEY (id) REFERENCES team_member(id)
);

CREATE TABLE card_board (
    card_id text,
    id text,
    PRIMARY KEY (card_id, id),
    FOREIGN KEY (card_id) REFERENCES card(id),
    FOREIGN KEY (id) REFERENCES board(id)
);

CREATE TABLE card_attachment (
    id text,
    card_id text,
    extension text,
    filename text,
    link text,
    mimetype text,
    previewable boolean,
    "size" bigint,
    thumbnail_link text,
    PRIMARY KEY (id, card_id),
    FOREIGN KEY (card_id) REFERENCES card(id)
);

CREATE TABLE card (
    id text,
    card_template_id text,
    collection_id text,
    last_modified_by_user text,
    last_verified_by_user text,
    original_owner_email text,
    verification_initiator_email text,
    archived boolean,
    card_info_analytics text,
    card_info_members_with_card_view bigint,
    card_info_members_without_card_view bigint,
    card_type text,
    comment_count bigint,
    content text,
    date_created timestamp,
    favorited boolean,
    favorited_date timestamp,
    last_modified timestamp,
    last_verified timestamp,
    last_viewed timestamp,
    next_verification_date timestamp,
    owner_email text,
    preferred_phrase text,
    public_link_allowed boolean,
    share_status text,
    slug text,
    suppress_verification boolean,
    sync_info_content_sync_type text,
    sync_info_external_url text,
    sync_info_last_sync_date timestamp,
    sync_info_last_update_date timestamp,
    team_id text,
    verification_initiation_date text,
    verification_interval bigint,
    verification_reason text,
    verification_reasons jsonb,
    verification_state text,
    verification_type text,
    version bigint,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (card_template_id) REFERENCES card_template(id),
    FOREIGN KEY (collection_id) REFERENCES collection(id),
    FOREIGN KEY (last_modified_by_user) REFERENCES team_member(id),
    FOREIGN KEY (last_verified_by_user) REFERENCES team_member(id),
    FOREIGN KEY (original_owner_email) REFERENCES team_member(id),
    FOREIGN KEY (verification_initiator_email) REFERENCES team_member(id)
);

CREATE TABLE card_comment_reply (
    id text,
    card_comment_card_id text,
    card_comment_id text,
    content text,
    date_created timestamp,
    deleted boolean,
    last_modified timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (card_comment_card_id) REFERENCES card_comment(id),
    FOREIGN KEY (card_comment_id) REFERENCES card_comment(id)
);

CREATE TABLE card_comment (
    id text,
    card_id text,
    owner_email text,
    reply_owner_email text,
    content text,
    date_created timestamp,
    deleted boolean,
    last_modified timestamp,
    "status" text,
    total_replies bigint,
    PRIMARY KEY (id, card_id),
    FOREIGN KEY (card_id) REFERENCES card(id),
    FOREIGN KEY (owner_email) REFERENCES team_member(id),
    FOREIGN KEY (reply_owner_email) REFERENCES team_member(id)
);

CREATE TABLE task (
    id text,
    card_id text,
    comment_id text,
    comment_reply_id text,
    creator text,
    date_sent timestamp,
    mention text,
    user_task_id text,
    viewed boolean,
    PRIMARY KEY (id),
    FOREIGN KEY (card_id) REFERENCES card(id),
    FOREIGN KEY (comment_id) REFERENCES card_comment(id),
    FOREIGN KEY (comment_reply_id) REFERENCES card_comment_reply(id),
    FOREIGN KEY (creator) REFERENCES team_member(id)
);

CREATE TABLE tags (
    id text,
    category_id text,
    category_name text,
    number_of_cards bigint,
    "value" text,
    PRIMARY KEY (id),
    FOREIGN KEY (category_id) REFERENCES tag_category(id)
);

CREATE TABLE tag_category (
    id text,
    collection_id text,
    created_by_user text,
    date_created timestamp,
    default_category boolean,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (collection_id) REFERENCES collection(id),
    FOREIGN KEY (created_by_user) REFERENCES team_member(id)
);

CREATE TABLE card_template_tag (
    id text,
    template_id text,
    category_id text,
    category_name text,
    number_of_cards bigint,
    "value" text,
    PRIMARY KEY (id, template_id),
    FOREIGN KEY (template_id) REFERENCES card_template(id),
    FOREIGN KEY (category_id) REFERENCES tag_category(id)
);

CREATE TABLE card_template_board (
    board_id text,
    card_template_id text,
    PRIMARY KEY (board_id, card_template_id),
    FOREIGN KEY (board_id) REFERENCES board(id),
    FOREIGN KEY (card_template_id) REFERENCES card_template(id)
);

CREATE TABLE card_template (
    id text,
    card_verifier_id text,
    collection_id text,
    created_by_user text,
    last_modified_by_user text,
    card_title text,
    card_verifier_date_created timestamp,
    card_verifier_id text,
    card_verifier_type text,
    content text,
    content_model_version_value text,
    date_created timestamp,
    description text,
    json_content text,
    last_modified timestamp,
    share_status text,
    template_title text,
    verification_interval bigint,
    PRIMARY KEY (id),
    FOREIGN KEY (card_verifier_id) REFERENCES team_member(id),
    FOREIGN KEY (collection_id) REFERENCES collection(id),
    FOREIGN KEY (created_by_user) REFERENCES team_member(id),
    FOREIGN KEY (last_modified_by_user) REFERENCES team_member(id),
    FOREIGN KEY (card_verifier_id) REFERENCES team_member(id)
);

CREATE TABLE ticket_link (
    _fivetran_id text,
    card_id text,
    user_email text,
    conversation_id text,
    "date" timestamp,
    platform text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (card_id) REFERENCES card(id),
    FOREIGN KEY (user_email) REFERENCES team_member(id)
);

CREATE TABLE team_domain (
    domain text,
    team_id text,
    capture boolean,
    verification_code text,
    verified boolean,
    PRIMARY KEY (domain, team_id),
    FOREIGN KEY (domain) REFERENCES team(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE team (
    id text,
    team_default_group_id text,
    users_email text,
    billable_users bigint,
    clear_profile_pic boolean,
    collection_created boolean,
    company_name text,
    date_created timestamp,
    default_group_id text,
    default_user_type text,
    deleted boolean,
    domain text,
    edition_code text,
    edition_features text,
    edition_id text,
    edition_key text,
    edition_name text,
    edition_usage text,
    file_sharing_disabled boolean,
    hubspot_contact_data text,
    "name" text,
    profile_pic_url text,
    sfdc_integration_installed boolean,
    sfdc_integration_state text,
    slack_command_installed boolean,
    slack_command_state text,
    "status" text,
    team_creation_token text,
    total_users bigint,
    trial_expiration_date text,
    use_case text,
    user_role text,
    zendesk_assist_installed boolean,
    zendesk_assist_state text,
    zendesk_knowledge_installed boolean,
    zendesk_knowledge_state text,
    zoom_chat_state text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (team_default_group_id) REFERENCES user_group(id),
    FOREIGN KEY (users_email) REFERENCES users(email)
);

CREATE TABLE users (
    email text,
    collection_id text,
    collection_administrator boolean,
    collection_boards bigint,
    collection_cards bigint,
    collection_color text,
    collection_date_created timestamp,
    collection_default_verifier text,
    collection_description text,
    collection_last_synced_date timestamp,
    collection_public_cards bigint,
    collection_public_cards_enabled text,
    collection_slug text,
    collection_stats_additional_prop_type text,
    collection_sync_type text,
    collection_sync_verification_enabled boolean,
    collection_tags bigint,
    collection_token text,
    collection_top_level_sync_location text,
    collection_type text,
    collection_type_detail text,
    collection_verification_interval bigint,
    token_type text,
    PRIMARY KEY (email),
    FOREIGN KEY (collection_id) REFERENCES collection(id)
);
