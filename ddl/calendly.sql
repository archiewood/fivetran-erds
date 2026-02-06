CREATE TABLE activity_log_entry (
    uri text,
    "action" text,
    actor_alternative_identifier text,
    actor_display_name text,
    actor_group_name text,
    actor_group_role text,
    actor_group_uri text,
    actor_organization_role text,
    actor_organization_uri text,
    actor_type text,
    actor_uri text,
    details jsonb,
    fully_qualified_name text,
    namespace text,
    occurred_at text,
    organization text,
    PRIMARY KEY (uri)
);

CREATE TABLE users (
    uri text,
    avatar_url text,
    created_at text,
    current_organization text,
    email text,
    "name" text,
    scheduling_url text,
    slug text,
    timezone text,
    updated_at text,
    PRIMARY KEY (uri)
);

CREATE TABLE user_availability_schedule_rule_interval (
    "index" text,
    user_availability_schedule_rule_index text,
    user_availability_schedule_uri text,
    from_time text,
    to_time text,
    PRIMARY KEY ("index", user_availability_schedule_rule_index, user_availability_schedule_uri),
    FOREIGN KEY (user_availability_schedule_rule_index) REFERENCES user_availability_schedule_rule("index"),
    FOREIGN KEY (user_availability_schedule_uri) REFERENCES user_availability_schedule_rule(user_availability_schedule_uri)
);

CREATE TABLE user_availability_schedule_rule (
    "index" text,
    user_availability_schedule_uri text,
    "date" text,
    "type" text,
    wday text,
    PRIMARY KEY ("index", user_availability_schedule_uri),
    FOREIGN KEY (user_availability_schedule_uri) REFERENCES user_availability_schedule(uri)
);

CREATE TABLE user_availability_schedule (
    uri text,
    user_uri text,
    defaults text,
    "name" text,
    timezone text,
    PRIMARY KEY (uri),
    FOREIGN KEY (user_uri) REFERENCES users(uri)
);

CREATE TABLE organization_invitation (
    uri text,
    user_uri text,
    created_at text,
    email text,
    last_sent_at text,
    organization_uri text,
    "status" text,
    updated_at text,
    PRIMARY KEY (uri),
    FOREIGN KEY (user_uri) REFERENCES users(uri)
);

CREATE TABLE answer_choice (
    "index" text,
    custom_question_name text,
    custom_question_position text,
    event_type_uri text,
    answer_choice text,
    PRIMARY KEY ("index", custom_question_name, custom_question_position, event_type_uri),
    FOREIGN KEY (custom_question_name) REFERENCES custom_question("name"),
    FOREIGN KEY (custom_question_position) REFERENCES custom_question("position"),
    FOREIGN KEY (event_type_uri) REFERENCES event_type(uri)
);

CREATE TABLE custom_question (
    "name" text,
    "position" text,
    event_type_uri text,
    enabled text,
    include_other text,
    required text,
    "type" text,
    PRIMARY KEY ("name", "position", event_type_uri),
    FOREIGN KEY (event_type_uri) REFERENCES event_type(uri)
);

CREATE TABLE event_type (
    uri text,
    profile_owner text,
    active text,
    booking_method text,
    color text,
    created_at text,
    description_html text,
    description_plain text,
    duration text,
    internal_note text,
    kind text,
    "name" text,
    pooling_type text,
    profile_name text,
    profile_type text,
    scheduling_url text,
    secret text,
    slug text,
    "type" text,
    updated_at text,
    PRIMARY KEY (uri),
    FOREIGN KEY (profile_owner) REFERENCES users(uri)
);

CREATE TABLE routing_form_question_answer_choice (
    answer_choice text,
    routing_form_question_uuid text,
    routing_form_uri text,
    PRIMARY KEY (answer_choice, routing_form_question_uuid, routing_form_uri),
    FOREIGN KEY (routing_form_question_uuid) REFERENCES routing_form_question(uuid),
    FOREIGN KEY (routing_form_uri) REFERENCES routing_form_question(routing_form_uri)
);

CREATE TABLE routing_form_question (
    uuid text,
    routing_form_uri text,
    "name" text,
    required text,
    "type" text,
    PRIMARY KEY (uuid, routing_form_uri),
    FOREIGN KEY (routing_form_uri) REFERENCES routing_form(uri)
);

CREATE TABLE routing_form (
    uri text,
    created_at text,
    "name" text,
    organization text,
    "status" text,
    updated_at text,
    PRIMARY KEY (uri)
);

CREATE TABLE question_and_answer (
    "position" text,
    event_invitee_uri text,
    answer text,
    question text,
    PRIMARY KEY ("position", event_invitee_uri),
    FOREIGN KEY (event_invitee_uri) REFERENCES event_invitee(uri)
);

CREATE TABLE event_invitee (
    uri text,
    event_uri text,
    cancel_reason text,
    cancel_url text,
    canceled_by text,
    canceler_type text,
    created_at text,
    email text,
    first_name text,
    last_name text,
    "name" text,
    new_invitee text,
    no_show_created_at text,
    no_show_uri text,
    old_invitee text,
    payment_amount text,
    payment_currency text,
    payment_external_id text,
    payment_provider text,
    payment_successful text,
    payment_terms text,
    reconfirmation_confirmed_at text,
    reconfirmation_created_at text,
    reschedule_url text,
    rescheduled text,
    "status" text,
    text_reminder_number text,
    timezone text,
    tracking_salesforce_uuid text,
    tracking_utm_campaign text,
    tracking_utm_content text,
    tracking_utm_medium text,
    tracking_utm_source text,
    tracking_utm_term text,
    updated_at text,
    PRIMARY KEY (uri),
    FOREIGN KEY (event_uri) REFERENCES event(uri)
);

CREATE TABLE organization_membership (
    uri text,
    user_uri text,
    created_at text,
    "role" text,
    updated_at text,
    PRIMARY KEY (uri),
    FOREIGN KEY (user_uri) REFERENCES users(uri)
);

CREATE TABLE event_type_availability_schedule_rule_interval (
    "index" text,
    event_type_availability_schedule_rule_index text,
    event_type_availability_schedule_uri text,
    from_time text,
    to_time text,
    PRIMARY KEY ("index", event_type_availability_schedule_rule_index, event_type_availability_schedule_uri),
    FOREIGN KEY (event_type_availability_schedule_rule_index) REFERENCES event_type_availability_schedule_rule("index"),
    FOREIGN KEY (event_type_availability_schedule_uri) REFERENCES event_type_availability_schedule_rule(event_type_availability_schedule_uri)
);

CREATE TABLE event_type_availability_schedule_rule (
    "index" text,
    event_type_availability_schedule_uri text,
    "date" text,
    "type" text,
    wday text,
    PRIMARY KEY ("index", event_type_availability_schedule_uri),
    FOREIGN KEY (event_type_availability_schedule_uri) REFERENCES event_type_availability_schedule(uri)
);

CREATE TABLE event_type_availability_schedule (
    uri text,
    event_type_uri text,
    user_uri text,
    availability_setting text,
    "name" text,
    timezone text,
    PRIMARY KEY (uri),
    FOREIGN KEY (event_type_uri) REFERENCES event_type(uri),
    FOREIGN KEY (user_uri) REFERENCES users(uri)
);

CREATE TABLE event_guest (
    email text,
    event_uri text,
    created_at text,
    updated_at text,
    PRIMARY KEY (email, event_uri),
    FOREIGN KEY (event_uri) REFERENCES event(uri)
);

CREATE TABLE event_membership (
    event_uri text,
    user_uri text,
    PRIMARY KEY (event_uri, user_uri),
    FOREIGN KEY (event_uri) REFERENCES event(uri),
    FOREIGN KEY (user_uri) REFERENCES users(uri)
);

CREATE TABLE event (
    uri text,
    event_type_uri text,
    cancel_reason text,
    canceled_by text,
    canceler_type text,
    created_at text,
    end_time text,
    invitees_active text,
    invitees_limit text,
    location text,
    location_type text,
    "name" text,
    start_time text,
    "status" text,
    updated_at text,
    PRIMARY KEY (uri),
    FOREIGN KEY (event_type_uri) REFERENCES event_type(uri)
);
