CREATE TABLE listing_property_feature (
    "index" text,
    listing_id text,
    feature text,
    PRIMARY KEY ("index", listing_id),
    FOREIGN KEY (listing_id) REFERENCES listing(listing_id)
);

CREATE TABLE listing_include_in_rent (
    "index" text,
    listing_id text,
    include_in_rent text,
    PRIMARY KEY ("index", listing_id),
    FOREIGN KEY (listing_id) REFERENCES listing(listing_id)
);

CREATE TABLE listing_property_file (
    "index" text,
    listing_id text,
    "name" text,
    "type" text,
    url text,
    PRIMARY KEY ("index", listing_id),
    FOREIGN KEY (listing_id) REFERENCES listing(listing_id)
);

CREATE TABLE listing_unit_feature (
    "index" text,
    listing_id text,
    feature text,
    PRIMARY KEY ("index", listing_id),
    FOREIGN KEY (listing_id) REFERENCES listing(listing_id)
);

CREATE TABLE listing_unit_file (
    "index" text,
    listing_id text,
    "name" text,
    "type" text,
    url text,
    PRIMARY KEY ("index", listing_id),
    FOREIGN KEY (listing_id) REFERENCES listing(listing_id)
);

CREATE TABLE listing (
    listing_id text,
    property_id text,
    address_line_1 text,
    address_line_2 text,
    address_line_3 text,
    available_date text,
    city text,
    contact_email text,
    contact_id text,
    contact_name text,
    contact_phone_number text,
    contact_website text,
    country text,
    deposit text,
    description text,
    lease_terms text,
    listing_date text,
    market_rent text,
    postal_code text,
    property_name text,
    property_number_units text,
    property_structure_description text,
    property_year_built text,
    rent text,
    "state" text,
    unit_address_line_1 text,
    unit_address_line_2 text,
    unit_address_line_3 text,
    unit_bathrooms text,
    unit_bedrooms text,
    unit_city text,
    unit_country text,
    unit_id text,
    unit_number text,
    unit_postal_code text,
    unit_size text,
    unit_state text,
    PRIMARY KEY (listing_id),
    FOREIGN KEY (property_id) REFERENCES property(id)
);

CREATE TABLE lease_renewal_tenant (
    lease_id text,
    lease_renewal_id text,
    tenant_id text,
    PRIMARY KEY (lease_id, lease_renewal_id, tenant_id),
    FOREIGN KEY (lease_id) REFERENCES lease_renewal(lease_id),
    FOREIGN KEY (lease_renewal_id) REFERENCES lease_renewal(id),
    FOREIGN KEY (tenant_id) REFERENCES tenant(id)
);

CREATE TABLE lease_renewal (
    id text,
    lease_id text,
    rent_id text,
    lease_from_date text,
    lease_status text,
    lease_to_date text,
    lease_type text,
    rent text,
    PRIMARY KEY (id, lease_id),
    FOREIGN KEY (lease_id) REFERENCES lease(id),
    FOREIGN KEY (rent_id) REFERENCES lease_rent_schedule(id)
);

CREATE TABLE lease_rent_schedule_charge (
    id text,
    lease_id text,
    lease_rent_schedule_id text,
    gl_account_id text,
    amount text,
    due_on_day_of_the_month text,
    first_charge_date text,
    memo text,
    post_days_in_advance text,
    PRIMARY KEY (id, lease_id, lease_rent_schedule_id),
    FOREIGN KEY (lease_id) REFERENCES lease_rent_schedule(lease_id),
    FOREIGN KEY (lease_rent_schedule_id) REFERENCES lease_rent_schedule(id),
    FOREIGN KEY (gl_account_id) REFERENCES gl_account(id)
);

CREATE TABLE lease_rent_schedule (
    id text,
    lease_id text,
    backdate_charge text,
    created_by_user_id text,
    created_date_time text,
    end_date text,
    rent_cycle text,
    start_date text,
    total_amount text,
    PRIMARY KEY (id, lease_id),
    FOREIGN KEY (lease_id) REFERENCES lease(id)
);

CREATE TABLE property (
    id text,
    property_group_id text,
    href text,
    "type" text,
    PRIMARY KEY (id, property_group_id),
    FOREIGN KEY (property_group_id) REFERENCES property_group(id)
);

CREATE TABLE property_group (
    id text,
    created_by_user_first_name text,
    created_by_user_href text,
    created_by_user_id text,
    created_by_user_last_name text,
    description text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE bank_account_transaction_paid_by (
    id text,
    bank_account_id text,
    bank_account_transaction_id text,
    accounting_entity_type text,
    amount text,
    href text,
    unit text,
    PRIMARY KEY (id, bank_account_id, bank_account_transaction_id),
    FOREIGN KEY (bank_account_id) REFERENCES bank_account_transaction(bank_account_id),
    FOREIGN KEY (bank_account_transaction_id) REFERENCES bank_account_transaction(id)
);

CREATE TABLE bank_account_transaction_paid_to (
    id text,
    bank_account_id text,
    bank_account_transaction_id text,
    href text,
    "name" text,
    "type" text,
    PRIMARY KEY (id, bank_account_id, bank_account_transaction_id),
    FOREIGN KEY (bank_account_id) REFERENCES bank_account_transaction(bank_account_id),
    FOREIGN KEY (bank_account_transaction_id) REFERENCES bank_account_transaction(id)
);

CREATE TABLE bank_account_transaction (
    id text,
    bank_account_id text,
    amount text,
    balance text,
    check_number text,
    entry_date text,
    memo text,
    reconciliation_status text,
    transaction_type text,
    PRIMARY KEY (id, bank_account_id),
    FOREIGN KEY (bank_account_id) REFERENCES bank_account(id)
);

CREATE TABLE lease_outstanding_balance (
    all_outstanding_lease_balance_lease_id text,
    gl_account_id text,
    total_balance text,
    PRIMARY KEY (all_outstanding_lease_balance_lease_id, gl_account_id),
    FOREIGN KEY (all_outstanding_lease_balance_lease_id) REFERENCES all_outstanding_lease_balance(lease_id),
    FOREIGN KEY (gl_account_id) REFERENCES gl_account(id)
);

CREATE TABLE all_outstanding_lease_balance (
    lease_id text,
    property_id text,
    balance_0_to_30_day text,
    balance_31_to_60_day text,
    balance_61_to_90_day text,
    balance_over_90_day text,
    eviction_pending_date text,
    is_notice_given text,
    past_due_email_sent_date text,
    total_balance text,
    unit_id text,
    PRIMARY KEY (lease_id),
    FOREIGN KEY (lease_id) REFERENCES lease(id),
    FOREIGN KEY (property_id) REFERENCES property(id)
);

CREATE TABLE lease_transaction_recurring_charge (
    id text,
    lease_recurring_transaction_id text,
    gl_account_id text,
    lease_id text,
    rent_id text,
    amount text,
    duration text,
    first_occurrence_date text,
    frequency text,
    memo text,
    next_occurrence_date text,
    occurrences_remaining text,
    post_days_in_advance text,
    PRIMARY KEY (id, lease_recurring_transaction_id),
    FOREIGN KEY (lease_recurring_transaction_id) REFERENCES lease_recurring_transaction(id),
    FOREIGN KEY (gl_account_id) REFERENCES gl_account(id),
    FOREIGN KEY (lease_id) REFERENCES lease_recurring_transaction(lease_id),
    FOREIGN KEY (rent_id) REFERENCES lease_rent_schedule(id)
);

CREATE TABLE gl_payment_transaction (
    id text,
    gl_account_id text,
    gl_transaction_id text,
    accounting_entity_id text,
    accounting_entity_type text,
    href text,
    unit_href text,
    unit_id text,
    PRIMARY KEY (id, gl_account_id, gl_transaction_id),
    FOREIGN KEY (gl_account_id) REFERENCES gl_transaction(gl_account_id),
    FOREIGN KEY (gl_transaction_id) REFERENCES gl_transaction(id)
);

CREATE TABLE gl_transaction_journal_line (
    "index" text,
    gl_transaction_id text,
    gl_account_id text,
    accounting_entity_href text,
    accounting_entity_id text,
    accounting_entity_type text,
    accounting_entity_unit_href text,
    accounting_entity_unit_id text,
    amount text,
    is_cash_posting text,
    memo text,
    reference_number text,
    PRIMARY KEY ("index", gl_transaction_id),
    FOREIGN KEY (gl_transaction_id) REFERENCES gl_transaction(id),
    FOREIGN KEY (gl_account_id) REFERENCES gl_account(id)
);

CREATE TABLE gl_transaction (
    id text,
    gl_account_id text,
    check_number text,
    "date" text,
    deposit_details_bank_gl_account_id text,
    journal_memo text,
    last_updated_date_time text,
    payee_href text,
    payee_id text,
    payee_name text,
    payee_type text,
    payment_detail_internal_transaction_status text,
    payment_detail_is_internal_transaction text,
    payment_detail_payment_method text,
    total_amount text,
    transaction_type text,
    unit_agreement_href text,
    unit_agreement_id text,
    unit_agreement_type text,
    unit_id text,
    unit_number text,
    PRIMARY KEY (id, gl_account_id),
    FOREIGN KEY (gl_account_id) REFERENCES gl_account(id)
);

CREATE TABLE tenant_phone_number (
    "index" text,
    tenant_id text,
    number text,
    "type" text,
    PRIMARY KEY ("index", tenant_id),
    FOREIGN KEY (tenant_id) REFERENCES tenant(id)
);

CREATE TABLE tenant (
    id text,
    address_line_1 text,
    address_line_2 text,
    address_line_3 text,
    alternaate_email text,
    alternate_address_line_1 text,
    alternate_address_line_2 text,
    alternate_address_line_3 text,
    alternate_city text,
    alternate_country text,
    alternate_postal_code text,
    alternate_state text,
    city text,
    "comment" text,
    country text,
    created_date_time text,
    date_of_birth text,
    email text,
    emergency_contact_email text,
    emergency_contact_name text,
    emergency_contact_phone text,
    emergency_contact_relationship_description text,
    first_name text,
    last_name text,
    mailing_preference text,
    postal_code text,
    sms_opt_in_status text,
    "state" text,
    tax_id text,
    PRIMARY KEY (id)
);

CREATE TABLE gl_account_balance_sub_account (
    id text,
    gl_account_id text,
    PRIMARY KEY (id, gl_account_id),
    FOREIGN KEY (gl_account_id) REFERENCES gl_account(id)
);

CREATE TABLE gl_account (
    id text,
    account_number text,
    cash_flow_classification text,
    default_account_name text,
    description text,
    exclude_from_cash_balance text,
    is_active text,
    is_bank_account text,
    is_contra_account text,
    is_default_gl_account text,
    "name" text,
    parent_gl_account_id text,
    sub_type text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE bank_account (
    id text,
    account_number text,
    account_number_unmasked text,
    balance text,
    bank_account_type text,
    check_layout_type text,
    country text,
    credit_card_service_fee_percentage text,
    credit_monthly_limit text,
    credit_transaction_limit text,
    debit_monthly_limit text,
    debit_transaction_limit text,
    description text,
    enable_local_check_printing text,
    enable_remote_check_printing text,
    fractional_number text,
    is_active text,
    is_credit_card_service_fee_paid_by_resident text,
    "name" text,
    resident_credit_card_convenience_fee_amount text,
    resident_eft_convience_fee_amount text,
    routing_number text,
    signature_heading text,
    -- check_printing_info* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES gl_account(id)
);

CREATE TABLE lease_move_out_data (
    lease_id text,
    tenant_id text,
    move_out_date text,
    notice_given_date text,
    PRIMARY KEY (lease_id, tenant_id),
    FOREIGN KEY (lease_id) REFERENCES lease(id),
    FOREIGN KEY (tenant_id) REFERENCES tenant(id)
);

CREATE TABLE lease_cosigner_phone_number (
    "index" text,
    lease_cosigner_id text,
    lease_id text,
    number text,
    "type" text,
    PRIMARY KEY ("index", lease_cosigner_id, lease_id),
    FOREIGN KEY (lease_cosigner_id) REFERENCES lease_cosigner(id),
    FOREIGN KEY (lease_id) REFERENCES lease_cosigner(lease_id)
);

CREATE TABLE lease_cosigner (
    id text,
    lease_id text,
    address_line_1 text,
    address_line_2 text,
    address_line_3 text,
    alternate_address_line_1 text,
    alternate_address_line_2 text,
    alternate_address_line_3 text,
    alternate_city text,
    alternate_country text,
    alternate_email text,
    alternate_postal_code text,
    alternate_state text,
    city text,
    country text,
    created_date_time text,
    email text,
    first_name text,
    last_name text,
    mailing_preference text,
    postal_code text,
    "state" text,
    PRIMARY KEY (id, lease_id),
    FOREIGN KEY (lease_id) REFERENCES lease(id)
);

CREATE TABLE lease_current_tenant_phone_number (
    "index" text,
    lease_current_tenent_id text,
    lease_id text,
    number text,
    "type" text,
    PRIMARY KEY ("index", lease_current_tenent_id, lease_id),
    FOREIGN KEY (lease_current_tenent_id) REFERENCES lease_current_tenant(tenant_id),
    FOREIGN KEY (lease_id) REFERENCES lease_current_tenant(lease_id)
);

CREATE TABLE lease_current_tenant (
    lease_id text,
    tenant_id text,
    address_line_1 text,
    address_line_2 text,
    address_line_3 text,
    alternate_address text,
    city text,
    "comment" text,
    country text,
    created_date_time text,
    current_number_of_occupant text,
    date_of_birth text,
    email text,
    emergency_contact_email text,
    emergency_contact_name text,
    emergency_contact_phone text,
    emergency_contact_relationship_description text,
    first_name text,
    last_name text,
    lease text,
    mailing_preference text,
    postal_code text,
    sms_opt_in_status text,
    "state" text,
    tax_id text,
    PRIMARY KEY (lease_id, tenant_id),
    FOREIGN KEY (lease_id) REFERENCES lease(id),
    FOREIGN KEY (tenant_id) REFERENCES tenant(id)
);

CREATE TABLE lease_tenant (
    lease_id text,
    tenant_id text,
    move_in_date text,
    "status" text,
    PRIMARY KEY (lease_id, tenant_id),
    FOREIGN KEY (lease_id) REFERENCES lease(id),
    FOREIGN KEY (tenant_id) REFERENCES tenant(id)
);

CREATE TABLE lease (
    id text,
    property_id text,
    account_details_rent text,
    account_details_security_deposit text,
    automatically_move_out_tenant text,
    created_date_time text,
    current_number_of_occupant text,
    is_eviction_pending text,
    last_updated_date_time text,
    lease_from_date text,
    lease_status text,
    lease_to_date text,
    lease_type text,
    payment_due_day text,
    renewal_offer_status text,
    term_type text,
    unit_id text,
    unit_number text,
    PRIMARY KEY (id),
    FOREIGN KEY (property_id) REFERENCES property(id)
);

CREATE TABLE lease_transaction_journal_line (
    lease_id text,
    gl_account_id text,
    lease_transaction_id text,
    property_id text,
    amount text,
    is_cash_posting text,
    memo text,
    reference_number text,
    unit_id text,
    PRIMARY KEY (lease_id, gl_account_id, lease_transaction_id),
    FOREIGN KEY (gl_account_id) REFERENCES gl_account(id),
    FOREIGN KEY (lease_transaction_id) REFERENCES lease_transaction(id),
    FOREIGN KEY (property_id) REFERENCES property(id)
);

CREATE TABLE lease_transaction (
    id text,
    lease_id text,
    check_number text,
    "date" text,
    journal_memo text,
    payee_tenant_id text,
    payment_method text,
    total_amount text,
    transaction_type text,
    transaction_type_enum text,
    PRIMARY KEY (id),
    FOREIGN KEY (lease_id) REFERENCES lease(id)
);

CREATE TABLE lease_note (
    id text,
    lease_id text,
    last_updated_by_user_first_name text,
    last_updated_by_user_href text,
    last_updated_by_user_id text,
    last_updated_by_user_last_name text,
    last_updated_by_user_updated_date_time text,
    note text,
    PRIMARY KEY (id, lease_id),
    FOREIGN KEY (lease_id) REFERENCES lease(id)
);

CREATE TABLE gl_accounting_entity_balance (
    id text,
    gl_account_balance_id text,
    accounting_entity_href text,
    accounting_entity_type text,
    accounting_entity_unit text,
    balance text,
    PRIMARY KEY (id, gl_account_balance_id),
    FOREIGN KEY (gl_account_balance_id) REFERENCES gl_account_balance(id)
);

CREATE TABLE gl_account_balance (
    id text,
    total_balance text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES gl_account(id)
);

CREATE TABLE lease_recurring_transaction_line (
    gl_account_id text,
    lease_id text,
    lease_recurring_transaction_id text,
    amount text,
    PRIMARY KEY (gl_account_id, lease_id, lease_recurring_transaction_id),
    FOREIGN KEY (gl_account_id) REFERENCES gl_account(id),
    FOREIGN KEY (lease_id) REFERENCES lease_recurring_transaction(lease_id),
    FOREIGN KEY (lease_recurring_transaction_id) REFERENCES lease_recurring_transaction(id)
);

CREATE TABLE lease_recurring_transaction (
    id text,
    lease_id text,
    offsetting_gl_account_id text,
    rent_id text,
    amount text,
    duration text,
    frequency text,
    is_expired text,
    memo text,
    next_occurrence_date text,
    post_days_in_advance text,
    transaction_type text,
    PRIMARY KEY (id, lease_id),
    FOREIGN KEY (lease_id) REFERENCES lease(id),
    FOREIGN KEY (offsetting_gl_account_id) REFERENCES gl_account(id),
    FOREIGN KEY (rent_id) REFERENCES lease_rent_schedule(id)
);

CREATE TABLE rental_owner_phone_number (
    "index" text,
    rental_owner_id text,
    number text,
    "type" text,
    PRIMARY KEY ("index", rental_owner_id),
    FOREIGN KEY (rental_owner_id) REFERENCES rental_owner(id)
);

CREATE TABLE rental_owner_property (
    "index" text,
    rental_owner_id text,
    property_id text,
    PRIMARY KEY ("index", rental_owner_id),
    FOREIGN KEY (rental_owner_id) REFERENCES rental_owner(id),
    FOREIGN KEY (property_id) REFERENCES property(id)
);

CREATE TABLE rental_owner (
    id text,
    address_line_1 text,
    address_line_2 text,
    address_line_3 text,
    alternate_email text,
    city text,
    "comment" text,
    company_name text,
    country text,
    email text,
    first_name text,
    include_in_1099 text,
    is_active text,
    is_company text,
    last_name text,
    management_agreement_end_date text,
    management_agreement_start_date text,
    postal_code text,
    "state" text,
    tax_information_address_line_1 text,
    tax_information_address_line_2 text,
    tax_information_address_line_3 text,
    tax_information_city text,
    tax_information_country text,
    tax_information_postal_code text,
    tax_information_state text,
    tax_payer_id text,
    tax_payer_id_type text,
    tax_payer_name_1 text,
    tax_payer_name_2 text,
    PRIMARY KEY (id)
);
