CREATE TABLE project (
    id text,
    creator_id text,
    owner_id text,
    company_name text,
    created_date text,
    creator_name text,
    description text,
    due_date text,
    "name" text,
    "status" text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (creator_id) REFERENCES users(id),
    FOREIGN KEY (owner_id) REFERENCES users(id)
);

CREATE TABLE view_basic_information (
    id text,
    creator_id text,
    project_id text,
    created_date text,
    creator_name text,
    file_extension text,
    file_name text,
    guid text,
    is_import_document text,
    last_updated text,
    last_updated_date text,
    "size" text,
    "status" text,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (creator_id) REFERENCES users(id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE compliance_set_option (
    "index" text,
    compliance_set_id text,
    label text,
    PRIMARY KEY ("index", compliance_set_id),
    FOREIGN KEY (compliance_set_id) REFERENCES compliance_set(id)
);

CREATE TABLE compliance_set (
    id text,
    label text,
    project_id text,
    short_name text,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES project(id)
);

CREATE TABLE project_merge_variable_value (
    _fivetran_id text,
    project_id text,
    deal_size text,
    uninitialized_variable text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE custom_project_fields_value (
    _fivetran_id text,
    project_id text,
    accessed_the_trust_portal text,
    amount text,
    blocked_reason text,
    is_blocked text,
    msa_or_mnda_signed_ text,
    opportunity_owner text,
    opportunity_url text,
    priority text,
    product_being_pitched text,
    security_packet_shared_already text,
    uninitialized_field text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE project_subsection (
    id text,
    project_id text,
    section_id text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (section_id) REFERENCES project_section(id)
);

CREATE TABLE project_summary (
    id text,
    project_id text,
    is_complete text,
    questions_assigned text,
    questions_complete text,
    questions_review text,
    questions_total text,
    questions_unassigned text,
    workdays_elapsed text,
    workdays_lefts text,
    workdays_total text,
    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);

CREATE TABLE project_entries_compliance_answer (
    id text,
    project_entries_id text,
    "option" text,
    PRIMARY KEY (id, project_entries_id),
    FOREIGN KEY (project_entries_id) REFERENCES project_entries(id)
);

CREATE TABLE project_entries (
    id text,
    project_id text,
    section_id text,
    sub_section_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (section_id) REFERENCES project_section(id),
    FOREIGN KEY (sub_section_id) REFERENCES project_subsection(id)
);

CREATE TABLE library_entries_question (
    id text,
    library_entries_id text,
    compliance_option_id text,
    compliance_option_text text,
    text text,
    PRIMARY KEY (id, library_entries_id),
    FOREIGN KEY (library_entries_id) REFERENCES library_entries(id),
    FOREIGN KEY (compliance_option_id) REFERENCES compliance_set_option("index")
);

CREATE TABLE library_entries_tag (
    "index" text,
    library_entries_id text,
    tags jsonb,
    PRIMARY KEY ("index", library_entries_id),
    FOREIGN KEY (library_entries_id) REFERENCES library_entries(id)
);

CREATE TABLE library_entries_answer_footnote (
    _fivetran_id text,
    library_entries_id text,
    answer_export_text text,
    answer_text text,
    footnote_id text,
    footnote_name text,
    footnote_text text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (library_entries_id) REFERENCES library_entries(id)
);

CREATE TABLE library_entries_inline_image (
    id text,
    library_entries_id text,
    url text,
    PRIMARY KEY (id, library_entries_id),
    FOREIGN KEY (library_entries_id) REFERENCES library_entries(id)
);

CREATE TABLE library_entries (
    id text,
    category_id text,
    creator_id text,
    last_reviewed_by_id text,
    last_updated_by_id text,
    library_entry_owner_id text,
    stack_id text,
    sub_category_id text,
    answer_text text,
    attachment_count text,
    category_name text,
    created_date text,
    creator_name text,
    language_code text,
    last_reviewed_by_name text,
    last_reviewed_date text,
    last_updated_by_name text,
    last_updated_date text,
    library_entry_owner_initials text,
    library_entry_owner_name text,
    location_stack_name text,
    location_stack_stack_id text,
    scores_freshness text,
    scores_time text,
    scores_usage text,
    "status" text,
    sub_category_name text,
    PRIMARY KEY (id),
    FOREIGN KEY (category_id) REFERENCES accessible_stack_categories(id),
    FOREIGN KEY (creator_id) REFERENCES users(id),
    FOREIGN KEY (last_reviewed_by_id) REFERENCES users(id),
    FOREIGN KEY (last_updated_by_id) REFERENCES users(id),
    FOREIGN KEY (library_entry_owner_id) REFERENCES users(id),
    FOREIGN KEY (stack_id) REFERENCES accessible_stack(id),
    FOREIGN KEY (sub_category_id) REFERENCES accessible_stack_sub_categories(id)
);

CREATE TABLE user_role (
    id text,
    "name" text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE users (
    id text,
    role_id text,
    email text,
    first_name text,
    guid text,
    last_name text,
    "status" text,
    PRIMARY KEY (id),
    FOREIGN KEY (role_id) REFERENCES user_role(id)
);

CREATE TABLE accessible_stack_sub_categories (
    id text,
    category_id text,
    stack_id text,
    "name" text,
    PRIMARY KEY (id, category_id),
    FOREIGN KEY (category_id) REFERENCES accessible_stack_categories(id),
    FOREIGN KEY (stack_id) REFERENCES accessible_stack(id)
);

CREATE TABLE accessible_stack_categories (
    id text,
    stack_id text,
    "name" text,
    PRIMARY KEY (id, stack_id),
    FOREIGN KEY (stack_id) REFERENCES accessible_stack(id)
);

CREATE TABLE accessible_stack (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE project_section (
    id text,
    project_id text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (project_id) REFERENCES project(id)
);
