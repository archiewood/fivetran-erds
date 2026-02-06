CREATE TABLE domain (
    id text,
    case_sensitive boolean,
    client_storage text,
    cloaking boolean,
    created_at timestamp,
    export_enabled boolean,
    hide_referer boolean,
    hide_visitor_ip boolean,
    hostname text,
    https_level text,
    https_links boolean,
    increment_counter text,
    integration_adroll text,
    integration_fb text,
    integration_ga text,
    integration_gtm text,
    is_favorite boolean,
    last_purge_date timestamp,
    link_type text,
    provider text,
    purge_expired_links boolean,
    redirect_404 text,
    robots text,
    segment_key text,
    setup_type text,
    "state" text,
    support_deprecated_link_id boolean,
    team_id text,
    title text,
    unicode_hostname text,
    updated_at timestamp,
    webhook_url text,
    PRIMARY KEY (id)
);

CREATE TABLE domain_statistics_os (
    os text,
    domain_id text,
    domain_statistics_interval_start_date timestamp,
    score integer,
    PRIMARY KEY (os, domain_id, domain_statistics_interval_start_date),
    FOREIGN KEY (domain_id) REFERENCES domain_statistics(domain_id),
    FOREIGN KEY (domain_statistics_interval_start_date) REFERENCES domain_statistics(interval_start_date)
);

CREATE TABLE domain_statistics_city (
    city text,
    domain_id text,
    domain_statistics_interval_start_date timestamp,
    "name" text,
    score integer,
    PRIMARY KEY (city, domain_id, domain_statistics_interval_start_date),
    FOREIGN KEY (domain_id) REFERENCES domain_statistics(domain_id),
    FOREIGN KEY (domain_statistics_interval_start_date) REFERENCES domain_statistics(interval_start_date)
);

CREATE TABLE domain_statistics_country (
    country text,
    domain_id text,
    domain_statistics_interval_start_date timestamp,
    country_name text,
    score integer,
    PRIMARY KEY (country, domain_id, domain_statistics_interval_start_date),
    FOREIGN KEY (domain_id) REFERENCES domain_statistics(domain_id),
    FOREIGN KEY (domain_statistics_interval_start_date) REFERENCES domain_statistics(interval_start_date)
);

CREATE TABLE domain_statistics_browser (
    browser text,
    domain_id text,
    domain_statistics_interval_start_date timestamp,
    score integer,
    PRIMARY KEY (browser, domain_id, domain_statistics_interval_start_date),
    FOREIGN KEY (domain_id) REFERENCES domain_statistics(domain_id),
    FOREIGN KEY (domain_statistics_interval_start_date) REFERENCES domain_statistics(interval_start_date)
);

CREATE TABLE domain_statistics_social (
    social text,
    domain_id text,
    domain_statistics_interval_start_date timestamp,
    score integer,
    PRIMARY KEY (social, domain_id, domain_statistics_interval_start_date),
    FOREIGN KEY (domain_id) REFERENCES domain_statistics(domain_id),
    FOREIGN KEY (domain_statistics_interval_start_date) REFERENCES domain_statistics(interval_start_date)
);

CREATE TABLE domain_statistics_referer (
    referer text,
    domain_id text,
    domain_statistics_interval_start_date timestamp,
    score integer,
    PRIMARY KEY (referer, domain_id, domain_statistics_interval_start_date),
    FOREIGN KEY (domain_id) REFERENCES domain_statistics(domain_id),
    FOREIGN KEY (domain_statistics_interval_start_date) REFERENCES domain_statistics(interval_start_date)
);

CREATE TABLE domain_statistics (
    interval_start_date timestamp,
    domain_id text,
    click_statistics jsonb,
    clicks text,
    clicks_per_link text,
    clicks_per_link_change text,
    human_clicks text,
    human_clicks_change text,
    human_clicks_change_positive boolean,
    human_clicks_per_link text,
    interval_end_date timestamp,
    interval_prev_end_date timestamp,
    interval_prev_start_date timestamp,
    links text,
    links_change text,
    links_change_positive boolean,
    prev_clicks_change text,
    PRIMARY KEY (interval_start_date, domain_id),
    FOREIGN KEY (domain_id) REFERENCES domain(id)
);

CREATE TABLE link_statistics_os (
    os text,
    domain_id integer,
    link_id text,
    link_statistics_interval_start_date timestamp,
    score integer,
    PRIMARY KEY (os, domain_id, link_id, link_statistics_interval_start_date),
    FOREIGN KEY (domain_id) REFERENCES link_statistics(domain_id),
    FOREIGN KEY (link_id) REFERENCES link_statistics(link_id),
    FOREIGN KEY (link_statistics_interval_start_date) REFERENCES link_statistics(interval_start_date)
);

CREATE TABLE link_statistics_city (
    city text,
    domain_id integer,
    link_id text,
    link_statistics_interval_start_date timestamp,
    "name" text,
    score integer,
    PRIMARY KEY (city, domain_id, link_id, link_statistics_interval_start_date),
    FOREIGN KEY (domain_id) REFERENCES link_statistics(domain_id),
    FOREIGN KEY (link_id) REFERENCES link_statistics(link_id),
    FOREIGN KEY (link_statistics_interval_start_date) REFERENCES link_statistics(interval_start_date)
);

CREATE TABLE link_statistics_country (
    country text,
    domain_id integer,
    link_id text,
    link_statistics_interval_start_date timestamp,
    country_name text,
    score integer,
    PRIMARY KEY (country, domain_id, link_id, link_statistics_interval_start_date),
    FOREIGN KEY (domain_id) REFERENCES link_statistics(domain_id),
    FOREIGN KEY (link_id) REFERENCES link_statistics(link_id),
    FOREIGN KEY (link_statistics_interval_start_date) REFERENCES link_statistics(interval_start_date)
);

CREATE TABLE link_statistics_browser (
    browser text,
    domain_id integer,
    link_id text,
    link_statistics_interval_start_date timestamp,
    score integer,
    PRIMARY KEY (browser, domain_id, link_id, link_statistics_interval_start_date),
    FOREIGN KEY (domain_id) REFERENCES link_statistics(domain_id),
    FOREIGN KEY (link_id) REFERENCES link_statistics(link_id),
    FOREIGN KEY (link_statistics_interval_start_date) REFERENCES link_statistics(interval_start_date)
);

CREATE TABLE link_statistics_social (
    social text,
    domain_id integer,
    link_id text,
    link_statistics_interval_start_date timestamp,
    score integer,
    PRIMARY KEY (social, domain_id, link_id, link_statistics_interval_start_date),
    FOREIGN KEY (domain_id) REFERENCES link_statistics(domain_id),
    FOREIGN KEY (link_id) REFERENCES link_statistics(link_id),
    FOREIGN KEY (link_statistics_interval_start_date) REFERENCES link_statistics(interval_start_date)
);

CREATE TABLE link_statistics_referer (
    referer text,
    domain_id integer,
    link_id text,
    link_statistics_interval_start_date timestamp,
    score integer,
    PRIMARY KEY (referer, domain_id, link_id, link_statistics_interval_start_date),
    FOREIGN KEY (domain_id) REFERENCES link_statistics(domain_id),
    FOREIGN KEY (link_id) REFERENCES link_statistics(link_id),
    FOREIGN KEY (link_statistics_interval_start_date) REFERENCES link_statistics(interval_start_date)
);

CREATE TABLE link_statistics (
    interval_start_date timestamp,
    domain_id integer,
    link_id text,
    click_statistics jsonb,
    human_clicks integer,
    human_clicks_change text,
    interval_end_date timestamp,
    interval_prev_end_date timestamp,
    interval_prev_start_date timestamp,
    total_clicks integer,
    total_clicks_change text,
    PRIMARY KEY (interval_start_date, domain_id, link_id),
    FOREIGN KEY (domain_id) REFERENCES link(domain_id),
    FOREIGN KEY (link_id) REFERENCES link(id)
);

CREATE TABLE link_tag (
    tag_name text,
    domain_id integer,
    link_id text,
    PRIMARY KEY (tag_name, domain_id, link_id),
    FOREIGN KEY (domain_id) REFERENCES link(domain_id),
    FOREIGN KEY (link_id) REFERENCES link(id)
);

CREATE TABLE link (
    domain_id integer,
    id text,
    android_url text,
    archived boolean,
    clicks_limit text,
    cloaking text,
    created_at timestamp,
    expired_url text,
    expires_at text,
    has_password boolean,
    icon text,
    integration_adroll text,
    integration_fb text,
    integration_ga text,
    integration_gtm text,
    iphone_url text,
    original_url text,
    owner_email text,
    owner_id text,
    owner_name text,
    owner_photo_url text,
    password_contact text,
    "path" text,
    redirect_type text,
    secure_short_url text,
    short_url text,
    "source" text,
    split_percent text,
    split_url text,
    title text,
    user_email text,
    user_id text,
    user_name text,
    user_photo_url text,
    PRIMARY KEY (domain_id, id),
    FOREIGN KEY (id) REFERENCES domain(id)
);
