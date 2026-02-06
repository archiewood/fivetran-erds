CREATE TABLE ipo (
    id text,
    organization_id text,
    amount_raised_currency text,
    amount_raised_value text,
    amount_raised_value_usd text,
    created_at text,
    entity_def_id text,
    image_id text,
    permalink text,
    rank text,
    rank_ipo text,
    share_price_currency text,
    share_price_value text,
    share_price_value_usd text,
    shares_outstanding text,
    shares_sold text,
    short_description text,
    stock_exchange_symbol text,
    stock_full_symbol text,
    stock_symbol text,
    updated_at timestamp,
    valuation_currency text,
    valuation_value text,
    valuation_value_usd text,
    went_public_on text,
    PRIMARY KEY (id),
    FOREIGN KEY (organization_id) REFERENCES organisation(id)
);

CREATE TABLE funding_round (
    id text,
    funded_organization_id text,
    announced_on text,
    closed_on_precision text,
    closed_on_value text,
    created_at text,
    entity_def_id text,
    funded_organization_description text,
    funded_organization_funding_stage text,
    funded_organization_funding_total_currency text,
    funded_organization_funding_total_value text,
    funded_organization_funding_total_value_usd text,
    funded_organization_revenue_range text,
    image_id text,
    investment_stage text,
    investment_type text,
    is_equity text,
    money_raised_currency text,
    money_raised_value text,
    money_raised_value_usd text,
    "name" text,
    num_investor text,
    num_partner text,
    permalink text,
    post_money_valuation_currency text,
    post_money_valuation_value text,
    post_money_valuation_value_usd text,
    pre_money_valuation_currency text,
    pre_money_valuation_value text,
    pre_money_valuation_value_usd text,
    rank text,
    rank_funding_round text,
    short_description text,
    target_money_raised_currency text,
    target_money_raised_value text,
    target_money_raised_value_usd text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (funded_organization_id) REFERENCES organisation(id)
);

CREATE TABLE funding_round_investor_identifier (
    "type" text,
    uuid text,
    funding_round_id text,
    entity_def_id text,
    image_id text,
    permalink text,
    "role" text,
    "value" text,
    PRIMARY KEY ("type", uuid, funding_round_id),
    FOREIGN KEY (funding_round_id) REFERENCES funding_round(id)
);

CREATE TABLE funding_round_identifier (
    "type" text,
    uuid text,
    funding_round_id text,
    entity_def_id text,
    image_id text,
    location_type text,
    permalink text,
    "value" text,
    PRIMARY KEY ("type", uuid, funding_round_id),
    FOREIGN KEY (funding_round_id) REFERENCES funding_round(id)
);

CREATE TABLE job (
    id text,
    organization_id text,
    person_id text,
    created_at text,
    employee_featured_order text,
    ended_on_precision text,
    ended_on_value text,
    entity_def_id text,
    is_current text,
    job_type text,
    "name" text,
    permalink text,
    short_description text,
    started_on_precision text,
    started_on_value text,
    title text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (organization_id) REFERENCES organisation(id),
    FOREIGN KEY (person_id) REFERENCES people(id)
);

CREATE TABLE aquisition (
    id text,
    acquiree_funding_total_currency text,
    acquiree_funding_total_value text,
    acquiree_funding_total_value_usd text,
    acquiree_identifier_entity_def_id text,
    acquiree_identifier_permalink text,
    acquiree_identifier_role text,
    acquiree_identifier_uuid text,
    acquiree_identifier_value text,
    acquiree_last_funding_type text,
    acquiree_num_funding_rounds text,
    acquiree_revenue_range text,
    acquiree_short_description text,
    acquirer_funding_stage text,
    acquirer_funding_total_currency text,
    acquirer_funding_total_value text,
    acquirer_funding_total_value_usd text,
    acquirer_identifier_entity_def_id text,
    acquirer_identifier_image_id text,
    acquirer_identifier_permalink text,
    acquirer_identifier_role text,
    acquirer_identifier_uuid text,
    acquirer_identifier_value text,
    acquirer_num_funding_rounds text,
    acquirer_revenue_range text,
    acquirer_short_description text,
    acquisition_type text,
    announced_on_precision text,
    announced_on_value text,
    completed_on_precision text,
    completed_on_value text,
    created_at text,
    disposition_of_acquired text,
    entity_def_id text,
    identifier_entity_def_id text,
    identifier_image_id text,
    identifier_value text,
    permalink text,
    price_currency text,
    price_value text,
    price_value_usd text,
    rank text,
    rank_acquisition text,
    short_description text,
    "status" text,
    terms text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE aquisition_category (
    "type" text,
    uuid text,
    aquisition_id text,
    entity_def_id text,
    image_id text,
    permalink text,
    "value" text,
    PRIMARY KEY ("type", uuid, aquisition_id),
    FOREIGN KEY (aquisition_id) REFERENCES aquisition(id)
);

CREATE TABLE aquisition_location (
    "type" text,
    uuid text,
    aquisition_id text,
    entity_def_id text,
    location_type text,
    permalink text,
    "value" text,
    PRIMARY KEY ("type", uuid, aquisition_id),
    FOREIGN KEY (aquisition_id) REFERENCES aquisition(id)
);

CREATE TABLE organisation_facet (
    "index" text,
    organisation_id text,
    facet text,
    PRIMARY KEY ("index", organisation_id),
    FOREIGN KEY (organisation_id) REFERENCES organisation(id)
);

CREATE TABLE organisation_hub_tag (
    "index" text,
    organisation_id text,
    hub_tag text,
    PRIMARY KEY ("index", organisation_id),
    FOREIGN KEY (organisation_id) REFERENCES organisation(id)
);

CREATE TABLE organisation_alias (
    "index" text,
    organisation_id text,
    alias text,
    PRIMARY KEY ("index", organisation_id),
    FOREIGN KEY (organisation_id) REFERENCES organisation(id)
);

CREATE TABLE organisation_permalink_alias (
    "index" text,
    organisation_id text,
    permalink_alias text,
    PRIMARY KEY ("index", organisation_id),
    FOREIGN KEY (organisation_id) REFERENCES organisation(id)
);

CREATE TABLE organisation_investor_stage (
    "index" text,
    organisation_id text,
    investor_stage text,
    PRIMARY KEY ("index", organisation_id),
    FOREIGN KEY (organisation_id) REFERENCES organisation(id)
);

CREATE TABLE organisation_investor_type (
    "index" text,
    organisation_id text,
    investor_type text,
    PRIMARY KEY ("index", organisation_id),
    FOREIGN KEY (organisation_id) REFERENCES organisation(id)
);

CREATE TABLE organisation_investor_identifier (
    uuid text,
    organisation_id text,
    investor_identifier_uuid text,
    entity_def_id text,
    image_id text,
    permalink text,
    "value" text,
    PRIMARY KEY (uuid, organisation_id),
    FOREIGN KEY (organisation_id) REFERENCES organisation(id),
    FOREIGN KEY (investor_identifier_uuid) REFERENCES investment(id)
);

CREATE TABLE organisation (
    id text,
    acquirer_identifier_uuid text,
    company_type text,
    contact_email text,
    created_at text,
    demo_day text,
    description text,
    entity_def_id text,
    equity_funding_total_currency text,
    equity_funding_total_value text,
    equity_funding_total_value_usd text,
    exited_on_precision text,
    exited_on_value text,
    facebook_value text,
    founded_on_precision text,
    founded_on_value text,
    funding_stage text,
    funding_total_currency text,
    funding_total_value text,
    funding_total_value_usd text,
    funds_total_currency text,
    funds_total_value text,
    funds_total_value_usd text,
    image_id text,
    image_url text,
    ipo_status text,
    last_equity_funding_total_currency text,
    last_equity_funding_total_value text,
    last_equity_funding_total_value_usd text,
    last_funding_at text,
    last_funding_total_currency text,
    last_funding_total_value text,
    last_funding_total_value_usd text,
    last_funding_type text,
    layout_id text,
    legal_name text,
    linkedin_value text,
    listed_stock_symbol text,
    "name" text,
    num_acquisition text,
    num_alumni text,
    num_article text,
    num_current_advisor_position text,
    num_current_position text,
    num_diversity_spotlight_investment text,
    num_employees_enum text,
    num_enrollments text,
    num_event_appearance text,
    num_exit text,
    num_exits_ipo text,
    num_founder text,
    num_founder_alumni text,
    num_fund text,
    num_funding_round text,
    num_investment text,
    num_investor text,
    num_lead_investment text,
    num_lead_investor text,
    num_past_position text,
    num_portfolio_organization text,
    num_sub_organization text,
    operating_status text,
    owner_identifier_entity_def_id text,
    owner_identifier_image_id text,
    owner_identifier_permalink text,
    owner_identifier_uuid text,
    owner_identifier_value text,
    permalink text,
    phone_number text,
    program_application_deadline text,
    program_duration text,
    program_type text,
    rank text,
    rank_delta_d_30 text,
    rank_delta_d_7 text,
    rank_delta_d_90 text,
    rank_org text,
    rank_principal text,
    revenue_range text,
    school_method text,
    school_program text,
    school_type text,
    short_description text,
    "status" text,
    stock_exchange_symbol text,
    stock_symbol_entity_def_id text,
    stock_symbol_image_id text,
    stock_symbol_permalink text,
    stock_symbol_uuid text,
    stock_symbol_value text,
    twitter_value text,
    updated_at text,
    valuation_currency text,
    valuation_date text,
    valuation_value text,
    valuation_value_usd text,
    website_url text,
    website_value text,
    went_public_on text,
    PRIMARY KEY (id),
    FOREIGN KEY (acquirer_identifier_uuid) REFERENCES aquisition(id)
);

CREATE TABLE organisation_identifier (
    "type" text,
    uuid text,
    organisation_id text,
    entity_def_id text,
    image_id text,
    location_type text,
    permalink text,
    "value" text,
    PRIMARY KEY ("type", uuid, organisation_id),
    FOREIGN KEY (organisation_id) REFERENCES organisation(id)
);

CREATE TABLE investment_investor_type (
    "index" text,
    investment_id text,
    investor_type text,
    PRIMARY KEY ("index", investment_id),
    FOREIGN KEY (investment_id) REFERENCES investment(id)
);

CREATE TABLE investment_investor_stage (
    "index" text,
    investment_id text,
    investor_stage text,
    PRIMARY KEY ("index", investment_id),
    FOREIGN KEY (investment_id) REFERENCES investment(id)
);

CREATE TABLE investment_partner_identifier (
    uuid text,
    investment_id text,
    entity_def_id text,
    image_id text,
    permalink text,
    "value" text,
    PRIMARY KEY (uuid, investment_id),
    FOREIGN KEY (investment_id) REFERENCES investment(id)
);

CREATE TABLE investment (
    id text,
    funding_round_id text,
    organization_id text,
    announced_on text,
    created_at text,
    entity_def_id text,
    funding_round_investment_type text,
    funding_round_money_raised_currency text,
    funding_round_money_raised_value text,
    funding_round_money_raised_value_usd text,
    investor_identifier_entity_def_id text,
    investor_identifier_image_id text,
    investor_identifier_permalink text,
    investor_identifier_uuid text,
    investor_identifier_value text,
    is_lead_investor text,
    "name" text,
    permalink text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (funding_round_id) REFERENCES funding_round(id),
    FOREIGN KEY (organization_id) REFERENCES organisation(id)
);

CREATE TABLE people_permalink_alias (
    "index" text,
    people_id text,
    permalink_alias text,
    PRIMARY KEY ("index", people_id),
    FOREIGN KEY (people_id) REFERENCES people(id)
);

CREATE TABLE people_alias (
    "index" text,
    people_id text,
    alias text,
    PRIMARY KEY ("index", people_id),
    FOREIGN KEY (people_id) REFERENCES people(id)
);

CREATE TABLE people_facet (
    "index" text,
    people_id text,
    facet text,
    PRIMARY KEY ("index", people_id),
    FOREIGN KEY (people_id) REFERENCES people(id)
);

CREATE TABLE people_investor_type (
    "index" text,
    people_id text,
    investor_type text,
    PRIMARY KEY ("index", people_id),
    FOREIGN KEY (people_id) REFERENCES people(id)
);

CREATE TABLE people_investor_stage (
    "index" text,
    people_id text,
    investor_stage text,
    PRIMARY KEY ("index", people_id),
    FOREIGN KEY (people_id) REFERENCES people(id)
);

CREATE TABLE people (
    id text,
    primary_organization_id text,
    born_on text,
    created_at text,
    description text,
    entity_def_id text,
    facebook_value text,
    first_name text,
    gender text,
    image_id text,
    image_url text,
    last_name text,
    layout_id text,
    linkedin_value text,
    middle_name text,
    "name" text,
    num_article text,
    num_current_advisor_job text,
    num_current_job text,
    num_diversity_spotlight_investment text,
    num_event_appearance text,
    num_exit text,
    num_exits_acquisition text,
    num_exits_ipo text,
    num_founded_organization text,
    num_investment text,
    num_job text,
    num_lead_investment text,
    num_partner_investment text,
    num_past_advisor_job text,
    num_past_job text,
    num_portfolio_organization text,
    permalink text,
    primary_job_title text,
    rank text,
    rank_delta_d_30 text,
    rank_delta_d_7 text,
    rank_delta_d_90 text,
    rank_person text,
    rank_principal text,
    short_description text,
    started_on_precision text,
    started_on_value text,
    twitter_value text,
    updated_at text,
    website_url text,
    website_value text,
    PRIMARY KEY (id),
    FOREIGN KEY (primary_organization_id) REFERENCES organisation(id)
);

CREATE TABLE people_loaction_identifier (
    "type" text,
    uuid text,
    people_id text,
    entity_def_id text,
    location_type text,
    permalink text,
    "value" text,
    PRIMARY KEY ("type", uuid, people_id),
    FOREIGN KEY (people_id) REFERENCES people(id)
);
