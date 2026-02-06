CREATE TABLE organization_detail_email_domain (
    _fivetran_id text,
    organization_detail_id text,
    domain text,
    verified text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (organization_detail_id) REFERENCES organization_detail(id)
);

CREATE TABLE organization_detail (
    id text,
    admin_oversight text,
    all_tags_visible text,
    ask_for_tag text,
    can_collaborator_sign text,
    contact_info_city text,
    contact_info_country text,
    contact_info_email text,
    contact_info_function text,
    contact_info_mobile text,
    contact_info_mobile_code text,
    contact_info_name text,
    contact_info_phone text,
    contact_info_phone_code text,
    contact_info_state text,
    contact_info_street text,
    contact_info_zip_code text,
    created_at text,
    deleted text,
    description text,
    "name" text,
    parent_id text,
    password_strategy text,
    region text,
    send_invitation_with_document text,
    signing_authentication_colleague text,
    signing_authentication_third_party text,
    subscription text,
    subsidiary jsonb,
    whilelisted_ip jsonb,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES organization(id)
);

CREATE TABLE signature (
    id text,
    agreement_uuid text,
    reservation_organization_id text,
    reservation_user_id text,
    reservation_email text,
    reservation_group_deleted text,
    reservation_group_id text,
    reservation_group_name text,
    reservation_type text,
    signature_date text,
    signature_info_email text,
    signature_info_font text,
    signature_info_image text,
    signature_info_job text,
    signature_info_name text,
    signature_info_organization text,
    signature_info_signature text,
    signature_type text,
    PRIMARY KEY (id, agreement_uuid),
    FOREIGN KEY (agreement_uuid) REFERENCES agreement(uuid),
    FOREIGN KEY (reservation_organization_id) REFERENCES organization(id),
    FOREIGN KEY (reservation_user_id) REFERENCES users(id)
);

CREATE TABLE event (
    id text,
    organization_id text,
    actor_email text,
    actor_has_avatar text,
    actor_id text,
    actor_job text,
    actor_name text,
    actor_organization text,
    actor_type text,
    created_at text,
    event_id text,
    event_name text,
    event_status text,
    event_type text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE organization_member_group (
    _fivetran_id text,
    id text,
    organization_id text,
    PRIMARY KEY (_fivetran_id, id),
    FOREIGN KEY (_fivetran_id) REFERENCES organization_member(_fivetran_id),
    FOREIGN KEY (id) REFERENCES organization_group(id),
    FOREIGN KEY (organization_id) REFERENCES organization_member(organization_id)
);

CREATE TABLE organization_member (
    _fivetran_id text,
    organization_id text,
    user_id text,
    created_at text,
    invitation text,
    invitation_created_at text,
    invitation_email text,
    invitation_id text,
    invitation_uuid text,
    job text,
    "type" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (organization_id) REFERENCES organization(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE folder_user (
    folder_id text,
    id text,
    job text,
    pictures_normal text,
    pictures_small text,
    pictures_special text,
    PRIMARY KEY (folder_id, id),
    FOREIGN KEY (folder_id) REFERENCES folder(id),
    FOREIGN KEY (id) REFERENCES users(id)
);

CREATE TABLE folder_team_user (
    folder_id text,
    folder_team_id text,
    id text,
    PRIMARY KEY (folder_id, folder_team_id, id),
    FOREIGN KEY (folder_id) REFERENCES folder(id),
    FOREIGN KEY (folder_team_id) REFERENCES folder_team(id),
    FOREIGN KEY (id) REFERENCES folder_user(id)
);

CREATE TABLE folder_team_invitation (
    folder_id text,
    folder_team_id text,
    id text,
    PRIMARY KEY (folder_id, folder_team_id, id),
    FOREIGN KEY (folder_id) REFERENCES folder(id),
    FOREIGN KEY (folder_team_id) REFERENCES folder_team(id),
    FOREIGN KEY (id) REFERENCES folder_invitation(id)
);

CREATE TABLE folder_team (
    id text,
    folder_id text,
    organization_id text,
    description text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (folder_id) REFERENCES folder(id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE folder_invitation (
    id text,
    folder_id text,
    created_at text,
    email text,
    uuid text,
    PRIMARY KEY (id, folder_id),
    FOREIGN KEY (folder_id) REFERENCES folder(id)
);

CREATE TABLE folder_children (
    id text,
    parent_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (parent_id) REFERENCES folder(id)
);

CREATE TABLE folder (
    id text,
    organization_id text,
    parent_id text,
    access_all_user_organization_access text,
    document_count text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (organization_id) REFERENCES organization(id),
    FOREIGN KEY (parent_id) REFERENCES folder(id)
);

CREATE TABLE organization_group_user (
    id text,
    organization_group_id text,
    PRIMARY KEY (id, organization_group_id),
    FOREIGN KEY (id) REFERENCES users(id),
    FOREIGN KEY (organization_group_id) REFERENCES organization_group(id)
);

CREATE TABLE organization_group_invitation (
    id text,
    organization_group_id text,
    created_at text,
    email text,
    uuid text,
    PRIMARY KEY (id, organization_group_id),
    FOREIGN KEY (organization_group_id) REFERENCES organization_group(id)
);

CREATE TABLE organization_group (
    id text,
    organization_id text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE organization_workflow_rule_validation (
    id text,
    organization_workflow_id text,
    organization_workflow_rule_id text,
    user_id text,
    user_organization_id text,
    groups text,
    "result" text,
    "status" text,
    "type" text,
    user_job text,
    PRIMARY KEY (id, organization_workflow_id, organization_workflow_rule_id),
    FOREIGN KEY (organization_workflow_id) REFERENCES organization_workflow(id),
    FOREIGN KEY (organization_workflow_rule_id) REFERENCES organization_workflow_rule(id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (user_organization_id) REFERENCES organization(id)
);

CREATE TABLE organization_workflow_rule (
    id text,
    organization_workflow_id text,
    active text,
    "condition" jsonb,
    "result" text,
    "status" text,
    "type" text,
    PRIMARY KEY (id, organization_workflow_id),
    FOREIGN KEY (organization_workflow_id) REFERENCES organization_workflow(id)
);

CREATE TABLE organization_workflow (
    id text,
    organization_id text,
    block_thirdparty_signature text,
    deletable text,
    description text,
    title text,
    PRIMARY KEY (id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE agreement_comment_reply (
    _fivetran_id text,
    agreement_comment_uuid text,
    created_at text,
    created_by_haspicture text,
    created_by_id text,
    created_by_name text,
    display_version text,
    text text,
    version text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (agreement_comment_uuid) REFERENCES agreement_comment(uuid)
);

CREATE TABLE agreement_comment (
    uuid text,
    agreement_uuid text,
    organization_id text,
    commented_text text,
    created_at text,
    created_by_has_picture text,
    created_by_id text,
    created_by_name text,
    display_version text,
    resolved text,
    text text,
    version text,
    visibility text,
    word_dataauthor text,
    word_datadate text,
    PRIMARY KEY (uuid),
    FOREIGN KEY (agreement_uuid) REFERENCES agreement(uuid),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE agreement_member (
    _fivetran_id text,
    agreement_uuid text,
    organization_id text,
    user_id text,
    last_access_at text,
    permission text,
    relation text,
    "status" text,
    user_sign_status text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (agreement_uuid) REFERENCES agreement(uuid),
    FOREIGN KEY (organization_id) REFERENCES organization(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE user_authority (
    "index" text,
    users_id text,
    authority text,
    PRIMARY KEY ("index", users_id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE users (
    id text,
    current_organization_id text,
    contact_cellphone text,
    contact_cellphone_code text,
    contact_workphone text,
    contact_workphone_code text,
    created_at text,
    email text,
    full_name text,
    has_password text,
    has_picture text,
    "name" text,
    timezone text,
    PRIMARY KEY (id),
    FOREIGN KEY (current_organization_id) REFERENCES organization(id)
);

CREATE TABLE tag_user (
    id text,
    tags_id text,
    job text,
    pictures_normal text,
    pictures_small text,
    pictures_special text,
    PRIMARY KEY (id, tags_id),
    FOREIGN KEY (id) REFERENCES users(id),
    FOREIGN KEY (tags_id) REFERENCES tags(id)
);

CREATE TABLE tag_user_group_member (
    id text,
    tag_user_group_id text,
    tags_id text,
    PRIMARY KEY (id, tag_user_group_id, tags_id),
    FOREIGN KEY (id) REFERENCES tag_user(id),
    FOREIGN KEY (tag_user_group_id) REFERENCES tag_user_group(id),
    FOREIGN KEY (tags_id) REFERENCES tags(id)
);

CREATE TABLE tag_uer_group_invitation (
    id text,
    tag_user_group_id text,
    tags_id text,
    PRIMARY KEY (id, tag_user_group_id, tags_id),
    FOREIGN KEY (id) REFERENCES tag_invitation(id),
    FOREIGN KEY (tag_user_group_id) REFERENCES tag_user_group(id),
    FOREIGN KEY (tags_id) REFERENCES tags(id)
);

CREATE TABLE tag_user_group (
    id text,
    tags_id text,
    description text,
    "name" text,
    PRIMARY KEY (id, tags_id),
    FOREIGN KEY (tags_id) REFERENCES tags(id)
);

CREATE TABLE tag_invitation (
    id text,
    tags_id text,
    created_at text,
    email text,
    uuid text,
    PRIMARY KEY (id, tags_id),
    FOREIGN KEY (tags_id) REFERENCES tags(id)
);

CREATE TABLE tags (
    id text,
    organization_id text,
    access_rule text,
    access_rule_all_user_organization_access text,
    access_rule_id text,
    count_contract_count text,
    count_draft_count text,
    count_id text,
    count_negotiation_count text,
    count_template_count text,
    counts text,
    in_access_rule text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE organization_branding (
    _fivetran_id text,
    organization_id text,
    custom_agreement_view_enabled text,
    custom_email_content_enabled text,
    custom_email_content_organization_name text,
    custom_email_content_url text,
    custom_email_sender_email text,
    custom_email_sender_enabled text,
    custom_email_sender_name text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE agreement_version_pdf_field (
    _fivetran_id text,
    agreement_version_id text,
    "name" text,
    placeholder text,
    "type" text,
    "value" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (agreement_version_id) REFERENCES agreement_version(id)
);

CREATE TABLE agreement_version_signature_field (
    _fivetran_id text,
    agreement_version_id text,
    item_id text,
    "name" text,
    page text,
    x text,
    y text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (agreement_version_id) REFERENCES agreement_version(id)
);

CREATE TABLE agreement_version (
    id text,
    agreement_uuid text,
    organization_id text,
    user_id text,
    "comment" text,
    creation_creator_active text,
    creation_creator_id text,
    creation_creator_job text,
    creation_date text,
    "date" text,
    display_version text,
    fillable_field text,
    pdf text,
    "type" text,
    version text,
    visibility text,
    PRIMARY KEY (id),
    FOREIGN KEY (agreement_uuid) REFERENCES agreement(uuid),
    FOREIGN KEY (organization_id) REFERENCES organization(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE agreement_summary_signed_with_label (
    "index" text,
    agreement_summary_id text,
    signed_with_label text,
    PRIMARY KEY ("index", agreement_summary_id),
    FOREIGN KEY (agreement_summary_id) REFERENCES agreement_summary(id)
);

CREATE TABLE agreement_summary_clause (
    id text,
    agreement_summary_id text,
    deadline text,
    event_duration text,
    financial_data_amount_unit text,
    financial_data_amount_value text,
    financial_data_before_tax text,
    financial_data_credit text,
    financial_data_percent text,
    financial_data_percent_from text,
    financial_data_percent_value text,
    length_unit text,
    length_value text,
    period_custom_end text,
    period_custom_start text,
    period_type text,
    period_unit text,
    period_value text,
    title text,
    PRIMARY KEY (id, agreement_summary_id),
    FOREIGN KEY (agreement_summary_id) REFERENCES agreement_summary(id)
);

CREATE TABLE agreement_summary_link_permission (
    "index" text,
    agreement_summary_id text,
    agreement_summary_link_id text,
    link_permission text,
    PRIMARY KEY ("index", agreement_summary_id, agreement_summary_link_id),
    FOREIGN KEY (agreement_summary_id) REFERENCES agreement_summary(id),
    FOREIGN KEY (agreement_summary_link_id) REFERENCES agreement_summary_link(id)
);

CREATE TABLE agreement_summary_link (
    id text,
    agreement_summary_id text,
    owner_has_access text,
    owner_id text,
    owner_status text,
    owner_title text,
    owner_uid text,
    target_has_access text,
    target_id text,
    target_status text,
    target_title text,
    target_uid text,
    "type" text,
    PRIMARY KEY (id, agreement_summary_id),
    FOREIGN KEY (agreement_summary_id) REFERENCES agreement_summary(id)
);

CREATE TABLE agreement_summary_end_clause (
    id text,
    agreement_summary_id text,
    agreement_uid text,
    after_renewal_auto_generate text,
    after_renewal_custom_start_date text,
    after_renewal_deadline text,
    after_renewal_duration_unit text,
    after_renewal_duration_value text,
    after_renewal_event text,
    auto_generated text,
    contract_id text,
    contract_renewal_type text,
    created_at text,
    created_by_full_name text,
    created_by_id text,
    createdby_email text,
    createdby_haspicture text,
    custom_start_date text,
    deadline text,
    early_termination_notice_period_unit text,
    early_termination_notice_period_value text,
    event_duration text,
    length_unit text,
    length_value text,
    modified_at text,
    modified_by_email text,
    modified_by_fullname text,
    modified_by_haspicture text,
    modified_by_id text,
    modified_by_name text,
    next_end_clause_id text,
    notice_period_unit text,
    notice_period_value text,
    period_custom_end text,
    period_custom_start text,
    period_type text,
    period_unit text,
    previous_end_clause_id text,
    renewal_count_remaining text,
    start_date text,
    "type" text,
    PRIMARY KEY (id, agreement_summary_id),
    FOREIGN KEY (agreement_summary_id) REFERENCES agreement_summary(id),
    FOREIGN KEY (agreement_uid) REFERENCES agreement(uuid)
);

CREATE TABLE agreement_summary (
    id text,
    agreement_uid text,
    organization_id text,
    description text,
    lifecycle_calculated_end text,
    lifecycle_effect_date text,
    lifecycle_effect_type text,
    lifecycle_signature_date text,
    lifecycle_signature_date_unknown text,
    lifecycle_terminate text,
    lifecycle_termination_at_end text,
    lifecycle_termination_date text,
    lifecycle_termination_notified_at text,
    lifecycle_termination_notified_by_email text,
    lifecycle_termination_notified_by_fullname text,
    lifecycle_termination_notified_by_id text,
    PRIMARY KEY (id),
    FOREIGN KEY (agreement_uid) REFERENCES agreement(uuid),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE organization_subsidary (
    id text,
    organization_id text,
    "name" text,
    subscription text,
    PRIMARY KEY (id, organization_id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE organization (
    id text,
    created_at text,
    featuresaccess_rule text,
    featuresadmin_oversight text,
    featuresamendment text,
    featuresanalytics text,
    featuresapi text,
    featuresaudit_trail text,
    featuresauto_template text,
    featuresbulk_upload text,
    featuresclause_library text,
    featurescomplex_password text,
    featurescustom_branding text,
    featurescustom_role text,
    featuresdata_localization text,
    featuresdedicated_encryption_key text,
    featuresdrafting text,
    featuresexecution text,
    featuresinternal_workflow text,
    featuresorganization_field_item text,
    featuresreport text,
    featuressend_invitation_with_document text,
    featuressignature text,
    featuressubsidiaries text,
    featuresuser_group text,
    featuresversioning text,
    featureswhitelisted_ip text,
    featuresworkflow_center text,
    is_parent text,
    is_subsidiary text,
    "name" text,
    parent_id text,
    rightsaccess_all_agreement text,
    rightscontract_access text,
    rightscontract_attachment text,
    rightscontract_create text,
    rightscontract_create_bulk text,
    rightscontract_delete text,
    rightscontract_update text,
    rightsdraft_comment_add text,
    rightsdraft_comment_reply text,
    rightsdraft_comment_resolve text,
    rightsdraft_organization_workflow_use text,
    rightsdraft_workflow_create text,
    rightsdraft_workflow_delete text,
    rightsdraft_workflow_update text,
    rightsfill_field text,
    rightsfolder_create text,
    rightsfolder_delete text,
    rightsfolder_list text,
    rightsfolder_update text,
    rightsgroup_create text,
    rightsgroup_delete text,
    rightsgroup_update text,
    rightsgroup_update_user text,
    rightsnegotiation_add_comment text,
    rightsnegotiation_attachment text,
    rightsnegotiation_break text,
    rightsnegotiation_comment_add text,
    rightsnegotiation_comment_reply text,
    rightsnegotiation_comment_resolve text,
    rightsnegotiation_create text,
    rightsnegotiation_invite text,
    rightsnegotiation_organization_workflow_use text,
    rightsnegotiation_sign text,
    rightsnegotiation_update text,
    rightsnegotiation_update_metadata text,
    rightsnegotiation_workflow_create text,
    rightsnegotiation_workflow_delete text,
    rightsnegotiation_workflow_update text,
    rightsorg_access_all_contract text,
    rightsorg_access_all_negotiation text,
    rightsorg_access_all_template text,
    rightsorg_access_rule_modify text,
    rightsorg_access_rule_view text,
    rightsorg_add_user text,
    rightsorg_billing text,
    rightsorg_create text,
    rightsorg_invite_user text,
    rightsorg_remove_user text,
    rightsorg_update text,
    rightsorganization_clause_create text,
    rightsorganization_clause_delete text,
    rightsorganization_clause_list text,
    rightsorganization_clause_update text,
    rightsorganization_field_item_create text,
    rightsorganization_field_item_delete text,
    rightsorganization_field_item_get text,
    rightsorganization_field_item_update text,
    rightsorganization_workflow_create text,
    rightsorganization_workflow_delete text,
    rightsorganization_workflow_list text,
    rightsorganization_workflow_update text,
    rightsrole_create text,
    rightsrole_delete text,
    rightsrole_update text,
    rightsrole_update_user text,
    rightstag_create text,
    rightstag_delete text,
    rightstag_list_all text,
    rightstag_update text,
    rightstemplate_attachment text,
    rightstemplate_comment_add text,
    rightstemplate_comment_reply text,
    rightstemplate_comment_resolve text,
    rightstemplate_create text,
    rightstemplate_delete text,
    rightstemplate_organization_workflow_use text,
    rightstemplate_update text,
    rightstemplate_update_tag text,
    rightstemplate_update_user text,
    rightstemplate_use text,
    rightstemplate_workflow_create text,
    rightstemplate_workflow_delete text,
    rightstemplate_workflow_update text,
    sign_double_authcoworker text,
    sign_double_auththird_party text,
    subscription text,
    user_features_exports_advanced text,
    user_features_exports_simple text,
    user_features_integrations_box text,
    user_features_integrations_docusign text,
    user_features_integrations_dropbox text,
    user_features_integrations_facebook text,
    user_features_integrations_gdrive text,
    user_features_integrations_google text,
    user_features_integrations_linkedin text,
    user_features_integrations_salesforce text,
    user_features_integrations_saml text,
    user_features_integrations_webhook text,
    user_role_description text,
    user_role_id text,
    user_role_name text,
    user_role_type text,
    PRIMARY KEY (id)
);

CREATE TABLE agreement_summary_field (
    id text,
    agreement_uuid text,
    organization_id text,
    "name" text,
    "value" text,
    PRIMARY KEY (id, agreement_uuid, organization_id),
    FOREIGN KEY (agreement_uuid) REFERENCES agreement(uuid),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE agreement_party (
    "index" text,
    agreement_uuid text,
    party text,
    PRIMARY KEY ("index", agreement_uuid),
    FOREIGN KEY (agreement_uuid) REFERENCES agreement(uuid)
);

CREATE TABLE agreement_tag (
    "name" text,
    agreement_uuid text,
    PRIMARY KEY ("name", agreement_uuid),
    FOREIGN KEY (agreement_uuid) REFERENCES agreement(uuid)
);

CREATE TABLE agreement_field (
    _fivetran_id text,
    agreement_uuid text,
    organization_field_item_uuid text,
    "value" jsonb,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (agreement_uuid) REFERENCES agreement(uuid)
);

CREATE TABLE agreement (
    uuid text,
    organization_id text,
    access_from_role text,
    access_type text,
    created_at text,
    created_by text,
    created_by_is_active text,
    created_by_name text,
    description text,
    document_type text,
    end_date text,
    end_date_unknown text,
    has_signed text,
    id text,
    is_inboxed text,
    modified_at text,
    must_validate text,
    signature_block_enabled text,
    signature_count text,
    signature_date text,
    signature_date_unknown text,
    signature_required text,
    "status" text,
    title text,
    unread text,
    validated text,
    validation_count text,
    validation_required text,
    PRIMARY KEY (uuid),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE agreement_version_last_field_value (
    "index" text,
    agreement_uuid text,
    agreement_version_last_field_uuid text,
    "value" text,
    PRIMARY KEY ("index", agreement_uuid, agreement_version_last_field_uuid),
    FOREIGN KEY (agreement_uuid) REFERENCES agreement_version_last_field(agreement_uuid),
    FOREIGN KEY (agreement_version_last_field_uuid) REFERENCES agreement_version_last_field(uuid)
);

CREATE TABLE agreement_version_last_field_option (
    "key" text,
    agreement_uuid text,
    agreement_version_last_field_uuid text,
    clause_id text,
    clause_version text,
    description text,
    title text,
    "value" text,
    PRIMARY KEY ("key", agreement_uuid, agreement_version_last_field_uuid),
    FOREIGN KEY (agreement_uuid) REFERENCES agreement_version_last_field(agreement_uuid),
    FOREIGN KEY (agreement_version_last_field_uuid) REFERENCES agreement_version_last_field(uuid)
);

CREATE TABLE agreement_version_last_field (
    uuid text,
    agreement_uuid text,
    reservation_organization_id text,
    reservation_user_id text,
    locked text,
    metadata text,
    organization_field_item_uuid text,
    placeholder text,
    required text,
    reservation_email text,
    reservation_group text,
    reservation_group_id text,
    reservation_signature_slot text,
    reservation_slot_id text,
    reservation_type text,
    source_type text,
    "type" text,
    PRIMARY KEY (uuid, agreement_uuid),
    FOREIGN KEY (agreement_uuid) REFERENCES agreement(uuid),
    FOREIGN KEY (reservation_organization_id) REFERENCES organization(id),
    FOREIGN KEY (reservation_user_id) REFERENCES users(id)
);

CREATE TABLE subscription_seat (
    _fivetran_id text,
    subscription_id text,
    invited text,
    subscribed text,
    "type" text,
    used text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (subscription_id) REFERENCES subscription(id)
);

CREATE TABLE subscription (
    id text,
    organization_id text,
    billing_type text,
    customer_id text,
    feature_level text,
    "status" text,
    subscription_name text,
    "type" text,
    PRIMARY KEY (id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE report_filter_status (
    "index" text,
    organization_id text,
    report_id text,
    "status" text,
    PRIMARY KEY ("index", organization_id, report_id),
    FOREIGN KEY (organization_id) REFERENCES report(organization_id),
    FOREIGN KEY (report_id) REFERENCES report(id)
);

CREATE TABLE report_filter_created_by (
    "index" text,
    organization_id text,
    report_id text,
    created_by text,
    PRIMARY KEY ("index", organization_id, report_id),
    FOREIGN KEY (organization_id) REFERENCES report(organization_id),
    FOREIGN KEY (report_id) REFERENCES report(id),
    FOREIGN KEY (created_by) REFERENCES users(id)
);

CREATE TABLE report (
    id text,
    organization_id text,
    description text,
    filter_created_at_is_after text,
    filter_created_at_is_before text,
    filter_created_at_is_between_from text,
    filter_created_at_is_between_to text,
    filter_created_at_is_blank text,
    filter_created_at_is_more_than text,
    filter_created_at_is_within_the_last text,
    filter_created_at_is_within_the_next text,
    filter_end_at_is_after text,
    filter_end_at_is_before text,
    filter_end_at_is_between_from text,
    filter_end_at_is_between_to text,
    filter_end_at_is_blank text,
    filter_end_at_is_more_than text,
    filter_end_at_is_within_the_last text,
    filter_end_at_is_within_the_next text,
    filter_modified_at_is_after text,
    filter_modified_at_is_before text,
    filter_modified_at_is_between_from text,
    filter_modified_at_is_between_to text,
    filter_modified_at_is_blank text,
    filter_modified_at_is_more_than text,
    filter_modified_at_is_within_the_last text,
    filter_modified_at_is_within_the_next text,
    filter_signature_date_is_after text,
    filter_signature_date_is_before text,
    filter_signature_date_is_between_from text,
    filter_signature_date_is_between_to text,
    filter_signature_date_is_blank text,
    filter_signature_date_is_more_than text,
    filter_signature_date_is_within_the_last text,
    filter_signature_date_is_within_the_next text,
    filters_inboxed text,
    filters_no_tag text,
    filters_search text,
    filters_tag_name jsonb,
    last_updated_at text,
    "name" text,
    PRIMARY KEY (id, organization_id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE agreement_attachment (
    id text,
    agreement_uuid text,
    organization_id text,
    created_at text,
    created_by_email text,
    created_by_has_mfa text,
    created_by_has_picture text,
    created_by_id text,
    created_by_name text,
    description text,
    file_name text,
    "name" text,
    url text,
    PRIMARY KEY (id),
    FOREIGN KEY (agreement_uuid) REFERENCES agreement(uuid),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE agreement_track_change_amendment (
    _fivetran_id text,
    agreement_track_change_id text,
    created_at text,
    created_by_has_picture text,
    created_by_id text,
    created_by_name text,
    display_version text,
    text text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (agreement_track_change_id) REFERENCES agreement_track_change(id)
);

CREATE TABLE agreement_track_change (
    id text,
    agreement_uuid text,
    organization_id text,
    amendment text,
    change_id text,
    created_at text,
    created_by_has_picture text,
    created_by_id text,
    created_by_name text,
    display_version text,
    modified_at text,
    modified_by_has_picture text,
    modified_by_id text,
    modified_by_name text,
    "status" text,
    text text,
    "type" text,
    version text,
    word_dataauthor text,
    word_datadate text,
    PRIMARY KEY (id),
    FOREIGN KEY (agreement_uuid) REFERENCES agreement(uuid),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE agreement_approval_validation (
    id text,
    _fivetran_id text,
    agreement_approval_rule_id text,
    user_id text,
    user_organization_id text,
    groups text,
    "result" text,
    "status" text,
    "type" text,
    user_job text,
    PRIMARY KEY (id, _fivetran_id, agreement_approval_rule_id),
    FOREIGN KEY (_fivetran_id) REFERENCES agreement_approval_rule(_fivetran_id),
    FOREIGN KEY (agreement_approval_rule_id) REFERENCES agreement_approval_rule(id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (user_organization_id) REFERENCES organization(id)
);

CREATE TABLE agreement_approval_rule (
    id text,
    _fivetran_id text,
    active text,
    "condition" jsonb,
    request_sent text,
    "result" text,
    "status" text,
    "type" text,
    PRIMARY KEY (id, _fivetran_id),
    FOREIGN KEY (_fivetran_id) REFERENCES agreement_approval(_fivetran_id)
);

CREATE TABLE agreement_approval (
    _fivetran_id text,
    agreement_uuid text,
    organization_id text,
    auto_notification_enabled text,
    block_thirdparty_signature text,
    organization_workflow_id text,
    organization_workflow_title text,
    "status" text,
    PRIMARY KEY (_fivetran_id),
    FOREIGN KEY (agreement_uuid) REFERENCES agreement(uuid),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE organization_clause (
    id text,
    organization_id text,
    content text,
    created_at text,
    description text,
    number_of_templates_linked text,
    presigned_url text,
    title text,
    version text,
    PRIMARY KEY (id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE agreement_path_user (
    agreement_path_id text,
    id text,
    job text,
    pictures_normal text,
    pictures_small text,
    pictures_special text,
    PRIMARY KEY (agreement_path_id, id),
    FOREIGN KEY (agreement_path_id) REFERENCES agreement_path(id),
    FOREIGN KEY (id) REFERENCES users(id)
);

CREATE TABLE agreement_path_team_user (
    agreement_path_id text,
    agreement_path_team_id text,
    id text,
    PRIMARY KEY (agreement_path_id, agreement_path_team_id, id),
    FOREIGN KEY (agreement_path_id) REFERENCES agreement_path(id),
    FOREIGN KEY (agreement_path_team_id) REFERENCES agreement_path_team(id),
    FOREIGN KEY (id) REFERENCES agreement_path_user(id)
);

CREATE TABLE agreement_path_team_invitation (
    agreement_path_id text,
    agreement_path_team_id text,
    id text,
    PRIMARY KEY (agreement_path_id, agreement_path_team_id, id),
    FOREIGN KEY (agreement_path_id) REFERENCES agreement_path(id),
    FOREIGN KEY (agreement_path_team_id) REFERENCES agreement_path_team(id),
    FOREIGN KEY (id) REFERENCES agreement_path_invitation(id)
);

CREATE TABLE agreement_path_team (
    id text,
    agreement_path_id text,
    organization_id text,
    description text,
    "name" text,
    PRIMARY KEY (id, agreement_path_id),
    FOREIGN KEY (agreement_path_id) REFERENCES agreement_path(id),
    FOREIGN KEY (organization_id) REFERENCES organization(id)
);

CREATE TABLE agreement_path_invitation (
    id text,
    agreement_path_id text,
    created_at text,
    email text,
    uuid text,
    PRIMARY KEY (id, agreement_path_id),
    FOREIGN KEY (agreement_path_id) REFERENCES agreement_path(id)
);

CREATE TABLE agreement_path (
    id text,
    agreement_uuid text,
    organization_id text,
    parent_id text,
    access_all_user_in_organization_access text,
    document_count text,
    "name" text,
    PRIMARY KEY (id),
    FOREIGN KEY (agreement_uuid) REFERENCES agreement(uuid),
    FOREIGN KEY (organization_id) REFERENCES organization(id),
    FOREIGN KEY (parent_id) REFERENCES agreement_path(id)
);
