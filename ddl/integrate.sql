CREATE TABLE contract_creative_id (
    creative_id text,
    contract_id text,
    PRIMARY KEY (creative_id, contract_id),
    FOREIGN KEY (contract_id) REFERENCES contract(id)
);

CREATE TABLE contract_value_list (
    value_list text,
    contract_id text,
    PRIMARY KEY (value_list, contract_id),
    FOREIGN KEY (contract_id) REFERENCES contract(id)
);

CREATE TABLE contract (
    id text,
    agreements_accepted text,
    agreements_required text,
    alias text,
    allocated text,
    approved_date text,
    asset_count text,
    buyer_id text,
    buyer_name text,
    buyer_short_name text,
    campaign_id text,
    campaign_name text,
    campaign_type text,
    changes_require_approval text,
    channel_name text,
    created text,
    currency_code text,
    end_date text,
    field_count text,
    goal text,
    insertion_order text,
    integration_type text,
    is_lead_review text,
    latest_lead_activity text,
    lead_review_type text,
    market_place_type text,
    modified text,
    "name" text,
    owner_id text,
    pacing text,
    pay_out text,
    percent_to_end_date text,
    percent_to_goal text,
    proofs_required text,
    publisher_id text,
    publisher_name text,
    publisher_short_name text,
    purchase_order text,
    rejected text,
    short_id text,
    start_date text,
    "status" text,
    tag_name text,
    tags text,
    time_zone text,
    version text,
    PRIMARY KEY (id)
);

CREATE TABLE report_contract_status (
    contract_status text,
    report_id text,
    PRIMARY KEY (contract_status, report_id),
    FOREIGN KEY (report_id) REFERENCES report(id)
);

CREATE TABLE report_campaign_status (
    campaign_status text,
    report_id text,
    PRIMARY KEY (campaign_status, report_id),
    FOREIGN KEY (report_id) REFERENCES report(id)
);

CREATE TABLE report_lead_status (
    lead_status text,
    report_id text,
    PRIMARY KEY (lead_status, report_id),
    FOREIGN KEY (report_id) REFERENCES report(id)
);

CREATE TABLE report_contract_id (
    contract_id text,
    report_id text,
    PRIMARY KEY (contract_id, report_id),
    FOREIGN KEY (contract_id) REFERENCES contract(id),
    FOREIGN KEY (report_id) REFERENCES report(id)
);

CREATE TABLE report_auto_campaign_id (
    auto_campaign_id text,
    report_id text,
    PRIMARY KEY (auto_campaign_id, report_id),
    FOREIGN KEY (report_id) REFERENCES report(id)
);

CREATE TABLE report_auto_buyer_id (
    auto_buyer_id text,
    report_id text,
    PRIMARY KEY (auto_buyer_id, report_id),
    FOREIGN KEY (report_id) REFERENCES report(id)
);

CREATE TABLE report_auto_publisher_id (
    auto_publisher_id text,
    report_id text,
    PRIMARY KEY (auto_publisher_id, report_id),
    FOREIGN KEY (report_id) REFERENCES report(id)
);

CREATE TABLE report_auto_domain_list_id (
    auto_domain_list_id text,
    report_id text,
    PRIMARY KEY (auto_domain_list_id, report_id),
    FOREIGN KEY (report_id) REFERENCES report(id)
);

CREATE TABLE report_auto_general_list_id (
    auto_general_list_id text,
    report_id text,
    PRIMARY KEY (auto_general_list_id, report_id),
    FOREIGN KEY (report_id) REFERENCES report(id)
);

CREATE TABLE report_auto_tag_id (
    auto_tag_id text,
    report_id text,
    PRIMARY KEY (auto_tag_id, report_id),
    FOREIGN KEY (report_id) REFERENCES report(id)
);

CREATE TABLE report_integration_id (
    integration_id text,
    report_id text,
    PRIMARY KEY (integration_id, report_id),
    FOREIGN KEY (report_id) REFERENCES report(id)
);

CREATE TABLE report_batch_id (
    bacth_id text,
    report_id text,
    PRIMARY KEY (bacth_id, report_id),
    FOREIGN KEY (report_id) REFERENCES report(id)
);

CREATE TABLE report_field (
    field text,
    report_id text,
    PRIMARY KEY (field, report_id),
    FOREIGN KEY (report_id) REFERENCES report(id)
);

CREATE TABLE report_mapper (
    mapper text,
    report_id text,
    PRIMARY KEY (mapper, report_id),
    FOREIGN KEY (report_id) REFERENCES report(id)
);

CREATE TABLE report (
    id text,
    allow_extended_access text,
    auto_add_sources_type jsonb,
    created_at text,
    created_by text,
    created_by_user_id text,
    email_body text,
    email_subject text,
    file_name text,
    file_type text,
    include_current_and_future text,
    is_agency text,
    modified_at text,
    "name" text,
    organization text,
    schedule jsonb,
    single_file text,
    template text,
    "type" text,
    ui_template_model text,
    upcoming_run_time text,
    PRIMARY KEY (id)
);

CREATE TABLE list_value (
    id text,
    list_id text,
    "value" text,
    PRIMARY KEY (id, list_id),
    FOREIGN KEY (list_id) REFERENCES list(id)
);

CREATE TABLE list_parent (
    parent text,
    list_id text,
    PRIMARY KEY (parent, list_id),
    FOREIGN KEY (list_id) REFERENCES list(id)
);

CREATE TABLE list (
    id text,
    attribute text,
    campaigns_field_association text,
    campaigns_nested_field_association text,
    case_sensitive text,
    contracts_field_association text,
    contracts_nested_field_association text,
    created_at text,
    entry text,
    is_locked text,
    is_md_5 text,
    last_modified text,
    mapping_count text,
    "name" text,
    name_lower_case text,
    owner_id text,
    "path" text,
    "source" text,
    "type" text,
    value_list_value text,
    PRIMARY KEY (id)
);
