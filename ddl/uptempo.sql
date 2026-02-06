CREATE TABLE finance_cell (
    "index" text,
    finance_fivetran_id text,
    column_name text,
    "value" text,
    PRIMARY KEY ("index", finance_fivetran_id),
    FOREIGN KEY (finance_fivetran_id) REFERENCES finance(_fivetran_id)
);

CREATE TABLE finance_allocation (
    "index" text,
    finance_fivetran_id text,
    amortization jsonb,
    budget_id text,
    budget_item_id text,
    percentage text,
    roll_over text,
    roll_under text,
    split_id text,
    PRIMARY KEY ("index", finance_fivetran_id),
    FOREIGN KEY (finance_fivetran_id) REFERENCES finance(_fivetran_id)
);

CREATE TABLE finance (
    _fivetran_id text,
    amount text,
    conflicted text,
    end_date text,
    id text,
    imported text,
    po_number text,
    start_date text,
    "status" text,
    "type" text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE line_item_cell (
    "index" text,
    line_item_id text,
    approval_status text,
    column_name text,
    "comment" text,
    lock_enabled text,
    locked text,
    tag_id text,
    "value" text,
    PRIMARY KEY ("index", line_item_id),
    FOREIGN KEY (line_item_id) REFERENCES line_item(id)
);

CREATE TABLE line_item (
    id text,
    activity_id text,
    budget_id text,
    carryover text,
    created_date text,
    has_manually_allocated_investment text,
    locked text,
    "name" text,
    parent_id text,
    persistent_id text,
    scenario_id text,
    "type" text,
    updated_date text,
    PRIMARY KEY (id)
);
