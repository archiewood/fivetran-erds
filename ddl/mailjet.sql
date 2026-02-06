CREATE TABLE contact (
    id text,
    created_at timestamp,
    delivered_count text,
    email text,
    exclusion_from_campaigns_updated_at text,
    is_excluded_from_campaigns text,
    is_opt_in_pending text,
    is_spam_complaining text,
    last_activity_at text,
    last_update_at text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE campaign_overview (
    id text,
    clicked_count text,
    delivered_count text,
    edit_mode text,
    edit_type text,
    id_type text,
    opened_count text,
    processed_count text,
    send_time_start text,
    starred text,
    "status" text,
    subject text,
    title text,
    PRIMARY KEY (id)
);

CREATE TABLE campaign_draft (
    id text,
    contact_list_id text,
    a_x_fraction text,
    a_x_fraction_name text,
    created_at text,
    "current" text,
    delivered_at text,
    edit_mode text,
    is_starred text,
    is_text_part_included text,
    locale text,
    modified_at text,
    preset text,
    reply_email text,
    sender text,
    sender_email text,
    sender_name text,
    "status" text,
    subject text,
    title text,
    url text,
    used text,
    PRIMARY KEY (id),
    FOREIGN KEY (contact_list_id) REFERENCES contact_list(id)
);

CREATE TABLE bounce_event (
    id text,
    campaign_id text,
    contact_id text,
    bounced_at text,
    is_blocked text,
    is_state_permanent text,
    state_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE campaign_click_statistics (
    _fivetran_id text,
    campaign_id text,
    clicked_events_count text,
    clicked_messages_count text,
    position_index text,
    url text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id)
);

CREATE TABLE campaign_open_information (
    _fivetran_id text,
    campaign_id text,
    contact_id text,
    message_id text,
    arrived_at text,
    id text,
    opened_at text,
    user_agent_full text,
    user_agent_id text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (message_id) REFERENCES message(id)
);

CREATE TABLE contact_list (
    id text,
    address text,
    created_at timestamp,
    is_deleted text,
    "name" text,
    subscriber_count text,
    PRIMARY KEY (id)
);

CREATE TABLE contact_filter (
    id text,
    description text,
    expression text,
    "name" text,
    "status" text,
    PRIMARY KEY (id)
);

CREATE TABLE template_category (
    "index" text,
    template_id text,
    category text,
    PRIMARY KEY ("index", template_id),
    FOREIGN KEY (template_id) REFERENCES template(id)
);

CREATE TABLE template_preview (
    "index" text,
    template_id text,
    preview text,
    PRIMARY KEY ("index", template_id),
    FOREIGN KEY (template_id) REFERENCES template(id)
);

CREATE TABLE template_purpose (
    "index" text,
    template_id text,
    purpose text,
    PRIMARY KEY ("index", template_id),
    FOREIGN KEY (template_id) REFERENCES template(id)
);

CREATE TABLE template_locale_list (
    "index" text,
    template_id text,
    localelist text,
    PRIMARY KEY ("index", template_id),
    FOREIGN KEY (template_id) REFERENCES template(id)
);

CREATE TABLE template (
    id text,
    author text,
    copyright text,
    created_at timestamp,
    description text,
    edit_mode text,
    is_starred text,
    is_text_part_generation_enabled text,
    last_updated_at text,
    locale text,
    "name" text,
    owner_id text,
    owner_type text,
    presets text,
    PRIMARY KEY (id)
);

CREATE TABLE campaign (
    id text,
    contact_list_id text,
    first_message_id text,
    campaign_type text,
    click_tracked text,
    created_at text,
    custom_value text,
    from_email text,
    from_id text,
    from_name text,
    has_html_count text,
    has_txt_count text,
    is_deleted text,
    is_starred text,
    news_letter_id text,
    open_tracked text,
    send_end_at text,
    send_start_at text,
    spamass_score text,
    "status" text,
    subject text,
    unsubscribe_tracked_count text,
    workflow_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (contact_list_id) REFERENCES contact_list(id),
    FOREIGN KEY (first_message_id) REFERENCES message(id)
);

CREATE TABLE message (
    id text,
    contact_id text,
    arrived_at text,
    attachment_count text,
    attempt_count text,
    contact_alt text,
    delay text,
    destination_id text,
    filter_time text,
    is_click_tracked text,
    is_html_part_included text,
    is_open_tracked text,
    is_text_part_included text,
    is_unsub_tracked text,
    message_size text,
    sender_id text,
    spam_assassin_score text,
    spamass_rule text,
    state_permanent text,
    "status" text,
    subject text,
    uuid text,
    PRIMARY KEY (id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE contact_list_signup (
    id text,
    contact_id text,
    contact_list_id text,
    confirm_at text,
    confirm_ip text,
    consent_id text,
    email text,
    property text,
    signup_at text,
    signup_ip text,
    signup_key text,
    "source" text,
    source_id text,
    validation_response text,
    PRIMARY KEY (id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (contact_list_id) REFERENCES contact_list(id)
);

CREATE TABLE click_stat (
    id text,
    contact_id text,
    message_id text,
    clicked_at text,
    clicked_delay text,
    url text,
    user_agent_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (message_id) REFERENCES message(id)
);

CREATE TABLE geo_statistics (
    _fivetran_id text,
    clicked_count text,
    country text,
    opened_count text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE message_information (
    id text,
    campaign_id text,
    contact_id text,
    click_tracked_count text,
    created_at text,
    message_size text,
    open_tracked_count text,
    queued_count text,
    send_end_at text,
    sent_count text,
    spam_assassin_rule_alt text,
    spam_assassin_rule_id text,
    spam_assassin_score text,
    PRIMARY KEY (id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE toplink_clicked (
    _fivetran_id text,
    clicked_count text,
    link_id text,
    url text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE message_history (
    _fivetran_id text,
    message_id text,
    "comment" text,
    event_at text,
    event_type text,
    "state" text,
    user_agent text,
    user_agent_id text,
    PRIMARY KEY (_fivetran_id, message_id),
    FOREIGN KEY (message_id) REFERENCES message(id)
);
