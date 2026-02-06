CREATE TABLE task_tag (
    uuid text,
    task_id text,
    task_list_id text,
    user_id text,
    PRIMARY KEY (uuid, task_id, task_list_id),
    FOREIGN KEY (task_id) REFERENCES task(id),
    FOREIGN KEY (task_list_id) REFERENCES task(task_list_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE task (
    id text,
    task_list_id text,
    task_completion_event_user_id text,
    task_template_uuid text,
    user_id text,
    completed_at text,
    description text,
    task_completion_event_completed_at text,
    task_completion_event_completion_value text,
    task_completion_primitive_type text,
    task_completion_type text,
    task_completion_unit text,
    title text,
    PRIMARY KEY (id, task_list_id),
    FOREIGN KEY (task_list_id) REFERENCES task_list(id),
    FOREIGN KEY (task_completion_event_user_id) REFERENCES users(id),
    FOREIGN KEY (task_template_uuid) REFERENCES task_list_template(uuid),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE task_list_assignment (
    "index" text,
    task_list_id text,
    company_id text,
    department_id text,
    location_id text,
    role_id text,
    user_id text,
    PRIMARY KEY ("index", task_list_id),
    FOREIGN KEY (task_list_id) REFERENCES task_list(id),
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (location_id) REFERENCES location(id),
    FOREIGN KEY (role_id) REFERENCES "role"(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE task_list (
    id text,
    company_id text,
    location_id text,
    description text,
    due text,
    due_date_end text,
    due_date_start text,
    recurrence_interval text,
    recurrence_rrule text,
    start_date text,
    task_list_template_uuid text,
    time_frame_end text,
    time_frame_end_time text,
    time_frame_start text,
    time_frame_start_time text,
    title text,
    PRIMARY KEY (id),
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE time_punch_break (
    id text,
    company_id text,
    time_punch_id text,
    custom_break_id text,
    in_time text,
    out_time text,
    paid text,
    PRIMARY KEY (id, company_id, time_punch_id),
    FOREIGN KEY (company_id) REFERENCES time_punch(company_id),
    FOREIGN KEY (time_punch_id) REFERENCES time_punch(id)
);

CREATE TABLE time_punch (
    id text,
    company_id text,
    department_id text,
    location_id text,
    role_id text,
    shift_id text,
    user_id text,
    approved text,
    auto_clocked_out text,
    clocked_in text,
    clocked_in_offline text,
    clocked_out text,
    clocked_out_offline text,
    created text,
    deleted text,
    editable_punch text,
    hourly_wage text,
    modified timestamp,
    notes text,
    pos_type text,
    tips text,
    PRIMARY KEY (id, company_id),
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (location_id) REFERENCES location(id),
    FOREIGN KEY (role_id) REFERENCES "role"(id),
    FOREIGN KEY (shift_id) REFERENCES shift(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE event_location (
    "index" text,
    company_id text,
    event_id text,
    location_id text,
    PRIMARY KEY ("index", company_id, event_id),
    FOREIGN KEY (company_id) REFERENCES event(company_id),
    FOREIGN KEY (event_id) REFERENCES event(id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE event_start (
    "index" text,
    company_id text,
    event_id text,
    date_time text,
    PRIMARY KEY ("index", company_id, event_id),
    FOREIGN KEY (company_id) REFERENCES event(company_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE event_end (
    "index" text,
    company_id text,
    event_id text,
    date_time text,
    PRIMARY KEY ("index", company_id, event_id),
    FOREIGN KEY (company_id) REFERENCES event(company_id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

CREATE TABLE event (
    id text,
    company_id text,
    all_day text,
    color text,
    description text,
    end_date text,
    end_time text,
    is_multi_day text,
    recurrence text,
    start_date text,
    start_time text,
    title text,
    "type" text,
    PRIMARY KEY (id, company_id),
    FOREIGN KEY (company_id) REFERENCES company(id)
);

CREATE TABLE engage_overview (
    _fivetran_id text,
    company_id text,
    location_id text,
    most_drops_user_id text,
    most_eager_user_id text,
    most_late_user_id text,
    most_reliable_user_id text,
    most_sick_user_id text,
    average_tenure text,
    lates_current text,
    lates_previous text,
    most_drops_user_primary_role text,
    most_eager_user_primary_role text,
    most_late_user_primary_role text,
    most_reliable_user_primary_role text,
    most_sick_user_primary_role text,
    no_shows_current text,
    no_shows_previous text,
    shift_bids_current text,
    shift_bids_previous text,
    shift_drops_current text,
    shift_drops_previous text,
    shift_feedback_current text,
    shift_feedback_previous text,
    sick_shifts_current text,
    sick_shifts_previous text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (location_id) REFERENCES location(id),
    FOREIGN KEY (most_drops_user_id) REFERENCES users(id),
    FOREIGN KEY (most_eager_user_id) REFERENCES users(id),
    FOREIGN KEY (most_late_user_id) REFERENCES users(id),
    FOREIGN KEY (most_reliable_user_id) REFERENCES users(id),
    FOREIGN KEY (most_sick_user_id) REFERENCES users(id)
);

CREATE TABLE engage_overview_score (
    _fivetran_id text,
    user_id text,
    company_id text,
    location_id text,
    current_score text,
    engagement_type text,
    metrics_dropped_shifts_ranking text,
    metrics_dropped_shifts_stat text,
    metrics_lates_ranking text,
    metrics_lates_stat text,
    metrics_no_shows_ranking text,
    metrics_no_shows_stat text,
    metrics_shift_bids_ranking text,
    metrics_shift_bids_stat text,
    metrics_total_shifts text,
    user_primary_role text,
    PRIMARY KEY (_fivetran_id, user_id),
    FOREIGN KEY (_fivetran_id) REFERENCES engage_overview(_fivetran_id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (company_id) REFERENCES engage_overview(_fivetran_id),
    FOREIGN KEY (location_id) REFERENCES engage_overview(_fivetran_id)
);

CREATE TABLE availability_reason (
    id text,
    company_id text,
    comment_required text,
    created text,
    modified text,
    reason text,
    sort text,
    PRIMARY KEY (id, company_id),
    FOREIGN KEY (company_id) REFERENCES company(id)
);

CREATE TABLE daily_stats_interval (
    "index" text,
    _fivetran_id text,
    actual_labor text,
    actual_sales text,
    actual_spmh text,
    "day" text,
    end_date text,
    labor_ratio text,
    past_actual_sales text,
    past_projected_sales text,
    projected_labor text,
    projected_labor_minutes text,
    projected_labor_ratio text,
    projected_sales text,
    projected_spmh text,
    start_date text,
    PRIMARY KEY ("index", _fivetran_id),
    FOREIGN KEY (_fivetran_id) REFERENCES daily_stats(_fivetran_id)
);

CREATE TABLE daily_stats (
    _fivetran_id text,
    company_id text,
    location_id text,
    current_actual_labor text,
    current_actual_sales text,
    current_labor_ratio text,
    current_labor_target text,
    current_projected_labor text,
    current_projected_sales text,
    current_spmh text,
    past_actual_labor text,
    past_actual_sales text,
    past_labor_ratio text,
    past_projected_sales text,
    past_spmh text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE log_book_comment (
    id text,
    company_id text,
    log_book_id text,
    user_id text,
    created text,
    message text,
    uuid text,
    PRIMARY KEY (id, company_id, log_book_id),
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (log_book_id) REFERENCES log_book_post(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE company_labour_setting_custom_min_wage (
    _fivetran_id text,
    company_id text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (company_id) REFERENCES company_labour_setting(company_id)
);

CREATE TABLE company_labour_setting (
    company_id text,
    auto_break_enabled text,
    auto_break_hours text,
    auto_break_hours_2 text,
    auto_break_minutes text,
    auto_break_minutes_2 text,
    consecutive_days_multiplier text,
    consecutive_days_threshold text,
    daily_overtime_multiplier text,
    daily_overtime_threshold text,
    exception_cost_enabled text,
    is_custom text,
    is_custom_min_wage text,
    jurisdiction text,
    ot_alerts_buffer_minutes text,
    ot_alerts_enabled text,
    overtime_by_location_enabled text,
    overtime_enabled text,
    premium_overtime_multiplier text,
    premium_overtime_threshold text,
    regular_rate_of_pay_enabled text,
    split_hours_on_holiday text,
    tipped_minimum_wage_enabled text,
    use_jurisdiction_minimum_wage_for_ot text,
    wage_based_roles_enabled text,
    weekly_overtime_multiplier text,
    weekly_overtime_threshold text,
    PRIMARY KEY (company_id),
    FOREIGN KEY (company_id) REFERENCES company(id)
);

CREATE TABLE user_wage (
    id text,
    company_id text,
    user_id text,
    role_id text,
    cents text,
    created text,
    effective_date text,
    modified text,
    table_type text,
    "type" text,
    PRIMARY KEY (id, company_id, user_id),
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (role_id) REFERENCES "role"(id)
);

CREATE TABLE department (
    id text,
    company_id text,
    location_id text,
    created text,
    deleted text,
    is_default text,
    modified timestamp,
    "name" text,
    PRIMARY KEY (id, company_id),
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE log_book_post_attachment (
    file_id text,
    company_id text,
    log_book_post_id text,
    file_name text,
    full_path text,
    PRIMARY KEY (file_id, company_id, log_book_post_id),
    FOREIGN KEY (company_id) REFERENCES log_book_post(company_id),
    FOREIGN KEY (log_book_post_id) REFERENCES log_book_post(id)
);

CREATE TABLE log_book_post (
    id text,
    company_id text,
    location_id text,
    log_book_category_id text,
    user_id text,
    created text,
    "date" text,
    log_book_comment_count text,
    message text,
    uuid text,
    PRIMARY KEY (id, company_id),
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (location_id) REFERENCES location(id),
    FOREIGN KEY (log_book_category_id) REFERENCES log_book_category(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE company (
    id text,
    converted text,
    country text,
    created text,
    days_to_expire text,
    expires text,
    modified text,
    "name" text,
    photo text,
    plan_id text,
    pos text,
    start_week_on text,
    "status" text,
    trial text,
    uuid text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE user_location_assignment (
    company_id text,
    id text,
    user_id text,
    PRIMARY KEY (company_id, id, user_id),
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (id) REFERENCES location(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE user_department_assignment (
    company_id text,
    id text,
    user_id text,
    appear_on_schedule text,
    PRIMARY KEY (company_id, id, user_id),
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (id) REFERENCES department(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE user_role_assignment (
    company_id text,
    id text,
    user_id text,
    is_primary text,
    skill_level text,
    PRIMARY KEY (company_id, id, user_id),
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (id) REFERENCES "role"(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE task_template (
    "index" text,
    company_id text,
    task_list_template_id text,
    created text,
    description text,
    sort text,
    task_completion_primitive_type text,
    task_completion_type text,
    task_completion_unit text,
    title text,
    uuid text,
    PRIMARY KEY ("index", company_id, task_list_template_id),
    FOREIGN KEY (company_id) REFERENCES task_list_template(company_id),
    FOREIGN KEY (task_list_template_id) REFERENCES task_list_template(id)
);

CREATE TABLE task_list_template_assignment (
    "index" text,
    company_id text,
    task_list_template_id text,
    department_id text,
    location_id text,
    role_id text,
    user_id text,
    PRIMARY KEY ("index", company_id, task_list_template_id),
    FOREIGN KEY (company_id) REFERENCES task_list_template(company_id),
    FOREIGN KEY (task_list_template_id) REFERENCES task_list_template(id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (location_id) REFERENCES location(id),
    FOREIGN KEY (role_id) REFERENCES "role"(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE task_list_template (
    id text,
    company_id text,
    activated_at text,
    created text,
    description text,
    due text,
    recurrence text,
    "status" text,
    time_frame_end text,
    time_frame_start text,
    title text,
    uuid text,
    PRIMARY KEY (id, company_id),
    FOREIGN KEY (company_id) REFERENCES company(id)
);

CREATE TABLE task_management_setting (
    id text,
    company_id text,
    can_use_task_management text,
    employee_login text,
    employee_reminder text,
    enabled text,
    has_created_list text,
    overdue_alert text,
    prompted_auto_assign_id text,
    PRIMARY KEY (id, company_id),
    FOREIGN KEY (company_id) REFERENCES company(id)
);

CREATE TABLE time_off_hour (
    "index" text,
    company_id text,
    time_off_id text,
    "date" text,
    hours text,
    PRIMARY KEY ("index", company_id, time_off_id),
    FOREIGN KEY (company_id) REFERENCES time_off(company_id),
    FOREIGN KEY (time_off_id) REFERENCES time_off(id)
);

CREATE TABLE time_off (
    id text,
    company_id text,
    status_action_user_id text,
    user_id text,
    amount_of_hours text,
    category text,
    "comment" text,
    created text,
    from_date text,
    modified text,
    partial text,
    partial_from text,
    partial_to text,
    "status" text,
    status_action_message text,
    to_date text,
    PRIMARY KEY (id, company_id),
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (status_action_user_id) REFERENCES users(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    company_id text,
    active text,
    address text,
    appear_as_employee text,
    birth_date text,
    city text,
    created text,
    email text,
    employee_id text,
    first_name text,
    hire_date text,
    home_number text,
    hourly_wage text,
    identity_id text,
    invite_accepted text,
    invite_status text,
    invited text,
    is_new text,
    language_name text,
    last_login text,
    last_name text,
    max_weekly_hours text,
    mobile_number text,
    modified timestamp,
    notes text,
    notify_ot_risk text,
    permissions_template_id text,
    photo text,
    postal_zip text,
    preferred_first_name text,
    preferred_last_name text,
    pronoun text,
    prov_state text,
    punch_id text,
    push text,
    skill_level text,
    sms_me_schedule text,
    subscribe_to_update text,
    time_zone text,
    "type" text,
    wage_type text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id, company_id),
    FOREIGN KEY (company_id) REFERENCES company(id)
);

CREATE TABLE day_part_setting_segment (
    uuid text,
    company_id text,
    day_part_uuid text,
    day_of_week text,
    end_time text,
    start_time text,
    PRIMARY KEY (uuid, company_id, day_part_uuid),
    FOREIGN KEY (company_id) REFERENCES day_part_setting(company_id),
    FOREIGN KEY (day_part_uuid) REFERENCES day_part_setting(uuid)
);

CREATE TABLE day_part_setting (
    uuid text,
    company_id text,
    location_id text,
    created text,
    modified text,
    "name" text,
    PRIMARY KEY (uuid, company_id),
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE location (
    id text,
    company_id text,
    auto_send_log_book_time text,
    city text,
    country text,
    created text,
    deleted text,
    department_based_budget text,
    formatted_address text,
    fri_hours_close text,
    fri_hours_open text,
    fri_is_closed text,
    hash text,
    holiday_pay text,
    latitude text,
    longitude text,
    mapping_id text,
    message text,
    modified text,
    mon_hours_close text,
    mon_hours_open text,
    mon_is_closed text,
    "name" text,
    place_id text,
    sat_hours_close text,
    sat_hours_open text,
    sat_is_closed text,
    shift_feedback text,
    "state" text,
    sun_hours_close text,
    sun_hours_open text,
    sun_is_closed text,
    thu_hours_close text,
    thu_hours_open text,
    thu_is_closed text,
    timezone text,
    timezone_updated text,
    tue_hours_close text,
    tue_hours_open text,
    tue_is_closed text,
    wed_hours_close text,
    wed_hours_open text,
    wed_is_closed text,
    PRIMARY KEY (id, company_id),
    FOREIGN KEY (company_id) REFERENCES company(id)
);

CREATE TABLE company_inactive_reason (
    "index" text,
    company_id text,
    inactive_reason text,
    PRIMARY KEY ("index", company_id),
    FOREIGN KEY (company_id) REFERENCES company(id)
);

CREATE TABLE role_station (
    id text,
    company_id text,
    role_id text,
    "name" text,
    station_number text,
    PRIMARY KEY (id, company_id, role_id),
    FOREIGN KEY (company_id) REFERENCES "role"(company_id),
    FOREIGN KEY (role_id) REFERENCES "role"(id)
);

CREATE TABLE "role" (
    id text,
    company_id text,
    department_id text,
    location_id text,
    color text,
    created text,
    is_tipped_role text,
    job_code text,
    modified text,
    "name" text,
    num_of_stations text,
    sort text,
    PRIMARY KEY (id, company_id),
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE daily_sales_labor (
    _fivetran_id text,
    department_id text,
    location_id text,
    actual_items text,
    actual_labor_cost text,
    actual_labor_minutes text,
    actual_ot_minutes text,
    actual_sales text,
    "date" text,
    id text,
    items_per_labor_hour text,
    labor_percent text,
    labor_target text,
    projected_items text,
    projected_items_override text,
    projected_items_per_labor_hour text,
    projected_labor_cost text,
    projected_labor_minutes text,
    projected_sales text,
    projected_sales_override text,
    projected_sales_per_labor_hour text,
    sales_per_labor_hour text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE shift_break (
    id text,
    company_id text,
    shift_id text,
    break_type_id text,
    end_date text,
    length text,
    "name" text,
    start_date text,
    "type" text,
    PRIMARY KEY (id, company_id, shift_id),
    FOREIGN KEY (company_id) REFERENCES shift(company_id),
    FOREIGN KEY (shift_id) REFERENCES shift(id)
);

CREATE TABLE shift (
    id text,
    company_id text,
    department_id text,
    location_id text,
    role_id text,
    user_id text,
    attendance_status text,
    business_decline text,
    created text,
    deleted text,
    draft text,
    end_date text,
    hourly_wage text,
    is_close text,
    is_open text,
    late_minutes text,
    modified timestamp,
    notes text,
    notified text,
    open_offer_type text,
    publish_status text,
    soft_deleted text,
    start_date text,
    station text,
    station_id text,
    station_name text,
    unassigned text,
    unassigned_skill_level text,
    PRIMARY KEY (id, company_id),
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (department_id) REFERENCES department(id),
    FOREIGN KEY (location_id) REFERENCES location(id),
    FOREIGN KEY (role_id) REFERENCES "role"(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE receipt_line_external_category (
    "index" text,
    company_id text,
    receipt_id text,
    receipt_line_index text,
    category_id text,
    PRIMARY KEY ("index", company_id, receipt_id, receipt_line_index),
    FOREIGN KEY (company_id) REFERENCES receipt_line(company_id),
    FOREIGN KEY (receipt_id) REFERENCES receipt_line(receipt_id),
    FOREIGN KEY (receipt_line_index) REFERENCES receipt_line("index")
);

CREATE TABLE receipt_line (
    "index" text,
    company_id text,
    receipt_id text,
    created text,
    external_item_id text,
    gross_item_price text,
    id text,
    item_discount text,
    net_item_price text,
    price text,
    quantity text,
    PRIMARY KEY ("index", company_id, receipt_id),
    FOREIGN KEY (company_id) REFERENCES receipt(company_id),
    FOREIGN KEY (receipt_id) REFERENCES receipt(id)
);

CREATE TABLE receipt_tip_detail (
    "index" text,
    company_id text,
    receipt_id text,
    "type" text,
    "value" text,
    PRIMARY KEY ("index", company_id, receipt_id),
    FOREIGN KEY (company_id) REFERENCES receipt(company_id),
    FOREIGN KEY (receipt_id) REFERENCES receipt(id)
);

CREATE TABLE receipt (
    id text,
    company_id text,
    location_id text,
    created_date text,
    "date" text,
    external_user_id text,
    gross_total text,
    modified_date timestamp,
    net_total text,
    pos_id text,
    receipt_id text,
    revenue_center text,
    "status" text,
    tips text,
    total_item_discount text,
    total_receipt_discount text,
    PRIMARY KEY (id, company_id),
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE log_book_category (
    id text,
    company_id text,
    col text,
    created text,
    field_type text,
    "name" text,
    notify text,
    required text,
    sort text,
    uuid text,
    PRIMARY KEY (id, company_id),
    FOREIGN KEY (company_id) REFERENCES company(id)
);

CREATE TABLE shift_feedback (
    id text,
    company_id text,
    shift_id text,
    "comment" text,
    dismissed text,
    end_date text,
    notified text,
    rating text,
    start_date text,
    station_name text,
    PRIMARY KEY (id),
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (shift_id) REFERENCES shift(id)
);

CREATE TABLE availability (
    id text,
    company_id text,
    fri_reason text,
    mon_reason text,
    old_approved_data_id text,
    sat_reason text,
    status_action_user_id text,
    sun_reason text,
    thu_reason text,
    tue_reason text,
    user_id text,
    wed_reason text,
    created text,
    fri text,
    fri_comment text,
    fri_from text,
    fri_to text,
    modified text,
    mon text,
    mon_comment text,
    mon_from text,
    mon_to text,
    "repeat" text,
    sat text,
    sat_comment text,
    sat_from text,
    sat_to text,
    "status" text,
    status_action_message text,
    sun text,
    sun_comment text,
    sun_from text,
    sun_to text,
    thu text,
    thu_comment text,
    thu_from text,
    thu_to text,
    tue text,
    tue_comment text,
    tue_from text,
    tue_to text,
    wed text,
    wed_comment text,
    wed_from text,
    wed_to text,
    week text,
    week_to text,
    PRIMARY KEY (id, company_id),
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (fri_reason) REFERENCES availability_reason(id),
    FOREIGN KEY (mon_reason) REFERENCES availability_reason(id),
    FOREIGN KEY (old_approved_data_id) REFERENCES availability(id),
    FOREIGN KEY (sat_reason) REFERENCES availability_reason(id),
    FOREIGN KEY (status_action_user_id) REFERENCES users(id),
    FOREIGN KEY (sun_reason) REFERENCES availability_reason(id),
    FOREIGN KEY (thu_reason) REFERENCES availability_reason(id),
    FOREIGN KEY (tue_reason) REFERENCES availability_reason(id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (wed_reason) REFERENCES availability_reason(id)
);

CREATE TABLE task_list_daily_summary_task_list (
    "index" text,
    company_id text,
    location_id text,
    task_list_daily_summary_date text,
    completion_percentage text,
    completion_status text,
    description text,
    title text,
    total_tasks text,
    total_tasks_completed text,
    PRIMARY KEY ("index", company_id, location_id, task_list_daily_summary_date),
    FOREIGN KEY (company_id) REFERENCES task_list_daily_summary(company_id),
    FOREIGN KEY (location_id) REFERENCES task_list_daily_summary(location_id),
    FOREIGN KEY (task_list_daily_summary_date) REFERENCES task_list_daily_summary("date")
);

CREATE TABLE task_list_daily_summary (
    "date" text,
    company_id text,
    location_id text,
    has_recent_task_completed text,
    report_time text,
    total_completed_percentage text,
    total_in_progress_percentage text,
    total_incomplete_percentage text,
    PRIMARY KEY ("date", company_id, location_id),
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);
