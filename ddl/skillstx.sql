CREATE TABLE account_lor (
    "index" text,
    account_id text,
    lor text,
    PRIMARY KEY ("index", account_id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE account_skill_level (
    "index" text,
    account_id text,
    account_skill_index text,
    "level" text,
    "value" text,
    PRIMARY KEY ("index", account_id, account_skill_index),
    FOREIGN KEY (account_id) REFERENCES account_skill(account_id),
    FOREIGN KEY (account_skill_index) REFERENCES account_skill("index")
);

CREATE TABLE account_skill (
    "index" text,
    account_id text,
    attributes jsonb,
    skill_code text,
    PRIMARY KEY ("index", account_id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

CREATE TABLE account (
    id text,
    active text,
    answered_questions text,
    email text,
    endorsed_by text,
    endorsement_last_approved_by text,
    endorsement_last_approved_on text,
    endorsement_last_approved_version text,
    endorsement_last_reviewed_by text,
    endorsement_last_reviewed_on text,
    endorsement_last_reviewed_version text,
    endorsement_last_updated_by text,
    endorsement_last_updated_on text,
    endorsement_last_updated_version text,
    endorsement_status text,
    first_name text,
    fluency_rating text,
    invitation_email_sent text,
    invited_on text,
    is_assigned text,
    is_invited text,
    last_name text,
    percentage text,
    preferred_name text,
    reference text,
    "status" text,
    total_questions text,
    total_time_taken text,
    PRIMARY KEY (id)
);

CREATE TABLE evidence_skill_level (
    "index" text,
    evidence_id text,
    skill_level text,
    PRIMARY KEY ("index", evidence_id),
    FOREIGN KEY (evidence_id) REFERENCES evidence(id)
);

CREATE TABLE evidence_lor_level (
    "index" text,
    evidence_id text,
    lor_level text,
    PRIMARY KEY ("index", evidence_id),
    FOREIGN KEY (evidence_id) REFERENCES evidence(id)
);

CREATE TABLE evidence (
    id text,
    account_share_key text,
    account_email text,
    account_reference text,
    created_on text,
    evidence_type text,
    expiry_on text,
    file_data text,
    file_name text,
    label text,
    link text,
    PRIMARY KEY (id),
    FOREIGN KEY (account_share_key) REFERENCES account(id)
);
