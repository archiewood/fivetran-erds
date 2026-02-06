CREATE TABLE contact (
    id text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE contact_group (
    id text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE product (
    id text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE order_detail_invoice (
    _fivetran_id text,
    order_id text,
    due_date text,
    invoice_reference text,
    tax_date text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (order_id) REFERENCES order_detail(id)
);

CREATE TABLE order_detail_tax_error (
    "index" text,
    order_id text,
    tax_error text,
    PRIMARY KEY ("index", order_id),
    FOREIGN KEY (order_id) REFERENCES order_detail(id)
);

CREATE TABLE order_detail (
    id text,
    parent_order_id text,
    parties_billing_contact_id text,
    parties_customer_contact_id text,
    parties_supplier_contact_id text,
    warehouse_id text,
    accounting_currency_code text,
    acknowledged text,
    allocation_status_code text,
    assignment_current_channel_id text,
    assignment_current_lead_source_id text,
    assignment_current_project_id text,
    assignment_current_staff_owner_contact_id text,
    assignment_current_team_id text,
    closed_on text,
    cost_price_list_id text,
    created_by_id text,
    created_on text,
    currency_exchange_rate text,
    currency_fixed_exchange_rate text,
    delivery_date text,
    delivery_shipping_method_id text,
    historical_order text,
    order_currency_code text,
    order_payment_status text,
    order_rows jsonb,
    order_status_id text,
    order_status_name text,
    order_type_code text,
    order_weighting text,
    parties_billing_address_full_name text,
    parties_billing_address_line_1 text,
    parties_billing_address_line_2 text,
    parties_billing_address_line_3 text,
    parties_billing_address_line_4 text,
    parties_billing_company_name text,
    parties_billing_country text,
    parties_billing_country_id text,
    parties_billing_country_iso_code text,
    parties_billing_country_iso_code_3 text,
    parties_billing_email text,
    parties_billing_fax text,
    parties_billing_mobile_telephone text,
    parties_billing_postal_code text,
    parties_billing_telephone text,
    parties_customer_address_full_name text,
    parties_customer_address_line_1 text,
    parties_customer_address_line_2 text,
    parties_customer_address_line_3 text,
    parties_customer_address_line_4 text,
    parties_customer_company_name text,
    parties_customer_country text,
    parties_customer_country_id text,
    parties_customer_country_iso_code text,
    parties_customer_country_iso_code_3 text,
    parties_customer_email text,
    parties_customer_fax text,
    parties_customer_mobile_telephone text,
    parties_customer_postal_code text,
    parties_customer_telephone text,
    parties_supplier_address_full_name text,
    parties_supplier_address_line_1 text,
    parties_supplier_address_line_2 text,
    parties_supplier_address_line_3 text,
    parties_supplier_address_line_4 text,
    parties_supplier_company_name text,
    parties_supplier_country text,
    parties_supplier_country_id text,
    parties_supplier_country_iso_code text,
    parties_supplier_country_iso_code_3 text,
    parties_supplier_email text,
    parties_supplier_mobile_telephone text,
    parties_supplier_postal_code text,
    parties_supplier_telephone text,
    placed_on text,
    price_list_id text,
    price_mode_code text,
    reference text,
    shipping_status_code text,
    state_tax text,
    stock_status_code text,
    tax_errors jsonb,
    total_value text,
    total_value_base_net text,
    total_value_base_tax_amount text,
    total_value_base_total text,
    total_value_net text,
    total_value_tax_amount text,
    updated_on text,
    version text,
    -- parties_delivery_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (parent_order_id) REFERENCES order_detail(id),
    FOREIGN KEY (parties_billing_contact_id) REFERENCES contact(id),
    FOREIGN KEY (parties_customer_contact_id) REFERENCES contact(id),
    FOREIGN KEY (parties_supplier_contact_id) REFERENCES contact(id),
    FOREIGN KEY (warehouse_id) REFERENCES warehouse(id)
);

CREATE TABLE good_out_note_detail_event (
    event_code text,
    goods_out_note_id text,
    order_id text,
    event_owner_id text,
    occured text,
    PRIMARY KEY (event_code, goods_out_note_id, order_id),
    FOREIGN KEY (goods_out_note_id) REFERENCES goods_out_note_detail(goods_out_note_id),
    FOREIGN KEY (order_id) REFERENCES goods_out_note_detail(order_id)
);

CREATE TABLE goods_out_note_detail (
    order_id text,
    goods_out_note_id text,
    warehouse_id text,
    created_by text,
    created_on text,
    label_uri text,
    last_event_version text,
    priority text,
    release_date text,
    "sequence" text,
    shipping_boxes text,
    shipping_method_id text,
    shipping_references text,
    shipping_weight text,
    status_packed text,
    status_packed_by_id text,
    status_packed_on text,
    status_picked text,
    status_picked_by_id text,
    status_picked_on text,
    status_printed text,
    status_printed_by_id text,
    status_printed_on text,
    status_shipped text,
    status_shipped_by_id text,
    status_shipped_on text,
    transfer text,
    PRIMARY KEY (order_id, goods_out_note_id),
    FOREIGN KEY (goods_out_note_id) REFERENCES goods_out_note_detail(goods_out_note_id),
    FOREIGN KEY (warehouse_id) REFERENCES warehouse(id)
);

CREATE TABLE goods_in_note (
    purchase_order_id text,
    -- custom_* (dynamic column),
    PRIMARY KEY (purchase_order_id)
);

CREATE TABLE warehouse_weekly_operating_period (
    "index" text,
    warehouse_id text,
    closing_hours text,
    day_of_week text,
    opening_hours text,
    PRIMARY KEY ("index", warehouse_id),
    FOREIGN KEY (warehouse_id) REFERENCES warehouse(id)
);

CREATE TABLE warehouse_external_transfer_sla (
    external_transfer_sla_warehouse_id text,
    warehouse_id text,
    time_units text,
    "value" text,
    PRIMARY KEY (external_transfer_sla_warehouse_id, warehouse_id),
    FOREIGN KEY (external_transfer_sla_warehouse_id) REFERENCES warehouse(id),
    FOREIGN KEY (warehouse_id) REFERENCES warehouse(id)
);

CREATE TABLE warehouse (
    id text,
    address_country_id text,
    address_country_iso_code_2 text,
    address_customer_id text,
    address_id text,
    click_and_collect_enabled text,
    collection_sla_time_units text,
    collection_sla_value text,
    "name" text,
    type_code text,
    type_description text,
    weekly_operating_period_timezone text,
    PRIMARY KEY (id)
);

CREATE TABLE company (
    id text,
    "name" text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE product_detail_season (
    "index" text,
    product_id text,
    season_id text,
    PRIMARY KEY ("index", product_id),
    FOREIGN KEY (product_id) REFERENCES product_detail(product_id)
);

CREATE TABLE product_detail_warehouse (
    product_id text,
    warehouse_id text,
    default_location_id text,
    overflow_location_id text,
    reorder_level text,
    reorder_quantity text,
    PRIMARY KEY (product_id, warehouse_id),
    FOREIGN KEY (product_id) REFERENCES product_detail(product_id),
    FOREIGN KEY (warehouse_id) REFERENCES warehouse(id)
);

CREATE TABLE product_detail_variation (
    option_id text,
    product_id text,
    option_name text,
    option_value text,
    option_value_id text,
    PRIMARY KEY (option_id, product_id),
    FOREIGN KEY (product_id) REFERENCES product_detail(product_id)
);

CREATE TABLE product_detail_sales_channel_category (
    category_code text,
    product_id text,
    product_sales_channel_index text,
    PRIMARY KEY (category_code, product_id, product_sales_channel_index),
    FOREIGN KEY (product_id) REFERENCES product_detail_sales_channel(product_id),
    FOREIGN KEY (product_sales_channel_index) REFERENCES product_detail_sales_channel("index")
);

CREATE TABLE product_detail_sales_channel (
    "index" text,
    product_id text,
    description_format text,
    description_language_code text,
    description_text text,
    product_condition text,
    product_name text,
    sales_channel_name text,
    short_description_format text,
    short_description_language_code text,
    short_description_text text,
    PRIMARY KEY ("index", product_id),
    FOREIGN KEY (product_id) REFERENCES product_detail(product_id)
);

CREATE TABLE product_detail (
    product_id text,
    brand_id text,
    composition_bundle text,
    created_on text,
    featured text,
    financial_detail_tax_code text,
    financial_detail_tax_code_id text,
    identity_barcode text,
    identity_ean text,
    identity_isbn text,
    identity_sku text,
    identity_upc text,
    nominal_code_purchase text,
    nominal_code_sale text,
    nominal_code_stock text,
    primary_supplier_id text,
    product_group_id text,
    product_type_id text,
    reporting_category_id text,
    reporting_season_id text,
    reporting_sub_category_id text,
    sales_popup_message text,
    "status" text,
    stock_dimension_height text,
    stock_dimension_length text,
    stock_dimension_volume text,
    stock_dimension_width text,
    stock_tracked text,
    stock_weight_magnitude text,
    updated_on text,
    version text,
    warehouse_popup_message text,
    PRIMARY KEY (product_id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE contact_detail_status_history (
    contact_status_id text,
    contact_id text,
    contact_status_name text,
    occured_on text,
    staff_contact_id text,
    PRIMARY KEY (contact_status_id, contact_id),
    FOREIGN KEY (contact_id) REFERENCES contact_detail(contact_id)
);

CREATE TABLE contact_detail (
    contact_id text,
    assignment_current_contact_group_id text,
    company_id text,
    assignment_current_department_id text,
    assignment_current_lead_source_id text,
    assignment_current_staff_owner_contact_id text,
    communication_messaging_voips_skp text,
    communication_primary_email text,
    communication_secondary_email text,
    communication_telephone_fax text,
    communication_telephone_mobile text,
    communication_telephone_primary text,
    communication_telephone_secondary text,
    communication_tertiary_email text,
    communication_website_primary text,
    contact_tag text,
    created_by_id text,
    created_on text,
    current_contact_status_id text,
    current_contact_status_name text,
    financial_detail_credit_limit text,
    financial_detail_credit_term_days text,
    financial_detail_credit_term_type_id text,
    financial_detail_currency_id text,
    financial_detail_discount_percentage text,
    financial_detail_nominal_code text,
    financial_detail_price_list_id text,
    financial_detail_tax_code_id text,
    financial_detail_tax_number text,
    first_name text,
    is_primary_contact text,
    last_contacted_on text,
    last_name text,
    marketing_is_receive_email_newsletter text,
    organisation_id text,
    organisation_job_title text,
    organisation_name text,
    relationship_to_account_is_staff text,
    relationship_to_account_is_supplier text,
    salutation text,
    trade_status text,
    updated_on text,
    -- aliases_* (dynamic column),
    -- post_address_id_* (dynamic column),
    PRIMARY KEY (contact_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (assignment_current_contact_group_id) REFERENCES contact_group(id),
    FOREIGN KEY (company_id) REFERENCES company(id)
);

CREATE TABLE good_in_note_detail_moved (
    goods_in_note_detail_id text,
    order_id text,
    product_id text,
    goods_note_id text,
    warehouse_id text,
    allocated text,
    batch_goods_note_id text,
    cleared text,
    created_by text,
    created_on text,
    destination_location_id text,
    product_value text,
    product_value_currency text,
    purchase_order_row_id text,
    quantity text,
    quarantine text,
    updated_by text,
    updated_on text,
    value_confirmed text,
    PRIMARY KEY (goods_in_note_detail_id, order_id, product_id),
    FOREIGN KEY (goods_in_note_detail_id) REFERENCES good_in_note_detail(goods_note_id),
    FOREIGN KEY (order_id) REFERENCES good_in_note_detail(order_id),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (goods_note_id) REFERENCES goods_in_note(purchase_order_id),
    FOREIGN KEY (warehouse_id) REFERENCES warehouse(id)
);

CREATE TABLE good_in_note_detail (
    goods_note_id text,
    order_id text,
    created_by text,
    goods_note_status text,
    received_on text,
    transfer text,
    user_batch_reference text,
    PRIMARY KEY (goods_note_id, order_id),
    FOREIGN KEY (goods_note_id) REFERENCES goods_in_note(purchase_order_id),
    FOREIGN KEY (order_id) REFERENCES order_detail(id)
);

CREATE TABLE contact_group_detail (
    id text,
    contact_group_id text,
    created_by text,
    created_on text,
    description text,
    is_read_only text,
    "name" text,
    PRIMARY KEY (id, contact_group_id),
    FOREIGN KEY (contact_group_id) REFERENCES contact_group(id)
);
