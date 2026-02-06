CREATE TABLE sale_cycle_stage (
    id text,
    api_name text,
    created_at text,
    description text,
    internal_status text,
    "name" text,
    object_type text,
    "position" text,
    sales_cycle_key text,
    sales_cycle_name text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE groups (
    id text,
    archived text,
    created_at text,
    features_application_enabled text,
    features_deals_enabled text,
    features_deals_salesforce text,
    features_disable_link_create text,
    features_leads_enabled text,
    is_default text,
    "name" text,
    slug text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE "transaction" (
    id text,
    customer_key text,
    amount text,
    amount_usd text,
    approved text,
    category_key text,
    created_at text,
    currency text,
    extension jsonb,
    metadata jsonb,
    product_key text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_key) REFERENCES customer("key")
);

CREATE TABLE reward (
    id text,
    action_key text,
    customer_key text,
    partnership_key text,
    transaction_key text,
    amount text,
    created_at text,
    decline_reason text,
    description text,
    invoice_key text,
    invoice_payment_date text,
    invoice_status text,
    line_amount text,
    line_key text,
    offer_description text,
    offer_key text,
    reward_status text,
    trigger_key text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (action_key) REFERENCES "action"(id),
    FOREIGN KEY (customer_key) REFERENCES customer("key"),
    FOREIGN KEY (partnership_key) REFERENCES partnership(id),
    FOREIGN KEY (transaction_key) REFERENCES "transaction"(id)
);

CREATE TABLE deal_file (
    id text,
    deal_id text,
    field_key text,
    "name" text,
    PRIMARY KEY (id, deal_id),
    FOREIGN KEY (deal_id) REFERENCES deal(id)
);

CREATE TABLE form_template_field (
    "index" text,
    form_template_id text,
    default_value text,
    help_text text,
    hidden text,
    internal_name text,
    maps_to jsonb,
    "name" text,
    optioneight text,
    optionfive text,
    optionfour text,
    optionnine text,
    optionone text,
    optionseven text,
    optionsix text,
    optionthree text,
    optiontwo text,
    optionzero text,
    placeholder_text text,
    "position" text,
    protected text,
    required text,
    "type" text,
    PRIMARY KEY ("index"),
    FOREIGN KEY (form_template_id) REFERENCES form_template(id)
);

CREATE TABLE form_template (
    id text,
    created_at text,
    description text,
    "name" text,
    title text,
    "type" text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE deal_field (
    id text,
    deal_id text,
    api_name text,
    external_type text,
    help_text text,
    hidden text,
    internal_name text,
    "name" text,
    "option" jsonb,
    placeholder_text text,
    "position" text,
    required text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (deal_id) REFERENCES deal(id)
);

CREATE TABLE deal (
    id text,
    group_key text,
    partner_key text,
    account_name text,
    amount text,
    close_date text,
    contact_first_name text,
    contact_last_name text,
    created_at text,
    external_key text,
    field_data jsonb,
    lost_reason text,
    meta jsonb,
    mold_key text,
    "source" text,
    stage text,
    team_created_at text,
    team_key text,
    team_member_created_at text,
    team_member_email text,
    team_member_first_name text,
    team_member_key text,
    team_member_last_name text,
    team_member_updated_at text,
    team_name text,
    team_updated_at text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (group_key) REFERENCES groups(id),
    FOREIGN KEY (partner_key) REFERENCES partnership(partner_key)
);

CREATE TABLE sub_id (
    sub_id text,
    action_id text,
    PRIMARY KEY (sub_id, action_id),
    FOREIGN KEY (action_id) REFERENCES "action"(id)
);

CREATE TABLE "action" (
    id text,
    customer_key text,
    partnership_key text,
    archived text,
    company_key text,
    company_name text,
    created_at text,
    "type" text,
    updated_at text,
    "value" text,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_key) REFERENCES customer("key"),
    FOREIGN KEY (partnership_key) REFERENCES partnership(id)
);

CREATE TABLE customer_field (
    id text,
    customer_key text,
    api_name text,
    external_type text,
    help_text text,
    hidden text,
    internal_name text,
    "name" text,
    "option" jsonb,
    placeholder_text text,
    "position" text,
    required text,
    "type" text,
    PRIMARY KEY (id, customer_key),
    FOREIGN KEY (customer_key) REFERENCES customer("key")
);

CREATE TABLE customer (
    "key" text,
    partnership_key text,
    created_at text,
    customer_key text,
    email text,
    field_data jsonb,
    meta_field text,
    "name" text,
    partner_key text,
    provider_key text,
    source_key text,
    source_type text,
    test text,
    updated_at text,
    PRIMARY KEY ("key"),
    FOREIGN KEY (partnership_key) REFERENCES partnership(id)
);

CREATE TABLE partner_team_member (
    id text,
    id text,
    email text,
    first_name text,
    last_name text,
    "role" text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES partner_team(id),
    FOREIGN KEY (id) REFERENCES partner_team(id)
);

CREATE TABLE partner_team (
    id text,
    partnership_id text,
    team_key text,
    team_name text,
    partnership_key text,
    PRIMARY KEY (id),
    FOREIGN KEY (partnership_id) REFERENCES partnership(id),
    FOREIGN KEY (team_key) REFERENCES partnership(team_key),
    FOREIGN KEY (team_name) REFERENCES partnership(team_name)
);

CREATE TABLE partnership_tag (
    tags text,
    partnership_id text,
    PRIMARY KEY (tags, partnership_id),
    FOREIGN KEY (partnership_id) REFERENCES partnership(id)
);

CREATE TABLE partnership (
    id text,
    group_key text,
    address_city text,
    address_country text,
    address_key text,
    address_postal text,
    address_primary text,
    address_region text,
    address_state text,
    address_street text,
    address_unit text,
    approved_status text,
    created_at text,
    email text,
    first_name text,
    joined_at text,
    last_name text,
    manager_manager_email text,
    manager_manager_name text,
    mdata jsonb,
    partner_key text,
    stats_commission_earned text,
    stats_commission_paid text,
    stats_commission_unpaid text,
    stats_customer_count text,
    stats_deal_revenue text,
    stats_deal_submitted text,
    stats_drip_pending text,
    stats_lead_submitted text,
    stats_link_clicks text,
    stats_paid_account_count text,
    stats_partner_count text,
    stats_pending text,
    stats_revenue text,
    stats_transaction_count text,
    team_key text,
    team_name text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (group_key) REFERENCES groups(id)
);

CREATE TABLE lead_field (
    id text,
    lead_id text,
    api_name text,
    external_type text,
    help_text text,
    hidden text,
    internal_name text,
    "name" text,
    options jsonb,
    placeholder_text text,
    "position" text,
    required text,
    "type" text,
    "value" text,
    PRIMARY KEY (id),
    FOREIGN KEY (lead_id) REFERENCES lead(id)
);

CREATE TABLE lead (
    id text,
    customer_key text,
    group_key text,
    mold_key text,
    partner_key text,
    amount text,
    approved text,
    created_at text,
    external_key text,
    field_data_company text,
    field_data_email text,
    field_data_firstname text,
    field_data_industry text,
    field_data_lastname text,
    field_data_notes text,
    field_data_phone text,
    field_data_website text,
    meta_additional_prop jsonb,
    meta_company text,
    meta_email text,
    meta_first_name text,
    meta_last_name text,
    stage_data_api_name text,
    stage_data_description text,
    stage_data_internal_status text,
    stage_data_key text,
    stage_data_name text,
    "status" text,
    team_created_at text,
    team_key text,
    team_member_created_at text,
    team_member_email text,
    team_member_first_name text,
    team_member_key text,
    team_member_last_name text,
    team_member_updated_at text,
    team_name text,
    team_updated_at text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_key) REFERENCES customer("key"),
    FOREIGN KEY (group_key) REFERENCES groups(id),
    FOREIGN KEY (mold_key) REFERENCES form_template(id),
    FOREIGN KEY (partner_key) REFERENCES partnership(id)
);
