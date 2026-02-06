CREATE TABLE location_type (
    "type" text,
    location_id text,
    PRIMARY KEY ("type", location_id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE location_relationship (
    location_id text,
    related_location_id text,
    reason text,
    related_location_name text,
    "type" text,
    PRIMARY KEY (location_id, related_location_id),
    FOREIGN KEY (location_id) REFERENCES location(id),
    FOREIGN KEY (related_location_id) REFERENCES location(id)
);

CREATE TABLE location_regulated_activity_contact (
    "index" text,
    location_id text,
    location_regulated_activity_code text,
    person_family_name text,
    person_given_name text,
    person_roles jsonb,
    person_title text,
    PRIMARY KEY ("index", location_id, location_regulated_activity_code),
    FOREIGN KEY (location_id) REFERENCES location_regulated_activity(location_id),
    FOREIGN KEY (location_regulated_activity_code) REFERENCES location_regulated_activity(code)
);

CREATE TABLE location_regulated_activity (
    code text,
    location_id text,
    "name" text,
    PRIMARY KEY (code, location_id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE location_gac_service_type (
    "index" text,
    location_id text,
    description text,
    "name" text,
    PRIMARY KEY ("index", location_id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE location_inspection_category (
    code text,
    location_id text,
    is_primary text,
    "name" text,
    PRIMARY KEY (code, location_id),
    FOREIGN KEY (code) REFERENCES inspection_category(code),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE location_specialism (
    "name" text,
    location_id text,
    PRIMARY KEY ("name", location_id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE location_inspection_area (
    id text,
    location_id text,
    PRIMARY KEY (id, location_id),
    FOREIGN KEY (id) REFERENCES inspection_area(id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE location_current_overall_key_question_rating (
    "name" text,
    location_id text,
    report_link_id text,
    organisation_id text,
    rating text,
    report_date text,
    PRIMARY KEY ("name", location_id),
    FOREIGN KEY (location_id) REFERENCES location(id),
    FOREIGN KEY (report_link_id) REFERENCES location_report(link_id)
);

CREATE TABLE location_current_service_key_question_rating (
    "name" text,
    location_current_service_rating_name text,
    location_id text,
    rating text,
    PRIMARY KEY ("name", location_current_service_rating_name, location_id),
    FOREIGN KEY (location_current_service_rating_name) REFERENCES location_current_service_rating("name"),
    FOREIGN KEY (location_id) REFERENCES location_current_service_rating(location_id)
);

CREATE TABLE location_current_service_rating (
    location_id text,
    "name" text,
    report_link_id text,
    organisation_id text,
    rating text,
    report_date text,
    PRIMARY KEY (location_id, "name"),
    FOREIGN KEY (location_id) REFERENCES location(id),
    FOREIGN KEY ("name") REFERENCES location_inspection_area(id),
    FOREIGN KEY (report_link_id) REFERENCES location_report(link_id)
);

CREATE TABLE location_historic_overall_key_question_rating (
    "name" text,
    location_historic_rating_index text,
    location_id text,
    rating text,
    PRIMARY KEY ("name", location_historic_rating_index, location_id),
    FOREIGN KEY (location_historic_rating_index) REFERENCES location_historic_rating("index"),
    FOREIGN KEY (location_id) REFERENCES location_historic_rating(location_id)
);

CREATE TABLE location_historic_service_key_question_rating (
    "name" text,
    location_historic_service_rating_index text,
    location_historic_service_rating_name text,
    location_id text,
    rating text,
    PRIMARY KEY ("name", location_historic_service_rating_index, location_historic_service_rating_name, location_id),
    FOREIGN KEY (location_historic_service_rating_index) REFERENCES location_historic_service_rating(location_historic_rating_index),
    FOREIGN KEY (location_historic_service_rating_name) REFERENCES location_historic_service_rating("name"),
    FOREIGN KEY (location_id) REFERENCES location_historic_service_rating(location_id)
);

CREATE TABLE location_historic_service_rating (
    "name" text,
    location_historic_rating_index text,
    location_id text,
    rating text,
    PRIMARY KEY ("name", location_historic_rating_index, location_id),
    FOREIGN KEY (location_historic_rating_index) REFERENCES location_historic_rating("index"),
    FOREIGN KEY (location_id) REFERENCES location_historic_rating(location_id)
);

CREATE TABLE location_historic_rating (
    "index" text,
    location_id text,
    report_link_id text,
    organisation_id text,
    overall_combined_quality_rating text,
    overall_combined_quality_summary text,
    overall_rating text,
    overall_use_of_resources_rating text,
    overall_use_of_resources_summary text,
    report_date text,
    PRIMARY KEY ("index", location_id),
    FOREIGN KEY (location_id) REFERENCES location(id),
    FOREIGN KEY (report_link_id) REFERENCES location_report(link_id)
);

CREATE TABLE location_report_related_document (
    "index" text,
    location_id text,
    location_report_link_id text,
    document_type text,
    document_uri text,
    PRIMARY KEY ("index", location_id, location_report_link_id),
    FOREIGN KEY (location_id) REFERENCES location_report(location_id),
    FOREIGN KEY (location_report_link_id) REFERENCES location_report(link_id)
);

CREATE TABLE location_report (
    link_id text,
    location_id text,
    first_visit_date text,
    report_date text,
    report_type text,
    report_uri text,
    PRIMARY KEY (link_id, location_id),
    FOREIGN KEY (location_id) REFERENCES location(id)
);

CREATE TABLE location (
    id text,
    brand_id text,
    brand_name text,
    care_home text,
    constituency text,
    current_overall_combined_quality_rating text,
    current_overall_combined_quality_summary text,
    current_overall_rating text,
    current_overall_report_date text,
    current_overall_report_link_id text,
    current_overall_use_of_resources_rating text,
    current_overall_use_of_resources_summary text,
    dormancy text,
    inspection_directorate text,
    last_inspection_date text,
    last_report_publication_date text,
    local_authority text,
    main_phone_number text,
    "name" text,
    number_of_beds text,
    ods_ccg_code text,
    ods_ccg_name text,
    ods_code text,
    onspd_ccg_code text,
    onspd_ccg_name text,
    onspd_icb_code text,
    onspd_icb_name text,
    onspd_latitude text,
    onspd_longitude text,
    organisation_type text,
    postal_address_line_1 text,
    postal_address_town_city text,
    postal_code text,
    provider_id text,
    region text,
    registered_manager_absent_date text,
    registration_date text,
    registration_status text,
    "type" text,
    uprn text,
    PRIMARY KEY (id)
);

CREATE TABLE inspection_category (
    code text,
    inspection_area_id text,
    core_flag text,
    end_date text,
    "name" text,
    org_inspection_area_retirement_date text,
    "status" text,
    PRIMARY KEY (code, inspection_area_id),
    FOREIGN KEY (inspection_area_id) REFERENCES inspection_area(id)
);

CREATE TABLE inspection_area (
    id text,
    end_date text,
    "name" text,
    "status" text,
    superseded_by jsonb,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE provider_contact (
    "index" text,
    provider_id text,
    person_family_name text,
    person_given_name text,
    person_roles jsonb,
    person_title text,
    PRIMARY KEY ("index", provider_id),
    FOREIGN KEY (provider_id) REFERENCES provider(id)
);

CREATE TABLE provider_location (
    location_id text,
    provider_id text,
    PRIMARY KEY (location_id, provider_id),
    FOREIGN KEY (location_id) REFERENCES location(id),
    FOREIGN KEY (provider_id) REFERENCES provider(id)
);

CREATE TABLE provider_relationship (
    provider_id text,
    related_provider_id text,
    reason text,
    related_provider_name text,
    "type" text,
    PRIMARY KEY (provider_id, related_provider_id),
    FOREIGN KEY (provider_id) REFERENCES provider(id),
    FOREIGN KEY (related_provider_id) REFERENCES provider(id)
);

CREATE TABLE provider_regulated_activity (
    code text,
    provider_id text,
    "name" text,
    nominated_individual_person_family_name text,
    nominated_individual_person_given_name text,
    nominated_individual_person_title text,
    PRIMARY KEY (code, provider_id),
    FOREIGN KEY (provider_id) REFERENCES provider(id)
);

CREATE TABLE provider_inspection_area (
    id text,
    provider_id text,
    PRIMARY KEY (id, provider_id),
    FOREIGN KEY (id) REFERENCES inspection_area(id),
    FOREIGN KEY (provider_id) REFERENCES provider(id)
);

CREATE TABLE provider_inspection_category (
    code text,
    provider_id text,
    is_primary text,
    "name" text,
    PRIMARY KEY (code, provider_id),
    FOREIGN KEY (code) REFERENCES inspection_category(code),
    FOREIGN KEY (provider_id) REFERENCES provider(id)
);

CREATE TABLE provider_historic_service_key_question_rating (
    "name" text,
    provider_historic_service_rating_index text,
    provider_historic_service_rating_name text,
    provider_id text,
    rating text,
    PRIMARY KEY ("name", provider_historic_service_rating_index, provider_historic_service_rating_name, provider_id),
    FOREIGN KEY (provider_historic_service_rating_index) REFERENCES provider_historic_service_rating(provider_historic_rating_index),
    FOREIGN KEY (provider_historic_service_rating_name) REFERENCES provider_historic_service_rating("name"),
    FOREIGN KEY (provider_id) REFERENCES provider_historic_service_rating(provider_id)
);

CREATE TABLE provider_historic_service_rating (
    "name" text,
    provider_historic_rating_index text,
    provider_id text,
    rating text,
    PRIMARY KEY ("name", provider_historic_rating_index, provider_id),
    FOREIGN KEY (provider_historic_rating_index) REFERENCES provider_historic_rating("index"),
    FOREIGN KEY (provider_id) REFERENCES provider_historic_rating(provider_id)
);

CREATE TABLE provider_historic_overall_key_question_rating (
    "name" text,
    provider_historic_rating_index text,
    provider_id text,
    rating text,
    PRIMARY KEY ("name", provider_historic_rating_index, provider_id),
    FOREIGN KEY (provider_historic_rating_index) REFERENCES provider_historic_rating("index"),
    FOREIGN KEY (provider_id) REFERENCES provider_historic_rating(provider_id)
);

CREATE TABLE provider_historic_rating (
    "index" text,
    provider_id text,
    report_link_id text,
    organisation_id text,
    overall_combined_quality_rating text,
    overall_combined_quality_summary text,
    overall_rating text,
    overall_use_of_resources_rating text,
    overall_use_of_resources_summary text,
    report_date text,
    PRIMARY KEY ("index", provider_id),
    FOREIGN KEY (provider_id) REFERENCES provider(id),
    FOREIGN KEY (report_link_id) REFERENCES provider_report(link_id)
);

CREATE TABLE provider_report_related_document (
    "index" text,
    provider_id text,
    provider_report_link_id text,
    document_type text,
    document_uri text,
    PRIMARY KEY ("index", provider_id, provider_report_link_id),
    FOREIGN KEY (provider_id) REFERENCES provider_report(provider_id),
    FOREIGN KEY (provider_report_link_id) REFERENCES provider_report(link_id)
);

CREATE TABLE provider_report (
    link_id text,
    provider_id text,
    report_date text,
    report_type text,
    report_uri text,
    PRIMARY KEY (link_id, provider_id),
    FOREIGN KEY (provider_id) REFERENCES provider(id)
);

CREATE TABLE provider_current_overall_key_question_rating (
    "name" text,
    provider_id text,
    report_link_id text,
    rating text,
    report_date text,
    PRIMARY KEY ("name", provider_id),
    FOREIGN KEY (provider_id) REFERENCES provider(id),
    FOREIGN KEY (report_link_id) REFERENCES provider_report(link_id)
);

CREATE TABLE provider_current_service_key_question_rating (
    "name" text,
    provider_current_service_rating_name text,
    provider_id text,
    rating text,
    PRIMARY KEY ("name", provider_current_service_rating_name, provider_id),
    FOREIGN KEY (provider_current_service_rating_name) REFERENCES provider_current_service_rating("name"),
    FOREIGN KEY (provider_id) REFERENCES provider_current_service_rating(provider_id)
);

CREATE TABLE provider_current_service_rating (
    "name" text,
    provider_id text,
    report_link_id text,
    organisation_id text,
    rating text,
    report_date text,
    PRIMARY KEY ("name", provider_id),
    FOREIGN KEY ("name") REFERENCES provider_inspection_area(id),
    FOREIGN KEY (provider_id) REFERENCES provider(id),
    FOREIGN KEY (report_link_id) REFERENCES provider_report(link_id)
);

CREATE TABLE provider (
    id text,
    brand_id text,
    brand_name text,
    charity_number text,
    companies_house_number text,
    constituency text,
    current_overall_combined_quality_rating text,
    current_overall_combined_quality_summary text,
    current_overall_rating text,
    current_overall_report_date text,
    current_overall_report_link_id text,
    current_overall_use_of_resources_rating text,
    current_overall_use_of_resources_summary text,
    inspection_directorate text,
    last_inspection_date text,
    last_report_publication_date text,
    local_authority text,
    main_phone_number text,
    "name" text,
    ods_code text,
    onspd_icb_code text,
    onspd_icb_name text,
    onspd_latitude text,
    onspd_longitude text,
    organisation_type text,
    ownership_type text,
    postal_address_county text,
    postal_address_line_1 text,
    postal_address_line_2 text,
    postal_address_town_city text,
    postal_code text,
    region text,
    registration_date text,
    registration_status text,
    "type" text,
    uprn text,
    website text,
    PRIMARY KEY (id)
);
