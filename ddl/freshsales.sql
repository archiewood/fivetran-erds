CREATE TABLE contact_email (
    id text,
    contact_id text,
    destroy text,
    is_primary text,
    label text,
    "value" text,
    PRIMARY KEY (id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE contact_system_tag (
    "index" text,
    contact_id text,
    system_tag_name text,
    PRIMARY KEY ("index", contact_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE contact_team_user (
    contact_id text,
    team_user_id text,
    PRIMARY KEY (contact_id, team_user_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (team_user_id) REFERENCES users(id)
);

CREATE TABLE contact_sales_account (
    contact_id text,
    id text,
    is_primary text,
    partial text,
    PRIMARY KEY (contact_id, id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (id) REFERENCES account(id)
);

CREATE TABLE contact_appointment (
    apponitment_id text,
    contact_id text,
    appointment_id text,
    PRIMARY KEY (apponitment_id, contact_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (appointment_id) REFERENCES appointment(id)
);

CREATE TABLE contact_lead_source (
    contact_id text,
    lead_source_id text,
    PRIMARY KEY (contact_id, lead_source_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (lead_source_id) REFERENCES lead_source(id)
);

CREATE TABLE contact_territory (
    contact_id text,
    territory_id text,
    PRIMARY KEY (contact_id, territory_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (territory_id) REFERENCES territory(id)
);

CREATE TABLE contact_campaign (
    campaign_id text,
    contact_id text,
    PRIMARY KEY (campaign_id, contact_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE contact_task (
    contact_id text,
    task_id text,
    PRIMARY KEY (contact_id, task_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (task_id) REFERENCES task(id)
);

CREATE TABLE contact_note (
    contact_id text,
    note_id text,
    PRIMARY KEY (contact_id, note_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (note_id) REFERENCES note(id)
);

CREATE TABLE contact_tag (
    "index" text,
    contact_id text,
    tag_name text,
    PRIMARY KEY ("index", contact_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE contact (
    id text,
    contact_view_id text,
    creater_id text,
    active_sales_sequence text,
    address text,
    avatar text,
    city text,
    completed_sales_sequence text,
    country text,
    created_at text,
    customer_fit text,
    department text,
    display_name text,
    do_not_disturb text,
    email text,
    email_status text,
    external_id text,
    facebook text,
    first_campaign text,
    first_medium text,
    first_name text,
    first_seen_chat text,
    first_source text,
    has_authority text,
    is_deleted text,
    job_title text,
    keyword text,
    last_assigned_at text,
    last_campaign text,
    last_contacted text,
    last_contacted_mode text,
    last_contacted_sales_activity_mode text,
    last_contacted_via_chat text,
    last_contacted_via_sales_activity text,
    last_medium text,
    last_name text,
    last_seen text,
    last_seen_chat text,
    last_source text,
    latest_campaign text,
    latest_medium text,
    latest_source text,
    lead_quality text,
    lead_score text,
    linkedin text,
    locale text,
    mcr_id text,
    medium text,
    mobile_number text,
    open_deals_amount text,
    open_deals_count text,
    other_unsubscription_reason text,
    phone_number jsonb,
    recent_note text,
    record_type_id text,
    sms_subscription_status text,
    "state" text,
    subscription_status text,
    subscription_type text,
    time_zone text,
    total_session text,
    twitter text,
    unsubscription_reason text,
    updated_at text,
    web_form_id text,
    whatsapp_subscription_status text,
    won_deals_amount text,
    won_deals_count text,
    work_email text,
    work_number text,
    zipcode text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (contact_view_id) REFERENCES contact_view(id),
    FOREIGN KEY (creater_id) REFERENCES users(id)
);

CREATE TABLE deal_stage (
    id text,
    choice_type text,
    deal_pipeline_id text,
    forecast_type text,
    "name" text,
    partial text,
    "position" text,
    probability text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE territory (
    id text,
    level_id text,
    "name" text,
    parent_territory_id text,
    "position" text,
    tree_id text,
    PRIMARY KEY (id)
);

CREATE TABLE contact_view (
    id text,
    user_id text,
    is_default text,
    is_public text,
    model_class_name text,
    "name" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE account_contact (
    "index" text,
    account_id text,
    contact_id text,
    PRIMARY KEY ("index", account_id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE account_task (
    "index" text,
    account_id text,
    task_id text,
    PRIMARY KEY ("index", account_id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (task_id) REFERENCES task(id)
);

CREATE TABLE account_appointment (
    "index" text,
    account_id text,
    appointment_id text,
    PRIMARY KEY ("index", account_id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (appointment_id) REFERENCES appointment(id)
);

CREATE TABLE account_deal (
    "index" text,
    account_id text,
    deal_id text,
    PRIMARY KEY ("index", account_id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (deal_id) REFERENCES deal(id)
);

CREATE TABLE account (
    id text,
    account_view_id text,
    owner_id text,
    parent_sales_account_id text,
    active_sales_sequence text,
    address text,
    annual_revenue text,
    avatar text,
    city text,
    completed_sales_sequence text,
    country text,
    created_at text,
    facebook text,
    is_deleted text,
    last_assigned_at text,
    last_contacted text,
    last_contacted_mode text,
    last_contacted_sales_activity_mode text,
    last_contacted_via_sales_activity text,
    linkedin text,
    "name" text,
    number_of_employee text,
    open_deals_amount text,
    open_deals_count text,
    phone text,
    recent_note text,
    "state" text,
    tags jsonb,
    team_user_id text,
    twitter text,
    updated_at text,
    web_form_id text,
    website text,
    won_deals_amount text,
    won_deals_count text,
    zipcode text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (account_view_id) REFERENCES account_view(id),
    FOREIGN KEY (owner_id) REFERENCES users(id),
    FOREIGN KEY (parent_sales_account_id) REFERENCES account(id)
);

CREATE TABLE appointment (
    id text,
    creater_id text,
    checkedin_at text,
    description text,
    end_date text,
    from_date text,
    latitude text,
    location text,
    longitude text,
    time_zone text,
    title text,
    PRIMARY KEY (id),
    FOREIGN KEY (creater_id) REFERENCES users(id)
);

CREATE TABLE appointment_attendee (
    appointment_attendee_id text,
    appointment_id text,
    PRIMARY KEY (appointment_attendee_id, appointment_id),
    FOREIGN KEY (appointment_id) REFERENCES appointment(id)
);

CREATE TABLE lead_activity (
    composite_id text,
    lead_id text,
    action_data_email_id text,
    action_data_status text,
    action_data_subject text,
    action_type text,
    actionable_id text,
    actionable_type text,
    additional_timeline_info_is_hard_deleted text,
    additional_timeline_info_name text,
    automation text,
    created_at text,
    targetable_id text,
    targetable_name text,
    targetable_type text,
    user_activity text,
    PRIMARY KEY (composite_id),
    FOREIGN KEY (lead_id) REFERENCES lead(id)
);

CREATE TABLE lead_source (
    id text,
    "name" text,
    partial text,
    "position" text,
    PRIMARY KEY (id)
);

CREATE TABLE contact_activity_add_info_attendee (
    id text,
    composite_id text,
    account_id text,
    import_id text,
    secondary_event_id text,
    task_id text,
    user_id text,
    PRIMARY KEY (id, composite_id),
    FOREIGN KEY (composite_id) REFERENCES contact_activity(composite_id)
);

CREATE TABLE contact_activity_subscription_type_added (
    "index" text,
    composite_id text,
    subscription_type_name text,
    PRIMARY KEY ("index", composite_id),
    FOREIGN KEY (composite_id) REFERENCES contact_activity(composite_id)
);

CREATE TABLE contact_activity (
    composite_id text,
    contact_id text,
    user_id text,
    action_data_description text,
    action_data_due_date text,
    action_data_outcome text,
    action_data_status text,
    action_data_title text,
    action_type text,
    actionable_id text,
    additional_timeline_info_additional_targetable_count text,
    additional_timeline_info_additional_user_count text,
    additional_timeline_info_callable_targetables jsonb,
    additional_timeline_info_creater_id text,
    additional_timeline_info_event_type text,
    additional_timeline_info_has_mail text,
    additional_timeline_info_has_multiple_emails text,
    additional_timeline_info_is_deleted text,
    additional_timeline_info_outcome text,
    additional_timeline_info_primary_user_name_avatar text,
    additional_timeline_info_primary_user_name_name text,
    additional_timeline_info_status text,
    additional_timeline_info_targetables_with_email jsonb,
    additional_timeline_info_team_member_info jsonb,
    automation text,
    created_at text,
    group_id text,
    group_name text,
    group_type text,
    has_overdue text,
    id text,
    targetable_id text,
    targetable_name text,
    targetable_type text,
    user_activity text,
    PRIMARY KEY (composite_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE sales_activity (
    id text,
    creater_id text,
    owner_id text,
    sales_activity_outcome_id text,
    sales_activity_type_id text,
    checkedin_at text,
    conversation_time text,
    created_at text,
    end_date text,
    import_id text,
    latitude text,
    location text,
    longitude text,
    note text,
    remote_id text,
    start_date text,
    targetable_id text,
    targetable_type text,
    title text,
    updated_at text,
    updater_id text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (creater_id) REFERENCES users(id),
    FOREIGN KEY (owner_id) REFERENCES users(id),
    FOREIGN KEY (sales_activity_outcome_id) REFERENCES sales_activity_outcome(id),
    FOREIGN KEY (sales_activity_type_id) REFERENCES sales_activity_type(id)
);

CREATE TABLE users (
    id text,
    display_name text,
    email text,
    is_active text,
    mobile_number text,
    work_number text,
    PRIMARY KEY (id)
);

CREATE TABLE sales_activity_outcome (
    id text,
    sales_activity_type_id text,
    "name" text,
    partial text,
    "position" text,
    PRIMARY KEY (id),
    FOREIGN KEY (sales_activity_type_id) REFERENCES sales_activity_type(id)
);

CREATE TABLE industry_type (
    id text,
    "name" text,
    partial text,
    "position" text,
    PRIMARY KEY (id)
);

CREATE TABLE lead_view (
    id text,
    user_id text,
    current_user_permissions jsonb,
    is_default text,
    model_class_name text,
    "name" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE deal_type (
    id text,
    "name" text,
    partial text,
    "position" text,
    PRIMARY KEY (id)
);

CREATE TABLE lead_stage (
    id text,
    choice_type text,
    "name" text,
    partial text,
    "position" text,
    PRIMARY KEY (id)
);

CREATE TABLE note (
    id text,
    creater_id text,
    lead_view_id text,
    collab_context_has_slack_view_access text,
    collab_context_message_id text,
    created_at text,
    description text,
    duration text,
    has_access text,
    html_content text,
    targetable_id text,
    targetable_type text,
    updated_at text,
    url text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (creater_id) REFERENCES users(id),
    FOREIGN KEY (lead_view_id) REFERENCES lead_view(id)
);

CREATE TABLE business_type (
    id text,
    "name" text,
    partial text,
    "position" text,
    PRIMARY KEY (id)
);

CREATE TABLE campaign (
    id text,
    "name" text,
    partial text,
    "position" text,
    PRIMARY KEY (id)
);

CREATE TABLE sales_activity_type (
    id text,
    internal_name text,
    is_checkedin text,
    is_checkedin_mandatory text,
    is_default text,
    is_outcome_mandatory text,
    "name" text,
    partial text,
    "position" text,
    show_in_conversation text,
    PRIMARY KEY (id)
);

CREATE TABLE currency (
    id text,
    currency_code text,
    currency_type text,
    exchange_rate text,
    is_active text,
    partial text,
    schedule_info text,
    PRIMARY KEY (id)
);

CREATE TABLE marketing_contact (
    _fivetran_id text,
    id text,
    marketing_id text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (id) REFERENCES contact(id),
    FOREIGN KEY (marketing_id) REFERENCES marketing(id)
);

CREATE TABLE task (
    id text,
    creater_id text,
    owner_id text,
    created_at text,
    description text,
    due_date text,
    "status" text,
    title text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (creater_id) REFERENCES users(id),
    FOREIGN KEY (owner_id) REFERENCES users(id)
);

CREATE TABLE account_view (
    id text,
    user_id text,
    current_user_permissions jsonb,
    is_default text,
    is_public text,
    model_class_name text,
    "name" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE marketing (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE deal_contact (
    "index" text,
    deal_id text,
    contact_id text,
    PRIMARY KEY ("index", deal_id),
    FOREIGN KEY (deal_id) REFERENCES deal(id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE deal_sales_activity (
    "index" text,
    deal_id text,
    sales_activity_id text,
    PRIMARY KEY ("index", deal_id),
    FOREIGN KEY (deal_id) REFERENCES deal(id),
    FOREIGN KEY (sales_activity_id) REFERENCES sales_activity(id)
);

CREATE TABLE deal (
    id text,
    deal_pipeline_id text,
    deal_stage_id text,
    deal_type_id text,
    deal_view_id text,
    sales_account_id text,
    active_sales_sequence text,
    age text,
    amount text,
    avatar text,
    base_currency_amount text,
    closed_date text,
    completed_sales_sequence text,
    created_at text,
    deal_prediction text,
    deal_prediction_last_updated_at text,
    deal_product_id text,
    expected_close text,
    expected_deal_value text,
    fc_widget_collaboration_auth_token text,
    fc_widget_collaboration_convo_token text,
    fc_widget_collaboration_encoded_jwt_token text,
    forecast_category text,
    freddy_forecast_metric text,
    has_product text,
    is_deleted text,
    last_assigned_at text,
    last_contacted_sales_activity_mode text,
    last_contacted_via_sales_activity text,
    last_deal_prediction text,
    "name" text,
    owner_id text,
    probability text,
    recent_note text,
    rotten_day text,
    stage_updated_time text,
    tags jsonb,
    team_user_id jsonb,
    upcoming_activities_time text,
    updated_at text,
    web_form_id text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (deal_pipeline_id) REFERENCES deal_pipeline(id),
    FOREIGN KEY (deal_stage_id) REFERENCES deal_stage(id),
    FOREIGN KEY (deal_type_id) REFERENCES deal_type(id),
    FOREIGN KEY (deal_view_id) REFERENCES deal_view(id),
    FOREIGN KEY (sales_account_id) REFERENCES account(id)
);

CREATE TABLE deal_payment_status (
    id text,
    "name" text,
    partial text,
    "position" text,
    PRIMARY KEY (id)
);

CREATE TABLE deal_pipeline_config (
    "index" text,
    deal_pipeline_id text,
    field_name text,
    highligh text,
    "position" text,
    PRIMARY KEY ("index", deal_pipeline_id),
    FOREIGN KEY (deal_pipeline_id) REFERENCES deal_pipeline(id)
);

CREATE TABLE deal_pipeline_stage (
    deal_pipeline_id text,
    id text,
    PRIMARY KEY (deal_pipeline_id, id),
    FOREIGN KEY (deal_pipeline_id) REFERENCES deal_pipeline(id),
    FOREIGN KEY (id) REFERENCES deal_stage(id)
);

CREATE TABLE deal_pipeline (
    id text,
    aggregated_field text,
    is_default text,
    "name" text,
    partial text,
    "position" text,
    rotting_days text,
    PRIMARY KEY (id)
);

CREATE TABLE contact_status (
    id text,
    forecast_type text,
    "name" text,
    partial text,
    "position" text,
    PRIMARY KEY (id)
);

CREATE TABLE deal_reason (
    id text,
    "name" text,
    partial text,
    "position" text,
    PRIMARY KEY (id)
);

CREATE TABLE deal_view (
    id text,
    user_id text,
    current_user_permissions jsonb,
    is_default text,
    is_public text,
    model_class_name text,
    "name" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE lead_team_user (
    lead_id text,
    team_user_id text,
    PRIMARY KEY (lead_id, team_user_id),
    FOREIGN KEY (lead_id) REFERENCES lead(id),
    FOREIGN KEY (team_user_id) REFERENCES users(id)
);

CREATE TABLE lead_lead_source (
    lead_id text,
    lead_source_id text,
    PRIMARY KEY (lead_id, lead_source_id),
    FOREIGN KEY (lead_id) REFERENCES lead(id),
    FOREIGN KEY (lead_source_id) REFERENCES lead_source(id)
);

CREATE TABLE lead_lead_stage (
    lead_id text,
    lead_stage_id text,
    PRIMARY KEY (lead_id, lead_stage_id),
    FOREIGN KEY (lead_id) REFERENCES lead(id),
    FOREIGN KEY (lead_stage_id) REFERENCES lead_stage(id)
);

CREATE TABLE lead_territory (
    lead_id text,
    territory_id text,
    PRIMARY KEY (lead_id, territory_id),
    FOREIGN KEY (lead_id) REFERENCES lead(id),
    FOREIGN KEY (territory_id) REFERENCES territory(id)
);

CREATE TABLE lead_campaign (
    campaign_id text,
    lead_id text,
    PRIMARY KEY (campaign_id, lead_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (lead_id) REFERENCES lead(id)
);

CREATE TABLE lead_task (
    lead_id text,
    task_id text,
    PRIMARY KEY (lead_id, task_id),
    FOREIGN KEY (lead_id) REFERENCES lead(id),
    FOREIGN KEY (task_id) REFERENCES task(id)
);

CREATE TABLE lead_appointment (
    appointment_id text,
    lead_id text,
    PRIMARY KEY (appointment_id, lead_id),
    FOREIGN KEY (appointment_id) REFERENCES appointment(id),
    FOREIGN KEY (lead_id) REFERENCES lead(id)
);

CREATE TABLE lead_note (
    lead_id text,
    note_id text,
    PRIMARY KEY (lead_id, note_id),
    FOREIGN KEY (lead_id) REFERENCES lead(id),
    FOREIGN KEY (note_id) REFERENCES note(id)
);

CREATE TABLE lead_email (
    id text,
    lead_id text,
    lead_view_id text,
    _destroy text,
    is_primary text,
    label text,
    "value" text,
    PRIMARY KEY (id, lead_id, lead_view_id),
    FOREIGN KEY (lead_id) REFERENCES lead(id),
    FOREIGN KEY (lead_view_id) REFERENCES lead_view(id)
);

CREATE TABLE lead (
    id text,
    deal_id text,
    lead_view_id text,
    active_sales_sequences text,
    address text,
    avatar text,
    city text,
    company text,
    completed_sales_sequences text,
    country text,
    created_at text,
    deal text,
    department text,
    display_name text,
    do_not_disturb text,
    email text,
    email_status text,
    facebook text,
    first_name text,
    has_authority text,
    is_deleted text,
    job_title text,
    keyword text,
    last_assigned_at text,
    last_contacted text,
    last_contacted_mode text,
    last_contacted_sales_activity_mode text,
    last_contacted_via_chat text,
    last_contacted_via_sales_activity text,
    last_name text,
    last_seen text,
    lead_quality text,
    lead_score text,
    linkedin text,
    medium text,
    mobile_number text,
    phone_numbers jsonb,
    recent_note text,
    record_type_id text,
    stage_updated_time text,
    "state" text,
    subscription_status text,
    tags jsonb,
    time_zone text,
    twitter text,
    updated_at text,
    web_form_ids text,
    work_number text,
    zipcode text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (deal_id) REFERENCES deal(id),
    FOREIGN KEY (lead_view_id) REFERENCES lead_view(id)
);
