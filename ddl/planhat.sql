CREATE TABLE end_user_tag (
    "index" text,
    end_user_id text,
    tags text,
    PRIMARY KEY ("index", end_user_id),
    FOREIGN KEY (end_user_id) REFERENCES end_user(id)
);

CREATE TABLE end_user (
    id text,
    company_id text,
    beat_trend text,
    beats text,
    beats_total text,
    company_external_id text,
    convs_14 text,
    convs_total text,
    create_date text,
    created_at text,
    description text,
    email text,
    email_md_5 text,
    experience text,
    external_id text,
    featured text,
    first_name text,
    last_active text,
    last_name text,
    last_touch text,
    last_touch_by_type_design_call text,
    last_touch_by_type_email text,
    last_touch_by_type_kick_off text,
    last_touch_by_type_note text,
    last_touch_by_type_technical_call text,
    last_touch_by_type_technical_life_lesson text,
    last_touch_type text,
    last_updated text,
    "name" text,
    nps_sent text,
    nps_unsubscribed text,
    other_emails jsonb,
    phone text,
    "position" text,
    related_end_users jsonb,
    relevance text,
    relevance_rate text,
    shared_notifications_prefs_disabled jsonb,
    shared_notifications_prefs_disabled_event jsonb,
    shared_notifications_prefs_enabled jsonb,
    source_id text,
    updated_at timestamp,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (company_id) REFERENCES company(id)
);

CREATE TABLE nps (
    id text,
    campaign_id text,
    company_id text,
    "comment" text,
    "date" timestamp,
    date_answered text,
    date_reminder_sent text,
    date_sent text,
    email text,
    nps text,
    nps_id text,
    score text,
    score_type text,
    sent text,
    "source" text,
    source_id text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (company_id) REFERENCES company(id)
);

CREATE TABLE issue_company (
    company_id text,
    issue_id text,
    PRIMARY KEY (company_id, issue_id),
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (issue_id) REFERENCES issue(id)
);

CREATE TABLE issue_end_user (
    end_user_id text,
    issue_id text,
    PRIMARY KEY (end_user_id, issue_id),
    FOREIGN KEY (end_user_id) REFERENCES end_user(id),
    FOREIGN KEY (issue_id) REFERENCES issue(id)
);

CREATE TABLE issue_conversation (
    conversation_id text,
    issue_id text,
    PRIMARY KEY (conversation_id, issue_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id),
    FOREIGN KEY (issue_id) REFERENCES issue(id)
);

CREATE TABLE issue (
    id text,
    archived text,
    arr_combined text,
    company_matching_value jsonb,
    created_at text,
    description text,
    mrr_combined text,
    source_id text,
    "status" text,
    title text,
    updated_at timestamp,
    -- custom_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE objective (
    id text,
    company_id text,
    external_id text,
    health text,
    "name" text,
    source_id text,
    usage jsonb,
    -- custom_* (dynamic column),
    PRIMARY KEY (id, company_id),
    FOREIGN KEY (company_id) REFERENCES company(id)
);

CREATE TABLE workspace (
    id text,
    company_id text,
    owner_id text,
    external_id text,
    "name" text,
    source_id text,
    usage jsonb,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (owner_id) REFERENCES users(id)
);

CREATE TABLE license (
    id text,
    company_id text,
    arr text,
    auto_renew text,
    auto_renewed text,
    created_at text,
    currency text,
    external_id text,
    fc_new_arr text,
    fc_new_arr_optimistic text,
    fc_new_arr_pessimistic text,
    fc_new_mrr text,
    fc_new_mrr_pessimistic text,
    fixed_period text,
    from_date text,
    invoice_cycle text,
    invoice_cycle_interval text,
    invoice_muted text,
    is_overdue text,
    issue text,
    length text,
    mrr text,
    notice_period text,
    notice_unit text,
    parent text,
    product text,
    renewal_arr text,
    renewal_date text,
    renewal_days_from_now text,
    renewal_mrr text,
    renewal_period text,
    renewal_status text,
    renewal_unit text,
    source_id text,
    "status" text,
    to_date text,
    to_date_included text,
    updated_at timestamp,
    "value" text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (company_id) REFERENCES company(id)
);

CREATE TABLE campaign (
    id text,
    company_id text,
    external_id text,
    "name" text,
    purpose text,
    source_id text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (company_id) REFERENCES company(id)
);

CREATE TABLE churn_reason (
    "index" text,
    churn_id text,
    reason text,
    PRIMARY KEY ("index", churn_id),
    FOREIGN KEY (churn_id) REFERENCES churn(id)
);

CREATE TABLE churn_product (
    "index" text,
    churn_id text,
    product text,
    PRIMARY KEY ("index", churn_id),
    FOREIGN KEY (churn_id) REFERENCES churn(id)
);

CREATE TABLE churn (
    id text,
    company_id text,
    license_id text,
    arr text,
    churn_date timestamp,
    "comment" text,
    currency text,
    last_updated text,
    replacement text,
    snoozed text,
    source_id text,
    "value" text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (license_id) REFERENCES license(id)
);

CREATE TABLE sale (
    id text,
    company_id text,
    currency text,
    external_id text,
    product text,
    sales_date text,
    source_id text,
    "value" text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (company_id) REFERENCES company(id)
);

CREATE TABLE task_end_user (
    end_user_id text,
    task_id text,
    PRIMARY KEY (end_user_id, task_id),
    FOREIGN KEY (end_user_id) REFERENCES end_user(id),
    FOREIGN KEY (task_id) REFERENCES task(id)
);

CREATE TABLE task_user (
    task_id text,
    user_id text,
    PRIMARY KEY (task_id, user_id),
    FOREIGN KEY (task_id) REFERENCES task(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE task_activity_tag (
    "index" text,
    task_id text,
    activity_tag text,
    PRIMARY KEY ("index", task_id),
    FOREIGN KEY (task_id) REFERENCES task(id)
);

CREATE TABLE task (
    id text,
    company_id text,
    owner_id text,
    "action" text,
    checklist jsonb,
    created_at text,
    date_done text,
    description text,
    done_by text,
    end_time text,
    followers jsonb,
    i_cal_u_id text,
    is_archived text,
    location text,
    main_type text,
    no_specific_time text,
    over_due_notified text,
    "repeat" text,
    repeat_day text,
    shared text,
    snippet text,
    "source" text,
    source_id text,
    source_parent_id text,
    source_url text,
    start_time text,
    "status" text,
    updated_at timestamp,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (owner_id) REFERENCES users(id)
);

CREATE TABLE project (
    id text,
    company_id text,
    arr text,
    currency text,
    end_date text,
    external_id text,
    mrr text,
    "name" text,
    nrr text,
    source_id text,
    start_date text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (company_id) REFERENCES company(id)
);

CREATE TABLE asset (
    id text,
    company_id text,
    external_id text,
    "name" text,
    source_id text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (company_id) REFERENCES company(id)
);

CREATE TABLE invoice_line_item (
    id text,
    invoice_id text,
    license_id text,
    amount text,
    date_from text,
    date_to text,
    product text,
    PRIMARY KEY (id, invoice_id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id),
    FOREIGN KEY (license_id) REFERENCES license(id)
);

CREATE TABLE invoice (
    id text,
    company_id text,
    address_country text,
    amount_due text,
    amount_paid text,
    amount_total text,
    currency text,
    cycle text,
    "date" timestamp,
    due_date text,
    emails jsonb,
    ext_id text,
    last_updated text,
    number text,
    paid_date text,
    product text,
    source_id text,
    "status" text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (company_id) REFERENCES company(id)
);

CREATE TABLE company_csm_score_log (
    "index" text,
    company_id text,
    "date" text,
    score text,
    PRIMARY KEY ("index", company_id),
    FOREIGN KEY (company_id) REFERENCES company(id)
);

CREATE TABLE company_domain (
    "index" text,
    company_id text,
    domain text,
    PRIMARY KEY ("index", company_id),
    FOREIGN KEY (company_id) REFERENCES company(id)
);

CREATE TABLE company_tag (
    "index" text,
    company_id text,
    tags text,
    PRIMARY KEY ("index", company_id),
    FOREIGN KEY (company_id) REFERENCES company(id)
);

CREATE TABLE company (
    id text,
    co_owner text,
    owner text,
    address text,
    alerts jsonb,
    arr text,
    arr_total text,
    auto_renew text,
    city text,
    collaborators jsonb,
    country text,
    create_date text,
    created_at text,
    csm_score text,
    customer_from text,
    customer_to text,
    days_in_phase text,
    description text,
    documents jsonb,
    external_id text,
    features jsonb,
    followers jsonb,
    h text,
    h_diff text,
    h_diff_date text,
    h_profile text,
    head_id text,
    last_performed_triggers jsonb,
    last_renewal text,
    last_touch text,
    last_touch_by_type_catch_up text,
    last_touch_by_type_delivery_review text,
    last_touch_by_type_email text,
    last_touch_by_type_sales_handover text,
    last_touch_by_type_training text,
    last_touch_type text,
    last_updated text,
    licenses jsonb,
    links jsonb,
    mr text,
    mr_total text,
    mrr text,
    mrr_total text,
    "name" text,
    next_touch text,
    nrr_30 text,
    nrr_total text,
    org_arr text,
    org_arr_total text,
    org_health_total text,
    org_level text,
    org_mrr text,
    org_mrr_total text,
    org_path text,
    org_root_id text,
    org_unit text,
    phase text,
    phase_since text,
    phone_primary text,
    products jsonb,
    renewal_arr text,
    renewal_date text,
    renewal_days_from_now text,
    renewal_mrr text,
    sales jsonb,
    shareable_enabled text,
    shareable_eu_ids jsonb,
    shareable_sunits text,
    shareable_teams_fields jsonb,
    slug text,
    source_id text,
    "status" text,
    sunits jsonb,
    updated_at timestamp,
    usage jsonb,
    web text,
    zip text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (co_owner) REFERENCES users(id),
    FOREIGN KEY (owner) REFERENCES users(id)
);

CREATE TABLE ticket_history (
    "index" text,
    ticket_id text,
    "status" text,
    "time" text,
    PRIMARY KEY ("index", ticket_id),
    FOREIGN KEY (ticket_id) REFERENCES ticket(id)
);

CREATE TABLE ticket_time_bucket (
    "index" text,
    ticket_id text,
    time_bucket text,
    PRIMARY KEY ("index", ticket_id),
    FOREIGN KEY (ticket_id) REFERENCES ticket(id)
);

CREATE TABLE ticket_end_user (
    end_user_id text,
    ticket_id text,
    PRIMARY KEY (end_user_id, ticket_id),
    FOREIGN KEY (end_user_id) REFERENCES end_user(id),
    FOREIGN KEY (ticket_id) REFERENCES ticket(id)
);

CREATE TABLE ticket (
    id text,
    company_id text,
    activity_tags jsonb,
    archived text,
    company_external_id text,
    create_date text,
    "date" text,
    days text,
    description text,
    domains jsonb,
    email text,
    email_template_ids jsonb,
    external_id text,
    in_date text,
    is_open text,
    pinned text,
    product text,
    sender jsonb,
    severity text,
    snippet text,
    "source" text,
    source_id text,
    starred text,
    "status" text,
    sub_type text,
    subject text,
    tags jsonb,
    time_spent text,
    title text,
    "type" text,
    update_date timestamp,
    url text,
    users jsonb,
    waits_to_be_filtered text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (company_id) REFERENCES company(id)
);

CREATE TABLE users_role (
    id text,
    user_id text,
    description text,
    "name" text,
    PRIMARY KEY (id, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users_poc (
    "index" text,
    user_id text,
    poc text,
    PRIMARY KEY ("index", user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users_team (
    team_id text,
    user_id text,
    PRIMARY KEY (team_id, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users_google_api_synced_label (
    "index" text,
    user_id text,
    synced_label text,
    PRIMARY KEY ("index", user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users_google_calendar_api_synced_calendar (
    "index" text,
    user_id text,
    synced_calendar text,
    PRIMARY KEY ("index", user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    account_access text,
    apply_permission text,
    arr text,
    arr_avg text,
    calendar_date_scope text,
    comments_sort text,
    compressed_view text,
    create_date text,
    created_at text,
    daily_digest text,
    default_meeting_length text,
    email text,
    email_signature_content text,
    email_signature_enabled text,
    first_name text,
    follower_update text,
    followers jsonb,
    google_api_access_enabled text,
    google_api_sync_enabled text,
    google_api_sync_initial text,
    google_api_user_id text,
    google_calendar_api_access_enabled text,
    google_calendar_api_calendar_to_save jsonb,
    google_calendar_api_sync_enabled text,
    google_calendar_api_sync_initial text,
    google_calendar_api_user_id text,
    health_avg text,
    health_avg_round text,
    health_count text,
    image_path text,
    image_spaces_key text,
    in_app_notification text,
    inactive text,
    intercom_admin_id text,
    invoices_sort text,
    is_exposed_as_sender_option text,
    is_hidden text,
    labels jsonb,
    last_active_30 text,
    last_active_7 text,
    last_active_90 text,
    last_daily_digest text,
    last_name text,
    last_touch_30 text,
    last_touch_7 text,
    last_touch_90 text,
    last_visited_views jsonb,
    last_visited_workspaces jsonb,
    managers jsonb,
    mrr text,
    mrr_avg text,
    ms_api_access_enabled text,
    ms_api_sync_enabled text,
    ms_api_sync_initial text,
    ms_api_synced_labels jsonb,
    ms_calendar_api_access_enabled text,
    ms_calendar_api_calendar_to_save jsonb,
    ms_calendar_api_sync_enabled text,
    ms_calendar_api_sync_initial text,
    ms_calendar_api_synced_calendars jsonb,
    nick_name text,
    notifications_enabled text,
    nps_avg text,
    nps_count text,
    nr_open_task text,
    nr_overdue_task text,
    nr_tasks_due_14_day text,
    nr_tasks_due_30_day text,
    nr_tasks_due_7_day text,
    nr_tasks_due_90_day text,
    paying_customer_count text,
    permission jsonb,
    play_log_disabled text,
    playlist_section text,
    preview_modal_width text,
    radar_one_line text,
    recent_open_shared_view text,
    removed text,
    rev_report_period_type text,
    revenue_share text,
    slack_id text,
    split_layout_disabled text,
    task_actions_pref_view_mode text,
    task_filter text,
    top_bar_pins jsonb,
    two_factor_auth_enabled text,
    "type" text,
    tz_offset text,
    undefined text,
    updated_at timestamp,
    usage_metrics_from_b_q text,
    work_spaces_prefs jsonb,
    ws_saved_pages jsonb,
    -- custom_* (dynamic column),
    -- table_group_collapsed_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE opportunity_stage_history (
    "index" text,
    opportunity_id text,
    stage text,
    tos text,
    PRIMARY KEY ("index", opportunity_id),
    FOREIGN KEY (opportunity_id) REFERENCES opportunity(id)
);

CREATE TABLE opportunity (
    id text,
    company_id text,
    owner_id text,
    arr text,
    close_date text,
    contract_length text,
    created_at text,
    currency text,
    deal_date text,
    external_id text,
    followers jsonb,
    landing_date text,
    last_comment text,
    mrr text,
    nrr text,
    probability text,
    sales_stage text,
    source_id text,
    "status" text,
    title text,
    updated_at timestamp,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (owner_id) REFERENCES users(id)
);

CREATE TABLE conversation_user (
    "index" text,
    conversation_id text,
    user_id text,
    is_owner text,
    PRIMARY KEY ("index", conversation_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE conversation_end_user (
    "index" text,
    conversation_id text,
    end_user_id text,
    PRIMARY KEY ("index", conversation_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id),
    FOREIGN KEY (end_user_id) REFERENCES end_user(id)
);

CREATE TABLE conversation_time_bucket (
    "index" text,
    conversation_id text,
    time_bucket text,
    PRIMARY KEY ("index", conversation_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id)
);

CREATE TABLE conversation_document (
    "index" text,
    conversation_id text,
    document text,
    PRIMARY KEY ("index", conversation_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation(id)
);

CREATE TABLE conversation (
    id text,
    company_id text,
    task_id text,
    activity_tags jsonb,
    archived text,
    assignee_name text,
    auto_tags jsonb,
    create_date text,
    created_at text,
    "date" text,
    "day" text,
    description text,
    email_template_ids jsonb,
    followers jsonb,
    has_attachment text,
    has_more text,
    history text,
    is_custom_type text,
    is_open text,
    is_seen text,
    number_of_part text,
    number_of_relevant_part text,
    out_date text,
    pinned text,
    sender text,
    snippet text,
    "source" text,
    starred text,
    subject text,
    tags jsonb,
    "type" text,
    updated_at timestamp,
    waits_to_be_filtered text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (task_id) REFERENCES task(id)
);
