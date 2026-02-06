CREATE TABLE metadata (
    context_variable_id text,
    created_date text,
    display_name text,
    modified_date text,
    PRIMARY KEY (context_variable_id)
);

CREATE TABLE conversation_history (
    id text,
    channel text,
    chat_duration text,
    chat_handoff text,
    chat_start_time text,
    chat_transcript jsonb,
    csat_feedback jsonb,
    csat_resolve text,
    csat_score text,
    generative_ai_used text,
    helpdesk_ticket_id text,
    is_deflected text,
    last_executed_intent text,
    last_executed_intent_user_query text,
    last_non_handoff_intent text,
    modified_date timestamp,
    -- context_variable_* (dynamic column),
    PRIMARY KEY (id)
);
