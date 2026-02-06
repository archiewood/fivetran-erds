CREATE TABLE customer_social_profile_history (
    id bigint,
    customer_id bigint,
    customer_updated_at timestamp,
    "type" text,
    "value" text,
    PRIMARY KEY (id, customer_id, customer_updated_at),
    FOREIGN KEY (customer_id) REFERENCES customer_history(id),
    FOREIGN KEY (customer_updated_at) REFERENCES customer_history(updated_at)
);

CREATE TABLE customer_email_history (
    id bigint,
    customer_id bigint,
    customer_updated_at timestamp,
    "type" text,
    "value" text,
    PRIMARY KEY (id, customer_id, customer_updated_at),
    FOREIGN KEY (customer_id) REFERENCES customer_history(id),
    FOREIGN KEY (customer_updated_at) REFERENCES customer_history(updated_at)
);

CREATE TABLE customer_phone_history (
    id bigint,
    customer_id bigint,
    customer_updated_at timestamp,
    "type" text,
    "value" text,
    PRIMARY KEY (id, customer_id, customer_updated_at),
    FOREIGN KEY (customer_id) REFERENCES customer_history(id),
    FOREIGN KEY (customer_updated_at) REFERENCES customer_history(updated_at)
);

CREATE TABLE customer_chat_history (
    id bigint,
    customer_id bigint,
    customer_updated_at timestamp,
    "type" text,
    "value" text,
    PRIMARY KEY (id, customer_id, customer_updated_at),
    FOREIGN KEY (customer_id) REFERENCES customer_history(id),
    FOREIGN KEY (customer_updated_at) REFERENCES customer_history(updated_at)
);

CREATE TABLE customer_website_history (
    id bigint,
    customer_id bigint,
    customer_updated_at timestamp,
    "value" text,
    PRIMARY KEY (id, customer_id, customer_updated_at),
    FOREIGN KEY (customer_id) REFERENCES customer_history(id),
    FOREIGN KEY (customer_updated_at) REFERENCES customer_history(updated_at)
);

CREATE TABLE customer_history (
    id bigint,
    updated_at timestamp,
    address_city text,
    address_country text,
    address_postal_code text,
    address_state text,
    age text,
    background text,
    created_at timestamp,
    first_name text,
    gender text,
    job_title text,
    last_name text,
    location text,
    organization text,
    photo_type text,
    photo_url text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id, updated_at)
);

CREATE TABLE team_history (
    id bigint,
    updated_at timestamp,
    created_at timestamp,
    email text,
    first_name text,
    last_name text,
    photo_url text,
    "role" text,
    timezone text,
    PRIMARY KEY (id, updated_at)
);

CREATE TABLE conversation_tag_history (
    conversation_id bigint,
    conversation_updated_at timestamp,
    tag_id bigint,
    PRIMARY KEY (conversation_id, conversation_updated_at, tag_id),
    FOREIGN KEY (conversation_id) REFERENCES conversation_history(id),
    FOREIGN KEY (conversation_updated_at) REFERENCES conversation_history(updated_at),
    FOREIGN KEY (tag_id) REFERENCES tag_history(id)
);

CREATE TABLE conversation_history (
    id bigint,
    updated_at timestamp,
    folder_id bigint,
    mailbox_id bigint,
    closed_at timestamp,
    closed_by bigint,
    created_at timestamp,
    customer_waiting_since_friendly text,
    customer_waiting_since_latest_reply_from text,
    customer_waiting_since_time timestamp,
    number bigint,
    preview text,
    primary_customer_id bigint,
    source_type text,
    source_via text,
    "state" text,
    "status" text,
    subject text,
    threads bigint,
    "type" text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id, updated_at),
    FOREIGN KEY (folder_id) REFERENCES mailbox_folder_history(id),
    FOREIGN KEY (mailbox_id) REFERENCES mailbox_history(id)
);

CREATE TABLE mailbox_history (
    id bigint,
    updated_at timestamp,
    created_at timestamp,
    email text,
    "name" text,
    slug text,
    PRIMARY KEY (id, updated_at)
);

CREATE TABLE doc_report_popular_search (
    "index" text,
    doc_report_fivetran_id text,
    count text,
    doc_report_end_date text,
    doc_report_start_date text,
    id text,
    "result" text,
    PRIMARY KEY ("index", doc_report_fivetran_id),
    FOREIGN KEY (doc_report_fivetran_id) REFERENCES doc_report(_fivetran_id)
);

CREATE TABLE doc_report_failed_search (
    "index" text,
    doc_report_fivetran_id text,
    count text,
    doc_report_end_date text,
    doc_report_start_date text,
    id text,
    PRIMARY KEY ("index", doc_report_fivetran_id),
    FOREIGN KEY (doc_report_fivetran_id) REFERENCES doc_report(_fivetran_id)
);

CREATE TABLE doc_report_top_article (
    "index" text,
    doc_report_fivetran_id text,
    collection_id text,
    count text,
    doc_report_end_date text,
    doc_report_start_date text,
    id text,
    "name" text,
    site_id text,
    PRIMARY KEY ("index", doc_report_fivetran_id),
    FOREIGN KEY (doc_report_fivetran_id) REFERENCES doc_report(_fivetran_id)
);

CREATE TABLE doc_report_top_category (
    "index" text,
    doc_report_fivetran_id text,
    article text,
    count text,
    doc_report_end_date text,
    doc_report_start_date text,
    id text,
    "name" text,
    site_id text,
    PRIMARY KEY ("index", doc_report_fivetran_id),
    FOREIGN KEY (doc_report_fivetran_id) REFERENCES doc_report(_fivetran_id)
);

CREATE TABLE doc_report (
    _fivetran_id text,
    browse_action text,
    doc_viewed_per_visit text,
    end_date text,
    failed_result text,
    found_an_answer_result text,
    search_action text,
    sent_an_email_result text,
    start_date text,
    visitor text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE tag_history (
    id bigint,
    updated_at timestamp,
    color text,
    created_at timestamp,
    "name" text,
    slug text,
    ticket_count integer,
    PRIMARY KEY (id, updated_at)
);

CREATE TABLE mailbox_folder_history (
    id bigint,
    updated_at timestamp,
    mailbox_id bigint,
    active_count bigint,
    "name" text,
    total_count bigint,
    "type" text,
    user_id bigint,
    PRIMARY KEY (id, updated_at, mailbox_id),
    FOREIGN KEY (mailbox_id) REFERENCES mailbox_history(id)
);

CREATE TABLE team_user_history (
    team_id bigint,
    team_updated_at timestamp,
    user_id bigint,
    PRIMARY KEY (team_id, team_updated_at, user_id),
    FOREIGN KEY (team_id) REFERENCES team_history(id),
    FOREIGN KEY (team_updated_at) REFERENCES team_history(updated_at),
    FOREIGN KEY (user_id) REFERENCES user_history(id)
);

CREATE TABLE mailbox_workflow_history (
    id bigint,
    updated_at timestamp,
    mailbox_id bigint,
    created_at timestamp,
    "name" text,
    orders bigint,
    "status" text,
    "type" text,
    PRIMARY KEY (id, updated_at, mailbox_id),
    FOREIGN KEY (mailbox_id) REFERENCES mailbox_history(id)
);

CREATE TABLE user_history (
    id bigint,
    updated_at timestamp,
    created_at timestamp,
    email text,
    first_name text,
    last_name text,
    photo_url text,
    "role" text,
    timezone text,
    PRIMARY KEY (id, updated_at)
);

CREATE TABLE conversation_thread_attachment_history (
    id bigint,
    conversation_id bigint,
    conversation_thread_id bigint,
    conversation_updated_at timestamp,
    filename text,
    hash text,
    height bigint,
    mime_type text,
    "size" bigint,
    url text,
    width bigint,
    PRIMARY KEY (id, conversation_id, conversation_thread_id, conversation_updated_at),
    FOREIGN KEY (conversation_id) REFERENCES conversation_thread_history(conversation_id),
    FOREIGN KEY (conversation_thread_id) REFERENCES conversation_thread_history(id),
    FOREIGN KEY (conversation_updated_at) REFERENCES conversation_thread_history(conversation_updated_at)
);

CREATE TABLE conversation_thread_bcc_history (
    email text,
    conversation_id bigint,
    conversation_thread_id bigint,
    conversation_updated_at timestamp,
    PRIMARY KEY (email, conversation_id, conversation_thread_id, conversation_updated_at),
    FOREIGN KEY (conversation_id) REFERENCES conversation_thread_history(conversation_id),
    FOREIGN KEY (conversation_thread_id) REFERENCES conversation_thread_history(id),
    FOREIGN KEY (conversation_updated_at) REFERENCES conversation_thread_history(conversation_updated_at)
);

CREATE TABLE conversation_thread_to_history (
    email text,
    conversation_id bigint,
    conversation_thread_id bigint,
    conversation_updated_at timestamp,
    PRIMARY KEY (email, conversation_id, conversation_thread_id, conversation_updated_at),
    FOREIGN KEY (conversation_id) REFERENCES conversation_thread_history(conversation_id),
    FOREIGN KEY (conversation_thread_id) REFERENCES conversation_thread_history(id),
    FOREIGN KEY (conversation_updated_at) REFERENCES conversation_thread_history(conversation_updated_at)
);

CREATE TABLE conversation_thread_cc_history (
    email text,
    conversation_id bigint,
    conversation_thread_id bigint,
    conversation_updated_at timestamp,
    PRIMARY KEY (email, conversation_id, conversation_thread_id, conversation_updated_at),
    FOREIGN KEY (conversation_id) REFERENCES conversation_thread_history(conversation_id),
    FOREIGN KEY (conversation_thread_id) REFERENCES conversation_thread_history(id),
    FOREIGN KEY (conversation_updated_at) REFERENCES conversation_thread_history(conversation_updated_at)
);

CREATE TABLE conversation_thread_history (
    id bigint,
    conversation_id bigint,
    conversation_updated_at timestamp,
    created_by_customer_id bigint,
    created_by_user_id bigint,
    action_text text,
    action_type text,
    assigned_to_id bigint,
    body text,
    created_at timestamp,
    created_by_type text,
    customer_id bigint,
    opened_at timestamp,
    saved_reply_id bigint,
    source_type text,
    source_via text,
    "state" text,
    "status" text,
    "type" text,
    PRIMARY KEY (id, conversation_id, conversation_updated_at),
    FOREIGN KEY (conversation_id) REFERENCES conversation_history(id),
    FOREIGN KEY (conversation_updated_at) REFERENCES conversation_history(updated_at),
    FOREIGN KEY (created_by_customer_id) REFERENCES customer_history(id),
    FOREIGN KEY (created_by_user_id) REFERENCES user_history(id)
);

CREATE TABLE happiness_rating (
    conversation_id bigint,
    rating_created_at timestamp,
    rating_customer_id bigint,
    number bigint,
    rating_comment text,
    rating_customer_name text,
    rating_id bigint,
    rating_user_id bigint,
    rating_user_name text,
    thread_created_at timestamp,
    thread_id bigint,
    "type" text,
    PRIMARY KEY (conversation_id, rating_created_at, rating_customer_id)
);
