CREATE TABLE profile (
    email_id text,
    history_id text,
    total_message text,
    total_thread text,
    PRIMARY KEY (email_id)
);

CREATE TABLE label (
    id text,
    background_color text,
    label_list_visibility text,
    message_list_visibility text,
    "name" text,
    text_color text,
    total_message text,
    total_thread text,
    "type" text,
    unread_message text,
    unread_thread text,
    PRIMARY KEY (id)
);

CREATE TABLE thread (
    id text,
    history_id text,
    snippet text,
    PRIMARY KEY (id)
);

CREATE TABLE message_sub_part_header (
    "index" text,
    message_id text,
    part_id text,
    sub_part_id text,
    "name" text,
    "value" text,
    PRIMARY KEY ("index", message_id, part_id, sub_part_id),
    FOREIGN KEY (message_id) REFERENCES message_payload_sub_part(message_id),
    FOREIGN KEY (part_id) REFERENCES message_payload_sub_part(part_id),
    FOREIGN KEY (sub_part_id) REFERENCES message_payload_sub_part(sub_part_id)
);

CREATE TABLE message_payload_sub_part_body (
    sub_nested_part_id text,
    message_id text,
    part_id text,
    sub_part_id text,
    attachment_id text,
    data text,
    filename text,
    headers jsonb,
    mime_type text,
    parts jsonb,
    "size" text,
    PRIMARY KEY (sub_nested_part_id, message_id, part_id, sub_part_id),
    FOREIGN KEY (message_id) REFERENCES message_payload_sub_part(message_id),
    FOREIGN KEY (part_id) REFERENCES message_payload_sub_part(part_id),
    FOREIGN KEY (sub_part_id) REFERENCES message_payload_sub_part(sub_part_id)
);

CREATE TABLE message_payload_sub_part (
    sub_part_id text,
    message_id text,
    part_id text,
    attachment_id text,
    data text,
    filename text,
    mime_type text,
    "size" text,
    PRIMARY KEY (sub_part_id, message_id, part_id),
    FOREIGN KEY (message_id) REFERENCES message_payload_part(message_id),
    FOREIGN KEY (part_id) REFERENCES message_payload_part(part_id)
);

CREATE TABLE message_payload_part_header (
    "index" text,
    message_id text,
    part_id text,
    "name" text,
    "value" text,
    PRIMARY KEY ("index", message_id, part_id),
    FOREIGN KEY (message_id) REFERENCES message_payload_part(message_id),
    FOREIGN KEY (part_id) REFERENCES message_payload_part(part_id)
);

CREATE TABLE message_payload_part (
    part_id text,
    message_id text,
    attachment_id text,
    data text,
    filename text,
    mime_type text,
    "size" text,
    PRIMARY KEY (part_id, message_id),
    FOREIGN KEY (message_id) REFERENCES message(id)
);

CREATE TABLE payload_header (
    "index" text,
    message_id text,
    "name" text,
    "value" text,
    PRIMARY KEY ("index", message_id),
    FOREIGN KEY (message_id) REFERENCES message(id)
);

CREATE TABLE message_label (
    "index" text,
    message_id text,
    label_id text,
    PRIMARY KEY ("index", message_id),
    FOREIGN KEY (message_id) REFERENCES message(id),
    FOREIGN KEY (label_id) REFERENCES label(id)
);

CREATE TABLE message (
    id text,
    thread_id text,
    history_id text,
    internal_date text,
    payload_attachment_id text,
    payload_body_data text,
    payload_body_size text,
    payload_file_name text,
    payload_mime_type text,
    payload_part_id text,
    size_estimate text,
    snippet text,
    PRIMARY KEY (id),
    FOREIGN KEY (thread_id) REFERENCES thread(id)
);
