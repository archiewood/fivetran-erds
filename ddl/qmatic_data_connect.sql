CREATE TABLE visit_customer (
    id text,
    visit_key text,
    customer_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (visit_key) REFERENCES visit(id)
);

CREATE TABLE feedback_result (
    id text,
    answer_key text,
    branch_key text,
    question_key text,
    question_type_key text,
    visit_key text,
    date_key text,
    event_timestamp text,
    text_answer text,
    time_key text,
    time_seconds text,
    PRIMARY KEY (id),
    FOREIGN KEY (answer_key) REFERENCES feedback_answer(id),
    FOREIGN KEY (branch_key) REFERENCES branch(id),
    FOREIGN KEY (question_key) REFERENCES feedback_question(id),
    FOREIGN KEY (question_type_key) REFERENCES question_type(id),
    FOREIGN KEY (visit_key) REFERENCES visit(id)
);

CREATE TABLE visit_call_type (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE device_time (
    id text,
    agent_key text,
    branch_key text,
    date_key text,
    device_key text,
    unit_key text,
    asf_device_status_key text,
    device_connect_duration text,
    device_disconnect_duration text,
    device_num_disconnects text,
    no_data text,
    PRIMARY KEY (id),
    FOREIGN KEY (agent_key) REFERENCES agent(id),
    FOREIGN KEY (branch_key) REFERENCES branch(id),
    FOREIGN KEY (date_key) REFERENCES "date"(id),
    FOREIGN KEY (device_key) REFERENCES device(id),
    FOREIGN KEY (unit_key) REFERENCES unit(id)
);

CREATE TABLE mark_transaction_time (
    id text,
    am_pm text,
    "hour" text,
    hour_24 text,
    interval_10_min text,
    interval_10_min_24 text,
    interval_15_min text,
    interval_15_min_24 text,
    interval_30_min text,
    interval_30_min_24 text,
    interval_5_min text,
    interval_5_min_24 text,
    "minute" text,
    "time" text,
    PRIMARY KEY (id)
);

CREATE TABLE appointment_start_time (
    id text,
    am_pm text,
    "hour" text,
    hour_24 text,
    interval_10_min text,
    interval_10_min_24 text,
    interval_15_min text,
    interval_15_min_24 text,
    interval_30_min text,
    interval_30_min_24 text,
    interval_5_min text,
    interval_5_min_24 text,
    "minute" text,
    "time" text,
    PRIMARY KEY (id)
);

CREATE TABLE feedback_time (
    id text,
    am_pm text,
    "hour" text,
    hour_24 text,
    interval_10_min text,
    interval_10_min_24 text,
    interval_15_min text,
    interval_15_min_24 text,
    interval_30_min text,
    interval_30_min_24 text,
    interval_5_min text,
    interval_5_min_24 text,
    "minute" text,
    "time" text,
    PRIMARY KEY (id)
);

CREATE TABLE call_time (
    id text,
    am_pm text,
    "hour" text,
    hour_24 text,
    interval_10_min text,
    interval_10_min_24 text,
    interval_15_min text,
    interval_15_min_24 text,
    interval_30_min text,
    interval_30_min_24 text,
    interval_5_min text,
    interval_5_min_24 text,
    "minute" text,
    "time" text,
    PRIMARY KEY (id)
);

CREATE TABLE entry_point (
    id text,
    "name" text,
    origin_id text,
    PRIMARY KEY (id)
);

CREATE TABLE end_time (
    id text,
    am_pm text,
    "hour" text,
    hour_24 text,
    interval_10_min text,
    interval_10_min_24 text,
    interval_15_min text,
    interval_15_min_24 text,
    interval_30_min text,
    interval_30_min_24 text,
    interval_5_min text,
    interval_5_min_24 text,
    "minute" text,
    "time" text,
    PRIMARY KEY (id)
);

CREATE TABLE appointment (
    id text,
    appointment_status_key text,
    arrival_status_key text,
    branch_key text,
    origin_id text,
    resource_key text,
    service_key text,
    cancelled_date_key text,
    client_key text,
    count_service text,
    created_date_key text,
    created_time_key text,
    date_key text,
    days_cancelled_before text,
    days_to_appointment text,
    duration text,
    end_time_key text,
    lateness text,
    start_time_key text,
    tardiness text,
    transaction_time text,
    updated_count text,
    waiting_time text,
    walking_time text,
    wrapup_time text,
    PRIMARY KEY (id),
    FOREIGN KEY (appointment_status_key) REFERENCES appointment_status(id),
    FOREIGN KEY (arrival_status_key) REFERENCES appointment_arrival_status(id),
    FOREIGN KEY (branch_key) REFERENCES branch(id),
    FOREIGN KEY (origin_id) REFERENCES appointment(id),
    FOREIGN KEY (resource_key) REFERENCES resource(id),
    FOREIGN KEY (service_key) REFERENCES service(id)
);

CREATE TABLE agent_device_controller_status (
    id text,
    agent_key text,
    branch_key text,
    device_controller_key text,
    device_controller_status_key text,
    last_device_controller_event_type_key text,
    last_event_time text,
    last_status_time text,
    origin_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (agent_key) REFERENCES agent(id),
    FOREIGN KEY (branch_key) REFERENCES branch(id),
    FOREIGN KEY (device_controller_key) REFERENCES device_controller(id),
    FOREIGN KEY (device_controller_status_key) REFERENCES device_controller_status(id),
    FOREIGN KEY (last_device_controller_event_type_key) REFERENCES device_controller_event_type(id)
);

CREATE TABLE service (
    id text,
    "name" text,
    origin_id text,
    PRIMARY KEY (id)
);

CREATE TABLE visit_transaction_outcome (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE device_controller_event_type (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE daemon_status (
    id text,
    "status" text,
    PRIMARY KEY (id)
);

CREATE TABLE staff_session_end_time (
    id text,
    am_pm text,
    "hour" text,
    hour_24 text,
    interval_10_min text,
    interval_10_min_24 text,
    interval_15_min text,
    interval_15_min_24 text,
    interval_30_min text,
    interval_30_min_24 text,
    interval_5_min text,
    interval_5_min_24 text,
    "minute" text,
    "time" text,
    PRIMARY KEY (id)
);

CREATE TABLE device_status (
    id text,
    "status" text,
    PRIMARY KEY (id)
);

CREATE TABLE feedback_answer (
    id text,
    numeric_answer text,
    text_answer text,
    PRIMARY KEY (id)
);

CREATE TABLE delivered_service (
    id text,
    branch_key text,
    outcome_key text,
    queue_key text,
    queue_type_key text,
    service_key text,
    service_point_key text,
    staff_key text,
    visit_key text,
    date_key text,
    delivered_service_key text,
    time_key text,
    time_seconds text,
    transaction_time text,
    waiting_time text,
    PRIMARY KEY (id),
    FOREIGN KEY (branch_key) REFERENCES branch(id),
    FOREIGN KEY (outcome_key) REFERENCES outcome(id),
    FOREIGN KEY (queue_key) REFERENCES queue(id),
    FOREIGN KEY (queue_type_key) REFERENCES queue_type(id),
    FOREIGN KEY (service_key) REFERENCES service(id),
    FOREIGN KEY (service_point_key) REFERENCES service_point(id),
    FOREIGN KEY (staff_key) REFERENCES staff(id),
    FOREIGN KEY (visit_key) REFERENCES visit(id)
);

CREATE TABLE service_delivereds (
    id text,
    origin_id text,
    service_delivered text,
    PRIMARY KEY (id)
);

CREATE TABLE device_event_type (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE mark_transaction (
    id text,
    branch_key text,
    mark_key text,
    mark_type_key text,
    queue_key text,
    queue_type_key text,
    service_key text,
    service_point_key text,
    staff_key text,
    visit_key text,
    date_key text,
    time_key text,
    time_seconds text,
    transaction_time text,
    waiting_time text,
    PRIMARY KEY (id),
    FOREIGN KEY (branch_key) REFERENCES branch(id),
    FOREIGN KEY (mark_key) REFERENCES mark(id),
    FOREIGN KEY (mark_type_key) REFERENCES mark_type(id),
    FOREIGN KEY (queue_key) REFERENCES queue(id),
    FOREIGN KEY (queue_type_key) REFERENCES queue_type(id),
    FOREIGN KEY (service_key) REFERENCES service(id),
    FOREIGN KEY (service_point_key) REFERENCES service_point(id),
    FOREIGN KEY (staff_key) REFERENCES staff(id),
    FOREIGN KEY (visit_key) REFERENCES visit(id)
);

CREATE TABLE jiql_event_type (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE appointment_status (
    id text,
    "status" text,
    PRIMARY KEY (id)
);

CREATE TABLE mark_type (
    id text,
    "name" text,
    origin_id text,
    PRIMARY KEY (id)
);

CREATE TABLE daemon_event_type (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE fact_agent_jiql_event (
    id text,
    agent_key text,
    date_key text,
    jiql_event_type_key text,
    time_key text,
    asf_agent_status_key text,
    event_timestamp text,
    time_seconds text,
    PRIMARY KEY (id),
    FOREIGN KEY (agent_key) REFERENCES agent(id),
    FOREIGN KEY (date_key) REFERENCES "date"(id),
    FOREIGN KEY (jiql_event_type_key) REFERENCES jiql_event_type(id),
    FOREIGN KEY (time_key) REFERENCES "time"(id)
);

CREATE TABLE service_point (
    id text,
    "name" text,
    origin_id text,
    PRIMARY KEY (id)
);

CREATE TABLE staff_session (
    id text,
    branch_key text,
    session_outcome_key text,
    staff_key text,
    date_key text,
    end_time_key text,
    end_timestamp text,
    idle_time text,
    served_count text,
    serving_time text,
    start_timestamp text,
    store_next_time text,
    time_key text,
    time_seconds text,
    total_time text,
    visits_served text,
    wrapup_time text,
    PRIMARY KEY (id),
    FOREIGN KEY (branch_key) REFERENCES branch(id),
    FOREIGN KEY (session_outcome_key) REFERENCES staff_session_outcome(id),
    FOREIGN KEY (staff_key) REFERENCES staff(id)
);

CREATE TABLE agent_device_status (
    id text,
    agent_key text,
    branch_key text,
    device_key text,
    device_status_key text,
    last_device_event_type_key text,
    unit_key text,
    device_event_time text,
    device_status_time text,
    origin_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (agent_key) REFERENCES agent(id),
    FOREIGN KEY (branch_key) REFERENCES branch(id),
    FOREIGN KEY (device_key) REFERENCES device(id),
    FOREIGN KEY (device_status_key) REFERENCES device_status(id),
    FOREIGN KEY (last_device_event_type_key) REFERENCES device_event_type(id),
    FOREIGN KEY (unit_key) REFERENCES unit(id)
);

CREATE TABLE dim_unit_type (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE appointment_service (
    id text,
    appointment_id text,
    service_key text,
    served text,
    PRIMARY KEY (id),
    FOREIGN KEY (appointment_id) REFERENCES appointment(id),
    FOREIGN KEY (service_key) REFERENCES service(id)
);

CREATE TABLE daemon_version (
    id text,
    version text,
    PRIMARY KEY (id)
);

CREATE TABLE staff_session_start_time (
    id text,
    am_pm text,
    "hour" text,
    hour_24 text,
    interval_10_min text,
    interval_10_min_24 text,
    interval_15_min text,
    interval_15_min_24 text,
    interval_30_min text,
    interval_30_min_24 text,
    interval_5_min text,
    interval_5_min_24 text,
    "minute" text,
    "time" text,
    PRIMARY KEY (id)
);

CREATE TABLE dim_device_type (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE appointment_customer (
    id text,
    appointment_id text,
    customer_id text,
    booked text,
    served text,
    PRIMARY KEY (id),
    FOREIGN KEY (appointment_id) REFERENCES appointment(id),
    FOREIGN KEY (customer_id) REFERENCES visit_customer(id)
);

CREATE TABLE appointment_end_time (
    id text,
    am_pm text,
    "hour" text,
    hour_24 text,
    interval_10_min text,
    interval_10_min_24 text,
    interval_15_min text,
    interval_15_min_24 text,
    interval_30_min text,
    interval_30_min_24 text,
    interval_5_min text,
    interval_5_min_24 text,
    "minute" text,
    "time" text,
    PRIMARY KEY (id)
);

CREATE TABLE delivered_service_time (
    id text,
    am_pm text,
    "hour" text,
    hour_24 text,
    interval_10_min text,
    interval_10_min_24 text,
    interval_15_min text,
    interval_15_min_24 text,
    interval_30_min text,
    interval_30_min_24 text,
    interval_5_min text,
    interval_5_min_24 text,
    "minute" text,
    "time" text,
    PRIMARY KEY (id)
);

CREATE TABLE resource (
    id text,
    branch_origin_id text,
    "name" text,
    origin_id text,
    PRIMARY KEY (id)
);

CREATE TABLE branch (
    id text,
    city text,
    country text,
    latitude text,
    longitude text,
    "name" text,
    origin_id text,
    time_zone text,
    PRIMARY KEY (id)
);

CREATE TABLE question_type (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE appointment_created_time (
    id text,
    am_pm text,
    "hour" text,
    hour_24 text,
    interval_10_min text,
    interval_10_min_24 text,
    interval_15_min text,
    interval_15_min_24 text,
    interval_30_min text,
    interval_30_min_24 text,
    interval_5_min text,
    interval_5_min_24 text,
    "minute" text,
    "time" text,
    PRIMARY KEY (id)
);

CREATE TABLE staff_session_outcome (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE jiql_status (
    id text,
    "status" text,
    PRIMARY KEY (id)
);

CREATE TABLE "time" (
    id text,
    am_pm text,
    "hour" text,
    hour_24 text,
    interval_10_min text,
    interval_10_min_24 text,
    interval_15_min text,
    interval_15_min_24 text,
    interval_30_min text,
    interval_30_min_24 text,
    interval_5_min text,
    interval_5_min_24 text,
    "minute" text,
    "time" text,
    PRIMARY KEY (id)
);

CREATE TABLE queue (
    id text,
    "name" text,
    origin_id text,
    PRIMARY KEY (id)
);

CREATE TABLE mark (
    id text,
    mark_type_key text,
    "name" text,
    origin_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (mark_type_key) REFERENCES mark_type(id)
);

CREATE TABLE queue_type (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE device_controller_time (
    id text,
    agent_key text,
    branch_key text,
    date_key text,
    device_controller_key text,
    asf_dc_status_key text,
    connect_duration text,
    disconnect_duration text,
    no_data text,
    num_disconnects text,
    PRIMARY KEY (id),
    FOREIGN KEY (agent_key) REFERENCES agent(id),
    FOREIGN KEY (branch_key) REFERENCES branch(id),
    FOREIGN KEY (date_key) REFERENCES "date"(id),
    FOREIGN KEY (device_controller_key) REFERENCES device_controller(id)
);

CREATE TABLE entered_queue_time (
    id text,
    am_pm text,
    "hour" text,
    hour_24 text,
    interval_10_min text,
    interval_10_min_24 text,
    interval_15_min text,
    interval_15_min_24 text,
    interval_30_min text,
    interval_30_min_24 text,
    interval_5_min text,
    interval_5_min_24 text,
    "minute" text,
    "time" text,
    PRIMARY KEY (id)
);

CREATE TABLE staff (
    id text,
    first_name text,
    full_name text,
    last_name text,
    origin_id text,
    user_name text,
    PRIMARY KEY (id)
);

CREATE TABLE appointment_arrival_status (
    id text,
    arrival_status text,
    PRIMARY KEY (id)
);

CREATE TABLE device_controller_status (
    id text,
    "status" text,
    PRIMARY KEY (id)
);

CREATE TABLE jiql_version (
    id text,
    version text,
    PRIMARY KEY (id)
);

CREATE TABLE feedback_question (
    id text,
    question text,
    start_date text,
    PRIMARY KEY (id)
);

CREATE TABLE appointment_cancelled_date (
    id text,
    day_of_month text,
    day_of_week text,
    day_of_week_name text,
    day_of_week_name_en text,
    full_date text,
    "month" text,
    month_name text,
    month_name_en text,
    quarter text,
    week_number text,
    week_number_iso text,
    "year" text,
    PRIMARY KEY (id)
);

CREATE TABLE agent_daemon_event (
    id text,
    agent_key text,
    daemon_event_type_key text,
    date_key text,
    time_key text,
    asf_agent_status_key text,
    event_timestamp text,
    time_seconds text,
    PRIMARY KEY (id),
    FOREIGN KEY (agent_key) REFERENCES agent(id),
    FOREIGN KEY (daemon_event_type_key) REFERENCES daemon_event_type(id),
    FOREIGN KEY (date_key) REFERENCES "date"(id),
    FOREIGN KEY (time_key) REFERENCES "time"(id)
);

CREATE TABLE mark_transaction_date (
    id text,
    day_of_month text,
    day_of_week text,
    day_of_week_name text,
    day_of_week_name_en text,
    full_date text,
    "month" text,
    month_name text,
    month_name_en text,
    quarter text,
    week_number_iso text,
    "year" text,
    PRIMARY KEY (id)
);

CREATE TABLE device_controller_event (
    id text,
    agent_key text,
    branch_key text,
    date_key text,
    dc_event_type_key text,
    device_controller_key text,
    time_key text,
    asf_dc_status_key text,
    event_timestamp text,
    time_seconds text,
    PRIMARY KEY (id),
    FOREIGN KEY (agent_key) REFERENCES agent(id),
    FOREIGN KEY (branch_key) REFERENCES branch(id),
    FOREIGN KEY (date_key) REFERENCES "date"(id),
    FOREIGN KEY (dc_event_type_key) REFERENCES device_event_type(id),
    FOREIGN KEY (device_controller_key) REFERENCES device_controller(id),
    FOREIGN KEY (time_key) REFERENCES "time"(id)
);

CREATE TABLE unit (
    id text,
    branch_key text,
    device_controller_key text,
    end_date text,
    logic_id text,
    "name" text,
    origin_id text,
    start_date text,
    unit_id text,
    unit_template text,
    unit_type_key text,
    PRIMARY KEY (id)
);

CREATE TABLE device (
    id text,
    unit_key text,
    device_type_key text,
    end_date text,
    firmware_version text,
    ip text,
    logic_id text,
    "name" text,
    origin_id text,
    start_date text,
    PRIMARY KEY (id),
    FOREIGN KEY (unit_key) REFERENCES unit(id)
);

CREATE TABLE "date" (
    id text,
    day_of_month text,
    day_of_week text,
    day_of_week_name text,
    day_of_week_name_en text,
    full_date text,
    "month" text,
    month_name text,
    month_name_en text,
    quarter text,
    week_number_iso text,
    "year" text,
    PRIMARY KEY (id)
);

CREATE TABLE work_profile (
    id text,
    branch_origin_id text,
    client_key text,
    end_date text,
    "name" text,
    origin_id text,
    start_date text,
    PRIMARY KEY (id)
);

CREATE TABLE appointment_created_date (
    id text,
    day_of_month text,
    day_of_week text,
    day_of_week_name text,
    day_of_week_name_en text,
    full_date text,
    "month" text,
    month_name text,
    month_name_en text,
    quarter text,
    week_number text,
    week_number_iso text,
    "year" text,
    PRIMARY KEY (id)
);

CREATE TABLE device_event (
    id text,
    agent_key text,
    branch_key text,
    date_key text,
    device_event_type_key text,
    device_key text,
    time_key text,
    unit_key text,
    asf_device_status_key text,
    event_timestamp text,
    time_seconds text,
    PRIMARY KEY (id),
    FOREIGN KEY (agent_key) REFERENCES agent(id),
    FOREIGN KEY (branch_key) REFERENCES branch(id),
    FOREIGN KEY (date_key) REFERENCES "date"(id),
    FOREIGN KEY (device_event_type_key) REFERENCES device_event_type(id),
    FOREIGN KEY (device_key) REFERENCES device(id),
    FOREIGN KEY (time_key) REFERENCES "time"(id),
    FOREIGN KEY (unit_key) REFERENCES unit(id)
);

CREATE TABLE visit_transaction (
    id text,
    branch_key text,
    entry_point_key text,
    outcome_key text,
    queue_key text,
    queue_type_key text,
    service_key text,
    service_point_key text,
    staff_key text,
    visit_call_type_key text,
    visit_key text,
    visit_outcome_key text,
    work_profile_key text,
    call_time_key text,
    call_time_of_day text,
    call_timestamp text,
    date_key text,
    end_time_key text,
    end_time_of_day text,
    enter_queue_time_of_day text,
    entered_queue_time_key text,
    entered_queue_timestamp text,
    is_appointment text,
    recycle_count text,
    service_transaction_time_level text,
    staff_transaction_time text,
    time_seconds text,
    transaction_time text,
    transaction_time_vs_service_level text,
    vertical_message_key text,
    waiting_time text,
    waiting_time_service_level text,
    waiting_time_vs_service_level text,
    walking_time text,
    wrapup_time text,
    PRIMARY KEY (id),
    FOREIGN KEY (branch_key) REFERENCES branch(id),
    FOREIGN KEY (entry_point_key) REFERENCES entry_point(id),
    FOREIGN KEY (outcome_key) REFERENCES outcome(id),
    FOREIGN KEY (queue_key) REFERENCES queue(id),
    FOREIGN KEY (queue_type_key) REFERENCES queue_type(id),
    FOREIGN KEY (service_key) REFERENCES service(id),
    FOREIGN KEY (service_point_key) REFERENCES service_point(id),
    FOREIGN KEY (staff_key) REFERENCES staff(id),
    FOREIGN KEY (visit_call_type_key) REFERENCES visit_call_type(id),
    FOREIGN KEY (visit_key) REFERENCES visit(id),
    FOREIGN KEY (visit_outcome_key) REFERENCES visit_transaction_outcome(id),
    FOREIGN KEY (work_profile_key) REFERENCES work_profile(id)
);

CREATE TABLE agent (
    id text,
    daemon_version_key text,
    jiql_version_key text,
    end_date text,
    host text,
    "name" text,
    original_id text,
    start_date text,
    PRIMARY KEY (id),
    FOREIGN KEY (daemon_version_key) REFERENCES daemon_version(id),
    FOREIGN KEY (jiql_version_key) REFERENCES jiql_version(id)
);

CREATE TABLE outcome (
    id text,
    branch_origin_id text,
    client_key text,
    end_date text,
    "name" text,
    origin_id text,
    start_date text,
    PRIMARY KEY (id)
);

CREATE TABLE feedback_date (
    id text,
    day_of_month text,
    day_of_week text,
    day_of_week_name text,
    day_of_week_name_en text,
    full_date text,
    "month" text,
    month_name text,
    month_name_en text,
    quarter text,
    week_number_iso text,
    "year" text,
    PRIMARY KEY (id)
);

CREATE TABLE device_controller (
    id text,
    branch_key text,
    end_date text,
    "name" text,
    origin_id text,
    start_date text,
    unit_id text,
    unit_template text,
    PRIMARY KEY (id),
    FOREIGN KEY (branch_key) REFERENCES branch(id)
);

CREATE TABLE visit (
    id text,
    appointment_id text,
    created_timestamp text,
    custom_1 text,
    custom_2 text,
    custom_3 text,
    custom_4 text,
    custom_5 text,
    ticket_id text,
    vip_level text,
    visit_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (appointment_id) REFERENCES appointment(id)
);
