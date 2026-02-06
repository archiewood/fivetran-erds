CREATE TABLE purchase_order_line_item_has_tracking_category (
    line_item_id text,
    purchase_order_id text,
    tracking_category_id text,
    "option" text,
    PRIMARY KEY (line_item_id, purchase_order_id, tracking_category_id),
    FOREIGN KEY (line_item_id) REFERENCES purchase_order_line_item(purchase_order_id),
    FOREIGN KEY (purchase_order_id) REFERENCES purchase_order(purchase_order_id),
    FOREIGN KEY (tracking_category_id) REFERENCES tracking_category(tracking_category_id)
);

CREATE TABLE tax_rate_component (
    "name" text,
    _fivetran_id text,
    is_compound boolean,
    is_non_recoverable boolean,
    rate numeric,
    PRIMARY KEY ("name", _fivetran_id),
    FOREIGN KEY (_fivetran_id) REFERENCES tax_rate(_fivetran_id)
);

CREATE TABLE organization (
    organisation_id text,
    apikey text,
    base_currency text,
    class text,
    country_code text,
    created_date_utc timestamp,
    default_purchases_tax text,
    default_sales_tax text,
    edition text,
    employer_identification_number text,
    end_of_year_lock_date text,
    financial_year_end_day integer,
    financial_year_end_month integer,
    is_demo_company boolean,
    legal_name text,
    line_of_business text,
    "name" text,
    organisation_entity_type text,
    organisation_status text,
    organisation_type text,
    pays_tax boolean,
    period_lock_date text,
    registration_number text,
    sales_tax_basis text,
    sales_tax_period text,
    short_code text,
    tax_number text,
    tax_number_name text,
    timezone text,
    version text,
    PRIMARY KEY (organisation_id)
);

CREATE TABLE employee (
    employee_id text,
    first_name text,
    last_name text,
    "status" text,
    updated_date_utc timestamp,
    PRIMARY KEY (employee_id)
);

CREATE TABLE aus_payroll_employee (
    employee_id text,
    date_of_birth timestamp,
    email text,
    first_name text,
    last_name text,
    ordinary_earnings_rate_id text,
    payroll_calendar_id text,
    phone text,
    start_date timestamp,
    "status" text,
    updated_date_utc timestamp,
    PRIMARY KEY (employee_id)
);

CREATE TABLE settings (
    asset_number_sequence text,
    asset_number_prefix text,
    asset_start_date timestamp,
    default_capital_gain_on_disposal_account_id text,
    default_gain_on_disposal_account_id text,
    default_loss_on_disposal_account_id text,
    last_depreciation_date timestamp,
    opt_in_for_tax boolean,
    PRIMARY KEY (asset_number_sequence)
);

CREATE TABLE prepayment (
    prepayment_id text,
    applied_amount numeric,
    contact_id text,
    currency_code text,
    currency_rate numeric,
    "date" text,
    fully_paid_on_date timestamp,
    has_attachments boolean,
    line_amount_types text,
    reference text,
    remaining_credit numeric,
    "status" text,
    sub_total numeric,
    total numeric,
    total_tax numeric,
    "type" text,
    updated_date_utc timestamp,
    PRIMARY KEY (prepayment_id)
);

CREATE TABLE payment (
    payment_id text,
    account_id text,
    credit_note_id text,
    expense_claim_id text,
    invoice_id text,
    overpayment_id text,
    prepayment_id text,
    amount numeric,
    bank_amount numeric,
    currency_rate numeric,
    "date" text,
    has_account boolean,
    has_validation_errors boolean,
    is_reconciled boolean,
    payment_type text,
    reference text,
    "status" text,
    updated_date_utc timestamp,
    -- batch_payment_* (dynamic column),
    PRIMARY KEY (payment_id),
    FOREIGN KEY (account_id) REFERENCES account(account_id),
    FOREIGN KEY (credit_note_id) REFERENCES credit_note(credit_note_id),
    FOREIGN KEY (expense_claim_id) REFERENCES expense_claim(expense_claim_id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(invoice_id),
    FOREIGN KEY (overpayment_id) REFERENCES overpayment(overpayment_id),
    FOREIGN KEY (prepayment_id) REFERENCES prepayment(prepayment_id)
);

CREATE TABLE purchase_order (
    purchase_order_id text,
    branding_theme_id text,
    contact_id text,
    attention_to text,
    currency_code text,
    currency_rate double precision,
    "date" timestamp,
    delivery_address text,
    delivery_date timestamp,
    delivery_instructions text,
    is_discounted boolean,
    line_amount_types text,
    purchase_order_number text,
    reference text,
    "status" text,
    sub_total double precision,
    telephone text,
    total double precision,
    total_tax double precision,
    "type" text,
    updated_date_utc timestamp,
    PRIMARY KEY (purchase_order_id),
    FOREIGN KEY (branding_theme_id) REFERENCES branding_theme(branding_theme_id),
    FOREIGN KEY (contact_id) REFERENCES contact(contact_id)
);

CREATE TABLE aus_payroll_leave_period (
    index_id bigint,
    leave_application_id text,
    leave_period_status text,
    number_of_units double precision,
    pay_period_end_date timestamp,
    pay_period_start_date timestamp,
    PRIMARY KEY (index_id, leave_application_id),
    FOREIGN KEY (leave_application_id) REFERENCES aus_payroll_leave_application(leave_application_id)
);

CREATE TABLE expense_claim (
    expense_claim_id text,
    user_id text,
    amount_due numeric,
    amount_paid numeric,
    payment_due_date text,
    reporting_date text,
    "status" text,
    total numeric,
    updated_date_utc timestamp,
    PRIMARY KEY (expense_claim_id),
    FOREIGN KEY (user_id) REFERENCES "user"(user_id)
);

CREATE TABLE contact (
    contact_id text,
    branding_theme_id text,
    account_number text,
    accounts_payable_tax_type text,
    accounts_receivable_tax_type text,
    balances_accounts_payable_outstanding numeric,
    balances_accounts_payable_overdue numeric,
    balances_accounts_receivable_outstanding numeric,
    balances_accounts_receivable_overdue numeric,
    bank_account_details text,
    contact_number text,
    contact_status text,
    default_currency text,
    discount integer,
    email_address text,
    first_name text,
    has_attachments boolean,
    has_validation_errors boolean,
    is_customer boolean,
    is_supplier boolean,
    last_name text,
    "name" text,
    purchases_default_account_code text,
    sales_default_account_code text,
    skype_user_name text,
    tax_number text,
    updated_date_utc timestamp,
    website text,
    xero_network_key text,
    -- batch_payments_* (dynamic column),
    PRIMARY KEY (contact_id),
    FOREIGN KEY (branding_theme_id) REFERENCES branding_theme(branding_theme_id)
);

CREATE TABLE repeating_invoice (
    repeating_invoice_id text,
    branding_theme_id text,
    contact_id text,
    currency_code text,
    has_attachments boolean,
    id text,
    line_amount_types text,
    reference text,
    "status" text,
    sub_total numeric,
    total numeric,
    total_discount numeric,
    total_tax numeric,
    "type" text,
    -- schedule_* (dynamic column),
    PRIMARY KEY (repeating_invoice_id),
    FOREIGN KEY (branding_theme_id) REFERENCES branding_theme(branding_theme_id),
    FOREIGN KEY (contact_id) REFERENCES contact(contact_id)
);

CREATE TABLE purchase_order_line_item (
    line_item_id text,
    purchase_order_id text,
    account_code text,
    description text,
    discount_rate numeric,
    item_code text,
    line_amount numeric,
    quantity numeric,
    tax_amount numeric,
    tax_type text,
    unit_amount numeric,
    PRIMARY KEY (line_item_id, purchase_order_id),
    FOREIGN KEY (purchase_order_id) REFERENCES purchase_order(purchase_order_id)
);

CREATE TABLE overpayment_line_item (
    line_item_id text,
    overpayment_id text,
    account_code text,
    description text,
    discount_entered_as_percent boolean,
    item_code text,
    line_amount numeric,
    quantity numeric,
    tax_amount numeric,
    tax_type text,
    unit_amount numeric,
    validation_errors jsonb,
    PRIMARY KEY (line_item_id, overpayment_id),
    FOREIGN KEY (overpayment_id) REFERENCES overpayment(overpayment_id)
);

CREATE TABLE bank_transaction_line_item_has_tracking_category (
    bank_transaction_id text,
    line_item_id text,
    tracking_category_id text,
    "option" text,
    PRIMARY KEY (bank_transaction_id, line_item_id, tracking_category_id),
    FOREIGN KEY (bank_transaction_id) REFERENCES bank_transaction(bank_transaction_id),
    FOREIGN KEY (line_item_id) REFERENCES bank_transaction_line_items(bank_transaction_id),
    FOREIGN KEY (tracking_category_id) REFERENCES tracking_category(tracking_category_id)
);

CREATE TABLE asset_type (
    asset_type_id text,
    accumulated_depreciation_account_id text,
    asset_type_name text,
    depreciation_expense_account_id text,
    fixed_asset_account_id text,
    lock_private_use_account boolean,
    locks integer,
    -- depreciation_* (dynamic column),
    PRIMARY KEY (asset_type_id)
);

CREATE TABLE invoice_line_item (
    line_item_id text,
    invoice_id text,
    item_id text,
    account_code text,
    description text,
    discount_entered_as_percent boolean,
    discount_rate integer,
    item_code text,
    line_amount numeric,
    quantity numeric,
    tax_amount numeric,
    tax_type text,
    unit_amount numeric,
    validation_errors jsonb,
    PRIMARY KEY (line_item_id, invoice_id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(invoice_id),
    FOREIGN KEY (item_id) REFERENCES item(item_id)
);

CREATE TABLE branding_theme (
    branding_theme_id text,
    created_date_utc timestamp,
    "name" text,
    sort_order integer,
    PRIMARY KEY (branding_theme_id)
);

CREATE TABLE credit_note_line_item (
    line_index integer,
    credit_note_id text,
    account_code text,
    description text,
    discount_entered_as_percent boolean,
    item_code text,
    line_amount numeric,
    quantity numeric,
    tax_amount numeric,
    tax_type text,
    unit_amount numeric,
    validation_errors jsonb,
    PRIMARY KEY (line_index, credit_note_id),
    FOREIGN KEY (credit_note_id) REFERENCES credit_note(credit_note_id)
);

CREATE TABLE manual_journal (
    manual_journal_id text,
    "date" text,
    has_attachments boolean,
    line_amount_types text,
    narration text,
    show_on_cash_basis_reports boolean,
    "status" text,
    updated_date_utc timestamp,
    PRIMARY KEY (manual_journal_id)
);

CREATE TABLE overpayment_line_item_has_tracking_category (
    line_item_id text,
    overpayment_id text,
    tracking_category_id text,
    "option" text,
    PRIMARY KEY (line_item_id, overpayment_id, tracking_category_id),
    FOREIGN KEY (line_item_id) REFERENCES overpayment_line_item(line_item_id),
    FOREIGN KEY (overpayment_id) REFERENCES overpayment(overpayment_id),
    FOREIGN KEY (tracking_category_id) REFERENCES tracking_category(tracking_category_id)
);

CREATE TABLE tax_rate (
    _fivetran_id text,
    can_apply_to_assets boolean,
    can_apply_to_equity boolean,
    can_apply_to_expenses boolean,
    can_apply_to_liabilities boolean,
    can_apply_to_revenue boolean,
    display_tax_rate numeric,
    effective_rate numeric,
    "name" text,
    report_tax_type text,
    "status" text,
    tax_type text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE receipt (
    receipt_id text,
    contact_id text,
    expense_claim_id text,
    user_id text,
    "date" text,
    has_attachments boolean,
    id text,
    line_amount_types text,
    receipt_number integer,
    reference text,
    "status" text,
    sub_total numeric,
    total numeric,
    total_tax numeric,
    updated_date_utc timestamp,
    PRIMARY KEY (receipt_id),
    FOREIGN KEY (contact_id) REFERENCES contact(contact_id),
    FOREIGN KEY (expense_claim_id) REFERENCES expense_claim(expense_claim_id),
    FOREIGN KEY (user_id) REFERENCES "user"(user_id)
);

CREATE TABLE "user" (
    user_id text,
    email_address text,
    first_name text,
    is_subscriber boolean,
    last_name text,
    organisation_role text,
    updated_date_utc timestamp,
    PRIMARY KEY (user_id)
);

CREATE TABLE contact_group_member (
    contact_group_id text,
    contact_id text,
    PRIMARY KEY (contact_group_id, contact_id),
    FOREIGN KEY (contact_group_id) REFERENCES contact_group(contact_group_id),
    FOREIGN KEY (contact_id) REFERENCES contact(contact_id)
);

CREATE TABLE manual_journal_line (
    line integer,
    manual_journal_id text,
    account_id text,
    account_code text,
    description text,
    is_blank boolean,
    line_amount numeric,
    tax_amount numeric,
    tax_type text,
    PRIMARY KEY (line, manual_journal_id),
    FOREIGN KEY (manual_journal_id) REFERENCES manual_journal(manual_journal_id),
    FOREIGN KEY (account_id) REFERENCES account(account_id)
);

CREATE TABLE repeating_invoice_line_item_has_tracking_category (
    line_item_id text,
    repeating_invoice_id text,
    tracking_category_id text,
    "option" text,
    PRIMARY KEY (line_item_id, repeating_invoice_id, tracking_category_id),
    FOREIGN KEY (line_item_id) REFERENCES repeating_invoice_line_item(line_item_id),
    FOREIGN KEY (repeating_invoice_id) REFERENCES repeating_invoice(repeating_invoice_id),
    FOREIGN KEY (tracking_category_id) REFERENCES tracking_category(tracking_category_id)
);

CREATE TABLE bank_transfer (
    bank_transfer_id text,
    from_bank_account_id text,
    from_bank_transaction_id text,
    to_bank_account_id text,
    to_bank_transaction_id text,
    amount numeric,
    created_date_utc timestamp,
    created_date_utcstring timestamp,
    currency_rate numeric,
    "date" text,
    has_attachments boolean,
    PRIMARY KEY (bank_transfer_id),
    FOREIGN KEY (from_bank_account_id) REFERENCES bank_account(account_id),
    FOREIGN KEY (from_bank_transaction_id) REFERENCES bank_transaction(bank_transaction_id),
    FOREIGN KEY (to_bank_account_id) REFERENCES bank_account(account_id),
    FOREIGN KEY (to_bank_transaction_id) REFERENCES bank_transaction(bank_transaction_id)
);

CREATE TABLE aus_payroll_leave_application (
    leave_application_id text,
    employee_id text,
    end_date timestamp,
    leave_type_id text,
    start_date timestamp,
    title text,
    updated_date_utc timestamp,
    PRIMARY KEY (leave_application_id),
    FOREIGN KEY (employee_id) REFERENCES employee(employee_id)
);

CREATE TABLE bank_linked_transactions (
    linked_transaction_id text,
    contact_id text,
    source_line_item_id text,
    source_transaction_id text,
    target_line_item_id text,
    target_transaction_id text,
    source_transaction_type_code text,
    "status" text,
    "type" text,
    updated_date_utc text,
    PRIMARY KEY (linked_transaction_id),
    FOREIGN KEY (contact_id) REFERENCES contact(contact_id),
    FOREIGN KEY (source_line_item_id) REFERENCES bank_transaction_line_items(bank_transaction_id),
    FOREIGN KEY (source_transaction_id) REFERENCES bank_transaction(bank_transaction_id),
    FOREIGN KEY (target_line_item_id) REFERENCES bank_transaction_line_items(bank_transaction_id),
    FOREIGN KEY (target_transaction_id) REFERENCES bank_transaction(bank_transaction_id)
);

CREATE TABLE receipt_line_item_has_tracking_category (
    line integer,
    receipt_id text,
    tracking_category_id text,
    tracking_category_option_id text,
    "option" text,
    PRIMARY KEY (line, receipt_id, tracking_category_id),
    FOREIGN KEY (line) REFERENCES receipt_line_item(receipt_id),
    FOREIGN KEY (receipt_id) REFERENCES receipt(receipt_id),
    FOREIGN KEY (tracking_category_id) REFERENCES tracking_category(tracking_category_id),
    FOREIGN KEY (tracking_category_option_id) REFERENCES tracking_category_option(tracking_option_id)
);

CREATE TABLE currency (
    code text,
    description text,
    PRIMARY KEY (code)
);

CREATE TABLE invoice_linked_transactions (
    linked_transaction_id text,
    contact_id text,
    invoice_id text,
    invoice_line_item_id text,
    source_transaction_type_code text,
    "status" text,
    "type" text,
    updated_date_utc text,
    PRIMARY KEY (linked_transaction_id),
    FOREIGN KEY (contact_id) REFERENCES contact(contact_id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(invoice_id),
    FOREIGN KEY (invoice_line_item_id) REFERENCES invoice_line_item(line_item_id)
);

CREATE TABLE overpayment (
    overpayment_id text,
    applied_amount numeric,
    contact_id text,
    currency_code text,
    currency_rate numeric,
    "date" text,
    fully_paid_on_date timestamp,
    has_attachments boolean,
    line_amount_types text,
    reference text,
    remaining_credit numeric,
    "status" text,
    sub_total numeric,
    total numeric,
    total_tax numeric,
    "type" text,
    updated_date_utc timestamp,
    PRIMARY KEY (overpayment_id)
);

CREATE TABLE prepayment_line_item_has_tracking_category (
    line_item_id text,
    pre_payment_id text,
    tracking_category_id text,
    "option" text,
    PRIMARY KEY (line_item_id, pre_payment_id, tracking_category_id),
    FOREIGN KEY (line_item_id) REFERENCES prepayment_line_item(line_item_id),
    FOREIGN KEY (pre_payment_id) REFERENCES prepayment(prepayment_id),
    FOREIGN KEY (tracking_category_id) REFERENCES tracking_category(tracking_category_id)
);

CREATE TABLE receipt_line_item (
    line integer,
    receipt_id text,
    account_code text,
    description text,
    discount_entered_as_percent boolean,
    discount_rate numeric,
    line_amount numeric,
    quantity numeric,
    tax_amount numeric,
    tax_type text,
    unit_amount numeric,
    PRIMARY KEY (line, receipt_id),
    FOREIGN KEY (receipt_id) REFERENCES receipt(receipt_id)
);

CREATE TABLE manual_journal_line_has_tracking_category (
    manual_journal_id text,
    manual_journal_line_id text,
    tracking_category_id text,
    "option" text,
    PRIMARY KEY (manual_journal_id, manual_journal_line_id, tracking_category_id),
    FOREIGN KEY (manual_journal_id) REFERENCES manual_journal(manual_journal_id),
    FOREIGN KEY (manual_journal_line_id) REFERENCES manual_journal_line(manual_journal_id),
    FOREIGN KEY (tracking_category_id) REFERENCES tracking_category(tracking_category_id)
);

CREATE TABLE bank_transaction (
    bank_transaction_id text,
    bank_account_id text,
    contact_id text,
    overpayment_id text,
    prepayment_id text,
    currency_code text,
    currency_rate numeric,
    "date" text,
    external_link_provider_name text,
    has_attachments boolean,
    is_reconciled boolean,
    line_amount_types text,
    reference text,
    "status" text,
    sub_total numeric,
    total numeric,
    total_tax numeric,
    "type" text,
    updated_date_utc timestamp,
    url text,
    -- batch_payment_* (dynamic column),
    PRIMARY KEY (bank_transaction_id),
    FOREIGN KEY (bank_account_id) REFERENCES bank_account(account_id),
    FOREIGN KEY (contact_id) REFERENCES contact(contact_id),
    FOREIGN KEY (overpayment_id) REFERENCES overpayment(overpayment_id),
    FOREIGN KEY (prepayment_id) REFERENCES prepayment(prepayment_id)
);

CREATE TABLE credit_note (
    credit_note_id text,
    branding_theme_id text,
    contact_id text,
    applied_amount numeric,
    credit_note_number text,
    currency_code text,
    currency_rate numeric,
    "date" text,
    due_date text,
    fully_paid_on_date text,
    has_attachments boolean,
    line_amount_types text,
    reference text,
    remaining_credit numeric,
    sent_to_contact boolean,
    "status" text,
    sub_total numeric,
    total numeric,
    total_tax numeric,
    "type" text,
    updated_date_utc timestamp,
    PRIMARY KEY (credit_note_id),
    FOREIGN KEY (branding_theme_id) REFERENCES branding_theme(branding_theme_id),
    FOREIGN KEY (contact_id) REFERENCES contact(contact_id)
);

CREATE TABLE tracking_category_option (
    tracking_option_id text,
    has_validation_errors boolean,
    is_active boolean,
    is_archived boolean,
    is_deleted boolean,
    "name" text,
    "status" text,
    PRIMARY KEY (tracking_option_id)
);

CREATE TABLE bank_account (
    account_id text,
    code text,
    "name" text,
    PRIMARY KEY (account_id)
);

CREATE TABLE tracking_category (
    tracking_category_id text,
    "name" text,
    "status" text,
    PRIMARY KEY (tracking_category_id)
);

CREATE TABLE invoice_line_item_has_tracking_category (
    invoice_id text,
    line_item_id text,
    tracking_category_id text,
    "option" text,
    PRIMARY KEY (invoice_id, line_item_id, tracking_category_id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(invoice_id),
    FOREIGN KEY (line_item_id) REFERENCES invoice_line_item(line_item_id),
    FOREIGN KEY (tracking_category_id) REFERENCES tracking_category(tracking_category_id)
);

CREATE TABLE repeating_invoice_line_item (
    line_item_id text,
    repeating_invoice_id text,
    account_code text,
    description text,
    discount_entered_as_percent boolean,
    discount_rate numeric,
    item_code text,
    line_amount numeric,
    quantity numeric,
    tax_amount numeric,
    tax_type text,
    unit_amount numeric,
    validation_errors jsonb,
    PRIMARY KEY (line_item_id, repeating_invoice_id),
    FOREIGN KEY (repeating_invoice_id) REFERENCES repeating_invoice(repeating_invoice_id)
);

CREATE TABLE allocation (
    allocation_id text,
    "index" bigint,
    credit_note_id text,
    invoice_id text,
    overpayment_id text,
    prepayment_id text,
    amount numeric,
    "date" text,
    PRIMARY KEY (allocation_id, "index"),
    FOREIGN KEY (credit_note_id) REFERENCES credit_note(credit_note_id),
    FOREIGN KEY (invoice_id) REFERENCES invoice(invoice_id),
    FOREIGN KEY (overpayment_id) REFERENCES overpayment(overpayment_id),
    FOREIGN KEY (prepayment_id) REFERENCES prepayment(prepayment_id)
);

CREATE TABLE journal (
    journal_id text,
    created_date_utc timestamp,
    journal_date text,
    journal_number integer,
    reference text,
    source_id text,
    source_type text,
    PRIMARY KEY (journal_id)
);

CREATE TABLE contact_address (
    _index integer,
    contact_id text,
    address_line_1 text,
    address_line_2 text,
    address_line_3 text,
    address_line_4 text,
    address_type text,
    attention_to text,
    city text,
    country text,
    postal_code text,
    region text,
    PRIMARY KEY (_index, contact_id),
    FOREIGN KEY (contact_id) REFERENCES contact(contact_id)
);

CREATE TABLE journal_line_has_tracking_category (
    journal_id text,
    journal_line_id text,
    tracking_category_id text,
    tracking_category_option_id text,
    "option" text,
    PRIMARY KEY (journal_id, journal_line_id, tracking_category_id),
    FOREIGN KEY (journal_id) REFERENCES journal(journal_id),
    FOREIGN KEY (journal_line_id) REFERENCES journal_line(journal_line_id),
    FOREIGN KEY (tracking_category_id) REFERENCES tracking_category(tracking_category_id),
    FOREIGN KEY (tracking_category_option_id) REFERENCES tracking_category_option(tracking_option_id)
);

CREATE TABLE prepayment_line_item (
    line_item_id text,
    prepayment_id text,
    account_code text,
    description text,
    discount_entered_as_percent boolean,
    item_code text,
    line_amount numeric,
    quantity numeric,
    tax_amount numeric,
    tax_type text,
    unit_amount numeric,
    validation_errors jsonb,
    PRIMARY KEY (line_item_id, prepayment_id),
    FOREIGN KEY (prepayment_id) REFERENCES prepayment(prepayment_id)
);

CREATE TABLE asset (
    id text,
    asset_type_id text,
    accounting_book_value numeric,
    asset_name text,
    asset_number text,
    asset_status text,
    can_rollback boolean,
    current_accum_depreciation_amount numeric,
    description text,
    disposal_date timestamp,
    disposal_price numeric,
    is_delete_enabled_for_date boolean,
    prior_accum_depreciation_amount numeric,
    purchase_date timestamp,
    purchase_price numeric,
    serial_number text,
    warranty_expiry_date timestamp,
    -- depreciation_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (asset_type_id) REFERENCES asset_type(asset_type_id)
);

CREATE TABLE bank_transaction_line_items (
    line_item_id text,
    bank_transaction_id text,
    account_code text,
    description text,
    item_code text,
    line_amount numeric,
    quantity numeric,
    tax_amount numeric,
    tax_type text,
    unit_amount numeric,
    PRIMARY KEY (line_item_id, bank_transaction_id),
    FOREIGN KEY (bank_transaction_id) REFERENCES bank_transaction(bank_transaction_id)
);

CREATE TABLE contact_group (
    contact_group_id text,
    has_validation_errors boolean,
    "name" text,
    "status" text,
    PRIMARY KEY (contact_group_id)
);

CREATE TABLE aus_payroll_timesheet_line (
    index_id bigint,
    timesheet_id text,
    earnings_rate_id text,
    number_of_units jsonb,
    updated_date_utc timestamp,
    PRIMARY KEY (index_id, timesheet_id),
    FOREIGN KEY (timesheet_id) REFERENCES aus_payroll_timesheet(id)
);

CREATE TABLE aus_payroll_timesheet (
    id text,
    employee_id text,
    end_date timestamp,
    hours double precision,
    start_date timestamp,
    "status" text,
    updated_date_utc timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (employee_id) REFERENCES employee(employee_id)
);

CREATE TABLE invoice (
    invoice_id text,
    branding_theme_id text,
    contact_id text,
    repeating_invoice_id text,
    amount_credited numeric,
    amount_due numeric,
    amount_paid numeric,
    cisdeduction numeric,
    currency_code text,
    currency_rate numeric,
    "date" text,
    due_date text,
    expected_payment_date timestamp,
    fully_paid_on_date text,
    has_attachments boolean,
    has_errors boolean,
    invoice_number text,
    is_discounted boolean,
    line_amount_types text,
    planned_payment_date timestamp,
    reference text,
    sent_to_contact boolean,
    "status" text,
    sub_total numeric,
    total numeric,
    total_tax numeric,
    "type" text,
    updated_date_utc timestamp,
    url text,
    PRIMARY KEY (invoice_id),
    FOREIGN KEY (branding_theme_id) REFERENCES branding_theme(branding_theme_id),
    FOREIGN KEY (contact_id) REFERENCES contact(contact_id),
    FOREIGN KEY (repeating_invoice_id) REFERENCES repeating_invoice(repeating_invoice_id)
);

CREATE TABLE tracking_category_has_option (
    tracking_category_id text,
    tracking_option_id text,
    PRIMARY KEY (tracking_category_id, tracking_option_id),
    FOREIGN KEY (tracking_category_id) REFERENCES tracking_category(tracking_category_id),
    FOREIGN KEY (tracking_option_id) REFERENCES tracking_category_option(tracking_option_id)
);

CREATE TABLE credit_note_line_item_has_tracking_category (
    line_itemindex integer,
    credit_note_id text,
    tracking_category_id text,
    tracking_category_option_id text,
    "option" text,
    PRIMARY KEY (line_itemindex, credit_note_id, tracking_category_id),
    FOREIGN KEY (credit_note_id) REFERENCES credit_note(credit_note_id),
    FOREIGN KEY (tracking_category_id) REFERENCES tracking_category(tracking_category_id),
    FOREIGN KEY (tracking_category_option_id) REFERENCES tracking_category_option(tracking_option_id)
);

CREATE TABLE item (
    item_id text,
    code text,
    description text,
    inventory_asset_account_code text,
    is_purchased boolean,
    is_sold boolean,
    is_tracked_as_inventory boolean,
    "name" text,
    purchase_description text,
    quantity_on_hand numeric,
    total_cost_pool numeric,
    updated_date_utc timestamp,
    -- purchase_details_* (dynamic column),
    -- sales_details_* (dynamic column),
    PRIMARY KEY (item_id)
);

CREATE TABLE account (
    account_id text,
    add_to_watchlist boolean,
    bank_account_number text,
    bank_account_type text,
    class text,
    code text,
    currency_code text,
    description text,
    enable_payments_to_account boolean,
    has_attachments boolean,
    "name" text,
    reporting_code text,
    reporting_code_name text,
    show_in_expense_claims boolean,
    "status" text,
    system_account text,
    tax_type text,
    "type" text,
    updated_date_utc timestamp,
    PRIMARY KEY (account_id)
);

CREATE TABLE journal_line (
    journal_line_id text,
    account_id text,
    journal_id text,
    account_code text,
    account_name text,
    account_type text,
    description text,
    gross_amount numeric,
    net_amount numeric,
    tax_amount numeric,
    tax_name text,
    tax_type text,
    PRIMARY KEY (journal_line_id),
    FOREIGN KEY (account_id) REFERENCES account(account_id),
    FOREIGN KEY (journal_id) REFERENCES journal(journal_id)
);
