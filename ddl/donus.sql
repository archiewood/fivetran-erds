CREATE TABLE payment (
    id text,
    grantee_name text,
    member_id text,
    promise_id text,
    bank_account_code text,
    code text,
    deposit_date text,
    income_status text,
    "name" text,
    pay_date text,
    pay_method_code text,
    pay_method_type text,
    pay_price text,
    product_code text,
    purpose_code text,
    PRIMARY KEY (id),
    FOREIGN KEY (grantee_name) REFERENCES grants(grantee_name),
    FOREIGN KEY (member_id) REFERENCES member(id),
    FOREIGN KEY (promise_id) REFERENCES promise(id)
);

CREATE TABLE member_group (
    "index" text,
    member_id text,
    group_id text,
    PRIMARY KEY ("index", member_id),
    FOREIGN KEY (member_id) REFERENCES member(id)
);

CREATE TABLE grants_report (
    id text,
    grantee_name text,
    apply_price text,
    approve_date text,
    image_description text,
    image_url text,
    operating_cost text,
    performance_summary text,
    program_category_1 text,
    program_category_2 text,
    program_end_date text,
    program_name text,
    program_start_date text,
    program_unit_1 text,
    program_unit_2 text,
    program_unit_3 text,
    program_unit_detail text,
    project_cost text,
    quantitative_performance_1 text,
    quantitative_performance_2 text,
    PRIMARY KEY (id),
    FOREIGN KEY (grantee_name) REFERENCES grants(grantee_name)
);

CREATE TABLE grants (
    id text,
    apply_code text,
    apply_price text,
    bank_account text,
    bank_account_owner text,
    bank_code text,
    business_no text,
    business_type text,
    expense_status text,
    fund_account_count text,
    fund_account_first_donor text,
    grantee_code text,
    grantee_email text,
    grantee_id text,
    grantee_name text,
    grantee_type text,
    pay_date text,
    paymethod_type text,
    person_birthday text,
    president_name text,
    program_name text,
    staff_cellphone text,
    PRIMARY KEY (id)
);

CREATE TABLE promise (
    id text,
    product_code text,
    member_id text,
    code text,
    "comment" text,
    last_pay_date text,
    memo text,
    "status" text,
    total_pay_price text,
    PRIMARY KEY (id, product_code),
    FOREIGN KEY (product_code) REFERENCES payment(product_code),
    FOREIGN KEY (member_id) REFERENCES member(id)
);

CREATE TABLE member (
    id text,
    active_date text,
    agree_email text,
    agree_post text,
    agree_tel text,
    agree_text text,
    cellphone text,
    code text,
    email text,
    lapse_date text,
    last_pay_date text,
    lifecycle text,
    "name" text,
    total_pay_count text,
    total_price text,
    PRIMARY KEY (id)
);
