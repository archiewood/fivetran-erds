CREATE TABLE rotation_day (
    "day" text,
    rotation_id text,
    day_off_template text,
    end_time_maximum text,
    end_time_minimum text,
    rotation_name text,
    shift_category text,
    start_time_maximum text,
    start_time_minimum text,
    work_time_maximum text,
    work_time_minimum text,
    PRIMARY KEY ("day", rotation_id),
    FOREIGN KEY (day_off_template) REFERENCES day_off_template(id)
);

CREATE TABLE budget_group (
    id text,
    business_unit_id text,
    "name" text,
    PRIMARY KEY (id, business_unit_id),
    FOREIGN KEY (business_unit_id) REFERENCES business_unit(id)
);

CREATE TABLE skill (
    id text,
    business_unit_id text,
    activity_id text,
    activity_id text,
    description text,
    "name" text,
    resolution_minute text,
    skill_type_id text,
    skill_type_name text,
    skill_type_short_name text,
    staffing_threshold_critical_understaffing text,
    staffing_threshold_overstaffing text,
    staffing_threshold_understaffing text,
    staffing_threshold_understaffing_formax text,
    time_zone_id text,
    PRIMARY KEY (id, business_unit_id),
    FOREIGN KEY (business_unit_id) REFERENCES business_unit(id),
    FOREIGN KEY (activity_id) REFERENCES activity(id),
    FOREIGN KEY (activity_id) REFERENCES activity(id)
);

CREATE TABLE contract (
    id text,
    business_unit_id text,
    "name" text,
    PRIMARY KEY (id, business_unit_id),
    FOREIGN KEY (business_unit_id) REFERENCES business_unit(id)
);

CREATE TABLE optional_column (
    id text,
    business_unit_id text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (business_unit_id) REFERENCES business_unit(id)
);

CREATE TABLE role_application_function_collection (
    id text,
    role_id text,
    description text,
    function_code text,
    function_path text,
    PRIMARY KEY (id),
    FOREIGN KEY (role_id) REFERENCES "role"(id)
);

CREATE TABLE role_available_site (
    id text,
    role_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES site(id),
    FOREIGN KEY (role_id) REFERENCES "role"(id)
);

CREATE TABLE role_available_team (
    id text,
    role_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES team(id),
    FOREIGN KEY (role_id) REFERENCES "role"(id)
);

CREATE TABLE "role" (
    id text,
    business_unit_id text,
    global_level_authorization text,
    "name" text,
    PRIMARY KEY (id, business_unit_id),
    FOREIGN KEY (business_unit_id) REFERENCES business_unit(id)
);

CREATE TABLE workflow_control (
    id text,
    business_unit_id text,
    absence_request_expired_threshold text,
    "name" text,
    overtime_request_staffing_check_method_is_no text,
    PRIMARY KEY (id, business_unit_id),
    FOREIGN KEY (business_unit_id) REFERENCES business_unit(id)
);

CREATE TABLE parttime_percentage (
    id text,
    business_unit_id text,
    "name" text,
    PRIMARY KEY (id, business_unit_id),
    FOREIGN KEY (business_unit_id) REFERENCES business_unit(id)
);

CREATE TABLE employee_default (
    _fivetran_id text,
    business_unit_id text,
    contract_id text,
    part_time_percentage_id text,
    site_id text,
    team_id text,
    first_day_of_week text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (business_unit_id) REFERENCES business_unit(id),
    FOREIGN KEY (contract_id) REFERENCES contract(id),
    FOREIGN KEY (part_time_percentage_id) REFERENCES parttime_percentage(id),
    FOREIGN KEY (site_id) REFERENCES site(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE absence (
    id text,
    business_unit_id text,
    confidential text,
    in_contract_time text,
    in_paid_time text,
    in_work_time text,
    is_deleted text,
    "name" text,
    payroll_code text,
    priority text,
    requestable text,
    tracker_type text,
    PRIMARY KEY (id, business_unit_id),
    FOREIGN KEY (business_unit_id) REFERENCES business_unit(id)
);

CREATE TABLE skill_of_skill_group (
    id text,
    skill_group_id text,
    "name" text,
    PRIMARY KEY (id, skill_group_id),
    FOREIGN KEY (id) REFERENCES skill(id),
    FOREIGN KEY (skill_group_id) REFERENCES skill_group(id)
);

CREATE TABLE skill_group (
    id text,
    business_unit_id text,
    "name" text,
    PRIMARY KEY (id, business_unit_id),
    FOREIGN KEY (business_unit_id) REFERENCES business_unit(id)
);

CREATE TABLE multiplicator_definition_set (
    id text,
    business_unit_id text,
    multiplicator_type text,
    "name" text,
    PRIMARY KEY (id, business_unit_id),
    FOREIGN KEY (business_unit_id) REFERENCES business_unit(id)
);

CREATE TABLE site (
    id text,
    business_unit_id text,
    "name" text,
    short_name text,
    PRIMARY KEY (id, business_unit_id),
    FOREIGN KEY (business_unit_id) REFERENCES business_unit(id)
);

CREATE TABLE shift_category (
    id text,
    business_unit_id text,
    "name" text,
    short_name text,
    PRIMARY KEY (id, business_unit_id),
    FOREIGN KEY (business_unit_id) REFERENCES business_unit(id)
);

CREATE TABLE shift_bag (
    id text,
    business_unit_id text,
    "name" text,
    PRIMARY KEY (id, business_unit_id),
    FOREIGN KEY (business_unit_id) REFERENCES business_unit(id)
);

CREATE TABLE day_off_template (
    id text,
    business_unit_id text,
    "name" text,
    PRIMARY KEY (id, business_unit_id),
    FOREIGN KEY (business_unit_id) REFERENCES business_unit(id)
);

CREATE TABLE business_unit (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE schedule_change_shift (
    _fivetran_id text,
    absence_id text,
    activity_id text,
    schedule_change_date text,
    schedule_change_person_id text,
    confidential text,
    display_color_hex text,
    external_meeting_id text,
    "name" text,
    overtime text,
    period_endtime text,
    period_starttime text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (absence_id) REFERENCES absence(id),
    FOREIGN KEY (activity_id) REFERENCES activity(id),
    FOREIGN KEY (schedule_change_date) REFERENCES schedule_change("date"),
    FOREIGN KEY (schedule_change_person_id) REFERENCES schedule_change(person_id)
);

CREATE TABLE schedule_change (
    "date" text,
    person_id text,
    business_unit_id text,
    shift_category_id text,
    team_id text,
    day_off_name text,
    day_off_template_id text,
    shift_category_name text,
    shift_category_short_name text,
    PRIMARY KEY ("date", person_id, business_unit_id),
    FOREIGN KEY (business_unit_id) REFERENCES business_unit(id),
    FOREIGN KEY (shift_category_id) REFERENCES shift_category(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE availability_day (
    availability_id text,
    "day" text,
    business_unit_id text,
    availability_name text,
    end_time_maximum text,
    is_available text,
    start_time_minimum text,
    work_time_maximum text,
    work_time_minimum text,
    PRIMARY KEY (availability_id, "day", business_unit_id),
    FOREIGN KEY (business_unit_id) REFERENCES business_unit(id)
);

CREATE TABLE contract_schedule (
    id text,
    business_unit_id text,
    "name" text,
    PRIMARY KEY (id, business_unit_id),
    FOREIGN KEY (business_unit_id) REFERENCES business_unit(id)
);

CREATE TABLE people_skill (
    people_id text,
    skill_id text,
    active text,
    proficiency text,
    PRIMARY KEY (people_id, skill_id),
    FOREIGN KEY (people_id) REFERENCES people(id),
    FOREIGN KEY (skill_id) REFERENCES skill(id)
);

CREATE TABLE people_role (
    people_id text,
    role_id text,
    business_unit_id text,
    PRIMARY KEY (people_id, role_id),
    FOREIGN KEY (people_id) REFERENCES people(id),
    FOREIGN KEY (role_id) REFERENCES "role"(id),
    FOREIGN KEY (business_unit_id) REFERENCES business_unit(id)
);

CREATE TABLE people (
    id text,
    budget_group_id text,
    business_unit_id text,
    contract_id text,
    contract_schedule_id text,
    part_time_percentage_id text,
    shift_bag_id text,
    site_id text,
    team_id text,
    workflow_control_set_id text,
    display_name text,
    email text,
    employment_number text,
    employment_start_date text,
    first_day_of_week text,
    first_name text,
    identities text,
    last_name text,
    note text,
    optional_columns text,
    part_time_percentage_id text,
    termination_date text,
    time_zone_id text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (budget_group_id) REFERENCES budget_group(id),
    FOREIGN KEY (business_unit_id) REFERENCES business_unit(id),
    FOREIGN KEY (contract_id) REFERENCES contract(id),
    FOREIGN KEY (contract_schedule_id) REFERENCES contract_schedule(id),
    FOREIGN KEY (part_time_percentage_id) REFERENCES parttime_percentage(id),
    FOREIGN KEY (shift_bag_id) REFERENCES shift_bag(id),
    FOREIGN KEY (site_id) REFERENCES site(id),
    FOREIGN KEY (team_id) REFERENCES team(id),
    FOREIGN KEY (workflow_control_set_id) REFERENCES workflow_control(id),
    FOREIGN KEY (part_time_percentage_id) REFERENCES parttime_percentage(id)
);

CREATE TABLE team (
    id text,
    business_unit_id text,
    site_id text,
    "name" text,
    PRIMARY KEY (id, business_unit_id),
    FOREIGN KEY (business_unit_id) REFERENCES business_unit(id),
    FOREIGN KEY (site_id) REFERENCES site(id)
);

CREATE TABLE forecast_skill_detail (
    _fivetran_id text,
    business_unit_id text,
    agent text,
    average_after_task_time_second text,
    average_task_time_second text,
    campaign_after_task_time_percent text,
    campaign_task_time_percent text,
    campaign_tasks_percent text,
    forecast_id text,
    period_end_time text,
    period_start_time text,
    task text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (business_unit_id) REFERENCES business_unit(id)
);

CREATE TABLE scenario (
    id text,
    business_unit_id text,
    default_scenario text,
    description text,
    enable_reporting text,
    restricted text,
    PRIMARY KEY (id, business_unit_id),
    FOREIGN KEY (business_unit_id) REFERENCES business_unit(id)
);

CREATE TABLE activity (
    id text,
    business_unit_id text,
    allow_overwrite text,
    in_contract_time text,
    in_paid_time text,
    in_ready_time text,
    in_work_time text,
    is_deleted text,
    "name" text,
    payroll_code text,
    report_level_detail text,
    requires_seat text,
    requires_skill text,
    PRIMARY KEY (id, business_unit_id),
    FOREIGN KEY (business_unit_id) REFERENCES business_unit(id)
);
