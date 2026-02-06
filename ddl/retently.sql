CREATE TABLE latest_score (
    _fivetran_id text,
    detractors text,
    detractors_count text,
    metrics_type text,
    passives text,
    passives_count text,
    promoters text,
    promoters_count text,
    score text,
    score_sum text,
    total_responses text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE customer_tag (
    tag_name text,
    customer_id text,
    PRIMARY KEY (tag_name, customer_id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE customer_property (
    "index" text,
    customer_id text,
    label text,
    "name" text,
    "type" text,
    "value" text,
    PRIMARY KEY ("index", customer_id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE customer (
    id text,
    company_id text,
    created_date text,
    email text,
    first_name text,
    last_name text,
    PRIMARY KEY (id),
    FOREIGN KEY (company_id) REFERENCES company(id)
);

CREATE TABLE template (
    id text,
    channel text,
    metric text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE campaign (
    id text,
    template_id text,
    channel text,
    is_active text,
    metric text,
    "name" text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (template_id) REFERENCES template(id)
);

CREATE TABLE outbox_additional_recipient (
    "index" text,
    customer_id text,
    mandrill_message_id text,
    email text,
    "type" text,
    PRIMARY KEY ("index", customer_id),
    FOREIGN KEY (customer_id) REFERENCES outbox(customer_id),
    FOREIGN KEY (mandrill_message_id) REFERENCES outbox(customer_id)
);

CREATE TABLE outbox_customer_tag (
    tag_name text,
    outbox_customer_id text,
    PRIMARY KEY (tag_name, outbox_customer_id),
    FOREIGN KEY (outbox_customer_id) REFERENCES outbox(customer_id)
);

CREATE TABLE outbox (
    customer_id text,
    campaign_id text,
    company_id text,
    survey_template_id text,
    channel text,
    detailed_status_has_feedback text,
    detailed_status_is_bounced text,
    detailed_status_is_opened text,
    detailed_status_is_opted_out text,
    detailed_status_is_responded text,
    detailed_status_opened_date text,
    detailed_status_responded_date text,
    email text,
    first_name text,
    last_name text,
    mandrill_message_id text,
    person_tags jsonb,
    sent_by text,
    sent_date text,
    "status" text,
    subject text,
    template_id text,
    -- custom_* (dynamic column),
    PRIMARY KEY (customer_id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (survey_template_id) REFERENCES template(id)
);

CREATE TABLE report_question_stats (
    uuid text,
    report_campaign_id text,
    is_on_main text,
    is_starred text,
    metrics_type text,
    "position" text,
    stats_first_day text,
    stats_first_detractors text,
    stats_first_opened text,
    stats_first_passives text,
    stats_first_promoters text,
    stats_first_responded text,
    stats_first_score text,
    stats_first_score_sum text,
    stats_first_skipped text,
    stats_first_total text,
    stats_last_day text,
    stats_last_detractors text,
    stats_last_opened text,
    stats_last_passives text,
    stats_last_promoters text,
    stats_last_responded text,
    stats_last_score text,
    stats_last_score_sum text,
    stats_last_skipped text,
    stats_last_total text,
    title text,
    PRIMARY KEY (uuid, report_campaign_id),
    FOREIGN KEY (report_campaign_id) REFERENCES report(campaign_id)
);

CREATE TABLE report_trend (
    "index" text,
    report_campaign_id text,
    "day" text,
    detractor text,
    passive text,
    promoter text,
    score text,
    total text,
    PRIMARY KEY ("index", report_campaign_id),
    FOREIGN KEY (report_campaign_id) REFERENCES report(campaign_id)
);

CREATE TABLE report (
    campaign_id text,
    delivery_stats_id text,
    delivery_stats_is_bounced text,
    delivery_stats_opened text,
    delivery_stats_opted_out text,
    delivery_stats_responded text,
    delivery_stats_total_count text,
    detractor text,
    passive text,
    promoter text,
    score text,
    total text,
    PRIMARY KEY (campaign_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id)
);

CREATE TABLE company_tag (
    tag_name text,
    company_id text,
    PRIMARY KEY (tag_name, company_id),
    FOREIGN KEY (company_id) REFERENCES company(id)
);

CREATE TABLE company (
    id text,
    contacts_count text,
    created_date text,
    cx_metrics_ces text,
    cx_metrics_csat text,
    cx_metrics_nps text,
    cx_metrics_star text,
    cx_metrics_xsa text,
    domain text,
    industry_name text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE feedback_note (
    "index" text,
    feedback_id text,
    author text,
    content text,
    "date" text,
    metrics_type text,
    PRIMARY KEY ("index", feedback_id),
    FOREIGN KEY (feedback_id) REFERENCES feedback(id)
);

CREATE TABLE feedback_additional_question (
    "index" text,
    feedback_id text,
    answer text,
    consent text,
    metrics_type text,
    question_text text,
    title text,
    "type" text,
    PRIMARY KEY ("index", feedback_id),
    FOREIGN KEY (feedback_id) REFERENCES feedback(id)
);

CREATE TABLE feedback_tag (
    tag_name text,
    feedback_id text,
    PRIMARY KEY (tag_name, feedback_id),
    FOREIGN KEY (feedback_id) REFERENCES feedback(id)
);

CREATE TABLE feedback_topic (
    "index" text,
    feedback_id text,
    "name" text,
    sentiment text,
    PRIMARY KEY ("index", feedback_id),
    FOREIGN KEY (feedback_id) REFERENCES feedback(id)
);

CREATE TABLE feedback_response_tag (
    tag_name text,
    feedback_id text,
    PRIMARY KEY (tag_name, feedback_id),
    FOREIGN KEY (feedback_id) REFERENCES feedback(id)
);

CREATE TABLE feedback (
    id text,
    campaign_id text,
    company_id text,
    customer_id text,
    assigned text,
    channel text,
    checkbox text,
    city text,
    "comment" text,
    country text,
    created_date text,
    email text,
    first_name text,
    is_bogus text,
    job_title text,
    last_name text,
    metrics_type text,
    rating_category text,
    resolved text,
    score text,
    "state" text,
    "status" text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (company_id) REFERENCES company(id),
    FOREIGN KEY (customer_id) REFERENCES customer(id)
);
