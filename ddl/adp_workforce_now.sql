CREATE TABLE assigned_work_communication (
    id text,
    "type" text,
    location_id text,
    worker_assignment_id text,
    worker_id text,
    access text,
    area_dialing text,
    country_dialing text,
    dial_number text,
    email_uri text,
    extension text,
    formatted_number text,
    "name" text,
    notification_indicator boolean,
    uri text,
    -- name_* (dynamic column),
    PRIMARY KEY (id, "type", location_id, worker_assignment_id, worker_id),
    FOREIGN KEY (location_id) REFERENCES location(id),
    FOREIGN KEY (worker_assignment_id) REFERENCES work_assignment_history(worker_id),
    FOREIGN KEY (worker_id) REFERENCES worker(id)
);

CREATE TABLE additional_remuneration_associated_rate_qualifier (
    id text,
    worker_additional_remuneration_id text,
    worker_assignment_id text,
    worker_id text,
    PRIMARY KEY (id, worker_additional_remuneration_id, worker_assignment_id, worker_id),
    FOREIGN KEY (id) REFERENCES associated_rate_qualifier(id),
    FOREIGN KEY (worker_additional_remuneration_id) REFERENCES worker_additional_remuneration(worker_id),
    FOREIGN KEY (worker_assignment_id) REFERENCES work_assignment_history(worker_id),
    FOREIGN KEY (worker_id) REFERENCES worker(id)
);

CREATE TABLE person_alternate_preferred_name (
    id text,
    worker_id text,
    family_name_1 text,
    family_name_1_prefix text,
    family_name_2 text,
    family_name_2_prefix text,
    formatted_name text,
    generation_affix text,
    given_name text,
    initials text,
    language text,
    middle_name text,
    "name" text,
    nick_name text,
    qualification_affix text,
    script text,
    -- generationAffix_* (dynamic column),
    -- language_* (dynamic column),
    -- name_* (dynamic column),
    -- qualificationAffix_* (dynamic column),
    -- script_* (dynamic column),
    PRIMARY KEY (id, worker_id),
    FOREIGN KEY (worker_id) REFERENCES worker(id)
);

CREATE TABLE worker_additional_remuneration (
    id text,
    worker_assignment_id text,
    worker_id text,
    effective_date text,
    "interval" text,
    "name" text,
    "type" text,
    -- interval_* (dynamic column),
    -- name_* (dynamic column),
    -- rate_* (dynamic column),
    -- type_* (dynamic column),
    PRIMARY KEY (id, worker_assignment_id, worker_id),
    FOREIGN KEY (worker_assignment_id) REFERENCES work_assignment_history(worker_id),
    FOREIGN KEY (worker_id) REFERENCES worker(id)
);

CREATE TABLE business_communication (
    id text,
    "type" text,
    worker_id text,
    access text,
    area_dialing text,
    country_dialing text,
    dial_number text,
    email_uri text,
    extension text,
    formatted_number text,
    "name" text,
    notification_indicator boolean,
    uri text,
    -- name_* (dynamic column),
    PRIMARY KEY (id, "type", worker_id),
    FOREIGN KEY (worker_id) REFERENCES worker(id)
);

CREATE TABLE worker_time_card_time_entry (
    entry_id text,
    day_entry_index bigint,
    time_card_id text,
    end_period_end_date_time timestamp,
    entry_date text,
    entry_status text,
    entry_type text,
    start_period_start_date_time timestamp,
    time_duration text,
    -- entry_status_* (dynamic column),
    -- entry_type_* (dynamic column),
    PRIMARY KEY (entry_id, day_entry_index, time_card_id),
    FOREIGN KEY (day_entry_index) REFERENCES worker_time_card_day_entry("index"),
    FOREIGN KEY (time_card_id) REFERENCES worker_time_card(id)
);

CREATE TABLE person_citizenship (
    "value" text,
    worker_id text,
    long_name text,
    short_name text,
    PRIMARY KEY ("value", worker_id),
    FOREIGN KEY (worker_id) REFERENCES worker(id)
);

CREATE TABLE worker_pay_distribution (
    item_id text,
    worker_id text,
    distribution_status text,
    payroll_file_number text,
    payroll_group text,
    requested_start_date text,
    -- distributionStatus_* (dynamic column),
    -- payrollGroup_* (dynamic column),
    PRIMARY KEY (item_id, worker_id),
    FOREIGN KEY (worker_id) REFERENCES worker(id)
);

CREATE TABLE person_military_classification (
    "value" text,
    worker_id text,
    long_name text,
    short_name text,
    "type" text,
    PRIMARY KEY ("value", worker_id),
    FOREIGN KEY (worker_id) REFERENCES worker(id)
);

CREATE TABLE person_communication (
    id text,
    "type" text,
    worker_id text,
    access text,
    area_dialing text,
    country_dialing text,
    dial_number text,
    email_uri text,
    extension text,
    formatted_number text,
    "name" text,
    notification_indicator boolean,
    uri text,
    -- name_* (dynamic column),
    PRIMARY KEY (id, "type", worker_id),
    FOREIGN KEY (worker_id) REFERENCES worker(id)
);

CREATE TABLE worker_time_card_day_entry (
    "index" bigint,
    time_card_id text,
    entry_date text,
    total_period_time_duration text,
    PRIMARY KEY ("index", time_card_id),
    FOREIGN KEY (time_card_id) REFERENCES worker_time_card(id)
);

CREATE TABLE worker_home_work_communication (
    id text,
    "type" text,
    worker_assignment_id text,
    worker_id text,
    access text,
    area_dialing text,
    country_dialing text,
    dial_number text,
    email_uri text,
    extension text,
    formatted_number text,
    "name" text,
    notification_indicator boolean,
    uri text,
    -- name_* (dynamic column),
    PRIMARY KEY (id, "type", worker_assignment_id, worker_id),
    FOREIGN KEY (worker_assignment_id) REFERENCES work_assignment_history(worker_id),
    FOREIGN KEY (worker_id) REFERENCES worker(id)
);

CREATE TABLE person_former_name (
    id text,
    worker_id text,
    family_name_1 text,
    family_name_1_prefix text,
    family_name_2 text,
    family_name_2_prefix text,
    formatted_name text,
    generation_affix text,
    given_name text,
    initials text,
    language text,
    middle_name text,
    "name" text,
    nick_name text,
    qualification_affix text,
    script text,
    -- generationAffix_* (dynamic column),
    -- language_* (dynamic column),
    -- name_* (dynamic column),
    -- qualificationAffix_* (dynamic column),
    -- script_* (dynamic column),
    PRIMARY KEY (id, worker_id),
    FOREIGN KEY (worker_id) REFERENCES worker(id)
);

CREATE TABLE worker_report_to (
    id text,
    worker_assignment_id text,
    worker_id text,
    report_to_worker_id text,
    position_id text,
    position_title text,
    PRIMARY KEY (id, worker_assignment_id, worker_id),
    FOREIGN KEY (worker_assignment_id) REFERENCES work_assignment_history(worker_id),
    FOREIGN KEY (worker_id) REFERENCES worker(id),
    FOREIGN KEY (report_to_worker_id) REFERENCES worker(id)
);

CREATE TABLE worker_home_organizational_unit (
    id text,
    worker_assignment_id text,
    worker_id text,
    PRIMARY KEY (id, worker_assignment_id, worker_id),
    FOREIGN KEY (id) REFERENCES organizational_unit(id),
    FOREIGN KEY (worker_assignment_id) REFERENCES work_assignment_history(worker_id),
    FOREIGN KEY (worker_id) REFERENCES worker(id)
);

CREATE TABLE worker_time_card_period_total (
    "index" bigint,
    time_card_id text,
    rate_amount_value text,
    rate_base_multiplier_value integer,
    rate_currency_code text,
    time_duration text,
    PRIMARY KEY ("index", time_card_id),
    FOREIGN KEY (time_card_id) REFERENCES worker_time_card(id)
);

CREATE TABLE worker_assigned_location (
    id text,
    worker_assignment_id text,
    worker_id text,
    PRIMARY KEY (id, worker_assignment_id, worker_id),
    FOREIGN KEY (id) REFERENCES location(id),
    FOREIGN KEY (worker_assignment_id) REFERENCES work_assignment_history(worker_id),
    FOREIGN KEY (worker_id) REFERENCES worker(id)
);

CREATE TABLE person_history (
    _fivetran_id text,
    worker_id text,
    birth_date text,
    death_date text,
    deceased_indicator boolean,
    disability_identification_declined_indicator boolean,
    disability_percentage double precision,
    disabled_indicator boolean,
    ethnicity text,
    ethnicity_group text,
    gender text,
    gender_identity text,
    highest_education_level text,
    marital_status text,
    military_discharge_date text,
    military_status text,
    race text,
    religion text,
    sexual_orientation text,
    student_indicator boolean,
    student_status text,
    tobacco_user_indicator boolean,
    -- birthName_* (dynamic column),
    -- birthPlace_* (dynamic column),
    -- ethnicity_* (dynamic column),
    -- ethnicityGroup_* (dynamic column),
    -- gender_* (dynamic column),
    -- genderIdentity_* (dynamic column),
    -- highestEducationLevel_* (dynamic column),
    -- legalAddress_* (dynamic column),
    -- legalName_* (dynamic column),
    -- maritalStatus_* (dynamic column),
    -- militaryStatus_* (dynamic column),
    -- preferredName_* (dynamic column),
    -- race_* (dynamic column),
    -- religion_* (dynamic column),
    -- sexualOrientation_* (dynamic column),
    -- studentStatus_* (dynamic column),
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (worker_id) REFERENCES worker(id)
);

CREATE TABLE person_preferred_salutation (
    sequence_number text,
    "type" text,
    worker_id text,
    salutation text,
    -- salutation_* (dynamic column),
    -- type_* (dynamic column),
    PRIMARY KEY (sequence_number, "type", worker_id),
    FOREIGN KEY (worker_id) REFERENCES worker(id)
);

CREATE TABLE worker_classification (
    "type" text,
    id text,
    worker_assignment_id text,
    worker_id text,
    PRIMARY KEY ("type", id, worker_assignment_id, worker_id),
    FOREIGN KEY (id) REFERENCES classification(id),
    FOREIGN KEY (worker_assignment_id) REFERENCES work_assignment_history(worker_id),
    FOREIGN KEY (worker_id) REFERENCES worker(id)
);

CREATE TABLE worker_time_card_labor_allocation (
    "index" bigint,
    day_entry_index bigint,
    time_card_id text,
    time_entry_id text,
    allocation text,
    -- allocation_* (dynamic column),
    -- allocation_type_* (dynamic column),
    PRIMARY KEY ("index", day_entry_index, time_card_id, time_entry_id),
    FOREIGN KEY (day_entry_index) REFERENCES worker_time_card_day_entry("index"),
    FOREIGN KEY (time_card_id) REFERENCES worker_time_card(id),
    FOREIGN KEY (time_entry_id) REFERENCES worker_time_card_time_entry(entry_id)
);

CREATE TABLE base_remuneration_associated_rate_qualifier (
    id text,
    worker_assignment_id text,
    worker_id text,
    PRIMARY KEY (id, worker_assignment_id, worker_id),
    FOREIGN KEY (id) REFERENCES associated_rate_qualifier(id),
    FOREIGN KEY (worker_assignment_id) REFERENCES work_assignment_history(worker_id),
    FOREIGN KEY (worker_id) REFERENCES worker(id)
);

CREATE TABLE organizational_unit (
    id text,
    "name" text,
    "type" text,
    -- name_* (dynamic column),
    -- type_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE person_government_id (
    id text,
    worker_id text,
    country_code text,
    expiration_date text,
    item_id text,
    "name" text,
    "status" text,
    -- name_* (dynamic column),
    -- status_* (dynamic column),
    PRIMARY KEY (id, worker_id),
    FOREIGN KEY (worker_id) REFERENCES worker(id)
);

CREATE TABLE worker_assignment_cost_center (
    id text,
    worker_assignment_id text,
    worker_id text,
    cost_center_name text,
    cost_center_percentage double precision,
    PRIMARY KEY (id, worker_assignment_id, worker_id),
    FOREIGN KEY (worker_assignment_id) REFERENCES work_assignment_history(worker_id),
    FOREIGN KEY (worker_id) REFERENCES worker(id)
);

CREATE TABLE worker_time_card_home_labor_allocation (
    "index" bigint,
    time_card_id text,
    allocation_code_value text,
    allocation_type_code_value text,
    allocation_type_short_name text,
    PRIMARY KEY ("index", time_card_id),
    FOREIGN KEY (time_card_id) REFERENCES worker_time_card(id)
);

CREATE TABLE person_residency (
    "value" text,
    worker_id text,
    long_name text,
    short_name text,
    PRIMARY KEY ("value", worker_id),
    FOREIGN KEY (worker_id) REFERENCES worker(id)
);

CREATE TABLE worker_time_card (
    id text,
    worker_id text,
    associate_oid text,
    exceptions_indicator boolean,
    person_legal_name_family_name_1 text,
    person_legal_name_formatted_name text,
    person_legal_name_given_name text,
    position_id text,
    time_period_end_date text,
    time_period_period_status text,
    time_period_start_date text,
    total_period_time_duration text,
    PRIMARY KEY (id),
    FOREIGN KEY (worker_id) REFERENCES worker(id)
);

CREATE TABLE worker_base_remuneration (
    worker_assignment_id text,
    worker_id text,
    effective_date text,
    recording_basis text,
    -- annualRateAmount_* (dynamic column),
    -- biweeklyRateAmount_* (dynamic column),
    -- commissionRatePercentage_* (dynamic column),
    -- dailyRateAmount_* (dynamic column),
    -- hourlyRateAmount_* (dynamic column),
    -- monthlyRateAmount_* (dynamic column),
    -- payPeriodRateAmount_* (dynamic column),
    -- recordingBasis_* (dynamic column),
    -- semi_monthlyRateAmount_* (dynamic column),
    -- weeklyRateAmount_* (dynamic column),
    PRIMARY KEY (worker_assignment_id, worker_id),
    FOREIGN KEY (worker_assignment_id) REFERENCES work_assignment_history(worker_id),
    FOREIGN KEY (worker_id) REFERENCES worker(id)
);

CREATE TABLE worker_leave (
    associate_oid text,
    "index" bigint,
    worker_id text,
    effective_date_time text,
    links jsonb,
    -- leaveAbsence_* (dynamic column),
    -- leaveReturn_* (dynamic column),
    PRIMARY KEY (associate_oid, "index"),
    FOREIGN KEY (worker_id) REFERENCES worker(id)
);

CREATE TABLE other_personal_address (
    id text,
    worker_id text,
    attention_of_name text,
    block_name text,
    building_name text,
    building_number text,
    care_of_name text,
    city_name text,
    country_code text,
    country_subdivision_level_1 text,
    country_subdivision_level_2 text,
    delivery_point text,
    door text,
    floor text,
    formatted_birth_place text,
    geo_coordinate_latitude double precision,
    geo_coordinate_longitude double precision,
    line_five text,
    line_four text,
    line_one text,
    line_three text,
    line_two text,
    "name" text,
    plot_id text,
    post_office_box text,
    postal_code text,
    same_as_address_indicator boolean,
    script text,
    stair_case text,
    street_name text,
    street_type text,
    "type" text,
    unit text,
    -- name_* (dynamic column),
    -- script_* (dynamic column),
    -- streetType_* (dynamic column),
    -- type_* (dynamic column),
    PRIMARY KEY (id, worker_id),
    FOREIGN KEY (worker_id) REFERENCES worker(id)
);

CREATE TABLE classification (
    id text,
    classification text,
    "name" text,
    "type" text,
    -- classification_* (dynamic column),
    -- name_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE person_disability (
    "value" text,
    worker_id text,
    long_name text,
    short_name text,
    PRIMARY KEY ("value", worker_id),
    FOREIGN KEY (worker_id) REFERENCES worker(id)
);

CREATE TABLE worker_assigned_organizational_unit (
    id text,
    worker_assignment_id text,
    worker_id text,
    PRIMARY KEY (id, worker_assignment_id, worker_id),
    FOREIGN KEY (id) REFERENCES organizational_unit(id),
    FOREIGN KEY (worker_assignment_id) REFERENCES work_assignment_history(worker_id),
    FOREIGN KEY (worker_id) REFERENCES worker(id)
);

CREATE TABLE person_title_prefix (
    sequence_number text,
    "type" text,
    worker_id text,
    affix text,
    -- affix_* (dynamic column),
    PRIMARY KEY (sequence_number, "type", worker_id),
    FOREIGN KEY (worker_id) REFERENCES worker(id)
);

CREATE TABLE worker_group (
    id text,
    worker_assignment_id text,
    worker_id text,
    PRIMARY KEY (id, worker_assignment_id, worker_id),
    FOREIGN KEY (id) REFERENCES groups(id),
    FOREIGN KEY (worker_assignment_id) REFERENCES work_assignment_history(worker_id),
    FOREIGN KEY (worker_id) REFERENCES worker(id)
);

CREATE TABLE person_document (
    id text,
    "type" text,
    worker_id text,
    authorized_stay_duration text,
    country_code text,
    expiration_date text,
    issue_date text,
    issuing_party_address_attention_of_name text,
    issuing_party_address_block_name text,
    issuing_party_address_building_name text,
    issuing_party_address_building_number text,
    issuing_party_address_care_of_name text,
    issuing_party_address_city_name text,
    issuing_party_address_country_code text,
    issuing_party_address_country_subdivision_level_1 text,
    issuing_party_address_country_subdivision_level_2 text,
    issuing_party_address_delivery_point text,
    issuing_party_address_door text,
    issuing_party_address_floor text,
    issuing_party_address_formatted_birth_place text,
    issuing_party_address_geo_coordinate_latitude double precision,
    issuing_party_address_geo_coordinate_longitude double precision,
    issuing_party_address_item_id text,
    issuing_party_address_line_five text,
    issuing_party_address_line_four text,
    issuing_party_address_line_one text,
    issuing_party_address_line_three text,
    issuing_party_address_line_two text,
    issuing_party_address_name text,
    issuing_party_address_name_effective_date text,
    issuing_party_address_name_long_name text,
    issuing_party_address_name_short_name text,
    issuing_party_address_name_subdivision_type text,
    issuing_party_address_plot_id text,
    issuing_party_address_post_office_box text,
    issuing_party_address_postal_code text,
    issuing_party_address_same_as_address_indicator boolean,
    issuing_party_address_script text,
    issuing_party_address_script_effective_date text,
    issuing_party_address_script_long_name text,
    issuing_party_address_script_short_name text,
    issuing_party_address_script_subdivision_type text,
    issuing_party_address_stair_case text,
    issuing_party_address_street_name text,
    issuing_party_address_street_type text,
    issuing_party_address_street_type_effective_date text,
    issuing_party_address_street_type_long_name text,
    issuing_party_address_street_type_short_name text,
    issuing_party_address_street_type_subdivision_type text,
    issuing_party_address_type text,
    issuing_party_address_type_effective_date text,
    issuing_party_address_type_long_name text,
    issuing_party_address_type_short_name text,
    issuing_party_address_type_subdivision_type text,
    issuing_party_address_unit text,
    issuing_party_name text,
    issuing_party_name_effective_date text,
    issuing_party_name_long_name text,
    issuing_party_name_short_name text,
    issuing_party_name_subdivision_type text,
    item_id text,
    reentry_requirement_duration text,
    -- type_* (dynamic column),
    PRIMARY KEY (id, "type", worker_id),
    FOREIGN KEY (worker_id) REFERENCES worker(id)
);

CREATE TABLE person_social_insurance_program (
    id text,
    worker_id text,
    country_code text,
    coverage_period_end_date text,
    coverage_period_start_date text,
    covered_indicator boolean,
    "name" text,
    -- name_* (dynamic column),
    PRIMARY KEY (id, worker_id),
    FOREIGN KEY (worker_id) REFERENCES worker(id)
);

CREATE TABLE worker_time_card_daily_total (
    "index" bigint,
    time_card_id text,
    entry_date text,
    rate_amount_value text,
    rate_base_multiplier_value integer,
    rate_currency_code text,
    time_duration text,
    PRIMARY KEY ("index", time_card_id),
    FOREIGN KEY (time_card_id) REFERENCES worker_time_card(id)
);

CREATE TABLE person_title_affix (
    sequence_number text,
    "type" text,
    worker_id text,
    affix text,
    -- affix_* (dynamic column),
    PRIMARY KEY (sequence_number, "type", worker_id),
    FOREIGN KEY (worker_id) REFERENCES worker(id)
);

CREATE TABLE worker_pay_distribution_instruction (
    id text,
    worker_id text,
    worker_pay_distribution_id text,
    bonus_only_indicator boolean,
    deposit_account_financial_account_account_number text,
    deposit_account_financial_account_type text,
    deposit_account_financial_account_type_effective_date text,
    deposit_account_financial_account_type_long_name text,
    deposit_account_financial_account_type_short_name text,
    deposit_account_financial_account_type_subdivision_type text,
    deposit_account_financial_party_routing_transit_id_id_value text,
    instruction_status text,
    prenote_indicator boolean,
    remaining_balance_indicator boolean,
    -- instructionStatus_* (dynamic column),
    -- prenote_* (dynamic column),
    PRIMARY KEY (id, worker_id, worker_pay_distribution_id),
    FOREIGN KEY (worker_id) REFERENCES worker(id),
    FOREIGN KEY (worker_pay_distribution_id) REFERENCES worker_pay_distribution(item_id)
);

CREATE TABLE worker_time_card_entry_total (
    "index" bigint,
    day_entry_index bigint,
    time_card_id text,
    time_entry_id text,
    pay text,
    rate_amount_value double precision,
    rate_base_multiplier_value bigint,
    rate_currency_code text,
    time_duration text,
    -- pay_* (dynamic column),
    PRIMARY KEY ("index", day_entry_index, time_card_id, time_entry_id),
    FOREIGN KEY (day_entry_index) REFERENCES worker_time_card_day_entry("index"),
    FOREIGN KEY (time_card_id) REFERENCES worker_time_card(id),
    FOREIGN KEY (time_entry_id) REFERENCES worker_time_card_time_entry(entry_id)
);

CREATE TABLE worker (
    id text,
    acquisition_date text,
    adjusted_service_date text,
    associate_oid text,
    expected_termination_date text,
    original_hire_date text,
    photo_media_type text,
    photo_url text,
    rehire_date text,
    retirement_date text,
    termination_date text,
    -- status_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE groups (
    id text,
    "group" text,
    "name" text,
    -- group_* (dynamic column),
    -- name_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE work_assignment_history (
    id text,
    worker_id text,
    actual_start_date text,
    assignment_term text,
    bargaining_unit_effective_date text,
    bargaining_unit_long_name text,
    bargaining_unit_seniority_date text,
    bargaining_unit_short_name text,
    bargaining_unit_subdivision_type text,
    bargaining_unit_value text,
    compa_ratio double precision,
    executive_indicator boolean,
    executive_type text,
    expected_start_date text,
    expected_termination_date text,
    full_time_equivalence_ratio double precision,
    geographic_pay_differential text,
    geographic_pay_differential_percentage double precision,
    highly_compensated_indicator boolean,
    highly_compensated_type text,
    hire_date text,
    home_work_location_address_attention_of_name text,
    home_work_location_address_block_name text,
    home_work_location_address_building_name text,
    home_work_location_address_building_number text,
    home_work_location_address_care_of_name text,
    home_work_location_address_city_name text,
    home_work_location_address_country_code text,
    home_work_location_address_country_subdivision_level_1 text,
    home_work_location_address_country_subdivision_level_2 text,
    home_work_location_address_delivery_point text,
    home_work_location_address_door text,
    home_work_location_address_floor text,
    home_work_location_address_formatted_birth_place text,
    home_work_location_address_geo_coordinate_latitude double precision,
    home_work_location_address_geo_coordinate_longitude double precision,
    home_work_location_address_item_id text,
    home_work_location_address_line_five text,
    home_work_location_address_line_four text,
    home_work_location_address_line_one text,
    home_work_location_address_line_three text,
    home_work_location_address_line_two text,
    home_work_location_address_name text,
    home_work_location_address_name_effective_date text,
    home_work_location_address_name_long_name text,
    home_work_location_address_name_short_name text,
    home_work_location_address_name_subdivision_type text,
    home_work_location_address_plot_id text,
    home_work_location_address_post_office_box text,
    home_work_location_address_postal_code text,
    home_work_location_address_same_as_address_indicator boolean,
    home_work_location_address_script text,
    home_work_location_address_script_effective_date text,
    home_work_location_address_script_long_name text,
    home_work_location_address_script_short_name text,
    home_work_location_address_script_subdivision_type text,
    home_work_location_address_stair_case text,
    home_work_location_address_street_name text,
    home_work_location_address_street_type text,
    home_work_location_address_street_type_effective_date text,
    home_work_location_address_street_type_long_name text,
    home_work_location_address_street_type_short_name text,
    home_work_location_address_street_type_subdivision_type text,
    home_work_location_address_type text,
    home_work_location_address_type_effective_date text,
    home_work_location_address_type_long_name text,
    home_work_location_address_type_short_name text,
    home_work_location_address_type_subdivision_type text,
    home_work_location_address_unit text,
    home_work_location_name text,
    home_work_location_name_effective_date text,
    home_work_location_name_long_name text,
    home_work_location_name_short_name text,
    home_work_location_name_subdivision_type text,
    job text,
    job_function text,
    job_title text,
    labor_union_effective_date text,
    labor_union_long_name text,
    labor_union_seniority_date text,
    labor_union_short_name text,
    labor_union_subdivision_type text,
    labor_union_value text,
    legal_entity_id text,
    management_position_indicator boolean,
    minimum_pay_grade_step_duration text,
    nationality_context text,
    next_pay_grade_step_date text,
    offer_acceptance_date text,
    offer_extension_date text,
    officer_indicator boolean,
    officer_type text,
    pay_cycle text,
    pay_grade text,
    pay_grade_step text,
    pay_scale text,
    payroll_file_number text,
    payroll_group_code text,
    payroll_processing_status text,
    payroll_region_code text,
    payroll_schedule_group_id text,
    position_id text,
    position_title text,
    primary_indicator boolean,
    probation_period_end_date text,
    probation_period_start_date text,
    remuneration_basis text,
    seniority_date text,
    standard_hour_hours_quantity integer,
    standard_hour_unit text,
    standard_hour_unit_effective_date text,
    standard_hour_unit_long_name text,
    standard_hour_unit_short_name text,
    standard_hour_unit_subdivision_type text,
    standard_pay_period_hour_hours_quantity integer,
    standard_pay_period_hour_unit text,
    standard_pay_period_hour_unit_effective_date text,
    standard_pay_period_hour_unit_long_name text,
    standard_pay_period_hour_unit_short_name text,
    standard_pay_period_hour_unit_subdivision_type text,
    stock_owner_indicator boolean,
    stock_owner_percentage double precision,
    termination_date text,
    vip_indicator boolean,
    voluntary_indicator boolean,
    work_arrangement text,
    work_level text,
    work_shift text,
    worker_probation_indicator boolean,
    worker_type text,
    -- annualBenefitBaseRate_* (dynamic column),
    -- assignmentStatus_* (dynamic column),
    -- assignmentTerm_* (dynamic column),
    -- executiveType_* (dynamic column),
    -- geographicPayDifferential_* (dynamic column),
    -- highlyCompensatedType_* (dynamic column),
    -- job_* (dynamic column),
    -- jobFunction_* (dynamic column),
    -- nationalityContext_* (dynamic column),
    -- officerType_* (dynamic column),
    -- payCycle_* (dynamic column),
    -- payGrade_* (dynamic column),
    -- payGradeStep_* (dynamic column),
    -- payGradeStepPay_* (dynamic column),
    -- payrollProcessingStatus_* (dynamic column),
    -- payScale_* (dynamic column),
    -- remunerationBasis_* (dynamic column),
    -- wageLawCoverage_* (dynamic column),
    -- workArrangement_* (dynamic column),
    -- workerType_* (dynamic column),
    -- workLevel_* (dynamic column),
    -- workShift_* (dynamic column),
    PRIMARY KEY (id, worker_id),
    FOREIGN KEY (worker_id) REFERENCES worker(id)
);

CREATE TABLE location (
    id text,
    "name" text,
    -- address_* (dynamic column),
    -- name_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE associated_rate_qualifier (
    id text,
    item_id text,
    qualifier_object text,
    qualifier_object_type text,
    -- qualifierObject_* (dynamic column),
    -- qualifierObjectType_* (dynamic column),
    PRIMARY KEY (id)
);
