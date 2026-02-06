CREATE TABLE report_action_list (
    _fivetran_id text,
    report_id text,
    account_email text,
    "action" text,
    created text,
    message text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (report_id) REFERENCES report(id)
);

CREATE TABLE report (
    id text,
    old_report_id text,
    policy_id text,
    account_email text,
    account_id text,
    action_list text,
    approved text,
    created text,
    currency text,
    entry_id text,
    is_ach_reimbursed text,
    manager_first_name text,
    manager_full_name text,
    manager_last_name text,
    manager_payroll_id text,
    manager_user_id text,
    reimbursed text,
    report_field_name text,
    report_name text,
    "status" text,
    submitted text,
    submitter_first_name text,
    submitter_full_name text,
    submitter_last_name text,
    total text,
    PRIMARY KEY (id),
    FOREIGN KEY (old_report_id) REFERENCES report(id),
    FOREIGN KEY (policy_id) REFERENCES policy(id)
);

CREATE TABLE report_approver (
    _fivetran_id text,
    employee_user_id text,
    report_id text,
    "date" text,
    email text,
    employee_payroll_id text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (employee_user_id) REFERENCES policy_employee(employee_id),
    FOREIGN KEY (report_id) REFERENCES report(id)
);

CREATE TABLE expense_attendee (
    email text,
    transaction_id text,
    display_name text,
    thumbnail text,
    PRIMARY KEY (email, transaction_id),
    FOREIGN KEY (transaction_id) REFERENCES expense(transaction_id)
);

CREATE TABLE policy_report_field (
    "index" text,
    _fivetran_id text,
    "name" text,
    "type" text,
    values jsonb,
    PRIMARY KEY ("index", _fivetran_id),
    FOREIGN KEY (_fivetran_id) REFERENCES policy(_fivetran_id)
);

CREATE TABLE policy_category (
    "index" text,
    _fivetran_id text,
    enabled text,
    "name" text,
    PRIMARY KEY ("index", _fivetran_id),
    FOREIGN KEY (_fivetran_id) REFERENCES policy(_fivetran_id)
);

CREATE TABLE policy_tag (
    "index" text,
    _fivetran_id text,
    enabled text,
    gl_code text,
    "name" text,
    PRIMARY KEY ("index", _fivetran_id),
    FOREIGN KEY (_fivetran_id) REFERENCES policy(_fivetran_id)
);

CREATE TABLE policy_tax_rate (
    "index" text,
    _fivetran_id text,
    "name" text,
    "type" text,
    values jsonb,
    PRIMARY KEY ("index", _fivetran_id),
    FOREIGN KEY (_fivetran_id) REFERENCES policy(_fivetran_id)
);

CREATE TABLE policy_employee (
    "index" text,
    _fivetran_id text,
    email text,
    employee_id text,
    "role" text,
    submits_to text,
    PRIMARY KEY ("index", _fivetran_id),
    FOREIGN KEY (_fivetran_id) REFERENCES policy(_fivetran_id)
);

CREATE TABLE policy (
    _fivetran_id text,
    id text,
    default_tax text,
    "name" text,
    output_currency text,
    owner text,
    "role" text,
    tax_name text,
    "type" text,
    PRIMARY KEY (_fivetran_id, id)
);

CREATE TABLE expense (
    transaction_id text,
    original_transaction_id text,
    report_id text,
    amount text,
    bank text,
    billable text,
    category text,
    category_gl_code text,
    category_payroll_code text,
    "comment" text,
    created text,
    currency text,
    currency_conversion_rate text,
    has_tax text,
    inserted text,
    mcc text,
    merchant text,
    modified_amount text,
    modified_created text,
    modified_mcc text,
    modified_merchant text,
    modified_tax_amount text,
    ntag_x text,
    ntag_xgl_code text,
    receipt_filename text,
    receipt_id text,
    receipt_small_thumbnail text,
    receipt_thumbnail text,
    receipt_transaction_id text,
    receipt_type text,
    receipt_url text,
    reimbursable text,
    tag_gl_code text,
    tags text,
    tax_amount text,
    tax_code text,
    tax_name text,
    tax_rate text,
    tax_rate_name text,
    "type" text,
    unit text,
    unit_count text,
    unit_rate text,
    PRIMARY KEY (transaction_id),
    FOREIGN KEY (original_transaction_id) REFERENCES expense(transaction_id),
    FOREIGN KEY (report_id) REFERENCES report(id)
);
