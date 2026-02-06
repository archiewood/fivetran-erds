CREATE TABLE media_library_folder (
    id text,
    parent_id text,
    created_at text,
    "name" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (parent_id) REFERENCES media_library_folder(id)
);

CREATE TABLE product_selection (
    id text,
    brand_id text,
    contact_address_id text,
    contact_id text,
    created_at text,
    fulfilled_at text,
    is_fulfilled text,
    order_errors jsonb,
    order_status text,
    order_status_updated_at text,
    proposal_id text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (brand_id) REFERENCES brand(id),
    FOREIGN KEY (contact_address_id) REFERENCES contact_address(id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE payable (
    id text,
    contact_id text,
    payment_id text,
    amount text,
    conversion jsonb,
    conversion_rate text,
    created_at text,
    currency text,
    due_at text,
    is_verified text,
    is_voided text,
    payment_status text,
    "status" text,
    updated_at text,
    usd_amount text,
    PRIMARY KEY (id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (payment_id) REFERENCES payment(id)
);

CREATE TABLE activation_brief (
    id text,
    activation_id text,
    brand_id text,
    contact_id text,
    member_id text,
    accepted_at text,
    accepted_by text,
    account_id text,
    created_at text,
    declined_at text,
    declined_by text,
    previous_status text,
    reviewed_at text,
    "status" text,
    "type" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (activation_id) REFERENCES activation(id),
    FOREIGN KEY (brand_id) REFERENCES brand(id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (member_id) REFERENCES users(id)
);

CREATE TABLE contact_custom_property (
    contact_id text,
    id text,
    property_id text,
    created_at text,
    date_value text,
    json_value jsonb,
    "name" text,
    number_value text,
    string_value text,
    text_value text,
    updated_at text,
    PRIMARY KEY (contact_id, id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (id) REFERENCES custom_property_value(id),
    FOREIGN KEY (property_id) REFERENCES custom_property(id)
);

CREATE TABLE contact_tag (
    id text,
    contact_id text,
    "name" text,
    PRIMARY KEY (id, contact_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE contact (
    id text,
    owner_id text,
    payment_account_id text,
    primary_address_id text,
    primary_contact_id text,
    added_manually text,
    application_completed_at text,
    application_page_id text,
    birthday text,
    company text,
    created_at text,
    email text,
    first_name text,
    gender text,
    is_archived text,
    is_declined text,
    joined_at text,
    languages text,
    last_name text,
    live_url_id text,
    notification_channel text,
    phone_country_code text,
    phone_number text,
    phone_number_display text,
    profile_picture text,
    promoted_to_influencer_at text,
    record_type text,
    "source" text,
    stage_id text,
    stage_name text,
    stage_position text,
    stage_type text,
    total_reach text,
    updated_at timestamp,
    website text,
    PRIMARY KEY (id),
    FOREIGN KEY (owner_id) REFERENCES users(id),
    FOREIGN KEY (payment_account_id) REFERENCES payment_account(id),
    FOREIGN KEY (primary_address_id) REFERENCES contact_address(id),
    FOREIGN KEY (primary_contact_id) REFERENCES contact(id)
);

CREATE TABLE payment_item (
    id text,
    payment_id text,
    contact_id text,
    amount text,
    conversion jsonb,
    conversion_rate text,
    created_at text,
    currency text,
    due_at text,
    is_verified text,
    is_voided text,
    payment_status text,
    "status" text,
    updated_at text,
    usd_amount text,
    PRIMARY KEY (id, payment_id),
    FOREIGN KEY (payment_id) REFERENCES payment(id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE payment (
    id text,
    campaign_id text,
    contact_id text,
    payment_account_id text,
    user_id text,
    amount text,
    batch_id text,
    conversion_rate text,
    created_at text,
    currency text,
    deleted_at text,
    sent_at text,
    "status" text,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (payment_account_id) REFERENCES payment_account(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE brand (
    id text,
    created_at text,
    currency text,
    description text,
    logo text,
    "name" text,
    support_email text,
    updated_at timestamp,
    url text,
    PRIMARY KEY (id)
);

CREATE TABLE partnership_proposal (
    id text,
    partnership_id text,
    brand_id text,
    campaign_id text,
    contact_address_id text,
    contact_id text,
    content_rights_id text,
    accepted_at text,
    agreed text,
    agreed_at text,
    completed_at text,
    created_at text,
    declined_at text,
    end_date text,
    has_payment text,
    has_product text,
    is_complete text,
    notes text,
    partnership_position text,
    price text,
    start_date text,
    updated_at text,
    PRIMARY KEY (id, partnership_id),
    FOREIGN KEY (partnership_id) REFERENCES partnership(id),
    FOREIGN KEY (brand_id) REFERENCES brand(id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (contact_address_id) REFERENCES contact_address(id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (content_rights_id) REFERENCES content_rights(id)
);

CREATE TABLE partnership_task (
    id text,
    partnership_id text,
    campaign_id text,
    network_id text,
    bio_text text,
    created_at text,
    deliverable_price text,
    description text,
    interval_index jsonb,
    is_required text,
    media_type text,
    "name" text,
    partnership_interval_type text,
    "position" text,
    quantity text,
    requires_creator_oauth text,
    starting_interval_index text,
    updated_at text,
    PRIMARY KEY (id, partnership_id),
    FOREIGN KEY (partnership_id) REFERENCES partnership(id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (network_id) REFERENCES contact_network(network_id)
);

CREATE TABLE partnership (
    id text,
    affiliate_link_id text,
    brand_id text,
    contact_id text,
    content_rights_id text,
    discount_code_group_id text,
    allow_influencer_upload text,
    budget text,
    compensation jsonb,
    created_at text,
    deal_content jsonb,
    deal_total_cost text,
    deliverable_interval text,
    description text,
    duration_interval text,
    duration_length text,
    end_date text,
    has_strict_deliverable_date text,
    ignore_end_date_for_content text,
    image text,
    influencer_title text,
    internal_title text,
    is_published text,
    payable jsonb,
    payment_method text,
    property jsonb,
    requires_signature text,
    set_end_date text,
    short_description text,
    show_revenue_tracking_information text,
    signed_at text,
    stage_id text,
    stage_name text,
    stage_position text,
    stage_type text,
    start_date text,
    tracking_tags text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (affiliate_link_id) REFERENCES affiliate_link(id),
    FOREIGN KEY (brand_id) REFERENCES brand(id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (content_rights_id) REFERENCES content_rights(id),
    FOREIGN KEY (discount_code_group_id) REFERENCES discount_code_group(id)
);

CREATE TABLE partnership_job (
    id text,
    partnership_id text,
    campaign_id text,
    contact_id text,
    proposal_id text,
    task_id text,
    content_posted_at text,
    created_at text,
    delivered_at text,
    due_at text,
    is_extra text,
    is_global text,
    media_library_content_id text,
    note text,
    "status" text,
    status_info text,
    "type" text,
    updated_at text,
    PRIMARY KEY (id, partnership_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (proposal_id) REFERENCES partnership_proposal(id),
    FOREIGN KEY (task_id) REFERENCES partnership_task(id)
);

CREATE TABLE discount_code (
    id text,
    contact_id text,
    ecommerce_account_id text,
    group_id text,
    code text,
    created_at text,
    deleted_at text,
    disabled_at text,
    disabled_reason text,
    end_date text,
    external_id text,
    start_date text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (ecommerce_account_id) REFERENCES ecommerce_account(id),
    FOREIGN KEY (group_id) REFERENCES discount_code_group(id)
);

CREATE TABLE product_variant (
    id text,
    product_id text,
    cost text,
    external_id text,
    price text,
    qty text,
    shipping_cost text,
    sku text,
    PRIMARY KEY (id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE ecommerce_account (
    id text,
    brand_id text,
    created_at text,
    provider text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (brand_id) REFERENCES brand(id)
);

CREATE TABLE user_role (
    role_name text,
    users_id text,
    PRIMARY KEY (role_name, users_id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    created_at text,
    email text,
    email_verified_at text,
    first_name text,
    last_name text,
    phone text,
    phone_country_code text,
    profile_picture text,
    timezone text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE task (
    id text,
    assignee_id text,
    contact_id text,
    creator_id text,
    completed_at text,
    created_at text,
    due_at text,
    "name" text,
    note text,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (assignee_id) REFERENCES users(id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (creator_id) REFERENCES users(id)
);

CREATE TABLE payment_account (
    id text,
    created_at text,
    reference_id text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE domain (
    id text,
    created_at text,
    is_white_labeled text,
    subdomain text,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE content_rights_selected (
    id text,
    content_rights_id text,
    text text,
    PRIMARY KEY (id, content_rights_id),
    FOREIGN KEY (content_rights_id) REFERENCES content_rights(id)
);

CREATE TABLE content_rights (
    id text,
    content_rights_header text,
    created_at text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE deposit (
    id text,
    amount text,
    created_at text,
    failure_reason text,
    provider text,
    "state" text,
    total text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE campaign_compensation (
    "index" text,
    campaign_id text,
    compensation text,
    PRIMARY KEY ("index", campaign_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id)
);

CREATE TABLE campaign (
    id text,
    affiliate_link_id text,
    brand_id text,
    discount_code_group_id text,
    team_id text,
    allow_influencer_uploads text,
    budget text,
    created_at text,
    date_content_end text,
    date_content_start text,
    date_proposals_end text,
    date_proposals_start text,
    description text,
    image text,
    influencer_inputs_price text,
    influencer_title text,
    internal_title text,
    payment_method text,
    public_tags text,
    recurring_proposals text,
    short_description text,
    show_revenue_tracking_information text,
    tracking_tags text,
    updated_at text,
    version text,
    PRIMARY KEY (id),
    FOREIGN KEY (affiliate_link_id) REFERENCES affiliate_link(id),
    FOREIGN KEY (brand_id) REFERENCES brand(id),
    FOREIGN KEY (discount_code_group_id) REFERENCES discount_code_group(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE orders (
    id text,
    campaign_id text,
    contact_id text,
    ecommerce_account_id text,
    product_selection_id text,
    user_id text,
    campaign_proposal_id text,
    created_at text,
    external_order_id text,
    fulfillment jsonb,
    shipment_status text,
    shipment_status_date text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (ecommerce_account_id) REFERENCES ecommerce_account(id),
    FOREIGN KEY (product_selection_id) REFERENCES product_selection(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE activation (
    id text,
    brand_id text,
    team_id text,
    account_id text,
    budget text,
    created_at text,
    currency text,
    currency_rate text,
    description text,
    dollar_budget text,
    image text,
    "name" text,
    previous_status text,
    public_name text,
    "status" text,
    "type" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (brand_id) REFERENCES brand(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE media_library_content_hashtag (
    hashtag_name text,
    media_library_content_id text,
    PRIMARY KEY (hashtag_name, media_library_content_id),
    FOREIGN KEY (media_library_content_id) REFERENCES media_library_content(id)
);

CREATE TABLE media_library_content_tag (
    id text,
    media_library_content_id text,
    "name" text,
    PRIMARY KEY (id, media_library_content_id),
    FOREIGN KEY (media_library_content_id) REFERENCES media_library_content(id)
);

CREATE TABLE media_library_content (
    id text,
    campaign_id text,
    contact_id text,
    content_id text,
    content_rights_id text,
    folder_id text,
    network_id text,
    owner_id text,
    album_id text,
    annotations_colors jsonb,
    annotations_labels jsonb,
    away_swipe text,
    campaign_job_id text,
    caption text,
    "comment" text,
    content_rights_accepted_at text,
    content_url text,
    created_at text,
    deleted_at text,
    engagement text,
    engagement_rate text,
    estimated_impression text,
    exit text,
    impression text,
    impressions_real text,
    imv text,
    interaction text,
    is_reel text,
    is_story text,
    label text,
    likes text,
    media_type text,
    mentions jsonb,
    "name" text,
    owner_name text,
    owner_picture text,
    owner_reach text,
    owner_reached text,
    owner_username text,
    posted_at text,
    reach text,
    reply text,
    reply_rate text,
    share text,
    "source" text,
    source_url text,
    taps_back text,
    taps_forward text,
    thumbnail text,
    updated_at timestamp,
    "view" text,
    -- metadata_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (content_id) REFERENCES content(id),
    FOREIGN KEY (content_rights_id) REFERENCES content_rights(id),
    FOREIGN KEY (folder_id) REFERENCES media_library_folder(id),
    FOREIGN KEY (network_id) REFERENCES contact_network(network_id),
    FOREIGN KEY (owner_id) REFERENCES users(id)
);

CREATE TABLE link (
    group_id text,
    id text,
    PRIMARY KEY (group_id, id),
    FOREIGN KEY (group_id) REFERENCES affiliate_link_group(id),
    FOREIGN KEY (id) REFERENCES affiliate_link(id)
);

CREATE TABLE affiliate_link_group (
    id text,
    account_domain_id text,
    brand_id text,
    attribution_window text,
    cascade_update text,
    created_at text,
    destination_url text,
    end_date text,
    "name" text,
    query_parameter jsonb,
    settings_creator_attribution text,
    settings_link_pattern text,
    settings_payout_amount text,
    settings_payout_tiers jsonb,
    settings_payout_type text,
    start_date text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (account_domain_id) REFERENCES domain(id),
    FOREIGN KEY (brand_id) REFERENCES brand(id)
);

CREATE TABLE product_selection_item (
    id text,
    contact_id text,
    product_id text,
    product_selection_id text,
    variant_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (product_selection_id) REFERENCES product_selection(id),
    FOREIGN KEY (variant_id) REFERENCES product_variant(id)
);

CREATE TABLE product_option_value (
    id text,
    option_id text,
    "name" text,
    "position" text,
    PRIMARY KEY (id),
    FOREIGN KEY (option_id) REFERENCES product_option(id)
);

CREATE TABLE discount_code_group (
    id text,
    ecommerce_account_id text,
    affiliatepayout_amount text,
    affiliatepayout_type text,
    code_pattern text,
    created_at text,
    deleted_at text,
    external_id text,
    "name" text,
    rules_applies_to text,
    rules_cascade_update_amount text,
    rules_customer_group_ids jsonb,
    rules_customer_selection text,
    rules_discount_amount text,
    rules_discount_type text,
    rules_enable_shipping_price_limit text,
    rules_end_date text,
    rules_end_tz text,
    rules_has_end_date text,
    rules_limit_one_per_customer text,
    rules_limit_total text,
    rules_limit_total_amount text,
    rules_requirement text,
    rules_requirement_value text,
    rules_shipping_price_limit text,
    rules_specific_ids jsonb,
    rules_start_date text,
    rules_start_tz text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (ecommerce_account_id) REFERENCES ecommerce_account(id)
);

CREATE TABLE product_option (
    id text,
    product_id text,
    "name" text,
    "position" text,
    PRIMARY KEY (id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE content (
    id text,
    campaign_id text,
    contact_id text,
    content_id text,
    content_rights_id text,
    media_library_content_id text,
    network_id text,
    created_at text,
    deleted_at text,
    is_story text,
    job_id text,
    posted_at text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (content_id) REFERENCES content(id),
    FOREIGN KEY (content_rights_id) REFERENCES content_rights(id),
    FOREIGN KEY (media_library_content_id) REFERENCES media_library_content(id),
    FOREIGN KEY (network_id) REFERENCES contact_network(network_id)
);

CREATE TABLE content_stat (
    id text,
    content_id text,
    away_swipe text,
    "comment" text,
    created_at text,
    engagement text,
    engagement_rate text,
    exit text,
    impression text,
    imv text,
    interaction text,
    likes text,
    owner_reach text,
    reach text,
    reply text,
    reply_rate text,
    share text,
    taps_back text,
    taps_forward text,
    updated_at timestamp,
    "view" text,
    PRIMARY KEY (id),
    FOREIGN KEY (content_id) REFERENCES content(id)
);

CREATE TABLE custom_property_option (
    id text,
    custom_property_id text,
    label text,
    "position" text,
    slug text,
    "value" text,
    PRIMARY KEY (id, custom_property_id),
    FOREIGN KEY (custom_property_id) REFERENCES custom_property(id)
);

CREATE TABLE custom_property (
    id text,
    description text,
    external_label text,
    "name" text,
    slug text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE contact_address (
    id text,
    contact_id text,
    city text,
    country text,
    country_code text,
    created_at text,
    email text,
    first_name text,
    label text,
    last_name text,
    phone_country_code text,
    phone_number text,
    phone_number_display text,
    postal_code text,
    "state" text,
    state_code text,
    street text,
    street_2 text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE contact_network (
    id text,
    contact_id text,
    avg_comments text,
    avg_engagement text,
    avg_likes text,
    avg_likes_to_comment text,
    avg_posts_per_day text,
    avg_shares text,
    avg_views text,
    connection_last_checked_at text,
    created_at text,
    graph_id text,
    network text,
    network_account_type text,
    network_connection_permissions text,
    network_connection_type text,
    network_id text,
    network_name text,
    network_slug text,
    network_url text,
    network_user_id text,
    network_username text,
    profile text,
    reach text,
    reach_updated_at text,
    stats_updated_at text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE conversion (
    id text,
    affiliate_link_id text,
    brand_id text,
    contact_id text,
    discount_code_id text,
    amount text,
    commission_amount text,
    created_at text,
    currency text,
    is_verified text,
    is_voided text,
    meta_data jsonb,
    order_id text,
    order_number text,
    rate text,
    "type" text,
    updated_at timestamp,
    void_reason text,
    voided_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (affiliate_link_id) REFERENCES affiliate_link(id),
    FOREIGN KEY (brand_id) REFERENCES brand(id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (discount_code_id) REFERENCES discount_code(id)
);

CREATE TABLE affiliate_link (
    id text,
    contact_id text,
    group_id text,
    created_at text,
    destination_url text,
    end_date text,
    fraud_detected_at text,
    fraud_reason text,
    full_url text,
    query_parameter jsonb,
    settings_creator_attribution text,
    settings_link_pattern text,
    settings_payout_amount text,
    settings_payout_tiers jsonb,
    settings_payout_type text,
    start_date text,
    updated_at timestamp,
    url_path text,
    PRIMARY KEY (id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (group_id) REFERENCES affiliate_link_group(id)
);

CREATE TABLE product_image (
    id text,
    product_id text,
    admin_graphql_api_id text,
    alt text,
    created_at text,
    height text,
    "position" text,
    src text,
    updated_at text,
    variant_id jsonb,
    width text,
    PRIMARY KEY (id, product_id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE collection (
    collection_id text,
    product_id text,
    PRIMARY KEY (collection_id, product_id),
    FOREIGN KEY (collection_id) REFERENCES product_collection(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE product (
    id text,
    brand_id text,
    cost text,
    created_at text,
    description text,
    external_id text,
    has_option text,
    image text,
    is_shipped text,
    "name" text,
    price text,
    qty text,
    shipping_cost text,
    sku text,
    track_inventory text,
    track_variant_inventory text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (brand_id) REFERENCES brand(id)
);

CREATE TABLE product_collection (
    id text,
    brand_id text,
    parent_id text,
    children jsonb,
    created_at text,
    description text,
    external_id text,
    image text,
    is_nav text,
    "name" text,
    "position" text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (brand_id) REFERENCES brand(id),
    FOREIGN KEY (parent_id) REFERENCES product_collection(id)
);

CREATE TABLE custom_property_value (
    id text,
    contact_id text,
    partnership_id text,
    property_id text,
    created_at text,
    updated_at text,
    "value" jsonb,
    PRIMARY KEY (id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (partnership_id) REFERENCES partnership(id),
    FOREIGN KEY (property_id) REFERENCES custom_property(id)
);

CREATE TABLE affiliate_page_view (
    id text,
    link_id text,
    ip_address text,
    url text,
    -- metadata_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (link_id) REFERENCES affiliate_link(id)
);

CREATE TABLE team_user (
    team_id text,
    user_id text,
    PRIMARY KEY (team_id, user_id),
    FOREIGN KEY (team_id) REFERENCES team(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE team (
    id text,
    created_at text,
    defaults text,
    "name" text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE media_library_tag (
    id text,
    created_at text,
    "name" text,
    updated_at timestamp,
    PRIMARY KEY (id)
);
