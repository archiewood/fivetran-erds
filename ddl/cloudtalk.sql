CREATE TABLE contact_attribute (
    id text,
    contact_id text,
    title text,
    "value" text,
    PRIMARY KEY (id, contact_id),
    FOREIGN KEY (contact_id) REFERENCES contact(id)
);

CREATE TABLE contact (
    id text,
    company text,
    contact_number_country_code_id text,
    contact_number_id text,
    contact_number_public_number text,
    email text,
    "name" text,
    PRIMARY KEY (id)
);

CREATE TABLE agent_associated_number (
    "index" text,
    agent_id text,
    associated_number text,
    PRIMARY KEY ("index", agent_id),
    FOREIGN KEY (agent_id) REFERENCES agent(id)
);

CREATE TABLE agent (
    id text,
    call_number_id text,
    availability_status text,
    daily_price_limit text,
    default_number text,
    email text,
    extension text,
    firstname text,
    is_daily_limit_ok text,
    lastname text,
    "name" text,
    status_outbound text,
    PRIMARY KEY (id),
    FOREIGN KEY (call_number_id) REFERENCES number(id)
);

CREATE TABLE group_statistics (
    id text,
    abandon_rate text,
    answered text,
    avg_call_duration text,
    avg_waiting_time text,
    max_waiting_time text,
    "name" text,
    operator text,
    real_time_avg_abandonment_time text,
    real_time_avg_waiting_time text,
    real_time_max_waiting_time text,
    real_time_waiting_queue text,
    unanswered text,
    PRIMARY KEY (id)
);

CREATE TABLE campaign_button (
    id text,
    campaign_id text,
    color text,
    description text,
    title text,
    "type" text,
    PRIMARY KEY (id, campaign_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id)
);

CREATE TABLE campaign_contact_tag (
    id text,
    campaign_id text,
    "name" text,
    PRIMARY KEY (id, campaign_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id)
);

CREATE TABLE campaign_agent (
    campaign_id text,
    id text,
    fullname text,
    PRIMARY KEY (campaign_id, id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (id) REFERENCES agent(id)
);

CREATE TABLE campaign_group (
    campaign_id text,
    id text,
    internal_name text,
    PRIMARY KEY (campaign_id, id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (id) REFERENCES group_statistics(id)
);

CREATE TABLE campaign (
    id text,
    after_call_dialing_auto text,
    after_call_time text,
    answer_wait_time text,
    attempt text,
    attempt_interval text,
    has_schedule_date text,
    is_predictive text,
    is_recording text,
    "name" text,
    "status" text,
    PRIMARY KEY (id)
);

CREATE TABLE number (
    id text,
    area_code text,
    caller_id_e_164 text,
    connected_to text,
    country_code text,
    internal_name text,
    is_redirected text,
    PRIMARY KEY (id)
);

CREATE TABLE call_history_agent_group (
    "index" text,
    call_history_id text,
    group_id text,
    PRIMARY KEY ("index", call_history_id),
    FOREIGN KEY (call_history_id) REFERENCES call_history(id)
);

CREATE TABLE call_history_contact_tag (
    id text,
    call_history_id text,
    "name" text,
    PRIMARY KEY (id, call_history_id),
    FOREIGN KEY (call_history_id) REFERENCES call_history(id)
);

CREATE TABLE call_history_contact_external_url (
    "index" text,
    call_history_id text,
    external_system text,
    external_url text,
    PRIMARY KEY ("index", call_history_id),
    FOREIGN KEY (call_history_id) REFERENCES call_history(id)
);

CREATE TABLE call_history_contact_number (
    "index" text,
    call_history_id text,
    contact_number text,
    PRIMARY KEY ("index", call_history_id),
    FOREIGN KEY (call_history_id) REFERENCES call_history(id)
);

CREATE TABLE call_history_rating (
    id text,
    call_history_id text,
    rating text,
    "type" text,
    PRIMARY KEY (id, call_history_id),
    FOREIGN KEY (call_history_id) REFERENCES call_history(id)
);

CREATE TABLE call_history_note (
    id text,
    call_history_id text,
    "name" text,
    PRIMARY KEY (id, call_history_id),
    FOREIGN KEY (call_history_id) REFERENCES call_history(id)
);

CREATE TABLE call_history_tag (
    id text,
    call_history_id text,
    "name" text,
    PRIMARY KEY (id, call_history_id),
    FOREIGN KEY (call_history_id) REFERENCES call_history(id)
);

CREATE TABLE call_history (
    id text,
    agent_id text,
    call_number_id text,
    contact_id text,
    favorite_agent_id text,
    answered_at text,
    billsec text,
    contact_address text,
    contact_city text,
    contact_industry text,
    contact_state text,
    contact_title text,
    contact_type text,
    contact_zip text,
    country_code text,
    ended_at text,
    favorite_agent_default_outbound_number text,
    favorite_agent_fullname text,
    favorite_agent_language text,
    favorite_agent_role text,
    favorite_agent_status text,
    fax_email text,
    is_local text,
    is_redirected text,
    is_voicemail text,
    price text,
    public_external text,
    public_internal text,
    recorded text,
    recording_link text,
    redirected_from text,
    started_at text,
    talking_time text,
    transferred_from text,
    "type" text,
    user_id text,
    waiting_time text,
    wrapup_time text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (agent_id) REFERENCES agent(id),
    FOREIGN KEY (call_number_id) REFERENCES number(id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (favorite_agent_id) REFERENCES agent(id)
);

CREATE TABLE comprehensive_call_tag (
    id text,
    comprehensive_call_uuid text,
    label text,
    PRIMARY KEY (id, comprehensive_call_uuid),
    FOREIGN KEY (comprehensive_call_uuid) REFERENCES comprehensive_call(uuid)
);

CREATE TABLE comprehensive_call_step_type (
    "type" text,
    comprehensive_call_uuid text,
    PRIMARY KEY ("type", comprehensive_call_uuid),
    FOREIGN KEY (comprehensive_call_uuid) REFERENCES comprehensive_call(uuid)
);

CREATE TABLE comprehensive_call (
    uuid text,
    cdr_id text,
    contact_id text,
    internal_id text,
    call_rating text,
    call_time_ringing_time text,
    call_time_talking_time text,
    call_time_total_time text,
    call_time_waiting_time text,
    call_time_wrap_up_time text,
    company_id text,
    contact_country text,
    contact_name text,
    contact_number text,
    contact_redirected_from text,
    contact_redirected_to text,
    "date" text,
    direction text,
    internal_name text,
    internal_number text,
    is_anonymous text,
    note jsonb,
    out_of_office text,
    recorded text,
    "status" text,
    "type" text,
    PRIMARY KEY (uuid),
    FOREIGN KEY (cdr_id) REFERENCES call_history(id),
    FOREIGN KEY (contact_id) REFERENCES contact(id),
    FOREIGN KEY (internal_id) REFERENCES number(id)
);

CREATE TABLE comprehensive_call_step_transfer (
    _fivetran_id text,
    comprehensive_call_uuid text,
    "date" text,
    endpoint text,
    id text,
    "status" text,
    "type" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (comprehensive_call_uuid) REFERENCES comprehensive_call(uuid)
);

CREATE TABLE comprehensive_call_step_playback (
    _fivetran_id text,
    comprehensive_call_uuid text,
    "date" text,
    file text,
    id text,
    total_time text,
    "type" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (comprehensive_call_uuid) REFERENCES comprehensive_call(uuid)
);

CREATE TABLE comprehensive_call_step_agent_group_id (
    "index" text,
    _fivetran_id text,
    comprehensive_call_step_agent_comprehensive_call_uuid text,
    group_id text,
    PRIMARY KEY ("index", _fivetran_id, comprehensive_call_step_agent_comprehensive_call_uuid),
    FOREIGN KEY (_fivetran_id) REFERENCES comprehensive_call_step_agent(_fivetran_id),
    FOREIGN KEY (comprehensive_call_step_agent_comprehensive_call_uuid) REFERENCES comprehensive_call_step_agent(comprehensive_call_uuid),
    FOREIGN KEY (group_id) REFERENCES group_statistics(id)
);

CREATE TABLE comprehensive_call_step_agent (
    _fivetran_id text,
    call_id text,
    comprehensive_call_uuid text,
    resolved_by_call_agent_id text,
    call_time_ringing_time text,
    call_time_talking_time text,
    call_time_total_time text,
    call_time_waiting_time text,
    call_time_wrap_up_time text,
    "date" text,
    id text,
    "name" text,
    reason text,
    resolved_by text,
    resolved_by_call_date text,
    resolved_by_call_id text,
    "status" text,
    "type" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (call_id) REFERENCES comprehensive_call(uuid),
    FOREIGN KEY (comprehensive_call_uuid) REFERENCES comprehensive_call(uuid),
    FOREIGN KEY (resolved_by_call_agent_id) REFERENCES agent(id)
);

CREATE TABLE comprehensive_call_step_ivr (
    _fivetran_id text,
    comprehensive_call_uuid text,
    "date" text,
    id text,
    "option" text,
    total_time text,
    "type" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (comprehensive_call_uuid) REFERENCES comprehensive_call(uuid)
);

CREATE TABLE comprehensive_call_step_queue_agent_call_group_id (
    "index" text,
    _fivetran_id text,
    comprehensive_call_step_queue_agent_call_id text,
    comprehensive_step_queue_uuid text,
    group_id text,
    PRIMARY KEY ("index", _fivetran_id, comprehensive_call_step_queue_agent_call_id, comprehensive_step_queue_uuid),
    FOREIGN KEY (_fivetran_id) REFERENCES comprehensive_call_step_queue_agent_call(_fivetran_id),
    FOREIGN KEY (comprehensive_call_step_queue_agent_call_id) REFERENCES comprehensive_call_step_queue_agent_call(id),
    FOREIGN KEY (comprehensive_step_queue_uuid) REFERENCES comprehensive_call_step_queue_agent_call(comprehensive_call_step_queue_comprehensive_call_uuid),
    FOREIGN KEY (group_id) REFERENCES group_statistics(id)
);

CREATE TABLE comprehensive_call_step_queue_agent_call (
    id text,
    _fivetran_id text,
    comprehensive_call_step_queue_comprehensive_call_uuid text,
    call_id text,
    "date" text,
    "name" text,
    reason text,
    resolved_by text,
    "status" text,
    "type" text,
    PRIMARY KEY (id, _fivetran_id, comprehensive_call_step_queue_comprehensive_call_uuid),
    FOREIGN KEY (_fivetran_id) REFERENCES comprehensive_call_step_queue(_fivetran_id),
    FOREIGN KEY (comprehensive_call_step_queue_comprehensive_call_uuid) REFERENCES comprehensive_call_step_queue(comprehensive_call_uuid)
);

CREATE TABLE comprehensive_call_step_queue (
    _fivetran_id text,
    comprehensive_call_uuid text,
    resolved_by_call_agent_id text,
    call_time_ringing_time text,
    call_time_talking_time text,
    call_time_total_time text,
    call_time_waiting_time text,
    call_time_wrap_up_time text,
    "date" text,
    id text,
    "name" text,
    reason text,
    resolved_by text,
    resolved_by_call_date text,
    resolved_by_call_id text,
    "status" text,
    strategy text,
    "type" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (comprehensive_call_uuid) REFERENCES comprehensive_call(uuid),
    FOREIGN KEY (resolved_by_call_agent_id) REFERENCES agent(id)
);
