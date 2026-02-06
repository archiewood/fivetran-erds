CREATE TABLE property (
    id text,
    entity text,
    format text,
    "key" text,
    "name" text,
    "type" text,
    PRIMARY KEY (id)
);

CREATE TABLE offer (
    id text,
    amount_off text,
    apply_to text,
    coupon_type text,
    created_at text,
    days text,
    duration text,
    "interval" text,
    interval_count text,
    metadata jsonb,
    mode text,
    months text,
    "name" text,
    pause_at text,
    pause_subscription_metadata jsonb,
    payment_provider_coupon_id text,
    platform_coupon_id text,
    platform_plan_id text,
    prorate text,
    "type" text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE subscription_property (
    id text,
    subscription_id text,
    formatted_value text,
    "value" text,
    PRIMARY KEY (id, subscription_id),
    FOREIGN KEY (id) REFERENCES property(id),
    FOREIGN KEY (subscription_id) REFERENCES subscription(id)
);

CREATE TABLE subscription (
    id text,
    subscriber_id text,
    created_at text,
    mrr text,
    payment_provider_id text,
    platform_id text,
    "status" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (subscriber_id) REFERENCES subscriber(id)
);

CREATE TABLE flow_session_offer_presented (
    flow_session_id text,
    id text,
    PRIMARY KEY (flow_session_id, id),
    FOREIGN KEY (flow_session_id) REFERENCES flow_session(id),
    FOREIGN KEY (id) REFERENCES offer(id)
);

CREATE TABLE flow_session_answer (
    "index" text,
    flow_session_id text,
    question_id text,
    question_primary text,
    question_text text,
    question_type text,
    sentiment text,
    "value" jsonb,
    PRIMARY KEY ("index", flow_session_id),
    FOREIGN KEY (flow_session_id) REFERENCES flow_session(id)
);

CREATE TABLE flow_session_step (
    id text,
    flow_session_id text,
    completed_at text,
    started_at text,
    title text,
    "type" text,
    PRIMARY KEY (id, flow_session_id),
    FOREIGN KEY (flow_session_id) REFERENCES flow_session(id)
);

CREATE TABLE flow_session_deflected_by_deflection_action (
    id text,
    flow_session_id text,
    code text,
    detail_url text,
    "type" text,
    PRIMARY KEY (id, flow_session_id),
    FOREIGN KEY (flow_session_id) REFERENCES flow_session(id)
);

CREATE TABLE flow_session (
    id text,
    flow_id text,
    offer_accepted_id text,
    subscriber_id text,
    subscription_id text,
    cancel_reason_code text,
    cancel_reason_text text,
    client_url text,
    client_user_agent text,
    completed_at text,
    created_at text,
    deflected_by_action_code text,
    deflected_by_action_detail_url text,
    deflected_by_action_id text,
    deflected_by_action_type text,
    deflected_by_type text,
    offer_groups_presented jsonb,
    rerouted_from_flow_session_id text,
    started_at text,
    "status" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (flow_id) REFERENCES flow(id),
    FOREIGN KEY (offer_accepted_id) REFERENCES offer(id),
    FOREIGN KEY (subscriber_id) REFERENCES subscriber(id),
    FOREIGN KEY (subscription_id) REFERENCES subscription(id)
);

CREATE TABLE event (
    id text,
    data_id text,
    created_at text,
    event text,
    PRIMARY KEY (id),
    FOREIGN KEY (data_id) REFERENCES flow_session(id)
);

CREATE TABLE flow (
    id text,
    created_at text,
    "name" text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE subscriber_property (
    id text,
    subscriber_id text,
    formatted_value text,
    "value" text,
    PRIMARY KEY (id, subscriber_id),
    FOREIGN KEY (id) REFERENCES property(id),
    FOREIGN KEY (subscriber_id) REFERENCES subscriber(id)
);

CREATE TABLE subscriber (
    id text,
    created_at text,
    email text,
    "name" text,
    payment_provider_id text,
    platform_id text,
    "status" text,
    updated_at text,
    PRIMARY KEY (id)
);
