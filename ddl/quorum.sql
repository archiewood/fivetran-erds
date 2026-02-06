CREATE TABLE custom_field_limited_to_team (
    team_id text,
    custom_field_id text,
    PRIMARY KEY (team_id, custom_field_id),
    FOREIGN KEY (custom_field_id) REFERENCES custom_field(id)
);

CREATE TABLE custom_field (
    id text,
    group_id text,
    organization_id text,
    archived text,
    conditional_boolean_value text,
    conditional_list_value jsonb,
    conditional_parent_custom_field text,
    conditional_string_value text,
    created text,
    creator text,
    default_boolean_value text,
    default_multi_value jsonb,
    default_string_value text,
    default_value text,
    description text,
    display_null_value text,
    display_on_create_page text,
    display_on_filter text,
    display_on_profile text,
    external_description text,
    external_name text,
    extra jsonb,
    is_editable text,
    is_hyperlinkable text,
    is_required text,
    "name" text,
    "option" jsonb,
    option_display_type text,
    options_new jsonb,
    precedence text,
    slug text,
    tag_owner text,
    tag_type text,
    updated text,
    used_to_generate_outbox_email_list text,
    PRIMARY KEY (id),
    FOREIGN KEY (group_id) REFERENCES custom_field_group(id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE issue_management_search_term (
    "index" text,
    issue_management_id text,
    term text,
    PRIMARY KEY ("index", issue_management_id),
    FOREIGN KEY (issue_management_id) REFERENCES issue_management(id)
);

CREATE TABLE issue_management_category (
    "index" text,
    issue_management_id text,
    category text,
    PRIMARY KEY ("index", issue_management_id),
    FOREIGN KEY (issue_management_id) REFERENCES issue_management(id)
);

CREATE TABLE issue_management_magic_board (
    "index" text,
    issue_management_id text,
    magic_board text,
    PRIMARY KEY ("index", issue_management_id),
    FOREIGN KEY (issue_management_id) REFERENCES issue_management(id)
);

CREATE TABLE issue_management_team (
    issue_management_id text,
    team_id text,
    PRIMARY KEY (issue_management_id, team_id),
    FOREIGN KEY (issue_management_id) REFERENCES issue_management(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE issue_management_organization (
    issue_management_id text,
    oragnization_id text,
    PRIMARY KEY (issue_management_id, oragnization_id),
    FOREIGN KEY (issue_management_id) REFERENCES issue_management(id),
    FOREIGN KEY (oragnization_id) REFERENCES organization(id)
);

CREATE TABLE issue_management_participant (
    participant_id text,
    issue_management_id text,
    PRIMARY KEY (participant_id, issue_management_id),
    FOREIGN KEY (issue_management_id) REFERENCES issue_management(id)
);

CREATE TABLE issue_management (
    id text,
    creator_id text,
    archived text,
    can_be_tagged_to_interaction text,
    category jsonb,
    converted text,
    cost text,
    creator_edit_only text,
    creator_username text,
    deadline text,
    defaults text,
    due_date text,
    extra jsonb,
    grassroots_order text,
    grassroots_page_layout_type text,
    grassroots_vanity_url_slug text,
    icon text,
    image_url text,
    is_carryover text,
    is_grassroots_issue text,
    is_issue text,
    is_limited_to_creator text,
    is_visible_to_partner text,
    issue_expert text,
    long_description text,
    management_statistics jsonb,
    "name" text,
    number_of_campaign text,
    number_of_campaign_action text,
    number_of_interaction text,
    parent text,
    priority text,
    project_type text,
    region_tag text,
    related_region text,
    remove_with_stance text,
    resource_uri text,
    short_description text,
    shown_in_table text,
    "year" text,
    PRIMARY KEY (id),
    FOREIGN KEY (creator_id) REFERENCES users(id)
);

CREATE TABLE bulk_email_search_param_dehydrate (
    "index" text,
    _fivetran_id text,
    bulk_email_data_id text,
    bulk_email_id text,
    "name" text,
    PRIMARY KEY ("index", _fivetran_id, bulk_email_data_id, bulk_email_id),
    FOREIGN KEY (_fivetran_id) REFERENCES bulk_email_search_param(_fivetran_id),
    FOREIGN KEY (bulk_email_data_id) REFERENCES bulk_email_data(id),
    FOREIGN KEY (bulk_email_id) REFERENCES bulk_email(id)
);

CREATE TABLE bulk_email_search_param_most_recent (
    "index" text,
    _fivetran_id text,
    bulk_email_data_id text,
    bulk_email_id text,
    param text,
    PRIMARY KEY ("index", _fivetran_id, bulk_email_data_id, bulk_email_id),
    FOREIGN KEY (_fivetran_id) REFERENCES bulk_email_search_param(_fivetran_id),
    FOREIGN KEY (bulk_email_data_id) REFERENCES bulk_email_data(id),
    FOREIGN KEY (bulk_email_id) REFERENCES bulk_email(id)
);

CREATE TABLE bulk_email_search_param_minor_role (
    "index" text,
    _fivetran_id text,
    bulk_email_data_id text,
    bulk_email_id text,
    id text,
    PRIMARY KEY ("index", _fivetran_id, bulk_email_data_id, bulk_email_id),
    FOREIGN KEY (_fivetran_id) REFERENCES bulk_email_search_param(_fivetran_id),
    FOREIGN KEY (bulk_email_data_id) REFERENCES bulk_email_data(id),
    FOREIGN KEY (bulk_email_id) REFERENCES bulk_email(id)
);

CREATE TABLE bulk_email_search_param_staffer_chamber (
    "index" text,
    _fivetran_id text,
    bulk_email_data_id text,
    bulk_email_id text,
    id text,
    PRIMARY KEY ("index", _fivetran_id, bulk_email_data_id, bulk_email_id),
    FOREIGN KEY (_fivetran_id) REFERENCES bulk_email_search_param(_fivetran_id),
    FOREIGN KEY (bulk_email_data_id) REFERENCES bulk_email_data(id),
    FOREIGN KEY (bulk_email_id) REFERENCES bulk_email(id)
);

CREATE TABLE bulk_email_search_param_added_id (
    "index" text,
    _fivetran_id text,
    bulk_email_data_id text,
    bulk_email_id text,
    id text,
    PRIMARY KEY ("index", _fivetran_id, bulk_email_data_id, bulk_email_id),
    FOREIGN KEY (_fivetran_id) REFERENCES bulk_email_search_param(_fivetran_id),
    FOREIGN KEY (bulk_email_data_id) REFERENCES bulk_email_data(id),
    FOREIGN KEY (bulk_email_id) REFERENCES bulk_email(id)
);

CREATE TABLE bulk_email_search_param (
    _fivetran_id text,
    bulk_email_data_id text,
    bulk_email_id text,
    for_outbox text,
    hygiene_staffer_type text,
    ph_current text,
    show_in_quicksearch text,
    staffer_tittle_deleted_id text,
    staffer_tittle_query_set_list text,
    staffer_tittle_searchify_count text,
    PRIMARY KEY (_fivetran_id, bulk_email_data_id, bulk_email_id),
    FOREIGN KEY (bulk_email_data_id) REFERENCES bulk_email_data(id),
    FOREIGN KEY (bulk_email_id) REFERENCES bulk_email(id)
);

CREATE TABLE bulk_email_region (
    "index" text,
    bulk_email_data_id text,
    bulk_email_id text,
    region text,
    PRIMARY KEY ("index", bulk_email_data_id, bulk_email_id),
    FOREIGN KEY (bulk_email_data_id) REFERENCES bulk_email_data(id),
    FOREIGN KEY (bulk_email_id) REFERENCES bulk_email(id)
);

CREATE TABLE bulk_email_data (
    id text,
    bulk_email_id text,
    added_id jsonb,
    data_type text,
    deleted_id jsonb,
    "name" text,
    quorum_dat_type text,
    reference_hash text,
    selection_type text,
    text text,
    PRIMARY KEY (id, bulk_email_id),
    FOREIGN KEY (bulk_email_id) REFERENCES bulk_email(id)
);

CREATE TABLE bulk_email (
    id text,
    user_id text,
    ab_test text,
    "action" text,
    aggregate_click text,
    aggregate_open text,
    aggregate_unsubscribe text,
    ai_suggestion jsonb,
    archived text,
    attachment text,
    attempted_resend_count text,
    bcc_rcpt jsonb,
    bounce text,
    campaign text,
    cc_rcpts jsonb,
    click text,
    click_rate text,
    compose_tool text,
    content_version text,
    created text,
    current_status text,
    custom_event text,
    email_count text,
    excluded_email_count text,
    excluded_person_count text,
    excluded_press_count text,
    excluded_supporter_count text,
    excludes_json_data jsonb,
    excludes_json_old jsonb,
    external_id text,
    extra jsonb,
    failed_recipient jsonb,
    from_address text,
    from_name text,
    from_user text,
    html_content text,
    initial_open text,
    is_abtest text,
    is_custom_unsubscribe text,
    is_draft text,
    is_moved text,
    is_scheduled text,
    is_updating text,
    json_content jsonb,
    last_updated text,
    must_send_as_creator text,
    open_rate text,
    opens text,
    percent_opened text,
    person_count text,
    press_count text,
    reply_count text,
    reply_to_address text,
    reply_to_assignments text,
    reply_to_name text,
    reply_to_user text,
    root_bulk_email text,
    saved_by_user text,
    scheduled_send_time text,
    selection_json_data jsonb,
    selection_json_old jsonb,
    send_from_assignment text,
    sent_datetime text,
    should_cc_all text,
    should_stagger_send text,
    subject text,
    supporter_bounce text,
    supporter_count text,
    unsubscribe text,
    unsubscribe_enabled text,
    updated text,
    use_personal_email text,
    variant jsonb,
    variant_of text,
    was_imported text,
    winner text,
    winner_of text,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE message_event (
    id text,
    bulk_email_id text,
    archived text,
    event_id text,
    event_name text,
    event_timestamp text,
    event_type text,
    extra jsonb,
    send_email text,
    -- event_json_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (bulk_email_id) REFERENCES bulk_email(id)
);

CREATE TABLE bill_amendment_sponsor (
    bill_amendment_id text,
    sponsor text,
    PRIMARY KEY (bill_amendment_id, sponsor),
    FOREIGN KEY (bill_amendment_id) REFERENCES bill_amendment(id),
    FOREIGN KEY (sponsor) REFERENCES bill_sponsor(id)
);

CREATE TABLE bill_amendment_text (
    text text,
    bill_amendment_id text,
    PRIMARY KEY (text, bill_amendment_id),
    FOREIGN KEY (bill_amendment_id) REFERENCES bill_amendment(id)
);

CREATE TABLE bill_amendment (
    id text,
    bill text,
    "action" jsonb,
    alert_cache jsonb,
    amendment_type text,
    bill_id text,
    congress_number text,
    created text,
    description text,
    dms_id text,
    extra jsonb,
    fts_strip_level text,
    house_number text,
    label text,
    last_action_text text,
    number text,
    number_of_cosponsor text,
    offered_date text,
    primary_party text,
    region text,
    resource_uri text,
    rules_number text,
    rules_status text,
    snippet text,
    "source" text,
    "status" text,
    status_date text,
    text text,
    title text,
    updated text,
    word_count text,
    PRIMARY KEY (id),
    FOREIGN KEY (bill) REFERENCES bill(id)
);

CREATE TABLE users_current_region (
    "index" text,
    users_id text,
    current_region text,
    PRIMARY KEY ("index", users_id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE users_other_persona (
    "index" text,
    users_id text,
    other_personas text,
    PRIMARY KEY ("index", users_id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE users_permissioned_region (
    "index" text,
    users_id text,
    permissioned_region text,
    PRIMARY KEY ("index", users_id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE users_search_data_type_order (
    "index" text,
    users_id text,
    search_data_type_order text,
    PRIMARY KEY ("index", users_id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE users_sidebar_setting_list (
    "index" text,
    users_id text,
    sidebar_settings_list text,
    PRIMARY KEY ("index", users_id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    user_info_organization_id text,
    date_joined text,
    email text,
    extra jsonb,
    first_name text,
    is_active text,
    last_name text,
    "name" text,
    user_info_accepted_terms_and_condition text,
    user_info_alert_default_search_filter text,
    user_info_amendment_default_search_filter text,
    user_info_article_default_search_filter text,
    user_info_attachment_default_search_filter text,
    user_info_bill_default_search_filter text,
    user_info_bulk_action_max_size text,
    user_info_campaign_columns_list text,
    user_info_can_access_all_org_region text,
    user_info_can_access_campaign_finance text,
    user_info_can_access_custom_fields_management text,
    user_info_can_access_grassroot text,
    user_info_can_access_issue_management text,
    user_info_can_access_media_monitoring text,
    user_info_can_access_media_relation text,
    user_info_can_access_mobile_developer_tool text,
    user_info_can_access_note text,
    user_info_can_access_outbox text,
    user_info_can_access_pac text,
    user_info_can_change_action_center_setting text,
    user_info_can_only_create_single_user_issue text,
    user_info_can_see_all_campaign text,
    user_info_can_see_all_event text,
    user_info_can_see_all_file text,
    user_info_can_see_all_user text,
    user_info_can_see_any_previous_outbox_email text,
    user_info_can_see_supporters_and_custom_org text,
    user_info_can_see_supporters_based_on_region text,
    user_info_can_send_from_any_outbox text,
    user_info_can_use_mobile_app text,
    user_info_current_preset_name text,
    user_info_current_project text,
    user_info_date_accepted_terms_and_condition text,
    user_info_default_limited_to_team jsonb,
    user_info_default_search_data_type text,
    user_info_document_default_search_filter text,
    user_info_email_signature text,
    user_info_employee_id text,
    user_info_event_default_search_filter text,
    user_info_extra jsonb,
    user_info_feature_cache_1_1 text,
    user_info_feature_cache_1_6 text,
    user_info_full_name text,
    user_info_id text,
    user_info_initial text,
    user_info_legislator_default_search_filter text,
    user_info_limit_from_default_project text,
    user_info_note_default_search_filter text,
    user_info_org_admin text,
    user_info_pacc_user_id text,
    user_info_pacc_version text,
    user_info_permanent_mobile_login_token jsonb,
    user_info_person_default_search_filter text,
    user_info_persona text,
    user_info_phone_number text,
    user_info_preset_region text,
    user_info_press_contact_default_search_filter text,
    user_info_public_organization_default_search_filter text,
    user_info_push_notification_unseen_count text,
    user_info_related_username text,
    user_info_search_is_table_view text,
    user_info_search_should_hide_filter text,
    user_info_should_hide_team_permissionining_in_form text,
    user_info_single_login text,
    user_info_staffer_default_search_filter text,
    user_info_supporter_default_search_filter text,
    user_info_two_factor_status text,
    user_info_user_persona text,
    user_info_user_role text,
    user_info_visited_feature_cache jsonb,
    user_info_vote_default_search_filter text,
    username text,
    PRIMARY KEY (id),
    FOREIGN KEY (user_info_organization_id) REFERENCES organization(id)
);

CREATE TABLE organization_allowed_user_domain (
    "index" text,
    organization_id text,
    allowed_user_domain text,
    PRIMARY KEY ("index"),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE organization_allowed_domain (
    "index" text,
    organization_id text,
    domain text,
    PRIMARY KEY ("index", organization_id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE organization_interaction_type (
    "index" text,
    organization_id text,
    internal_interaction_type text,
    PRIMARY KEY ("index", organization_id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE organization_relationship_type (
    "index" text,
    organization_id text,
    internal_relationship_type text,
    PRIMARY KEY ("index", organization_id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE organization_qp_executive (
    "index" text,
    organization_id text,
    qp_executive text,
    PRIMARY KEY ("index", organization_id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE organization_qp_legislative_data (
    "index" text,
    organization_id text,
    qp_legislative_data text,
    PRIMARY KEY ("index", organization_id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE organization_qp_legislative_profile (
    "index" text,
    organization_id text,
    qp_legislative_profile text,
    PRIMARY KEY ("index", organization_id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE organization_qp_legislative (
    "index" text,
    organization_id text,
    qp_legislative text,
    PRIMARY KEY ("index", organization_id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE organization_qp_official_document (
    "index" text,
    organization_id text,
    qp_official_document text,
    PRIMARY KEY ("index", organization_id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE organization_qp_regulation (
    "index" text,
    organization_id text,
    qp_regulation text,
    PRIMARY KEY ("index", organization_id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE organization_qp_staffer (
    "index" text,
    organization_id text,
    qp_staffer text,
    PRIMARY KEY ("index", organization_id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE organization_qp_state (
    "index" text,
    organization_id text,
    qp_state text,
    PRIMARY KEY ("index", organization_id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE organization_ip_address (
    "index" text,
    organization_id text,
    ip_address text,
    PRIMARY KEY ("index", organization_id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE organization_qp_grassroot (
    "index" text,
    organization_id text,
    qp_grassroot text,
    PRIMARY KEY ("index", organization_id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE organization_qp_international (
    "index" text,
    organization_id text,
    qp_international text,
    PRIMARY KEY ("index", organization_id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE organization_qp_local (
    "index" text,
    organization_id text,
    qp_local text,
    PRIMARY KEY ("index", organization_id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE organization_qp_media (
    "index" text,
    organization_id text,
    qp_media text,
    PRIMARY KEY ("index", organization_id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE organization_qp_media_relation (
    "index" text,
    organization_id text,
    qp_media_relaton text,
    PRIMARY KEY ("index", organization_id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE organization_cs_manager (
    "index" text,
    organization_id text,
    id text,
    PRIMARY KEY ("index", organization_id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE organization_partner (
    "index" text,
    organization_id text,
    partner_id text,
    PRIMARY KEY ("index", organization_id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE organization (
    id text,
    account_type text,
    active_client text,
    administrator text,
    agreed_to_texting_user text,
    archived text,
    auto_enrich_supporter text,
    can_see_partners_user text,
    can_use_independent_campaign text,
    created text,
    cs_managers_username text,
    custom_alert_ordering jsonb,
    custom_session_timeout text,
    date_archived text,
    datetime_agreed_to_texting text,
    default_domain text,
    default_forward_recipient text,
    deliver_supporter_message text,
    deliver_supporter_messages text,
    email_limit text,
    email_limit_percentage text,
    i_360_organization text,
    i_360_organization_and_quorum_client text,
    is_approved text,
    limit_to_cs_manager text,
    log_interaction_json jsonb,
    lower_tier_bound text,
    max_contact text,
    max_csv_size text,
    max_email_alert text,
    max_member text,
    max_project text,
    max_social_account text,
    "name" text,
    onboarding_type text,
    outbox_domain_dict jsonb,
    pacc_company_id text,
    pad_unique_identifier text,
    partner_name text,
    phone_number text,
    qp_action_center text,
    qp_campaign_finance text,
    qp_consultant text,
    qp_contacts_document text,
    qp_custom_contact text,
    qp_custom_data text,
    qp_custom_event text,
    qp_custom_outbox text,
    qp_custom_permission text,
    qp_eu text,
    qp_external_interaction text,
    qp_external_relationship text,
    qp_federal text,
    qp_grass_root jsonb,
    qp_internal_relationship text,
    qp_international jsonb,
    qp_legislation_page text,
    qp_live_chat text,
    qp_local jsonb,
    qp_local_agenda text,
    qp_media_monitoring jsonb,
    qp_media_relation jsonb,
    qp_officials_outbox text,
    qp_pac text,
    qp_project_management text,
    qp_stakeholder text,
    qp_unique_ids_in_download text,
    require_issue_on_interaction text,
    require_issue_on_outbox text,
    share_all_custom_region text,
    should_display_grassroots_registration_action text,
    should_limit_editing_notes_to_admins_and_creator text,
    should_org_admin_see_all_org_data text,
    should_share_with_partners_by_default text,
    should_show_only_users_on_team text,
    sms_limit text,
    sms_messages_toward_limit text,
    sso_enabled_for_all_user text,
    sso_profile text,
    subdomain text,
    trial_expiration text,
    unsubscribe_link_text text,
    updated text,
    upper_tier_bound text,
    zapier_token text,
    PRIMARY KEY (id)
);

CREATE TABLE custom_field_group (
    id text,
    organization_id text,
    user_id text,
    created text,
    creator text,
    data_type text,
    extra jsonb,
    "name" text,
    organization text,
    precedence text,
    resource_uri text,
    updated text,
    users text,
    PRIMARY KEY (id),
    FOREIGN KEY (organization_id) REFERENCES organization(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE committee_keyword (
    keyword_id text,
    committee_id text,
    PRIMARY KEY (keyword_id, committee_id),
    FOREIGN KEY (committee_id) REFERENCES committee(id)
);

CREATE TABLE committee (
    id text,
    abbrev text,
    address text,
    chairs_string text,
    code text,
    committee text,
    created text,
    facebook_url_array jsonb,
    fax text,
    icon text,
    kw_abbrev text,
    meeting_document text,
    "name" text,
    num_dem_member text,
    num_female_member text,
    num_ind_member text,
    num_male_member text,
    num_member text,
    num_rep_member text,
    parent_committee_abbrev text,
    parent_committee_name text,
    ph_ie_id text,
    ph_lc_org_id text,
    ph_ls_core_organization_id text,
    phone text,
    rank text,
    ranking_members_string text,
    region text,
    search_name text,
    state_name text,
    "type" text,
    updated text,
    url text,
    url_minority text,
    witnesses text,
    wiw_name text,
    PRIMARY KEY (id)
);

CREATE TABLE supporter_action_project (
    project text,
    supporter_action_id text,
    PRIMARY KEY (project, supporter_action_id),
    FOREIGN KEY (project) REFERENCES issue_management(id),
    FOREIGN KEY (supporter_action_id) REFERENCES supporter_action(id)
);

CREATE TABLE supporter_action_region (
    "index" text,
    supporter_action_id text,
    region text,
    PRIMARY KEY ("index", supporter_action_id),
    FOREIGN KEY (supporter_action_id) REFERENCES supporter_action(id)
);

CREATE TABLE supporter_action (
    id text,
    bulk_email_id text,
    organization_id text,
    person_id text,
    supporter_id text,
    action_center text,
    amount text,
    archived text,
    audit_trail jsonb,
    cache_json jsonb,
    call_duration text,
    campaign_id text,
    click text,
    confirmed text,
    created text,
    "date" text,
    delivered text,
    delivered_timestamp text,
    delivery_id text,
    extra jsonb,
    failed_delivery text,
    first_open text,
    from_grassroot text,
    http_referer text,
    humanized_text text,
    interaction_type text,
    link_dict jsonb,
    message_status text,
    note_type text,
    num_attempt text,
    opens text,
    payroll_frequency_type text,
    person text,
    points_earned text,
    raw_content text,
    searchable_date text,
    social_media_type text,
    source_type text,
    subject text,
    submitting_org_name text,
    supporter text,
    text text,
    time_stamp jsonb,
    transaction_method_type text,
    "type" text,
    unique_identifier text,
    updated text,
    utm_campaign text,
    utm_content text,
    utm_medium text,
    utm_source text,
    utm_term text,
    PRIMARY KEY (id),
    FOREIGN KEY (bulk_email_id) REFERENCES bulk_email(id),
    FOREIGN KEY (organization_id) REFERENCES organization(id),
    FOREIGN KEY (person_id) REFERENCES official_staffer(id),
    FOREIGN KEY (supporter_id) REFERENCES contact(id)
);

CREATE TABLE municipality (
    id text,
    extra jsonb,
    fips_code text,
    full_fips_string text,
    geojson text,
    legislator text,
    "name" text,
    number text,
    number_string text,
    population text,
    state_abbrev text,
    PRIMARY KEY (id)
);

CREATE TABLE team_member (
    "index" text,
    team_id text,
    member text,
    PRIMARY KEY ("index", team_id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE team (
    id text,
    organization_id text,
    archived text,
    defaults text,
    "name" text,
    organization text,
    resource_uri text,
    PRIMARY KEY (id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE contact (
    id text,
    public_organization text,
    user_id text,
    activated text,
    active text,
    address text,
    address_geocoded text,
    alert_cache_override_datetime text,
    alert_cached_data_tag_dict jsonb,
    alert_cached_field_override_tag_dict text,
    alternate_address text,
    archived text,
    birth_date text,
    bulk_email_unsubscribe_key text,
    cached_limited_to_team text,
    calculated_unsubscribed_from_texting text,
    city text,
    coordinate text,
    country_name text,
    county_name text,
    created text,
    date_unsubscribed_from_bulk_email text,
    date_unsubscribed_from_texting text,
    email text,
    email_related_person text,
    email_related_person_id text,
    employer text,
    extension text,
    extra jsonb,
    facebook_array jsonb,
    facebook_url_array jsonb,
    fax text,
    fb_id text,
    formatted_primary_phone text,
    formatted_secondary_phone text,
    has_ever_received_email_dn text,
    has_participated_in_any_campaign_dn text,
    has_shared_campaign_on_social_dn text,
    http_referer text,
    icon text,
    image_url text,
    input_address text,
    instagram_array jsonb,
    is_grassroots_supporter text,
    is_recently_active_email_recipient text,
    is_stakeholder_supporter text,
    last_action_date text,
    last_activated_at text,
    last_kind_action text,
    last_user_id text,
    latitude text,
    limited_to_team jsonb,
    longitude text,
    major_organization_type text,
    medium_array jsonb,
    middle_name text,
    "name" text,
    num_action text,
    num_campaigns_interacted text,
    occupation text,
    pac_eligibility jsonb,
    pacc_individual_id text,
    pacc_organization_id text,
    phone_number text,
    postal_code text,
    postal_code_ext text,
    preferred_name text,
    prefix text,
    public_organization_id text,
    region text,
    registered_with_text_keyword text,
    secondary_email text,
    secondary_extension text,
    secondary_phone text,
    should_display_in_external_logger text,
    source_type text,
    state_abbreviation text,
    state_name text,
    street_address text,
    street_address_2 text,
    stripe_customer_id text,
    suffix text,
    supporter_type text,
    tag_dict jsonb,
    title text,
    twitter_array jsonb,
    unique_identifier text,
    unsubscribed_from_bulk_email text,
    unsubscribed_from_texting text,
    updated text,
    utm_campaign text,
    utm_content text,
    utm_medium text,
    utm_source text,
    utm_term text,
    valid_email text,
    waiting_to_be_created_by_user text,
    website text,
    work_fax text,
    work_phone text,
    youtube_array jsonb,
    PRIMARY KEY (id),
    FOREIGN KEY (public_organization) REFERENCES organization(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE email_cached_limited_to_team (
    "index" text,
    email_id text,
    cached_limited_to_team text,
    PRIMARY KEY ("index", email_id),
    FOREIGN KEY (email_id) REFERENCES email(id)
);

CREATE TABLE email (
    id text,
    bulk_email_id text,
    person_id text,
    supporter_id text,
    alert_cache jsonb,
    archived text,
    bounce text,
    click text,
    contact_organization text,
    created text,
    did_reply text,
    email_address text,
    email_alert text,
    external_id text,
    extra jsonb,
    first_click text,
    first_open text,
    initial_open text,
    instant text,
    link_dict jsonb,
    medium text,
    opens text,
    person_primary_organization text,
    person_type text,
    push_notification_error_enum text,
    push_notification_error_info text,
    push_notification_error_status_code text,
    push_notification_extra jsonb,
    rcpt_dict_address_email text,
    rcpt_dict_address_name text,
    rcpt_dict_has_gr_link text,
    rcpt_dict_substitution_data jsonb,
    recipient_name text,
    sent text,
    sent_datetime text,
    sparkpost_id text,
    sparkpost_reject_reason text,
    sparkpost_status text,
    staffer_id text,
    text text,
    title text,
    transmission_id text,
    updated text,
    view_in_browser_id text,
    was_imported text,
    PRIMARY KEY (id),
    FOREIGN KEY (bulk_email_id) REFERENCES bulk_email(id),
    FOREIGN KEY (person_id) REFERENCES official_staffer(id),
    FOREIGN KEY (supporter_id) REFERENCES contact(id)
);

CREATE TABLE bill_summary (
    id text,
    bill_id text,
    content text,
    extra jsonb,
    resource_uri text,
    PRIMARY KEY (id),
    FOREIGN KEY (bill_id) REFERENCES bill(id)
);

CREATE TABLE event (
    id text,
    organization_id text,
    source_committee_id text,
    address text,
    alert_cache jsonb,
    amendment_mention jsonb,
    archived text,
    availability text,
    bill_mention jsonb,
    chamber text,
    committee_mention text,
    created text,
    cspan_channel text,
    cspan_id text,
    description text,
    duration text,
    end_time text,
    event_subtype text,
    event_type text,
    expected_number_of_transcript text,
    extra jsonb,
    extra_info jsonb,
    fact_squared_meeting_status text,
    fact_squared_slug text,
    full_transcript_url text,
    is_cancelled text,
    is_custom_all_day_event text,
    issue_mention jsonb,
    local_video_path text,
    location text,
    meeting_video_pipeline_status text,
    occured_date text,
    original_content text,
    original_number_of_transcript text,
    person_mention jsonb,
    plain_subject text,
    point_person text,
    point_person_name text,
    region text,
    related_document jsonb,
    revai_job_id text,
    search_date text,
    sequence_time_cache text,
    source_url text,
    source_video_url text,
    sponsoring_organization text,
    sponsoring_organization_name text,
    "status" text,
    status_text text,
    subject text,
    transcript_s_3_file_name text,
    transcription_pipeline_history_download_ended jsonb,
    transcription_pipeline_history_download_error jsonb,
    transcription_pipeline_history_no_source_video_url jsonb,
    transcription_pipeline_history_parsing_transcription_ended jsonb,
    transcription_pipeline_history_parsing_transcription_error jsonb,
    transcription_pipeline_history_source_video_url_added jsonb,
    transcription_pipeline_history_transcription_ended jsonb,
    transcription_pipeline_history_transcription_error jsonb,
    transcription_pipeline_history_transcription_in_progress jsonb,
    transcription_pipeline_history_transcription_sending_error jsonb,
    transcription_pipeline_history_transcription_sending_started jsonb,
    updated text,
    user_id text,
    video_url text,
    vote_mention jsonb,
    witness jsonb,
    PRIMARY KEY (id),
    FOREIGN KEY (organization_id) REFERENCES organization(id),
    FOREIGN KEY (source_committee_id) REFERENCES committee(id)
);

CREATE TABLE person_role (
    id text,
    adascore text,
    address text,
    aflscore text,
    appointed_by_type text,
    ccusscore text,
    cfgscore text,
    comstaffer_type text,
    created text,
    "current" text,
    district text,
    district_char text,
    district_obj text,
    electcode text,
    end_date text,
    extra jsonb,
    intrado_preferred_distribution_mode text,
    intrado_tag jsonb,
    is_primary_from_source text,
    lastelection text,
    leadership_title text,
    lower_district_obj text,
    major_person_type text,
    minor_person_type text,
    office text,
    office_building text,
    office_city text,
    office_country text,
    office_room text,
    office_state text,
    office_street_1 text,
    office_street_2 text,
    office_zipcode text,
    party text,
    party_name text,
    pay_scale_type text,
    person_id text,
    ph_intrado_last_updated text,
    ph_lc_position_id text,
    ph_ls_state_legislator_staff_history_id text,
    ph_nominated_date text,
    ph_nomination_confirmed_date text,
    ph_public_organization_desc text,
    ph_region_represented text,
    ph_term_number text,
    phone text,
    reelection_year text,
    region text,
    resource_uri text,
    role_type text,
    senator_class text,
    senator_rank text,
    specific_person_type text,
    start_date text,
    state_obj text,
    "status" text,
    updated text,
    upper_district_obj text,
    website text,
    PRIMARY KEY (id)
);

CREATE TABLE bill_sponsor (
    id text,
    bill_id text,
    committee_id text,
    amendment text,
    created text,
    extra jsonb,
    joined text,
    party text,
    person text,
    sponsor_icon text,
    sponsor_image_url text,
    sponsor_name text,
    sponsor_type text,
    sponsor_url text,
    state_name text,
    updated text,
    withdrawn text,
    PRIMARY KEY (id),
    FOREIGN KEY (bill_id) REFERENCES bill(id),
    FOREIGN KEY (committee_id) REFERENCES committee(id)
);

CREATE TABLE county (
    id text,
    executive text,
    extra jsonb,
    fips_code text,
    full_fips_string text,
    geojson text,
    legislator text,
    "name" text,
    number text,
    number_string text,
    population text,
    state_abbrev text,
    PRIMARY KEY (id)
);

CREATE TABLE all_vote (
    id text,
    vote_id text,
    PRIMARY KEY (id, vote_id),
    FOREIGN KEY (id) REFERENCES official_staffer(id),
    FOREIGN KEY (vote_id) REFERENCES vote(id)
);

CREATE TABLE yea_vote (
    id text,
    vote_id text,
    PRIMARY KEY (id, vote_id),
    FOREIGN KEY (id) REFERENCES official_staffer(id),
    FOREIGN KEY (vote_id) REFERENCES vote(id)
);

CREATE TABLE missed_vote (
    id text,
    vote_id text,
    PRIMARY KEY (id, vote_id),
    FOREIGN KEY (id) REFERENCES official_staffer(id),
    FOREIGN KEY (vote_id) REFERENCES vote(id)
);

CREATE TABLE nay_vote (
    id text,
    vote_id text,
    PRIMARY KEY (id, vote_id),
    FOREIGN KEY (id) REFERENCES official_staffer(id),
    FOREIGN KEY (vote_id) REFERENCES vote(id)
);

CREATE TABLE other_vote (
    id text,
    vote_id text,
    PRIMARY KEY (id, vote_id),
    FOREIGN KEY (id) REFERENCES official_staffer(id),
    FOREIGN KEY (vote_id) REFERENCES vote(id)
);

CREATE TABLE present_vote (
    id text,
    vote_id text,
    PRIMARY KEY (id, vote_id),
    FOREIGN KEY (id) REFERENCES official_staffer(id),
    FOREIGN KEY (vote_id) REFERENCES vote(id)
);

CREATE TABLE vote (
    id text,
    related_bill_id text,
    alert_cache jsonb,
    category text,
    chamber text,
    congress_number text,
    created text,
    democrat_result text,
    display_name text,
    extra jsonb,
    fts_index text,
    icon text,
    majority_result text,
    missing_data text,
    newly_index text,
    number text,
    openstates_id text,
    original_question text,
    question text,
    question_details text,
    region text,
    region_session text,
    related_amendment text,
    republican_result text,
    required text,
    "result" text,
    result_type text,
    "session" text,
    "source" text,
    source_link text,
    total_abstain text,
    total_all text,
    total_dem_abstain text,
    total_dem_all text,
    total_dem_minus text,
    total_dem_other text,
    total_dem_plus text,
    total_minus text,
    total_other text,
    total_plus text,
    total_rep_abstain text,
    total_rep_all text,
    total_rep_minus text,
    total_rep_other text,
    total_rep_plus text,
    "type" text,
    voted_against_majority text,
    PRIMARY KEY (id),
    FOREIGN KEY (related_bill_id) REFERENCES bill(id)
);

CREATE TABLE note_article (
    "index" text,
    note_id text,
    article text,
    PRIMARY KEY ("index", note_id),
    FOREIGN KEY (note_id) REFERENCES note(id)
);

CREATE TABLE note_region (
    "index" text,
    note_id text,
    region text,
    PRIMARY KEY ("index", note_id),
    FOREIGN KEY (note_id) REFERENCES note(id)
);

CREATE TABLE note_cache_vote (
    note_id text,
    vote_id text,
    PRIMARY KEY (note_id, vote_id),
    FOREIGN KEY (note_id) REFERENCES note(id),
    FOREIGN KEY (vote_id) REFERENCES vote(id)
);

CREATE TABLE note_project (
    note_id text,
    project_id text,
    PRIMARY KEY (note_id, project_id),
    FOREIGN KEY (note_id) REFERENCES note(id),
    FOREIGN KEY (project_id) REFERENCES issue_management(id)
);

CREATE TABLE note_limited_team (
    "index" text,
    note_id text,
    team text,
    PRIMARY KEY ("index", note_id),
    FOREIGN KEY (note_id) REFERENCES note(id)
);

CREATE TABLE note_cache_bill (
    id text,
    note_id text,
    region text,
    title text,
    PRIMARY KEY (id, note_id),
    FOREIGN KEY (id) REFERENCES bill(id),
    FOREIGN KEY (note_id) REFERENCES note(id)
);

CREATE TABLE note_team_member (
    id text,
    note_id text,
    email text,
    first_name text,
    last_name text,
    "name" text,
    PRIMARY KEY (id, note_id),
    FOREIGN KEY (id) REFERENCES users(id),
    FOREIGN KEY (note_id) REFERENCES note(id)
);

CREATE TABLE note (
    id text,
    amendment_id text,
    bill_id text,
    bulk_email_id text,
    event_id text,
    organization_id text,
    person_id text,
    project_id text,
    supporter_id text,
    user_id text,
    vote_id text,
    alert_cache jsonb,
    amendment text,
    amount text,
    archived text,
    attachemnt_id text,
    audit_trail jsonb,
    auto_created text,
    bill text,
    bulk_email text,
    cache_json_amendment jsonb,
    cache_json_article jsonb,
    cache_json_attachment jsonb,
    cache_json_campaign jsonb,
    cache_json_comment_type text,
    cache_json_comment_type_string text,
    cache_json_date text,
    cache_json_date_with_tz text,
    cache_json_document jsonb,
    cache_json_from_grassroot text,
    cache_json_id text,
    cache_json_initial text,
    cache_json_is_comment text,
    cache_json_is_interaction text,
    cache_json_is_private text,
    cache_json_is_relationship text,
    cache_json_member jsonb,
    cache_json_mention jsonb,
    cache_json_note_type text,
    cache_json_object_description text,
    cache_json_object_id text,
    cache_json_object_title text,
    cache_json_organization_id text,
    cache_json_privacy text,
    cache_json_project jsonb,
    cache_json_public_organization jsonb,
    cache_json_regulation jsonb,
    cache_json_social_media_type text,
    cache_json_supporter jsonb,
    cache_json_team jsonb,
    cache_json_user_id text,
    cache_json_vote jsonb,
    campaign text,
    check_number text,
    click text,
    comment_type text,
    confirmed text,
    created text,
    custom_interaction_type text,
    data_type text,
    "date" text,
    delivered text,
    delivery_id text,
    doument_id text,
    duration text,
    extra jsonb,
    failed_delivery text,
    first_open text,
    from_grassroot text,
    from_note text,
    from_parser text,
    from_qnote text,
    frozen_cache_json jsonb,
    http_referer text,
    humanized_text text,
    ical_id text,
    icon text,
    interaction_type text,
    is_ical text,
    is_visible_to_partner text,
    link_dict jsonb,
    members_count text,
    message text,
    message_status text,
    note_type text,
    num_attempt text,
    opens text,
    person text,
    privacy text,
    public_organizations_count text,
    raw_content text,
    relationship_status text,
    relationship_type text,
    searchable_date text,
    social_media_type text,
    source_type text,
    subject text,
    submitting_org_name text,
    supporter_action_type text,
    supporters_count text,
    tag_dict jsonb,
    team_members_count text,
    text text,
    text_with_html text,
    time_stamp jsonb,
    unique_identifier text,
    updated text,
    utm_campaign text,
    utm_content text,
    utm_medium text,
    utm_source text,
    utm_term text,
    PRIMARY KEY (id),
    FOREIGN KEY (amendment_id) REFERENCES bill_amendment(id),
    FOREIGN KEY (bill_id) REFERENCES bill(id),
    FOREIGN KEY (bulk_email_id) REFERENCES bulk_email(id),
    FOREIGN KEY (event_id) REFERENCES event(id),
    FOREIGN KEY (organization_id) REFERENCES organization(id),
    FOREIGN KEY (person_id) REFERENCES official_staffer(id),
    FOREIGN KEY (project_id) REFERENCES issue_management(id),
    FOREIGN KEY (supporter_id) REFERENCES contact(id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (vote_id) REFERENCES vote(id)
);

CREATE TABLE people_ph_region (
    "index" text,
    official_staffer_id text,
    region_code text,
    PRIMARY KEY ("index", official_staffer_id),
    FOREIGN KEY (official_staffer_id) REFERENCES official_staffer(id)
);

CREATE TABLE people_ph_major_role (
    "index" text,
    official_staffer_id text,
    major_role text,
    PRIMARY KEY ("index", official_staffer_id),
    FOREIGN KEY (official_staffer_id) REFERENCES official_staffer(id)
);

CREATE TABLE people_ph_meta_role (
    "index" text,
    official_staffer_id text,
    meta_role text,
    PRIMARY KEY ("index", official_staffer_id),
    FOREIGN KEY (official_staffer_id) REFERENCES official_staffer(id)
);

CREATE TABLE people_ph_minor_role (
    "index" text,
    official_staffer_id text,
    minor_role text,
    PRIMARY KEY ("index", official_staffer_id),
    FOREIGN KEY (official_staffer_id) REFERENCES official_staffer(id)
);

CREATE TABLE people_ph_language (
    "index" text,
    official_staffer_id text,
    language_code text,
    PRIMARY KEY ("index", official_staffer_id),
    FOREIGN KEY (official_staffer_id) REFERENCES official_staffer(id)
);

CREATE TABLE people_ph_tag (
    "index" text,
    official_staffer_id text,
    tag_id text,
    PRIMARY KEY ("index", official_staffer_id),
    FOREIGN KEY (official_staffer_id) REFERENCES official_staffer(id)
);

CREATE TABLE people_ph_source_url (
    "index" text,
    official_staffer_id text,
    source_url text,
    PRIMARY KEY ("index", official_staffer_id),
    FOREIGN KEY (official_staffer_id) REFERENCES official_staffer(id)
);

CREATE TABLE people_dn_type (
    "index" text,
    official_staffer_id text,
    "type" text,
    PRIMARY KEY ("index", official_staffer_id),
    FOREIGN KEY (official_staffer_id) REFERENCES official_staffer(id)
);

CREATE TABLE people_dn_scale_type (
    "index" text,
    official_staffer_id text,
    scale_type text,
    PRIMARY KEY ("index", official_staffer_id),
    FOREIGN KEY (official_staffer_id) REFERENCES official_staffer(id)
);

CREATE TABLE people_major_type (
    "index" text,
    official_staffer_id text,
    "type" text,
    PRIMARY KEY ("index", official_staffer_id),
    FOREIGN KEY (official_staffer_id) REFERENCES official_staffer(id)
);

CREATE TABLE people_minor_type (
    "index" text,
    official_staffer_id text,
    "type" text,
    PRIMARY KEY ("index", official_staffer_id),
    FOREIGN KEY (official_staffer_id) REFERENCES official_staffer(id)
);

CREATE TABLE people_recent_region (
    "index" text,
    official_staffer_id text,
    region text,
    PRIMARY KEY ("index", official_staffer_id),
    FOREIGN KEY (official_staffer_id) REFERENCES official_staffer(id)
);

CREATE TABLE people_specific_type (
    "index" text,
    official_staffer_id text,
    "type" text,
    PRIMARY KEY ("index", official_staffer_id),
    FOREIGN KEY (official_staffer_id) REFERENCES official_staffer(id)
);

CREATE TABLE people_staffer_type (
    "index" text,
    official_staffer_id text,
    "type" text,
    PRIMARY KEY ("index", official_staffer_id),
    FOREIGN KEY (official_staffer_id) REFERENCES official_staffer(id)
);

CREATE TABLE official_staffer (
    id text,
    committee_id text,
    most_recent_role_id text,
    address text,
    age text,
    birthday text,
    committee_string text,
    comstaffertype text,
    congressional_district_kw_id text,
    cook_pvi text,
    "current" text,
    email text,
    extra jsonb,
    facebook_url text,
    firstname text,
    freshman_legislator text,
    gender text,
    has_been_legislator text,
    high_quality_image_url text,
    image_url text,
    intrado_other_email text,
    is_cwc text,
    lastname text,
    legislator_id text,
    linkedin_username text,
    location text,
    lower_district_kw_id text,
    member_name text,
    most_recent_country text,
    most_recent_executive_role text,
    most_recent_party text,
    most_recent_person_type text,
    most_recent_role_address text,
    most_recent_role_building text,
    most_recent_role_city text,
    most_recent_role_phone text,
    most_recent_role_room text,
    most_recent_role_state text,
    most_recent_role_street_1 text,
    most_recent_role_street_2 text,
    most_recent_role_type text,
    most_recent_role_zipcode text,
    "name" text,
    new_legislator text,
    num_term text,
    office_code text,
    party_string text,
    person text,
    ph_dn_intrado_preferred_distribution_mode text,
    ph_intrado_last_updated text,
    ph_intrado_person_id text,
    ph_lc_person_id text,
    ph_ls_core_person_id text,
    ph_should_flush_next_run text,
    precedence_local text,
    precedence_state text,
    precedence_state_and_local text,
    prefix text,
    primary_organization text,
    pronunciation text,
    public_organization_descriptor text,
    region_represented text,
    resource_uri text,
    responsibilities_string text,
    should_deliver_via_fill_form text,
    show_in_quicksearch text,
    staffer_name text,
    "status" text,
    title text,
    titlecode_order text,
    twitter_id text,
    upper_district_kw_id text,
    valid_email text,
    wikipedia_url text,
    PRIMARY KEY (id),
    FOREIGN KEY (committee_id) REFERENCES committee(id),
    FOREIGN KEY (most_recent_role_id) REFERENCES person_role(id)
);

CREATE TABLE bill_achieved_status (
    "index" text,
    bill_id text,
    id text,
    PRIMARY KEY ("index", bill_id),
    FOREIGN KEY (bill_id) REFERENCES bill(id)
);

CREATE TABLE bill (
    id text,
    achieved_general_statuses text,
    committee text,
    current_general_status text,
    current_status text,
    current_status_date text,
    current_status_text text,
    draft_number text,
    executive text,
    extra jsonb,
    introduced_date text,
    is_approp text,
    label text,
    last_action_text text,
    major_action jsonb,
    most_recent_action_date text,
    num_democrat_co_sponsor text,
    num_female_co_sponsor text,
    num_independent_co_sponsor text,
    num_male_co_sponsor text,
    num_repubilican_co_sponsor text,
    number text,
    procedure_code text,
    public_law_number text,
    region text,
    "session" text,
    slug text,
    snippet jsonb,
    source_link text,
    sponsor text,
    title text,
    "type" text,
    PRIMARY KEY (id)
);
