CREATE TABLE person_team (
    id text,
    person_id text,
    "name" text,
    "type" text,
    PRIMARY KEY (id, person_id),
    FOREIGN KEY (person_id) REFERENCES person(id)
);

CREATE TABLE person_location (
    id text,
    person_id text,
    "name" text,
    "type" text,
    PRIMARY KEY (id, person_id),
    FOREIGN KEY (person_id) REFERENCES person(id)
);

CREATE TABLE person (
    id text,
    organization_id text,
    department_id text,
    department_name text,
    department_type text,
    first_name text,
    job_id text,
    last_name text,
    manager_id text,
    PRIMARY KEY (id, organization_id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE organization_onboard_step (
    "index" text,
    organization_id text,
    "name" text,
    "status" text,
    PRIMARY KEY ("index", organization_id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE organization (
    id text,
    active_at text,
    active_user_count text,
    adp_organization_o_i_d text,
    app_time text,
    approx_geo_coordinates jsonb,
    approx_geo_type text,
    assessment_count text,
    city text,
    cordinate jsonb,
    country text,
    create_at text,
    create_id text,
    customer_id text,
    dashboard_getting_started_hidden text,
    dashboard_need_help_hidden text,
    destroy_at text,
    destroy_id text,
    destroyed_at text,
    disable_import_events text,
    domain jsonb,
    email text,
    enable_universal_sso text,
    est_employees text,
    est_revenue text,
    extra_fields jsonb,
    file_upload_limit text,
    fiscal_start text,
    founded_year text,
    geo_coordinates jsonb,
    geo_type text,
    head_count text,
    head_job_id text,
    image_path text,
    industry text,
    is_initial_data_synced text,
    low_priority_reports text,
    max_file_upload_size text,
    "name" text,
    onboarding text,
    phone text,
    postal text,
    self_serve_importing text,
    sequoia_org_id text,
    slug text,
    start_date text,
    "state" text,
    stock text,
    street_1 text,
    street_2 text,
    street_3 text,
    time_zone text,
    tos_agreement text,
    "type" text,
    update_at text,
    update_id text,
    url text,
    user_count text,
    "zone" text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id)
);

CREATE TABLE job_location (
    id text,
    job_id text,
    PRIMARY KEY (id, job_id),
    FOREIGN KEY (id) REFERENCES person_location(id),
    FOREIGN KEY (job_id) REFERENCES job(id)
);

CREATE TABLE job (
    id text,
    organization_id text,
    person_id text,
    department_id text,
    title text,
    PRIMARY KEY (id, organization_id),
    FOREIGN KEY (organization_id) REFERENCES organization(id),
    FOREIGN KEY (person_id) REFERENCES person(id)
);

CREATE TABLE export_roster (
    _fivetran_id text,
    organization_id text,
    comp_base text,
    comp_currency text,
    comp_equity text,
    comp_variable text,
    employment_status text,
    first_name text,
    group_band text,
    group_department text,
    group_location text,
    group_team text,
    indirect_manager text,
    last_name text,
    manager text,
    middle_name text,
    person_birth_date text,
    person_ethnicity text,
    person_gender text,
    preferred_first_name text,
    start_date text,
    title text,
    PRIMARY KEY (_fivetran_id, organization_id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);
