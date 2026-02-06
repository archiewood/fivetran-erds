CREATE TABLE contact (
    id text,
    city text,
    company text,
    country text,
    email text,
    first_name text,
    job_title text,
    last_name text,
    phone text,
    postal_code text,
    "state" text,
    street_address text,
    PRIMARY KEY (id)
);

CREATE TABLE document_field (
    id text,
    document_id text,
    assigned_to text,
    field_id text,
    merge_field text,
    "name" text,
    placeholder text,
    title text,
    "type" text,
    "value" text,
    PRIMARY KEY (id, document_id),
    FOREIGN KEY (document_id) REFERENCES document(id),
    FOREIGN KEY (assigned_to) REFERENCES document_recipient(id)
);

CREATE TABLE document_tag (
    "name" text,
    document_id text,
    PRIMARY KEY ("name", document_id),
    FOREIGN KEY (document_id) REFERENCES document(id)
);

CREATE TABLE document_token (
    "name" text,
    document_id text,
    "value" text,
    PRIMARY KEY ("name", document_id),
    FOREIGN KEY (document_id) REFERENCES document(id)
);

CREATE TABLE document_recipient_role (
    id text,
    document_id text,
    document_recipient_id text,
    PRIMARY KEY (id, document_id, document_recipient_id),
    FOREIGN KEY (document_id) REFERENCES document_recipient(document_id),
    FOREIGN KEY (document_recipient_id) REFERENCES document_recipient(id)
);

CREATE TABLE document_recipient (
    id text,
    document_id text,
    contact_id text,
    has_completed boolean,
    passcode text,
    phone_verification text,
    redirect_is_enabled text,
    redirect_url text,
    shared_link text,
    signature_date text,
    signing_order bigint,
    "type" text,
    verification_place text,
    PRIMARY KEY (id, document_id),
    FOREIGN KEY (document_id) REFERENCES document(id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE document_pricing_table_item (
    "index" text,
    document_id text,
    document_pricing_table_id text,
    cost double precision,
    description text,
    discount text,
    id text,
    "name" text,
    price double precision,
    qty double precision,
    sale_price double precision,
    sku text,
    subtotal text,
    tax_first text,
    tax_second text,
    -- custom_* (dynamic column),
    PRIMARY KEY ("index", document_id, document_pricing_table_id),
    FOREIGN KEY (document_id) REFERENCES document_pricing_table(document_id),
    FOREIGN KEY (document_pricing_table_id) REFERENCES document_pricing_table(id)
);

CREATE TABLE document_pricing_table_column (
    "index" bigint,
    document_id text,
    document_pricing_table_id text,
    header text,
    hidden boolean,
    merge_name text,
    "name" text,
    PRIMARY KEY ("index", document_id, document_pricing_table_id),
    FOREIGN KEY (document_id) REFERENCES document_pricing_table(document_id),
    FOREIGN KEY (document_pricing_table_id) REFERENCES document_pricing_table(id)
);

CREATE TABLE document_pricing_table (
    id text,
    document_id text,
    currency text,
    is_included_in_total text,
    "name" text,
    summary_discount text,
    summary_subtotal text,
    summary_tax text,
    summary_total text,
    total text,
    PRIMARY KEY (id, document_id),
    FOREIGN KEY (document_id) REFERENCES document(id)
);

CREATE TABLE document_pricing_quote_recurring_subtotal (
    "index" text,
    document_id text,
    document_pricing_quote_id text,
    billing_cycle text,
    "value" text,
    PRIMARY KEY ("index", document_id, document_pricing_quote_id),
    FOREIGN KEY (document_id) REFERENCES document_pricing_quote(document_id),
    FOREIGN KEY (document_pricing_quote_id) REFERENCES document_pricing_quote(id)
);

CREATE TABLE document_pricing_quote_section_recurring_subtotal (
    "index" text,
    document_id text,
    document_pricing_quote_id text,
    document_pricing_quote_section_id text,
    billing_cycle text,
    "value" text,
    PRIMARY KEY ("index", document_id, document_pricing_quote_id, document_pricing_quote_section_id),
    FOREIGN KEY (document_id) REFERENCES document_pricing_quote_section(document_id),
    FOREIGN KEY (document_pricing_quote_id) REFERENCES document_pricing_quote_section(document_pricing_quote_id),
    FOREIGN KEY (document_pricing_quote_section_id) REFERENCES document_pricing_quote_section(id)
);

CREATE TABLE document_pricing_quote_section_column (
    "index" bigint,
    "name" text,
    document_id text,
    document_pricing_quote_id text,
    document_pricing_quote_section_id text,
    header text,
    hidden boolean,
    merge_name text,
    PRIMARY KEY ("index", "name", document_id, document_pricing_quote_id, document_pricing_quote_section_id),
    FOREIGN KEY (document_id) REFERENCES document_pricing_quote_section(document_id),
    FOREIGN KEY (document_pricing_quote_id) REFERENCES document_pricing_quote_section(document_pricing_quote_id),
    FOREIGN KEY (document_pricing_quote_section_id) REFERENCES document_pricing_quote_section(id)
);

CREATE TABLE document_pricing_quote_section_item (
    "index" text,
    document_id text,
    document_pricing_quote_id text,
    document_pricing_quote_section_id text,
    billing_frequency text,
    contract_term text,
    cost double precision,
    discounts_property_1_type text,
    discounts_property_1_value text,
    discounts_property_2_type text,
    discounts_property_2_value text,
    fees_property_1_type text,
    fees_property_1_value text,
    fees_property_2_type text,
    fees_property_2_value text,
    id text,
    "name" text,
    price double precision,
    pricing_method text,
    property_1 text,
    property_2 text,
    qty double precision,
    qty_editable text,
    reference_type text,
    selected text,
    sku text,
    tax_property_1_type text,
    tax_property_1_value text,
    tax_property_2_type text,
    tax_property_2_value text,
    "type" text,
    PRIMARY KEY ("index", document_id, document_pricing_quote_id, document_pricing_quote_section_id),
    FOREIGN KEY (document_id) REFERENCES document_pricing_quote_section(document_id),
    FOREIGN KEY (document_pricing_quote_id) REFERENCES document_pricing_quote_section(document_pricing_quote_id),
    FOREIGN KEY (document_pricing_quote_section_id) REFERENCES document_pricing_quote_section(id)
);

CREATE TABLE document_pricing_quote_section (
    id text,
    document_id text,
    document_pricing_quote_id text,
    "name" text,
    summary_discounts jsonb,
    summary_fees jsonb,
    summary_one_time_subtotal text,
    summary_subtotal text,
    summary_taxes jsonb,
    summary_total text,
    summary_total_qty text,
    summary_total_section_value text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id, document_id, document_pricing_quote_id),
    FOREIGN KEY (document_id) REFERENCES document_pricing_quote(document_id),
    FOREIGN KEY (document_pricing_quote_id) REFERENCES document_pricing_quote(id)
);

CREATE TABLE document_pricing_quote_merge_rule_condition_comparison (
    "index" text,
    document_id text,
    document_pricing_quote_id text,
    document_pricing_quote_merge_rule_id text,
    "type" text,
    "value" text,
    PRIMARY KEY ("index", document_id, document_pricing_quote_id, document_pricing_quote_merge_rule_id),
    FOREIGN KEY (document_id) REFERENCES document_pricing_quote(document_id),
    FOREIGN KEY (document_pricing_quote_id) REFERENCES document_pricing_quote_merge_rule(document_pricing_quote_id),
    FOREIGN KEY (document_pricing_quote_merge_rule_id) REFERENCES document_pricing_quote_merge_rule(id)
);

CREATE TABLE document_pricing_quote_merge_rule (
    id text,
    document_id text,
    document_pricing_quote_id text,
    action_section_id text,
    action_type text,
    condition_field_name text,
    condition_type text,
    enabled text,
    PRIMARY KEY (id, document_id, document_pricing_quote_id),
    FOREIGN KEY (document_id) REFERENCES document_pricing_quote(document_id),
    FOREIGN KEY (document_pricing_quote_id) REFERENCES document_pricing_quote(id)
);

CREATE TABLE document_pricing_quote (
    id text,
    document_id text,
    currency text,
    discounts_property_1_type text,
    discounts_property_1_value text,
    discounts_property_2_type text,
    discounts_property_2_value text,
    settings_selection_type text,
    summary_fees jsonb,
    summary_one_time_subtotal text,
    summary_subtotal text,
    summary_taxes jsonb,
    summary_total text,
    summary_total_contract_value text,
    summary_total_discount text,
    summary_total_fee text,
    summary_total_qty text,
    summary_total_savings text,
    summary_total_tax text,
    total text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id, document_id),
    FOREIGN KEY (document_id) REFERENCES document(id)
);

CREATE TABLE document_linked_object (
    id text,
    document_id text,
    entity_id text,
    entity_type text,
    provider text,
    PRIMARY KEY (id, document_id),
    FOREIGN KEY (document_id) REFERENCES document(id)
);

CREATE TABLE document (
    id text,
    created_by text,
    sent_by text,
    template_id text,
    approval_execution text,
    autonumbering_sequence_name_prefix text,
    content_date_modified text,
    date_completed timestamp,
    date_created timestamp,
    date_modified timestamp,
    date_sent text,
    expiration_date timestamp,
    grand_total_amount double precision,
    grand_total_currency text,
    "name" text,
    ref_number text,
    "status" text,
    version text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES member(id),
    FOREIGN KEY (sent_by) REFERENCES member(id),
    FOREIGN KEY (template_id) REFERENCES template(id)
);

CREATE TABLE template_token (
    "name" text,
    template_id text,
    "value" text,
    PRIMARY KEY ("name", template_id),
    FOREIGN KEY (template_id) REFERENCES template(id)
);

CREATE TABLE template_tag (
    "name" text,
    template_id text,
    PRIMARY KEY ("name", template_id),
    FOREIGN KEY (template_id) REFERENCES template(id)
);

CREATE TABLE template_role (
    id text,
    template_id text,
    "name" text,
    preassigned_person text,
    signing_order bigint,
    PRIMARY KEY (id, template_id),
    FOREIGN KEY (template_id) REFERENCES template(id)
);

CREATE TABLE template_field (
    id text,
    template_id text,
    assigned_to text,
    field_identifier text,
    "name" text,
    placeholder text,
    title text,
    "type" text,
    "value" text,
    PRIMARY KEY (id, template_id),
    FOREIGN KEY (template_id) REFERENCES template(id),
    FOREIGN KEY (assigned_to) REFERENCES template_role(id)
);

CREATE TABLE template_pricing_table_item (
    "index" text,
    template_id text,
    template_pricing_table_id text,
    cost double precision,
    description text,
    discount text,
    id text,
    "name" text,
    price double precision,
    qty double precision,
    sale_price double precision,
    sku text,
    subtotal text,
    tax_first text,
    tax_second text,
    -- custom_* (dynamic column),
    PRIMARY KEY ("index", template_id, template_pricing_table_id),
    FOREIGN KEY (template_id) REFERENCES template_pricing_table(template_id),
    FOREIGN KEY (template_pricing_table_id) REFERENCES template_pricing_table(id)
);

CREATE TABLE template_pricing_table_column (
    "index" bigint,
    template_id text,
    template_pricing_table_id text,
    header text,
    hidden boolean,
    merge_name text,
    "name" text,
    PRIMARY KEY ("index", template_id, template_pricing_table_id),
    FOREIGN KEY (template_id) REFERENCES template_pricing_table(template_id),
    FOREIGN KEY (template_pricing_table_id) REFERENCES template_pricing_table(id)
);

CREATE TABLE template_pricing_table (
    id text,
    template_id text,
    currency text,
    is_included_in_total text,
    "name" text,
    total text,
    PRIMARY KEY (id, template_id),
    FOREIGN KEY (template_id) REFERENCES template(id)
);

CREATE TABLE template_pricing_quote_recurring_subtotal (
    "index" text,
    template_id text,
    template_pricing_quote_id text,
    billing_cycle text,
    "value" text,
    PRIMARY KEY ("index", template_id, template_pricing_quote_id),
    FOREIGN KEY (template_id) REFERENCES template_pricing_quote(template_id),
    FOREIGN KEY (template_pricing_quote_id) REFERENCES template_pricing_quote(id)
);

CREATE TABLE template_pricing_quote_section_recurring_subtotal (
    "index" text,
    template_id text,
    template_pricing_quote_id text,
    template_pricing_quote_section_id text,
    billing_cycle text,
    "value" text,
    PRIMARY KEY ("index", template_id, template_pricing_quote_id, template_pricing_quote_section_id),
    FOREIGN KEY (template_id) REFERENCES template_pricing_quote_section(template_id),
    FOREIGN KEY (template_pricing_quote_id) REFERENCES template_pricing_quote_section(template_pricing_quote_id),
    FOREIGN KEY (template_pricing_quote_section_id) REFERENCES template_pricing_quote_section(id)
);

CREATE TABLE template_pricing_quote_section (
    id text,
    template_id text,
    template_pricing_quote_id text,
    "name" text,
    summary_discounts jsonb,
    summary_fees jsonb,
    summary_one_time_subtotal text,
    summary_subtotal text,
    summary_taxes jsonb,
    summary_total text,
    summary_total_qty text,
    summary_total_section_value text,
    total text,
    PRIMARY KEY (id, template_id, template_pricing_quote_id),
    FOREIGN KEY (template_id) REFERENCES template_pricing_quote(template_id),
    FOREIGN KEY (template_pricing_quote_id) REFERENCES template_pricing_quote(id)
);

CREATE TABLE template_pricing_quote_merge_rule_condition_comparison (
    "index" text,
    template_id text,
    template_pricing_quote_id text,
    template_pricing_quote_merge_rule_id text,
    "type" text,
    "value" text,
    PRIMARY KEY ("index", template_id, template_pricing_quote_id, template_pricing_quote_merge_rule_id),
    FOREIGN KEY (template_id) REFERENCES template_pricing_quote_merge_rule(template_id),
    FOREIGN KEY (template_pricing_quote_id) REFERENCES template_pricing_quote_merge_rule(template_pricing_quote_id),
    FOREIGN KEY (template_pricing_quote_merge_rule_id) REFERENCES template_pricing_quote_merge_rule(id)
);

CREATE TABLE template_pricing_quote_merge_rule (
    id text,
    template_id text,
    template_pricing_quote_id text,
    action_section_id text,
    action_type text,
    condition_field_name text,
    condition_type text,
    enabled text,
    PRIMARY KEY (id, template_id, template_pricing_quote_id),
    FOREIGN KEY (template_id) REFERENCES template_pricing_quote(template_id),
    FOREIGN KEY (template_pricing_quote_id) REFERENCES template_pricing_quote(id)
);

CREATE TABLE template_pricing_quote (
    id text,
    template_id text,
    currency text,
    settings_selection_type text,
    summary_fees jsonb,
    summary_one_time_subtotal text,
    summary_subtotal text,
    summary_taxes jsonb,
    summary_total text,
    summary_total_contract_value text,
    summary_total_discount text,
    summary_total_fee text,
    summary_total_qty text,
    summary_total_savings text,
    summary_total_tax text,
    total text,
    PRIMARY KEY (id, template_id),
    FOREIGN KEY (template_id) REFERENCES template(id)
);

CREATE TABLE template_image_url (
    url text,
    template_id text,
    template_image_block_uuid text,
    PRIMARY KEY (url, template_id, template_image_block_uuid),
    FOREIGN KEY (template_id) REFERENCES template_image(template_id),
    FOREIGN KEY (template_image_block_uuid) REFERENCES template_image(block_uuid)
);

CREATE TABLE template_image (
    block_uuid text,
    template_id text,
    "name" text,
    PRIMARY KEY (block_uuid, template_id),
    FOREIGN KEY (template_id) REFERENCES template(id)
);

CREATE TABLE template_content_placeholder (
    uuid text,
    template_id text,
    block_id text,
    description text,
    PRIMARY KEY (uuid, template_id),
    FOREIGN KEY (template_id) REFERENCES template(id)
);

CREATE TABLE template (
    id text,
    created_by text,
    content_date_modified text,
    date_created timestamp,
    date_modified timestamp,
    "name" text,
    version text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES member(id)
);

CREATE TABLE member (
    id text,
    date_created timestamp,
    date_modified timestamp,
    email text,
    email_verified boolean,
    first_name text,
    is_active boolean,
    last_name text,
    membership_id text,
    "role" text,
    user_license text,
    workspace text,
    workspace_name text,
    PRIMARY KEY (id)
);

CREATE TABLE form (
    id text,
    date_created timestamp,
    date_modified timestamp,
    "name" text,
    "status" text,
    PRIMARY KEY (id)
);

CREATE TABLE content_library_item_token (
    "name" text,
    content_library_item_id text,
    "value" text,
    PRIMARY KEY ("name", content_library_item_id),
    FOREIGN KEY (content_library_item_id) REFERENCES content_library_item(id)
);

CREATE TABLE content_library_item_tag (
    "name" text,
    content_library_item_id text,
    PRIMARY KEY ("name", content_library_item_id),
    FOREIGN KEY (content_library_item_id) REFERENCES content_library_item(id)
);

CREATE TABLE content_library_item_role (
    id text,
    content_library_item_id text,
    "name" text,
    preassigned_person text,
    signing_order bigint,
    PRIMARY KEY (id, content_library_item_id),
    FOREIGN KEY (content_library_item_id) REFERENCES content_library_item(id)
);

CREATE TABLE content_library_item_field (
    id text,
    content_library_item_id text,
    assigned_to text,
    field_identifier text,
    "name" text,
    placeholder text,
    title text,
    "type" text,
    "value" text,
    PRIMARY KEY (id, content_library_item_id),
    FOREIGN KEY (content_library_item_id) REFERENCES content_library_item(id)
);

CREATE TABLE content_library_item_pricing_table_item (
    "index" text,
    content_library_item_id text,
    content_library_item_pricing_table_id text,
    cost double precision,
    description text,
    discount text,
    id text,
    "name" text,
    price double precision,
    qty double precision,
    sale_price double precision,
    sku text,
    subtotal text,
    tax_first text,
    tax_second text,
    -- custom_* (dynamic column),
    PRIMARY KEY ("index", content_library_item_id, content_library_item_pricing_table_id),
    FOREIGN KEY (content_library_item_id) REFERENCES content_library_item_pricing_table(content_library_item_id),
    FOREIGN KEY (content_library_item_pricing_table_id) REFERENCES content_library_item_pricing_table(id)
);

CREATE TABLE content_library_item_pricing_table (
    id text,
    content_library_item_id text,
    currency text,
    is_included_in_total text,
    "name" text,
    total text,
    PRIMARY KEY (id, content_library_item_id),
    FOREIGN KEY (content_library_item_id) REFERENCES content_library_item(id)
);

CREATE TABLE content_library_item_image_url (
    url text,
    content_library_item_id text,
    content_library_item_image_block_uuid text,
    PRIMARY KEY (url, content_library_item_id, content_library_item_image_block_uuid),
    FOREIGN KEY (content_library_item_id) REFERENCES content_library_item_image(content_library_item_id),
    FOREIGN KEY (content_library_item_image_block_uuid) REFERENCES content_library_item_image(block_uuid)
);

CREATE TABLE content_library_item_image (
    block_uuid text,
    content_library_item_id text,
    "name" text,
    PRIMARY KEY (block_uuid, content_library_item_id),
    FOREIGN KEY (content_library_item_id) REFERENCES content_library_item(id)
);

CREATE TABLE content_library_item_content_placeholder (
    uuid text,
    content_library_item_id text,
    block_id text,
    description text,
    PRIMARY KEY (uuid, content_library_item_id),
    FOREIGN KEY (content_library_item_id) REFERENCES content_library_item(id)
);

CREATE TABLE content_library_item (
    id text,
    created_by text,
    date_created timestamp,
    date_modified timestamp,
    "name" text,
    version text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES member(id)
);
