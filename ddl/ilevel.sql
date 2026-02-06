CREATE TABLE transaction_type_relationship (
    id text,
    cash_transaction_type_id text,
    "type" text,
    PRIMARY KEY (id, cash_transaction_type_id),
    FOREIGN KEY (cash_transaction_type_id) REFERENCES cash_transaction_type(id)
);

CREATE TABLE cash_transaction_type (
    id text,
    calculation_type text,
    can_be_deleted text,
    can_be_renamed text,
    category text,
    data_item_name text,
    is_exposed text,
    is_positive_operator text,
    "name" text,
    preferred_currency text,
    require_alignment text,
    require_rmv text,
    PRIMARY KEY (id)
);

CREATE TABLE valuation_iteration (
    id text,
    last_modified_date text,
    "name" text,
    "status" text,
    valuation_period text,
    PRIMARY KEY (id)
);

CREATE TABLE periodic_data_relationship (
    id text,
    periodic_data_id text,
    "type" text,
    PRIMARY KEY (id, periodic_data_id),
    FOREIGN KEY (periodic_data_id) REFERENCES periodic_data(id)
);

CREATE TABLE periodic_data (
    id text,
    as_of_date text,
    "comment" text,
    currency text,
    data_item text,
    data_source text,
    data_value_type text,
    investment text,
    is_relationship_deleted text,
    last_modified_date text,
    owner text,
    period_end text,
    period_length text,
    period_length_code text,
    relationship_path text,
    scenario text,
    security text,
    segment text,
    submitted_by text,
    submitted_date text,
    "value" text,
    PRIMARY KEY (id)
);

CREATE TABLE entity_asset (
    id text,
    acquisition_as_of text,
    acquisition_date text,
    asset_type text,
    calendar_type text,
    excel_ticker text,
    exit_as_of text,
    exit_date text,
    geography text,
    industry text,
    initial_period text,
    is_public text,
    last_modified_date text,
    lead_investment_professional text,
    long_description text,
    "name" text,
    reporting_currency text,
    short_description text,
    "status" text,
    website text,
    PRIMARY KEY (id)
);

CREATE TABLE entity_group (
    id text,
    applicable_to text,
    entities_count text,
    entity_category_type text,
    entity_group_category_data_id text,
    entity_group_category_data_type text,
    entity_ids text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE entity_fund (
    id text,
    benchmark_vintage text,
    calendar_type text,
    commitment text,
    default_pme_index text,
    default_pme_liquidity_premium text,
    description text,
    final_close_date text,
    fund_size text,
    general_partner text,
    include_in_workflow text,
    initial_close_date text,
    initial_poeriod text,
    last_modified_date text,
    long_name text,
    "name" text,
    owner_type text,
    reporting_currency text,
    "status" text,
    strategy text,
    sub_strategy text,
    total_committed_capital text,
    vintage text,
    PRIMARY KEY (id)
);

CREATE TABLE document_relationship (
    id text,
    document_id text,
    "type" text,
    PRIMARY KEY (id, document_id),
    FOREIGN KEY (document_id) REFERENCES document(id)
);

CREATE TABLE document (
    id text,
    available_for_publishing text,
    event_date text,
    is_available_to_all_users text,
    last_modified_by text,
    location text,
    period_end text,
    period_length text,
    "size" text,
    tags text,
    upload_date text,
    uploaded_by text,
    PRIMARY KEY (id)
);

CREATE TABLE currency (
    id text,
    "name" text,
    symbol text,
    PRIMARY KEY (id)
);

CREATE TABLE document_folder (
    id text,
    created_date text,
    last_modified_date text,
    "name" text,
    parent_folder_id text,
    parent_folder_type text,
    PRIMARY KEY (id)
);

CREATE TABLE segment_relationship (
    id text,
    segment_id text,
    "type" text,
    PRIMARY KEY (id, segment_id),
    FOREIGN KEY (segment_id) REFERENCES segment(id)
);

CREATE TABLE segment (
    id text,
    is_active text,
    is_allow_rollup text,
    is_global text,
    last_modified_date text,
    "name" text,
    null_replacement text,
    PRIMARY KEY (id)
);

CREATE TABLE data_item_relationship (
    id text,
    data_item_id text,
    "type" text,
    PRIMARY KEY (id, data_item_id),
    FOREIGN KEY (data_item_id) REFERENCES data_item(id)
);

CREATE TABLE data_item (
    id text,
    aggregation_null_replacement text,
    aggregation_type text,
    applied_to_all_asset text,
    calculation_type jsonb,
    category text,
    description text,
    excel_ticker text,
    exchange_rate text,
    format_type text,
    is_carrybackward text,
    is_carryover text,
    is_monetary text,
    is_number_comma_separated text,
    is_putable text,
    is_scalable text,
    last_modified_date text,
    "name" text,
    number_of_decimal_place text,
    "option" jsonb,
    rc_resolves_to text,
    value_type text,
    PRIMARY KEY (id)
);

CREATE TABLE data_item_category_relationship (
    id text,
    data_item_category_id text,
    "type" text,
    PRIMARY KEY (id, data_item_category_id),
    FOREIGN KEY (data_item_category_id) REFERENCES data_item_category(id)
);

CREATE TABLE data_item_category (
    id text,
    "name" text,
    sequence_number text,
    PRIMARY KEY (id)
);

CREATE TABLE valuation_static_detal (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE deal (
    id text,
    from_entity_data_id text,
    security_data_id text,
    to_entity_data_id text,
    acquisition_date text,
    currency text,
    deal_type text,
    exit_date text,
    from_entity_data_type text,
    investment_amount text,
    investment_name text,
    last_modified_date text,
    object_relationship_data_id text,
    object_relationship_data_type text,
    owner_name text,
    ownership text,
    security_data_type text,
    security_name text,
    "status" text,
    to_entity_data_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (from_entity_data_id) REFERENCES entity_fund(id),
    FOREIGN KEY (security_data_id) REFERENCES security(id),
    FOREIGN KEY (to_entity_data_id) REFERENCES entity_asset(id)
);

CREATE TABLE cash_transaction (
    id text,
    investment_object_data_id text,
    owner_object_data_id text,
    scenario_object_data_id text,
    security_object_data_id text,
    transaction_type_object_data_id text,
    as_of_date text,
    base_amount text,
    base_currency text,
    client text,
    client_object_data_id text,
    client_object_data_type text,
    cost_per_share text,
    custom_1 text,
    custom_2 text,
    custom_3 text,
    custom_4 text,
    custom_5 text,
    custom_6 text,
    description text,
    group_id text,
    investment text,
    investment_object_data_type text,
    last_modified_by text,
    last_modified_date text,
    local_amount text,
    local_currency text,
    original_id text,
    owner text,
    owner_object_data_type text,
    scenario text,
    scenario_object_data_type text,
    security text,
    security_object_data_type text,
    share text,
    transaction_category text,
    transaction_date text,
    transaction_type text,
    transaction_type_object_data_type text,
    "type" text,
    value_per_share text,
    PRIMARY KEY (id),
    FOREIGN KEY (investment_object_data_id) REFERENCES entity_asset(id),
    FOREIGN KEY (owner_object_data_id) REFERENCES entity_fund(id),
    FOREIGN KEY (scenario_object_data_id) REFERENCES scenario(id),
    FOREIGN KEY (security_object_data_id) REFERENCES security(id),
    FOREIGN KEY (transaction_type_object_data_id) REFERENCES cash_transaction_type(id)
);

CREATE TABLE valuation_dataitem (
    id text,
    category text,
    "name" text,
    value_type text,
    PRIMARY KEY (id)
);

CREATE TABLE security_ownership (
    entity_id text,
    security_id text,
    amount_held text,
    cost_basis text,
    entity_name text,
    shares_held text,
    PRIMARY KEY (entity_id, security_id),
    FOREIGN KEY (security_id) REFERENCES security(id)
);

CREATE TABLE security (
    id text,
    asset_data_id text,
    asset_data_type text,
    asset_name text,
    dividends_days_in_year text,
    dividends_frequency text,
    dividends_paid_upon text,
    dividends_type text,
    fundamental_authorized_option text,
    fundamental_closed_date text,
    fundamental_commencement_date text,
    fundamental_conversion_ratio_denominator text,
    fundamental_conversion_ratio_numerator text,
    fundamental_converts_to text,
    fundamental_currency text,
    fundamental_exercise_price text,
    fundamental_maturity_date text,
    fundamental_options_available_for_grant text,
    fundamental_options_issued text,
    fundamental_outstanding_principal text,
    fundamental_outstanding_share text,
    fundamental_outstanding_unit text,
    fundamental_outstanding_warrant text,
    fundamental_price_per_share text,
    has_ownership text,
    interest_days_in_year text,
    interest_frequency text,
    interest_type text,
    is_active text,
    last_modified_date text,
    liquidation_preference_price_per_share text,
    liquidation_preference_type text,
    "name" text,
    participation_include_dividends text,
    participation_price_per_share text,
    participation_type text,
    rank text,
    short_name text,
    subtype text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (asset_data_id) REFERENCES entity_asset(id)
);

CREATE TABLE scenario (
    id text,
    last_modified_date text,
    "name" text,
    short_name text,
    PRIMARY KEY (id)
);

CREATE TABLE users (
    id text,
    advanced_role jsonb,
    business_unit text,
    cell_phone text,
    department text,
    email text,
    fax text,
    federation_id text,
    first_name text,
    is_active text,
    last_modified_by text,
    last_modified_date text,
    last_name text,
    middle_name text,
    office_address text,
    phone text,
    roles jsonb,
    title text,
    PRIMARY KEY (id)
);
