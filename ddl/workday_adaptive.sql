CREATE TABLE dimension_value_property (
    id bigint,
    dimension_id bigint,
    dimension_value_id bigint,
    "name" text,
    "value" double precision,
    PRIMARY KEY (id, dimension_id, dimension_value_id),
    FOREIGN KEY (dimension_id) REFERENCES dimension(id),
    FOREIGN KEY (dimension_value_id) REFERENCES dimension_value(id)
);

CREATE TABLE dimension_value_attribute_mapping (
    attribute_id bigint,
    dimension_id bigint,
    dimension_value_id bigint,
    value_id bigint,
    PRIMARY KEY (attribute_id, dimension_id, dimension_value_id, value_id),
    FOREIGN KEY (attribute_id) REFERENCES attribute(id),
    FOREIGN KEY (dimension_id) REFERENCES dimension(id),
    FOREIGN KEY (dimension_value_id) REFERENCES dimension_value(id),
    FOREIGN KEY (value_id) REFERENCES attribute_value(id)
);

CREATE TABLE dimension_value (
    id bigint,
    code text,
    description text,
    display_name text,
    "name" text,
    short_name text,
    PRIMARY KEY (id)
);

CREATE TABLE account (
    id bigint,
    parent_id bigint,
    account_type_code text,
    actuals_by text,
    balance_type text,
    code text,
    data_entry_type text,
    data_privacy text,
    decimal_precision integer,
    description text,
    display_as text,
    enable_actuals boolean,
    exchange_rate_type text,
    has_formula boolean,
    has_salary_detail boolean,
    is_assumption boolean,
    is_breakback_eligible boolean,
    is_contra boolean,
    is_default_root boolean,
    is_group boolean,
    is_importable boolean,
    is_intercompany boolean,
    is_linked boolean,
    is_system boolean,
    level_dim_rollup text,
    level_dim_weight_acct_id integer,
    "name" text,
    owning_sheet_id text,
    plan_by text,
    rollup_text text,
    short_name text,
    start_expanded boolean,
    sub_type text,
    suppress_zeroes boolean,
    time_rollup text,
    time_stratum text,
    time_weight_acct_id integer,
    PRIMARY KEY (id),
    FOREIGN KEY (parent_id) REFERENCES account(id)
);

CREATE TABLE dimension (
    id bigint,
    auto_create boolean,
    code text,
    description text,
    display_name_type text,
    keep_sorted boolean,
    list_dimension boolean,
    "name" text,
    seq_no integer,
    short_name text,
    use_on_levels boolean,
    PRIMARY KEY (id)
);

CREATE TABLE "level" (
    id bigint,
    parent_id bigint,
    available_start text,
    code text,
    currency text,
    description text,
    display_name text,
    has_children boolean,
    is_elimination boolean,
    is_importable boolean,
    is_linked boolean,
    "name" text,
    publish_currency text,
    short_name text,
    workflow_status text,
    PRIMARY KEY (id),
    FOREIGN KEY (parent_id) REFERENCES "level"(id)
);

CREATE TABLE account_attribute_mapping (
    account_id bigint,
    attribute_id bigint,
    value_id bigint,
    PRIMARY KEY (account_id, attribute_id, value_id),
    FOREIGN KEY (account_id) REFERENCES account(id),
    FOREIGN KEY (attribute_id) REFERENCES attribute(id),
    FOREIGN KEY (value_id) REFERENCES attribute_value(id)
);

CREATE TABLE level_attribute_mapping (
    attribute_id bigint,
    level_id bigint,
    value_id bigint,
    PRIMARY KEY (attribute_id, level_id, value_id),
    FOREIGN KEY (attribute_id) REFERENCES attribute(id),
    FOREIGN KEY (level_id) REFERENCES "level"(id),
    FOREIGN KEY (value_id) REFERENCES attribute_value(id)
);

CREATE TABLE currency (
    id bigint,
    code text,
    description text,
    is_corporate_currency boolean,
    is_reporting_currency boolean,
    precision integer,
    user_defined boolean,
    PRIMARY KEY (id)
);

CREATE TABLE attribute (
    id bigint,
    auto_create boolean,
    code text,
    dimension_id bigint,
    display_name_type text,
    keep_sorted boolean,
    "name" text,
    seq_no text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE attribute_value (
    id bigint,
    attribute_id bigint,
    parent_id bigint,
    code text,
    description text,
    display_name text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (attribute_id) REFERENCES attribute(id),
    FOREIGN KEY (parent_id) REFERENCES attribute_value(id)
);

CREATE TABLE dimension_value_mapping (
    dimension_id bigint,
    dimension_value_id bigint,
    PRIMARY KEY (dimension_id, dimension_value_id),
    FOREIGN KEY (dimension_id) REFERENCES dimension(id),
    FOREIGN KEY (dimension_value_id) REFERENCES dimension_value(id)
);

CREATE TABLE custom_report (
    account_code text,
    account_name text,
    custom_dimensions_ text,
    level_name text,
    "time" text,
    version_name text,
    "value" double precision,
    PRIMARY KEY (account_code, account_name, custom_dimensions_, level_name, "time", version_name)
);

CREATE TABLE version (
    id bigint,
    parent_id bigint,
    completed_values_thru text,
    description text,
    enabled_for_workflow boolean,
    end_plan text,
    end_ver text,
    has_audit_trail boolean,
    is_default_version boolean,
    is_importable boolean,
    is_locked boolean,
    is_predictive boolean,
    is_virtual boolean,
    left_scroll text,
    lock_leading text,
    "name" text,
    short_name text,
    start_plan text,
    start_scroll text,
    start_ver text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (parent_id) REFERENCES version(id)
);
