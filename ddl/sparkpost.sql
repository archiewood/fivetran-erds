CREATE TABLE rejection_reason_metrics (
    _fivetran_id text,
    count_rejected text,
    domain text,
    end_date text,
    metric_type text,
    reason text,
    rejection_category_id text,
    rejection_category_name text,
    start_date text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE deliverability_metrics (
    _fivetran_id text,
    campaign_id text,
    subaccount_id text,
    template_id text,
    count_accepted text,
    count_admin_bounce text,
    count_block_bounce text,
    count_bounce text,
    count_clicked text,
    count_delayed text,
    count_delayed_first text,
    count_delivered text,
    count_delivered_first text,
    count_delivered_subsequent text,
    count_generation_failed text,
    count_generation_rejection text,
    count_hard_bounce text,
    count_inband_bounce text,
    count_inbox_panel text,
    count_inbox_seed text,
    count_inbox_seed_private text,
    count_inbox_seed_virtual text,
    count_initial_rendered text,
    count_injected text,
    count_moved_to_inbox text,
    count_moved_to_spam text,
    count_nonprefetched_rendered text,
    count_nonprefetched_unique_confirmed_opened text,
    count_nonprefetched_unique_rendered text,
    count_outofband_bounce text,
    count_policy_rejection text,
    count_rejected text,
    count_rendered text,
    count_sent text,
    count_soft_bounce text,
    count_spam_complaint text,
    count_spam_panel text,
    count_spam_seed text,
    count_spam_seed_private text,
    count_spam_seed_virtual text,
    count_targeted text,
    count_undetermined_bounce text,
    count_unique_clicked text,
    count_unique_confirmed_opened text,
    count_unique_initial_rendered text,
    count_unique_rendered text,
    domain text,
    end_date text,
    ip_pool text,
    metric_type text,
    sending_domain text,
    sending_ip text,
    start_date text,
    total_delivery_time_first text,
    total_delivery_time_subsequent text,
    total_msg_volume text,
    ts text,
    watched_domain text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (campaign_id) REFERENCES event(campaign_id),
    FOREIGN KEY (subaccount_id) REFERENCES subaccount(id),
    FOREIGN KEY (template_id) REFERENCES template(id)
);

CREATE TABLE engagement_detail (
    _fivetran_id text,
    count_clicked text,
    count_raw_clicked text,
    end_date text,
    link_name text,
    start_date text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE event_rcpt_tag (
    rcpt_tag text,
    event_id text,
    PRIMARY KEY (rcpt_tag, event_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE event_sms_remote (
    "index" text,
    event_id text,
    sms_remote_id text,
    PRIMARY KEY ("index", event_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE event (
    id text,
    customer_id text,
    template_id text,
    ab_test_id text,
    ab_test_version text,
    amp_enabled text,
    bounce_class text,
    campaign_id text,
    click_tracking text,
    delv_method text,
    device_token text,
    end_date text,
    error_code text,
    fbtype text,
    friendly_from text,
    geo_ip_city text,
    geo_ip_continent text,
    geo_ip_country text,
    geo_ip_latitude text,
    geo_ip_longitude text,
    geo_ip_postal_code text,
    geo_ip_region text,
    geo_ip_zip text,
    initial_pixel text,
    injection_time text,
    ip_address text,
    ip_pool text,
    mailbox_provider text,
    mailbox_provider_region text,
    mailfrom text,
    message_id text,
    msg_from text,
    msg_size text,
    num_retry text,
    open_tracking text,
    outbound_tls text,
    queue_time text,
    raw_rcpt_to text,
    raw_reason text,
    rcpt_hash text,
    rcpt_subs_country text,
    rcpt_subs_gender text,
    rcpt_to text,
    rcpt_type text,
    reason text,
    recipient_domain text,
    recv_method text,
    remote_addr text,
    report_by text,
    report_to text,
    routing_domain text,
    scheduled_time text,
    sending_domain text,
    sending_ip text,
    sms_coding text,
    sms_dst text,
    sms_dst_npi text,
    sms_dst_ton text,
    sms_segments text,
    sms_src text,
    sms_src_npi text,
    sms_src_ton text,
    sms_text text,
    start_date text,
    subaccount_id text,
    subject text,
    target_link_name text,
    target_link_url text,
    template_version text,
    timestamps text,
    transactional text,
    transmission_id text,
    "type" text,
    user_agent text,
    user_agent_parsed_agent_family text,
    user_agent_parsed_device_brand text,
    user_agent_parsed_device_family text,
    user_agent_parsed_is_mobile text,
    user_agent_parsed_is_prefetched text,
    user_agent_parsed_is_proxy text,
    user_agent_parsed_os_family text,
    user_agent_parsed_os_version text,
    -- rcpt_meta_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES account(customer_id),
    FOREIGN KEY (template_id) REFERENCES template(id)
);

CREATE TABLE tracking_domain (
    _fivetran_id text,
    defaults text,
    domain text,
    port text,
    secure text,
    status_cname_status text,
    status_compliance_status text,
    status_verified text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE sending_ip (
    _fivetran_id text,
    auto_warmup_enabled text,
    auto_warmup_stage text,
    customer_provided text,
    external_ip text,
    hostname text,
    ip_pool text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE account (
    customer_id text,
    anniversary_date text,
    company_name text,
    country_code text,
    created text,
    options_blocklist_monitor text,
    options_inbox_placement text,
    options_smtp_tracking_default text,
    service_level text,
    "status" text,
    status_reason_category text,
    status_updated text,
    subscription_code text,
    subscription_name text,
    subscription_overage text,
    subscription_period text,
    subscription_plan_volume text,
    subscription_plan_volume_per_period text,
    subscription_recurring_charge text,
    subscription_self_serve text,
    subscription_type text,
    tfa_required text,
    ui_allow_deliverability_metrics text,
    ui_hide_terminated_subaccount text,
    ui_onboarding_view_developer_docs_completed text,
    updated text,
    usage_day_end text,
    usage_day_limit text,
    usage_day_start text,
    usage_day_used text,
    usage_month_end text,
    usage_month_limit text,
    usage_month_start text,
    usage_month_used text,
    usage_sandbox_limit text,
    usage_sandbox_used text,
    usage_timestamp text,
    PRIMARY KEY (customer_id)
);

CREATE TABLE snippet (
    id text,
    created_at text,
    "name" text,
    shared_with_subaccount text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE bounce_metrics (
    _fivetran_id text,
    bounce_category_id text,
    bounce_category_name text,
    bounce_class_description text,
    bounce_class_name text,
    classification_id text,
    count_bounce text,
    count_inband_bounce text,
    count_outofband_bounce text,
    domain text,
    end_date text,
    metric_type text,
    reason text,
    start_date text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE subaccount (
    id text,
    customer_id text,
    compliance_status text,
    deliverability text,
    ip_pool text,
    "name" text,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES account(customer_id)
);

CREATE TABLE template (
    id text,
    subaccount_id text,
    description text,
    has_draft text,
    has_published text,
    last_update_time text,
    last_use text,
    "name" text,
    published text,
    shared_with_subaccount text,
    PRIMARY KEY (id),
    FOREIGN KEY (subaccount_id) REFERENCES subaccount(id)
);

CREATE TABLE deliveries_by_attempt (
    _fivetran_id text,
    attempt text,
    count_delivered text,
    count_raw_clicked text,
    end_date text,
    start_date text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE delay_reason_metrics (
    _fivetran_id text,
    count_delayed text,
    count_delayed_first text,
    domain text,
    end_date text,
    metric_type text,
    reason text,
    start_date text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE sending_domain (
    _fivetran_id text,
    creation_time text,
    domain text,
    is_default_bounce_domain text,
    shared_with_subaccount text,
    status_abuse_at_status text,
    status_cname_status text,
    status_compliance_status text,
    status_dkim_status text,
    status_mx_status text,
    status_ownership_verified text,
    status_postmaster_at_status text,
    status_spf_status text,
    status_verification_mailbox text,
    status_verification_mailbox_status text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE recipient_list (
    id text,
    description text,
    internal_id text,
    list_group_id text,
    "name" text,
    total_accepted_recipient text,
    PRIMARY KEY (id)
);

CREATE TABLE a_b_testing_variant (
    a_b_testing_id text,
    template_id text,
    count_accepted text,
    count_unique_confirmed_opened text,
    engagement_rate text,
    percents text,
    PRIMARY KEY (a_b_testing_id, template_id),
    FOREIGN KEY (a_b_testing_id) REFERENCES a_b_testing(id),
    FOREIGN KEY (template_id) REFERENCES template(id)
);

CREATE TABLE a_b_testing (
    id text,
    audience_selection text,
    confidence_level text,
    created_at text,
    default_template_count_accepted text,
    default_template_count_unique_confirmed_opened text,
    default_template_engagement_rate text,
    default_template_id text,
    default_template_percent text,
    engagement_timeout text,
    metric text,
    "name" text,
    start_time text,
    "status" text,
    test_mode text,
    updated_at text,
    version text,
    PRIMARY KEY (id)
);

CREATE TABLE ip_pool_ip (
    "index" text,
    ip_pool_id text,
    auto_warmup_enabled text,
    external_ip text,
    hostname text,
    PRIMARY KEY ("index", ip_pool_id),
    FOREIGN KEY (ip_pool_id) REFERENCES ip_pool(id)
);

CREATE TABLE ip_pool (
    id text,
    customer_provided text,
    "name" text,
    PRIMARY KEY (id)
);
