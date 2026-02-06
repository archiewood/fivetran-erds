CREATE TABLE keyword_site_report_by_site (
    country text,
    "date" text,
    device text,
    query text,
    search_type text,
    site text,
    clicks double precision,
    ctr double precision,
    impressions double precision,
    "position" double precision,
    PRIMARY KEY (country, "date", device, query, search_type, site)
);

CREATE TABLE keyword_page_report (
    country text,
    "date" text,
    device text,
    page text,
    query text,
    search_type text,
    site text,
    clicks double precision,
    ctr double precision,
    impressions double precision,
    "position" double precision,
    PRIMARY KEY (country, "date", device, page, query, search_type, site)
);

CREATE TABLE page_report (
    country text,
    "date" text,
    device text,
    page text,
    search_type text,
    site text,
    clicks double precision,
    ctr double precision,
    impressions double precision,
    "position" double precision,
    PRIMARY KEY (country, "date", device, page, search_type, site)
);

CREATE TABLE hourly_keyword_site_report_by_site (
    country text,
    device text,
    "hour" timestamp,
    query text,
    search_type text,
    site text,
    clicks double precision,
    ctr double precision,
    impressions double precision,
    "position" double precision,
    PRIMARY KEY (country, device, "hour", query, search_type, site)
);

CREATE TABLE sitemap (
    last_downloaded timestamp,
    last_submitted timestamp,
    "path" text,
    site text,
    "type" text,
    indexed bigint,
    submitted bigint,
    PRIMARY KEY (last_downloaded, last_submitted, "path", site, "type")
);

CREATE TABLE hourly_keyword_site_report_by_page (
    country text,
    device text,
    "hour" timestamp,
    query text,
    search_type text,
    site text,
    clicks double precision,
    ctr double precision,
    impressions double precision,
    "position" double precision,
    PRIMARY KEY (country, device, "hour", query, search_type, site)
);

CREATE TABLE hourly_site_report_by_site (
    country text,
    device text,
    "hour" timestamp,
    search_type text,
    site text,
    clicks double precision,
    ctr double precision,
    impressions double precision,
    "position" double precision,
    PRIMARY KEY (country, device, "hour", search_type, site)
);

CREATE TABLE hourly_keyword_page_report (
    country text,
    device text,
    "hour" timestamp,
    page text,
    query text,
    search_type text,
    site text,
    clicks double precision,
    ctr double precision,
    impressions double precision,
    "position" double precision,
    PRIMARY KEY (country, device, "hour", page, query, search_type, site)
);

CREATE TABLE hourly_page_report (
    country text,
    device text,
    "hour" timestamp,
    page text,
    search_type text,
    site text,
    clicks double precision,
    ctr double precision,
    impressions double precision,
    "position" double precision,
    PRIMARY KEY (country, device, "hour", page, search_type, site)
);

CREATE TABLE site_report_by_site (
    country text,
    "date" text,
    device text,
    search_type text,
    site text,
    clicks double precision,
    ctr double precision,
    impressions double precision,
    "position" double precision,
    PRIMARY KEY (country, "date", device, search_type, site)
);

CREATE TABLE hourly_site_report_by_page (
    country text,
    device text,
    "hour" timestamp,
    search_type text,
    site text,
    clicks double precision,
    ctr double precision,
    impressions double precision,
    "position" double precision,
    PRIMARY KEY (country, device, "hour", search_type, site)
);

CREATE TABLE keyword_site_report_by_page (
    country text,
    "date" text,
    device text,
    query text,
    search_type text,
    site text,
    clicks double precision,
    ctr double precision,
    impressions double precision,
    "position" double precision,
    PRIMARY KEY (country, "date", device, query, search_type, site)
);

CREATE TABLE site_report_by_page (
    country text,
    "date" text,
    device text,
    search_type text,
    site text,
    clicks double precision,
    ctr double precision,
    impressions double precision,
    "position" double precision,
    PRIMARY KEY (country, "date", device, search_type, site)
);
