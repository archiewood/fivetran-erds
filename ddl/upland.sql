CREATE TABLE "call" (
    id text,
    mconnect_id text,
    profile_id text,
    call_status text,
    carrier_name text,
    connection_source text,
    destination_number text,
    duration text,
    email text,
    end_time text,
    handset_number text,
    legislator_district text,
    legislator_first_name text,
    legislator_last_name text,
    legislator_party text,
    legislator_state text,
    profile_status_at_call_time text,
    start_time text,
    transcription text,
    voicemail text,
    voicemail_duration text,
    voip_number text,
    PRIMARY KEY (id),
    FOREIGN KEY (mconnect_id) REFERENCES mconnect(id),
    FOREIGN KEY (profile_id) REFERENCES profile(id)
);

CREATE TABLE web_click (
    id text,
    tiny_url_id text,
    profile_id text,
    clicked_url text,
    created_at text,
    http_referer text,
    remote_addr text,
    url text,
    user_agent text,
    PRIMARY KEY (id, tiny_url_id),
    FOREIGN KEY (tiny_url_id) REFERENCES tiny_url(id),
    FOREIGN KEY (profile_id) REFERENCES profile(id)
);

CREATE TABLE groups (
    id text,
    hint text,
    "name" text,
    "size" text,
    "status" text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE tiny_url (
    id text,
    created_at text,
    description text,
    host text,
    "key" text,
    mode text,
    "name" text,
    url text,
    PRIMARY KEY (id)
);

CREATE TABLE message (
    id text,
    campaign_id text,
    profile text,
    approved text,
    body text,
    carrier_name text,
    mms text,
    multipart text,
    next_id text,
    previous_id text,
    received_at text,
    template_id text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (profile) REFERENCES profile(id)
);

CREATE TABLE mconnect (
    id text,
    tag_name text,
    active text,
    autoroute text,
    call_timeout text,
    call_type text,
    crm_alert_id text,
    destination_description text,
    destination_number text,
    failover_number text,
    failover_text text,
    "name" text,
    nonsubscriber_follow_up text,
    shortcode text,
    subscriber_follow_up text,
    transcribe text,
    voicemail text,
    voip_number text,
    PRIMARY KEY (id),
    FOREIGN KEY (tag_name) REFERENCES tags("name")
);

CREATE TABLE keyword (
    id text,
    active text,
    created_at text,
    ended_at text,
    "name" text,
    opted_in_path_id text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE mdata (
    id text,
    "name" text,
    "type" text,
    uuid text,
    PRIMARY KEY (id)
);

CREATE TABLE profile_subscription (
    _fivetran_id text,
    campaign_id text,
    opted_in_path_id text,
    profile_id text,
    activated_at text,
    created_at text,
    opted_in_source text,
    opted_out_at text,
    opted_out_source text,
    "status" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (opted_in_path_id) REFERENCES keyword(opted_in_path_id),
    FOREIGN KEY (profile_id) REFERENCES profile(id)
);

CREATE TABLE profile_custom_column (
    _fivetran_id text,
    profile_id text,
    created_at text,
    "name" text,
    text text,
    updated_at text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (profile_id) REFERENCES profile(id)
);

CREATE TABLE profile (
    id text,
    address_city text,
    address_country text,
    address_postal_code text,
    address_state text,
    address_street_1 text,
    address_street_2 text,
    congressional_district text,
    created_at text,
    email text,
    first_name text,
    integration text,
    last_name text,
    location_city text,
    location_country text,
    location_latitude text,
    location_longitude text,
    location_postal_code text,
    location_precision text,
    location_state text,
    phone_number text,
    source_email text,
    source_id text,
    source_name text,
    source_type text,
    split_district text,
    state_lower_district text,
    state_upper_district text,
    "status" text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE broadcast_excluded_group (
    broadcast_id text,
    group_id text,
    PRIMARY KEY (broadcast_id, group_id),
    FOREIGN KEY (broadcast_id) REFERENCES broadcast(id),
    FOREIGN KEY (group_id) REFERENCES groups(id)
);

CREATE TABLE broadcast_included_group (
    broadcast_id text,
    group_id text,
    PRIMARY KEY (broadcast_id, group_id),
    FOREIGN KEY (broadcast_id) REFERENCES broadcast(id),
    FOREIGN KEY (group_id) REFERENCES groups(id)
);

CREATE TABLE broadcast (
    id text,
    campaign_id text,
    tag_name text,
    automated text,
    body text,
    delivery_time text,
    estimated_recipients_count text,
    include_subscriber text,
    localtimes text,
    "name" text,
    opted_outs_count text,
    replies_count text,
    "status" text,
    throttled text,
    PRIMARY KEY (id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (tag_name) REFERENCES tags("name")
);

CREATE TABLE campaign_subscriber (
    id text,
    campaign_id text,
    profile_id text,
    activated_at text,
    opted_out_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (profile_id) REFERENCES profile(id)
);

CREATE TABLE mdata_entry (
    id text,
    mdata_id text,
    created_at text,
    input text,
    "output" text,
    PRIMARY KEY (id),
    FOREIGN KEY (mdata_id) REFERENCES mdata(id)
);

CREATE TABLE campaign_tag (
    campaign_id text,
    tag_name text,
    PRIMARY KEY (campaign_id, tag_name),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (tag_name) REFERENCES tags("name")
);

CREATE TABLE campaign (
    id text,
    active text,
    description text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE tag_taggable (
    id text,
    tag_id text,
    "type" text,
    PRIMARY KEY (id, tag_id),
    FOREIGN KEY (tag_id) REFERENCES tags(id)
);

CREATE TABLE tags (
    id text,
    "name" text,
    PRIMARY KEY (id)
);
