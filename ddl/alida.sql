CREATE TABLE member_event (
    id text,
    activity_id text,
    batch_id text,
    communication_id text,
    community_id text,
    create_date timestamp,
    created_by text,
    event_date text,
    event_type text,
    member_data_set_type text,
    member_id text,
    participant_type text,
    redirect_url text,
    PRIMARY KEY (id),
    FOREIGN KEY (activity_id) REFERENCES activity(id)
);

CREATE TABLE member_activity (
    id text,
    closed_on text,
    communication_id text,
    communication_status text,
    communicationtn_type text,
    create_date text,
    created_by text,
    description text,
    event_date text,
    event_type text,
    is_hidden text,
    last_update_date timestamp,
    last_updated_by text,
    link text,
    member_id text,
    "name" text,
    opened_on text,
    "status" text,
    title text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES activity(id)
);

CREATE TABLE activity (
    id text,
    allow_multiple_response text,
    closed_date text,
    created_by_id text,
    created_date text,
    dataset_type text,
    "name" text,
    "status" text,
    PRIMARY KEY (id)
);

CREATE TABLE dataset (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE profile_record_field (
    id text,
    dataset_id text,
    profile_record_id text,
    profile_id text,
    "value" jsonb,
    PRIMARY KEY (id, dataset_id, profile_record_id),
    FOREIGN KEY (dataset_id) REFERENCES profile_record(dataset_id),
    FOREIGN KEY (profile_record_id) REFERENCES profile_record(id),
    FOREIGN KEY (profile_id) REFERENCES profile_record(profile_id)
);

CREATE TABLE profile_record (
    id text,
    dataset_id text,
    profile_id text,
    last_update_date text,
    PRIMARY KEY (id, dataset_id),
    FOREIGN KEY (dataset_id) REFERENCES profile(dataset_id),
    FOREIGN KEY (profile_id) REFERENCES profile(id)
);

CREATE TABLE profile_field_type_value (
    id text,
    dataset_id text,
    profile_field_id text,
    profile_id text,
    meta_visibility text,
    "name" text,
    PRIMARY KEY (id, dataset_id, profile_field_id),
    FOREIGN KEY (dataset_id) REFERENCES profile_field(dataset_id),
    FOREIGN KEY (profile_field_id) REFERENCES profile_field(id),
    FOREIGN KEY (profile_id) REFERENCES profile_field(profile_id)
);

CREATE TABLE profile_field (
    id text,
    dataset_id text,
    profile_id text,
    data_type text,
    is_sensitive text,
    meta_visibility text,
    "name" text,
    PRIMARY KEY (id, dataset_id),
    FOREIGN KEY (dataset_id) REFERENCES profile(dataset_id),
    FOREIGN KEY (profile_id) REFERENCES profile(id)
);

CREATE TABLE profile (
    id text,
    dataset_id text,
    export_date text,
    last_sync_date text,
    PRIMARY KEY (id, dataset_id),
    FOREIGN KEY (dataset_id) REFERENCES dataset(id)
);

CREATE TABLE activity_response_field_value (
    "index" text,
    activity_id text,
    activity_response_field_id text,
    activity_response_id text,
    id text,
    meta_order text,
    "name" text,
    PRIMARY KEY ("index", activity_id, activity_response_field_id, activity_response_id),
    FOREIGN KEY (activity_id) REFERENCES activity_response_field(activity_id),
    FOREIGN KEY (activity_response_field_id) REFERENCES activity_response_field(id),
    FOREIGN KEY (activity_response_id) REFERENCES activity_response_field(activity_response_id)
);

CREATE TABLE activity_response_field (
    id text,
    activity_id text,
    activity_response_id text,
    data_type text,
    is_sensitive text,
    meta_description text,
    meta_is_required text,
    meta_is_system text,
    meta_order text,
    meta_source_field_type text,
    meta_visibility text,
    "name" text,
    PRIMARY KEY (id, activity_id, activity_response_id),
    FOREIGN KEY (activity_id) REFERENCES activity_response(activity_id),
    FOREIGN KEY (activity_response_id) REFERENCES activity_response(id)
);

CREATE TABLE activity_response_field_group_id (
    activity_id text,
    activity_response_field_group_id text,
    activity_response_id text,
    field_id text,
    PRIMARY KEY (activity_id, activity_response_field_group_id, activity_response_id, field_id),
    FOREIGN KEY (activity_id) REFERENCES activity_response_field_group(activity_id),
    FOREIGN KEY (activity_response_field_group_id) REFERENCES activity_response_field_group(id),
    FOREIGN KEY (activity_response_id) REFERENCES activity_response_field_group(activity_response_id),
    FOREIGN KEY (field_id) REFERENCES activity_response_field(id)
);

CREATE TABLE activity_response_field_group (
    id text,
    activity_id text,
    activity_response_id text,
    meta_description text,
    meta_is_required text,
    meta_source_field_group_type text,
    "name" text,
    PRIMARY KEY (id, activity_id, activity_response_id),
    FOREIGN KEY (activity_id) REFERENCES activity_response(activity_id),
    FOREIGN KEY (activity_response_id) REFERENCES activity_response(id)
);

CREATE TABLE activity_response_record_field (
    id text,
    activity_id text,
    activity_response_id text,
    activity_response_record_id text,
    "value" jsonb,
    PRIMARY KEY (id, activity_id, activity_response_id, activity_response_record_id),
    FOREIGN KEY (activity_id) REFERENCES activity_response_record(activity_id),
    FOREIGN KEY (activity_response_id) REFERENCES activity_response_record(activity_response_id),
    FOREIGN KEY (activity_response_record_id) REFERENCES activity_response_record(id)
);

CREATE TABLE activity_response_record (
    id text,
    activity_id text,
    activity_response_id text,
    last_update_date text,
    PRIMARY KEY (id, activity_id, activity_response_id),
    FOREIGN KEY (activity_id) REFERENCES activity_response(activity_id),
    FOREIGN KEY (activity_response_id) REFERENCES activity_response(id)
);

CREATE TABLE activity_response (
    id text,
    activity_id text,
    export_date text,
    last_sync_date text,
    since_date_time text,
    until_date_time text,
    PRIMARY KEY (id, activity_id),
    FOREIGN KEY (activity_id) REFERENCES activity(id)
);
