CREATE TABLE account (
    id text,
    "name" text,
    "zone" text,
    PRIMARY KEY (id)
);

CREATE TABLE report (
    _fivetran_id text,
    account_id text,
    ad_id text,
    ad_name text,
    adset_id text,
    adset_name text,
    campaign_id text,
    campaign_name text,
    cash_cost text,
    click text,
    ds text,
    event text,
    gift_cost text,
    impression text,
    install text,
    optimization_event text,
    revenue_type text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);
