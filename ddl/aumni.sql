CREATE TABLE portfolio_company_board_of_director (
    "index" text,
    portfolio_company_id text,
    director text,
    PRIMARY KEY ("index", portfolio_company_id),
    FOREIGN KEY (portfolio_company_id) REFERENCES portfolio_company(id)
);

CREATE TABLE portfolio_company_board_of_appointee (
    "index" text,
    portfolio_company_id text,
    appointee text,
    PRIMARY KEY ("index", portfolio_company_id),
    FOREIGN KEY (portfolio_company_id) REFERENCES portfolio_company(id)
);

CREATE TABLE portfolio_company_co_investor_rounds_participated_lead_investor (
    "index" text,
    co_investor_name text,
    portfolio_company_id text,
    round_name text,
    lead_investor text,
    PRIMARY KEY ("index", co_investor_name, portfolio_company_id, round_name),
    FOREIGN KEY (co_investor_name) REFERENCES portfolio_company_co_investor_rounds_participated(co_investor_name),
    FOREIGN KEY (portfolio_company_id) REFERENCES portfolio_company_co_investor_rounds_participated(portfolio_company_id),
    FOREIGN KEY (round_name) REFERENCES portfolio_company_co_investor_rounds_participated(round_name)
);

CREATE TABLE portfolio_company_co_investor_rounds_participated (
    round_name text,
    co_investor_name text,
    portfolio_company_id text,
    investor_shares_converted text,
    investor_shares_issued_as_fd_percent text,
    investor_shares_issued_as_percent_of_preferred text,
    investor_shares_purchased text,
    investor_total_new_money_invested text,
    investor_total_shares_held text,
    PRIMARY KEY (round_name, co_investor_name, portfolio_company_id),
    FOREIGN KEY (co_investor_name) REFERENCES portfolio_company_co_investor(investor_name),
    FOREIGN KEY (portfolio_company_id) REFERENCES portfolio_company_co_investor(portfolio_company_id)
);

CREATE TABLE portfolio_company_co_investor (
    investor_name text,
    portfolio_company_id text,
    PRIMARY KEY (investor_name, portfolio_company_id),
    FOREIGN KEY (investor_name) REFERENCES co_investor("name"),
    FOREIGN KEY (portfolio_company_id) REFERENCES portfolio_company(id)
);

CREATE TABLE portfolio_company_currently_held_security (
    "index" text,
    portfolio_company_id text,
    security text,
    PRIMARY KEY ("index", portfolio_company_id),
    FOREIGN KEY (portfolio_company_id) REFERENCES portfolio_company(id)
);

CREATE TABLE portfolio_company_fund_name (
    "index" text,
    portfolio_company_id text,
    fund_name text,
    PRIMARY KEY ("index", portfolio_company_id),
    FOREIGN KEY (portfolio_company_id) REFERENCES portfolio_company(id)
);

CREATE TABLE portfolio_company_fund_that_meet_major_investor_threshold (
    "index" text,
    portfolio_company_id text,
    threshold text,
    PRIMARY KEY ("index", portfolio_company_id),
    FOREIGN KEY (portfolio_company_id) REFERENCES portfolio_company(id)
);

CREATE TABLE portfolio_company_fund_with_board_appointee (
    "index" text,
    portfolio_company_id text,
    board_appointee text,
    PRIMARY KEY ("index", portfolio_company_id),
    FOREIGN KEY (portfolio_company_id) REFERENCES portfolio_company(id)
);

CREATE TABLE portfolio_company_fund_with_board_observer (
    "index" text,
    portfolio_company_id text,
    board_observer text,
    PRIMARY KEY ("index", portfolio_company_id),
    FOREIGN KEY (portfolio_company_id) REFERENCES portfolio_company(id)
);

CREATE TABLE portfolio_company_industry_category (
    "index" text,
    portfolio_company_id text,
    category text,
    PRIMARY KEY ("index", portfolio_company_id),
    FOREIGN KEY (portfolio_company_id) REFERENCES portfolio_company(id)
);

CREATE TABLE portfolio_company_industry_sub_category (
    "index" text,
    portfolio_company_id text,
    sub_category text,
    PRIMARY KEY ("index", portfolio_company_id),
    FOREIGN KEY (portfolio_company_id) REFERENCES portfolio_company(id)
);

CREATE TABLE portfolio_company_largest_investor (
    "index" text,
    portfolio_company_id text,
    largest_investor text,
    PRIMARY KEY ("index", portfolio_company_id),
    FOREIGN KEY (portfolio_company_id) REFERENCES portfolio_company(id)
);

CREATE TABLE portfolio_company_latest_equity_financing_lead_investor (
    "index" text,
    portfolio_company_id text,
    lead_investor text,
    PRIMARY KEY ("index", portfolio_company_id),
    FOREIGN KEY (portfolio_company_id) REFERENCES portfolio_company(id)
);

CREATE TABLE portfolio_company_named_major_investor (
    "index" text,
    portfolio_company_id text,
    major_investor text,
    PRIMARY KEY ("index", portfolio_company_id),
    FOREIGN KEY (portfolio_company_id) REFERENCES portfolio_company(id)
);

CREATE TABLE portfolio_company_outstanding_convertible (
    "index" text,
    portfolio_company_id text,
    outstanding_convertible text,
    PRIMARY KEY ("index", portfolio_company_id),
    FOREIGN KEY (portfolio_company_id) REFERENCES portfolio_company(id)
);

CREATE TABLE portfolio_company_outstanding_equity (
    class_name text,
    portfolio_company_id text,
    conversion_price_per_share_amount text,
    conversion_price_per_share_currency text,
    liquidation_preference_multiple text,
    liquidation_price_per_share_amount text,
    liquidation_price_per_share_currency text,
    my_share text,
    participating text,
    seniority text,
    shares_outstanding text,
    PRIMARY KEY (class_name, portfolio_company_id),
    FOREIGN KEY (portfolio_company_id) REFERENCES portfolio_company(id)
);

CREATE TABLE portfolio_company_protective_provision_section_reference (
    "index" text,
    portfolio_company_id text,
    provision_section text,
    PRIMARY KEY ("index", portfolio_company_id),
    FOREIGN KEY (portfolio_company_id) REFERENCES portfolio_company(id)
);

CREATE TABLE portfolio_company_custom_field (
    "name" text,
    portfolio_company_id text,
    "value" text,
    PRIMARY KEY ("name", portfolio_company_id),
    FOREIGN KEY (portfolio_company_id) REFERENCES portfolio_company(id)
);

CREATE TABLE portfolio_company (
    id text,
    active_management_rights_letter text,
    active_side_letter text,
    aggregate_liquidation_preference text,
    aggregate_liquidation_preference_ahead text,
    anti_dilution_right text,
    average_time_between_equity_financings text,
    board_seats text,
    board_size text,
    common_shares_outstanding text,
    company_contact_person text,
    company_contact_person_email text,
    company_url text,
    corporate_jurisdiction text,
    cost text,
    cost_basis_inherited_from_acquisitions text,
    cumulative_dividend text,
    currency_code text,
    current_price_per_share text,
    d_and_o_insurance text,
    dba_name text,
    drag_along text,
    employee_vesting_protocol text,
    entry_post_money_valuation text,
    entry_stage text,
    entry_transaction_security_type text,
    entry_transaction_type text,
    financing text,
    first_transaction_date text,
    follow_on_reserve text,
    founded text,
    founder_preferred_shares_outstanding text,
    fully_diluted_ownership_percent text,
    fully_diluted_share text,
    implied_value text,
    information_right text,
    initial_ownership_percent text,
    latest_equity_financing_new_money text,
    latest_financing text,
    latest_financing_led_by_outside_investor text,
    liquidation_preference_scheme text,
    major_investor_status text,
    months_since_entry text,
    months_since_latest_financing text,
    most_recent_transaction_date text,
    multiple text,
    my_convertible_interest_adjusted_cost_basis text,
    my_earned_interest text,
    "name" text,
    observers_count text,
    one_x_liquidation_preference_multiplier text,
    option_pool_as_fd_percent text,
    options_available_for_future_issuance text,
    options_outside_of_pool_outstanding text,
    options_outstanding text,
    outside_investors_total_new_money text,
    outside_investors_total_new_money_percent text,
    outstanding_audit_log_item text,
    outstanding_convertibles_cost text,
    participating_preferred_stock_outstanding text,
    pay_to_play text,
    post_money_valuation text,
    preferred_ownership_percent text,
    preferred_shares_outstanding text,
    previous_price_per_share text,
    pro_rata_right text,
    realized_proceed text,
    redemption_right text,
    registration_rights_for_preferred_investor text,
    stage text,
    state_of_incorporation text,
    "status" text,
    total_aggregate_liquidation_preference text,
    total_convertible_interest_adjusted_cost_basis text,
    total_invested_capital text,
    total_money_raised text,
    total_money_raised_dup text,
    total_shares_held text,
    "transaction" text,
    unrealized_gain_loss text,
    url text,
    voting_ownership_percent text,
    warrants_outstanding text,
    PRIMARY KEY (id)
);

CREATE TABLE equity_financing_co_investor_lead_investor (
    "index" text,
    co_investor_name text,
    equity_financing_id text,
    lead_investor text,
    PRIMARY KEY ("index", co_investor_name, equity_financing_id),
    FOREIGN KEY (co_investor_name) REFERENCES equity_financing_co_investor(investor_name),
    FOREIGN KEY (equity_financing_id) REFERENCES equity_financing_co_investor(equity_financing_id)
);

CREATE TABLE equity_financing_co_investor (
    equity_financing_id text,
    investor_name text,
    investor_shares_converted text,
    investor_shares_issued_as_fd_percent text,
    investor_shares_issued_as_percent_of_preferred text,
    investor_shares_purchased text,
    investor_total_new_money_invested text,
    investor_total_shares_held text,
    round_name text,
    PRIMARY KEY (equity_financing_id, investor_name),
    FOREIGN KEY (equity_financing_id) REFERENCES equity_financing(id),
    FOREIGN KEY (investor_name) REFERENCES co_investor("name")
);

CREATE TABLE equity_financing_conversion_equity_class (
    "index" text,
    equity_financing_id text,
    equity_class text,
    PRIMARY KEY ("index", equity_financing_id),
    FOREIGN KEY (equity_financing_id) REFERENCES equity_financing(id)
);

CREATE TABLE equity_financing_fund_name (
    "index" text,
    equity_financing_id text,
    fund_name text,
    PRIMARY KEY ("index", equity_financing_id),
    FOREIGN KEY (equity_financing_id) REFERENCES equity_financing(id)
);

CREATE TABLE equity_financing_lead_investor (
    "index" text,
    equity_financing_id text,
    lead_investor text,
    PRIMARY KEY ("index", equity_financing_id),
    FOREIGN KEY (equity_financing_id) REFERENCES equity_financing(id)
);

CREATE TABLE equity_financing_participating_fund (
    "index" text,
    equity_financing_id text,
    participating_fund text,
    PRIMARY KEY ("index", equity_financing_id),
    FOREIGN KEY (equity_financing_id) REFERENCES equity_financing(id)
);

CREATE TABLE equity_financing_post_round_board_appointee (
    "index" text,
    equity_financing_id text,
    board_appointee text,
    PRIMARY KEY ("index", equity_financing_id),
    FOREIGN KEY (equity_financing_id) REFERENCES equity_financing(id)
);

CREATE TABLE equity_financing_post_round_observer_appointee (
    "index" text,
    equity_financing_id text,
    observer_appointee text,
    PRIMARY KEY ("index", equity_financing_id),
    FOREIGN KEY (equity_financing_id) REFERENCES equity_financing(id)
);

CREATE TABLE equity_financing_pre_round_board_appointee (
    "index" text,
    equity_financing_id text,
    board_appointee text,
    PRIMARY KEY ("index", equity_financing_id),
    FOREIGN KEY (equity_financing_id) REFERENCES equity_financing(id)
);

CREATE TABLE equity_financing_pre_round_observer_appointee (
    "index" text,
    equity_financing_id text,
    observer_appointee text,
    PRIMARY KEY ("index", equity_financing_id),
    FOREIGN KEY (equity_financing_id) REFERENCES equity_financing(id)
);

CREATE TABLE equity_financing_new_money_equity_class (
    "index" text,
    equity_financing_id text,
    equity_class text,
    PRIMARY KEY ("index", equity_financing_id),
    FOREIGN KEY (equity_financing_id) REFERENCES equity_financing(id)
);

CREATE TABLE equity_financing (
    id text,
    portfolio_company_id text,
    anti_dilution_right text,
    audited_monthly_financial_statement text,
    audited_quarterly_financial_statement text,
    audited_year_end_financial_statement text,
    average_new_money_price_per_share text,
    board_size text,
    conversion_equity_share text,
    currency_code text,
    d_and_o_insurance text,
    days_between_initial_and_final_closing text,
    dba_name text,
    dividend_rate text,
    drag_along text,
    employee_vesting_protocol text,
    equity_financing_date text,
    financing_name text,
    financing_url text,
    founder_vesting_applied_at_closing text,
    information_rights_for_all text,
    information_rights_for_major_investor text,
    initial_closing_date text,
    investor_counsel_fee_cap text,
    investors_converting_in_round_count text,
    investors_subject_to_rofr text,
    issuer_pays_investor_counsel_fee text,
    liquidation_preference_ahead_of_me_post_round text,
    liquidation_preference_ahead_of_me_pre_round text,
    major_investor_threshold_dollars text,
    major_investor_threshold_shares text,
    milestone_closings text,
    monthly_balance_sheet text,
    monthly_capitalization_table text,
    monthly_financial_statement_timing text,
    monthly_statement_of_stockholders_equity text,
    monthly_statements_of_income_and_cash_flow text,
    months_since_latest_financing text,
    most_recent_closing_date text,
    my_conversion_shares text,
    my_convertible_interest_adjusted_cost_basis text,
    my_earned_interest text,
    my_new_money_invested text,
    my_new_money_shares_fully_diluted_percent text,
    my_post_round_board_seats text,
    my_post_round_cost text,
    my_post_round_fully_diluted_shares_percentage text,
    my_post_round_implied_value text,
    my_post_round_liquidation_preference text,
    my_post_round_observer_seats text,
    my_post_round_preferred_ownership_percentage text,
    my_post_round_shares_held text,
    my_post_round_voting_ownership_percentage text,
    my_pre_round_board_seats text,
    my_pre_round_cost text,
    my_pre_round_fully_diluted_shares_percentage text,
    my_pre_round_implied_value text,
    my_pre_round_liquidation_preference text,
    my_pre_round_observer_seats text,
    my_pre_round_preferred_ownership_percentage text,
    my_pre_round_shares_held text,
    my_pre_round_voting_ownership_percentage text,
    my_round_participation text,
    new_money_dividend_rate text,
    new_money_in_round_investors_count text,
    observers_count text,
    options_authorized text,
    options_authorized_fully_diluted_percent text,
    options_available_for_future_issuance text,
    options_available_for_future_issuance_fully_diluted_percent text,
    options_outside_of_pool_outstanding text,
    options_outside_of_pool_outstanding_fully_diluted_percent text,
    options_outstanding text,
    options_outstanding_fully_diluted_percent text,
    participating_preferred_stock_outstanding text,
    pay_to_play text,
    percent_of_fd_shares_issued_in_round text,
    post_money_common_stock_outstanding text,
    post_money_common_stock_outstanding_fully_diluted_percent text,
    post_money_preferred_stock_outstanding text,
    post_money_preferred_stock_outstanding_fully_diluted_percent text,
    post_money_valuation text,
    pre_money_common_stock_outstanding text,
    pre_money_common_stock_outstanding_fully_diluted_percent text,
    pre_money_preferred_stock_outstanding text,
    pre_money_preferred_stock_outstanding_fully_diluted_percent text,
    pre_money_warrants_outstanding text,
    pre_money_warrants_outstanding_fully_diluted_percent text,
    preferred_investor_director_approval text,
    pro_rata_rights_for_all text,
    pro_rata_rights_for_major_investor text,
    qsbs_covenant text,
    qsbs_rep_made text,
    quarterly_balance_sheet text,
    quarterly_capitalization_table text,
    quarterly_financial_statement_timing text,
    quarterly_statement_of_stockholders_equity text,
    quarterly_statements_of_income_and_cash_flow text,
    redemption_right text,
    registration_rights_for_preferred_investor text,
    required_closing_payment text,
    rofr_and_cosale_agreement text,
    stage text,
    standard_pro_rata_formulation text,
    subsequent_closings_window text,
    total_aggregate_liquidation_preference text,
    total_convertible_interest_adjusted_cost_basis text,
    total_invested_capital text,
    total_new_money text,
    total_new_money_dup text,
    total_new_shares text,
    year_end_balance_sheet text,
    year_end_budget_and_business_plan text,
    year_end_capitalization_table text,
    year_end_financial_statement_timing text,
    year_end_statement_of_stockholders_equity text,
    year_end_statements_of_income_and_cash_flow text,
    PRIMARY KEY (id),
    FOREIGN KEY (portfolio_company_id) REFERENCES portfolio_company(id)
);

CREATE TABLE transaction_ledger_lead_investor (
    "index" text,
    transaction_ledger_id text,
    lead_investor text,
    PRIMARY KEY ("index", transaction_ledger_id),
    FOREIGN KEY (transaction_ledger_id) REFERENCES transaction_ledger(id)
);

CREATE TABLE transaction_ledger_signatory (
    "index" text,
    transaction_ledger_id text,
    signatory text,
    PRIMARY KEY ("index", transaction_ledger_id),
    FOREIGN KEY (transaction_ledger_id) REFERENCES transaction_ledger(id)
);

CREATE TABLE transaction_ledger_custom_field (
    "name" text,
    transaction_ledger_id text,
    "value" text,
    PRIMARY KEY ("name", transaction_ledger_id),
    FOREIGN KEY (transaction_ledger_id) REFERENCES transaction_ledger(id)
);

CREATE TABLE transaction_ledger (
    id text,
    portfolio_company_id text,
    board_members_at_time_of_transaction_count text,
    cost text,
    currency_code text,
    "date" text,
    dba_name text,
    dividend_rate text,
    equity_class text,
    follow_on_investment text,
    fully_diluted_percent_ownership text,
    fully_diluted_shares text,
    fund_name text,
    implied_value text,
    investee_name text,
    investors_in_round_count text,
    months_since_transaction text,
    post_money_valuation text,
    price_per_share text,
    qualified_small_business_stock text,
    qualified_small_business_stock_covenant text,
    realized_proceeds text,
    round_size text,
    security_type text,
    shares text,
    stage text,
    transaction_type text,
    transaction_url text,
    PRIMARY KEY (id),
    FOREIGN KEY (portfolio_company_id) REFERENCES portfolio_company(id)
);

CREATE TABLE security_held_security (
    "index" text,
    security_id text,
    security text,
    PRIMARY KEY ("index", security_id),
    FOREIGN KEY (security_id) REFERENCES security_held(security_id)
);

CREATE TABLE security_held (
    security_id text,
    portfolio_company_id text,
    accrued_interest text,
    accruing_dividend text,
    aggregate_liquidation_preference text,
    anti_dilution_right text,
    conversion_price_per_share text,
    conversion_ratio text,
    conversion_security text,
    convertible_interest_adjusted_cost_basis text,
    cost text,
    coverage_amount text,
    cumulative_dividend text,
    currency_code text,
    dba_name text,
    dividend_rate text,
    earned_interest text,
    equity_class text,
    expiration_date text,
    fully_diluted_ownership_percent text,
    fund_name text,
    implied_value text,
    interest_period text,
    interest_rate text,
    interest_type text,
    issue_date text,
    liquidation_event_premium_payment_multiplier text,
    liquidation_preference text,
    liquidation_preference_multiple text,
    maturity_date text,
    original_price_per_share text,
    participation_after_liquidation_preference text,
    participation_cap_dollars text,
    portfolio_company_name text,
    portfolio_company_url text,
    qualified_financing_threshold text,
    shares text,
    underlying_asset_type text,
    unrealized_gain_loss text,
    valuation_cap_liquidation_event text,
    valuation_cap_non_qualified_financing text,
    valuation_cap_qualified_financing text,
    valuation_cap_voluntary_conversion text,
    warrant_shares text,
    PRIMARY KEY (security_id),
    FOREIGN KEY (portfolio_company_id) REFERENCES portfolio_company(id)
);

CREATE TABLE co_investor_funding_round_participation (
    "index" text,
    co_investor_id text,
    investment_name text,
    participation text,
    PRIMARY KEY ("index", co_investor_id, investment_name),
    FOREIGN KEY (co_investor_id) REFERENCES co_investor(id),
    FOREIGN KEY (investment_name) REFERENCES co_investor(investment_name)
);

CREATE TABLE co_investor_signatory (
    "index" text,
    co_investor_id text,
    investment_name text,
    signatory text,
    PRIMARY KEY ("index", co_investor_id, investment_name),
    FOREIGN KEY (co_investor_id) REFERENCES co_investor(id),
    FOREIGN KEY (investment_name) REFERENCES co_investor(investment_name)
);

CREATE TABLE co_investor_fund_name (
    "index" text,
    co_investor_id text,
    investment_name text,
    fund_name text,
    PRIMARY KEY ("index", co_investor_id, investment_name),
    FOREIGN KEY (co_investor_id) REFERENCES co_investor(id),
    FOREIGN KEY (investment_name) REFERENCES co_investor(investment_name)
);

CREATE TABLE co_investor (
    id text,
    investment_name text,
    co_investment_count text,
    controls_board_seat text,
    currency_code text,
    dba_name text,
    entry_stage text,
    investment_current_stage text,
    investment_jurisdiction_of_notice text,
    investment_most_recent_financing_date text,
    lead_investor_in_latest_round text,
    major_investor_threshold_met text,
    "name" text,
    total_invested_capital text,
    total_new_money_invested text,
    total_units text,
    units_converted text,
    units_issued_as_percent_of_preferred text,
    units_issued_as_percent_of_total_shares text,
    units_purchased text,
    PRIMARY KEY (id, investment_name)
);
