CREATE TABLE organization (
    id text,
    fields_employee_count text,
    fields_industry text,
    PRIMARY KEY (id)
);

CREATE TABLE person_tag (
    person_id text,
    tag_id text,
    PRIMARY KEY (person_id, tag_id),
    FOREIGN KEY (person_id) REFERENCES person(id),
    FOREIGN KEY (tag_id) REFERENCES tag(id)
);

CREATE TABLE person (
    id text,
    organization_id text,
    birthday text,
    email text,
    email_subscribe_action text,
    email_subscription_permision text,
    email_unsubscribe_action text,
    external_id text,
    first_name text,
    gdpr text,
    job_title text,
    last_name text,
    phone_number text,
    phone_number_code text,
    postal text,
    sms_subscribe_action text,
    sms_subscription_permission text,
    sms_unsubscribe_action text,
    tag_ids text,
    tags text,
    PRIMARY KEY (id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE person_location (
    _fivetran_id text,
    person_id text,
    id text,
    latitude text,
    longitude text,
    "name" text,
    "type" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (person_id) REFERENCES person(id)
);

CREATE TABLE person_audience (
    audience_id text,
    person_id text,
    android_opted_in text,
    android_permissions text,
    email_permissions text,
    error text,
    ios_opted_in text,
    ios_permissions text,
    member_from text,
    person_status text,
    sms_opted_out_from text,
    sms_permissions text,
    subscribed text,
    subscribed_from text,
    unsubscribed_from text,
    web_opted_in text,
    web_permissions text,
    PRIMARY KEY (audience_id, person_id),
    FOREIGN KEY (audience_id) REFERENCES audience(id),
    FOREIGN KEY (person_id) REFERENCES person(id)
);

CREATE TABLE audience (
    id text,
    added_last_30_days text,
    building text,
    created text,
    created_by_name text,
    data_source_id text,
    destinations text,
    edited_at text,
    engagement text,
    exit_selection text,
    filter jsonb,
    filter_sha text,
    icon_id text,
    instance_id text,
    is_cold text,
    is_public text,
    last_built_at text,
    last_used text,
    member_count text,
    "name" text,
    new_exit_criteria_filter text,
    new_filter text,
    new_filter_sha text,
    "position" text,
    public_description text,
    public_name text,
    ready text,
    revenue text,
    sms_is_public text,
    sms_opted_in text,
    sms_public_description text,
    sms_public_name text,
    subscribers text,
    template_id text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE tag (
    id text,
    instance_id text,
    count text,
    created_at text,
    created_by_email text,
    created_by_name text,
    last_used text,
    "name" text,
    sms_opted_in text,
    "source" text,
    subscribers text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (instance_id) REFERENCES audience(instance_id)
);
