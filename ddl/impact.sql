CREATE TABLE routing_rule_condition_value (
    "value" text,
    routing_rule_condition_routing_rule_id text,
    routing_rule_condition_variable text,
    PRIMARY KEY ("value", routing_rule_condition_routing_rule_id, routing_rule_condition_variable),
    FOREIGN KEY (routing_rule_condition_routing_rule_id) REFERENCES routing_rule_condition(routing_rule_id),
    FOREIGN KEY (routing_rule_condition_variable) REFERENCES routing_rule_condition(variable)
);

CREATE TABLE routing_rule_condition (
    variable text,
    routing_rule_id text,
    operator text,
    PRIMARY KEY (variable, routing_rule_id),
    FOREIGN KEY (routing_rule_id) REFERENCES routing_rule(id)
);

CREATE TABLE routing_rule (
    id text,
    campaign_id text,
    "action" text,
    created_by text,
    date_created text,
    date_last_updated text,
    last_updated_by text,
    "name" text,
    rank text,
    redirect_url text,
    "source" text,
    "state" text,
    PRIMARY KEY (id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id)
);

CREATE TABLE promo_code (
    id text,
    assigned_partner_id text,
    campaign_id text,
    deal_id text,
    assigned_partner_name text,
    bogo_buy_image_url text,
    bogo_buy_name text,
    bogo_buy_quantity text,
    bogo_buy_scope text,
    bogo_get_discount_amount text,
    bogo_get_discount_currency text,
    bogo_get_discount_percent text,
    bogo_get_discount_type text,
    bogo_get_image_url text,
    bogo_get_name text,
    bogo_get_quantity text,
    bogo_get_scope text,
    campaign_name text,
    code text,
    created_date text,
    credit_policy text,
    deal_categories text,
    deal_default_promo_code text,
    deal_description text,
    deal_end_date text,
    deal_name text,
    deal_products jsonb,
    deal_restricted_media_partner_groups jsonb,
    deal_restricted_media_partners jsonb,
    deal_scope text,
    deal_start_date text,
    deal_state text,
    deal_type text,
    discount_amount text,
    discount_currency text,
    discount_maximum_percent text,
    discount_percent text,
    discount_percent_range_end text,
    discount_percent_range_start text,
    discount_type text,
    end_date text,
    gift text,
    maximum_savings_amount text,
    maximum_savings_currency text,
    minimum_purchase_amount text,
    minimum_purchase_amount_currency text,
    purchase_limit_quantity text,
    rebate_amount text,
    rebate_currency text,
    start_date text,
    "state" text,
    synch_ads_promo_codes text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (assigned_partner_id) REFERENCES partner(id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (deal_id) REFERENCES deal(id)
);

CREATE TABLE action_locking_item (
    _fivetran_id text,
    action_locking_id text,
    adjustment_date timestamp,
    adjustment_reason text,
    category text,
    item_name text,
    payout text,
    payout_currency text,
    quantity text,
    rebate text,
    rebate_currency text,
    sale_amount text,
    sale_amount_currency text,
    sku text,
    uri text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (action_locking_id) REFERENCES action_locking(id)
);

CREATE TABLE action_event_item (
    _fivetran_id text,
    action_event_id text,
    adjustment_date timestamp,
    adjustment_reason text,
    category text,
    item_name text,
    payout text,
    payout_currency text,
    quantity text,
    rebate text,
    rebate_currency text,
    sale_amount text,
    sale_amount_currency text,
    sku text,
    uri text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (action_event_id) REFERENCES action_event(id)
);

CREATE TABLE contact_account (
    id text,
    contact_id text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE contact_label (
    label text,
    contact_id text,
    PRIMARY KEY (label, contact_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE contact (
    id text,
    campaign_id text,
    cellphone_number text,
    cellphone_number_country text,
    editable boolean,
    email_address text,
    first_name text,
    last_name text,
    profile_image text,
    title text,
    work_phone_number text,
    work_phone_number_country text,
    PRIMARY KEY (id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id)
);

CREATE TABLE contract_event_valid_referral (
    _fivetran_id text,
    contract_event_payout_event_type_id text,
    "type" text,
    window text,
    window_unit text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (contract_event_payout_event_type_id) REFERENCES contract_event_payout(event_type_id)
);

CREATE TABLE contract_payout_group_rule_value (
    "value" text,
    contract_payout_group_rule_contract_event_payout_group_id text,
    contract_payout_group_rule_variable text,
    PRIMARY KEY ("value", contract_payout_group_rule_contract_event_payout_group_id, contract_payout_group_rule_variable),
    FOREIGN KEY (contract_payout_group_rule_contract_event_payout_group_id) REFERENCES contract_payout_group_rule(contract_event_payout_group_id),
    FOREIGN KEY (contract_payout_group_rule_variable) REFERENCES contract_payout_group_rule(variable)
);

CREATE TABLE contract_payout_group_rule (
    variable text,
    contract_event_payout_group_id text,
    operator text,
    PRIMARY KEY (variable, contract_event_payout_group_id),
    FOREIGN KEY (contract_event_payout_group_id) REFERENCES contract_event_payout_group(id)
);

CREATE TABLE contract_payout_group_limit (
    _fivetran_id text,
    contract_event_payout_group_id text,
    limit_by text,
    period text,
    "type" text,
    "value" text,
    weekend_override_value text,
    PRIMARY KEY (_fivetran_id, contract_event_payout_group_id),
    FOREIGN KEY (contract_event_payout_group_id) REFERENCES contract_event_payout_group(id)
);

CREATE TABLE contract_event_payout_group (
    id text,
    contract_event_payout_event_type_id text,
    payout_rate text,
    rank text,
    PRIMARY KEY (id),
    FOREIGN KEY (contract_event_payout_event_type_id) REFERENCES contract_event_payout(event_type_id)
);

CREATE TABLE contract_payout_adjustment_rule_value (
    "value" text,
    contract_event_payout_adjustment_id text,
    contract_payout_adjustment_rule_variable text,
    PRIMARY KEY ("value", contract_event_payout_adjustment_id, contract_payout_adjustment_rule_variable),
    FOREIGN KEY (contract_event_payout_adjustment_id) REFERENCES contract_payout_adjustment_rule(contract_event_payout_adjustment_id),
    FOREIGN KEY (contract_payout_adjustment_rule_variable) REFERENCES contract_payout_adjustment_rule(variable)
);

CREATE TABLE contract_payout_adjustment_rule (
    variable text,
    contract_event_payout_adjustment_id text,
    operator text,
    PRIMARY KEY (variable, contract_event_payout_adjustment_id),
    FOREIGN KEY (contract_event_payout_adjustment_id) REFERENCES contract_event_payout_adjustment(id)
);

CREATE TABLE contract_event_payout_adjustment (
    id text,
    contract_event_payout_event_type_id text,
    direction text,
    rate text,
    PRIMARY KEY (id),
    FOREIGN KEY (contract_event_payout_event_type_id) REFERENCES contract_event_payout(event_type_id)
);

CREATE TABLE contract_event_payout_tier (
    _fivetran_id text,
    contract_event_payout_event_type_id text,
    payout_rate text,
    revenue_threshold text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (contract_event_payout_event_type_id) REFERENCES contract_event_payout(event_type_id)
);

CREATE TABLE contract_event_payout_restriction_rule_value (
    "value" text,
    contract_event_payout_restriction_id text,
    contract_event_payout_restriction_rule_variable text,
    PRIMARY KEY ("value", contract_event_payout_restriction_id, contract_event_payout_restriction_rule_variable),
    FOREIGN KEY (contract_event_payout_restriction_id) REFERENCES contract_event_payout_restriction_rule(contract_event_payout_restriction_id),
    FOREIGN KEY (contract_event_payout_restriction_rule_variable) REFERENCES contract_event_payout_restriction_rule(variable)
);

CREATE TABLE contract_event_payout_restriction_rule (
    variable text,
    contract_event_payout_restriction_id text,
    operator text,
    PRIMARY KEY (variable, contract_event_payout_restriction_id),
    FOREIGN KEY (contract_event_payout_restriction_id) REFERENCES contract_event_payout_restriction(id)
);

CREATE TABLE contract_event_payout_restriction (
    id text,
    contract_event_payout_event_type_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (contract_event_payout_event_type_id) REFERENCES contract_event_payout(event_type_id)
);

CREATE TABLE contract_event_payout_limit (
    _fivetran_id text,
    contract_event_payout_event_type_id text,
    limit_by text,
    period text,
    "type" text,
    "value" text,
    weekend_override_value text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (contract_event_payout_event_type_id) REFERENCES contract_event_payout(event_type_id)
);

CREATE TABLE contract_event_payout_special_term (
    terms_name text,
    contract_event_payout_event_type_id text,
    terms_content text,
    terms_type text,
    PRIMARY KEY (terms_name, contract_event_payout_event_type_id),
    FOREIGN KEY (contract_event_payout_event_type_id) REFERENCES contract_event_payout(event_type_id)
);

CREATE TABLE contract_event_payout (
    event_type_id text,
    contract_id text,
    credit_policy text,
    default_payout_rate text,
    event_category text,
    event_type_name text,
    locking_basis text,
    locking_day_offset text,
    locking_month_offset text,
    locking_period text,
    payout_level text,
    payout_schedulingbasis text,
    payout_schedulingperiod text,
    performance_bonus_basis text,
    performance_bonus_period text,
    performance_bonus_type text,
    PRIMARY KEY (event_type_id),
    FOREIGN KEY (contract_id) REFERENCES contract(id)
);

CREATE TABLE contract_label (
    label text,
    contract_id text,
    PRIMARY KEY (label, contract_id),
    FOREIGN KEY (contract_id) REFERENCES contract(id)
);

CREATE TABLE contract (
    id text,
    campaign_id text,
    partner_id text,
    brand_signatory text,
    brand_signatory_date text,
    date_created text,
    date_last_updated text,
    end_date text,
    partner_signatory text,
    partner_signatory_date text,
    partner_value_1 text,
    pdf_uri text,
    start_date text,
    "status" text,
    template_terms_action_limit text,
    template_terms_action_limit_period text,
    template_terms_change_notification_period text,
    template_terms_contract_start_slotting_fee text,
    template_terms_currency text,
    template_terms_custom_creative_payer text,
    template_terms_max_return_percentage text,
    template_terms_min_earning_per_click text,
    template_terms_name text,
    template_terms_return_policy text,
    template_terms_spend_limit text,
    template_terms_spend_limit_period text,
    template_terms_template_id text,
    template_terms_version_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (partner_id) REFERENCES partner(id)
);

CREATE TABLE ads (
    id text,
    campaign_id text,
    deal_id text,
    ad_code_template text,
    ad_type text,
    allow_deep_linking text,
    banner_alternative_tag text,
    bogo_buy_image_url text,
    bogo_buy_name text,
    bogo_buy_quantity text,
    bogo_buy_scope text,
    bogo_get_discount_amount text,
    bogo_get_discount_currency text,
    bogo_get_discount_percent text,
    bogo_get_discount_type text,
    bogo_get_image_url text,
    bogo_get_name text,
    bogo_get_quantity text,
    bogo_get_scope text,
    campaign_name text,
    coupon_allow_custom_promo_code text,
    coupon_link_name text,
    custom_ad_serving_url text,
    customisation_charge text,
    deal_categories text,
    deal_default_promo_code text,
    deal_description text,
    deal_end_date text,
    deal_name text,
    deal_products jsonb,
    deal_restricted_media_partner_groups jsonb,
    deal_restricted_media_partners jsonb,
    deal_scope text,
    deal_start_date text,
    deal_state text,
    deal_type text,
    description text,
    discount_amount text,
    discount_currency text,
    discount_maximum_percent text,
    discount_percent text,
    discount_percent_range_end text,
    discount_percent_range_start text,
    discount_type text,
    get_html_code_type text,
    gift text,
    iab_ad_unit text,
    labels text,
    landing_page text,
    languages text,
    limited_time_end_date text,
    limited_time_start_date text,
    link_text text,
    maximum_savings_amount text,
    maximum_savings_currency text,
    minimum_purchase_amount text,
    minimum_purchase_amount_currency text,
    mobile_fallbacks_anoride text,
    mobile_fallbacks_ios text,
    mobile_ready text,
    "name" text,
    phone_tracking text,
    promo_code_tracking text,
    purchase_limit_quantity text,
    rebate_amount text,
    rebate_currency text,
    restricted_media_partner_groups jsonb,
    restricted_media_partners jsonb,
    season text,
    synch_ads_promo_codes text,
    third_party_servable_ad_creative_height text,
    third_party_servable_ad_creative_width text,
    top_seller text,
    PRIMARY KEY (id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (deal_id) REFERENCES deal(id)
);

CREATE TABLE task (
    id text,
    actions text,
    assignee_account text,
    assignee_user_email_address text,
    assignee_user_username text,
    attachments jsonb,
    created_by_email_address text,
    created_by_username text,
    date_created text,
    date_last_updated text,
    details_description text,
    details_resolution_id text,
    details_resolution_name text,
    details_state text,
    details_subtype_id text,
    details_subtype_name text,
    details_summary text,
    details_type text,
    details_urgent text,
    due_date text,
    last_updated_by_email_address text,
    last_updated_by_username text,
    reference text,
    total_actions text,
    total_comments text,
    PRIMARY KEY (id)
);

CREATE TABLE task_comment (
    id text,
    task_id text,
    attachments jsonb,
    "comment" text,
    commenter text,
    PRIMARY KEY (id),
    FOREIGN KEY (task_id) REFERENCES task(id)
);

CREATE TABLE campaign_primary_category (
    primary_sub_category text,
    campaign_id text,
    PRIMARY KEY (primary_sub_category, campaign_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id)
);

CREATE TABLE campaign_company_contact (
    _fivetran_id text,
    campaign_id text,
    email_address text,
    first_name text,
    last_name text,
    phone_number text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id)
);

CREATE TABLE campaign_shipping_region (
    shipping_region text,
    campaign_id text,
    PRIMARY KEY (shipping_region, campaign_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id)
);

CREATE TABLE campaign (
    id text,
    categories_additional_category text,
    categories_additional_sub_categories jsonb,
    categories_primary_category text,
    direct_tracking_settings_session_window_length text,
    direct_tracking_settings_unidentified_name text,
    display_future_ads text,
    display_servicing_agency text,
    gateway_tracking_settings_campaign_tracking_template text,
    gateway_tracking_settings_deep_link_domains text,
    gateway_tracking_settings_deep_linking text,
    gateway_tracking_settings_default_landing_page text,
    gateway_tracking_settings_media_partner_tracking_template text,
    gateway_tracking_settings_ssl_support text,
    gateway_tracking_settings_third_party_gateway_query_string_parameters text,
    gateway_tracking_settings_third_party_gateway_url text,
    gateway_tracking_settings_unique_click_window_length text,
    gateway_tracking_settings_unique_click_window_type text,
    gift_card_payouts text,
    identity_matching text,
    impression_tracking text,
    list_in_marketplace text,
    long_description text,
    mobile_ready_ads text,
    "name" text,
    promo_code_tracking text,
    rating text,
    resources_additional_related_links jsonb,
    resources_company_homepage text,
    resources_example_landing_page text,
    resources_information_page text,
    search_keywords text,
    short_description text,
    site_definition text,
    "state" text,
    third_party_impression_pixel text,
    tracking_domain text,
    trademark_bidding text,
    view_through_crediting text,
    PRIMARY KEY (id)
);

CREATE TABLE exception_action_tracker (
    exception_list_id text,
    id text,
    "name" text,
    PRIMARY KEY (exception_list_id, id),
    FOREIGN KEY (exception_list_id) REFERENCES exception_list(id),
    FOREIGN KEY (id) REFERENCES action_locking(id)
);

CREATE TABLE exception_list (
    id text,
    campaign_id text,
    created_date text,
    deactivation_date text,
    items_uri text,
    "name" text,
    number_of_items text,
    "state" text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id)
);

CREATE TABLE note (
    id text,
    campaign_id text,
    attachments jsonb,
    content text,
    creation_date text,
    creator text,
    media_id text,
    media_name text,
    modification_date text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id)
);

CREATE TABLE deal_product (
    product_name text,
    deal_id text,
    product_after_price_amount text,
    product_after_price_currency text,
    product_before_price_amount text,
    product_before_price_currency text,
    product_image_url text,
    PRIMARY KEY (product_name, deal_id),
    FOREIGN KEY (deal_id) REFERENCES deal(id)
);

CREATE TABLE deal (
    id text,
    campaign_id text,
    bogo_buy_image_url text,
    bogo_buy_name text,
    bogo_buy_quantity text,
    bogo_buy_scope text,
    bogo_get_discount_amount text,
    bogo_get_discount_currency text,
    bogo_get_discount_percent text,
    bogo_get_discount_type text,
    bogo_get_image_url text,
    bogo_get_name text,
    bogo_get_quantity text,
    bogo_get_scope text,
    categories text,
    default_promo_code text,
    description text,
    discount_amount text,
    discount_currency text,
    discount_maximum_percent text,
    discount_percent text,
    discount_percent_range_end text,
    discount_percent_range_start text,
    discount_type text,
    end_date text,
    gift text,
    maximum_savings_amount text,
    maximum_savings_currency text,
    minimum_purchase_amount text,
    minimum_purchase_amount_currency text,
    "name" text,
    purchase_limit_quantity text,
    rebate_amount text,
    rebate_currency text,
    restricted_media_partner_groups jsonb,
    restricted_media_partners jsonb,
    scope text,
    start_date text,
    "state" text,
    synch_ads_promo_codes text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id)
);

CREATE TABLE ftp_submission (
    batch_id text,
    account_id text,
    completion_date text,
    errors_uri text,
    file_name text,
    "status" text,
    submission_date text,
    total_errors text,
    total_records text,
    "type" text,
    PRIMARY KEY (batch_id)
);

CREATE TABLE performance_by_day (
    campaign_id text,
    date_display timestamp,
    action_cost text,
    actions text,
    calls text,
    clickc_cost text,
    clicks text,
    cpc text,
    cpc_cost text,
    date_sort text,
    impressions text,
    media_count text,
    other_cost text,
    revenue text,
    total_cost text,
    PRIMARY KEY (campaign_id, date_display)
);

CREATE TABLE tracking_value_promo_code (
    id text,
    tracking_value_request_id text,
    PRIMARY KEY (id, tracking_value_request_id),
    FOREIGN KEY (id) REFERENCES promo_code(id),
    FOREIGN KEY (tracking_value_request_id) REFERENCES tracking_value_request(id)
);

CREATE TABLE tracking_value_request (
    id text,
    campaign_id text,
    deal_id text,
    media_partner_id text,
    additional_instructions text,
    bogo_buy_image_url text,
    bogo_buy_name text,
    bogo_buy_quantity text,
    bogo_buy_scope text,
    bogo_get_discount_amount text,
    bogo_get_discount_currency text,
    bogo_get_discount_percent text,
    bogo_get_discount_type text,
    bogo_get_image_url text,
    bogo_get_name text,
    bogo_get_quantity text,
    bogo_get_scope text,
    campaign_name text,
    date_completed text,
    date_needed text,
    date_placed text,
    deal_categories text,
    deal_default_promo_code text,
    deal_description text,
    deal_end_date text,
    deal_name text,
    deal_products jsonb,
    deal_restricted_media_partner_groups jsonb,
    deal_restricted_media_partners jsonb,
    deal_scope text,
    deal_start_date text,
    deal_state text,
    deal_type text,
    discount_amount text,
    discount_currency text,
    discount_maximum_percent text,
    discount_percent text,
    discount_percent_range_end text,
    discount_percent_range_start text,
    discount_type text,
    gift text,
    maximum_savings_amount text,
    maximum_savings_currency text,
    media_partner_name text,
    minimum_purchase_amount text,
    minimum_purchase_amount_currency text,
    number_requested text,
    phone_numbers jsonb,
    processing_comments text,
    purchase_limit_quantity text,
    rebate_amount text,
    rebate_currency text,
    request_type text,
    "state" text,
    synch_ads_promo_codes text,
    unique_urls jsonb,
    PRIMARY KEY (id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (deal_id) REFERENCES deal(id),
    FOREIGN KEY (media_partner_id) REFERENCES partner(id)
);

CREATE TABLE partner_group_media_partner (
    partner_group_id text,
    partner_id text,
    PRIMARY KEY (partner_group_id, partner_id),
    FOREIGN KEY (partner_group_id) REFERENCES partner_group(id),
    FOREIGN KEY (partner_id) REFERENCES partner(id)
);

CREATE TABLE partner_group (
    id text,
    campaign_id text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id)
);

CREATE TABLE action_locking (
    id text,
    ad_id text,
    campaign_id text,
    media_partner_id text,
    action_tracker_id text,
    action_tracker_name text,
    amount text,
    caller_id text,
    campaign_name text,
    cleared_date text,
    client_cost text,
    creation_date text,
    currency text,
    customer_area text,
    customer_city text,
    customer_country text,
    customer_id text,
    customer_post_code text,
    customer_region text,
    customer_status text,
    delta_amount text,
    delta_payout text,
    event_code text,
    event_date text,
    intended_amount text,
    intended_payout text,
    ip_address text,
    locking_date text,
    media_partner_name text,
    note text,
    o_id text,
    payout text,
    promo_code text,
    referring_date text,
    referring_domain text,
    referring_type text,
    shared_id text,
    "state" text,
    PRIMARY KEY (id),
    FOREIGN KEY (ad_id) REFERENCES ads(id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (media_partner_id) REFERENCES partner(id)
);

CREATE TABLE action_inquery_comment (
    user_name text,
    action_inquery_id text,
    "comment" text,
    "date" text,
    PRIMARY KEY (user_name, action_inquery_id),
    FOREIGN KEY (action_inquery_id) REFERENCES action_inquery(id)
);

CREATE TABLE action_inquery (
    id text,
    action_id text,
    campaign_id text,
    media_partner_id text,
    action_uri text,
    auto_approval_date text,
    campaign_name text,
    creation_date text,
    expected_payout text,
    final_payout text,
    inquiry_type text,
    media_partner_name text,
    order_id text,
    reject_reason text,
    resolution_date text,
    resolution_deadline_date text,
    resolution_status text,
    tracking_link text,
    transaction_amount text,
    transaction_date text,
    PRIMARY KEY (id),
    FOREIGN KEY (action_id) REFERENCES action_locking(id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (media_partner_id) REFERENCES partner(id)
);

CREATE TABLE action_event (
    id text,
    ad_id text,
    campaign_id text,
    media_partner_id text,
    action_tracker_id text,
    action_tracker_name text,
    amount text,
    caller_id text,
    campaign_name text,
    cleared_date text,
    client_cost text,
    creation_date text,
    currency text,
    customer_area text,
    customer_city text,
    customer_country text,
    customer_id text,
    customer_post_code text,
    customer_region text,
    customer_status text,
    delta_amount text,
    delta_payout text,
    event_code text,
    event_date text,
    intended_amount text,
    intended_payout text,
    ip_address text,
    locking_date text,
    media_partner_name text,
    note text,
    o_id text,
    payout text,
    promo_code text,
    referring_date text,
    referring_domain text,
    referring_type text,
    shared_id text,
    "state" text,
    PRIMARY KEY (id),
    FOREIGN KEY (ad_id) REFERENCES ads(id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (media_partner_id) REFERENCES partner(id)
);

CREATE TABLE performance_by_partner (
    campaign_id text,
    media text,
    action_cost text,
    actions text,
    calls text,
    click_cost text,
    clicks text,
    country text,
    cpc text,
    cpc_cost text,
    impressions text,
    mediatype text,
    other_cost text,
    platform text,
    relationship text,
    revenue text,
    "state" text,
    total_cost text,
    PRIMARY KEY (campaign_id, media)
);

CREATE TABLE partner_property (
    id text,
    partner_id text,
    dlu text,
    doe text,
    "name" text,
    platform text,
    "type" text,
    url text,
    PRIMARY KEY (id, partner_id),
    FOREIGN KEY (partner_id) REFERENCES partner(id)
);

CREATE TABLE partner_promotional_category (
    promotional_category text,
    partner_id text,
    PRIMARY KEY (promotional_category, partner_id),
    FOREIGN KEY (partner_id) REFERENCES partner(id)
);

CREATE TABLE partner_program_group (
    group_id text,
    partner_program_id text,
    group_name text,
    PRIMARY KEY (group_id, partner_program_id),
    FOREIGN KEY (partner_program_id) REFERENCES partner_program(id)
);

CREATE TABLE partner_program (
    id text,
    partner_id text,
    contract_id text,
    contract_name text,
    join_date text,
    "name" text,
    PRIMARY KEY (id, partner_id),
    FOREIGN KEY (partner_id) REFERENCES partner(id),
    FOREIGN KEY (contract_id) REFERENCES contract(id)
);

CREATE TABLE partner_contact_phone (
    _fivetran_id text,
    partner_contact_email text,
    partner_contact_partner_id text,
    country text,
    number text,
    "type" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (partner_contact_email) REFERENCES partner_contact(email),
    FOREIGN KEY (partner_contact_partner_id) REFERENCES partner_contact(partner_id)
);

CREATE TABLE partner_contact (
    email text,
    partner_id text,
    first_name text,
    is_primary boolean,
    labels jsonb,
    last_name text,
    PRIMARY KEY (email, partner_id),
    FOREIGN KEY (partner_id) REFERENCES partner(id)
);

CREATE TABLE partner_linked_account (
    id text,
    partner_id text,
    "date" text,
    reason text,
    PRIMARY KEY (id, partner_id),
    FOREIGN KEY (partner_id) REFERENCES partner(id)
);

CREATE TABLE partner (
    id text,
    account_manager text,
    address_address_1 text,
    address_address_2 text,
    address_city text,
    address_country text,
    address_postal_code text,
    address_state text,
    created_by text,
    currency text,
    date_created text,
    date_last_updated text,
    description text,
    indirect_tax_country text,
    indirect_tax_number text,
    last_updated_by text,
    "name" text,
    partner_type text,
    partner_values_value_1 text,
    partner_values_value_2 text,
    partner_values_value_3 text,
    phone_country text,
    phone_number text,
    promoting_country text,
    promotional_method text,
    "state" text,
    timezone text,
    website text,
    PRIMARY KEY (id)
);

CREATE TABLE invoice_line_item (
    campaign_id text,
    invoice_id text,
    actions text,
    campaign_name text,
    description text,
    due_date text,
    event_month_year text,
    net_item_amount text,
    paid_date text,
    "status" text,
    total_item_amount text,
    vat_item_amount text,
    PRIMARY KEY (campaign_id, invoice_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(id)
);

CREATE TABLE invoice (
    id text,
    created_date text,
    currency text,
    media_id text,
    media_name text,
    pdf text,
    total_amount text,
    total_vat_amount text,
    PRIMARY KEY (id)
);

CREATE TABLE account (
    company_name text,
    billing_address_address_line_1 text,
    billing_address_address_line_2 text,
    billing_address_city text,
    billing_address_country text,
    billing_address_postal_code text,
    billing_address_state text,
    commercial_contact_cell_phone_number text,
    commercial_contact_cell_phone_number_country text,
    commercial_contact_email text,
    commercial_contact_name text,
    commercial_contact_user_id text,
    commercial_contact_work_phone_number text,
    commercial_contact_work_phone_number_country text,
    corporate_address_address_line_1 text,
    corporate_address_address_line_2 text,
    corporate_address_city text,
    corporate_address_country text,
    corporate_address_postal_code text,
    corporate_address_state text,
    currency text,
    ein_ssn_foreign_tax_id text,
    financial_contact_cell_phone_number text,
    financial_contact_cell_phone_number_country text,
    financial_contact_email text,
    financial_contact_name text,
    financial_contact_user_id text,
    financial_contact_work_phone_number text,
    financial_contact_work_phone_number_country text,
    indirect_tax_number text,
    industry_industry_id text,
    industry_industry_name text,
    minimum_contact_rating text,
    organization_type text,
    primary_phone_number text,
    primary_phone_number_country text,
    primary_promotional_method text,
    promotional_methods text,
    registered_for_indirect_tax text,
    secondary_phone_number text,
    secondary_phone_number_country text,
    technical_contact_cell_phone_number text,
    technical_contact_cell_phone_number_country text,
    technical_contact_email text,
    technical_contact_name text,
    technical_contact_user_id text,
    technical_contact_work_phone_number text,
    technical_contact_work_phone_number_country text,
    timezone text,
    website text,
    PRIMARY KEY (company_name)
);

CREATE TABLE click (
    id text,
    ad_id text,
    profile_id text,
    program_id text,
    ad_campaign text,
    ad_group text,
    bid_keyword text,
    browser text,
    channel text,
    cpc_bid text,
    customer_area text,
    customer_city text,
    customer_country text,
    customer_region text,
    deal_name text,
    deal_scope text,
    deal_type text,
    device_family text,
    device_type text,
    event_date text,
    ip_address text,
    keyword text,
    landing_page_url text,
    match_type text,
    media_id text,
    media_name text,
    os text,
    payout text,
    product_sku text,
    referring_domain text,
    referring_url text,
    search_text text,
    shared_id text,
    sub_id_1 text,
    sub_id_2 text,
    sub_id_3 text,
    traffic_category text,
    traffic_source text,
    unique_click text,
    PRIMARY KEY (id),
    FOREIGN KEY (ad_id) REFERENCES ads(id),
    FOREIGN KEY (profile_id) REFERENCES contact(id),
    FOREIGN KEY (program_id) REFERENCES campaign(id)
);
