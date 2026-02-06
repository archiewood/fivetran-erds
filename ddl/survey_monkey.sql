-- Note
-- Recipient and Contact can be joined using email field if you’re using contact list in Survey Monkey

CREATE TABLE contact (
    id text,
    email text,
    first_name text,
    last_name text,
    phone_number text,
    PRIMARY KEY (id)
);

CREATE TABLE response_answer (
    "index" bigint,
    question_id text,
    response_id text,
    response_page_id text,
    choice_id text,
    col_id text,
    content_type text,
    download_url text,
    other_id text,
    row_id text,
    text text,
    PRIMARY KEY ("index", question_id, response_id, response_page_id),
    FOREIGN KEY (question_id) REFERENCES question_history(id),
    FOREIGN KEY (response_id) REFERENCES response_history(id),
    FOREIGN KEY (response_page_id) REFERENCES response_page(id)
);

CREATE TABLE response_history (
    id text,
    collector_id text,
    recipient_id text,
    survey_id text,
    collection_mode text,
    created_at timestamp,
    custom_value text,
    ip_address text,
    response_status text,
    total_time bigint,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (collector_id) REFERENCES collector(id),
    FOREIGN KEY (recipient_id) REFERENCES recipient(id),
    FOREIGN KEY (survey_id) REFERENCES survey_history(id)
);

CREATE TABLE recipient (
    id text,
    message_id text,
    email text,
    mail_status text,
    phone_number text,
    remove_link text,
    survey_link text,
    survey_response_status text,
    PRIMARY KEY (id),
    FOREIGN KEY (message_id) REFERENCES message(id)
);

CREATE TABLE survey_history (
    id text,
    category_id text,
    folder_id text,
    created_at timestamp,
    footer boolean,
    language text,
    nickname text,
    title text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (category_id) REFERENCES survey_category(id),
    FOREIGN KEY (folder_id) REFERENCES survey_folder(id)
);

CREATE TABLE question_option_history (
    "position" integer,
    question_id text,
    description text,
    id text,
    is_na boolean,
    quiz_option_score integer,
    text text,
    visible boolean,
    weight integer,
    PRIMARY KEY ("position", question_id),
    FOREIGN KEY (question_id) REFERENCES question_history(id)
);

CREATE TABLE sub_question_history (
    "position" integer,
    question_id text,
    id text,
    required boolean,
    text text,
    "type" text,
    visible boolean,
    PRIMARY KEY ("position", question_id),
    FOREIGN KEY (question_id) REFERENCES question_history(id)
);

CREATE TABLE contact_list_contact (
    contact_id text,
    contact_list_id text,
    PRIMARY KEY (contact_id, contact_list_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (contact_list_id) REFERENCES contact_list(id)
);

CREATE TABLE survey_page_history (
    id text,
    survey_id text,
    description text,
    "position" bigint,
    title text,
    PRIMARY KEY (id),
    FOREIGN KEY (survey_id) REFERENCES survey_history(id)
);

CREATE TABLE message (
    id text,
    collector_id text,
    body text,
    created_at timestamp,
    embed_first_question boolean,
    is_branding_enabled boolean,
    is_scheduled boolean,
    recipient_status text,
    scheduled_date timestamp,
    "status" text,
    subject text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (collector_id) REFERENCES collector(id)
);

CREATE TABLE question_history (
    id text,
    survey_page_id text,
    family text,
    forced_ranking boolean,
    "position" bigint,
    required_amount text,
    required_text text,
    required_type text,
    sorting_ignore_last boolean,
    sorting_type text,
    structure_metadata jsonb,
    subtype text,
    visible boolean,
    -- validation_* (dynamic column),
    PRIMARY KEY (id, survey_page_id),
    FOREIGN KEY (survey_page_id) REFERENCES survey_page_history(id)
);

CREATE TABLE collector (
    id text,
    survey_id text,
    allow_multiple_responses boolean,
    anonymous_type text,
    border_color text,
    close_date timestamp,
    closed_page_message text,
    created_at timestamp,
    display_survey_results boolean,
    disqualification_message text,
    disqualification_url text,
    edit_response_type text,
    headline text,
    height integer,
    is_branding_enabled boolean,
    message text,
    "name" text,
    password_enabled boolean,
    primary_button_bg_color text,
    primary_button_text text,
    primary_button_text_color text,
    redirect_type text,
    redirect_url text,
    sample_rate text,
    secondary_button_bg_color text,
    secondary_button_text text,
    secondary_button_text_color text,
    sender_email text,
    "status" text,
    thank_you_message text,
    "type" text,
    updated_at timestamp,
    url text,
    width integer,
    PRIMARY KEY (id),
    FOREIGN KEY (survey_id) REFERENCES survey_history(id)
);

CREATE TABLE contact_list (
    id text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE response_page (
    id text,
    response_id text,
    PRIMARY KEY (id, response_id),
    FOREIGN KEY (response_id) REFERENCES response_history(id)
);

CREATE TABLE survey_folder (
    id text,
    title text,
    PRIMARY KEY (id)
);

CREATE TABLE question_heading_history (
    "index" bigint,
    question_id text,
    description text,
    heading text,
    image_url text,
    -- random_assignment_* (dynamic column),
    PRIMARY KEY ("index", question_id),
    FOREIGN KEY (question_id) REFERENCES question_history(id)
);

CREATE TABLE survey_category (
    id text,
    "name" text,
    PRIMARY KEY (id)
);
