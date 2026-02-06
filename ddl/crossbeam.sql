CREATE TABLE partner_tag (
    id text,
    organization_uuid text,
    partner_id text,
    label text,
    PRIMARY KEY (id, organization_uuid, partner_id),
    FOREIGN KEY (organization_uuid) REFERENCES partner(organization_uuid),
    FOREIGN KEY (partner_id) REFERENCES partner(id)
);

CREATE TABLE partner (
    id text,
    organization_uuid text,
    domain text,
    "name" text,
    PRIMARY KEY (id, organization_uuid)
);

CREATE TABLE population (
    id text,
    organization_uuid text,
    description text,
    "name" text,
    population_type text,
    standard_type text,
    PRIMARY KEY (id, organization_uuid)
);

CREATE TABLE partner_population (
    id text,
    organization_uuid text,
    description text,
    "name" text,
    population_type text,
    standard_type text,
    PRIMARY KEY (id, organization_uuid)
);

CREATE TABLE report_population (
    organization_uuid text,
    population_id text,
    report_id text,
    PRIMARY KEY (organization_uuid, population_id, report_id),
    FOREIGN KEY (organization_uuid) REFERENCES report(organization_uuid),
    FOREIGN KEY (population_id) REFERENCES population(id),
    FOREIGN KEY (report_id) REFERENCES report(id)
);

CREATE TABLE report_partner_population (
    organization_uuid text,
    partner_population_id text,
    report_id text,
    PRIMARY KEY (organization_uuid, partner_population_id, report_id),
    FOREIGN KEY (organization_uuid) REFERENCES report(organization_uuid),
    FOREIGN KEY (partner_population_id) REFERENCES partner_population(id),
    FOREIGN KEY (report_id) REFERENCES report(id)
);

CREATE TABLE report (
    id text,
    organization_uuid text,
    comparison_type text,
    folder_uuid text,
    "name" text,
    organization_id text,
    partner_impact_scores jsonb,
    partner_standard_population jsonb,
    report_type text,
    tag_id text,
    PRIMARY KEY (id, organization_uuid)
);

CREATE TABLE account_record_population (
    account_record_id text,
    crossbeam_record_id text,
    id text,
    organization_uuid text,
    "name" text,
    PRIMARY KEY (account_record_id, crossbeam_record_id, id, organization_uuid),
    FOREIGN KEY (account_record_id) REFERENCES account_record(record_id),
    FOREIGN KEY (crossbeam_record_id) REFERENCES account_record(crossbeam_record_id),
    FOREIGN KEY (id) REFERENCES population(id),
    FOREIGN KEY (organization_uuid) REFERENCES account_record(organization_uuid)
);

CREATE TABLE account_record (
    crossbeam_record_id text,
    organization_uuid text,
    record_id text,
    crossbeam_owner_id text,
    owner_email text,
    owner_name text,
    owner_phone text,
    record_name text,
    record_type text,
    record_website text,
    -- crm_* (dynamic column),
    PRIMARY KEY (crossbeam_record_id, organization_uuid, record_id)
);

CREATE TABLE overlap_lead_partner_source_data (
    "index" text,
    organization_uuid text,
    overlap_lead_crossbeam_record_id text,
    overlap_lead_partner_crossbeam_record_id text,
    field_name text,
    field_value text,
    PRIMARY KEY ("index", organization_uuid, overlap_lead_crossbeam_record_id, overlap_lead_partner_crossbeam_record_id),
    FOREIGN KEY (organization_uuid) REFERENCES overlap_lead(organization_uuid),
    FOREIGN KEY (overlap_lead_crossbeam_record_id) REFERENCES overlap_lead(crossbeam_record_id),
    FOREIGN KEY (overlap_lead_partner_crossbeam_record_id) REFERENCES overlap_lead(partner_crossbeam_record_id)
);

CREATE TABLE overlap_lead_partner_population (
    id text,
    organization_uuid text,
    overlap_lead_crossbeam_record_id text,
    overlap_lead_partner_crossbeam_record_id text,
    "name" text,
    PRIMARY KEY (id, organization_uuid, overlap_lead_crossbeam_record_id, overlap_lead_partner_crossbeam_record_id),
    FOREIGN KEY (id) REFERENCES partner_population(id),
    FOREIGN KEY (organization_uuid) REFERENCES overlap_lead(organization_uuid),
    FOREIGN KEY (overlap_lead_crossbeam_record_id) REFERENCES overlap_lead(crossbeam_record_id),
    FOREIGN KEY (overlap_lead_partner_crossbeam_record_id) REFERENCES overlap_lead(partner_crossbeam_record_id)
);

CREATE TABLE overlap_lead_population (
    id text,
    organization_uuid text,
    overlap_lead_crossbeam_record_id text,
    overlap_lead_partner_crossbeam_record_id text,
    "name" text,
    PRIMARY KEY (id, organization_uuid, overlap_lead_crossbeam_record_id, overlap_lead_partner_crossbeam_record_id),
    FOREIGN KEY (id) REFERENCES population(id),
    FOREIGN KEY (organization_uuid) REFERENCES overlap_lead(organization_uuid),
    FOREIGN KEY (overlap_lead_crossbeam_record_id) REFERENCES overlap_lead(crossbeam_record_id),
    FOREIGN KEY (overlap_lead_partner_crossbeam_record_id) REFERENCES overlap_lead(partner_crossbeam_record_id)
);

CREATE TABLE overlap_lead (
    crossbeam_record_id text,
    organization_uuid text,
    partner_crossbeam_record_id text,
    partner_id text,
    is_deleted text,
    partner_crossbeam_owner_id text,
    partner_logo_url text,
    partner_name text,
    partner_owner_email text,
    partner_owner_name text,
    partner_owner_phone text,
    partner_record_email text,
    partner_record_type text,
    record_email text,
    record_id text,
    record_name text,
    record_website text,
    PRIMARY KEY (crossbeam_record_id, organization_uuid, partner_crossbeam_record_id),
    FOREIGN KEY (partner_id) REFERENCES partner(id)
);

CREATE TABLE user_organization (
    organization_uuid text,
    user_id text,
    domain text,
    label text,
    logo_url text,
    "name" text,
    role_description text,
    role_name text,
    role_uuid text,
    sales_edge_role text,
    PRIMARY KEY (organization_uuid, user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    organization_uuid text,
    active text,
    email text,
    first_name text,
    last_name text,
    picture_url text,
    PRIMARY KEY (id, organization_uuid)
);

CREATE TABLE lead_record_population (
    crossbeam_record_id text,
    id text,
    lead_record_id text,
    organization_uuid text,
    "name" text,
    PRIMARY KEY (crossbeam_record_id, id, lead_record_id, organization_uuid),
    FOREIGN KEY (crossbeam_record_id) REFERENCES lead_record(crossbeam_record_id),
    FOREIGN KEY (id) REFERENCES population(id),
    FOREIGN KEY (lead_record_id) REFERENCES lead_record(record_id),
    FOREIGN KEY (organization_uuid) REFERENCES lead_record(organization_uuid)
);

CREATE TABLE lead_record (
    crossbeam_record_id text,
    organization_uuid text,
    record_id text,
    crossbeam_owner_id text,
    owner_email text,
    owner_name text,
    owner_phone text,
    record_name text,
    record_type text,
    record_website text,
    -- crm_* (dynamic column),
    PRIMARY KEY (crossbeam_record_id, organization_uuid, record_id)
);

CREATE TABLE overlap_account_partner_source_data (
    "index" text,
    organization_uuid text,
    overlap_account_crossbeam_record_id text,
    overlap_account_partner_crossbeam_record_id text,
    field_name text,
    field_value text,
    PRIMARY KEY ("index", organization_uuid, overlap_account_crossbeam_record_id, overlap_account_partner_crossbeam_record_id),
    FOREIGN KEY (organization_uuid) REFERENCES overlap_account(organization_uuid),
    FOREIGN KEY (overlap_account_crossbeam_record_id) REFERENCES overlap_account(crossbeam_record_id),
    FOREIGN KEY (overlap_account_partner_crossbeam_record_id) REFERENCES overlap_account(partner_crossbeam_record_id)
);

CREATE TABLE overlap_account_partner_population (
    id text,
    organization_uuid text,
    overlap_account_crossbeam_record_id text,
    overlap_account_partner_crossbeam_record_id text,
    "name" text,
    PRIMARY KEY (id, organization_uuid, overlap_account_crossbeam_record_id, overlap_account_partner_crossbeam_record_id),
    FOREIGN KEY (id) REFERENCES partner_population(id),
    FOREIGN KEY (organization_uuid) REFERENCES overlap_account(organization_uuid),
    FOREIGN KEY (overlap_account_crossbeam_record_id) REFERENCES overlap_account(crossbeam_record_id),
    FOREIGN KEY (overlap_account_partner_crossbeam_record_id) REFERENCES overlap_account(partner_crossbeam_record_id)
);

CREATE TABLE overlap_account_population (
    id text,
    organization_uuid text,
    overlap_account_crossbeam_record_id text,
    overlap_account_partner_crossbeam_record_id text,
    "name" text,
    PRIMARY KEY (id, organization_uuid, overlap_account_crossbeam_record_id, overlap_account_partner_crossbeam_record_id),
    FOREIGN KEY (id) REFERENCES population(id),
    FOREIGN KEY (organization_uuid) REFERENCES overlap_account(organization_uuid),
    FOREIGN KEY (overlap_account_crossbeam_record_id) REFERENCES overlap_account(crossbeam_record_id),
    FOREIGN KEY (overlap_account_partner_crossbeam_record_id) REFERENCES overlap_account(partner_crossbeam_record_id)
);

CREATE TABLE overlap_account (
    crossbeam_record_id text,
    organization_uuid text,
    partner_crossbeam_record_id text,
    partner_id text,
    is_deleted text,
    partner_crossbeam_owner_id text,
    partner_logo_url text,
    partner_name text,
    partner_owner_email text,
    partner_owner_name text,
    partner_owner_phone text,
    partner_record_id text,
    partner_record_name text,
    partner_record_type text,
    partner_record_website text,
    record_email text,
    record_id text,
    record_name text,
    record_type text,
    record_website text,
    PRIMARY KEY (crossbeam_record_id, organization_uuid, partner_crossbeam_record_id),
    FOREIGN KEY (partner_id) REFERENCES partner(id)
);
