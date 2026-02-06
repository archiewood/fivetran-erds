CREATE TABLE account (
    id text,
    "name" text,
    primary_timezone text,
    setting_enable_lead text,
    setting_team_permissions_enabled text,
    PRIMARY KEY (id)
);

CREATE TABLE custom_field_definition_available_on (
    "index" text,
    custom_field_definition_id text,
    available_on text,
    PRIMARY KEY ("index", custom_field_definition_id),
    FOREIGN KEY (custom_field_definition_id) REFERENCES custom_field_definition(id)
);

CREATE TABLE custom_field_definition_option (
    id text,
    custom_field_definition_id text,
    "name" text,
    rank text,
    PRIMARY KEY (id),
    FOREIGN KEY (custom_field_definition_id) REFERENCES custom_field_definition(id)
);

CREATE TABLE custom_field_definition (
    id text,
    currency text,
    data_type text,
    is_filterable text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE contact_type (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE custom_activity_type (
    id text,
    company_id text,
    icon_type text,
    is_default_task_type text,
    is_disabled text,
    is_interaction text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (company_id) REFERENCES company(id)
);

CREATE TABLE pipeline (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE task_tag (
    "index" text,
    task_id text,
    tags text,
    PRIMARY KEY ("index", task_id),
    FOREIGN KEY (task_id) REFERENCES task(id)
);

CREATE TABLE task (
    id text,
    assignee_id text,
    custom_activity_type_id text,
    opportunity_id jsonb,
    project_id jsonb,
    completed_date text,
    custom_field jsonb,
    date_created text,
    date_modified text,
    detail text,
    due_date text,
    "name" text,
    priority text,
    related_resource_id text,
    related_resource_type text,
    reminder_date text,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (assignee_id) REFERENCES users(id),
    FOREIGN KEY (custom_activity_type_id) REFERENCES custom_activity_type(id),
    FOREIGN KEY (opportunity_id) REFERENCES opportunity(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE pipeline_stage (
    id text,
    pipeline_id text,
    "name" text,
    win_probability text,
    PRIMARY KEY (id, pipeline_id),
    FOREIGN KEY (pipeline_id) REFERENCES pipeline(id)
);

CREATE TABLE project_tag (
    "index" text,
    project_id text,
    tags text,
    PRIMARY KEY ("index", project_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE project_custom_field (
    custom_field_definition_id text,
    project_id text,
    "value" jsonb,
    PRIMARY KEY (custom_field_definition_id, project_id),
    FOREIGN KEY (custom_field_definition_id) REFERENCES custom_field_definition(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE project (
    id text,
    assignee_id text,
    date_created text,
    date_modified text,
    detail text,
    "name" text,
    related_resource_id text,
    related_resource_type text,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (assignee_id) REFERENCES users(id)
);

CREATE TABLE opportunity_loss_reason (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE company_phone_number (
    "index" text,
    company_id text,
    category text,
    number text,
    PRIMARY KEY ("index", company_id),
    FOREIGN KEY (company_id) REFERENCES company(id)
);

CREATE TABLE company_social (
    "index" text,
    company_id text,
    category text,
    url text,
    PRIMARY KEY ("index", company_id),
    FOREIGN KEY (company_id) REFERENCES company(id)
);

CREATE TABLE company_website (
    "index" text,
    company_id text,
    category text,
    url text,
    PRIMARY KEY ("index", company_id),
    FOREIGN KEY (company_id) REFERENCES company(id)
);

CREATE TABLE company_tag (
    "index" text,
    company_id text,
    tags text,
    PRIMARY KEY ("index", company_id),
    FOREIGN KEY (company_id) REFERENCES company(id)
);

CREATE TABLE company_custom_field (
    company_id text,
    custom_field_definition_id text,
    "value" text,
    PRIMARY KEY (company_id, custom_field_definition_id),
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (custom_field_definition_id) REFERENCES custom_field_definition(id)
);

CREATE TABLE company (
    id text,
    assignee_id text,
    contact_type_id text,
    age text,
    city text,
    country text,
    date_created text,
    date_modified timestamp,
    detail text,
    email_domain text,
    followed text,
    interaction_count text,
    "name" text,
    postal_code text,
    "state" text,
    street text,
    PRIMARY KEY (id),
    FOREIGN KEY (assignee_id) REFERENCES users(id),
    FOREIGN KEY (contact_type_id) REFERENCES contact_type(id)
);

CREATE TABLE customer_source (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE people_phone_number (
    "index" text,
    people_id text,
    category text,
    number text,
    PRIMARY KEY ("index", people_id),
    FOREIGN KEY (people_id) REFERENCES people(id)
);

CREATE TABLE people_social (
    "index" text,
    people_id text,
    category text,
    url text,
    PRIMARY KEY ("index", people_id),
    FOREIGN KEY (people_id) REFERENCES people(id)
);

CREATE TABLE people_email (
    "index" text,
    people_id text,
    category text,
    email text,
    PRIMARY KEY ("index", people_id),
    FOREIGN KEY (people_id) REFERENCES people(id)
);

CREATE TABLE people_tag (
    "index" text,
    people_id text,
    tags text,
    PRIMARY KEY ("index", people_id),
    FOREIGN KEY (people_id) REFERENCES people(id)
);

CREATE TABLE people_website (
    "index" text,
    people_id text,
    category text,
    url text,
    PRIMARY KEY ("index", people_id),
    FOREIGN KEY (people_id) REFERENCES people(id)
);

CREATE TABLE people_custom_field (
    custom_field_definition_id text,
    people_id text,
    "value" jsonb,
    PRIMARY KEY (custom_field_definition_id, people_id),
    FOREIGN KEY (custom_field_definition_id) REFERENCES custom_field_definition(id),
    FOREIGN KEY (people_id) REFERENCES people(id)
);

CREATE TABLE people (
    id text,
    assignee_id text,
    company_id text,
    contact_type_id text,
    opportunity_id jsonb,
    city text,
    company_name text,
    country text,
    date_created text,
    date_last_contacted text,
    date_lead_created text,
    date_modified timestamp,
    detail text,
    first_name text,
    interaction_count text,
    last_name text,
    leads_converted_from jsonb,
    middle_name text,
    "name" text,
    postal_code text,
    prefix text,
    "state" text,
    street text,
    suffix text,
    title text,
    PRIMARY KEY (id),
    FOREIGN KEY (assignee_id) REFERENCES users(id),
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (contact_type_id) REFERENCES contact_type(id),
    FOREIGN KEY (opportunity_id) REFERENCES opportunity(id)
);

CREATE TABLE users_group (
    id text,
    users_id text,
    "name" text,
    PRIMARY KEY (id, users_id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    email text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE opportunity_tag (
    "index" text,
    opportunity_id text,
    tags text,
    PRIMARY KEY ("index", opportunity_id),
    FOREIGN KEY (opportunity_id) REFERENCES opportunity(id)
);

CREATE TABLE opportunity_custom_field (
    custom_field_definition_id text,
    opportunity_id text,
    "value" jsonb,
    PRIMARY KEY (custom_field_definition_id, opportunity_id),
    FOREIGN KEY (custom_field_definition_id) REFERENCES custom_field_definition(id),
    FOREIGN KEY (opportunity_id) REFERENCES opportunity(id)
);

CREATE TABLE opportunity (
    id text,
    assignee_id text,
    company_id text,
    customer_source_id text,
    loss_reason_id text,
    pipeline_id text,
    pipeline_stage_id text,
    primary_contact_id text,
    close_date text,
    company_name text,
    converted_unit text,
    converted_value text,
    date_created text,
    date_last_contacted text,
    date_lead_created text,
    date_modified text,
    date_stage_changed text,
    detail text,
    interaction_count text,
    leads_converted_from jsonb,
    monetary_unit text,
    monetary_value text,
    "name" text,
    priority text,
    "status" text,
    win_probability text,
    PRIMARY KEY (id),
    FOREIGN KEY (assignee_id) REFERENCES users(id),
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (customer_source_id) REFERENCES customer_source(id),
    FOREIGN KEY (loss_reason_id) REFERENCES opportunity_loss_reason(id),
    FOREIGN KEY (pipeline_id) REFERENCES pipeline(id),
    FOREIGN KEY (pipeline_stage_id) REFERENCES pipeline_stage(id),
    FOREIGN KEY (primary_contact_id) REFERENCES people(id)
);

CREATE TABLE activity (
    id text,
    parent_id text,
    user_id text,
    activity_date text,
    date_created text,
    date_modified text,
    detail text,
    new_value text,
    old_value text,
    parent_type text,
    type_category text,
    type_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (parent_id) REFERENCES activity(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE lead_phone_number (
    "index" text,
    lead_id text,
    category text,
    number text,
    PRIMARY KEY ("index", lead_id),
    FOREIGN KEY (lead_id) REFERENCES lead(id)
);

CREATE TABLE lead_social (
    "index" text,
    lead_id text,
    category text,
    url text,
    PRIMARY KEY ("index", lead_id),
    FOREIGN KEY (lead_id) REFERENCES lead(id)
);

CREATE TABLE lead_tag (
    "index" text,
    lead_id text,
    tags text,
    PRIMARY KEY ("index", lead_id),
    FOREIGN KEY (lead_id) REFERENCES lead(id)
);

CREATE TABLE lead_website (
    "index" text,
    lead_id text,
    category text,
    url text,
    PRIMARY KEY ("index", lead_id),
    FOREIGN KEY (lead_id) REFERENCES lead(id)
);

CREATE TABLE lead_custom_field (
    custom_field_definition_id text,
    lead_id text,
    "value" jsonb,
    PRIMARY KEY (custom_field_definition_id, lead_id),
    FOREIGN KEY (custom_field_definition_id) REFERENCES custom_field_definition(id),
    FOREIGN KEY (lead_id) REFERENCES lead(id)
);

CREATE TABLE lead (
    id text,
    assignee_id text,
    company_id text,
    contact_type_id text,
    customer_source_id jsonb,
    city text,
    converted_at text,
    converted_contact_id text,
    converted_opportunity_id text,
    country text,
    date_created text,
    date_last_contacted text,
    date_modified text,
    detail jsonb,
    email text,
    email_category text,
    first_name text,
    interaction_count text,
    last_name text,
    middle_name text,
    monetary_value text,
    "name" text,
    postal_code text,
    prefix text,
    "state" text,
    "status" text,
    status_id text,
    street text,
    suffix text,
    title text,
    PRIMARY KEY (id),
    FOREIGN KEY (assignee_id) REFERENCES users(id),
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (contact_type_id) REFERENCES contact_type(id),
    FOREIGN KEY (customer_source_id) REFERENCES customer_source(id)
);
