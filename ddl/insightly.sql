CREATE TABLE contact_link (
    id text,
    contact_id text,
    link_object_id text,
    relationship_id text,
    detail text,
    is_forward text,
    link_object_name text,
    "role" text,
    PRIMARY KEY (id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (link_object_id) REFERENCES lead(id),
    FOREIGN KEY (relationship_id) REFERENCES relationship(id)
);

CREATE TABLE contact_date (
    id text,
    contact_id text,
    create_task_yearly text,
    occasion_date text,
    occasion_name text,
    repeat_yearly text,
    PRIMARY KEY (id, contact_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE contact_tag (
    "name" text,
    contact_id text,
    PRIMARY KEY ("name", contact_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE contact (
    id text,
    created_user_id text,
    organisation_id text,
    owner_user_id text,
    address_mail_city text,
    address_mail_country text,
    address_mail_postcode text,
    address_mail_state text,
    address_mail_street text,
    address_other_city text,
    address_other_country text,
    address_other_postcode text,
    address_other_state text,
    address_other_street text,
    assistant_name text,
    background text,
    date_created_utc text,
    date_of_birth text,
    date_updated_utc text,
    email_address text,
    email_opted_out text,
    first_name text,
    image_url text,
    last_activity_date_utc text,
    last_name text,
    next_activity_date_utc text,
    phone text,
    phone_assistant text,
    phone_fax text,
    phone_home text,
    phone_mobile text,
    phone_other text,
    salutation text,
    social_facebook text,
    social_linkedin text,
    social_twitter text,
    title text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (created_user_id) REFERENCES users(id),
    FOREIGN KEY (organisation_id) REFERENCES organisation(id),
    FOREIGN KEY (owner_user_id) REFERENCES users(id)
);

CREATE TABLE lead_status (
    id text,
    default_status text,
    field_order text,
    "status" text,
    status_type text,
    PRIMARY KEY (id)
);

CREATE TABLE note_file_attachment (
    id text,
    note_id text,
    owner_user_id text,
    content_type text,
    date_created_utc text,
    date_updated_utc text,
    file_category_id text,
    file_name text,
    file_size text,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (note_id) REFERENCES note(id),
    FOREIGN KEY (owner_user_id) REFERENCES users(id)
);

CREATE TABLE custom_field_option (
    id text,
    custom_field_custom_object_name text,
    custom_field_name text,
    option_default text,
    option_value text,
    PRIMARY KEY (id, custom_field_custom_object_name, custom_field_name),
    FOREIGN KEY (custom_field_custom_object_name) REFERENCES custom_field(custom_object_name),
    FOREIGN KEY (custom_field_name) REFERENCES custom_field("name")
);

CREATE TABLE custom_field (
    "name" text,
    custom_object_name text,
    default_value text,
    editable text,
    field_for text,
    field_help_text text,
    field_label text,
    field_order text,
    field_type text,
    join_object text,
    visible text,
    PRIMARY KEY ("name", custom_object_name),
    FOREIGN KEY (custom_object_name) REFERENCES custom_object("name")
);

CREATE TABLE email_link (
    id text,
    email_id text,
    link_object_id text,
    relationship_id text,
    detail text,
    is_forward text,
    link_object_name text,
    "role" text,
    PRIMARY KEY (id),
    FOREIGN KEY (email_id) REFERENCES email(id),
    FOREIGN KEY (link_object_id) REFERENCES contact(id),
    FOREIGN KEY (relationship_id) REFERENCES relationship(id)
);

CREATE TABLE email_tag (
    "name" text,
    email_id text,
    PRIMARY KEY ("name", email_id),
    FOREIGN KEY (email_id) REFERENCES email(id)
);

CREATE TABLE email (
    id text,
    created_user_id text,
    owner_user_id text,
    date_created_utc text,
    email_date_utc text,
    email_from text,
    format text,
    queued_send_date_utc text,
    "size" text,
    subject text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_user_id) REFERENCES users(id),
    FOREIGN KEY (owner_user_id) REFERENCES users(id)
);

CREATE TABLE event_link (
    id text,
    event_id text,
    link_object_id text,
    relationship_id text,
    detail text,
    is_forward text,
    link_object_name text,
    "role" text,
    PRIMARY KEY (id),
    FOREIGN KEY (event_id) REFERENCES event(id),
    FOREIGN KEY (link_object_id) REFERENCES contact(id),
    FOREIGN KEY (relationship_id) REFERENCES relationship(id)
);

CREATE TABLE event (
    id text,
    owner_user_id text,
    all_day text,
    date_created_utc text,
    date_updated_utc text,
    details text,
    end_date_utc text,
    location text,
    reminder_date_utc text,
    reminder_sent text,
    start_date_utc text,
    title text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (owner_user_id) REFERENCES users(id)
);

CREATE TABLE contact_file_attachment (
    id text,
    contact_id text,
    owner_user_id text,
    content_type text,
    date_created_utc text,
    date_updated_utc text,
    file_category_id text,
    file_name text,
    file_size text,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (owner_user_id) REFERENCES users(id)
);

CREATE TABLE quote_item (
    id text,
    opportunity_item_id text,
    price_book_entry_id text,
    quote_id text,
    currency_code text,
    date_created_utc text,
    date_updated_utc text,
    description text,
    discount text,
    list_price text,
    quantity text,
    sort_order text,
    subtotal text,
    total_price text,
    unit_price text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (opportunity_item_id) REFERENCES opportunity_item(id),
    FOREIGN KEY (price_book_entry_id) REFERENCES price_book_entry(id),
    FOREIGN KEY (quote_id) REFERENCES quote(id)
);

CREATE TABLE email_file_attachment (
    id text,
    email_id text,
    owner_user_id text,
    content_type text,
    date_created_utc text,
    date_updated_utc text,
    file_category_id text,
    file_name text,
    file_size text,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (email_id) REFERENCES email(id),
    FOREIGN KEY (owner_user_id) REFERENCES users(id)
);

CREATE TABLE forum_post (
    id text,
    created_contact_id text,
    edited_contact_id text,
    forum_id text,
    ticket_id text,
    closed text,
    comment_count text,
    date_created text,
    date_edited text,
    date_update text,
    downvote_count text,
    featured text,
    follower_count text,
    message text,
    pending text,
    pinned text,
    post_name text,
    spam text,
    "status" text,
    upvote_count text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_contact_id) REFERENCES contact(id),
    FOREIGN KEY (edited_contact_id) REFERENCES contact(id),
    FOREIGN KEY (forum_id) REFERENCES forum(id),
    FOREIGN KEY (ticket_id) REFERENCES ticket(id)
);

CREATE TABLE project_category (
    id text,
    active text,
    background_color text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE product (
    id text,
    created_user_id text,
    owner_user_id text,
    active text,
    code text,
    currency_code text,
    date_created_utc text,
    date_updated_utc text,
    default_price text,
    description text,
    family text,
    image_url text,
    "name" text,
    sku text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (created_user_id) REFERENCES users(id),
    FOREIGN KEY (owner_user_id) REFERENCES users(id)
);

CREATE TABLE quote_document (
    id text,
    owner_user_id text,
    quote_id text,
    currency_code text,
    date_created_utc text,
    file_id text,
    file_name text,
    quotation_name text,
    PRIMARY KEY (id),
    FOREIGN KEY (owner_user_id) REFERENCES users(id),
    FOREIGN KEY (quote_id) REFERENCES quote(id)
);

CREATE TABLE task_link (
    id text,
    link_object_id text,
    relationship_id text,
    task_id text,
    detail text,
    is_forward text,
    link_object_name text,
    "role" text,
    PRIMARY KEY (id),
    FOREIGN KEY (link_object_id) REFERENCES contact(id),
    FOREIGN KEY (relationship_id) REFERENCES relationship(id),
    FOREIGN KEY (task_id) REFERENCES task(id)
);

CREATE TABLE task (
    id text,
    assigned_by_user_id text,
    assigned_team_id text,
    created_user_id text,
    email_id text,
    milestone_id text,
    opportunity_id text,
    owner_user_id text,
    parent_task_id text,
    project_id text,
    responsible_user_id text,
    stage_id text,
    task_category_id text,
    assigned_date_utc text,
    completed text,
    completed_date_utc text,
    date_created_utc text,
    date_updated_utc text,
    details text,
    due_date text,
    owner_visible text,
    percent_complete text,
    priority text,
    publicly_visible text,
    recurrence text,
    reminder_date_utc text,
    reminder_sent text,
    start_date text,
    "status" text,
    title text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (assigned_by_user_id) REFERENCES users(id),
    FOREIGN KEY (assigned_team_id) REFERENCES team(id),
    FOREIGN KEY (created_user_id) REFERENCES users(id),
    FOREIGN KEY (email_id) REFERENCES email(id),
    FOREIGN KEY (milestone_id) REFERENCES milestone(id),
    FOREIGN KEY (opportunity_id) REFERENCES opportunity(id),
    FOREIGN KEY (owner_user_id) REFERENCES users(id),
    FOREIGN KEY (parent_task_id) REFERENCES task(id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (responsible_user_id) REFERENCES users(id),
    FOREIGN KEY (stage_id) REFERENCES pipeline_stage(id),
    FOREIGN KEY (task_category_id) REFERENCES task_category(id)
);

CREATE TABLE pipeline_stage (
    id text,
    activity_set_id text,
    owner_user_id text,
    pipeline_id text,
    stage_name text,
    stage_order text,
    PRIMARY KEY (id),
    FOREIGN KEY (activity_set_id) REFERENCES activity_set(id),
    FOREIGN KEY (owner_user_id) REFERENCES users(id),
    FOREIGN KEY (pipeline_id) REFERENCES pipeline(id)
);

CREATE TABLE project_link (
    id text,
    link_object_id text,
    project_id text,
    relationship_id text,
    detail text,
    is_forward text,
    link_object_name text,
    "role" text,
    PRIMARY KEY (id),
    FOREIGN KEY (link_object_id) REFERENCES contact(id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (relationship_id) REFERENCES relationship(id)
);

CREATE TABLE project_tag (
    "name" text,
    project_id text,
    PRIMARY KEY ("name", project_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE project (
    id text,
    created_user_id text,
    opportunity_id text,
    owner_user_id text,
    pipeline_id text,
    project_category_id text,
    responsible_user_id text,
    stage_id text,
    completed_date text,
    date_created_utc text,
    date_updated_utc text,
    image_url text,
    last_activity_date_utc text,
    next_activity_date_utc text,
    project_details text,
    project_name text,
    started_date text,
    "status" text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (created_user_id) REFERENCES users(id),
    FOREIGN KEY (opportunity_id) REFERENCES opportunity(id),
    FOREIGN KEY (owner_user_id) REFERENCES users(id),
    FOREIGN KEY (pipeline_id) REFERENCES pipeline(id),
    FOREIGN KEY (project_category_id) REFERENCES project_category(id),
    FOREIGN KEY (responsible_user_id) REFERENCES users(id),
    FOREIGN KEY (stage_id) REFERENCES pipeline_stage(id)
);

CREATE TABLE task_category (
    id text,
    active text,
    background_color text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE lead_source (
    id text,
    default_value text,
    field_order text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE organisation_email_domain (
    id text,
    organisation_id text,
    email_domain text,
    PRIMARY KEY (id, organisation_id),
    FOREIGN KEY (organisation_id) REFERENCES organisation(id)
);

CREATE TABLE organisation_link (
    id text,
    link_object_id text,
    organisation_id text,
    relationship_id text,
    detail text,
    is_forward text,
    link_object_name text,
    "role" text,
    PRIMARY KEY (id),
    FOREIGN KEY (link_object_id) REFERENCES contact(id),
    FOREIGN KEY (organisation_id) REFERENCES organisation(id),
    FOREIGN KEY (relationship_id) REFERENCES relationship(id)
);

CREATE TABLE organisation_date (
    id text,
    organisation_id text,
    create_task_yearly text,
    occasion_date text,
    occasion_name text,
    repeat_yearly text,
    PRIMARY KEY (id, organisation_id),
    FOREIGN KEY (organisation_id) REFERENCES organisation(id)
);

CREATE TABLE organisation_tag (
    "name" text,
    organisation_id text,
    PRIMARY KEY ("name", organisation_id),
    FOREIGN KEY (organisation_id) REFERENCES organisation(id)
);

CREATE TABLE organisation (
    id text,
    created_user_id text,
    owner_user_id text,
    visible_team_id text,
    address_billing_city text,
    address_billing_country text,
    address_billing_postcode text,
    address_billing_state text,
    address_billing_street text,
    address_ship_city text,
    address_ship_country text,
    address_ship_postcode text,
    address_ship_state text,
    address_ship_street text,
    background text,
    date_created_utc text,
    date_updated_utc text,
    image_url text,
    last_activity_date_utc text,
    "name" text,
    next_activity_date_utc text,
    phone text,
    phone_fax text,
    social_facebook text,
    social_linkedin text,
    social_twitter text,
    website text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (created_user_id) REFERENCES users(id),
    FOREIGN KEY (owner_user_id) REFERENCES users(id),
    FOREIGN KEY (visible_team_id) REFERENCES team(id)
);

CREATE TABLE prospect_tag (
    "name" text,
    prospect_id text,
    PRIMARY KEY ("name", prospect_id),
    FOREIGN KEY (prospect_id) REFERENCES prospect(id)
);

CREATE TABLE prospect (
    id text,
    contact_id text,
    created_user_id text,
    lead_id text,
    organisation_id text,
    owner_user_id text,
    address_city text,
    address_country text,
    address_postcode text,
    address_state text,
    address_street text,
    date_created text,
    date_update text,
    description text,
    do_not_call text,
    do_not_email text,
    do_not_sync text,
    email_address text,
    employee_count text,
    fax text,
    first_name text,
    grade text,
    grade_profile_id text,
    industry text,
    last_activity_date text,
    last_name text,
    lead_conversion_date text,
    mobile text,
    opted_out text,
    organisation_name text,
    phone text,
    salutation text,
    score text,
    title text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (created_user_id) REFERENCES users(id),
    FOREIGN KEY (lead_id) REFERENCES lead(id),
    FOREIGN KEY (organisation_id) REFERENCES organisation(id),
    FOREIGN KEY (owner_user_id) REFERENCES users(id)
);

CREATE TABLE custom_object (
    "name" text,
    created_user_id text,
    date_created_utc text,
    date_updated_utc text,
    description text,
    enable_navbar text,
    enable_workflow text,
    plural_label text,
    record_name_display_format text,
    record_name_label text,
    record_name_type text,
    singular_label text,
    PRIMARY KEY ("name"),
    FOREIGN KEY (created_user_id) REFERENCES users(id)
);

CREATE TABLE relationship (
    id text,
    for_contacts text,
    for_organisations text,
    forward text,
    forward_title text,
    reverse text,
    reverse_title text,
    PRIMARY KEY (id)
);

CREATE TABLE opportunity_state_history (
    date_changed text,
    opportunity_id text,
    for_opportunity_state text,
    state_reason text,
    state_reason_id text,
    PRIMARY KEY (date_changed, opportunity_id),
    FOREIGN KEY (opportunity_id) REFERENCES opportunity(id)
);

CREATE TABLE users (
    id text,
    contact_id text,
    account_owner text,
    active text,
    administrator text,
    contact_display text,
    contact_order text,
    date_created_utc text,
    date_updated_utc text,
    email_address text,
    email_drop_box_address text,
    email_drop_box_identifier text,
    first_name text,
    instance_id text,
    last_name text,
    profile_id text,
    role_id text,
    task_week_start text,
    timezone_id text,
    user_currency text,
    PRIMARY KEY (id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE quote (
    id text,
    contact_id text,
    created_user_id text,
    opportunity_id text,
    organisation_id text,
    owner_user_id text,
    price_book_id text,
    address_billing_city text,
    address_billing_country text,
    address_billing_name text,
    address_billing_postcode text,
    address_billing_state text,
    address_billing_street text,
    address_shipping_city text,
    address_shipping_country text,
    address_shipping_name text,
    address_shipping_postcode text,
    address_shipping_state text,
    address_shipping_street text,
    date_created_utc text,
    date_updated_utc text,
    discount text,
    grand_total text,
    is_syncing text,
    line_item_count text,
    quotation_currency_code text,
    quotation_description text,
    quotation_email text,
    quotation_expiration_date text,
    quotation_fax text,
    quotation_name text,
    quotation_number text,
    quotation_phone text,
    quote_status text,
    shipping_handling text,
    subtotal text,
    tax text,
    total_price text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (created_user_id) REFERENCES users(id),
    FOREIGN KEY (opportunity_id) REFERENCES opportunity(id),
    FOREIGN KEY (organisation_id) REFERENCES organisation(id),
    FOREIGN KEY (owner_user_id) REFERENCES users(id),
    FOREIGN KEY (price_book_id) REFERENCES price_book(id)
);

CREATE TABLE opportunity_category (
    id text,
    active text,
    background_color text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE milestone (
    id text,
    owner_user_id text,
    project_id text,
    completed text,
    completed_date_utc text,
    date_created_utc text,
    date_updated_utc text,
    due_date text,
    responsible_user text,
    title text,
    PRIMARY KEY (id),
    FOREIGN KEY (owner_user_id) REFERENCES users(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE note_comment (
    id text,
    owner_user_id text,
    comment_id text,
    note_id text,
    PRIMARY KEY (id, owner_user_id),
    FOREIGN KEY (owner_user_id) REFERENCES users(id),
    FOREIGN KEY (comment_id) REFERENCES forum_comment(id),
    FOREIGN KEY (note_id) REFERENCES note(id)
);

CREATE TABLE organisation_file_attachment (
    id text,
    organisation_id text,
    owner_user_id text,
    content_type text,
    date_created_utc text,
    date_updated_utc text,
    file_category_id text,
    file_name text,
    file_size text,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (organisation_id) REFERENCES organisation(id),
    FOREIGN KEY (owner_user_id) REFERENCES users(id)
);

CREATE TABLE price_book (
    id text,
    created_user_id text,
    owner_user_id text,
    active text,
    currency_code text,
    date_created_utc text,
    date_updated_utc text,
    description text,
    is_standard text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_user_id) REFERENCES users(id),
    FOREIGN KEY (owner_user_id) REFERENCES users(id)
);

CREATE TABLE note_link (
    id text,
    link_object_id text,
    note_id text,
    relationship_id text,
    detail text,
    is_forward text,
    link_object_name text,
    "role" text,
    PRIMARY KEY (id),
    FOREIGN KEY (link_object_id) REFERENCES contact(id),
    FOREIGN KEY (note_id) REFERENCES note(id),
    FOREIGN KEY (relationship_id) REFERENCES relationship(id)
);

CREATE TABLE note (
    id text,
    owner_user_id text,
    body text,
    date_created_utc text,
    date_updated_utc text,
    title text,
    PRIMARY KEY (id),
    FOREIGN KEY (owner_user_id) REFERENCES users(id)
);

CREATE TABLE activity (
    id text,
    activity_set_id text,
    assigned_team_id text,
    owner_user_id text,
    responsible_user_id text,
    all_day text,
    category_id text,
    details text,
    due_days_after_start text,
    due_days_before_end text,
    duration text,
    event_days_after_start text,
    event_days_before_end text,
    event_time text,
    "name" text,
    owner_visible text,
    publicly_visible text,
    reminder text,
    reminder_days_before_due text,
    reminder_time text,
    skip_fri text,
    skip_mon text,
    skip_sat text,
    skip_sun text,
    skip_thu text,
    skip_tue text,
    skip_wed text,
    "type" text,
    PRIMARY KEY (id, activity_set_id),
    FOREIGN KEY (activity_set_id) REFERENCES activity_set(id),
    FOREIGN KEY (assigned_team_id) REFERENCES team(id),
    FOREIGN KEY (owner_user_id) REFERENCES users(id),
    FOREIGN KEY (responsible_user_id) REFERENCES users(id)
);

CREATE TABLE activity_set (
    id text,
    owner_user_id text,
    for_contact text,
    for_lead text,
    for_opportunity text,
    for_organisation text,
    for_project text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (owner_user_id) REFERENCES users(id)
);

CREATE TABLE pipeline (
    id text,
    owner_user_id text,
    for_opportunities text,
    for_projects text,
    pipeline_name text,
    PRIMARY KEY (id),
    FOREIGN KEY (owner_user_id) REFERENCES users(id)
);

CREATE TABLE opportunity_item (
    id text,
    opportunity_id text,
    price_book_entry_id text,
    currency_code text,
    date_created_utc text,
    date_updated_utc text,
    description text,
    discount text,
    list_price text,
    quantity text,
    service_date text,
    subtotal text,
    total_price text,
    unit_price text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (opportunity_id) REFERENCES opportunity(id),
    FOREIGN KEY (price_book_entry_id) REFERENCES price_book_entry(id)
);

CREATE TABLE forum_comment (
    id text,
    created_contact_id text,
    edited_contact_id text,
    forum_id text,
    post_id text,
    answer text,
    body text,
    date_created text,
    date_edited text,
    date_update text,
    downvote_count text,
    official text,
    pending text,
    spam text,
    upvote_count text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_contact_id) REFERENCES contact(id),
    FOREIGN KEY (edited_contact_id) REFERENCES contact(id),
    FOREIGN KEY (forum_id) REFERENCES forum(id),
    FOREIGN KEY (post_id) REFERENCES forum_post(id)
);

CREATE TABLE price_book_entry (
    id text,
    created_user_id text,
    price_book_id text,
    product_id text,
    active text,
    currency_code text,
    date_created_utc text,
    date_updated_utc text,
    price text,
    use_standard_price text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (created_user_id) REFERENCES users(id),
    FOREIGN KEY (price_book_id) REFERENCES price_book(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE lead_file_attachment (
    id text,
    lead_id text,
    owner_user_id text,
    content_type text,
    date_created_utc text,
    date_updated_utc text,
    file_category_id text,
    file_name text,
    file_size text,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (lead_id) REFERENCES lead(id),
    FOREIGN KEY (owner_user_id) REFERENCES users(id)
);

CREATE TABLE forum_category (
    id text,
    created_date text,
    "name" text,
    updated_date text,
    PRIMARY KEY (id)
);

CREATE TABLE ticket_tag (
    "name" text,
    ticket_id text,
    PRIMARY KEY ("name", ticket_id),
    FOREIGN KEY (ticket_id) REFERENCES ticket(id)
);

CREATE TABLE ticket (
    id text,
    contact_id text,
    created_user_id text,
    organisation_id text,
    owner_user_id text,
    date_closed text,
    date_created text,
    date_solved text,
    date_updated text,
    priority text,
    "source" text,
    subject text,
    ticket_comment_body text,
    ticket_number text,
    ticket_status text,
    ticket_type text,
    to_email_address text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (created_user_id) REFERENCES users(id),
    FOREIGN KEY (organisation_id) REFERENCES organisation(id),
    FOREIGN KEY (owner_user_id) REFERENCES users(id)
);

CREATE TABLE team_member (
    permission_id text,
    member_user_id text,
    team_id text,
    PRIMARY KEY (permission_id, member_user_id, team_id),
    FOREIGN KEY (member_user_id) REFERENCES users(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE team (
    id text,
    date_created_utc text,
    date_updated_utc text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE opportunity_file_attachment (
    id text,
    opportunity_id text,
    owner_user_id text,
    content_type text,
    date_created_utc text,
    date_updated_utc text,
    file_category_id text,
    file_name text,
    file_size text,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (opportunity_id) REFERENCES opportunity(id),
    FOREIGN KEY (owner_user_id) REFERENCES users(id)
);

CREATE TABLE custom_object_record (
    id text,
    owner_user_id text,
    visible_team_id text,
    date_created_utc text,
    record_name text,
    visible_to text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (owner_user_id) REFERENCES users(id),
    FOREIGN KEY (visible_team_id) REFERENCES team(id)
);

CREATE TABLE opportunity_link (
    id text,
    link_object_id text,
    opportunity_id text,
    relationship_id text,
    detail text,
    is_forward text,
    link_object_name text,
    "role" text,
    PRIMARY KEY (id),
    FOREIGN KEY (link_object_id) REFERENCES contact(id),
    FOREIGN KEY (opportunity_id) REFERENCES opportunity(id),
    FOREIGN KEY (relationship_id) REFERENCES relationship(id)
);

CREATE TABLE opportunity_tag (
    "name" text,
    opportunity_id text,
    PRIMARY KEY ("name", opportunity_id),
    FOREIGN KEY (opportunity_id) REFERENCES opportunity(id)
);

CREATE TABLE opportunity (
    id text,
    created_user_id text,
    opportunity_category_id text,
    organisation_id text,
    owner_user_id text,
    pipeline_id text,
    price_book_id text,
    responsible_user_id text,
    stage_id text,
    actual_close_date text,
    bid_amount text,
    bid_currency text,
    bid_duration text,
    bid_type text,
    date_created_utc text,
    date_updated_utc text,
    details text,
    forecast_close_date text,
    image_url text,
    last_activity_date_utc text,
    "name" text,
    next_activity_date_utc text,
    probability text,
    "state" text,
    "value" text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (created_user_id) REFERENCES users(id),
    FOREIGN KEY (opportunity_category_id) REFERENCES opportunity_category(id),
    FOREIGN KEY (organisation_id) REFERENCES organisation(id),
    FOREIGN KEY (owner_user_id) REFERENCES users(id),
    FOREIGN KEY (pipeline_id) REFERENCES pipeline(id),
    FOREIGN KEY (price_book_id) REFERENCES price_book(id),
    FOREIGN KEY (responsible_user_id) REFERENCES users(id),
    FOREIGN KEY (stage_id) REFERENCES pipeline_stage(id)
);

CREATE TABLE forum (
    id text,
    created_user_id text,
    forum_category_id text,
    date_created text,
    date_updated text,
    description text,
    forum_name text,
    forum_order text,
    forum_type text,
    visibility text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_user_id) REFERENCES users(id),
    FOREIGN KEY (forum_category_id) REFERENCES forum_category(id)
);

CREATE TABLE lead_link (
    id text,
    lead_id text,
    link_object_id text,
    relationship_id text,
    detail text,
    is_forward text,
    link_object_name text,
    "role" text,
    PRIMARY KEY (id),
    FOREIGN KEY (lead_id) REFERENCES lead(id),
    FOREIGN KEY (link_object_id) REFERENCES contact(id),
    FOREIGN KEY (relationship_id) REFERENCES relationship(id)
);

CREATE TABLE lead_tag (
    "name" text,
    lead_id text,
    PRIMARY KEY ("name", lead_id),
    FOREIGN KEY (lead_id) REFERENCES lead(id)
);

CREATE TABLE lead (
    id text,
    converted_contact_id text,
    converted_opportunity_id text,
    converted_organisation_id text,
    created_user_id text,
    lead_source_id text,
    lead_status_id text,
    owner_user_id text,
    responsible_user_id text,
    address_city text,
    address_country text,
    address_postcode text,
    address_state text,
    address_street text,
    converted text,
    converted_date_utc text,
    date_created_utc text,
    date_updated_utc text,
    email text,
    email_opted_out text,
    fax text,
    first_name text,
    image_url text,
    industry text,
    last_activity_date_utc text,
    last_name text,
    lead_description text,
    lead_rating text,
    mobile text,
    next_activity_date_utc text,
    phone text,
    salutation text,
    title text,
    website text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (converted_contact_id) REFERENCES contact(id),
    FOREIGN KEY (converted_opportunity_id) REFERENCES opportunity(id),
    FOREIGN KEY (converted_organisation_id) REFERENCES organisation(id),
    FOREIGN KEY (created_user_id) REFERENCES users(id),
    FOREIGN KEY (lead_source_id) REFERENCES lead_source(id),
    FOREIGN KEY (lead_status_id) REFERENCES lead_status(id),
    FOREIGN KEY (owner_user_id) REFERENCES users(id),
    FOREIGN KEY (responsible_user_id) REFERENCES users(id)
);
