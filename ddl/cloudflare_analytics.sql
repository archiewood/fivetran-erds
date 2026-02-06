CREATE TABLE cpu_time (
    "date" text,
    zone_id text,
    total_cpu_time text,
    PRIMARY KEY ("date", zone_id),
    FOREIGN KEY (zone_id) REFERENCES "zone"(id)
);

CREATE TABLE request_group (
    client_country_name text,
    "date" text,
    zone_id text,
    byte text,
    request text,
    PRIMARY KEY (client_country_name, "date", zone_id)
);

CREATE TABLE cache_reserve (
    bucket_hash text,
    date_time_fifteen_minute text,
    zone_id text,
    bucket_prefix text,
    max_stored_byte text,
    PRIMARY KEY (bucket_hash, date_time_fifteen_minute, zone_id)
);

CREATE TABLE bytes_by_hostname (
    client_country_name text,
    client_request_http_host text,
    client_request_path text,
    date_time_hour text,
    zone_id text,
    edge_response_byte_sum text,
    PRIMARY KEY (client_country_name, client_request_http_host, client_request_path, date_time_hour, zone_id)
);

CREATE TABLE zone_name_server (
    "index" text,
    zone_id text,
    name_server text,
    PRIMARY KEY ("index", zone_id),
    FOREIGN KEY (zone_id) REFERENCES "zone"(id)
);

CREATE TABLE zone_original_name_server (
    "index" text,
    zone_id text,
    original_name_server text,
    PRIMARY KEY ("index", zone_id),
    FOREIGN KEY (zone_id) REFERENCES "zone"(id)
);

CREATE TABLE zone_vanity_name_server (
    "index" text,
    zone_id text,
    vanity_name_server text,
    PRIMARY KEY ("index", zone_id),
    FOREIGN KEY (zone_id) REFERENCES "zone"(id)
);

CREATE TABLE "zone" (
    id text,
    account_id text,
    account_name text,
    activated_on text,
    created_on text,
    development_mode text,
    meta_cdn_only text,
    meta_custom_certificate_quota text,
    meta_dns_only text,
    meta_foundation_dns text,
    meta_page_rule_quota text,
    meta_phishing_detected text,
    meta_step text,
    modified_on text,
    "name" text,
    original_dnshost text,
    original_registrar text,
    owner_id text,
    owner_name text,
    owner_type text,
    paused text,
    plan_can_subscribe text,
    plan_currency text,
    plan_externally_managed text,
    plan_frequency text,
    plan_id text,
    plan_is_subscribed text,
    plan_legacy_discount text,
    plan_legacy_id text,
    plan_name text,
    plan_price text,
    "status" text,
    tenant_id text,
    tenant_name text,
    tenant_unit_id text,
    "type" text,
    vanity_name_servers_ips jsonb,
    PRIMARY KEY (id)
);

CREATE TABLE image_resize_request (
    content_type text,
    "date" text,
    zone_id text,
    sum_original_byte text,
    sum_request text,
    sum_resized_byte text,
    PRIMARY KEY (content_type, "date", zone_id),
    FOREIGN KEY (zone_id) REFERENCES "zone"(id)
);
