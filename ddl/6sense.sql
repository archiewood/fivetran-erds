CREATE TABLE company_segment_list (
    id text,
    company_domain text,
    "name" text,
    PRIMARY KEY (id, company_domain),
    FOREIGN KEY (company_domain) REFERENCES company(domain)
);

CREATE TABLE company_score (
    _fivetran_id text,
    company_domain text,
    buying_stage text,
    intent_score text,
    is_6_qa text,
    product text,
    product_display_name text,
    profile_fit text,
    profile_score text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (company_domain) REFERENCES company(domain)
);

CREATE TABLE company_sub_industry (
    _fivetran_id text,
    company_domain text,
    industry text,
    sub_industry text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (company_domain) REFERENCES company(domain)
);

CREATE TABLE company (
    domain text,
    additional_comment text,
    address text,
    annual_revenue text,
    city text,
    confidence text,
    country text,
    country_iso_code text,
    employee_count text,
    employee_range text,
    geo_ip_city text,
    geo_ip_country text,
    geo_ip_state text,
    industry text,
    is_6_qa text,
    is_blacklisted text,
    match text,
    naics text,
    naics_description text,
    "name" text,
    phone text,
    region text,
    revenue_range text,
    segment_id jsonb,
    segment_name jsonb,
    sic text,
    sic_description text,
    "state" text,
    state_code text,
    zip text,
    PRIMARY KEY (domain)
);
