CREATE TABLE campaign_repeat_error (
    error_id integer,
    campaign_repeat_id text,
    error text,
    PRIMARY KEY (error_id, campaign_repeat_id),
    FOREIGN KEY (campaign_repeat_id) REFERENCES campaign_repeat(repeat_id)
);

CREATE TABLE es_client (
    client_id bigint,
    account_id bigint,
    "name" text,
    PRIMARY KEY (client_id)
);

CREATE TABLE campaign_repeat_day_of_month (
    campaign_repeat_id text,
    "day" integer,
    PRIMARY KEY (campaign_repeat_id, "day")
);

CREATE TABLE es_triggered_sends (
    message_id text,
    client_id bigint,
    email_md_5 text,
    email_sha_256 text,
    engagement text,
    event_id text,
    event_time timestamp,
    flow_id text,
    is_basic boolean,
    profile_id text,
    send_time timestamp,
    signup_time timestamp,
    template_id bigint,
    PRIMARY KEY (message_id)
);

CREATE TABLE es_campaign_clicks (
    message_id text,
    browser text,
    campaign_id bigint,
    client_id bigint,
    count bigint,
    email_md_5 text,
    email_sha_256 text,
    engagement text,
    event_id text,
    event_time timestamp,
    "index" bigint,
    ip text,
    ip_type text,
    is_real_click text,
    list_id text,
    profile_id text,
    send_time timestamp,
    signup_time timestamp,
    url text,
    url_count bigint,
    user_agent text,
    PRIMARY KEY (message_id)
);

CREATE TABLE campaign_repeat_day_of_week (
    campaign_repeat_id text,
    "day" text,
    PRIMARY KEY (campaign_repeat_id, "day")
);

CREATE TABLE template_team (
    team_id integer,
    template_id text,
    team_name text,
    PRIMARY KEY (team_id, template_id),
    FOREIGN KEY (template_id) REFERENCES template(template_id)
);

CREATE TABLE es_campaign (
    campaign_id bigint,
    client_id bigint,
    create_time timestamp,
    data_feed_url text,
    email_hour_range text,
    from_email text,
    from_name text,
    list_name text,
    "name" text,
    preheader text,
    replyto_email text,
    report_email text,
    schedule_time timestamp,
    start_time timestamp,
    subject text,
    suppress_list text,
    template_id bigint,
    PRIMARY KEY (campaign_id)
);

CREATE TABLE es_triggered_opens (
    message_id text,
    browser text,
    client_id bigint,
    count bigint,
    email_md_5 text,
    email_sha_256 text,
    engagement text,
    event_id text,
    event_time timestamp,
    flow_id text,
    ip text,
    ip_type text,
    is_basic boolean,
    is_real_open text,
    profile_id text,
    send_time timestamp,
    signup_time timestamp,
    template_id bigint,
    user_agent text,
    PRIMARY KEY (message_id)
);

CREATE TABLE purchase_item (
    "index" integer,
    _fivetran_purchase_id text,
    item text,
    quantity integer,
    unit_price text,
    url text,
    PRIMARY KEY ("index", _fivetran_purchase_id),
    FOREIGN KEY (_fivetran_purchase_id) REFERENCES purchase(_fivetran_purchase_id)
);

CREATE TABLE es_template (
    template_id bigint,
    client_id bigint,
    create_time timestamp,
    create_user text,
    data_feed_url text,
    from_email text,
    from_name text,
    is_basic boolean,
    modify_time timestamp,
    modify_user text,
    "name" text,
    preheader text,
    replyto_email text,
    subject text,
    PRIMARY KEY (template_id)
);

CREATE TABLE es_triggered_clicks (
    message_id text,
    browser text,
    client_id bigint,
    count bigint,
    email_md_5 text,
    email_sha_256 text,
    engagement text,
    event_id text,
    event_time timestamp,
    flow_id text,
    "index" bigint,
    ip text,
    ip_type text,
    is_basic boolean,
    is_real_click text,
    profile_id text,
    send_time timestamp,
    signup_time timestamp,
    template_id bigint,
    url text,
    url_count bigint,
    user_agent text,
    PRIMARY KEY (message_id)
);

CREATE TABLE ad_plan_schedule (
    "day" text,
    plan_id text,
    PRIMARY KEY ("day", plan_id)
);

CREATE TABLE campaign_seed_email (
    seed_email_id integer,
    campaign_id text,
    email text,
    PRIMARY KEY (seed_email_id, campaign_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(blast_id)
);

CREATE TABLE es_campaign_sends (
    message_id text,
    campaign_id bigint,
    client_id bigint,
    email_md_5 text,
    email_sha_256 text,
    engagement text,
    event_id text,
    event_time timestamp,
    list_id text,
    list_name text,
    profile_id text,
    send_time timestamp,
    signup_time timestamp,
    subject text,
    template_id bigint,
    PRIMARY KEY (message_id)
);

CREATE TABLE es_triggered_bounces (
    message_id text,
    client_id bigint,
    email_md_5 text,
    email_sha_256 text,
    engagement text,
    event_id text,
    event_time timestamp,
    is_basic boolean,
    message_type text,
    profile_id text,
    reason_log text,
    send_time timestamp,
    signup_time timestamp,
    template_id bigint,
    PRIMARY KEY (message_id)
);

CREATE TABLE campaign_query (
    _fivetran_campaign_query_id text,
    campaign_id text,
    user_id text,
    click_time timestamp,
    device text,
    open_time timestamp,
    purchase_time timestamp,
    send_time timestamp,
    PRIMARY KEY (_fivetran_campaign_query_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(blast_id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE es_triggered_unsubscribes (
    message_id text,
    client_id bigint,
    email_md_5 text,
    email_sha_256 text,
    engagement text,
    event_id text,
    event_time timestamp,
    is_basic boolean,
    message_type text,
    profile_id text,
    send_time timestamp,
    signup_time timestamp,
    template_id bigint,
    PRIMARY KEY (message_id)
);

CREATE TABLE campaign_click (
    click_id integer,
    _fivetran_campaign_query_id text,
    click_time timestamp,
    click_url text,
    PRIMARY KEY (click_id, _fivetran_campaign_query_id),
    FOREIGN KEY (_fivetran_campaign_query_id) REFERENCES campaign_query(_fivetran_campaign_query_id)
);

CREATE TABLE campaign (
    blast_id text,
    list_id text,
    template_id text,
    app_badge text,
    app_data text,
    app_id text,
    app_sound text,
    content_app text,
    content_html text,
    context_text text,
    copy_template text,
    data_feed_url text,
    email_count text,
    email_hour_range text,
    end_time timestamp,
    from_email text,
    from_name text,
    is_google_analytics text,
    is_link_tracking boolean,
    is_public boolean,
    list text,
    mode text,
    modify_time timestamp,
    modify_user text,
    "name" text,
    replyto text,
    report_email text,
    schedule_time timestamp,
    start_time timestamp,
    "status" text,
    subject text,
    PRIMARY KEY (blast_id),
    FOREIGN KEY (list_id) REFERENCES list(list_id),
    FOREIGN KEY (template_id) REFERENCES template(template_id)
);

CREATE TABLE es_lifecycle_optimizer_flow (
    flow_id text,
    client_id bigint,
    create_time timestamp,
    modify_time timestamp,
    "name" text,
    version text,
    PRIMARY KEY (flow_id),
    FOREIGN KEY (client_id) REFERENCES es_client(client_id)
);

CREATE TABLE es_campaign_bounces (
    message_id text,
    campaign_id bigint,
    client_id bigint,
    email_md_5 text,
    email_sha_256 text,
    engagement text,
    event_id text,
    event_time timestamp,
    list_id text,
    message_type text,
    profile_id text,
    reason_log text,
    send_time timestamp,
    signup_time timestamp,
    PRIMARY KEY (message_id)
);

CREATE TABLE user_list (
    list_id text,
    user_id text,
    list_signup timestamp,
    PRIMARY KEY (list_id, user_id),
    FOREIGN KEY (list_id) REFERENCES list(list_id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE es_campaign_opens (
    message_id text,
    browser text,
    campaign_id bigint,
    client_id bigint,
    count bigint,
    email_md_5 text,
    email_sha_256 text,
    engagement text,
    event_id text,
    event_time timestamp,
    ip text,
    ip_type text,
    is_real_open text,
    list_id text,
    profile_id text,
    send_time timestamp,
    signup_time timestamp,
    user_agent text,
    PRIMARY KEY (message_id)
);

-- USER Packing and Unpacking Mode     
-- Pack modes determine the form in which Fivetran delivers your data to your destination. We provide you the option to choose the pack mode for the custom fields of the USER tables. For more information, you can refer to the documentation here.
CREATE TABLE "user" (
    id text,
    email_hash text,
    email_status text,
    last_pageview timestamp,
    optout_time timestamp,
    pageviews integer,
    profile_created_date timestamp,
    purchase_incomplete integer,
    top_device text,
    PRIMARY KEY (id)
);

-- Packing and Unpacking Mode     
-- Pack modes determine the form in which Fivetran delivers your data to your destination. We provide you the option to choose the pack mode for the custom fields of the LIST STAT tables. For more information, you can refer to the documentation here.
CREATE TABLE list_stat (
    count_time timestamp,
    list text,
    active_count integer,
    disengaged_count integer,
    dormant_count integer,
    email_count integer,
    emailable_count integer,
    engaged_count integer,
    hardbounce_count integer,
    lists_count integer,
    lists_remove_count integer,
    lists_signup_count integer,
    new_count integer,
    optout_count integer,
    optout_loss_count integer,
    passive_count integer,
    spam_count integer,
    spam_loss_count integer,
    valid_count integer,
    PRIMARY KEY (count_time, list),
    FOREIGN KEY (list) REFERENCES list(list_id)
);

CREATE TABLE template_label (
    label_id integer,
    template_id text,
    label_name text,
    PRIMARY KEY (label_id, template_id),
    FOREIGN KEY (template_id) REFERENCES template(template_id)
);

CREATE TABLE campaign_repeat (
    repeat_id text,
    create_time timestamp,
    create_user text,
    data_feed_url text,
    end_date timestamp,
    error_time timestamp,
    generate_time text,
    list text,
    modify_time timestamp,
    modify_user text,
    "name" text,
    report_email text,
    send_time text,
    start_date timestamp,
    "status" text,
    template text,
    PRIMARY KEY (repeat_id)
);

CREATE TABLE purchase (
    _fivetran_purchase_id text,
    campaign_id text,
    user_id text,
    channel text,
    "date" text,
    extid text,
    PRIMARY KEY (_fivetran_purchase_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(blast_id),
    FOREIGN KEY (user_id) REFERENCES "user"(id)
);

CREATE TABLE ad_plan_zone (
    plan_id text,
    "zone" integer,
    height text,
    "name" text,
    width text,
    PRIMARY KEY (plan_id, "zone")
);

CREATE TABLE template_tag (
    tag_id integer,
    template_id text,
    tag_name text,
    PRIMARY KEY (tag_id, template_id),
    FOREIGN KEY (template_id) REFERENCES template(template_id)
);

CREATE TABLE campaign_supress_list (
    campaign_id text,
    list_id text,
    PRIMARY KEY (campaign_id, list_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(blast_id),
    FOREIGN KEY (list_id) REFERENCES list(list_id)
);

CREATE TABLE ad_plan (
    plan_id text,
    list text,
    "name" text,
    PRIMARY KEY (plan_id)
);

CREATE TABLE campaign_label (
    label_id integer,
    campaign_id text,
    label_name text,
    PRIMARY KEY (label_id, campaign_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(blast_id)
);

CREATE TABLE list (
    list_id text,
    create_time timestamp,
    description text,
    list text,
    "primary" boolean,
    public_name text,
    send_time timestamp,
    "type" text,
    vars jsonb,
    PRIMARY KEY (list_id)
);

CREATE TABLE campaign_repeat_supress_list (
    campaign_repeat_id text,
    list_id text,
    PRIMARY KEY (campaign_repeat_id, list_id),
    FOREIGN KEY (campaign_repeat_id) REFERENCES campaign_repeat(repeat_id),
    FOREIGN KEY (list_id) REFERENCES list(list_id)
);

CREATE TABLE template (
    template_id text,
    data_feed_url text,
    is_disabled boolean,
    mode text,
    modify_time timestamp,
    "name" text,
    sample text,
    subject text,
    PRIMARY KEY (template_id)
);

CREATE TABLE es_campaign_unsubscribes (
    message_id text,
    campaign_id bigint,
    client_id bigint,
    email_md_5 text,
    email_sha_256 text,
    engagement text,
    event_id text,
    event_time timestamp,
    list_id text,
    message_type text,
    profile_id text,
    send_time timestamp,
    signup_time timestamp,
    PRIMARY KEY (message_id)
);
