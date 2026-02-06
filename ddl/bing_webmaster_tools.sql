CREATE TABLE query_statistics (
    _fivetran_id text,
    avg_click_position text,
    avg_impression_position text,
    clicks text,
    "date" text,
    impressions text,
    query text,
    "type" text,
    url text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE keyword_statistics (
    _fivetran_id text,
    broad_impressions text,
    "date" text,
    impressions text,
    query text,
    "type" text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE page_statistics (
    _fivetran_id text,
    avg_click_position text,
    avg_impression_position text,
    clicks text,
    "date" text,
    impressions text,
    query text,
    "type" text,
    url text,
    PRIMARY KEY (_fivetran_id)
);
