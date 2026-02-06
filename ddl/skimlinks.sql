CREATE TABLE merchant_country (
    "index" text,
    merchant_id text,
    "name" text,
    PRIMARY KEY ("index", merchant_id),
    FOREIGN KEY (merchant_id) REFERENCES merchant(id)
);

CREATE TABLE merchant_domain (
    "index" text,
    merchant_id text,
    domain text,
    PRIMARY KEY ("index", merchant_id),
    FOREIGN KEY (merchant_id) REFERENCES merchant(id)
);

CREATE TABLE merchant_id (
    "index" text,
    merchant_id text,
    id text,
    PRIMARY KEY ("index", merchant_id),
    FOREIGN KEY (merchant_id) REFERENCES merchant(id)
);

CREATE TABLE merchant_network_payout_type (
    "index" text,
    merchant_id text,
    "type" text,
    PRIMARY KEY ("index", merchant_id),
    FOREIGN KEY (merchant_id) REFERENCES merchant(id)
);

CREATE TABLE merchant_program_payout_type (
    "index" text,
    merchant_id text,
    "type" text,
    PRIMARY KEY ("index", merchant_id),
    FOREIGN KEY (merchant_id) REFERENCES merchant(id)
);

CREATE TABLE merchant_vertical (
    "index" text,
    merchant_id text,
    id text,
    "name" text,
    PRIMARY KEY ("index", merchant_id),
    FOREIGN KEY (merchant_id) REFERENCES merchant(id)
);

CREATE TABLE merchant (
    id text,
    advertiser_id text,
    best_rate_performance_based_aggregation_type text,
    best_rate_performance_based_base_rate text,
    best_rate_performance_based_currency text,
    best_rate_performance_based_description text,
    best_rate_performance_based_end_date text,
    best_rate_performance_based_increased_rate text,
    best_rate_performance_based_payout_type text,
    best_rate_performance_based_rate_type text,
    best_rate_performance_based_start_date text,
    best_rate_traffic_based jsonb,
    calculated_average_daily_sales text,
    calculated_average_order_value text,
    calculated_commission_rate text,
    calculated_conversion_rate text,
    calculated_ecpc text,
    domain text,
    estimated_reversal_rate text,
    exclusive text,
    favourite text,
    maximum_rate_aggregation_type text,
    maximum_rate_base text,
    maximum_rate_currency text,
    maximum_rate_description text,
    maximum_rate_end_date text,
    maximum_rate_increased text,
    maximum_rate_payout_type text,
    maximum_rate_start_date text,
    maximum_rate_type text,
    minimum_end_date text,
    minimum_rate_aggregation_type text,
    minimum_rate_base text,
    minimum_rate_currency text,
    minimum_rate_description text,
    minimum_rate_increased text,
    minimum_rate_payout_type text,
    minimum_rate_type text,
    minimum_start_date text,
    "name" text,
    partner_type text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE aggregated_report_by_link (
    end_date text,
    start_date text,
    target_url text,
    clicks_affiliated text,
    conversion_rate text,
    ctr_affiliated text,
    epc text,
    impressions text,
    order_amount text,
    publisher_commission_amount text,
    rpm text,
    sales text,
    PRIMARY KEY (end_date, start_date, target_url)
);

CREATE TABLE trending_product_merchant_country (
    "index" text,
    trending_product_report_fivetran_id text,
    merchant_country text,
    PRIMARY KEY ("index", trending_product_report_fivetran_id),
    FOREIGN KEY (trending_product_report_fivetran_id) REFERENCES trending_product_report(_fivetran_id)
);

CREATE TABLE trending_product_merchant_vertical (
    "index" text,
    trending_product_report_fivetran_id text,
    merchant_vertical text,
    PRIMARY KEY ("index", trending_product_report_fivetran_id),
    FOREIGN KEY (trending_product_report_fivetran_id) REFERENCES trending_product_report(_fivetran_id)
);

CREATE TABLE trending_product_report (
    _fivetran_id text,
    advertiser_id text,
    advertiser_name text,
    conversion_rate text,
    currency text,
    epc text,
    is_available text,
    order_rank text,
    popular_rank text,
    previous_popular_rank text,
    product_brand text,
    product_image_url text,
    product_name text,
    product_url text,
    publisher_currency text,
    publisher_id text,
    rank_rate_change text,
    rank_rate_change_trend text,
    trending_rank text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE product_bought_report (
    _fivetran_id text,
    advertiser_id text,
    advertiser_name text,
    currency text,
    end_date text,
    order_amount text,
    product_name text,
    publisher_commission_amount text,
    quantity text,
    sku text,
    start_date text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE aggregated_report_by_date (
    isodate text,
    clicks_affiliated text,
    conversion_rate text,
    ctr_affiliated text,
    epc text,
    impressions text,
    order_amount text,
    publisher_commission_amount text,
    rpm text,
    sales text,
    PRIMARY KEY (isodate)
);

CREATE TABLE aggregated_report_by_device (
    device_type text,
    end_date text,
    start_date text,
    clicks_affiliated text,
    conversion_rate text,
    ctr_affiliated text,
    epc text,
    impressions text,
    order_amount text,
    publisher_commission_amount text,
    rpm text,
    sales text,
    PRIMARY KEY (device_type, end_date, start_date)
);

CREATE TABLE aggregated_report_by_country (
    _fivetran_id text,
    clicks_affiliated text,
    conversion_rate text,
    ctr_affiliated text,
    end_date text,
    epc text,
    impressions text,
    order_amount text,
    publisher_commission_amount text,
    rpm text,
    sales text,
    start_date text,
    user_ip_country text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE aggregated_report_by_page (
    end_date text,
    page_url text,
    start_date text,
    clicks_affiliated text,
    conversion_rate text,
    ctr_affiliated text,
    epc text,
    impressions text,
    order_amount text,
    publisher_commission_amount text,
    rpm text,
    sales text,
    PRIMARY KEY (end_date, page_url, start_date)
);

CREATE TABLE aggregated_report_by_domain (
    domain_id text,
    end_date text,
    start_date text,
    clicks_affiliated text,
    conversion_rate text,
    ctr_affiliated text,
    domain text,
    epc text,
    impressions text,
    order_amount text,
    publisher_commission_amount text,
    rpm text,
    sales text,
    PRIMARY KEY (domain_id, end_date, start_date)
);

CREATE TABLE aggregated_report_by_merchant (
    advertiser_id text,
    end_date text,
    start_date text,
    advertiser_name text,
    clicks_affiliated text,
    commission_rate_base_rate_revenue text,
    commission_rate_currency text,
    commission_rate_is_exclusive_rate text,
    commission_rate_max_base_rate text,
    commission_rate_max_increased_rate text,
    commission_rate_max_uplift_rate text,
    commission_rate_min_base_rate text,
    commission_rate_min_increased_rate text,
    commission_rate_min_uplift_rate text,
    commission_rate_rate_type text,
    commission_rate_uplift_rate_revenue text,
    conversion_rate text,
    ctr_affiliated text,
    epc text,
    impressions text,
    is_dynamic_active text,
    network_payout_type jsonb,
    order_amount text,
    partner_program_type text,
    publisher_commission_amount text,
    rpm text,
    sales text,
    PRIMARY KEY (advertiser_id, end_date, start_date)
);
