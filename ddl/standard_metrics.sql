CREATE TABLE metrics (
    _fivetran_id text,
    category_id text,
    company_id text,
    budget_id text,
    cadence text,
    converted_value text,
    currency text,
    "date" text,
    detailed_source text,
    fx_rate text,
    is_budget_metric text,
    preferred_currency text,
    updated_at text,
    "value" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (category_id) REFERENCES metrics_option(category_id),
    FOREIGN KEY (company_id) REFERENCES company(id)
);

CREATE TABLE budget (
    id text,
    company_id text,
    company_slug text,
    company text,
    "date" text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (company_slug) REFERENCES company(slug)
);

CREATE TABLE metrics_option (
    category_id text,
    category_name text,
    description text,
    is_archived text,
    is_point_in_time text,
    is_standard text,
    "type" text,
    PRIMARY KEY (category_id)
);

CREATE TABLE company (
    id text,
    city text,
    description text,
    firm_sector text,
    fiscal_year_end text,
    logo_url text,
    "name" text,
    sector text,
    slug text,
    "status" text,
    website text,
    PRIMARY KEY (id)
);

CREATE TABLE custom_column_select (
    company_id text,
    id text,
    "name" text,
    "type" text,
    "value" text,
    value_color text,
    value_id text,
    PRIMARY KEY (company_id, id),
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (id) REFERENCES custom_column_option(id)
);

CREATE TABLE custom_column_text (
    company_id text,
    id text,
    "name" text,
    "type" text,
    "value" text,
    PRIMARY KEY (company_id, id),
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (id) REFERENCES custom_column_option(id)
);

CREATE TABLE custom_column_multi_select (
    value_id text,
    company_id text,
    id text,
    "name" text,
    "type" text,
    "value" text,
    value_color text,
    PRIMARY KEY (value_id, company_id, id),
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (id) REFERENCES custom_column_option(id)
);

CREATE TABLE note (
    id text,
    author_id text,
    company_id text,
    author text,
    created_at text,
    note jsonb,
    PRIMARY KEY (id),
    FOREIGN KEY (author_id) REFERENCES users(id),
    FOREIGN KEY (company_id) REFERENCES company(id)
);

CREATE TABLE custom_column_option_option (
    id text,
    custom_column_option_id text,
    color text,
    "value" text,
    PRIMARY KEY (id, custom_column_option_id),
    FOREIGN KEY (custom_column_option_id) REFERENCES custom_column_option(id)
);

CREATE TABLE custom_column_option (
    id text,
    "name" text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE users (
    id text,
    email text,
    first_name text,
    last_name text,
    PRIMARY KEY (id)
);
