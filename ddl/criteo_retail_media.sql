CREATE TABLE keyword_rank (
    "index" text,
    keyword_id text,
    line_item_id text,
    rank text,
    PRIMARY KEY ("index", keyword_id, line_item_id),
    FOREIGN KEY (keyword_id) REFERENCES keyword(id),
    FOREIGN KEY (line_item_id) REFERENCES keyword(line_item_id)
);

CREATE TABLE keyword_negative_broad (
    "index" text,
    keyword_id text,
    line_item_id text,
    negative_broad text,
    PRIMARY KEY ("index", keyword_id, line_item_id),
    FOREIGN KEY (keyword_id) REFERENCES keyword(id),
    FOREIGN KEY (line_item_id) REFERENCES keyword(line_item_id)
);

CREATE TABLE keyword_negative_exact (
    "index" text,
    keyword_id text,
    line_item_id text,
    negative_exact text,
    PRIMARY KEY ("index", keyword_id, line_item_id),
    FOREIGN KEY (keyword_id) REFERENCES keyword(id),
    FOREIGN KEY (line_item_id) REFERENCES keyword(line_item_id)
);

CREATE TABLE keyword_positive_exact (
    "index" text,
    keyword_id text,
    line_item_id text,
    positive_exact text,
    PRIMARY KEY ("index", keyword_id, line_item_id),
    FOREIGN KEY (keyword_id) REFERENCES keyword(id),
    FOREIGN KEY (line_item_id) REFERENCES keyword(line_item_id)
);

CREATE TABLE keyword (
    id text,
    line_item_id text,
    keyword_bid text,
    keyword_created_at text,
    keyword_match_type text,
    keyword_review_state text,
    keyword_updated_at text,
    "type" text,
    PRIMARY KEY (id, line_item_id),
    FOREIGN KEY (line_item_id) REFERENCES line_item(id)
);

CREATE TABLE retailer_campaign_eligibility (
    "index" text,
    retailer_id text,
    campaign_eligibility text,
    PRIMARY KEY ("index", retailer_id),
    FOREIGN KEY (retailer_id) REFERENCES retailer(id)
);

CREATE TABLE retailer (
    id text,
    account_id text,
    attribute_name text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE balance (
    id text,
    account_id text,
    attribute_balance_type text,
    attribute_created_at text,
    attribute_deposited text,
    attribute_end_date text,
    attribute_memo text,
    attribute_name text,
    attribute_po_number text,
    attribute_private_market_billing_type text,
    attribute_remaining text,
    attribute_sales_force_id text,
    attribute_spend_type text,
    attribute_spent text,
    attribute_start_date text,
    attribute_status text,
    attribute_updated_at text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE brand (
    id text,
    account_id text,
    attribute_name text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE account_country (
    "index" text,
    account_id text,
    country text,
    PRIMARY KEY ("index", account_id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE account (
    id text,
    attribute_company_name text,
    attribute_currency text,
    attribute_name text,
    attribute_parent_account_label text,
    attribute_subtype text,
    attribute_time_zone text,
    attribute_type text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE target_keyword (
    _fivetran_id text,
    line_item_id text,
    keyword_additional_prop text,
    "type" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (line_item_id) REFERENCES line_item(id)
);

CREATE TABLE line_item (
    id text,
    account_id text,
    attribute_budget text,
    attribute_budget_remaining text,
    attribute_budget_spent text,
    attribute_campaign_id text,
    attribute_created_at text,
    attribute_end_date text,
    attribute_name text,
    attribute_start_date text,
    attribute_status text,
    attribute_target_retailer_id text,
    attribute_type text,
    attribute_updated_at text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE balance_campaign (
    id text,
    balance_id text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (balance_id) REFERENCES balance(id)
);

CREATE TABLE campaign_promote_brand (
    "index" text,
    campaign_id text,
    campaign_attribute_account_id text,
    promoted_brand_id text,
    PRIMARY KEY ("index", campaign_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (campaign_attribute_account_id) REFERENCES campaign(id)
);

CREATE TABLE campaign_drawable_balance (
    "index" text,
    campaign_id text,
    campaign_attributes_account_id text,
    drawable_balance_id text,
    PRIMARY KEY ("index", campaign_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (campaign_attributes_account_id) REFERENCES campaign(id)
);

CREATE TABLE campaign (
    id text,
    attribute_account_id text,
    attribute_budget text,
    attribute_budget_remaining text,
    attribute_budget_spent text,
    attribute_click_attribution_scope text,
    attribute_click_attribution_window text,
    attribute_company_name text,
    attribute_created_at text,
    attribute_daily_pacing text,
    attribute_end_date text,
    attribute_is_auto_daily_pacing text,
    attribute_monthly_pacing text,
    attribute_name text,
    attribute_start_date text,
    attribute_status text,
    attribute_type text,
    attribute_updated_at text,
    attribute_view_attribution_scope text,
    attribute_view_attribution_window text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (attribute_account_id) REFERENCES account(id)
);

CREATE TABLE report_line_item (
    _fivetran_id text,
    line_item_id text,
    id text,
    adv_product_category text,
    adv_product_id text,
    adv_product_name text,
    assisted_sale text,
    assisted_unit text,
    attributed_order text,
    attributed_sale text,
    attributed_unit text,
    brand_id text,
    brand_name text,
    campaign_name text,
    campaign_type_name text,
    clicks text,
    cpc text,
    cpm text,
    cpo text,
    ctr text,
    "date" text,
    environment text,
    frequency text,
    "hour" text,
    impressions text,
    keyword text,
    page_type_name text,
    retailer_id text,
    retailer_name text,
    roas text,
    sales_channel text,
    spend text,
    unique_visitor text,
    PRIMARY KEY (_fivetran_id, line_item_id),
    FOREIGN KEY (line_item_id) REFERENCES line_item(id),
    FOREIGN KEY (id) REFERENCES campaign(id)
);

CREATE TABLE report_campaign (
    _fivetran_id text,
    id text,
    adv_product_category text,
    adv_product_id text,
    adv_product_name text,
    assisted_sale text,
    assisted_unit text,
    attributed_order text,
    attributed_sale text,
    attributed_unit text,
    brand_id text,
    brand_name text,
    campaign_name text,
    campaign_type_name text,
    clicks text,
    cpc text,
    cpm text,
    cpo text,
    ctr text,
    "date" text,
    environment text,
    frequency text,
    "hour" text,
    impressions text,
    keyword text,
    page_type_name text,
    retailer_id text,
    retailer_name text,
    roas text,
    sales_channel text,
    spend text,
    unique_visitor text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (id) REFERENCES campaign(id)
);
