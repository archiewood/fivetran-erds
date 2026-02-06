CREATE TABLE inventory_snapshot (
    _fivetran_id text,
    inventory_id text,
    product_id text,
    room_id text,
    batch_id text,
    batch_name text,
    package_id text,
    quantity text,
    sku text,
    snapshot_date text,
    "status" text,
    total_cost text,
    unit text,
    unit_id text,
    vendor text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (inventory_id) REFERENCES inventory(id),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (room_id) REFERENCES room(id)
);

CREATE TABLE discount_location_restriction (
    "index" text,
    discount_id text,
    location text,
    PRIMARY KEY ("index", discount_id),
    FOREIGN KEY (discount_id) REFERENCES discount(id)
);

CREATE TABLE discount_constraint (
    id text,
    discount_id text,
    discount_item_group_type_id text,
    has_threshold text,
    include_non_cannabis text,
    threshold_type text,
    PRIMARY KEY (id, discount_id),
    FOREIGN KEY (discount_id) REFERENCES discount(id)
);

CREATE TABLE discount (
    id text,
    discount_id text,
    application_method_id text,
    can_stack_automatically text,
    discount_description text,
    is_bundled_discount text,
    max_redemption text,
    menu_display_description text,
    menu_display_image_url text,
    menu_display_name text,
    menu_display_rank text,
    online_name text,
    payment_restrictions jsonb,
    redemption_limit text,
    restrict_to_group_ids jsonb,
    reward_apply_to_only_one_item text,
    reward_calculation_method text,
    reward_calculation_method_id text,
    reward_discount_reward_id text,
    reward_discount_value text,
    reward_has_threshold text,
    reward_highest_or_lowest text,
    reward_item_group_type text,
    reward_item_group_type_id text,
    reward_restrictions jsonb,
    reward_threshold_max text,
    reward_threshold_min text,
    reward_threshold_type_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (discount_id) REFERENCES reporting_discount(id)
);

CREATE TABLE employee (
    _fivetran_id text,
    default_location text,
    full_name text,
    groups text,
    login_id text,
    mmj_expiration text,
    permissions_location text,
    state_id text,
    "status" text,
    user_id text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE strain (
    id text,
    abbreviation text,
    description text,
    external_id text,
    "name" text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE room_waste (
    id text,
    amount text,
    "comment" text,
    "date" text,
    reference_number text,
    room_id text,
    "type" text,
    unit_id text,
    PRIMARY KEY (id)
);

CREATE TABLE harvest_waste (
    id text,
    "comment" text,
    "date" text,
    detail jsonb,
    is_bio_track text,
    loc_id text,
    lsp_id text,
    reference_number text,
    room_required text,
    PRIMARY KEY (id)
);

CREATE TABLE plant_waste (
    id text,
    "comment" text,
    "date" text,
    detail jsonb,
    is_bio_track text,
    loc_id text,
    lsp_id text,
    reference_number text,
    room_required text,
    PRIMARY KEY (id)
);

CREATE TABLE register_adjustment (
    id text,
    terminal_id text,
    adjusted_by text,
    adjusted_by_employee_id text,
    adjusted_on text,
    amount text,
    "comment" text,
    reason text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (terminal_id) REFERENCES terminal(id)
);

CREATE TABLE tags (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE "size" (
    id text,
    description text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE customer_type (
    id text,
    is_medical text,
    is_retail text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE register_transaction (
    id text,
    terminal_id text,
    transaction_id text,
    adjustment_reason text,
    "comment" text,
    transaction_amount text,
    transaction_by text,
    PRIMARY KEY (id),
    FOREIGN KEY (terminal_id) REFERENCES terminal(id),
    FOREIGN KEY (transaction_id) REFERENCES "transaction"(id)
);

CREATE TABLE inventory_tag (
    inventory_id text,
    tag_id text,
    PRIMARY KEY (inventory_id, tag_id),
    FOREIGN KEY (inventory_id) REFERENCES inventory(id),
    FOREIGN KEY (tag_id) REFERENCES tags(id)
);

CREATE TABLE inventory_lab_result (
    "index" text,
    inventory_id text,
    lab_result_unit text,
    lab_result_unit_id text,
    lab_test text,
    "value" text,
    PRIMARY KEY ("index", inventory_id),
    FOREIGN KEY (inventory_id) REFERENCES inventory(id)
);

CREATE TABLE inventory_room_quantity (
    inventory_id text,
    room_id text,
    quantity_available text,
    PRIMARY KEY (inventory_id, room_id),
    FOREIGN KEY (inventory_id) REFERENCES inventory(id),
    FOREIGN KEY (room_id) REFERENCES room(id)
);

CREATE TABLE inventory_lineage (
    "index" text,
    inventory_id text,
    antecedent_batch_name text,
    antecedent_is_harvest text,
    antecedent_package_distance text,
    batch_name text,
    package_id text,
    PRIMARY KEY ("index", inventory_id),
    FOREIGN KEY (inventory_id) REFERENCES inventory(id)
);

CREATE TABLE inventory (
    id text,
    category_id text,
    product_id text,
    strain_id text,
    vendor_id text,
    allocated_quantity text,
    alternate_name text,
    batch_id text,
    batch_name text,
    brand_id text,
    description text,
    effective_potency_mg text,
    expiration_date text,
    external_package_id text,
    flower_equivalent text,
    flower_equivalent_unit text,
    image_url text,
    lab_result_url text,
    lab_test_status text,
    last_modified_date_utc text,
    manufacturing_date text,
    med_unit_price text,
    medical_only text,
    package_id text,
    package_ndc text,
    package_status text,
    packaged_date text,
    potency_indicator text,
    pricing_tier_name text,
    producer text,
    producer_id text,
    quantity_available text,
    quantity_unit text,
    rec_flower_equivalent text,
    rec_unit_price text,
    sample_date text,
    "size" text,
    sku text,
    tested_date text,
    unit_cost text,
    unit_price text,
    unit_weight text,
    unit_weight_unit text,
    PRIMARY KEY (id),
    FOREIGN KEY (category_id) REFERENCES product_category(id),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (strain_id) REFERENCES strain(id),
    FOREIGN KEY (vendor_id) REFERENCES vendor(id)
);

CREATE TABLE vehicle (
    id text,
    color text,
    license_plate text,
    make text,
    model text,
    model_year text,
    vin text,
    PRIMARY KEY (id)
);

CREATE TABLE loyalty_snapshot (
    customer_id text,
    loyalty_balance text,
    loyalty_earned text,
    loyalty_spent text,
    PRIMARY KEY (customer_id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE closing_report_pay_by_bank_batch_file (
    "index" text,
    closing_report_fivetran_id text,
    adjustment_amount text,
    batch_file_name text,
    PRIMARY KEY ("index", closing_report_fivetran_id),
    FOREIGN KEY (closing_report_fivetran_id) REFERENCES closing_report(_fivetran_id)
);

CREATE TABLE closing_report_fees_donation (
    "index" text,
    closing_report_fivetran_id text,
    cash_value text,
    is_revenue text,
    "name" text,
    PRIMARY KEY ("index", closing_report_fivetran_id),
    FOREIGN KEY (closing_report_fivetran_id) REFERENCES closing_report(_fivetran_id)
);

CREATE TABLE closing_report_pay_batch_file_sum (
    "index" text,
    closing_report_fivetran_id text,
    adjustment_amount text,
    batch_file_name text,
    PRIMARY KEY ("index", closing_report_fivetran_id),
    FOREIGN KEY (closing_report_fivetran_id) REFERENCES closing_report(_fivetran_id)
);

CREATE TABLE closing_report_category_summary (
    "index" text,
    closing_report_fivetran_id text,
    category text,
    category_cost text,
    category_discount_total text,
    category_gross_total text,
    category_net_total text,
    category_total text,
    PRIMARY KEY ("index", closing_report_fivetran_id),
    FOREIGN KEY (closing_report_fivetran_id) REFERENCES closing_report(_fivetran_id)
);

CREATE TABLE closing_report_customer_type_summary (
    "index" text,
    closing_report_fivetran_id text,
    cannabis_sale text,
    customer_type text,
    customer_type_cost text,
    discount_total text,
    gross_total text,
    net_total text,
    non_cannabis_sale text,
    total text,
    PRIMARY KEY ("index", closing_report_fivetran_id),
    FOREIGN KEY (closing_report_fivetran_id) REFERENCES closing_report(_fivetran_id)
);

CREATE TABLE closing_report_payment_summary (
    "index" text,
    closing_report_fivetran_id text,
    payment_type text,
    total_paid text,
    PRIMARY KEY ("index", closing_report_fivetran_id),
    FOREIGN KEY (closing_report_fivetran_id) REFERENCES closing_report(_fivetran_id)
);

CREATE TABLE closing_report_tax_summary (
    "index" text,
    closing_report_fivetran_id text,
    tax_rate text,
    total_tax text,
    PRIMARY KEY ("index", closing_report_fivetran_id),
    FOREIGN KEY (closing_report_fivetran_id) REFERENCES closing_report(_fivetran_id)
);

CREATE TABLE closing_report_order_type_summary (
    "index" text,
    closing_report_fivetran_id text,
    discount_total text,
    gross_total text,
    net_total text,
    order_type text,
    order_type_cost text,
    total text,
    PRIMARY KEY ("index", closing_report_fivetran_id),
    FOREIGN KEY (closing_report_fivetran_id) REFERENCES closing_report(_fivetran_id)
);

CREATE TABLE closing_report_order_source_summary (
    "index" text,
    closing_report_fivetran_id text,
    discount_total text,
    gross_total text,
    net_total text,
    order_source text,
    order_source_cost text,
    total text,
    PRIMARY KEY ("index", closing_report_fivetran_id),
    FOREIGN KEY (closing_report_fivetran_id) REFERENCES closing_report(_fivetran_id)
);

CREATE TABLE closing_report (
    _fivetran_id text,
    adjustment text,
    average_cart_net_sale text,
    cannabis_sale text,
    cost text,
    coupon text,
    customer_count text,
    deposit text,
    discount text,
    dutchie_pay_tip text,
    dutchie_pay_total_adjustment_amount text,
    ending_balance text,
    gross_sale text,
    invoice_total text,
    item_count text,
    item_total text,
    loyalty text,
    net_sale text,
    new_customer_count text,
    non_cannabis_sale text,
    non_revenue_fees_donation text,
    over_short text,
    pay_by_bank_tip text,
    pay_by_bank_transaction_fee text,
    return_total text,
    revenue_fees_donation text,
    rounding text,
    starting_balance text,
    total_income text,
    total_payment text,
    total_tax text,
    total_tips text,
    transaction_count text,
    void_count text,
    void_total text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE vendor (
    id text,
    address text,
    city text,
    contact_email text,
    contact_name text,
    contact_phone text,
    license_number text,
    "name" text,
    postal_code text,
    "state" text,
    PRIMARY KEY (id)
);

CREATE TABLE reporting_discount_location (
    "index" text,
    reporting_discount_id text,
    location_name text,
    PRIMARY KEY ("index", reporting_discount_id),
    FOREIGN KEY (reporting_discount_id) REFERENCES reporting_discount(id)
);

CREATE TABLE reporting_discount_product (
    product_id text,
    reporting_discount_id text,
    PRIMARY KEY (product_id, reporting_discount_id),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (reporting_discount_id) REFERENCES reporting_discount(id)
);

CREATE TABLE reporting_discount_product_category (
    product_category_id text,
    reporting_discount_id text,
    PRIMARY KEY (product_category_id, reporting_discount_id),
    FOREIGN KEY (product_category_id) REFERENCES product_category(id),
    FOREIGN KEY (reporting_discount_id) REFERENCES reporting_discount(id)
);

CREATE TABLE reporting_discount_vendor (
    reporting_discount_id text,
    vendor_id text,
    PRIMARY KEY (reporting_discount_id, vendor_id),
    FOREIGN KEY (reporting_discount_id) REFERENCES reporting_discount(id),
    FOREIGN KEY (vendor_id) REFERENCES vendor(id)
);

CREATE TABLE reporting_discount_strain (
    reporting_discount_id text,
    strain_id text,
    PRIMARY KEY (reporting_discount_id, strain_id),
    FOREIGN KEY (reporting_discount_id) REFERENCES reporting_discount(id),
    FOREIGN KEY (strain_id) REFERENCES strain(id)
);

CREATE TABLE reporting_discount_tag (
    reporting_discount_id text,
    tag_id text,
    PRIMARY KEY (reporting_discount_id, tag_id),
    FOREIGN KEY (reporting_discount_id) REFERENCES reporting_discount(id),
    FOREIGN KEY (tag_id) REFERENCES tags(id)
);

CREATE TABLE reporting_discount_customer_type (
    customer_type_id text,
    reporting_discount_id text,
    PRIMARY KEY (customer_type_id, reporting_discount_id),
    FOREIGN KEY (customer_type_id) REFERENCES customer_type(id),
    FOREIGN KEY (reporting_discount_id) REFERENCES reporting_discount(id)
);

CREATE TABLE reporting_discount_group (
    "index" text,
    reporting_discount_id text,
    discount_group_id text,
    discount_group_name text,
    PRIMARY KEY ("index", reporting_discount_id),
    FOREIGN KEY (reporting_discount_id) REFERENCES reporting_discount(id)
);

CREATE TABLE reporting_discount (
    id text,
    application_method text,
    applies_to_location text,
    brand_is_exclusion text,
    brands jsonb,
    customer_type_is_exclusion text,
    discount_amount text,
    discount_code text,
    discount_method text,
    discount_name text,
    discount_type text,
    external_id text,
    first_time_customer_only text,
    include_non_cannabis text,
    inventory_tag_is_exclusion text,
    inventory_tags jsonb,
    is_active text,
    is_available_online text,
    is_deleted text,
    maximum_items_allowed text,
    maximum_usage_count text,
    minimum_items_required text,
    product_category_is_exclusion text,
    product_is_exclusion text,
    require_manager_approval text,
    stack_on_other_discount text,
    strain_is_exclusion text,
    tag_is_exclusion text,
    threshold_type text,
    tier_is_exclusion text,
    tiers jsonb,
    valid_from text,
    valid_until text,
    vendor_is_exclusion text,
    weekly_recurrence_applies_on_friday text,
    weekly_recurrence_applies_on_monday text,
    weekly_recurrence_applies_on_saturday text,
    weekly_recurrence_applies_on_sunday text,
    weekly_recurrence_applies_on_thursday text,
    weekly_recurrence_applies_on_tuesday text,
    weekly_recurrence_applies_on_wednesday text,
    weekly_recurrence_end_time text,
    weekly_recurrence_start_time text,
    PRIMARY KEY (id)
);

CREATE TABLE cash_summary (
    _fivetran_id text,
    adjustment text,
    deposit text,
    ending_balance text,
    overshort text,
    "return" text,
    sale text,
    starting_balance text,
    terminal_name text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE product_pricing_tier (
    "index" text,
    product_id text,
    end_weight text,
    medical_price text,
    price text,
    start_weight text,
    PRIMARY KEY ("index", product_id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE product_tag (
    "index" text,
    product_id text,
    tag_id text,
    PRIMARY KEY ("index"),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (tag_id) REFERENCES tags(id)
);

CREATE TABLE product_tax_category (
    "index" text,
    product_id text,
    category_name text,
    PRIMARY KEY ("index", product_id),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE product (
    id text,
    category_id text,
    strain_id text,
    vendor_id text,
    abbreviation text,
    administration_method text,
    allergen text,
    allow_automatic_discount text,
    alternate_name text,
    approval_date_utc text,
    brand_id text,
    brand_name text,
    broadcasted_responses jsonb,
    category text,
    cbd_content text,
    cbd_content_unit text,
    created_date text,
    days_supply text,
    default_unit text,
    description text,
    distillation_name text,
    dosage text,
    ecom_category text,
    ecom_subcategory text,
    expiration_day text,
    external_category text,
    flavor text,
    flower_equivalent text,
    gross_weight text,
    illinois_tax_category text,
    image_urls jsonb,
    ingredient_list text,
    instruction text,
    internal_name text,
    is_active text,
    is_cannabis text,
    is_coupon text,
    is_finished text,
    is_medical_only text,
    is_nutrient text,
    is_taxable text,
    is_test_product text,
    last_modified_date_utc text,
    lineage_name text,
    low_inventory_threshold text,
    master_category text,
    max_purchaseable_per_transaction text,
    med_price text,
    ndc text,
    net_weight text,
    net_weight_unit text,
    net_weight_unit_id text,
    oil_volume text,
    online_available text,
    online_description text,
    online_product text,
    online_title text,
    pos_product text,
    price text,
    pricing_tier text,
    pricing_tier_description text,
    pricing_tier_name text,
    producer_id text,
    producer_name text,
    product_gram text,
    product_name text,
    rec_flower_equivalent text,
    rec_price text,
    regulatory_category text,
    regulatory_name text,
    serving_size text,
    serving_size_per_unit text,
    "size" text,
    sku text,
    standard_allergens_egg text,
    standard_allergens_fish text,
    standard_allergens_milk text,
    standard_allergens_peanut text,
    standard_allergens_sesame text,
    standard_allergens_shellfish text,
    standard_allergens_soybean text,
    standard_allergens_tree_nut text,
    standard_allergens_wheat text,
    sync_externally text,
    thc_content text,
    thc_content_unit text,
    unit_cbd_content_dose text,
    unit_cost text,
    unit_thc_content_dose text,
    unit_type text,
    upc text,
    PRIMARY KEY (id),
    FOREIGN KEY (category_id) REFERENCES product_category(id),
    FOREIGN KEY (strain_id) REFERENCES strain(id),
    FOREIGN KEY (vendor_id) REFERENCES vendor(id)
);

CREATE TABLE terminal (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE room (
    id text,
    is_ecommere_room text,
    is_inventory_room text,
    is_pos_room text,
    is_pre_order_room text,
    is_quarantine_room text,
    is_sales_floor text,
    is_vault_room text,
    is_waiting_room text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE transaction_item_discount (
    transaction_id text,
    id text,
    transaction_item_id text,
    reason text,
    PRIMARY KEY (transaction_id, id, transaction_item_id),
    FOREIGN KEY (id) REFERENCES reporting_discount(id),
    FOREIGN KEY (transaction_item_id) REFERENCES transaction_item(id)
);

CREATE TABLE transaction_item_tax (
    "index" text,
    transaction_id text,
    transaction_item_id text,
    amount text,
    rate text,
    rate_name text,
    PRIMARY KEY ("index", transaction_id, transaction_item_id),
    FOREIGN KEY (transaction_item_id) REFERENCES transaction_item(id)
);

CREATE TABLE transaction_item (
    id text,
    inventory_id text,
    product_id text,
    transaction_id text,
    batch_name text,
    flower_equivalent text,
    flower_equivalent_unit text,
    is_coupon text,
    is_returned text,
    package_id text,
    quantity text,
    return_date text,
    return_reason text,
    returned_by_transaction_id text,
    source_package_id text,
    total_discount text,
    total_price text,
    unit_cost text,
    unit_id text,
    unit_price text,
    unit_weight text,
    unit_weight_unit text,
    vendor text,
    PRIMARY KEY (id),
    FOREIGN KEY (inventory_id) REFERENCES inventory(id),
    FOREIGN KEY (product_id) REFERENCES product(id),
    FOREIGN KEY (transaction_id) REFERENCES "transaction"(id)
);

CREATE TABLE transaction_tax_summary (
    "index" text,
    transaction_id text,
    amount text,
    rate_name text,
    PRIMARY KEY ("index", transaction_id),
    FOREIGN KEY (transaction_id) REFERENCES "transaction"(id)
);

CREATE TABLE transaction_fees_and_donation (
    id text,
    transaction_id text,
    amount text,
    description text,
    is_revenue text,
    PRIMARY KEY (id, transaction_id),
    FOREIGN KEY (transaction_id) REFERENCES "transaction"(id)
);

CREATE TABLE "transaction" (
    id text,
    customer_id text,
    adjustment_for_transaction_id text,
    auth_code text,
    cash_paid text,
    change_due text,
    check_in_date text,
    check_paid text,
    completed_by_user text,
    credit_paid text,
    customer_type_id text,
    debit_paid text,
    discounts jsonb,
    electronic_paid text,
    electronic_payment_method text,
    employee_id text,
    est_delivery_date_local text,
    est_time_arrival_local text,
    gift_paid text,
    integrated_paid text,
    integrated_payments jsonb,
    invoice_name text,
    invoice_number text,
    is_medical text,
    is_return text,
    is_tax_inclusive text,
    is_void text,
    last_modified_date_utc text,
    loyalty_earned text,
    loyalty_spent text,
    manual_paid text,
    manual_payments jsonb,
    mmap_paid text,
    non_revenue_fees_and_donation text,
    order_ids jsonb,
    order_method text,
    order_source text,
    order_type text,
    paid text,
    pre_payment_amount text,
    reference_id text,
    responsible_for_sale_user_id text,
    return_on_transaction_id text,
    revenue_fees_and_donation text,
    subtotal text,
    tax text,
    terminal_name text,
    tip_amount text,
    total text,
    total_before_tax text,
    total_credit text,
    total_discount text,
    total_item text,
    transaction_date text,
    transaction_date_local_time text,
    transaction_type text,
    void_date text,
    was_pre_ordered text,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE product_category (
    id text,
    master_category text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE customer (
    id text,
    address_1 text,
    address_2 text,
    cell_phone text,
    city text,
    created_at_location text,
    created_by_integrator text,
    creation_date text,
    custom_identifier text,
    customer_type text,
    date_of_birth text,
    discount_group jsonb,
    drivers_license_hash text,
    email_address text,
    external_customer_id text,
    first_name text,
    gender text,
    is_anonymous text,
    is_loyalty_member text,
    last_modified_date_utc text,
    last_name text,
    loyalty_tier text,
    merged_into_customer_id text,
    middle_name text,
    mmjid_expiration_date text,
    mmjid_number text,
    "name" text,
    name_prefix text,
    name_suffix text,
    note text,
    opted_into_marketing text,
    other_referral_source text,
    phone text,
    postal_code text,
    primary_qualifying_condition text,
    referral_source text,
    secondary_qualifying_condition jsonb,
    spring_big_member_id text,
    "state" text,
    "status" text,
    unique_id text,
    PRIMARY KEY (id)
);
