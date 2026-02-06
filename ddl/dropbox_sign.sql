CREATE TABLE template_document_field (
    id text,
    template_id text,
    template_document_id text,
    avg_text_length_num_chars_per_line bigint,
    avg_text_length_num_lines bigint,
    field_group text,
    field_kind text,
    font_family text,
    height bigint,
    is_multiline boolean,
    "name" text,
    original_font_size bigint,
    required boolean,
    signer text,
    "type" text,
    validation_type text,
    width bigint,
    x bigint,
    y bigint,
    PRIMARY KEY (id, template_id, template_document_id),
    FOREIGN KEY (template_document_id) REFERENCES template_document(id)
);

CREATE TABLE template_signer_role (
    id text,
    template_id text,
    signer_order bigint,
    PRIMARY KEY (id, template_id),
    FOREIGN KEY (template_id) REFERENCES template(id)
);

CREATE TABLE template_document (
    id text,
    template_id text,
    PRIMARY KEY (id, template_id),
    FOREIGN KEY (template_id) REFERENCES template(id)
);

CREATE TABLE template_document_field_group (
    id text,
    template_id text,
    template_document_id text,
    rule_group_label text,
    rule_requirement text,
    PRIMARY KEY (id, template_id, template_document_id),
    FOREIGN KEY (template_document_id) REFERENCES template_document(id)
);

CREATE TABLE template (
    id text,
    can_edit text,
    is_creator text,
    is_embedded text,
    is_locked text,
    message text,
    metadata text,
    title text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE template_account (
    account_id text,
    template_id text,
    PRIMARY KEY (account_id, template_id),
    FOREIGN KEY (template_id) REFERENCES template(id)
);

CREATE TABLE template_cc_role (
    id text,
    template_id text,
    PRIMARY KEY (id, template_id),
    FOREIGN KEY (template_id) REFERENCES template(id)
);

CREATE TABLE signature_request_template (
    template_id text,
    _fivetran_id text,
    PRIMARY KEY (template_id, _fivetran_id),
    FOREIGN KEY (_fivetran_id) REFERENCES signature_request(_fivetran_id)
);

CREATE TABLE signature_request_custom_field (
    "index" text,
    _fivetran_id text,
    api_id text,
    editor text,
    "name" text,
    required boolean,
    "type" text,
    "value" text,
    PRIMARY KEY ("index", _fivetran_id),
    FOREIGN KEY (_fivetran_id) REFERENCES signature_request(_fivetran_id)
);

CREATE TABLE signature_request_attachment (
    id text,
    _fivetran_id text,
    instructions text,
    "name" text,
    required boolean,
    signer text,
    uploaded_at timestamp,
    PRIMARY KEY (id, _fivetran_id),
    FOREIGN KEY (_fivetran_id) REFERENCES signature_request(_fivetran_id)
);

CREATE TABLE signature_request_cc_email (
    id text,
    _fivetran_id text,
    PRIMARY KEY (id, _fivetran_id),
    FOREIGN KEY (_fivetran_id) REFERENCES signature_request(_fivetran_id)
);

CREATE TABLE signature (
    id text,
    _fivetran_id text,
    decline_reason text,
    error text,
    has_pin text,
    has_sms_auth boolean,
    has_sms_delivery boolean,
    last_reminded_at timestamp,
    last_viewed_at timestamp,
    reassigned_by text,
    reassigned_from text,
    reassignment_reason text,
    signed_at timestamp,
    signer_email_address text,
    signer_group_guid text,
    signer_name text,
    signer_order bigint,
    signer_role text,
    sms_phone_number text,
    status_code text,
    PRIMARY KEY (id, _fivetran_id),
    FOREIGN KEY (_fivetran_id) REFERENCES signature_request(_fivetran_id)
);

CREATE TABLE signature_response (
    "index" text,
    _fivetran_id text,
    signature_id text,
    field_id text,
    "name" text,
    required boolean,
    "type" text,
    "value" text,
    PRIMARY KEY ("index", _fivetran_id),
    FOREIGN KEY (_fivetran_id) REFERENCES signature_request(_fivetran_id),
    FOREIGN KEY (signature_id) REFERENCES signature(id)
);

CREATE TABLE signature_request (
    _fivetran_id text,
    requester_email_address text,
    created_at timestamp,
    details_url text,
    expires_at timestamp,
    files_url text,
    has_error boolean,
    id text,
    is_complete boolean,
    is_declined boolean,
    message text,
    metadata jsonb,
    original_title text,
    signing_url text,
    subject text,
    title text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (requester_email_address) REFERENCES team_account(email_address)
);

CREATE TABLE team_account (
    id text,
    _fivetran_id text,
    email_address text,
    is_locked text,
    is_paid_hf text,
    is_paid_hs text,
    locale text,
    quotas_api_signature_requests_left text,
    quotas_documents_left text,
    quotas_sms_verifications_left text,
    quotas_templates_left text,
    role_code text,
    team_id text,
    PRIMARY KEY (id, _fivetran_id),
    FOREIGN KEY (_fivetran_id) REFERENCES team(_fivetran_id)
);

CREATE TABLE team (
    _fivetran_id text,
    invited_account jsonb,
    "name" text,
    PRIMARY KEY (_fivetran_id)
);
