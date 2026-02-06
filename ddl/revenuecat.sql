CREATE TABLE app (
    id text,
    project_id text,
    amazon_package_name text,
    app_store_bundle_id text,
    created_at text,
    mac_app_store_store_bundle_id text,
    "name" text,
    play_store_store_bundle_id text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE package_product (
    offering_id text,
    package_id text,
    product_id text,
    eligibility_criteria text,
    PRIMARY KEY (offering_id, package_id, product_id),
    FOREIGN KEY (offering_id) REFERENCES package(offering_id),
    FOREIGN KEY (package_id) REFERENCES package(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE package (
    id text,
    offering_id text,
    project_id text,
    created_at text,
    display_name text,
    lookup_key text,
    object text,
    "position" text,
    PRIMARY KEY (id, offering_id),
    FOREIGN KEY (offering_id) REFERENCES offering(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE offering (
    id text,
    project_id text,
    created_at text,
    display_name text,
    is_current text,
    lookup_key text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE project (
    id text,
    created_at text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE entitlement_product (
    entitlement_id text,
    product_id text,
    PRIMARY KEY (entitlement_id, product_id),
    FOREIGN KEY (entitlement_id) REFERENCES entitlement(id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE entitlement (
    id text,
    project_id text,
    created_at text,
    display_name text,
    lookup_key text,
    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE product (
    id text,
    app_id text,
    project_id text,
    created_at text,
    display_name text,
    store_identifier text,
    subscription_duration text,
    subscription_grace_period_duration text,
    subscription_trial_duration text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (app_id) REFERENCES app(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE metric_overview (
    id text,
    project_id text,
    description text,
    last_updated_at text,
    last_updated_at_iso_8601 text,
    "name" text,
    period text,
    unit text,
    "value" text,
    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);
