CREATE TABLE evaluation_collaborator (
    collaborator_id text,
    evaluation_id text,
    PRIMARY KEY (collaborator_id, evaluation_id),
    FOREIGN KEY (evaluation_id) REFERENCES evaluation(id)
);

CREATE TABLE evaluation_section_answer (
    _fivetran_id text,
    evaluation_id text,
    evaluation_section_id text,
    answer_id text,
    answer_type text,
    "comment" text,
    feedback jsonb,
    question_id text,
    "value" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (evaluation_id) REFERENCES evaluation_section(evaluation_id),
    FOREIGN KEY (evaluation_section_id) REFERENCES evaluation_section(id)
);

CREATE TABLE evaluation_section_custom_field (
    id text,
    evaluation_id text,
    evaluation_section_id text,
    "value" text,
    PRIMARY KEY (id, evaluation_id, evaluation_section_id),
    FOREIGN KEY (evaluation_id) REFERENCES evaluation_section(evaluation_id),
    FOREIGN KEY (evaluation_section_id) REFERENCES evaluation_section(id)
);

CREATE TABLE evaluation_section (
    id text,
    evaluation_id text,
    "comment" text,
    passed text,
    score text,
    type_fail text,
    PRIMARY KEY (id, evaluation_id),
    FOREIGN KEY (evaluation_id) REFERENCES evaluation(id)
);

CREATE TABLE evaluation_custom_field (
    id text,
    evaluation_id text,
    "value" text,
    PRIMARY KEY (id, evaluation_id),
    FOREIGN KEY (evaluation_id) REFERENCES evaluation(id)
);

CREATE TABLE evaluation_coaching (
    coaching_id text,
    evaluation_id text,
    coaching_sequence text,
    PRIMARY KEY (coaching_id, evaluation_id),
    FOREIGN KEY (evaluation_id) REFERENCES evaluation(id)
);

CREATE TABLE evaluation_subscriber (
    evaluation_id text,
    subscriber_id text,
    PRIMARY KEY (evaluation_id, subscriber_id),
    FOREIGN KEY (evaluation_id) REFERENCES evaluation(id),
    FOREIGN KEY (subscriber_id) REFERENCES users(id)
);

CREATE TABLE evaluation (
    id text,
    agent_id text,
    calibration_id text,
    monitor_id text,
    scorecard_id text,
    team_id text,
    team_leader_id text,
    agent_agree text,
    attachments jsonb,
    comments jsonb,
    created_at text,
    date_created text,
    entity_id text,
    evaluation_time text,
    event_subtype text,
    event_type text,
    feedback text,
    interaction_id text,
    migrated text,
    passed text,
    reference text,
    rules_applied jsonb,
    schedule_date text,
    score text,
    score_avg text,
    "sequence" text,
    site_id text,
    "status" text,
    total_errors text,
    "type" text,
    updated_at timestamp,
    workload_history_id text,
    workload_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (agent_id) REFERENCES users(id),
    FOREIGN KEY (calibration_id) REFERENCES calibration(id),
    FOREIGN KEY (monitor_id) REFERENCES users(id),
    FOREIGN KEY (scorecard_id) REFERENCES scorecard(id),
    FOREIGN KEY (team_id) REFERENCES team(id),
    FOREIGN KEY (team_leader_id) REFERENCES users(id)
);

CREATE TABLE coaching_coach_id (
    coach_id text,
    coaching_id text,
    PRIMARY KEY (coach_id, coaching_id),
    FOREIGN KEY (coach_id) REFERENCES users(id),
    FOREIGN KEY (coaching_id) REFERENCES coaching(id)
);

CREATE TABLE coaching_team (
    coaching_id text,
    team_id text,
    PRIMARY KEY (coaching_id, team_id),
    FOREIGN KEY (coaching_id) REFERENCES coaching(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE coaching_collaborator (
    collaborator_id text,
    coaching_id text,
    PRIMARY KEY (collaborator_id, coaching_id),
    FOREIGN KEY (coaching_id) REFERENCES coaching(id)
);

CREATE TABLE coaching_coach_log_interaction (
    _fivetran_id text,
    coaching_id text,
    "date" text,
    followup text,
    opens text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (coaching_id) REFERENCES coaching(id)
);

CREATE TABLE coaching_trainee_log_interaction (
    _fivetran_id text,
    coaching_id text,
    "date" text,
    followup text,
    opens text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (coaching_id) REFERENCES coaching(id)
);

CREATE TABLE coaching_evaluation (
    coaching_id text,
    evaluation_id text,
    PRIMARY KEY (coaching_id, evaluation_id),
    FOREIGN KEY (coaching_id) REFERENCES coaching(id),
    FOREIGN KEY (evaluation_id) REFERENCES evaluation(id)
);

CREATE TABLE coaching_kpi (
    id text,
    coaching_id text,
    threshold_value text,
    PRIMARY KEY (id, coaching_id),
    FOREIGN KEY (coaching_id) REFERENCES coaching(id)
);

CREATE TABLE coaching (
    id text,
    trainee_id text,
    achieved text,
    attachments jsonb,
    coach_log_last_followup text,
    coach_log_total_followups text,
    coach_log_total_opens text,
    created_at text,
    custom_area_id text,
    custom_area_title text,
    data_after_end text,
    data_after_start text,
    data_before_end text,
    data_before_start text,
    ent_id text,
    entity_id text,
    entity_type text,
    feedback text,
    flag_coach text,
    follow_up text,
    form_id text,
    messages_read text,
    messages_total text,
    satisfaction jsonb,
    scorecard_id text,
    scorecard_name text,
    scorecard_status text,
    seen_coach text,
    seen_trainee text,
    "sequence" text,
    site_id text,
    snapshots jsonb,
    stage_id text,
    "status" text,
    trainee_agree_date text,
    trainee_agree_signed text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (trainee_id) REFERENCES users(id)
);

CREATE TABLE user_role (
    "index" text,
    user_id text,
    "role" text,
    PRIMARY KEY ("index", user_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE user_status_log (
    _fivetran_id text,
    user_id text,
    changed_by text,
    ended_to text,
    reason text,
    started_from text,
    "status" text,
    "type" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    created_by text,
    assigned_last_date_reward text,
    auth_hash text,
    auth_overwrite jsonb,
    avatar text,
    change_password text,
    created_at text,
    created_at_readable text,
    current_ui text,
    deactivated_by text,
    deactivation_reason text,
    deactivation_type text,
    email text,
    ent_id text,
    external_profile jsonb,
    first_login_date text,
    founder text,
    full_name text,
    google_id text,
    ignore_notifications jsonb,
    integration_intercom text,
    interaction_scorecard text,
    invisible text,
    lang text,
    languages jsonb,
    last_feed_view jsonb,
    last_login_date text,
    last_name text,
    last_notifications_view text,
    last_seen_at text,
    light text,
    "name" text,
    onboarding_completed text,
    profile_about_me text,
    profile_birthdate text,
    profile_start_date text,
    provisioning jsonb,
    saml_id text,
    site_id text,
    stats text,
    "status" text,
    time_zone_id text,
    times_assigned_reward text,
    total_invitations_sent text,
    "type" text,
    tz text,
    updated_at timestamp,
    updated_at_readable text,
    username text,
    -- custom_* (dynamic column),
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES users(id)
);

CREATE TABLE integration (
    id text,
    created_by text,
    created_at text,
    description text,
    ent_id text,
    metadata jsonb,
    "name" text,
    settings_data_storage_minutes text,
    settings_delete_only_non_audited_interactions text,
    site_id text,
    "status" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES users(id)
);

CREATE TABLE campaign_user (
    campaign_id text,
    user_id text,
    PRIMARY KEY (campaign_id, user_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE campaign_data_source (
    id text,
    campaign_id text,
    connector_id text,
    "type" text,
    PRIMARY KEY (id, campaign_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id)
);

CREATE TABLE campaign_kpi (
    id text,
    campaign_id text,
    code text,
    custom_ranges_colors text,
    custom_threshold_value text,
    "name" text,
    threshold_direction text,
    threshold_value text,
    "type" text,
    unit_id text,
    weight text,
    PRIMARY KEY (id, campaign_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id)
);

CREATE TABLE campaign_team_leader_info (
    id text,
    campaign_id text,
    avatar text,
    email text,
    last_name text,
    "name" text,
    "status" text,
    username text,
    PRIMARY KEY (id, campaign_id),
    FOREIGN KEY (campaign_id) REFERENCES campaign(id)
);

CREATE TABLE campaign (
    id text,
    created_at text,
    created_at_readable text,
    created_by text,
    default_filters text,
    is_published text,
    latest_entry text,
    "name" text,
    site_id text,
    "status" text,
    team_id text,
    updated_at timestamp,
    updated_at_readable text,
    PRIMARY KEY (id)
);

CREATE TABLE job_completed (
    id text,
    job_id text,
    interaction_id text,
    PRIMARY KEY (id, job_id),
    FOREIGN KEY (job_id) REFERENCES job(id)
);

CREATE TABLE job_failed (
    "index" text,
    job_id text,
    error text,
    interaction_id text,
    PRIMARY KEY ("index", job_id),
    FOREIGN KEY (job_id) REFERENCES job(id)
);

CREATE TABLE job (
    id text,
    created_at text,
    created_by text,
    ent_id text,
    site_id text,
    "status" text,
    total text,
    total_completed text,
    total_failed text,
    updated_at text,
    PRIMARY KEY (id)
);

CREATE TABLE course_record (
    id text,
    activity_id text,
    created_at text,
    extra_finished text,
    extra_finished_at text,
    learner_id text,
    progress text,
    "time" text,
    PRIMARY KEY (id)
);

CREATE TABLE role_read (
    "index" text,
    role_id text,
    "read" text,
    PRIMARY KEY ("index", role_id),
    FOREIGN KEY (role_id) REFERENCES "role"(id)
);

CREATE TABLE role_write (
    "index" text,
    role_id text,
    "write" text,
    PRIMARY KEY ("index", role_id),
    FOREIGN KEY (role_id) REFERENCES "role"(id)
);

CREATE TABLE "role" (
    id text,
    code text,
    created_at text,
    created_at_readable text,
    defaults text,
    description text,
    "name" text,
    role_inherit text,
    site_id text,
    updated_at timestamp,
    updated_at_readable text,
    PRIMARY KEY (id)
);

CREATE TABLE scorecard_team (
    scorecard_id text,
    team_id text,
    PRIMARY KEY (scorecard_id, team_id),
    FOREIGN KEY (scorecard_id) REFERENCES scorecard(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE scorecard_section_question_answer_feedback_option (
    id text,
    scorecard_answer_id text,
    scorecard_feedback_id text,
    scorecard_id text,
    scorecard_question_id text,
    scorecard_section_id text,
    "value" text,
    PRIMARY KEY (id, scorecard_answer_id, scorecard_feedback_id, scorecard_id, scorecard_question_id, scorecard_section_id),
    FOREIGN KEY (scorecard_answer_id) REFERENCES scorecard_section_question_answer_feedback(scorecard_answer_id),
    FOREIGN KEY (scorecard_feedback_id) REFERENCES scorecard_section_question_answer_feedback(id),
    FOREIGN KEY (scorecard_id) REFERENCES scorecard_section_question_answer_feedback(scorecard_id),
    FOREIGN KEY (scorecard_question_id) REFERENCES scorecard_section_question_answer_feedback(scorecard_question_id),
    FOREIGN KEY (scorecard_section_id) REFERENCES scorecard_section_question_answer_feedback(scorecard_section_id)
);

CREATE TABLE scorecard_section_question_answer_feedback (
    id text,
    scorecard_answer_id text,
    scorecard_id text,
    scorecard_question_id text,
    scorecard_section_id text,
    label text,
    required text,
    "type" text,
    PRIMARY KEY (id, scorecard_answer_id, scorecard_id, scorecard_question_id, scorecard_section_id),
    FOREIGN KEY (scorecard_answer_id) REFERENCES scorecard_section_question_answer(id),
    FOREIGN KEY (scorecard_id) REFERENCES scorecard_section_question_answer(scorecard_id),
    FOREIGN KEY (scorecard_question_id) REFERENCES scorecard_section_question_answer(scorecard_question_id),
    FOREIGN KEY (scorecard_section_id) REFERENCES scorecard_section_question_answer(scorecard_section_id)
);

CREATE TABLE scorecard_section_question_answer (
    id text,
    scorecard_id text,
    scorecard_question_id text,
    scorecard_section_id text,
    format text,
    group_fail text,
    label text,
    "type" text,
    "value" text,
    PRIMARY KEY (id, scorecard_id, scorecard_question_id, scorecard_section_id),
    FOREIGN KEY (scorecard_id) REFERENCES scorecard_section_question(scorecard_id),
    FOREIGN KEY (scorecard_question_id) REFERENCES scorecard_section_question(id),
    FOREIGN KEY (scorecard_section_id) REFERENCES scorecard_section_question(scorecard_section_id)
);

CREATE TABLE scorecard_section_question (
    id text,
    scorecard_id text,
    scorecard_section_id text,
    component text,
    description text,
    group_id text,
    step text,
    tip text,
    "type" text,
    PRIMARY KEY (id, scorecard_id, scorecard_section_id),
    FOREIGN KEY (scorecard_id) REFERENCES scorecard_section(scorecard_id),
    FOREIGN KEY (scorecard_section_id) REFERENCES scorecard_section(id)
);

CREATE TABLE scorecard_section (
    id text,
    scorecard_id text,
    max_score text,
    "name" text,
    "type" text,
    weight text,
    PRIMARY KEY (id, scorecard_id),
    FOREIGN KEY (scorecard_id) REFERENCES scorecard(id)
);

CREATE TABLE scorecard_custom_field_option (
    id text,
    scorecard_custom_field_id text,
    scorecard_id text,
    "value" text,
    PRIMARY KEY (id, scorecard_custom_field_id, scorecard_id),
    FOREIGN KEY (scorecard_custom_field_id) REFERENCES scorecard_custom_field(id),
    FOREIGN KEY (scorecard_id) REFERENCES scorecard_custom_field(scorecard_id)
);

CREATE TABLE scorecard_custom_field (
    id text,
    scorecard_id text,
    label text,
    operation text,
    required text,
    "type" text,
    PRIMARY KEY (id, scorecard_id),
    FOREIGN KEY (scorecard_id) REFERENCES scorecard(id)
);

CREATE TABLE scorecard (
    id text,
    checkbox_threshold text,
    cloned_from text,
    created_at text,
    created_at_readable text,
    created_by text,
    custom_reports jsonb,
    description text,
    effectiveness_goal text,
    evaluations_scheduled text,
    last_evaluation text,
    last_evaluation_readable text,
    max_score text,
    "name" text,
    pre_check_answers text,
    reference_name text,
    reference_required text,
    site_id text,
    "status" text,
    target text,
    total_questions text,
    two_steps_approval text,
    "type" text,
    updated_at timestamp,
    updated_at_readable text,
    PRIMARY KEY (id)
);

CREATE TABLE course_skill (
    id text,
    course_id text,
    title text,
    PRIMARY KEY (id, course_id),
    FOREIGN KEY (course_id) REFERENCES course(id)
);

CREATE TABLE course (
    id text,
    created_by text,
    approval_percent text,
    created_at text,
    deadline_date text,
    deadline_days text,
    deadline_type text,
    enrollment_approval text,
    order_type text,
    public text,
    site_id text,
    "status" text,
    title text,
    updated_at timestamp,
    PRIMARY KEY (id),
    FOREIGN KEY (created_by) REFERENCES users(id)
);

CREATE TABLE calibration_analyst_section_question (
    id text,
    calibration_analyst_id text,
    calibration_analyst_section_id text,
    calibration_id text,
    is_calibrated text,
    PRIMARY KEY (id, calibration_analyst_id, calibration_analyst_section_id, calibration_id),
    FOREIGN KEY (calibration_analyst_id) REFERENCES calibration_analyst_section(calibration_analyst_id),
    FOREIGN KEY (calibration_analyst_section_id) REFERENCES calibration_analyst_section(id),
    FOREIGN KEY (calibration_id) REFERENCES calibration_analyst_section(calibration_id)
);

CREATE TABLE calibration_analyst_section (
    id text,
    calibration_analyst_id text,
    calibration_id text,
    percentage text,
    type_fail text,
    PRIMARY KEY (id, calibration_analyst_id, calibration_id),
    FOREIGN KEY (calibration_analyst_id) REFERENCES calibration_analyst(id),
    FOREIGN KEY (calibration_id) REFERENCES calibration_analyst(calibration_id)
);

CREATE TABLE calibration_analyst (
    calibration_id text,
    id text,
    qa_score text,
    results_answers_equals text,
    results_answers_score text,
    scorecard_answer_date text,
    scorecard_answer_id text,
    PRIMARY KEY (calibration_id, id),
    FOREIGN KEY (calibration_id) REFERENCES calibration(id),
    FOREIGN KEY (id) REFERENCES users(id)
);

CREATE TABLE calibration_collaborator (
    calibration_id text,
    collaborator_id text,
    PRIMARY KEY (calibration_id, collaborator_id),
    FOREIGN KEY (calibration_id) REFERENCES calibration(id),
    FOREIGN KEY (collaborator_id) REFERENCES users(id)
);

CREATE TABLE calibration_category (
    category_id text,
    calibration_id text,
    PRIMARY KEY (category_id, calibration_id),
    FOREIGN KEY (calibration_id) REFERENCES calibration(id)
);

CREATE TABLE calibration (
    id text,
    agent_id text,
    interaction_id text,
    scorecard_id text,
    team_id text,
    auto_fill_evaluation text,
    calibration_is_ready_to_update_after_completed text,
    category_ids text,
    comments text,
    completed_at text,
    created_at text,
    created_at_readable text,
    created_by text,
    due_date text,
    expert_id text,
    interaction_reference text,
    review_scorecard_id text,
    scorecard_answer_id_reference text,
    "sequence" text,
    site_id text,
    "status" text,
    summary_answers_score text,
    summary_answers_total text,
    "type" text,
    update_after_completed text,
    updated_at timestamp,
    updated_at_readable text,
    validate_fail_answers text,
    workload_history_id text,
    workload_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (agent_id) REFERENCES users(id),
    FOREIGN KEY (interaction_id) REFERENCES interaction(interaction_id),
    FOREIGN KEY (scorecard_id) REFERENCES scorecard(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE dispute_reason_comment (
    id text,
    dispute_id text,
    dispute_reason_id text,
    user_id text,
    created_at text,
    message text,
    PRIMARY KEY (id, dispute_id, dispute_reason_id),
    FOREIGN KEY (dispute_id) REFERENCES dispute_reason(dispute_id),
    FOREIGN KEY (dispute_reason_id) REFERENCES dispute_reason(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE dispute_reason (
    id text,
    dispute_id text,
    accepted text,
    answer_feedback text,
    answer_id text,
    answer_value text,
    parent_id text,
    parent_type text,
    previous_answer_id text,
    previous_answer_value text,
    reference_id text,
    reference_type text,
    PRIMARY KEY (id, dispute_id),
    FOREIGN KEY (dispute_id) REFERENCES dispute(id)
);

CREATE TABLE dispute_assignation_log (
    _fivetran_id text,
    dispute_id text,
    user_id text,
    assigned_at text,
    changed_by text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (dispute_id) REFERENCES dispute(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE dispute (
    id text,
    agent_id text,
    arbitrator_id text,
    requester_id text,
    responsible_id text,
    scorecard_id text,
    team_id text,
    category_ids jsonb,
    closed_at text,
    collaborator_ids jsonb,
    created_at text,
    ent_id text,
    entity_id text,
    entity_type text,
    evaluated_at text,
    expired_at text,
    last_opened_at text,
    previous_score text,
    resolution_for text,
    resolved_by text,
    score text,
    "sequence" text,
    site_id text,
    started_at timestamp,
    "status" text,
    total_reopens text,
    "type" text,
    updated_at text,
    PRIMARY KEY (id),
    FOREIGN KEY (agent_id) REFERENCES users(id),
    FOREIGN KEY (arbitrator_id) REFERENCES users(id),
    FOREIGN KEY (requester_id) REFERENCES users(id),
    FOREIGN KEY (responsible_id) REFERENCES users(id),
    FOREIGN KEY (scorecard_id) REFERENCES scorecard(id),
    FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE custom_field_option (
    id text,
    custom_field_id text,
    "value" text,
    PRIMARY KEY (id, custom_field_id),
    FOREIGN KEY (custom_field_id) REFERENCES custom_field(id)
);

CREATE TABLE custom_field (
    id text,
    code text,
    created_at text,
    created_by text,
    entity_type text,
    is_valid text,
    "name" text,
    "position" text,
    required text,
    site_id text,
    "type" text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE team_leader (
    team_id text,
    team_leader_id text,
    PRIMARY KEY (team_id, team_leader_id),
    FOREIGN KEY (team_id) REFERENCES team(id),
    FOREIGN KEY (team_leader_id) REFERENCES users(id)
);

CREATE TABLE team_user (
    team_id text,
    user_id text,
    PRIMARY KEY (team_id, user_id),
    FOREIGN KEY (team_id) REFERENCES team(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE team (
    id text,
    created_at text,
    created_by text,
    defaults text,
    description text,
    "name" text,
    site_id text,
    "status" text,
    total_users text,
    updated_at timestamp,
    PRIMARY KEY (id)
);

CREATE TABLE course_stat (
    id text,
    activities text,
    learners text,
    learners_completed text,
    learners_in_progress text,
    learners_not_started text,
    learners_overdue text,
    time_spent text,
    PRIMARY KEY (id)
);

CREATE TABLE workload_assignment_stat_interaction (
    "index" text,
    workload_assignment_id text,
    workload_assignment_stat_id text,
    evaluation_id text,
    user_id text,
    completed text,
    id text,
    PRIMARY KEY ("index", workload_assignment_id, workload_assignment_stat_id),
    FOREIGN KEY (workload_assignment_id) REFERENCES workload_assignment_stat(workload_assignment_id),
    FOREIGN KEY (workload_assignment_stat_id) REFERENCES workload_assignment_stat(id),
    FOREIGN KEY (evaluation_id) REFERENCES evaluation(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE workload_assignment_stat (
    id text,
    workload_assignment_id text,
    completed text,
    goal text,
    progress text,
    workload text,
    PRIMARY KEY (id, workload_assignment_id),
    FOREIGN KEY (workload_assignment_id) REFERENCES workload_assignment(id)
);

CREATE TABLE workload_assignment_filters (
    _fivetran_id text,
    workload_assignment_id text,
    field text,
    filterable text,
    groups text,
    label text,
    operator text,
    "type" text,
    "value" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (workload_assignment_id) REFERENCES workload_assignment(id)
);

CREATE TABLE workload_assignment (
    id text,
    created_at text,
    created_at_readable text,
    custom_data_assignation_date text,
    custom_data_connector_id text,
    custom_data_date_filter_field text,
    custom_data_days text,
    custom_data_due_date text,
    custom_data_entity text,
    custom_data_errors jsonb,
    custom_data_lock_date_range text,
    custom_data_pull_data text,
    custom_data_segment_id text,
    custom_data_type text,
    custom_data_users_without_interactions jsonb,
    ent_id text,
    normalized_interactions text,
    site_id text,
    "status" text,
    total_assigned_interactions text,
    total_expected_interactions text,
    "type" text,
    updated_at timestamp,
    updated_at_readable text,
    workload_id text,
    PRIMARY KEY (id)
);

CREATE TABLE interaction (
    id text,
    interaction_id text,
    integration_id text,
    assignee_id text,
    author_id text,
    collaborators jsonb,
    created_at text,
    created_by text,
    custom_ranges_colors text,
    ent_id text,
    interaction_date text,
    is_deleted text,
    priority text,
    site_id text,
    tags jsonb,
    "type" text,
    updated_at text,
    PRIMARY KEY (id, interaction_id),
    FOREIGN KEY (integration_id) REFERENCES integration(id)
);
