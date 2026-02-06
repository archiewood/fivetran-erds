CREATE TABLE project (
    id text,
    customer_id text,
    active text,
    billable_default text,
    billed_completely text,
    billed_money text,
    budget_is_hours text,
    budget_is_not_strict text,
    budget_money text,
    completed text,
    completed_at text,
    deadline text,
    "name" text,
    note text,
    number text,
    revenue_factor text,
    test_data text,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE entry (
    id text,
    customer_id text,
    project_id text,
    user_id text,
    billable text,
    clocked text,
    clocked_offline text,
    duration text,
    hourly_rate text,
    revenue text,
    service_id text,
    service_name text,
    test_data text,
    text text,
    text_id text,
    time_clocked_since text,
    time_insert text,
    time_last_change text,
    time_last_change_work_time text,
    time_since text,
    time_until text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE target_hour (
    id text,
    surcharge_id text,
    user_id text,
    absence_fixed_credit text,
    compensation_daily text,
    compensation_monthly text,
    date_since text,
    date_until text,
    friday text,
    monday text,
    saturday text,
    sunday text,
    test_data text,
    thursday text,
    tuesday text,
    "type" text,
    wednesday text,
    PRIMARY KEY (id),
    FOREIGN KEY (surcharge_id) REFERENCES surcharge(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE user_report_day_detail (
    "date" text,
    month_number text,
    user_id text,
    week_number text,
    count_absence_home_office text,
    count_absence_maternity_protection text,
    count_absence_military_service text,
    count_absence_out_of_office text,
    count_absence_quarantine text,
    count_absence_regular_holidays text,
    count_absence_school text,
    count_absence_sick_child text,
    count_absence_sick_self text,
    count_absence_special_leaves text,
    count_reduction_used text,
    diff text,
    hours text,
    hours_without_compensation text,
    nonbusiness text,
    surcharges_night text,
    surcharges_night_increased text,
    surcharges_nonbusiness text,
    surcharges_nonbusiness_special text,
    surcharges_saturday text,
    surcharges_sunday text,
    target text,
    target_raw text,
    weekday text,
    work_end text,
    work_start text,
    PRIMARY KEY ("date", month_number, user_id, week_number),
    FOREIGN KEY (month_number) REFERENCES user_report_week_detail(month_number),
    FOREIGN KEY (user_id) REFERENCES user_report_week_detail(user_id),
    FOREIGN KEY (week_number) REFERENCES user_report_week_detail(week_number)
);

CREATE TABLE user_report_week_detail (
    week_number text,
    month_number text,
    user_id text,
    "year" text,
    diff text,
    sum_hours text,
    sum_reduction_used text,
    sum_target text,
    surcharges_night text,
    surcharges_night_increased text,
    surcharges_nonbusiness text,
    surcharges_nonbusiness_special text,
    surcharges_saturday text,
    surcharges_sunday text,
    PRIMARY KEY (week_number, month_number, user_id, "year"),
    FOREIGN KEY (month_number) REFERENCES user_report_month_detail(month_number),
    FOREIGN KEY (user_id) REFERENCES user_report_month_detail(user_id),
    FOREIGN KEY ("year") REFERENCES user_report_month_detail("year")
);

CREATE TABLE user_report_month_detail (
    month_number text,
    user_id text,
    "year" text,
    diff text,
    sum_hours text,
    sum_hours_without_compensation text,
    sum_overtime_reduced text,
    sum_reduction_used text,
    sum_target text,
    surcharges_night text,
    surcharges_night_increased text,
    surcharges_nonbusiness text,
    surcharges_nonbusiness_special text,
    surcharges_saturday text,
    surcharges_sunday text,
    PRIMARY KEY (month_number, user_id, "year"),
    FOREIGN KEY (user_id) REFERENCES user_report(user_id),
    FOREIGN KEY ("year") REFERENCES user_report("year")
);

CREATE TABLE user_report (
    "year" text,
    user_id text,
    diff text,
    holidays_carry text,
    holidays_quota text,
    overtime_carryover text,
    overtime_reduced text,
    sum_absence_home_office text,
    sum_absence_maternity_protection text,
    sum_absence_military_service text,
    sum_absence_out_of_office text,
    sum_absence_quarantine text,
    sum_absence_regular_holidays text,
    sum_absence_school text,
    sum_absence_sick_child text,
    sum_absence_sick_self text,
    sum_absence_special_leaves text,
    sum_hours text,
    sum_reduction_planned text,
    sum_reduction_used text,
    sum_target text,
    surcharges_night text,
    surcharges_night_increased text,
    surcharges_nonbusiness text,
    surcharges_nonbusiness_special text,
    surcharges_saturday text,
    surcharges_sunday text,
    workdays text,
    PRIMARY KEY ("year", user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE worktime_interval_change (
    "index" text,
    worktime_change_request_id text,
    time_since text,
    time_until text,
    "type" text,
    PRIMARY KEY ("index", worktime_change_request_id),
    FOREIGN KEY (worktime_change_request_id) REFERENCES worktime_change_request(id)
);

CREATE TABLE worktime_change_request (
    id text,
    declined_by_id text,
    user_id text,
    "date" text,
    declined_at text,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (declined_by_id) REFERENCES users(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE surcharge (
    id text,
    accumulation text,
    "name" text,
    night_increased_percent text,
    night_increased_time_since text,
    night_increased_time_since_is_previous_day text,
    night_increased_time_until text,
    night_increased_time_until_is_next_day text,
    night_percent text,
    night_time_since text,
    night_time_since_is_previous_day text,
    night_time_until text,
    night_time_until_is_next_day text,
    nonbusiness_percent text,
    nonbusiness_special_percent text,
    nonbusiness_special_time_since text,
    nonbusiness_special_time_since_is_previous_day text,
    nonbusiness_special_time_until text,
    nonbusiness_special_time_until_is_next_day text,
    nonbusiness_time_since text,
    nonbusiness_time_since_is_previous_day text,
    nonbusiness_time_until text,
    nonbusiness_time_until_is_next_day text,
    saturday_percent text,
    saturday_time_since text,
    saturday_time_since_is_previous_day text,
    saturday_time_until text,
    saturday_time_until_is_next_day text,
    sunday_percent text,
    sunday_time_since text,
    sunday_time_since_is_previous_day text,
    sunday_time_until text,
    sunday_time_until_is_next_day text,
    PRIMARY KEY (id)
);

CREATE TABLE customer (
    id text,
    active text,
    billable_default text,
    color text,
    "name" text,
    note text,
    number text,
    test_data text,
    PRIMARY KEY (id)
);

CREATE TABLE absence (
    id text,
    approved_by text,
    user_id text,
    count_days text,
    count_hours text,
    date_approved text,
    date_enquired text,
    date_since text,
    date_until text,
    note text,
    sick_note text,
    "status" text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (approved_by) REFERENCES users(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE team (
    id text,
    leader text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (leader) REFERENCES users(id)
);

CREATE TABLE carryover_time (
    id text,
    user_id text,
    hours text,
    note text,
    "year" text,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE user_absence_manager (
    id text,
    user_id text,
    PRIMARY KEY (id, user_id),
    FOREIGN KEY (id) REFERENCES users(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    team_id text,
    active text,
    boss text,
    can_add_customers text,
    can_generally_manage_absences text,
    can_generally_see_absences text,
    creator text,
    default_holidays_count text,
    default_target_hours text,
    edit_lock text,
    edit_lock_dyn text,
    edit_lock_sync text,
    email text,
    initials text,
    languages text,
    "name" text,
    nonbusinessgroups_id text,
    number text,
    "role" text,
    timeformat_12_h text,
    timezone text,
    wage_type text,
    weekend_friday text,
    weekstart_monday text,
    worktime_edit_lock_days text,
    worktime_regulation_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE worktime_interval (
    "index" text,
    "date" text,
    user_id text,
    time_since text,
    time_until text,
    PRIMARY KEY ("index", "date", user_id),
    FOREIGN KEY ("date") REFERENCES worktime("date"),
    FOREIGN KEY (user_id) REFERENCES worktime(user_id)
);

CREATE TABLE worktime (
    "date" text,
    user_id text,
    offsets text,
    PRIMARY KEY ("date", user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);
