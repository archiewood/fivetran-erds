CREATE TABLE groups (
    id text,
    building_id text,
    description text,
    "name" text,
    subscription_notification text,
    PRIMARY KEY (id),
    FOREIGN KEY (building_id) REFERENCES building(id)
);

CREATE TABLE reservation_communication_log (
    _fivetran_id text,
    reservation_id text,
    "date" text,
    message text,
    shared_with_user text,
    updated_by text,
    PRIMARY KEY (_fivetran_id, reservation_id),
    FOREIGN KEY (reservation_id) REFERENCES reservation(id)
);

CREATE TABLE reservation (
    id text,
    amenity_id text,
    amenity_name text,
    building_name text,
    company_name text,
    archived text,
    billable_status text,
    flagged text,
    "name" text,
    number_of_days text,
    shared text,
    start_date text,
    submitted_by text,
    updated text,
    PRIMARY KEY (id),
    FOREIGN KEY (amenity_id) REFERENCES amenity(id),
    FOREIGN KEY (amenity_name) REFERENCES amenity("name"),
    FOREIGN KEY (building_name) REFERENCES building("name"),
    FOREIGN KEY (company_name) REFERENCES company("name")
);

CREATE TABLE amenity_attachment (
    _fivetran_id text,
    amenity_id text,
    added_by text,
    date_added text,
    link text,
    "name" text,
    PRIMARY KEY (_fivetran_id, amenity_id),
    FOREIGN KEY (amenity_id) REFERENCES amenity(id)
);

CREATE TABLE equipment_comment (
    equipment_id text,
    task_id text,
    job_id text,
    "comment" text,
    "date" text,
    email text,
    job_status text,
    task_status text,
    PRIMARY KEY (equipment_id, task_id),
    FOREIGN KEY (equipment_id) REFERENCES equipment(id),
    FOREIGN KEY (task_id) REFERENCES task(id),
    FOREIGN KEY (job_id) REFERENCES job(id)
);

CREATE TABLE certificate_attachment (
    _fivetran_id text,
    certificate_id text,
    link text,
    "name" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (certificate_id) REFERENCES certificate(id)
);

CREATE TABLE task_designee (
    id text,
    task_id text,
    job_id text,
    assigned_date text,
    first_name text,
    last_name text,
    notes text,
    "status" text,
    task_time text,
    updated_date text,
    user_type text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id, task_id),
    FOREIGN KEY (task_id) REFERENCES task(id),
    FOREIGN KEY (job_id) REFERENCES job(id)
);

CREATE TABLE request_designee (
    request_id text,
    user_id text,
    date_assigned text,
    priority text,
    PRIMARY KEY (request_id, user_id),
    FOREIGN KEY (request_id) REFERENCES request(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE job (
    id text,
    building_name text,
    equipment_name text,
    after_hours text,
    archived text,
    auto_renewal text,
    ends text,
    frequency text,
    job_type text,
    starts text,
    template text,
    PRIMARY KEY (id),
    FOREIGN KEY (building_name) REFERENCES building("name"),
    FOREIGN KEY (equipment_name) REFERENCES equipment("name")
);

CREATE TABLE task (
    id text,
    building_name text,
    job_id text,
    job_name text,
    user_id text,
    completed_date text,
    due_date text,
    equipment_name text,
    estimated_time text,
    systems text,
    task_priority text,
    task_status text,
    total_task_time text,
    PRIMARY KEY (id),
    FOREIGN KEY (building_name) REFERENCES equipment("name"),
    FOREIGN KEY (job_id) REFERENCES job(id),
    FOREIGN KEY (job_name) REFERENCES job(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE equipment_update (
    equipment_id text,
    job_id text,
    task_id text,
    "date" text,
    email text,
    "status" text,
    "update" text,
    PRIMARY KEY (equipment_id, job_id),
    FOREIGN KEY (equipment_id) REFERENCES equipment(id),
    FOREIGN KEY (job_id) REFERENCES job(id),
    FOREIGN KEY (task_id) REFERENCES task(id)
);

CREATE TABLE company (
    id text,
    building_id text,
    identifier text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (building_id) REFERENCES building(id)
);

CREATE TABLE equipment_job (
    equipment_id text,
    job_id text,
    frequency text,
    "name" text,
    PRIMARY KEY (equipment_id, job_id),
    FOREIGN KEY (equipment_id) REFERENCES equipment(id),
    FOREIGN KEY (job_id) REFERENCES job(id)
);

CREATE TABLE user_building (
    "index" text,
    user_id text,
    bid text,
    is_primary text,
    "name" text,
    PRIMARY KEY ("index", user_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (bid) REFERENCES building(id)
);

CREATE TABLE user_mc_permission (
    "index" text,
    user_id text,
    code text,
    "name" text,
    permission text,
    "value" text,
    PRIMARY KEY ("index", user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE user_mtm_permission (
    "index" text,
    user_id text,
    code text,
    html_name text,
    "name" text,
    permission text,
    "value" text,
    PRIMARY KEY ("index", user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE user_tc_permission (
    "index" text,
    user_id text,
    code text,
    "name" text,
    permission text,
    "value" text,
    PRIMARY KEY ("index", user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE user_sms_message (
    id text,
    user_id text,
    date_added text,
    message text,
    sms_number text,
    "type" text,
    viewed text,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    building_id text,
    company_id text,
    emergency_phone text,
    fax text,
    first_name text,
    floor text,
    job_title text,
    last_name text,
    lease_id text,
    messages jsonb,
    mobile_phone text,
    phone text,
    primary_email text,
    secondary_email text,
    suite text,
    tertiary_email text,
    timezone text,
    user_name text,
    user_photo text,
    user_type text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (building_id) REFERENCES building(id),
    FOREIGN KEY (company_id) REFERENCES company(id)
);

CREATE TABLE job_update (
    job_id text,
    task_id text,
    "date" text,
    email text,
    "status" text,
    "update" text,
    PRIMARY KEY (job_id),
    FOREIGN KEY (job_id) REFERENCES job(id),
    FOREIGN KEY (task_id) REFERENCES task(id)
);

CREATE TABLE job_task (
    job_id text,
    task_id text,
    "date" text,
    designees text,
    frequency text,
    PRIMARY KEY (job_id, task_id),
    FOREIGN KEY (job_id) REFERENCES job(id),
    FOREIGN KEY (task_id) REFERENCES task(id)
);

CREATE TABLE reservation_attachment (
    "name" text,
    reservation_id text,
    added_by text,
    date_added text,
    link text,
    shared_with_user text,
    PRIMARY KEY ("name", reservation_id),
    FOREIGN KEY (reservation_id) REFERENCES reservation(id)
);

CREATE TABLE certificate (
    id text,
    building_name text,
    company_name text,
    associated text,
    compliant text,
    contact text,
    general_liability_expiration text,
    nearest_expiration text,
    needs_approval text,
    "status" text,
    "type" text,
    updated text,
    PRIMARY KEY (id),
    FOREIGN KEY (building_name) REFERENCES building("name"),
    FOREIGN KEY (company_name) REFERENCES company("name")
);

CREATE TABLE equipment (
    id text,
    age text,
    anticipated_lifespan text,
    building text,
    cost text,
    description text,
    installation_cost text,
    installed_date text,
    location text,
    make text,
    "name" text,
    notes text,
    number text,
    purchase_date text,
    replacement_cost text,
    serial_number text,
    sub_location text,
    systems text,
    "type" text,
    updated text,
    updates jsonb,
    warranty_expiration text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE amenity (
    id text,
    building_name text,
    available text,
    "name" text,
    orders text,
    reservations text,
    shared text,
    PRIMARY KEY (id),
    FOREIGN KEY (building_name) REFERENCES building("name")
);

CREATE TABLE amenity_detail_scheduled_closing (
    _fivetran_id text,
    amenity_detail_id text,
    amenity_detail_name text,
    closing text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (amenity_detail_id) REFERENCES amenity_detail(amenity_id),
    FOREIGN KEY (amenity_detail_name) REFERENCES amenity_detail("name")
);

CREATE TABLE amenity_detail (
    "name" text,
    amenity_id text,
    allow_for_vendor_details text,
    available_days text,
    description text,
    future_reservation_limitations text,
    location text,
    max_capacity text,
    max_requestable_days text,
    minimum_edit_cancel_time text,
    minimum_notice text,
    reservation_admin_contact text,
    reservation_alerts text,
    reservation_options text,
    reservation_times text,
    setup_options text,
    time_between_reservations text,
    PRIMARY KEY ("name", amenity_id),
    FOREIGN KEY (amenity_id) REFERENCES amenity(id)
);

CREATE TABLE building (
    id text,
    city text,
    client_building_id text,
    country text,
    "name" text,
    "state" text,
    street_1 text,
    street_2 text,
    timezone text,
    url text,
    zipcode text,
    PRIMARY KEY (id)
);

CREATE TABLE job_detail_additional_information (
    "index" text,
    job_id text,
    accounting_info text,
    additional_comments text,
    estimated_down_time text,
    instructions text,
    safety_notes text,
    tenant_related text,
    tools_required text,
    PRIMARY KEY ("index", job_id),
    FOREIGN KEY (job_id) REFERENCES job_detail(job_id)
);

CREATE TABLE job_custom (
    "name" text,
    job_id text,
    selected text,
    "type" text,
    PRIMARY KEY ("name", job_id),
    FOREIGN KEY (job_id) REFERENCES job(id)
);

CREATE TABLE job_detail (
    job_id text,
    client_bid text,
    equipment_id text,
    id text,
    building text,
    created text,
    date_range text,
    estimated_time text,
    location text,
    "name" text,
    priority text,
    sub_location text,
    systems text,
    updated text,
    PRIMARY KEY (job_id),
    FOREIGN KEY (client_bid) REFERENCES building(client_building_id),
    FOREIGN KEY (equipment_id) REFERENCES equipment(id),
    FOREIGN KEY (id) REFERENCES job(id)
);

CREATE TABLE certificate_detail (
    certificate_id text,
    additional_insured_company_1 text,
    additional_insured_company_2 text,
    additional_insured_company_3 text,
    additional_insured_company_4 text,
    additional_insured_endorsement text,
    archived text,
    authorized_representative text,
    automobile_liability_any_auto text,
    automobile_liability_bodily_injury_limit text,
    automobile_liability_bodily_injury_limit_met text,
    automobile_liability_bodily_injury_limit_minimum text,
    automobile_liability_combined_single_limit text,
    automobile_liability_combined_single_limit_met text,
    automobile_liability_combined_single_limit_minimum text,
    automobile_liability_expired text,
    automobile_liability_hired_autos text,
    automobile_liability_non_owned_autos text,
    automobile_liability_occur text,
    automobile_liability_policy_effective_date text,
    automobile_liability_policy_expiration_date text,
    automobile_liability_policy_number text,
    automobile_liability_property_damage_limit text,
    automobile_liability_property_damage_limit_met text,
    automobile_liability_property_damage_limit_minimum text,
    automobile_liability_scheduled_autos text,
    automobile_liability_waiver_of_subrogation text,
    companies_affording_coverage_am_best_rating_company_a text,
    companies_affording_coverage_am_best_rating_company_b text,
    companies_affording_coverage_am_best_rating_company_c text,
    companies_affording_coverage_am_best_rating_company_d text,
    companies_affording_coverage_am_best_rating_company_e text,
    companies_affording_coverage_am_best_rating_company_f text,
    companies_affording_coverage_company_a text,
    companies_affording_coverage_company_b text,
    companies_affording_coverage_company_c text,
    companies_affording_coverage_company_d text,
    companies_affording_coverage_company_e text,
    companies_affording_coverage_company_f text,
    crime_employee_dishonesty_limit text,
    crime_employee_dishonesty_limit_met text,
    crime_employee_dishonesty_limit_minimum text,
    crime_expired text,
    crime_policy_effective_date text,
    crime_policy_number text,
    crime_policyexpirationdate text,
    cyber_liability_aggregate_limit text,
    cyber_liability_aggregate_limit_met text,
    cyber_liability_aggregate_limit_minimum text,
    cyber_liability_each_occurrence_limit text,
    cyber_liability_each_occurrence_limit_met text,
    cyber_liability_each_occurrence_limit_minimum text,
    cyber_liability_expired text,
    cyber_liability_policy_effective_date text,
    cyber_liability_policy_expiration_date text,
    cyber_liability_policy_number text,
    date_added text,
    employee_practices_insuranceaggregate_limit text,
    employee_practices_insuranceaggregate_limit_met text,
    employee_practices_insuranceaggregate_limit_minimum text,
    employee_practices_insuranceeach_occurrence_limit text,
    employee_practices_insuranceeach_occurrence_limit_met text,
    employee_practices_insuranceeach_occurrence_limit_minimum text,
    employee_practices_insuranceexpired text,
    employee_practices_insurancepolicy_effective_date text,
    employee_practices_insurancepolicy_expiration_date text,
    employee_practices_insurancepolicy_number text,
    excess_liability_aggregate_limit text,
    excess_liability_aggregate_limit_met text,
    excess_liability_aggregate_limit_minimum text,
    excess_liability_each_occurrence_limit text,
    excess_liability_each_occurrence_limit_met text,
    excess_liability_each_occurrence_limit_minimum text,
    excess_liability_expired text,
    excess_liability_other_than_umbrella_form text,
    excess_liability_policy_effective_date text,
    excess_liability_policy_expiration_date text,
    excess_liability_policy_number text,
    excess_liability_umbrella_form text,
    excess_liability_waiver_of_subrogation text,
    garage_liability_aggregate_limit text,
    garage_liability_aggregate_limit_met text,
    garage_liability_aggregate_limit_minimum text,
    garage_liability_any_auto text,
    garage_liability_auto_only_ea_accident_limit text,
    garage_liability_auto_only_ea_accident_limit_met text,
    garage_liability_auto_only_ea_accident_limit_minimum text,
    garage_liability_each_accident_limit text,
    garage_liability_each_accident_limit_met text,
    garage_liability_each_accident_limit_minimum text,
    garage_liability_expired text,
    garage_liability_other_than_auto_only_limit text,
    garage_liability_other_than_auto_only_limit_met text,
    garage_liability_other_than_auto_only_limit_minimum text,
    garage_liability_policy_effective_date text,
    garage_liability_policy_expiration_date text,
    garage_liability_policy_number text,
    garage_liability_waiver_of_subrogation text,
    general_liability_claims_made text,
    general_liability_each_occurrence_limit text,
    general_liability_each_occurrence_limit_met text,
    general_liability_each_occurrence_limit_minimum text,
    general_liability_expired text,
    general_liability_fire_damage_limit text,
    general_liability_fire_damage_limit_met text,
    general_liability_fire_damage_limit_minimum text,
    general_liability_general_aggregate_limit text,
    general_liability_general_aggregate_limit_met text,
    general_liability_general_aggregate_limit_minimum text,
    general_liability_independent_contracts text,
    general_liability_med_exp_limit text,
    general_liability_med_exp_limit_met text,
    general_liability_med_exp_limit_minimum text,
    general_liability_occur text,
    general_liability_other_limit text,
    general_liability_policy_effective_date text,
    general_liability_policy_expiration_date text,
    general_liability_policy_number text,
    general_liability_products_comp_op_agg_limit text,
    general_liability_products_comp_op_agg_limit_met text,
    general_liability_products_comp_op_agg_limit_minimum text,
    general_liability_waiver_of_subrogation text,
    insured_city text,
    insured_contact_person text,
    insured_email text,
    insured_fax text,
    insured_secondary_email text,
    insured_state text,
    insured_street_1 text,
    insured_street_2 text,
    insured_telephone text,
    insured_zip text,
    limits text,
    manual_compliance text,
    notification_comments text,
    notifications text,
    other text,
    personal_advertising_injuryaggregate_limit text,
    personal_advertising_injuryaggregate_limit_met text,
    personal_advertising_injuryaggregate_limit_minimum text,
    personal_advertising_injuryeach_occurrence_limit text,
    personal_advertising_injuryeach_occurrence_limit_met text,
    personal_advertising_injuryeach_occurrence_limit_minimum text,
    personal_advertising_injuryexpired text,
    personal_advertising_injurypolicy_effective_date text,
    personal_advertising_injurypolicy_expiration_date text,
    personal_advertising_injurypolicy_number text,
    producer_am_best_rating text,
    producer_city text,
    producer_company text,
    producer_contact_person text,
    producer_email text,
    producer_fax text,
    producer_state text,
    producer_street_1 text,
    producer_street_2 text,
    producer_telephone text,
    producer_zip text,
    professional_liability_aggregate_limit text,
    professional_liability_aggregate_limit_met text,
    professional_liability_aggregate_limit_minimum text,
    professional_liability_each_occurrence_limit text,
    professional_liability_each_occurrence_limit_met text,
    professional_liability_each_occurrence_limit_minimum text,
    professional_liability_expired text,
    professional_liability_policy_effective_date text,
    professional_liability_policy_expiration_date text,
    professional_liability_policy_number text,
    property_insurance_business_interruption text,
    property_insurance_each_occurrence_limit text,
    property_insurance_each_occurrence_limit_met text,
    property_insurance_each_occurrence_limit_minimum text,
    property_insurance_expired text,
    property_insurance_leaseholdimprovements text,
    property_insurance_policy_effective_date text,
    property_insurance_policy_expiration_date text,
    property_insurance_policy_number text,
    property_insurance_waiver_of_subrogation text,
    workers_compensation_el_disease_ea_employee_limit text,
    workers_compensation_el_disease_ea_employee_limit_met text,
    workers_compensation_el_disease_ea_employee_limit_minimum text,
    workers_compensation_el_disease_policy_limit text,
    workers_compensation_el_disease_policy_limit_met text,
    workers_compensation_el_disease_policy_limit_minimum text,
    workers_compensation_el_ea_accident_limit text,
    workers_compensation_el_ea_accident_limit_met text,
    workers_compensation_el_ea_accident_limit_minimum text,
    workers_compensation_expired text,
    workers_compensation_policy_effective_date text,
    workers_compensation_policy_expiration_date text,
    workers_compensation_policy_number text,
    workers_compensation_statutory_limits text,
    PRIMARY KEY (certificate_id),
    FOREIGN KEY (certificate_id) REFERENCES certificate(id)
);

CREATE TABLE reservation_schedule (
    vendor_name text,
    reservation_id text,
    "date" text,
    end_time text,
    flagged text,
    start_time text,
    vendor text,
    vendor_email text,
    vendor_end_time text,
    vendor_notes text,
    vendor_phone text,
    vendor_start_time text,
    PRIMARY KEY (vendor_name, reservation_id),
    FOREIGN KEY (reservation_id) REFERENCES reservation(id)
);

CREATE TABLE request_log (
    id text,
    request_id text,
    "date" text,
    email text,
    message text,
    notify_tenant text,
    request_status text,
    sent_emails text,
    "type" text,
    update_location text,
    PRIMARY KEY (id, request_id),
    FOREIGN KEY (request_id) REFERENCES request(id)
);

CREATE TABLE request_billable_item (
    id text,
    accounting_id text,
    "date" text,
    labor_acct_code text,
    labor_ch_code text,
    labor_description text,
    labor_markup text,
    labor_markup_percent text,
    labor_rate text,
    labor_tax text,
    labor_tax_percent text,
    labor_time text,
    lease_id text,
    materials_acct_code text,
    materials_chc_code text,
    materials_cost text,
    materials_description text,
    materials_markup text,
    materials_markup_percent text,
    materials_quantity text,
    materials_tax text,
    materials_tax_percent text,
    "name" text,
    po_number text,
    sales_tax text,
    sales_tax_percent text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES request(id)
);

CREATE TABLE request (
    id text,
    building_id text,
    company_name text,
    created_by_user_id text,
    billable_status text,
    contact text,
    description text,
    email text,
    location text,
    phone text,
    request_status text,
    requested_date text,
    satisfaction_rating text,
    service_type text,
    staff_finalized_date text,
    staff_finalized_status text,
    staff_finalized_time text,
    staff_initial_response_date text,
    staff_initial_response_time text,
    suite_floor text,
    updated text,
    worked_time text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (building_id) REFERENCES building(id),
    FOREIGN KEY (company_name) REFERENCES company("name"),
    FOREIGN KEY (created_by_user_id) REFERENCES users(id)
);

CREATE TABLE job_comment (
    job_id text,
    task_id text,
    "comment" text,
    "date" text,
    PRIMARY KEY (job_id),
    FOREIGN KEY (job_id) REFERENCES job(id),
    FOREIGN KEY (task_id) REFERENCES task(id)
);

CREATE TABLE reservation_detail (
    reservation_id text,
    attendee_list text,
    attendees text,
    contact_alt_phone text,
    contact_email text,
    contact_name text,
    contact_phone text,
    date_created text,
    reservation_contact_alt_phone text,
    reservation_contact_email text,
    reservation_contact_name text,
    reservation_contact_phone text,
    reservation_options text,
    setup_options text,
    special_requests text,
    "status" text,
    submitted_location text,
    PRIMARY KEY (reservation_id),
    FOREIGN KEY (reservation_id) REFERENCES reservation(id)
);

CREATE TABLE service_type (
    id text,
    accounting_id text,
    active text,
    building text,
    designees text,
    display_order text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (accounting_id) REFERENCES request_billable_item(accounting_id)
);

CREATE TABLE reservation_billable_item (
    lease_id text,
    reservation_id text,
    billable_note text,
    date_added text,
    description text,
    hourly_rate text,
    mark_up_dollar text,
    mark_up_percent text,
    materials_cost text,
    po_number text,
    quantity text,
    "status" text,
    tax_dollar text,
    tax_percent text,
    "time" text,
    "type" text,
    view_markups text,
    PRIMARY KEY (lease_id, reservation_id),
    FOREIGN KEY (reservation_id) REFERENCES reservation(id)
);

CREATE TABLE certificate_email_history (
    _fivetran_id text,
    certificate_id text,
    date_sent text,
    email_type text,
    message text,
    receiver text,
    sender text,
    subject text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (certificate_id) REFERENCES certificate(id)
);

CREATE TABLE request_hold_time (
    request_id text,
    id text,
    added_by text,
    added_date text,
    end_date text,
    note text,
    reason text,
    reason_other text,
    start_date text,
    PRIMARY KEY (request_id),
    FOREIGN KEY (id) REFERENCES request(id)
);

CREATE TABLE history (
    note_id text,
    added_by text,
    company_name text,
    user_id text,
    application text,
    application_record_id text,
    building text,
    communication_sent text,
    communication_subject text,
    contact text,
    date_added text,
    message text,
    title text,
    user_live text,
    user_type text,
    PRIMARY KEY (note_id),
    FOREIGN KEY (added_by) REFERENCES users(user_name),
    FOREIGN KEY (company_name) REFERENCES company("name"),
    FOREIGN KEY (user_id) REFERENCES users(id)
);
