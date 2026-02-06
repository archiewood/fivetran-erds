CREATE TABLE metric (
    _fivetran_id text,
    metric_id text,
    -- custom_* (dynamic column),
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE "view" (
    _fivetran_id text,
    view_id text,
    -- custom_* (dynamic column),
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE list (
    _fivetran_id text,
    list_id text,
    -- custom_* (dynamic column),
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE tables (
    _fivetran_id text,
    table_id text,
    -- custom_* (dynamic column),
    PRIMARY KEY (_fivetran_id)
);
