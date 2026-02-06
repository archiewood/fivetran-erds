CREATE TABLE domain_visibility_index (
    "date" text,
    device text,
    domain text,
    "value" text,
    PRIMARY KEY ("date", device, domain),
    FOREIGN KEY (domain) REFERENCES domain_visibility_index_overview(domain)
);

CREATE TABLE keyword_domain_seo (
    _fivetran_id text,
    competition text,
    "date" text,
    domain text,
    info text,
    keyword text,
    "position" text,
    traffic text,
    url text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE domain_ranking_distribution (
    "date" text,
    device text,
    domain text,
    page_01 text,
    page_02 text,
    page_03 text,
    page_04 text,
    page_05 text,
    page_06 text,
    page_07 text,
    page_08 text,
    page_09 text,
    page_10 text,
    PRIMARY KEY ("date", device, domain)
);

CREATE TABLE keyword_domain_sem (
    _fivetran_id text,
    competition text,
    "date" text,
    domain text,
    info text,
    keyword text,
    "position" text,
    traffic text,
    url text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE domain_kw_count_sem_info (
    device text,
    "index" text,
    domain text,
    country text,
    PRIMARY KEY (device, "index", domain),
    FOREIGN KEY (domain) REFERENCES domain_kw_count_sem(domain)
);

CREATE TABLE domain_kw_count_sem (
    "date" text,
    device text,
    domain text,
    "value" text,
    PRIMARY KEY ("date", device, domain),
    FOREIGN KEY (domain) REFERENCES keyword_domain_sem(domain)
);

CREATE TABLE domain_visibility_index_overview (
    _fivetran_id text,
    days text,
    device text,
    domain text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE domain_visibility_index_overview_min (
    "date" text,
    device text,
    domain text,
    "value" text,
    PRIMARY KEY ("date", device, domain),
    FOREIGN KEY (domain) REFERENCES domain_visibility_index_overview(domain)
);

CREATE TABLE domain_visibility_index_overview_max (
    "date" text,
    device text,
    domain text,
    "value" text,
    PRIMARY KEY ("date", device, domain),
    FOREIGN KEY (domain) REFERENCES domain_visibility_index_overview(domain)
);

CREATE TABLE domain_kw_count_seo (
    "date" text,
    device text,
    domain text,
    "value" text,
    PRIMARY KEY ("date", device, domain),
    FOREIGN KEY (domain) REFERENCES keyword_domain_seo(domain)
);

CREATE TABLE domain_kw_count_seo_info (
    device text,
    "index" text,
    domain text,
    country text,
    PRIMARY KEY (device, "index", domain),
    FOREIGN KEY (domain) REFERENCES domain_kw_count_seo(domain)
);
