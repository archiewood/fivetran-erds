CREATE TABLE deal_field (
    id bigint,
    created_by_user_id bigint,
    last_updated_by_user_id bigint,
    active_flag boolean,
    add_time timestamp,
    add_visible_flag boolean,
    bulk_edit_allowed boolean,
    description text,
    details_visible_flag boolean,
    edit_flag boolean,
    field_type text,
    filtering_allowed boolean,
    important_flag boolean,
    index_visible_flag boolean,
    json_column_flag boolean,
    "key" text,
    mandatory_flag jsonb,
    "name" text,
    order_nr bigint,
    searchable_flag boolean,
    sortable_flag boolean,
    update_time timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_user_id) REFERENCES "user"(id),
    FOREIGN KEY (last_updated_by_user_id) REFERENCES "user"(id)
);

CREATE TABLE lead_lead_label (
    label_id text,
    lead_id text,
    PRIMARY KEY (label_id, lead_id),
    FOREIGN KEY (label_id) REFERENCES lead_label_history(id),
    FOREIGN KEY (lead_id) REFERENCES lead_history(id)
);

CREATE TABLE subscription (
    id bigint,
    deal_id bigint,
    user_id bigint,
    cadence_type text,
    created_at timestamp,
    currency text,
    cycle_amount double precision,
    cycles_count integer,
    description text,
    end_date text,
    final_status text,
    infinite boolean,
    is_active boolean,
    lifetime_value double precision,
    start_date text,
    update_time timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (deal_id) REFERENCES deal_history(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE team_user (
    team_id bigint,
    user_id bigint,
    PRIMARY KEY (team_id, user_id),
    FOREIGN KEY (team_id) REFERENCES team(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE person_email (
    "index" integer,
    person_id bigint,
    email text,
    label text,
    "primary" boolean,
    PRIMARY KEY ("index", person_id),
    FOREIGN KEY (person_id) REFERENCES person(id)
);

CREATE TABLE goal (
    id text,
    owner_id bigint,
    assignee_id bigint,
    assignee_type text,
    duration_end text,
    duration_start text,
    expected_target bigint,
    expected_tracking_metric text,
    "interval" text,
    is_active boolean,
    progress double precision,
    report_ids jsonb,
    title text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (owner_id) REFERENCES "user"(id)
);

CREATE TABLE lead_source (
    id bigint,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE team (
    id bigint,
    created_by_user_id bigint,
    active_flag integer,
    created_at timestamp,
    deleted_flag integer,
    description text,
    manager_id bigint,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by_user_id) REFERENCES "user"(id)
);

CREATE TABLE lead_history (
    id text,
    creator_id bigint,
    next_activity_id bigint,
    organization_id bigint,
    owner_id bigint,
    person_id bigint,
    add_time timestamp,
    amount double precision,
    cc_email text,
    currency text,
    expected_close_date timestamp,
    is_archived boolean,
    source_name text,
    title text,
    update_time timestamp,
    visible_to text,
    was_seen boolean,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (creator_id) REFERENCES "user"(id),
    FOREIGN KEY (next_activity_id) REFERENCES activity(id),
    FOREIGN KEY (organization_id) REFERENCES organization(id),
    FOREIGN KEY (owner_id) REFERENCES "user"(id),
    FOREIGN KEY (person_id) REFERENCES person(id)
);

CREATE TABLE lead_label_history (
    id text,
    add_time timestamp,
    color text,
    "name" text,
    update_time timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE person_phone (
    "index" integer,
    person_id bigint,
    label text,
    phone text,
    "primary" boolean,
    PRIMARY KEY ("index", person_id),
    FOREIGN KEY (person_id) REFERENCES person(id)
);

CREATE TABLE permission_set (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE task (
    id bigint,
    creator_id bigint,
    parent_task_id bigint,
    project_id bigint,
    add_time timestamp,
    assignee_id bigint,
    description text,
    done integer,
    due_date text,
    marked_as_done_time timestamp,
    title text,
    update_time timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (creator_id) REFERENCES "user"(id),
    FOREIGN KEY (parent_task_id) REFERENCES task(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE email_to (
    recipient_id bigint,
    mail_message_id bigint,
    linked_person_id bigint,
    email_address text,
    PRIMARY KEY (recipient_id, mail_message_id),
    FOREIGN KEY (mail_message_id) REFERENCES mail_message(id),
    FOREIGN KEY (linked_person_id) REFERENCES person(id)
);

CREATE TABLE project (
    id bigint,
    org_id bigint,
    owner_id bigint,
    person_id bigint,
    add_time timestamp,
    archive_time timestamp,
    description text,
    end_date text,
    start_date text,
    "status" text,
    status_change_time timestamp,
    title text,
    update_time timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (org_id) REFERENCES organization(id),
    FOREIGN KEY (owner_id) REFERENCES "user"(id),
    FOREIGN KEY (person_id) REFERENCES person(id)
);

CREATE TABLE permission (
    "index" integer,
    permission_set_id text,
    content text,
    PRIMARY KEY ("index", permission_set_id),
    FOREIGN KEY (permission_set_id) REFERENCES permission_set(id)
);

CREATE TABLE subscription_payment (
    id bigint,
    deal_id bigint,
    subscription_id bigint,
    amount double precision,
    change_amount double precision,
    created_at timestamp,
    currency text,
    description text,
    due_at text,
    is_active boolean,
    payment_type text,
    revenue_movement_type text,
    update_time timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (deal_id) REFERENCES deal_history(id),
    FOREIGN KEY (subscription_id) REFERENCES subscription(id)
);

CREATE TABLE "user" (
    id bigint,
    default_currency text,
    role_id bigint,
    activated boolean,
    active_flag boolean,
    created_at timestamp,
    email text,
    has_created_company boolean,
    icon_url text,
    is_admin integer,
    last_login timestamp,
    locale text,
    modified_time timestamp,
    "name" text,
    phone text,
    timezone_name text,
    timezone_offset text,
    PRIMARY KEY (id),
    FOREIGN KEY (default_currency) REFERENCES currency(code),
    FOREIGN KEY (role_id) REFERENCES "role"(id)
);

CREATE TABLE filter (
    id bigint,
    user_id bigint,
    active_flag boolean,
    created_at timestamp,
    custom_view_id bigint,
    "name" text,
    temporary_flag boolean,
    "type" text,
    update_time timestamp,
    visible_to integer,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE activity (
    id bigint,
    assigned_to_user_id bigint,
    created_by_user_id bigint,
    deal_id bigint,
    last_notification_user_id bigint,
    org_id bigint,
    update_user_id bigint,
    user_id bigint,
    active_flag boolean,
    attendees jsonb,
    busy_flag boolean,
    created_at timestamp,
    deal_dropbox_bcc text,
    done boolean,
    due_date text,
    due_time text,
    duration text,
    last_notification_time timestamp,
    location text,
    location_admin_area_level_1 text,
    location_admin_area_level_2 text,
    location_country text,
    location_formatted_address text,
    location_locality text,
    location_postal_code text,
    location_route text,
    location_street_number text,
    location_sublocality text,
    location_subpremise text,
    marked_as_done_time timestamp,
    note text,
    person_dropbox_bcc text,
    public_description text,
    reference_id text,
    reference_type text,
    source_timezone text,
    subject text,
    "type" text,
    update_time timestamp,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (assigned_to_user_id) REFERENCES "user"(id),
    FOREIGN KEY (created_by_user_id) REFERENCES "user"(id),
    FOREIGN KEY (deal_id) REFERENCES deal_history(id),
    FOREIGN KEY (last_notification_user_id) REFERENCES "user"(id),
    FOREIGN KEY (org_id) REFERENCES organization(id),
    FOREIGN KEY (update_user_id) REFERENCES "user"(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE product_deal (
    id bigint,
    deal_id bigint,
    product_id bigint,
    active_flag boolean,
    add_time timestamp,
    billing_frequency text,
    billing_frequency_cycles integer,
    billing_start_date text,
    comments text,
    currency text,
    discount double precision,
    discount_percentage double precision,
    discount_type text,
    duration double precision,
    duration_unit text,
    enabled_flag boolean,
    item_price double precision,
    last_edit timestamp,
    "name" text,
    order_nr bigint,
    product_variation_id bigint,
    quantity double precision,
    quantity_formatted text,
    sum double precision,
    sum_formatted text,
    sum_no_discount double precision,
    tax bigint,
    tax_method text,
    PRIMARY KEY (id, deal_id),
    FOREIGN KEY (deal_id) REFERENCES deal_history(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE currency (
    code text,
    active_flag boolean,
    decimal_points integer,
    is_custom_flag boolean,
    "name" text,
    symbol text,
    PRIMARY KEY (code)
);

CREATE TABLE filter_helper (
    id integer,
    operators jsonb,
    relative_dates jsonb,
    -- address_field_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE goal_pipeline (
    goal_id text,
    pipeline_id bigint,
    PRIMARY KEY (goal_id, pipeline_id),
    FOREIGN KEY (goal_id) REFERENCES goal(id),
    FOREIGN KEY (pipeline_id) REFERENCES pipeline(id)
);

CREATE TABLE person (
    id bigint,
    org_id bigint,
    owner_id bigint,
    active_flag boolean,
    cc_email text,
    created_at timestamp,
    email text,
    label bigint,
    "name" text,
    phone text,
    picture_id bigint,
    update_time timestamp,
    visible_to bigint,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (org_id) REFERENCES organization(id),
    FOREIGN KEY (owner_id) REFERENCES "user"(id)
);

CREATE TABLE note (
    id bigint,
    deal_id bigint,
    last_updated_user_id bigint,
    lead_id text,
    org_id bigint,
    person_id bigint,
    user_id bigint,
    active_flag boolean,
    content text,
    created_at timestamp,
    pinned_to_deal_flag boolean,
    pinned_to_organization_flag boolean,
    update_time timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (deal_id) REFERENCES deal_history(id),
    FOREIGN KEY (last_updated_user_id) REFERENCES "user"(id),
    FOREIGN KEY (lead_id) REFERENCES lead_history(id),
    FOREIGN KEY (org_id) REFERENCES organization(id),
    FOREIGN KEY (person_id) REFERENCES person(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE stage (
    id bigint,
    pipeline_id bigint,
    active_flag boolean,
    created_at timestamp,
    deal_probability integer,
    "name" text,
    order_nr bigint,
    rotten_days bigint,
    rotten_flag boolean,
    update_time timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (pipeline_id) REFERENCES pipeline(id)
);

CREATE TABLE project_deal (
    deal_id bigint,
    project_id bigint,
    PRIMARY KEY (deal_id, project_id),
    FOREIGN KEY (deal_id) REFERENCES deal_history(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE installment (
    id bigint,
    deal_id bigint,
    amount double precision,
    billing_date text,
    description text,
    PRIMARY KEY (id, deal_id),
    FOREIGN KEY (deal_id) REFERENCES deal_history(id)
);

CREATE TABLE pipeline (
    id bigint,
    active boolean,
    created_at timestamp,
    deal_probability boolean,
    "name" text,
    order_nr bigint,
    selected boolean,
    update_time timestamp,
    url_title text,
    PRIMARY KEY (id)
);

CREATE TABLE call_log (
    id text,
    activity_id bigint,
    deal_id bigint,
    lead_id text,
    org_id bigint,
    person_id bigint,
    user_id bigint,
    company_id bigint,
    duration text,
    end_time timestamp,
    from_phone_number text,
    has_recording boolean,
    note text,
    outcome text,
    start_time timestamp,
    subject text,
    to_phone_number text,
    PRIMARY KEY (id),
    FOREIGN KEY (activity_id) REFERENCES activity(id),
    FOREIGN KEY (deal_id) REFERENCES deal_history(id),
    FOREIGN KEY (lead_id) REFERENCES lead_history(id),
    FOREIGN KEY (org_id) REFERENCES organization(id),
    FOREIGN KEY (person_id) REFERENCES person(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE deal_field_subfield (
    "key" text,
    parent_id bigint,
    active_flag boolean,
    edit_flag boolean,
    field_type text,
    id_suffix text,
    mandatory_flag jsonb,
    "name" text,
    PRIMARY KEY ("key", parent_id),
    FOREIGN KEY (parent_id) REFERENCES deal_field(id)
);

CREATE TABLE product (
    id bigint,
    owner_id bigint,
    active_flag boolean,
    category text,
    code text,
    created_at timestamp,
    description text,
    "name" text,
    tax double precision,
    unit text,
    update_time timestamp,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (owner_id) REFERENCES "user"(id)
);

CREATE TABLE email_bcc (
    recipient_id bigint,
    mail_message_id bigint,
    linked_person_id bigint,
    email_address text,
    PRIMARY KEY (recipient_id, mail_message_id),
    FOREIGN KEY (mail_message_id) REFERENCES mail_message(id),
    FOREIGN KEY (linked_person_id) REFERENCES person(id)
);

CREATE TABLE file (
    id bigint,
    activity_id bigint,
    deal_id bigint,
    mail_message_id bigint,
    product_id bigint,
    active_flag boolean,
    created_at timestamp,
    description text,
    file_name text,
    file_size bigint,
    inline_flag boolean,
    log_id bigint,
    "name" text,
    remote_id text,
    remote_location text,
    s_3_bucket text,
    update_time timestamp,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (activity_id) REFERENCES activity(id),
    FOREIGN KEY (deal_id) REFERENCES deal_history(id),
    FOREIGN KEY (mail_message_id) REFERENCES mail_message(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE goal_result (
    id text,
    owner_id bigint,
    assignee_id bigint,
    assignee_type text,
    duration_end text,
    duration_start text,
    expected_target bigint,
    expected_tracking_metric text,
    "interval" text,
    is_active boolean,
    progress double precision,
    report_ids jsonb,
    title text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (owner_id) REFERENCES "user"(id)
);

CREATE TABLE "role" (
    id bigint,
    active_flag boolean,
    "name" text,
    parent_role_id text,
    PRIMARY KEY (id)
);

CREATE TABLE permission_assignment (
    permission_set_id text,
    user_id bigint,
    PRIMARY KEY (permission_set_id, user_id),
    FOREIGN KEY (permission_set_id) REFERENCES permission_set(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE mail_message (
    id bigint,
    from_linked_person_id bigint,
    mail_thread_id bigint,
    user_id bigint,
    body_url text,
    created_at timestamp,
    deleted_flag integer,
    draft_flag integer,
    from_email_address text,
    has_attachments_flag integer,
    has_body_flag integer,
    has_inline_attachments_flag integer,
    has_real_attachments_flag integer,
    mail_link_tracking_enabled_flag integer,
    mail_tracking_status text,
    message_time timestamp,
    read_flag integer,
    sent_flag integer,
    sent_from_pipedrive_flag integer,
    smart_bcc_flag integer,
    snippet text,
    subject text,
    synced_flag integer,
    update_time timestamp,
    write_flag boolean,
    PRIMARY KEY (id),
    FOREIGN KEY (from_linked_person_id) REFERENCES person(id),
    FOREIGN KEY (mail_thread_id) REFERENCES mail_thread(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE mail_thread (
    id bigint,
    deal_id bigint,
    PRIMARY KEY (id),
    FOREIGN KEY (deal_id) REFERENCES deal_history(id)
);

CREATE TABLE activity_type (
    id integer,
    activity_type text,
    active_flag boolean,
    color text,
    created_at timestamp,
    icon_key text,
    is_custom_flag boolean,
    "name" text,
    update_time timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (activity_type) REFERENCES activity(id)
);

CREATE TABLE product_price_history (
    id bigint,
    updated_time timestamp,
    currency text,
    product_id bigint,
    cost double precision,
    overhead_cost double precision,
    price double precision,
    PRIMARY KEY (id, updated_time),
    FOREIGN KEY (currency) REFERENCES currency(code),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE email_cc (
    recipient_id bigint,
    mail_message_id bigint,
    linked_person_id bigint,
    email_address text,
    PRIMARY KEY (recipient_id, mail_message_id),
    FOREIGN KEY (mail_message_id) REFERENCES mail_message(id),
    FOREIGN KEY (linked_person_id) REFERENCES person(id)
);

CREATE TABLE activity_participant (
    activity_id bigint,
    person_id bigint,
    primary_flag boolean,
    PRIMARY KEY (activity_id, person_id),
    FOREIGN KEY (activity_id) REFERENCES activity(id),
    FOREIGN KEY (person_id) REFERENCES person(id)
);

CREATE TABLE organization (
    id bigint,
    owner_id bigint,
    active_flag boolean,
    address text,
    address_admin_area_level_1 text,
    address_admin_area_level_2 text,
    address_country text,
    address_formatted_address text,
    address_locality text,
    address_postal_code text,
    address_route text,
    address_street_number text,
    address_sublocality text,
    address_subpremise text,
    cc_email text,
    created_at timestamp,
    label text,
    "name" text,
    update_time timestamp,
    visible_to text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (owner_id) REFERENCES "user"(id)
);

CREATE TABLE deal_history (
    id bigint,
    creator_user_id bigint,
    currency text,
    org_id bigint,
    person_id bigint,
    pipeline_id bigint,
    stage_id bigint,
    user_id bigint,
    active boolean,
    cc_email text,
    close_time timestamp,
    created_at timestamp,
    deleted boolean,
    expected_close_date text,
    first_won_time timestamp,
    formatted_value text,
    formatted_weighted_value text,
    label text,
    last_incoming_mail_time timestamp,
    last_outgoing_mail_time timestamp,
    lost_reason text,
    lost_time timestamp,
    org_hidden boolean,
    person_hidden boolean,
    probability integer,
    rotten_time timestamp,
    stage_change_time timestamp,
    stage_order_nr bigint,
    "status" text,
    title text,
    update_time timestamp,
    "value" double precision,
    visible_to bigint,
    weighted_value double precision,
    weighted_value_currency text,
    won_time timestamp,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (creator_user_id) REFERENCES "user"(id),
    FOREIGN KEY (currency) REFERENCES currency(code),
    FOREIGN KEY (org_id) REFERENCES organization(id),
    FOREIGN KEY (person_id) REFERENCES person(id),
    FOREIGN KEY (pipeline_id) REFERENCES pipeline(id),
    FOREIGN KEY (stage_id) REFERENCES stage(id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE deal_field_option (
    id text,
    deal_field_id bigint,
    label text,
    PRIMARY KEY (id, deal_field_id),
    FOREIGN KEY (deal_field_id) REFERENCES deal_field(id)
);
