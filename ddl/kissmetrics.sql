CREATE TABLE report (
    id text,
    product_id text,
    "name" text,
    report_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE product (
    id text,
    account_id text,
    "name" text,
    timezone text,
    PRIMARY KEY (id)
);

CREATE TABLE property (
    id text,
    product_id text,
    first_sent_at text,
    first_used_at text,
    last_sent_at text,
    last_used_at text,
    "name" text,
    total text,
    visible text,
    PRIMARY KEY (id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE event (
    id text,
    product_id text,
    first_sent_at text,
    first_used_at text,
    last_sent_at text,
    last_used_at text,
    "name" text,
    total text,
    visible text,
    PRIMARY KEY (id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);
