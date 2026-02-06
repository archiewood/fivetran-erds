CREATE TABLE gl_data (
    _fivetran_id text,
    fiscal_month text,
    fiscal_year text,
    month_name text,
    mtd_amount text,
    qtd_amount text,
    reporting text,
    scenario text,
    segment_1 text,
    segment_2 text,
    segment_3 text,
    segment_4 text,
    segment_5 text,
    segment_6 text,
    segment_7 text,
    segment_8 text,
    ytd_amount text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE segment_3_data_rollup_level (
    "index" text,
    segment_3_data_member_id text,
    code text,
    id text,
    "level" text,
    "name" text,
    PRIMARY KEY ("index", segment_3_data_member_id),
    FOREIGN KEY (segment_3_data_member_id) REFERENCES segment_3_data(member_id)
);

CREATE TABLE segment_3_data (
    member_id text,
    active_status text,
    attributes text,
    code text,
    member_type text,
    "name" text,
    parent_code text,
    parent_id text,
    rollup_operator text,
    sort text,
    PRIMARY KEY (member_id)
);

CREATE TABLE segment_7_data_rollup_level (
    "index" text,
    segment_7_data_member_id text,
    code text,
    id text,
    "level" text,
    "name" text,
    PRIMARY KEY ("index", segment_7_data_member_id),
    FOREIGN KEY (segment_7_data_member_id) REFERENCES segment_7_data(member_id)
);

CREATE TABLE segment_7_data (
    member_id text,
    active_status text,
    attributes text,
    code text,
    member_type text,
    "name" text,
    parent_code text,
    parent_id text,
    rollup_operator text,
    sort text,
    PRIMARY KEY (member_id)
);

CREATE TABLE segment_5_data_rollup_level (
    "index" text,
    segment_5_data_member_id text,
    code text,
    id text,
    "level" text,
    "name" text,
    PRIMARY KEY ("index", segment_5_data_member_id),
    FOREIGN KEY (segment_5_data_member_id) REFERENCES segment_5_data(member_id)
);

CREATE TABLE segment_5_data (
    member_id text,
    active_status text,
    attributes text,
    code text,
    member_type text,
    "name" text,
    parent_code text,
    parent_id text,
    rollup_operator text,
    sort text,
    PRIMARY KEY (member_id)
);

CREATE TABLE segment_2_data_rollup_level (
    "index" text,
    segment_2_data_member_id text,
    code text,
    id text,
    "level" text,
    "name" text,
    PRIMARY KEY ("index", segment_2_data_member_id),
    FOREIGN KEY (segment_2_data_member_id) REFERENCES segment_2_data(member_id)
);

CREATE TABLE segment_2_data (
    member_id text,
    active_status text,
    attributes text,
    code text,
    currency_code text,
    currency_name text,
    member_type text,
    "name" text,
    parent_code text,
    parent_id text,
    rollup_operator text,
    sort text,
    PRIMARY KEY (member_id)
);

CREATE TABLE rule_gl (
    id text,
    load_item text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE segment_1_data_rollup_level (
    "index" text,
    segment_1_data_member_id text,
    code text,
    id text,
    "level" text,
    "name" text,
    PRIMARY KEY ("index", segment_1_data_member_id),
    FOREIGN KEY (segment_1_data_member_id) REFERENCES segment_1_data(member_id)
);

CREATE TABLE segment_1_data (
    member_id text,
    account_group text,
    account_type text,
    active_status text,
    attributes text,
    code text,
    credit_debit text,
    currency_type_code text,
    currency_type_name text,
    member_type text,
    "name" text,
    normal_data_input text,
    parent_code text,
    parent_member_code text,
    parent_member_id text,
    parent_member_label text,
    parent_member_name text,
    report_category_name text,
    rollup_operator text,
    sort text,
    trial_balance_account text,
    variance text,
    PRIMARY KEY (member_id)
);

CREATE TABLE segment_8_data_rollup_level (
    "index" text,
    segment_8_data_member_id text,
    code text,
    id text,
    "level" text,
    "name" text,
    PRIMARY KEY ("index", segment_8_data_member_id),
    FOREIGN KEY (segment_8_data_member_id) REFERENCES segment_8_data(member_id)
);

CREATE TABLE segment_8_data (
    member_id text,
    active_status text,
    attributes text,
    code text,
    member_type text,
    "name" text,
    parent_code text,
    parent_id text,
    rollup_operator text,
    sort text,
    PRIMARY KEY (member_id)
);

CREATE TABLE segment_4_data_rollup_level (
    "index" text,
    segment_4_data_member_id text,
    code text,
    id text,
    "level" text,
    "name" text,
    PRIMARY KEY ("index", segment_4_data_member_id),
    FOREIGN KEY (segment_4_data_member_id) REFERENCES segment_4_data(member_id)
);

CREATE TABLE segment_4_data (
    member_id text,
    active_status text,
    attributes text,
    code text,
    member_type text,
    "name" text,
    parent_code text,
    parent_id text,
    rollup_operator text,
    sort text,
    PRIMARY KEY (member_id)
);

CREATE TABLE segment_6_data_rollup_level (
    "index" text,
    segment_6_data_member_id text,
    code text,
    id text,
    "level" text,
    "name" text,
    PRIMARY KEY ("index", segment_6_data_member_id),
    FOREIGN KEY (segment_6_data_member_id) REFERENCES segment_6_data(member_id)
);

CREATE TABLE segment_6_data (
    member_id text,
    active_status text,
    attributes text,
    code text,
    member_type text,
    "name" text,
    parent_code text,
    parent_id text,
    rollup_operator text,
    sort text,
    PRIMARY KEY (member_id)
);
