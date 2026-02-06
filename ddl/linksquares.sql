CREATE TABLE finalize_template_question_id (
    finalize_template_id text,
    question_id text,
    PRIMARY KEY (finalize_template_id, question_id),
    FOREIGN KEY (finalize_template_id) REFERENCES finalize_template(id),
    FOREIGN KEY (question_id) REFERENCES finalize_template_question(id)
);

CREATE TABLE finalize_template_token_id (
    finalize_template_id text,
    token_id text,
    PRIMARY KEY (finalize_template_id, token_id),
    FOREIGN KEY (finalize_template_id) REFERENCES finalize_template(id),
    FOREIGN KEY (token_id) REFERENCES finalize_template_token(id)
);

CREATE TABLE finalize_template (
    id text,
    created_at text,
    description text,
    instructions text,
    kind text,
    "name" text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE finalize_template_question_option (
    id text,
    finalize_template_id text,
    finalize_template_question_id text,
    description text,
    PRIMARY KEY (id, finalize_template_id, finalize_template_question_id),
    FOREIGN KEY (finalize_template_id) REFERENCES finalize_template_question(finalize_template_id),
    FOREIGN KEY (finalize_template_question_id) REFERENCES finalize_template_question(id)
);

CREATE TABLE finalize_template_question (
    finalize_template_id text,
    id text,
    answer_type text,
    attachment_id jsonb,
    description text,
    required text,
    PRIMARY KEY (finalize_template_id, id)
);

CREATE TABLE finalize_template_token_option (
    id text,
    finalize_template_id text,
    finalize_template_token_id text,
    "value" text,
    PRIMARY KEY (id, finalize_template_id, finalize_template_token_id),
    FOREIGN KEY (finalize_template_id) REFERENCES finalize_template_token(finalize_template_id),
    FOREIGN KEY (finalize_template_token_id) REFERENCES finalize_template_token(id)
);

CREATE TABLE finalize_template_token (
    finalize_template_id text,
    id text,
    clause_category_id text,
    clause_category_name text,
    kind text,
    question text,
    required text,
    PRIMARY KEY (finalize_template_id, id)
);

CREATE TABLE finalize_agreement_collaborator (
    collaborator_id text,
    finalize_agreement_id text,
    PRIMARY KEY (collaborator_id, finalize_agreement_id),
    FOREIGN KEY (finalize_agreement_id) REFERENCES finalize_agreement(id)
);

CREATE TABLE finalize_agreement_question (
    question_id text,
    finalize_agreement_id text,
    PRIMARY KEY (question_id, finalize_agreement_id),
    FOREIGN KEY (finalize_agreement_id) REFERENCES finalize_agreement(id)
);

CREATE TABLE finalize_agreement_token_value (
    token_value_id text,
    finalize_agreement_id text,
    PRIMARY KEY (token_value_id, finalize_agreement_id),
    FOREIGN KEY (finalize_agreement_id) REFERENCES finalize_agreement(id)
);

CREATE TABLE finalize_agreement_embedded_user (
    id text,
    finalize_agreement_id text,
    email text,
    first_name text,
    last_name text,
    PRIMARY KEY (id, finalize_agreement_id),
    FOREIGN KEY (finalize_agreement_id) REFERENCES finalize_agreement(id)
);

CREATE TABLE finalize_agreement_embedded_question_answer_selected_option (
    finalize_agreement_embedded_question_id text,
    finalize_agreement_id text,
    selected_option_id text,
    PRIMARY KEY (finalize_agreement_embedded_question_id, finalize_agreement_id, selected_option_id),
    FOREIGN KEY (finalize_agreement_embedded_question_id) REFERENCES finalize_agreement_embedded_question(id),
    FOREIGN KEY (finalize_agreement_id) REFERENCES finalize_agreement_embedded_question(finalize_agreement_id),
    FOREIGN KEY (selected_option_id) REFERENCES finalize_agreement_embedded_question_option(id)
);

CREATE TABLE finalize_agreement_embedded_question_attachment (
    attachment_id text,
    finalize_agreement_embedded_question_id text,
    finalize_agreement_id text,
    PRIMARY KEY (attachment_id, finalize_agreement_embedded_question_id, finalize_agreement_id),
    FOREIGN KEY (finalize_agreement_embedded_question_id) REFERENCES finalize_agreement_embedded_question(id),
    FOREIGN KEY (finalize_agreement_id) REFERENCES finalize_agreement_embedded_question(finalize_agreement_id)
);

CREATE TABLE finalize_agreement_embedded_question_option (
    id text,
    finalize_agreement_embedded_question_id text,
    finalize_agreement_id text,
    description text,
    PRIMARY KEY (id, finalize_agreement_embedded_question_id, finalize_agreement_id),
    FOREIGN KEY (finalize_agreement_embedded_question_id) REFERENCES finalize_agreement_embedded_question(id),
    FOREIGN KEY (finalize_agreement_id) REFERENCES finalize_agreement_embedded_question(finalize_agreement_id)
);

CREATE TABLE finalize_agreement_embedded_question (
    id text,
    finalize_agreement_id text,
    answer_id text,
    answer_type text,
    answer_value text,
    description text,
    required text,
    PRIMARY KEY (id, finalize_agreement_id),
    FOREIGN KEY (finalize_agreement_id) REFERENCES finalize_agreement(id)
);

CREATE TABLE finalize_agreement_embedded_token_value_selected_option (
    selected_option_id text,
    finalize_agreement_embedded_token_value_id text,
    finalize_agreement_id text,
    PRIMARY KEY (selected_option_id, finalize_agreement_embedded_token_value_id, finalize_agreement_id),
    FOREIGN KEY (finalize_agreement_embedded_token_value_id) REFERENCES finalize_agreement_embedded_token_value(id),
    FOREIGN KEY (finalize_agreement_id) REFERENCES finalize_agreement_embedded_token_value(finalize_agreement_id)
);

CREATE TABLE finalize_agreement_embedded_token_value (
    id text,
    finalize_agreement_id text,
    token_id text,
    "value" text,
    PRIMARY KEY (id, finalize_agreement_id),
    FOREIGN KEY (finalize_agreement_id) REFERENCES finalize_agreement(id)
);

CREATE TABLE finalize_agreement_embedded_status (
    id text,
    finalize_agreement_id text,
    description text,
    internal_enum text,
    "name" text,
    PRIMARY KEY (id, finalize_agreement_id),
    FOREIGN KEY (finalize_agreement_id) REFERENCES finalize_agreement(id)
);

CREATE TABLE finalize_agreement (
    id text,
    status_id text,
    template_id text,
    analyze_agreement_id text,
    author_id text,
    created_at text,
    kind text,
    "name" text,
    owner_id text,
    status_updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (status_id) REFERENCES finalize_status(id),
    FOREIGN KEY (template_id) REFERENCES finalize_template(id)
);

CREATE TABLE analyze_clause_category (
    id text,
    created_at text,
    "name" text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE finalize_status (
    id text,
    description text,
    internal_enum text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE finalize_agreement_attachment (
    id text,
    finalize_agreement_id text,
    created_at text,
    file_name text,
    PRIMARY KEY (id, finalize_agreement_id),
    FOREIGN KEY (finalize_agreement_id) REFERENCES finalize_agreement(id)
);

CREATE TABLE analyze_agreement_child_agreement (
    id text,
    "index" text,
    analyze_agreement_id text,
    PRIMARY KEY (id, "index", analyze_agreement_id),
    FOREIGN KEY (analyze_agreement_id) REFERENCES analyze_agreement(id)
);

CREATE TABLE analyze_agreement_tag (
    id text,
    analyze_agreement_id text,
    "name" text,
    PRIMARY KEY (id, analyze_agreement_id),
    FOREIGN KEY (analyze_agreement_id) REFERENCES analyze_agreement(id)
);

CREATE TABLE analyze_agreement_term (
    id text,
    analyze_agreement_id text,
    kind text,
    "name" text,
    "status" text,
    "value" text,
    PRIMARY KEY (id, analyze_agreement_id),
    FOREIGN KEY (analyze_agreement_id) REFERENCES analyze_agreement(id)
);

CREATE TABLE analyze_agreement (
    id text,
    type_id text,
    "name" text,
    original_name text,
    parent_agreement_id text,
    updated_date timestamp,
    upload_date text,
    uploaded_by text,
    PRIMARY KEY (id),
    FOREIGN KEY (type_id) REFERENCES analyze_agreement_type(id)
);

CREATE TABLE analyze_user (
    _fivetran_id text,
    "status" text,
    timestamps text,
    users text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE finalize_user (
    _fivetran_id text,
    "status" text,
    timestamps text,
    users text,
    PRIMARY KEY (_fivetran_id)
);

CREATE TABLE analyze_agreement_type (
    id text,
    is_smart text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE analyze_clause (
    id text,
    agreement_id text,
    clause_category_id text,
    author_name text,
    created_at text,
    "name" text,
    note text,
    text text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (agreement_id) REFERENCES analyze_agreement(id),
    FOREIGN KEY (clause_category_id) REFERENCES analyze_clause_category(id)
);

CREATE TABLE finalize_agreement_version (
    id text,
    finalize_agreement_id text,
    status_id text,
    created_at text,
    deleted_at text,
    file_name text,
    PRIMARY KEY (id, finalize_agreement_id),
    FOREIGN KEY (finalize_agreement_id) REFERENCES finalize_agreement(id),
    FOREIGN KEY (status_id) REFERENCES finalize_status(id)
);
