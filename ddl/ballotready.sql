CREATE TABLE measure_endorsement (
    id text,
    measure_id text,
    organization_id text,
    created_at text,
    endorser text,
    recommendation text,
    updated_at text,
    PRIMARY KEY (id, measure_id),
    FOREIGN KEY (measure_id) REFERENCES measure(id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE measure_argument (
    id text,
    measure_id text,
    pro_con text,
    source_url text,
    text text,
    PRIMARY KEY (id, measure_id),
    FOREIGN KEY (measure_id) REFERENCES measure(id)
);

CREATE TABLE measure (
    id text,
    party_id text,
    election_id text,
    issue_id text,
    mtfcc text,
    con_snippet text,
    created_at text,
    has_unknown_boundaries text,
    "name" text,
    party_created_at text,
    party_name text,
    party_short_name text,
    party_updated_at text,
    pro_snippet text,
    "state" text,
    summary text,
    text text,
    title text,
    updated_at timestamp,
    PRIMARY KEY (id, party_id),
    FOREIGN KEY (election_id) REFERENCES election(id),
    FOREIGN KEY (issue_id) REFERENCES issue(id),
    FOREIGN KEY (mtfcc) REFERENCES mtfcc(mtfcc)
);

CREATE TABLE organization_url (
    url text,
    organization_id text,
    "type" text,
    PRIMARY KEY (url, organization_id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE organization (
    id text,
    issue_id text,
    created_at text,
    description text,
    "name" text,
    "state" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (issue_id) REFERENCES issue(id)
);

CREATE TABLE position_election_frequency (
    id text,
    position_id text,
    frequency text,
    reference_year text,
    seats text,
    valid_from text,
    valid_to text,
    PRIMARY KEY (id),
    FOREIGN KEY (position_id) REFERENCES "position"(id)
);

CREATE TABLE position_issue (
    issue_id text,
    position_id text,
    PRIMARY KEY (issue_id, position_id),
    FOREIGN KEY (issue_id) REFERENCES issue(id),
    FOREIGN KEY (position_id) REFERENCES "position"(id)
);

CREATE TABLE "position" (
    id text,
    issue_id text,
    mtfcc text,
    normalized_position_mtfcc text,
    appointed text,
    created_at text,
    description text,
    eligibility_requirements text,
    employment_type text,
    filing_address text,
    filing_phone text,
    filing_requirements text,
    has_primary text,
    has_ranked_choice_general text,
    has_ranked_choice_primary text,
    has_unknown_boundaries text,
    judicial text,
    "level" text,
    maximum_filing_fee text,
    minimum_age text,
    must_be_registered_voter text,
    must_be_resident text,
    must_have_professional_experience text,
    "name" text,
    normalized_position_id text,
    normalized_position_name text,
    paperwork_instructions text,
    partisan_type text,
    ranked_choice_max_votes_general text,
    ranked_choice_max_votes_primary text,
    retention text,
    row_order text,
    running_mate_style text,
    salary text,
    seats text,
    selections_allowed text,
    "state" text,
    sub_area_name text,
    sub_area_value text,
    tier text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (issue_id) REFERENCES issue(id),
    FOREIGN KEY (mtfcc) REFERENCES mtfcc(mtfcc),
    FOREIGN KEY (normalized_position_mtfcc) REFERENCES mtfcc(mtfcc)
);

CREATE TABLE issue (
    id text,
    "name" text,
    plugin_enabled text,
    response_type text,
    row_order text,
    PRIMARY KEY (id)
);

CREATE TABLE place_address (
    id text,
    place_id text,
    address_line_1 text,
    address_line_2 text,
    city text,
    country text,
    created_at text,
    "state" text,
    "type" text,
    updated_at text,
    zip text,
    PRIMARY KEY (id, place_id),
    FOREIGN KEY (place_id) REFERENCES place(id)
);

CREATE TABLE place_url (
    url text,
    place_id text,
    "type" text,
    PRIMARY KEY (url, place_id),
    FOREIGN KEY (place_id) REFERENCES place(id)
);

CREATE TABLE place_contact (
    "index" text,
    place_id text,
    email text,
    fax text,
    phone text,
    "type" text,
    PRIMARY KEY ("index", place_id),
    FOREIGN KEY (place_id) REFERENCES place(id)
);

CREATE TABLE place_registration_option_document (
    document text,
    place_id text,
    place_registration_option_id text,
    PRIMARY KEY (document, place_id, place_registration_option_id),
    FOREIGN KEY (place_id) REFERENCES place_registration_option(place_id),
    FOREIGN KEY (place_registration_option_id) REFERENCES place_registration_option(id)
);

CREATE TABLE place_registration_option_eligibility (
    eligibility text,
    place_id text,
    place_registration_option_id text,
    PRIMARY KEY (eligibility, place_id, place_registration_option_id),
    FOREIGN KEY (place_id) REFERENCES place_registration_option(place_id),
    FOREIGN KEY (place_registration_option_id) REFERENCES place_registration_option(id)
);

CREATE TABLE place_registration_option_feature (
    feature text,
    place_id text,
    place_registration_option_id text,
    PRIMARY KEY (feature, place_id, place_registration_option_id),
    FOREIGN KEY (place_id) REFERENCES place_registration_option(place_id),
    FOREIGN KEY (place_registration_option_id) REFERENCES place_registration_option(id)
);

CREATE TABLE place_registration_option (
    id text,
    place_id text,
    available_if_date_of_birth_before_or_equals text,
    channel text,
    created_at text,
    documents text,
    eligibility text,
    features text,
    is_id_required text,
    is_preregistration text,
    safest_registration_dead_line_in_days text,
    updated_at text,
    PRIMARY KEY (id, place_id),
    FOREIGN KEY (place_id) REFERENCES place(id)
);

CREATE TABLE place_form_field (
    _fivetran_id text,
    place_form_id text,
    place_id text,
    is_required text,
    label text,
    "name" text,
    options text,
    "type" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (place_form_id) REFERENCES place_form(id),
    FOREIGN KEY (place_id) REFERENCES place_form(place_id)
);

CREATE TABLE place_form (
    id text,
    place_id text,
    locale text,
    "type" text,
    url text,
    PRIMARY KEY (id, place_id),
    FOREIGN KEY (place_id) REFERENCES place(id)
);

CREATE TABLE place (
    id text,
    mtfcc text,
    can_vote_in_primary_when_18_by_general text,
    created_at text,
    dissolved text,
    has_vote_by_mail text,
    is_printing_enabled text,
    is_receiver_of_vote_by_mail_requests text,
    "name" text,
    primary_type text,
    "state" text,
    timezone text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (mtfcc) REFERENCES mtfcc(mtfcc)
);

CREATE TABLE office_holder_party (
    id text,
    office_holder_id text,
    created_at text,
    "name" text,
    short_name text,
    updated_at text,
    PRIMARY KEY (id, office_holder_id),
    FOREIGN KEY (office_holder_id) REFERENCES office_holder(id)
);

CREATE TABLE office_holder_url (
    url text,
    office_holder_id text,
    "type" text,
    PRIMARY KEY (url, office_holder_id),
    FOREIGN KEY (office_holder_id) REFERENCES office_holder(id)
);

CREATE TABLE office_holder_address (
    id text,
    office_holder_id text,
    address_line_1 text,
    address_line_2 text,
    city text,
    country text,
    created_at text,
    "state" text,
    "type" text,
    updated_at text,
    zip text,
    PRIMARY KEY (id, office_holder_id),
    FOREIGN KEY (office_holder_id) REFERENCES office_holder(id)
);

CREATE TABLE office_holder_contact (
    "index" text,
    office_holder_id text,
    email text,
    fax text,
    phone text,
    "type" text,
    PRIMARY KEY ("index", office_holder_id),
    FOREIGN KEY (office_holder_id) REFERENCES office_holder(id)
);

CREATE TABLE office_holder (
    id text,
    people_id text,
    position_id text,
    central_phone text,
    end_at text,
    is_appointed text,
    is_current text,
    is_off_cycle text,
    is_vacant text,
    office_phone text,
    office_title text,
    other_phone text,
    primary_email text,
    specificity text,
    start_at text,
    total_years_in_office text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (people_id) REFERENCES people(id),
    FOREIGN KEY (position_id) REFERENCES "position"(id)
);

CREATE TABLE race_filing_period (
    id text,
    race_id text,
    end_on text,
    notes text,
    start_on text,
    "type" text,
    PRIMARY KEY (id, race_id),
    FOREIGN KEY (race_id) REFERENCES race(id)
);

CREATE TABLE race_candidacy_stance (
    id text,
    race_candidacy_id text,
    race_id text,
    issue_id text,
    locale text,
    reference_url text,
    statement text,
    PRIMARY KEY (id, race_candidacy_id, race_id),
    FOREIGN KEY (race_candidacy_id) REFERENCES race_candidacy(id),
    FOREIGN KEY (race_id) REFERENCES race_candidacy(race_id),
    FOREIGN KEY (issue_id) REFERENCES issue(id)
);

CREATE TABLE race_candidacy_party (
    id text,
    race_candidacy_id text,
    race_id text,
    created_at text,
    "name" text,
    short_name text,
    updated_at text,
    PRIMARY KEY (id, race_candidacy_id, race_id),
    FOREIGN KEY (race_candidacy_id) REFERENCES race_candidacy(id),
    FOREIGN KEY (race_id) REFERENCES race_candidacy(race_id)
);

CREATE TABLE race_candidacy_endorsement (
    id text,
    race_candidacy_id text,
    race_id text,
    organization_id text,
    created_at text,
    endorser text,
    recommendation text,
    updated_at text,
    PRIMARY KEY (id, race_candidacy_id, race_id),
    FOREIGN KEY (race_candidacy_id) REFERENCES race_candidacy(id),
    FOREIGN KEY (race_id) REFERENCES race_candidacy(race_id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE race_candidacy (
    id text,
    race_id text,
    candidate_id text,
    election_id text,
    position_id text,
    created_at text,
    is_certified text,
    is_hidden text,
    uncertified text,
    updated_at text,
    withdrawn text,
    PRIMARY KEY (id, race_id),
    FOREIGN KEY (race_id) REFERENCES race(id),
    FOREIGN KEY (candidate_id) REFERENCES race_candidacy(id),
    FOREIGN KEY (election_id) REFERENCES election(id),
    FOREIGN KEY (position_id) REFERENCES "position"(id)
);

CREATE TABLE race (
    id text,
    election_id text,
    position_id text,
    created_at text,
    is_disabled text,
    is_partisan text,
    is_primary text,
    is_recall text,
    is_runoff text,
    is_unexpired text,
    seats text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (election_id) REFERENCES election(id),
    FOREIGN KEY (position_id) REFERENCES "position"(id)
);

CREATE TABLE vip_election_party (
    id text,
    election_id text,
    vip_election_id text,
    created_at text,
    "name" text,
    short_name text,
    updated_at text,
    PRIMARY KEY (id, election_id, vip_election_id),
    FOREIGN KEY (election_id) REFERENCES vip_election(election_id),
    FOREIGN KEY (vip_election_id) REFERENCES vip_election(id)
);

CREATE TABLE vip_election (
    id text,
    election_id text,
    PRIMARY KEY (id, election_id),
    FOREIGN KEY (election_id) REFERENCES election(id)
);

CREATE TABLE election (
    id text,
    created_at text,
    election_day text,
    "name" text,
    original_election_date text,
    "state" text,
    timezone text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE people_url (
    url text,
    people_id text,
    "type" text,
    PRIMARY KEY (url, people_id),
    FOREIGN KEY (people_id) REFERENCES people(id)
);

CREATE TABLE people_image (
    url text,
    people_id text,
    "type" text,
    PRIMARY KEY (url, people_id),
    FOREIGN KEY (people_id) REFERENCES people(id)
);

CREATE TABLE people_experience (
    id text,
    people_id text,
    end_time text,
    organization text,
    start_time text,
    title text,
    "type" text,
    PRIMARY KEY (id, people_id),
    FOREIGN KEY (people_id) REFERENCES people(id)
);

CREATE TABLE people_degree (
    id text,
    people_id text,
    degree text,
    graduation_year text,
    major text,
    school text,
    PRIMARY KEY (id, people_id),
    FOREIGN KEY (people_id) REFERENCES people(id)
);

CREATE TABLE people_candidacy_stance (
    id text,
    people_candidacy_id text,
    people_id text,
    issue_id text,
    locale text,
    reference_url text,
    statement text,
    PRIMARY KEY (id, people_candidacy_id, people_id),
    FOREIGN KEY (people_candidacy_id) REFERENCES people_candidacy(id),
    FOREIGN KEY (people_id) REFERENCES people_candidacy(people_id),
    FOREIGN KEY (issue_id) REFERENCES issue(id)
);

CREATE TABLE people_candidacy_party (
    id text,
    people_candidacy_id text,
    people_id text,
    created_at text,
    "name" text,
    short_name text,
    updated_at text,
    PRIMARY KEY (id, people_candidacy_id, people_id),
    FOREIGN KEY (people_candidacy_id) REFERENCES people_candidacy(id),
    FOREIGN KEY (people_id) REFERENCES people_candidacy(people_id)
);

CREATE TABLE people_candidacy_endorsement (
    id text,
    people_candidacy_id text,
    people_id text,
    organization_id text,
    created_at text,
    endorser text,
    recommendation text,
    updated_at text,
    PRIMARY KEY (id, people_candidacy_id, people_id),
    FOREIGN KEY (people_candidacy_id) REFERENCES people_candidacy(id),
    FOREIGN KEY (people_id) REFERENCES people_candidacy(people_id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE people_candidacy (
    id text,
    people_id text,
    candidate_id text,
    election_id text,
    position_id text,
    created_at text,
    is_certified text,
    is_hidden text,
    uncertified text,
    updated_at text,
    withdrawn text,
    PRIMARY KEY (id, people_id),
    FOREIGN KEY (people_id) REFERENCES people(id),
    FOREIGN KEY (candidate_id) REFERENCES people_candidacy(id),
    FOREIGN KEY (election_id) REFERENCES election(id),
    FOREIGN KEY (position_id) REFERENCES "position"(id)
);

CREATE TABLE people (
    id text,
    created_at text,
    first_name text,
    full_name text,
    headshot_default_url text,
    headshot_thumbnail_url text,
    last_name text,
    middle_name text,
    nick_name text,
    suffix text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE mtfcc (
    id text,
    created_at text,
    mtfcc text,
    "name" text,
    updated_at text,
    PRIMARY KEY (id)
);
