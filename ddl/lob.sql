CREATE TABLE template_metadata (
    "name" text,
    template_id text,
    "value" text,
    PRIMARY KEY ("name", template_id),
    FOREIGN KEY (template_id) REFERENCES template(id)
);

CREATE TABLE template (
    id text,
    published_version_id text,
    date_created timestamp,
    date_modified timestamp,
    description text,
    html text,
    PRIMARY KEY (id),
    FOREIGN KEY (published_version_id) REFERENCES template_version(id)
);

CREATE TABLE template_version_merge_variable (
    "name" text,
    template_version_id text,
    "value" text,
    PRIMARY KEY ("name", template_version_id),
    FOREIGN KEY (template_version_id) REFERENCES template_version(id)
);

CREATE TABLE template_version (
    id text,
    template_id text,
    date_created timestamp,
    date_modified timestamp,
    deleted boolean,
    description text,
    engine text,
    html text,
    suggest_json_editor boolean,
    PRIMARY KEY (id),
    FOREIGN KEY (template_id) REFERENCES template(id)
);

CREATE TABLE billing_group (
    id text,
    date_created text,
    date_modified text,
    description text,
    metadata jsonb,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE postcard_thumbnail (
    _fivetran_id text,
    postcard_id text,
    large text,
    medium text,
    small text,
    PRIMARY KEY (_fivetran_id, postcard_id),
    FOREIGN KEY (postcard_id) REFERENCES postcard(id)
);

CREATE TABLE postcard_tracking_event (
    id text,
    postcard_id text,
    date_created timestamp,
    date_modified timestamp,
    deleted boolean,
    details_action_required boolean,
    details_description text,
    details_event text,
    details_notes text,
    location text,
    "name" text,
    "time" timestamp,
    "type" text,
    PRIMARY KEY (id, postcard_id),
    FOREIGN KEY (postcard_id) REFERENCES postcard(id)
);

CREATE TABLE postcard_to_address (
    address_id text,
    postcard_id text,
    address_city text,
    address_country text,
    address_line_1 text,
    address_line_2 text,
    address_state text,
    address_zip text,
    company text,
    date_created timestamp,
    date_modified timestamp,
    deleted boolean,
    description text,
    email text,
    meta_data jsonb,
    "name" text,
    object text,
    phone text,
    recipient_moved boolean,
    PRIMARY KEY (address_id, postcard_id),
    FOREIGN KEY (address_id) REFERENCES address(id),
    FOREIGN KEY (postcard_id) REFERENCES postcard(id)
);

CREATE TABLE postcard_from_address (
    address_id text,
    postcard_id text,
    address_city text,
    address_country text,
    address_line_1 text,
    address_line_2 text,
    address_state text,
    address_zip text,
    company text,
    date_created timestamp,
    date_modified timestamp,
    deleted boolean,
    description text,
    email text,
    meta_data jsonb,
    "name" text,
    object text,
    phone text,
    recipient_moved boolean,
    PRIMARY KEY (address_id, postcard_id),
    FOREIGN KEY (address_id) REFERENCES address(id),
    FOREIGN KEY (postcard_id) REFERENCES postcard(id)
);

CREATE TABLE postcard_failure_reason_error (
    "index" text,
    postcard_id text,
    error_type text,
    host text,
    "path" text,
    protocol text,
    remediation text,
    status_code text,
    url text,
    PRIMARY KEY ("index", postcard_id),
    FOREIGN KEY (postcard_id) REFERENCES postcard(id)
);

CREATE TABLE postcard_metadata (
    "name" text,
    postcard_id text,
    "value" text,
    PRIMARY KEY ("name", postcard_id),
    FOREIGN KEY (postcard_id) REFERENCES postcard(id)
);

CREATE TABLE postcard_merge_variable (
    "name" text,
    postcard_id text,
    "value" text,
    PRIMARY KEY ("name", postcard_id),
    FOREIGN KEY (postcard_id) REFERENCES postcard(id)
);

CREATE TABLE postcard (
    id text,
    back_template_id text,
    back_template_version_id text,
    campaign_id text,
    front_template_id text,
    front_template_version_id text,
    carrier text,
    completed_at text,
    date_created timestamp,
    date_modified timestamp,
    deleted boolean,
    description text,
    expected_delivery_date text,
    failure_reason text,
    failure_reason_remediation text,
    fsc text,
    is_creative_proof text,
    is_dashboard text,
    lob_credits_funding_status text,
    mail_type text,
    raw_url text,
    send_date timestamp,
    "size" text,
    "status" text,
    to_be_expunged_date text,
    url text,
    use_type text,
    usps_campaign_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (back_template_id) REFERENCES template(id),
    FOREIGN KEY (back_template_version_id) REFERENCES template_version(id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (front_template_id) REFERENCES template(id),
    FOREIGN KEY (front_template_version_id) REFERENCES template_version(id)
);

CREATE TABLE qr_code_scan (
    "index" text,
    qr_code_id text,
    ip_location text,
    scan_date text,
    PRIMARY KEY ("index", qr_code_id),
    FOREIGN KEY (qr_code_id) REFERENCES qr_code(id)
);

CREATE TABLE qr_code (
    id text,
    date_created text,
    PRIMARY KEY (id)
);

CREATE TABLE bank_account_metadata (
    "name" text,
    bank_account_id text,
    "value" text,
    PRIMARY KEY ("name", bank_account_id),
    FOREIGN KEY (bank_account_id) REFERENCES bank_account(id)
);

CREATE TABLE bank_account (
    id text,
    account_number bigint,
    account_type text,
    bank_name text,
    date_created timestamp,
    date_modified timestamp,
    deleted boolean,
    description text,
    routing_number bigint,
    signatory text,
    signature_url text,
    verified boolean,
    PRIMARY KEY (id)
);

CREATE TABLE address_metadata (
    "name" text,
    address_id text,
    "value" text,
    PRIMARY KEY ("name", address_id),
    FOREIGN KEY (address_id) REFERENCES address(id)
);

CREATE TABLE address (
    id text,
    address_city text,
    address_country text,
    address_line_1 text,
    address_line_2 text,
    address_state text,
    address_zip text,
    company text,
    date_created timestamp,
    date_modified timestamp,
    deleted boolean,
    description text,
    "name" text,
    phone text,
    recipient_moved boolean,
    PRIMARY KEY (id)
);

CREATE TABLE self_mailer_thumbnail (
    _fivetran_id text,
    self_mailer_id text,
    large text,
    medium text,
    small text,
    PRIMARY KEY (_fivetran_id, self_mailer_id),
    FOREIGN KEY (self_mailer_id) REFERENCES self_mailer(id)
);

CREATE TABLE self_mailer_tracking_event (
    id text,
    self_mailer_id text,
    date_created text,
    date_modified text,
    deleted boolean,
    details_action_required text,
    details_description text,
    details_event text,
    details_notes text,
    location text,
    "name" text,
    "time" text,
    "type" text,
    PRIMARY KEY (id, self_mailer_id),
    FOREIGN KEY (self_mailer_id) REFERENCES self_mailer(id)
);

CREATE TABLE self_mailer_to_address (
    address_id text,
    self_mailer_id text,
    address_city text,
    address_country text,
    address_line_1 text,
    address_line_2 text,
    address_state text,
    address_zip text,
    company text,
    date_created timestamp,
    date_modified timestamp,
    deleted boolean,
    description text,
    "name" text,
    phone text,
    recipient_moved boolean,
    PRIMARY KEY (address_id, self_mailer_id),
    FOREIGN KEY (address_id) REFERENCES address(id),
    FOREIGN KEY (self_mailer_id) REFERENCES self_mailer(id)
);

CREATE TABLE self_mailer_from_address (
    address_id text,
    self_mailer_id text,
    address_city text,
    address_country text,
    address_line_1 text,
    address_line_2 text,
    address_state text,
    address_zip text,
    company text,
    date_created timestamp,
    date_modified timestamp,
    deleted boolean,
    description text,
    "name" text,
    phone text,
    recipient_moved boolean,
    PRIMARY KEY (address_id, self_mailer_id),
    FOREIGN KEY (address_id) REFERENCES address(id),
    FOREIGN KEY (self_mailer_id) REFERENCES self_mailer(id)
);

CREATE TABLE self_mailer_metadata (
    "name" text,
    self_mailer_id text,
    "value" text,
    PRIMARY KEY ("name", self_mailer_id),
    FOREIGN KEY (self_mailer_id) REFERENCES self_mailer(id)
);

CREATE TABLE self_mailer_merge_variable (
    "name" text,
    self_mailer_id text,
    "value" text,
    PRIMARY KEY ("name", self_mailer_id),
    FOREIGN KEY (self_mailer_id) REFERENCES self_mailer(id)
);

CREATE TABLE self_mailer (
    id text,
    inside_template_id text,
    inside_template_version_id text,
    outside_template_id text,
    outside_template_version_id text,
    carrier text,
    date_created timestamp,
    date_modified text,
    deleted boolean,
    description text,
    expected_delivery_date text,
    mail_type text,
    send_date text,
    "size" text,
    PRIMARY KEY (id),
    FOREIGN KEY (inside_template_id) REFERENCES template(id),
    FOREIGN KEY (inside_template_version_id) REFERENCES template_version(id),
    FOREIGN KEY (outside_template_id) REFERENCES template(id),
    FOREIGN KEY (outside_template_version_id) REFERENCES template_version(id)
);

CREATE TABLE check_thumbnail (
    _fivetran_id text,
    checks_id text,
    large text,
    medium text,
    small text,
    PRIMARY KEY (_fivetran_id, checks_id),
    FOREIGN KEY (checks_id) REFERENCES checks(id)
);

CREATE TABLE check_tracking_event (
    id text,
    checks_id text,
    date_created timestamp,
    date_modified timestamp,
    deleted boolean,
    details_action_required boolean,
    details_description text,
    details_event text,
    details_notes text,
    location text,
    "name" text,
    "time" timestamp,
    "type" text,
    PRIMARY KEY (id, checks_id),
    FOREIGN KEY (checks_id) REFERENCES checks(id)
);

CREATE TABLE check_to_address (
    address_id text,
    checks_id text,
    address_city text,
    address_country text,
    address_line_1 text,
    address_line_2 text,
    address_state text,
    address_zip text,
    company text,
    date_created timestamp,
    date_modified timestamp,
    deleted boolean,
    description text,
    "name" text,
    phone text,
    recipient_moved boolean,
    PRIMARY KEY (address_id, checks_id),
    FOREIGN KEY (address_id) REFERENCES address(id),
    FOREIGN KEY (checks_id) REFERENCES checks(id)
);

CREATE TABLE check_from_address (
    address_id text,
    checks_id text,
    address_city text,
    address_country text,
    address_line_1 text,
    address_line_2 text,
    address_state text,
    address_zip text,
    company text,
    date_created timestamp,
    date_modified timestamp,
    deleted boolean,
    description text,
    "name" text,
    phone text,
    recipient_moved boolean,
    PRIMARY KEY (address_id, checks_id),
    FOREIGN KEY (address_id) REFERENCES address(id),
    FOREIGN KEY (checks_id) REFERENCES checks(id)
);

CREATE TABLE check_metadata (
    "name" text,
    checks_id text,
    "value" text,
    PRIMARY KEY ("name", checks_id),
    FOREIGN KEY (checks_id) REFERENCES checks(id)
);

CREATE TABLE check_merge_variable (
    "name" text,
    checks_id text,
    "value" text,
    PRIMARY KEY ("name", checks_id),
    FOREIGN KEY (checks_id) REFERENCES checks(id)
);

CREATE TABLE checks (
    id text,
    attachment_template_id text,
    attachment_template_version_id text,
    bank_account_id text,
    check_bottom_template_id text,
    check_bottom_template_version_id text,
    amount double precision,
    carrier text,
    check_number integer,
    date_created timestamp,
    date_modified timestamp,
    deleted boolean,
    description text,
    expected_delivery_date text,
    mail_type text,
    memo text,
    message text,
    send_date text,
    PRIMARY KEY (id),
    FOREIGN KEY (attachment_template_id) REFERENCES template(id),
    FOREIGN KEY (attachment_template_version_id) REFERENCES template_version(id),
    FOREIGN KEY (bank_account_id) REFERENCES bank_account(id),
    FOREIGN KEY (check_bottom_template_id) REFERENCES template(id),
    FOREIGN KEY (check_bottom_template_version_id) REFERENCES template_version(id)
);

CREATE TABLE letter_thumbnail (
    _fivetran_id text,
    letter_id text,
    large text,
    medium text,
    small text,
    PRIMARY KEY (_fivetran_id, letter_id),
    FOREIGN KEY (letter_id) REFERENCES letter(id)
);

CREATE TABLE letter_tracking_event (
    id text,
    letter_id text,
    date_created timestamp,
    date_modified timestamp,
    deleted boolean,
    details_action_required boolean,
    details_description text,
    details_event text,
    details_notes text,
    location text,
    "name" text,
    "time" timestamp,
    "type" text,
    PRIMARY KEY (id, letter_id),
    FOREIGN KEY (letter_id) REFERENCES letter(id)
);

CREATE TABLE letter_to_address (
    address_id text,
    letter_id text,
    address_city text,
    address_country text,
    address_line_1 text,
    address_line_2 text,
    address_state text,
    address_zip text,
    company text,
    date_created timestamp,
    date_modified timestamp,
    deleted boolean,
    description text,
    "name" text,
    phone text,
    recipient_moved boolean,
    PRIMARY KEY (address_id, letter_id),
    FOREIGN KEY (address_id) REFERENCES address(id),
    FOREIGN KEY (letter_id) REFERENCES letter(id)
);

CREATE TABLE letter_from_address (
    address_id text,
    letter_id text,
    address_city text,
    address_country text,
    address_line_1 text,
    address_line_2 text,
    address_state text,
    address_zip text,
    company text,
    date_created timestamp,
    date_modified timestamp,
    deleted boolean,
    description text,
    "name" text,
    phone text,
    recipient_moved boolean,
    PRIMARY KEY (address_id, letter_id),
    FOREIGN KEY (address_id) REFERENCES address(id),
    FOREIGN KEY (letter_id) REFERENCES letter(id)
);

CREATE TABLE letter_metadata (
    "name" text,
    letter_id text,
    "value" text,
    PRIMARY KEY ("name", letter_id),
    FOREIGN KEY (letter_id) REFERENCES letter(id)
);

CREATE TABLE letter_merge_variable (
    "name" text,
    letter_id text,
    "value" text,
    PRIMARY KEY ("name", letter_id),
    FOREIGN KEY (letter_id) REFERENCES letter(id)
);

CREATE TABLE letter (
    id text,
    template_id text,
    template_version_id text,
    address_placement text,
    carrier text,
    color text,
    custom_envelope_id text,
    date_created timestamp,
    date_modified timestamp,
    deleted boolean,
    description text,
    double_sided boolean,
    expected_delivery_date text,
    extra_service text,
    mail_type text,
    perforated_page integer,
    return_envelope text,
    send_date timestamp,
    tracking_number text,
    use_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (template_id) REFERENCES template(id),
    FOREIGN KEY (template_version_id) REFERENCES template_version(id)
);

CREATE TABLE campaign_creative_template_preview (
    id text,
    campaign_creative_campaign_id text,
    campaign_creative_id text,
    template_id text,
    PRIMARY KEY (id, campaign_creative_campaign_id, campaign_creative_id),
    FOREIGN KEY (campaign_creative_campaign_id) REFERENCES campaign_creative(campaign_id),
    FOREIGN KEY (campaign_creative_id) REFERENCES campaign_creative(id),
    FOREIGN KEY (template_id) REFERENCES template(id)
);

CREATE TABLE campaign_creative (
    id text,
    campaign_id text,
    from_address text,
    date_created text,
    date_modified text,
    deleted text,
    description text,
    details_back_original_url text,
    details_back_template_id text,
    details_front_original_url text,
    details_front_template_id text,
    details_fsc text,
    details_mail_type text,
    details_setting text,
    details_size text,
    metadata jsonb,
    resource_type text,
    template_preview_url_back text,
    template_preview_url_front text,
    use_personalized_return_address text,
    PRIMARY KEY (id, campaign_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (from_address) REFERENCES address(id)
);

CREATE TABLE campaign_upload (
    id text,
    campaign_id text,
    account_id text,
    api_version text,
    date_created text,
    date_modified text,
    deleted text,
    failed_mail_piece text,
    failures_url text,
    merge_variable_column_mapping text,
    metadata jsonb,
    mode text,
    optinal_address_country text,
    optinal_address_line_2 text,
    optinal_company text,
    original_file_name text,
    required_address_city text,
    required_address_line_1 text,
    required_address_state text,
    required_address_zip text,
    required_name text,
    return_address_city text,
    return_address_company text,
    return_address_country text,
    return_address_line_1 text,
    return_address_line_2 text,
    return_address_name text,
    return_address_state text,
    return_address_zip text,
    "state" text,
    total_mail_piece text,
    validated_mail_piece text,
    PRIMARY KEY (id, campaign_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id)
);

CREATE TABLE campaign (
    id text,
    billing_group_id text,
    audience jsonb,
    auto_cancel_if_ncoa text,
    cancel_window_campaign_minute text,
    date_created text,
    date_modified text,
    date_ordered text,
    deleted text,
    description text,
    is_active text,
    is_draft text,
    mail_destination text,
    merge_variable_strictness text,
    metadata jsonb,
    "name" text,
    print_speed text,
    rules text,
    schedule_type text,
    send_date text,
    send_type text,
    service_request_number text,
    "status" text,
    target_delivery_date text,
    use_type text,
    PRIMARY KEY (id),
    FOREIGN KEY (billing_group_id) REFERENCES billing_group(id)
);
