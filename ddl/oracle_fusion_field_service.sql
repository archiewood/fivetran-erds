CREATE TABLE route (
    activity_id text,
    resource_id text,
    appt_number text,
    city text,
    resource_internal_id text,
    PRIMARY KEY (activity_id),
    FOREIGN KEY (activity_id) REFERENCES activity(activity_id),
    FOREIGN KEY (resource_id) REFERENCES resource_descendant(resource_id)
);

CREATE TABLE resource_descendant_work_schedule (
    resource_descendant_resource_id text,
    schedule_item_id text,
    recur_every text,
    recurrence_type text,
    PRIMARY KEY (resource_descendant_resource_id, schedule_item_id),
    FOREIGN KEY (resource_descendant_resource_id) REFERENCES resource_descendant(resource_id),
    FOREIGN KEY (schedule_item_id) REFERENCES work_schedule(schedule_item_id)
);

CREATE TABLE resource_descendant_work_skill (
    resource_descendant_resource_id text,
    work_skill text,
    PRIMARY KEY (resource_descendant_resource_id, work_skill),
    FOREIGN KEY (resource_descendant_resource_id) REFERENCES resource_descendant(resource_id),
    FOREIGN KEY (work_skill) REFERENCES resource_work_skill(_fivetran_id)
);

CREATE TABLE resource_descendant_work_zone (
    resource_descendant_resource_id text,
    work_zone_item_id text,
    PRIMARY KEY (resource_descendant_resource_id, work_zone_item_id),
    FOREIGN KEY (resource_descendant_resource_id) REFERENCES resource_descendant(resource_id),
    FOREIGN KEY (work_zone_item_id) REFERENCES resource_work_zone(work_zone_item_id)
);

CREATE TABLE resource_descendant_inventory (
    inventory_id text,
    resource_descendant_resource_id text,
    PRIMARY KEY (inventory_id, resource_descendant_resource_id),
    FOREIGN KEY (inventory_id) REFERENCES inventory(inventory_id),
    FOREIGN KEY (resource_descendant_resource_id) REFERENCES resource_descendant(resource_id)
);

CREATE TABLE resource_descendant (
    resource_id text,
    date_format text,
    duration_statistics_initial_period text,
    duration_statistics_initial_ratio text,
    email text,
    language_iso text,
    languages text,
    "name" text,
    organization_label text,
    parent_resource_id text,
    parent_resource_internal_id text,
    phone text,
    resource_internal_id text,
    resource_type text,
    "status" jsonb,
    time_format text,
    time_zone text,
    time_zone_diff text,
    time_zone_i_a_n_a text,
    xa_tech_alias text,
    xp_bulked text,
    xp_notification text,
    xp_truck_nmbr text,
    PRIMARY KEY (resource_id)
);

CREATE TABLE group_work_skill_data (
    "index" text,
    _fivetran_id text,
    label text,
    ratio text,
    PRIMARY KEY ("index", _fivetran_id),
    FOREIGN KEY (_fivetran_id) REFERENCES work_skill_group(_fivetran_id),
    FOREIGN KEY (label) REFERENCES work_skill(_fivetran_id)
);

CREATE TABLE work_skill_group_translation (
    "index" text,
    _fivetran_id text,
    language_iso text,
    languages text,
    "name" text,
    PRIMARY KEY ("index", _fivetran_id),
    FOREIGN KEY (_fivetran_id) REFERENCES work_skill_group(_fivetran_id)
);

CREATE TABLE work_skill_group (
    _fivetran_id text,
    active text,
    add_to_capacity_category text,
    assign_to_resource text,
    label text,
    "name" text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE capacity_category_work_skill (
    "index" text,
    _fivetran_id text,
    label text,
    end_date text,
    ratio text,
    start_date text,
    PRIMARY KEY ("index", _fivetran_id),
    FOREIGN KEY (_fivetran_id) REFERENCES capacity_category(_fivetran_id),
    FOREIGN KEY (label) REFERENCES work_skill(_fivetran_id)
);

CREATE TABLE capacity_category_work_skill_group (
    "index" text,
    _fivetran_id text,
    label text,
    start_date text,
    PRIMARY KEY ("index", _fivetran_id),
    FOREIGN KEY (_fivetran_id) REFERENCES capacity_category(_fivetran_id),
    FOREIGN KEY (label) REFERENCES work_skill_group(_fivetran_id)
);

CREATE TABLE capacity_category_translation (
    "index" text,
    _fivetran_id text,
    language_iso text,
    languages text,
    "name" text,
    PRIMARY KEY ("index", _fivetran_id),
    FOREIGN KEY (_fivetran_id) REFERENCES capacity_category(_fivetran_id)
);

CREATE TABLE capacity_category_time_slot (
    "index" text,
    _fivetran_id text,
    label text,
    PRIMARY KEY ("index", _fivetran_id),
    FOREIGN KEY (_fivetran_id) REFERENCES capacity_category(_fivetran_id)
);

CREATE TABLE capacity_category (
    _fivetran_id text,
    active text,
    label text,
    "name" text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE inventory_type_translation (
    "index" text,
    _fivetran_id text,
    language_iso text,
    languages text,
    "name" text,
    unit_of_measurement text,
    PRIMARY KEY ("index", _fivetran_id),
    FOREIGN KEY (_fivetran_id) REFERENCES inventory_type(_fivetran_id)
);

CREATE TABLE inventory_type (
    _fivetran_id text,
    active text,
    label text,
    model_property text,
    "name" text,
    non_serialized text,
    unit_of_measurement text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE capacity_area (
    _fivetran_id text,
    parent_label text,
    label text,
    "name" text,
    parent_name text,
    "status" text,
    "type" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (parent_label) REFERENCES capacity_area(_fivetran_id)
);

CREATE TABLE inventory (
    inventory_id text,
    from_activity_id text,
    resource_id text,
    to_activity_id text,
    inventory_type text,
    quantity text,
    serial_number text,
    "status" text,
    PRIMARY KEY (inventory_id),
    FOREIGN KEY (from_activity_id) REFERENCES activity(activity_id),
    FOREIGN KEY (resource_id) REFERENCES resource_descendant(resource_id),
    FOREIGN KEY (to_activity_id) REFERENCES activity(activity_id)
);

CREATE TABLE work_schedule (
    schedule_item_id text,
    end_date text,
    is_working text,
    record_type text,
    recur_every text,
    recurrence_type text,
    shift_type text,
    start_date text,
    work_time_end text,
    work_time_start text,
    PRIMARY KEY (schedule_item_id)
);

CREATE TABLE enumeration_list_translation (
    "index" text,
    enumeration_list_id text,
    enumeration_list_property_label_id text,
    language_iso text,
    languages text,
    "name" text,
    PRIMARY KEY ("index", enumeration_list_id, enumeration_list_property_label_id),
    FOREIGN KEY (enumeration_list_id) REFERENCES enumeration_list(id),
    FOREIGN KEY (enumeration_list_property_label_id) REFERENCES enumeration_list(property_label_id)
);

CREATE TABLE enumeration_list (
    id text,
    property_label_id text,
    active text,
    PRIMARY KEY (id, property_label_id),
    FOREIGN KEY (property_label_id) REFERENCES property(id)
);

CREATE TABLE activity_group_type (
    id text,
    _fivetran_id text,
    label text,
    PRIMARY KEY (id, _fivetran_id),
    FOREIGN KEY (_fivetran_id) REFERENCES activity_type_group(_fivetran_id),
    FOREIGN KEY (label) REFERENCES activity_type(id)
);

CREATE TABLE activity_type_group_translation (
    "index" text,
    _fivetran_id text,
    language_iso text,
    languages text,
    "name" text,
    PRIMARY KEY ("index", _fivetran_id),
    FOREIGN KEY (_fivetran_id) REFERENCES activity_type_group(_fivetran_id)
);

CREATE TABLE activity_type_group (
    _fivetran_id text,
    label text,
    "name" text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE property_translation (
    "index" text,
    property_id text,
    hint text,
    language_iso text,
    languages text,
    "name" text,
    PRIMARY KEY ("index", property_id),
    FOREIGN KEY (property_id) REFERENCES property(id)
);

CREATE TABLE property (
    id text,
    entity text,
    gui text,
    hint text,
    "name" text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE resource_type_translation (
    "index" text,
    resource_type_id text,
    language_iso text,
    languages text,
    "name" text,
    PRIMARY KEY ("index", resource_type_id),
    FOREIGN KEY (resource_type_id) REFERENCES resource_type(id)
);

CREATE TABLE resource_type (
    id text,
    active text,
    "name" text,
    "role" text,
    PRIMARY KEY (id)
);

CREATE TABLE time_slot (
    id text,
    active text,
    is_all_day text,
    "name" text,
    time_end text,
    time_start text,
    PRIMARY KEY (id)
);

CREATE TABLE location (
    location_id text,
    address text,
    city text,
    country text,
    label text,
    latitude text,
    longitude text,
    postal_code text,
    "state" text,
    PRIMARY KEY (location_id)
);

CREATE TABLE key_work_zone (
    key_id text,
    _fivetran_id text,
    PRIMARY KEY (key_id, _fivetran_id),
    FOREIGN KEY (_fivetran_id) REFERENCES work_zone(_fivetran_id)
);

CREATE TABLE work_zone_shape (
    shape_id text,
    _fivetran_id text,
    PRIMARY KEY (shape_id, _fivetran_id),
    FOREIGN KEY (_fivetran_id) REFERENCES work_zone(_fivetran_id)
);

CREATE TABLE work_zone (
    _fivetran_id text,
    "status" text,
    travel_area text,
    work_zone_label text,
    work_zone_name text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE organization_translation (
    "index" text,
    _fivetran_id text,
    language_iso text,
    languages text,
    "name" text,
    PRIMARY KEY ("index", _fivetran_id),
    FOREIGN KEY (_fivetran_id) REFERENCES organization(_fivetran_id)
);

CREATE TABLE organization (
    _fivetran_id text,
    label text,
    "name" text,
    "type" text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE activity_type_translation (
    "index" text,
    activity_type_id text,
    language_iso text,
    languages text,
    "name" text,
    PRIMARY KEY ("index", activity_type_id),
    FOREIGN KEY (activity_type_id) REFERENCES activity_type(id)
);

CREATE TABLE activity_type_time_slot (
    "index" text,
    activity_type_id text,
    label text,
    PRIMARY KEY ("index", activity_type_id),
    FOREIGN KEY (activity_type_id) REFERENCES activity_type(id)
);

CREATE TABLE activity_type (
    id text,
    active text,
    color_cancelled text,
    color_completed text,
    color_enroute text,
    color_not_done text,
    color_not_ordered text,
    color_pending text,
    color_started text,
    color_suspended text,
    color_warning text,
    default_duration text,
    features_allow_creation_in_bucket text,
    features_allow_mass_activity text,
    features_allow_move_between_resource text,
    features_allow_non_scheduled text,
    features_allow_repeating_activity text,
    features_allow_reschedule text,
    features_allow_to_create_from_incoming_interface text,
    features_allow_to_search text,
    features_calculate_activity_duration_using_statistics text,
    features_calculate_delivery_window text,
    features_calculate_travel text,
    features_disable_location_tracking text,
    features_enable_day_before_trigger text,
    features_enable_not_started_trigger text,
    features_enable_reminder_and_change_trigger text,
    features_enable_sw_warning_trigger text,
    features_is_segmenting_enabled text,
    features_is_team_work_available text,
    features_sla_and_service_window_use_customer_timezone text,
    features_support_of_inventory text,
    features_support_of_link text,
    features_support_of_not_ordered_activity text,
    features_support_of_preferred_resource text,
    features_support_of_required_inventory text,
    features_support_of_timeslot text,
    features_support_of_work_skill text,
    features_support_of_work_zone text,
    group_label text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE work_zone_key (
    _fivetran_id text,
    api_parameter_name text,
    "function" text,
    label text,
    length text,
    orders text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE capacity (
    _fivetran_id text,
    calendar jsonb,
    categories jsonb,
    "date" text,
    label text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE required_inventory (
    _fivetran_id text,
    inventory_type text,
    model text,
    quantity text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE quota (
    _fivetran_id text,
    booked_activity text,
    "date" text,
    label text,
    max_available text,
    min_quota text,
    "name" text,
    other_activity text,
    quota text,
    quota_is_auto_closed text,
    quota_is_closed text,
    quota_percent text,
    used text,
    used_quota_percent text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE form_translation (
    "index" text,
    _fivetran_id text,
    language_iso text,
    languages text,
    "name" text,
    PRIMARY KEY ("index", _fivetran_id),
    FOREIGN KEY (_fivetran_id) REFERENCES forms(_fivetran_id)
);

CREATE TABLE forms (
    _fivetran_id text,
    label text,
    "name" text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE routing_profile (
    _fivetran_id text,
    profile_label text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE work_skill_translation (
    "index" text,
    _fivetran_id text,
    language_iso text,
    languages text,
    "name" text,
    PRIMARY KEY ("index", _fivetran_id),
    FOREIGN KEY (_fivetran_id) REFERENCES work_skill(_fivetran_id)
);

CREATE TABLE work_skill (
    _fivetran_id text,
    active text,
    label text,
    "name" text,
    sharing text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE resource_preference (
    resource_id text,
    preference_type jsonb,
    PRIMARY KEY (resource_id),
    FOREIGN KEY (resource_id) REFERENCES resource_descendant(resource_id)
);

CREATE TABLE non_working_reason_translation (
    "index" text,
    non_working_reason_id text,
    language_iso text,
    languages text,
    "name" text,
    PRIMARY KEY ("index", non_working_reason_id),
    FOREIGN KEY (non_working_reason_id) REFERENCES non_working_reason(id)
);

CREATE TABLE non_working_reason (
    id text,
    active text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE resource_work_skill (
    _fivetran_id text,
    end_date text,
    ratio text,
    start_date text,
    work_skill text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE resource_work_zone (
    work_zone_item_id text,
    ratio text,
    recur_every text,
    recurrence text,
    start_date text,
    "type" text,
    work_zone text,
    work_zone_status text,
    PRIMARY KEY (work_zone_item_id)
);

CREATE TABLE activity (
    activity_id text,
    activity_type_label text,
    resource_id text,
    team_resource_id text,
    access_schedule text,
    activity_flow text,
    appt_number text,
    auto_routed_to_date text,
    auto_routed_to_resource text,
    city text,
    coordinate_accuracy text,
    country_code text,
    customer_cell text,
    customer_email text,
    customer_name text,
    customer_number text,
    customer_phone text,
    "date" text,
    delivery_window_end text,
    delivery_window_start text,
    duration text,
    end_time text,
    first_manual_operation text,
    first_manual_operation_user text,
    ib_asset_id text,
    language_iso text,
    languages text,
    latitude text,
    longitude text,
    master_activity_id text,
    pjf_project_element_id text,
    pjf_project_id text,
    point text,
    position_in_route text,
    postal_code text,
    record_type jsonb,
    reminder_time text,
    resource_time_zone text,
    resource_time_zone_diff text,
    resource_time_zone_iana text,
    service_window_end text,
    service_window_start text,
    sla_window_end text,
    sla_window_start text,
    start_time text,
    state_province text,
    "status" jsonb,
    street_address text,
    svc_work_order_id text,
    time_delivered_end text,
    time_delivered_start text,
    time_of_assignment text,
    time_of_booking text,
    time_slot text,
    time_zone text,
    time_zone_iana text,
    travel_estimation_method text,
    travel_time text,
    wie_work_order_id text,
    wie_work_order_operation_id text,
    work_zone text,
    PRIMARY KEY (activity_id),
    FOREIGN KEY (activity_type_label) REFERENCES activity_type(id),
    FOREIGN KEY (resource_id) REFERENCES resource_descendant(resource_id),
    FOREIGN KEY (team_resource_id) REFERENCES resource_descendant(resource_id)
);

CREATE TABLE linked_activity (
    _fivetran_id text,
    from_activity_id text,
    to_activity_id text,
    alert text,
    link_type text,
    max_interval_value text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (from_activity_id) REFERENCES activity(activity_id),
    FOREIGN KEY (to_activity_id) REFERENCES activity(activity_id)
);
