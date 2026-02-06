CREATE TABLE sla (
    _fivetran_id text,
    report_id text,
    achieved text,
    "name" text,
    target text,
    tickets_breached text,
    tickets_checked text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (report_id) REFERENCES report(id)
);

CREATE TABLE custom_user_choice (
    "index" text,
    user_custom_id text,
    dependant_field jsonb,
    id text,
    text text,
    PRIMARY KEY ("index", user_custom_id),
    FOREIGN KEY (user_custom_id) REFERENCES user_custom(id)
);

CREATE TABLE user_custom (
    id text,
    depends_on_choice text,
    "name" text,
    orders text,
    required text,
    "type" text,
    visible_to_staff_only text,
    PRIMARY KEY (id)
);

CREATE TABLE custom_ticket_choice (
    id text,
    custom_ticket_id text,
    value_id text,
    dependant_field jsonb,
    PRIMARY KEY (id),
    FOREIGN KEY (custom_ticket_id) REFERENCES custom_ticket(id),
    FOREIGN KEY (value_id) REFERENCES ticket_custom_field(id)
);

CREATE TABLE custom_ticket_category (
    "index" text,
    custom_ticket_id text,
    category text,
    orders text,
    PRIMARY KEY ("index", custom_ticket_id),
    FOREIGN KEY (custom_ticket_id) REFERENCES custom_ticket(id)
);

CREATE TABLE custom_ticket (
    id text,
    compulsory_on_move text,
    depends_on_choice text,
    required text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES ticket_custom_field(id)
);

CREATE TABLE staff_activity (
    report_id text,
    staff_id text,
    assigned text,
    completed text,
    "name" text,
    no_of_reply text,
    participated text,
    pending text,
    private_notes text,
    time_spent text,
    PRIMARY KEY (report_id, staff_id),
    FOREIGN KEY (report_id) REFERENCES report(id),
    FOREIGN KEY (staff_id) REFERENCES staff(id)
);

CREATE TABLE report (
    id text,
    description text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE staff_performance (
    report_id text,
    staff_id text,
    average_first_response_time text,
    average_no_of_responses text,
    average_no_of_responses_for_completion text,
    average_response_time text,
    average_time_spent text,
    average_time_to_ticket_complete text,
    "name" text,
    PRIMARY KEY (report_id, staff_id),
    FOREIGN KEY (report_id) REFERENCES report(id),
    FOREIGN KEY (staff_id) REFERENCES staff(id)
);

CREATE TABLE articles_tags (
    tags text,
    article_id text,
    PRIMARY KEY (tags, article_id),
    FOREIGN KEY (article_id) REFERENCES article(id)
);

CREATE TABLE article (
    id text,
    attachments jsonb,
    content text,
    contents text,
    full_url text,
    language_enabled text,
    language_id text,
    language_name text,
    language_visible text,
    last_updated_at text,
    related_articles jsonb,
    section_id text,
    section_name text,
    slug text,
    title text,
    "view" text,
    PRIMARY KEY (id)
);

CREATE TABLE tabular_data (
    id text,
    display_id text,
    report_id text,
    assignee text,
    due_date text,
    status_id text,
    status_name text,
    subject text,
    PRIMARY KEY (id),
    FOREIGN KEY (display_id) REFERENCES ticket(display_id),
    FOREIGN KEY (report_id) REFERENCES report(id)
);

CREATE TABLE ticket_custom_field (
    id text,
    ticket_id text,
    compulsory_on_complete text,
    "name" text,
    "type" text,
    "value" text,
    value_id text,
    visible_to_staff_only text,
    PRIMARY KEY (id),
    FOREIGN KEY (ticket_id) REFERENCES ticket(id)
);

CREATE TABLE ticket_subscriber (
    id text,
    ticket_id text,
    email text,
    first_name text,
    last_name text,
    PRIMARY KEY (id, ticket_id),
    FOREIGN KEY (ticket_id) REFERENCES ticket(id)
);

CREATE TABLE ticket_permission (
    permission text,
    ticket_id text,
    PRIMARY KEY (permission, ticket_id),
    FOREIGN KEY (ticket_id) REFERENCES ticket(id)
);

CREATE TABLE ticket_update (
    update_id text,
    ticket_id text,
    assignee_change text,
    category_change text,
    custom_field_change text,
    due_date_change text,
    priority_change_new text,
    priority_change_new_name text,
    priority_change_old text,
    priority_change_old_name text,
    satisfaction_survey text,
    status_change_new text,
    status_change_new_name text,
    status_change_old text,
    status_change_old_name text,
    time_spent text,
    time_stamp text,
    to_id text,
    to_type text,
    PRIMARY KEY (update_id, ticket_id),
    FOREIGN KEY (ticket_id) REFERENCES ticket(id)
);

CREATE TABLE ticket_category (
    category text,
    "index" text,
    ticket_id text,
    PRIMARY KEY (category, "index"),
    FOREIGN KEY (ticket_id) REFERENCES ticket(id)
);

CREATE TABLE ticket_status (
    id text,
    ticket_id text,
    behavior text,
    color text,
    defaults text,
    "name" text,
    orders text,
    PRIMARY KEY (id, ticket_id),
    FOREIGN KEY (ticket_id) REFERENCES ticket(id)
);

CREATE TABLE ticket_priority (
    id text,
    ticket_id text,
    defaults text,
    "name" text,
    orders text,
    PRIMARY KEY (id, ticket_id),
    FOREIGN KEY (ticket_id) REFERENCES ticket(id)
);

CREATE TABLE ticket (
    id text,
    user_id text,
    assigned_to text,
    attachment jsonb,
    attachments_count text,
    category_description text,
    category_id text,
    category_name text,
    category_prepopulate_cc text,
    category_public text,
    category_time_spent_mandatory text,
    created_at text,
    display_id text,
    due_date text,
    first_message text,
    jira_issue_id text,
    last_modified text,
    last_staff_reply_at text,
    last_updated_at text,
    last_user_reply_at text,
    merged_tickets jsonb,
    merged_to text,
    messages_count text,
    sla_breaches text,
    "source" text,
    subject text,
    subscribers jsonb,
    tags text,
    time_spent text,
    unresponded text,
    user_contact_groups jsonb,
    user_created_at text,
    user_email text,
    user_name text,
    user_pending_tickets_count text,
    user_primary_phoneid text,
    user_primary_phonenumber text,
    user_primary_phonetype text,
    user_tickets_count text,
    user_updated_at text,
    visible_only_staff text,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE staff_catagory (
    category text,
    staff_id text,
    PRIMARY KEY (category, staff_id),
    FOREIGN KEY (staff_id) REFERENCES staff(id)
);

CREATE TABLE staff_permission (
    permission text,
    staff_id text,
    PRIMARY KEY (permission, staff_id),
    FOREIGN KEY (staff_id) REFERENCES staff(id)
);

CREATE TABLE staff (
    id text,
    active text,
    email text,
    is_account_admin text,
    "name" text,
    role_id text,
    role_name text,
    PRIMARY KEY (id)
);

CREATE TABLE customer_activity (
    contact_id text,
    report_id text,
    completed_ticket text,
    email text,
    "name" text,
    no_of_reply text,
    no_of_ticket text,
    pending_ticket text,
    time_spent text,
    PRIMARY KEY (contact_id, report_id),
    FOREIGN KEY (report_id) REFERENCES report(id)
);

CREATE TABLE user_custom_field (
    id text,
    users_id text,
    PRIMARY KEY (id, users_id),
    FOREIGN KEY (id) REFERENCES user_custom(id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    contact_groups text,
    created_at text,
    email text,
    "name" text,
    pending_tickets_count text,
    primary_phone_id text,
    primary_phone_number text,
    primary_phone_type text,
    tickets_count text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE sections_article_tags (
    "index" text,
    section_id text,
    tags text,
    PRIMARY KEY ("index", section_id),
    FOREIGN KEY (section_id) REFERENCES "section"(id)
);

CREATE TABLE section_article (
    id text,
    section_id text,
    attachments jsonb,
    contents text,
    full_url text,
    language_enabled text,
    language_id text,
    language_name text,
    language_visible text,
    last_updated_at text,
    related_articles jsonb,
    section_name text,
    slug text,
    title text,
    views text,
    PRIMARY KEY (id, section_id),
    FOREIGN KEY (section_id) REFERENCES "section"(id)
);

CREATE TABLE section_categories (
    id text,
    section_id text,
    description text,
    "name" text,
    prepopulate_cc text,
    public text,
    time_spent_mandatory text,
    PRIMARY KEY (id, section_id),
    FOREIGN KEY (section_id) REFERENCES "section"(id)
);

CREATE TABLE "section" (
    id text,
    description text,
    "name" text,
    parent_section_id text,
    parent_section_name text,
    PRIMARY KEY (id)
);
