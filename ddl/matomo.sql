CREATE TABLE event_category (
    _fivetran_id text,
    id_site text,
    avg_event_value text,
    "date" text,
    id_sub_datatable text,
    label text,
    max_event_value text,
    min_event_value text,
    nb_events text,
    nb_events_with_value text,
    nb_visits text,
    segment text,
    sum_daily_nb_uniq_visitors text,
    sum_event_value text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (id_site) REFERENCES multi_site(id)
);

CREATE TABLE event_name (
    _fivetran_id text,
    id_site text,
    avg_event_value text,
    "date" text,
    id_subdata_table text,
    label text,
    max_event_value text,
    nb_events text,
    nb_events_with_value text,
    nb_visits text,
    segment text,
    sum_daily_nb_uniq_visitors text,
    sum_event_value text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (id_site) REFERENCES multi_site(id)
);

CREATE TABLE multi_site (
    id text,
    actions_evolution text,
    actions_evolution_trend text,
    currency_symbol text,
    groups text,
    label text,
    main_url text,
    nb_actions text,
    nb_page_views text,
    nb_visits text,
    page_views_evolution text,
    page_views_evolution_trend text,
    period_name text,
    previous_actions_nb_page_views text,
    previous_goal_revenue text,
    previous_nb_actions text,
    previous_nb_visits text,
    previous_range text,
    ratio text,
    revenue text,
    revenue_evolution text,
    revenue_evolution_trend text,
    visits_evolution text,
    visits_evolution_trend text,
    PRIMARY KEY (id)
);

CREATE TABLE event_action (
    _fivetran_id text,
    id_site text,
    avg_event_value text,
    "date" text,
    id_sub_datatable text,
    label text,
    max_event_value text,
    min_event_value text,
    nb_events text,
    nb_events_with_value text,
    nb_visits text,
    segment text,
    sum_daily_nb_uniq_visitors text,
    sum_event_value text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (id_site) REFERENCES multi_site(id)
);

CREATE TABLE insight_overview (
    _fivetran_id text,
    multi_site_id text,
    "date" text,
    difference text,
    grown text,
    growth_percent text,
    growth_percent_numeric text,
    importance text,
    is_disappeared text,
    is_mover text,
    is_mover_and_shaker text,
    is_new text,
    label text,
    nb_visits text,
    "type" text,
    value_new text,
    value_old text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (multi_site_id) REFERENCES multi_site(id)
);

CREATE TABLE visit_time (
    _fivetran_id text,
    multi_site_id text,
    bounce_count text,
    "date" text,
    day_of_week text,
    label text,
    nb_actions text,
    nb_uniq_visitors text,
    nb_users text,
    nb_visits text,
    nb_visits_converted text,
    sum_visit_length text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (multi_site_id) REFERENCES multi_site(id)
);

CREATE TABLE visitor_interest (
    _fivetran_id text,
    multi_site_id text,
    "date" text,
    label text,
    nb_visits text,
    segment text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (multi_site_id) REFERENCES multi_site(id)
);
