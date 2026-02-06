CREATE TABLE interaction_email_to (
    interaction_email_id text,
    organization_id text,
    person_to_id text,
    PRIMARY KEY (interaction_email_id, organization_id, person_to_id),
    FOREIGN KEY (interaction_email_id) REFERENCES interaction_email(id),
    FOREIGN KEY (organization_id) REFERENCES interaction_email(organization_id),
    FOREIGN KEY (person_to_id) REFERENCES person_with_interaction(id)
);

CREATE TABLE interaction_email (
    id text,
    from_id text,
    organization_id text,
    cc jsonb,
    "date" text,
    direction text,
    subject text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (from_id) REFERENCES person_with_interaction(id),
    FOREIGN KEY (organization_id) REFERENCES organization_with_interaction(id)
);

CREATE TABLE organization_field_value (
    id text,
    entity_id text,
    field_id text,
    list_entry_id text,
    created_at text,
    entity_type text,
    updated_at text,
    "value" jsonb,
    value_type text,
    PRIMARY KEY (id, entity_id),
    FOREIGN KEY (entity_id) REFERENCES organization_with_interaction(id),
    FOREIGN KEY (field_id) REFERENCES field(id),
    FOREIGN KEY (list_entry_id) REFERENCES list_entry(id)
);

CREATE TABLE list_entry (
    id text,
    list_id text,
    created_at text,
    creator_id text,
    -- entity_* (dynamic column),
    PRIMARY KEY (id, list_id),
    FOREIGN KEY (list_id) REFERENCES list(id)
);

CREATE TABLE person_with_interaction_email (
    email_id text,
    person_id text,
    PRIMARY KEY (email_id, person_id),
    FOREIGN KEY (person_id) REFERENCES person_with_interaction(id)
);

CREATE TABLE person_with_interaction (
    id text,
    first_name text,
    last_name text,
    primary_email text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE field_dropdown_option (
    id text,
    field_id text,
    rank text,
    text text,
    PRIMARY KEY (id, field_id),
    FOREIGN KEY (field_id) REFERENCES field(id)
);

CREATE TABLE field (
    id text,
    list_id text,
    allows_multiple text,
    enrichment_source text,
    "name" text,
    track_changes text,
    value_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (list_id) REFERENCES list(id)
);

CREATE TABLE person_field_value (
    id text,
    entity_id text,
    field_id text,
    list_entry_id text,
    created_at text,
    entity_type text,
    updated_at text,
    "value" jsonb,
    value_type text,
    PRIMARY KEY (id, entity_id),
    FOREIGN KEY (entity_id) REFERENCES person_without_interaction(id),
    FOREIGN KEY (field_id) REFERENCES field(id),
    FOREIGN KEY (list_entry_id) REFERENCES list_entry(id)
);

CREATE TABLE organization_with_interaction_domain (
    domain text,
    organization_id text,
    PRIMARY KEY (domain, organization_id),
    FOREIGN KEY (domain) REFERENCES organization_with_interaction(domain),
    FOREIGN KEY (organization_id) REFERENCES organization_with_interaction(id)
);

CREATE TABLE organization_with_interaction_person_id (
    organization_id text,
    person_id text,
    PRIMARY KEY (organization_id, person_id),
    FOREIGN KEY (organization_id) REFERENCES organization_with_interaction(id),
    FOREIGN KEY (person_id) REFERENCES person_with_interaction(id)
);

CREATE TABLE organization_with_interaction_list_entry (
    list_entry_id text,
    organization_id text,
    PRIMARY KEY (list_entry_id, organization_id),
    FOREIGN KEY (list_entry_id) REFERENCES list_entry(id),
    FOREIGN KEY (organization_id) REFERENCES organization_with_interaction(id)
);

CREATE TABLE organization_with_interaction (
    id text,
    crunchbase_uuid text,
    domain text,
    global text,
    interaction_first_email_date text,
    interaction_first_event_date text,
    interaction_last_chat_message_date text,
    interaction_last_email_date text,
    interaction_last_event_date text,
    interaction_last_interaction_date text,
    interaction_next_event_date text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE organization_interaction_person_id (
    "type" text,
    organization_id text,
    person_id text,
    interaction_date text,
    PRIMARY KEY ("type", organization_id, person_id),
    FOREIGN KEY (organization_id) REFERENCES organization_with_interaction(id),
    FOREIGN KEY (person_id) REFERENCES person_with_interaction(id),
    FOREIGN KEY (interaction_date) REFERENCES organization_with_interaction(interaction_first_event_date)
);

CREATE TABLE relationship_strength (
    external_id text,
    internal_id text,
    strength text,
    PRIMARY KEY (external_id, internal_id),
    FOREIGN KEY (external_id) REFERENCES person_with_interaction(id),
    FOREIGN KEY (internal_id) REFERENCES person_with_interaction(id)
);

CREATE TABLE interaction_meeting_attendee (
    attendee_email_id text,
    interaction_meeting_id text,
    organization_id text,
    PRIMARY KEY (attendee_email_id, interaction_meeting_id, organization_id),
    FOREIGN KEY (interaction_meeting_id) REFERENCES interaction_meeting(id),
    FOREIGN KEY (organization_id) REFERENCES interaction_meeting(organization_id)
);

CREATE TABLE interaction_meeting_note (
    interaction_meeting_id text,
    note_id text,
    organization_id text,
    PRIMARY KEY (interaction_meeting_id, note_id, organization_id),
    FOREIGN KEY (interaction_meeting_id) REFERENCES interaction_meeting(id),
    FOREIGN KEY (note_id) REFERENCES note(id),
    FOREIGN KEY (organization_id) REFERENCES interaction_meeting(organization_id)
);

CREATE TABLE interaction_meeting_person (
    id text,
    interaction_meeting_id text,
    organization_id text,
    PRIMARY KEY (id, interaction_meeting_id, organization_id),
    FOREIGN KEY (interaction_meeting_id) REFERENCES interaction_meeting(id),
    FOREIGN KEY (organization_id) REFERENCES interaction_meeting(organization_id)
);

CREATE TABLE interaction_meeting (
    id text,
    organization_id text,
    "date" text,
    end_time text,
    manual_creator_id text,
    start_time text,
    title text,
    "type" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (organization_id) REFERENCES organization_with_interaction(id)
);

CREATE TABLE list (
    id text,
    creator_id text,
    owner_id text,
    list_size text,
    "name" text,
    public text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (creator_id) REFERENCES person_with_interaction(id),
    FOREIGN KEY (owner_id) REFERENCES person_with_interaction(id)
);

CREATE TABLE person_without_interaction_email (
    email_id text,
    person_id text,
    PRIMARY KEY (email_id, person_id),
    FOREIGN KEY (person_id) REFERENCES person_without_interaction(id)
);

CREATE TABLE person_without_interaction (
    id text,
    first_name text,
    interaction_first_email_date text,
    interaction_first_event_date text,
    last_name text,
    primary_email text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE organization_without_interaction_domain (
    domain text,
    organization_id text,
    PRIMARY KEY (domain, organization_id),
    FOREIGN KEY (domain) REFERENCES organization_without_interaction(domain),
    FOREIGN KEY (organization_id) REFERENCES organization_without_interaction(id)
);

CREATE TABLE organization_without_interaction_person_id (
    organization_id text,
    person_id text,
    PRIMARY KEY (organization_id, person_id),
    FOREIGN KEY (organization_id) REFERENCES organization_without_interaction(id),
    FOREIGN KEY (person_id) REFERENCES person_without_interaction(id)
);

CREATE TABLE organization_without_interaction_list_entry (
    list_entry_id text,
    organization_id text,
    PRIMARY KEY (list_entry_id, organization_id),
    FOREIGN KEY (list_entry_id) REFERENCES list_entry(id),
    FOREIGN KEY (organization_id) REFERENCES organization_without_interaction(id)
);

CREATE TABLE organization_without_interaction (
    id text,
    crunchbase_uuid text,
    domain text,
    global text,
    interaction_first_email_date text,
    interaction_first_event_date text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE global_organization_field (
    field_id text,
    list_id text,
    PRIMARY KEY (field_id),
    FOREIGN KEY (field_id) REFERENCES field(id),
    FOREIGN KEY (list_id) REFERENCES list(id)
);

CREATE TABLE reminder (
    id text,
    completer_id text,
    creator_id text,
    organization_id text,
    owner_id text,
    person_id text,
    completed_at text,
    content text,
    created_at text,
    due_date text,
    opportunity jsonb,
    reminder_days text,
    reset_type text,
    "status" text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (completer_id) REFERENCES person_with_interaction(id),
    FOREIGN KEY (creator_id) REFERENCES person_with_interaction(id),
    FOREIGN KEY (organization_id) REFERENCES organization_with_interaction(id),
    FOREIGN KEY (owner_id) REFERENCES person_with_interaction(id),
    FOREIGN KEY (person_id) REFERENCES person_with_interaction(id)
);

CREATE TABLE note_person (
    note_id text,
    person_id text,
    PRIMARY KEY (note_id, person_id),
    FOREIGN KEY (note_id) REFERENCES note(id),
    FOREIGN KEY (person_id) REFERENCES person_with_interaction(id)
);

CREATE TABLE note_organization (
    note_id text,
    organization_id text,
    PRIMARY KEY (note_id, organization_id),
    FOREIGN KEY (note_id) REFERENCES note(id),
    FOREIGN KEY (organization_id) REFERENCES organization_with_interaction(id)
);

CREATE TABLE note_mentioned_person (
    mentioned_person_id text,
    note_id text,
    PRIMARY KEY (mentioned_person_id, note_id),
    FOREIGN KEY (mentioned_person_id) REFERENCES person_with_interaction(id),
    FOREIGN KEY (note_id) REFERENCES note(id)
);

CREATE TABLE note_opportunity (
    note_id text,
    opportunity_id text,
    PRIMARY KEY (note_id, opportunity_id),
    FOREIGN KEY (note_id) REFERENCES note(id),
    FOREIGN KEY (opportunity_id) REFERENCES opportunity(id)
);

CREATE TABLE note (
    id text,
    content text,
    created_at text,
    creator_id text,
    interaction_id text,
    interaction_type text,
    is_meeting text,
    parent_id text,
    "type" text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE file (
    id text,
    opportunity_id text,
    organization_id text,
    person_id text,
    uploader_id text,
    created_at text,
    "name" text,
    "size" text,
    PRIMARY KEY (id),
    FOREIGN KEY (opportunity_id) REFERENCES opportunity(id),
    FOREIGN KEY (organization_id) REFERENCES organization_with_interaction(id),
    FOREIGN KEY (person_id) REFERENCES person_with_interaction(id),
    FOREIGN KEY (uploader_id) REFERENCES person_with_interaction(id)
);

CREATE TABLE interaction_chat_person (
    id text,
    interaction_chat_id text,
    organization_id text,
    PRIMARY KEY (id, interaction_chat_id, organization_id),
    FOREIGN KEY (id) REFERENCES person_with_interaction(id),
    FOREIGN KEY (interaction_chat_id) REFERENCES interaction_chat(id),
    FOREIGN KEY (organization_id) REFERENCES interaction_chat(organization_id)
);

CREATE TABLE interaction_chat_note (
    interaction_chat_id text,
    note_id text,
    organization_id text,
    PRIMARY KEY (interaction_chat_id, note_id, organization_id),
    FOREIGN KEY (interaction_chat_id) REFERENCES interaction_chat(id),
    FOREIGN KEY (note_id) REFERENCES note(id),
    FOREIGN KEY (organization_id) REFERENCES interaction_chat(organization_id)
);

CREATE TABLE interaction_chat (
    id text,
    manual_creator_id text,
    organization_id text,
    "date" text,
    direction text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (manual_creator_id) REFERENCES person_with_interaction(id),
    FOREIGN KEY (organization_id) REFERENCES organization_with_interaction(id)
);

CREATE TABLE interaction_call_attendee (
    attendee_email_id text,
    interaction_call_id text,
    organization_id text,
    PRIMARY KEY (attendee_email_id, interaction_call_id, organization_id),
    FOREIGN KEY (interaction_call_id) REFERENCES interaction_call(id),
    FOREIGN KEY (organization_id) REFERENCES interaction_call(organization_id)
);

CREATE TABLE interaction_call_note (
    interaction_call_id text,
    note_id text,
    organization_id text,
    PRIMARY KEY (interaction_call_id, note_id, organization_id),
    FOREIGN KEY (interaction_call_id) REFERENCES interaction_call(id),
    FOREIGN KEY (note_id) REFERENCES note(id),
    FOREIGN KEY (organization_id) REFERENCES interaction_call(organization_id)
);

CREATE TABLE interaction_call_person (
    id text,
    interaction_call_id text,
    organization_id text,
    PRIMARY KEY (id, interaction_call_id, organization_id),
    FOREIGN KEY (interaction_call_id) REFERENCES interaction_call(id),
    FOREIGN KEY (organization_id) REFERENCES interaction_call(organization_id)
);

CREATE TABLE interaction_call (
    id text,
    organization_id text,
    "date" text,
    end_time text,
    manual_creator_id text,
    start_time text,
    title text,
    "type" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (organization_id) REFERENCES organization_with_interaction(id)
);

CREATE TABLE opportunity_field_value (
    id text,
    entity_id text,
    field_id text,
    list_entry_id text,
    created_at text,
    entity_type text,
    updated_at text,
    "value" jsonb,
    value_type text,
    PRIMARY KEY (id, entity_id),
    FOREIGN KEY (entity_id) REFERENCES opportunity(id),
    FOREIGN KEY (field_id) REFERENCES field(id),
    FOREIGN KEY (list_entry_id) REFERENCES list_entry(id)
);

CREATE TABLE opportunity_list_entry (
    id text,
    opportunity_id text,
    creator_id text,
    list_id text,
    created_at text,
    entity_id text,
    entity_type text,
    PRIMARY KEY (id, opportunity_id),
    FOREIGN KEY (opportunity_id) REFERENCES opportunity(id),
    FOREIGN KEY (creator_id) REFERENCES person_with_interaction(id),
    FOREIGN KEY (list_id) REFERENCES list(id)
);

CREATE TABLE opportunity_person (
    opportunity_id text,
    person_id text,
    PRIMARY KEY (opportunity_id, person_id),
    FOREIGN KEY (opportunity_id) REFERENCES opportunity(id),
    FOREIGN KEY (person_id) REFERENCES person_with_interaction(id)
);

CREATE TABLE opportunity_organization (
    opportunity_id text,
    organization_id text,
    PRIMARY KEY (opportunity_id, organization_id),
    FOREIGN KEY (opportunity_id) REFERENCES opportunity(id),
    FOREIGN KEY (organization_id) REFERENCES organization_with_interaction(id)
);

CREATE TABLE opportunity (
    id text,
    "name" text,
    PRIMARY KEY (id)
);
