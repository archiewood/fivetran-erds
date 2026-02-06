CREATE TABLE archive_reason (
    id text,
    text text,
    PRIMARY KEY (id)
);

CREATE TABLE requisition_offer (
    offer_id text,
    requisition_id text,
    PRIMARY KEY (offer_id, requisition_id),
    FOREIGN KEY (offer_id) REFERENCES offer(id),
    FOREIGN KEY (requisition_id) REFERENCES requisition(id)
);

CREATE TABLE requisition_posting (
    posting_id text,
    requisition_id text,
    PRIMARY KEY (posting_id, requisition_id),
    FOREIGN KEY (posting_id) REFERENCES posting(id),
    FOREIGN KEY (requisition_id) REFERENCES requisition(id)
);

CREATE TABLE requisition (
    id text,
    creator_id text,
    hiring_manager_id text,
    owner_id text,
    approval_account_id text,
    approval_created_by text,
    approval_id text,
    approval_image_format text,
    approval_started_at text,
    approval_status text,
    backfill text,
    closed_at timestamp,
    compensation_band_currency text,
    compensation_band_interval text,
    compensation_band_max text,
    compensation_band_min text,
    created_at timestamp,
    employment_status text,
    head_count_hired text,
    head_count_infinite text,
    head_count_total text,
    internal_notes text,
    location text,
    "name" text,
    requisition_code text,
    "status" text,
    team text,
    -- custom_fields_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (creator_id) REFERENCES users(id),
    FOREIGN KEY (hiring_manager_id) REFERENCES users(id),
    FOREIGN KEY (owner_id) REFERENCES users(id)
);

CREATE TABLE referral_form_field (
    field_index text,
    value_index text,
    referral_form_id text,
    value_file_id text,
    code_language text,
    currency text,
    "type" text,
    value_date timestamp,
    value_decimal text,
    value_number text,
    value_text text,
    PRIMARY KEY (field_index, value_index, referral_form_id),
    FOREIGN KEY (referral_form_id) REFERENCES referral_form(id),
    FOREIGN KEY (value_file_id) REFERENCES file(id)
);

CREATE TABLE referral_form_score_card_sub_field (
    sub_field_index text,
    field_index text,
    id text,
    description text,
    text text,
    PRIMARY KEY (sub_field_index, field_index, id),
    FOREIGN KEY (field_index) REFERENCES referral_form_template_field(field_index),
    FOREIGN KEY (id) REFERENCES referral_form_template_field(id)
);

CREATE TABLE referral_form_template_field (
    field_index text,
    id text,
    description text,
    required text,
    "type" text,
    PRIMARY KEY (field_index, id)
);

CREATE TABLE referral_form (
    id text,
    creator_id text,
    opportunity_id text,
    referrer_id text,
    stage_id text,
    template_id text,
    completed_at timestamp,
    created_at timestamp,
    instructions text,
    text text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (creator_id) REFERENCES users(id),
    FOREIGN KEY (opportunity_id) REFERENCES opportunity(id),
    FOREIGN KEY (referrer_id) REFERENCES users(id),
    FOREIGN KEY (stage_id) REFERENCES stage(id),
    FOREIGN KEY (template_id) REFERENCES referral_form_template_field(id)
);

CREATE TABLE users (
    id text,
    access_role text,
    created_at timestamp,
    deactivated_at timestamp,
    email text,
    external_directory_id text,
    "name" text,
    photo text,
    username text,
    PRIMARY KEY (id)
);

CREATE TABLE offer_field (
    "index" text,
    offer_id text,
    identifier text,
    text text,
    "value" text,
    PRIMARY KEY ("index", offer_id),
    FOREIGN KEY (offer_id) REFERENCES offer(id)
);

CREATE TABLE offer (
    id text,
    opportunity_id text,
    creator_id text,
    created_at timestamp,
    "status" text,
    PRIMARY KEY (id, opportunity_id),
    FOREIGN KEY (opportunity_id) REFERENCES opportunity(id),
    FOREIGN KEY (creator_id) REFERENCES users(id)
);

CREATE TABLE posting_form_field (
    field_index text,
    value_index text,
    posting_form_id text,
    value_file_id text,
    code_language text,
    currency text,
    "type" text,
    value_date timestamp,
    value_decimal text,
    value_number text,
    value_text text,
    PRIMARY KEY (field_index, value_index, posting_form_id),
    FOREIGN KEY (posting_form_id) REFERENCES posting_form(id),
    FOREIGN KEY (value_file_id) REFERENCES file(id)
);

CREATE TABLE posting_form_score_card_sub_field (
    sub_field_index text,
    field_index text,
    id text,
    description text,
    text text,
    PRIMARY KEY (sub_field_index, field_index, id),
    FOREIGN KEY (field_index) REFERENCES posting_form_template_field(field_index),
    FOREIGN KEY (id) REFERENCES posting_form_template_field(id)
);

CREATE TABLE posting_form_template_field (
    field_index text,
    id text,
    description text,
    required text,
    "type" text,
    PRIMARY KEY (field_index, id)
);

CREATE TABLE posting_form (
    id text,
    application_id text,
    creator_id text,
    opportunity_id text,
    template_id text,
    completed_at timestamp,
    created_at timestamp,
    text text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (application_id) REFERENCES application(id),
    FOREIGN KEY (creator_id) REFERENCES users(id),
    FOREIGN KEY (opportunity_id) REFERENCES opportunity(id),
    FOREIGN KEY (template_id) REFERENCES posting_form_template_field(id)
);

CREATE TABLE application (
    id text,
    archived_reason_id text,
    opportunity_id text,
    posting_hiring_manager_id text,
    posting_id text,
    posting_owner_id text,
    referrer_id text,
    requisition_for_hire_id text,
    archived_at timestamp,
    comments text,
    company text,
    created_at timestamp,
    links jsonb,
    requisition_for_hire_code text,
    requisition_for_hire_manager text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (archived_reason_id) REFERENCES archive_reason(id),
    FOREIGN KEY (opportunity_id) REFERENCES opportunity(id),
    FOREIGN KEY (posting_hiring_manager_id) REFERENCES users(id),
    FOREIGN KEY (posting_id) REFERENCES posting(id),
    FOREIGN KEY (posting_owner_id) REFERENCES users(id),
    FOREIGN KEY (referrer_id) REFERENCES users(id),
    FOREIGN KEY (requisition_for_hire_id) REFERENCES requisition(id)
);

CREATE TABLE opportunity_position (
    "index" text,
    resume_id text,
    end_month text,
    end_year text,
    location text,
    org text,
    start_month text,
    start_year text,
    summary text,
    title text,
    PRIMARY KEY ("index", resume_id),
    FOREIGN KEY (resume_id) REFERENCES resume(id)
);

CREATE TABLE opportunity_school (
    "index" text,
    resume_id text,
    degree text,
    end_month text,
    end_year text,
    field text,
    org text,
    start_month text,
    start_year text,
    summary text,
    PRIMARY KEY ("index", resume_id),
    FOREIGN KEY (resume_id) REFERENCES resume(id)
);

CREATE TABLE resume (
    id text,
    opportunity_id text,
    created_at timestamp,
    file_ext text,
    file_name text,
    file_status text,
    file_uploaded_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (opportunity_id) REFERENCES opportunity(id)
);

CREATE TABLE note_field (
    "index" text,
    note_id text,
    creator_id text,
    stage_id text,
    created_at timestamp,
    text text,
    "value" text,
    PRIMARY KEY ("index", note_id),
    FOREIGN KEY (note_id) REFERENCES note(id),
    FOREIGN KEY (creator_id) REFERENCES users(id),
    FOREIGN KEY (stage_id) REFERENCES stage(id)
);

CREATE TABLE note (
    id text,
    creator_id text,
    opportunity_id text,
    completed_at timestamp,
    created_at timestamp,
    deleted_at timestamp,
    secret text,
    text text,
    PRIMARY KEY (id),
    FOREIGN KEY (creator_id) REFERENCES users(id),
    FOREIGN KEY (opportunity_id) REFERENCES opportunity(id)
);

CREATE TABLE posting_tag (
    tags text,
    posting_id text,
    PRIMARY KEY (tags, posting_id),
    FOREIGN KEY (posting_id) REFERENCES posting(id)
);

CREATE TABLE posting_content_list (
    "index" text,
    posting_id text,
    content text,
    text text,
    PRIMARY KEY ("index", posting_id),
    FOREIGN KEY (posting_id) REFERENCES posting(id)
);

CREATE TABLE posting_distribution_channel (
    distribution_channel text,
    posting_id text,
    PRIMARY KEY (distribution_channel, posting_id),
    FOREIGN KEY (posting_id) REFERENCES posting(id)
);

CREATE TABLE posting (
    id text,
    creator_id text,
    hiring_manager_id text,
    owner_id text,
    categories_commitment text,
    categories_department text,
    categories_level text,
    categories_location text,
    categories_team text,
    content_closing text,
    content_closing_html text,
    content_description text,
    content_description_html text,
    created_at timestamp,
    requisition_code text,
    "state" text,
    text text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (creator_id) REFERENCES users(id),
    FOREIGN KEY (hiring_manager_id) REFERENCES users(id),
    FOREIGN KEY (owner_id) REFERENCES users(id)
);

CREATE TABLE file (
    id text,
    contact_id text,
    download_url text,
    ext text,
    "name" text,
    uploaded_at timestamp,
    PRIMARY KEY (id, contact_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE panel_application (
    application_id text,
    panel_id text,
    PRIMARY KEY (application_id, panel_id),
    FOREIGN KEY (application_id) REFERENCES application(id),
    FOREIGN KEY (panel_id) REFERENCES panel(id)
);

CREATE TABLE panel_interview (
    interview_id text,
    panel_id text,
    PRIMARY KEY (interview_id, panel_id),
    FOREIGN KEY (interview_id) REFERENCES interview(id),
    FOREIGN KEY (panel_id) REFERENCES panel(id)
);

CREATE TABLE panel (
    id text,
    opportunity_id text,
    creator_id text,
    stage_id text,
    canceled_at timestamp,
    created_at timestamp,
    ends text,
    external_url text,
    externally_managed text,
    feedback_reminder text,
    note text,
    "start" text,
    timezone text,
    PRIMARY KEY (id, opportunity_id),
    FOREIGN KEY (opportunity_id) REFERENCES opportunity(id),
    FOREIGN KEY (creator_id) REFERENCES users(id),
    FOREIGN KEY (stage_id) REFERENCES stage(id)
);

CREATE TABLE stage (
    id text,
    text text,
    PRIMARY KEY (id)
);

CREATE TABLE profile_form_field (
    field_index text,
    value_index text,
    profile_form_id text,
    value_file_id text,
    code_language text,
    currency text,
    "type" text,
    value_date timestamp,
    value_decimal text,
    value_number text,
    value_text text,
    PRIMARY KEY (field_index, value_index, profile_form_id),
    FOREIGN KEY (profile_form_id) REFERENCES profile_form(id),
    FOREIGN KEY (value_file_id) REFERENCES file(id)
);

CREATE TABLE profile_form_score_card_sub_field (
    sub_field_index text,
    field_index text,
    id text,
    description text,
    text text,
    PRIMARY KEY (sub_field_index, field_index, id),
    FOREIGN KEY (field_index) REFERENCES profile_form_template_field(field_index),
    FOREIGN KEY (id) REFERENCES profile_form_template_field(id)
);

CREATE TABLE profile_form_template_field (
    field_index text,
    id text,
    description text,
    required text,
    "type" text,
    PRIMARY KEY (field_index, id)
);

CREATE TABLE profile_form (
    id text,
    creator_id text,
    opportunity_id text,
    stage_id text,
    template_id text,
    completed_at timestamp,
    created_at timestamp,
    deleted_at timestamp,
    instructions text,
    text text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (creator_id) REFERENCES users(id),
    FOREIGN KEY (opportunity_id) REFERENCES opportunity(id),
    FOREIGN KEY (stage_id) REFERENCES stage(id),
    FOREIGN KEY (template_id) REFERENCES profile_form_template_field(id)
);

CREATE TABLE interview_user (
    interview_id text,
    user_id text,
    PRIMARY KEY (interview_id, user_id),
    FOREIGN KEY (interview_id) REFERENCES interview(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE interview_feedback (
    feedback_form_id text,
    interview_id text,
    PRIMARY KEY (feedback_form_id, interview_id),
    FOREIGN KEY (feedback_form_id) REFERENCES feedback_form(id),
    FOREIGN KEY (interview_id) REFERENCES interview(id)
);

CREATE TABLE posting_interview (
    interview_id text,
    posting_id text,
    PRIMARY KEY (interview_id, posting_id),
    FOREIGN KEY (interview_id) REFERENCES interview(id),
    FOREIGN KEY (posting_id) REFERENCES posting(id)
);

CREATE TABLE interview (
    id text,
    creator_id text,
    opportunity_id text,
    stage_id text,
    canceled_at timestamp,
    created_at timestamp,
    "date" timestamp,
    duration text,
    feedback_reminder text,
    gcal_event_url text,
    location text,
    note text,
    panel_id text,
    subject text,
    timezone text,
    PRIMARY KEY (id),
    FOREIGN KEY (creator_id) REFERENCES users(id),
    FOREIGN KEY (opportunity_id) REFERENCES opportunity(id),
    FOREIGN KEY (stage_id) REFERENCES stage(id)
);

CREATE TABLE feedback_form_field (
    field_index text,
    value_index text,
    feedback_form_id text,
    value_file_id text,
    code_language text,
    currency text,
    "type" text,
    value_date timestamp,
    value_decimal text,
    value_number text,
    value_text text,
    PRIMARY KEY (field_index, value_index, feedback_form_id),
    FOREIGN KEY (feedback_form_id) REFERENCES feedback_form(id),
    FOREIGN KEY (value_file_id) REFERENCES file(id)
);

CREATE TABLE feedback_form_score_card_sub_field (
    sub_field_index text,
    field_index text,
    id text,
    description text,
    text text,
    PRIMARY KEY (sub_field_index, field_index, id),
    FOREIGN KEY (field_index) REFERENCES feedback_form_template_field(field_index),
    FOREIGN KEY (id) REFERENCES feedback_form_template_field(id)
);

CREATE TABLE feedback_form_template_field (
    field_index text,
    id text,
    description text,
    required text,
    "type" text,
    PRIMARY KEY (field_index, id)
);

CREATE TABLE feedback_form (
    id text,
    creator_id text,
    interview_id text,
    opportunity_id text,
    template_id text,
    completed_at timestamp,
    created_at timestamp,
    deleted_at timestamp,
    instructions text,
    score_system_value text,
    text text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (creator_id) REFERENCES users(id),
    FOREIGN KEY (interview_id) REFERENCES interview(id),
    FOREIGN KEY (opportunity_id) REFERENCES opportunity(id),
    FOREIGN KEY (template_id) REFERENCES feedback_form_template_field(id)
);

CREATE TABLE opportunity_tag (
    tags text,
    opportunity_id text,
    PRIMARY KEY (tags, opportunity_id),
    FOREIGN KEY (opportunity_id) REFERENCES opportunity(id)
);

CREATE TABLE opportunity_source (
    "source" text,
    opportunity_id text,
    PRIMARY KEY ("source", opportunity_id),
    FOREIGN KEY (opportunity_id) REFERENCES opportunity(id)
);

CREATE TABLE opportunity_stage_history (
    updated_at timestamp,
    opportunity_id text,
    stage_id text,
    updater_id text,
    PRIMARY KEY (updated_at, opportunity_id),
    FOREIGN KEY (opportunity_id) REFERENCES opportunity(id),
    FOREIGN KEY (stage_id) REFERENCES stage(id),
    FOREIGN KEY (updater_id) REFERENCES users(id)
);

CREATE TABLE contact_phone (
    "index" text,
    contact_id text,
    "type" text,
    "value" text,
    PRIMARY KEY ("index", contact_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE contact_email (
    email text,
    contact_id text,
    PRIMARY KEY (email, contact_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE contact (
    id text,
    headline text,
    location text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE contact_link (
    _fivetran_id text,
    contact_id text,
    link text,
    PRIMARY KEY (_fivetran_id, contact_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE opportunity (
    id text,
    archived_reason_id text,
    contact text,
    owner_id text,
    stage_id text,
    archived_at timestamp,
    created_at timestamp,
    data_protection_contact_allowed text,
    data_protection_contact_expires_at timestamp,
    data_protection_store_allowed text,
    data_protection_store_expires_at timestamp,
    headline text,
    is_anonymized text,
    last_advanced_at timestamp,
    last_interaction_at timestamp,
    location text,
    "name" text,
    origin text,
    snoozed_until text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (archived_reason_id) REFERENCES archive_reason(id),
    FOREIGN KEY (contact) REFERENCES contact(id),
    FOREIGN KEY (owner_id) REFERENCES users(id),
    FOREIGN KEY (stage_id) REFERENCES stage(id)
);
