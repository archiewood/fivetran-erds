CREATE TABLE orders_journey (
    "index" text,
    order_id text,
    event text,
    "path" text,
    product_id text,
    "time" text,
    PRIMARY KEY ("index", order_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

CREATE TABLE orders (
    order_id text,
    created_at text,
    currency text,
    customer_id text,
    order_name text,
    total_price text,
    PRIMARY KEY (order_id)
);

CREATE TABLE orders_attribution (
    "index" text,
    "type" text,
    order_id text,
    ad_id text,
    adset_id text,
    campaign_id text,
    click_date text,
    "source" text,
    PRIMARY KEY ("index", "type", order_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

CREATE TABLE summary_page_service (
    "index" text,
    summary_page_id text,
    service text,
    PRIMARY KEY ("index", summary_page_id),
    FOREIGN KEY (summary_page_id) REFERENCES summary_page(id)
);

CREATE TABLE summary_page (
    id text,
    deltas text,
    metric_id text,
    tip text,
    title text,
    "type" text,
    values_current text,
    values_previous text,
    PRIMARY KEY (id)
);

CREATE TABLE summary_page_chart (
    "index" text,
    "type" text,
    summary_page_id text,
    x text,
    y text,
    PRIMARY KEY ("index", "type", summary_page_id),
    FOREIGN KEY (summary_page_id) REFERENCES summary_page(id)
);
