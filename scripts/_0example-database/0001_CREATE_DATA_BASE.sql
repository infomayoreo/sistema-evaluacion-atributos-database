
CREATE SEQUENCE public.profiencies_values_proficiency_value_id_seq;

CREATE TABLE public.profiencies_values (
                proficiency_value_id INTEGER NOT NULL DEFAULT nextval('public.profiencies_values_proficiency_value_id_seq'),
                name VARCHAR(100) NOT NULL,
                description VARCHAR,
                numeric_value INTEGER NOT NULL,
                color VARCHAR(10),
                activate BOOLEAN DEFAULT true NOT NULL,
                create_at TIMESTAMP NOT NULL,
                update_at TIMESTAMP NOT NULL,
                CONSTRAINT profiencies_values_pk PRIMARY KEY (proficiency_value_id)
);


ALTER SEQUENCE public.profiencies_values_proficiency_value_id_seq OWNED BY public.profiencies_values.proficiency_value_id;

CREATE UNIQUE INDEX profiencies_values_idx
 ON public.profiencies_values
 ( name );

CREATE SEQUENCE public.proficiencies_profieciency_id_seq;

CREATE TABLE public.proficiencies (
                proficiency_id INTEGER NOT NULL DEFAULT nextval('public.proficiencies_profieciency_id_seq'),
                name_data_source VARCHAR(100) NOT NULL,
                description VARCHAR,
                activate BOOLEAN DEFAULT true NOT NULL,
                create_at TIMESTAMP NOT NULL,
                update_at TIMESTAMP NOT NULL,
                CONSTRAINT proficiencies_pk PRIMARY KEY (proficiency_id)
);


ALTER SEQUENCE public.proficiencies_profieciency_id_seq OWNED BY public.proficiencies.proficiency_id;

CREATE UNIQUE INDEX proficiencies_idx
 ON public.proficiencies
 ( name_data_source );

CREATE SEQUENCE public.proficiencies_ranges_proviciency_range_id_seq;

CREATE TABLE public.proficiencies_ranges (
                proficiency_range_id INTEGER NOT NULL DEFAULT nextval('public.proficiencies_ranges_proviciency_range_id_seq'),
                proficiency_value_id INTEGER NOT NULL,
                proficiency_id INTEGER NOT NULL,
                update_at TIMESTAMP NOT NULL,
                create_at TIMESTAMP NOT NULL,
                CONSTRAINT proficiencies_ranges_pk PRIMARY KEY (proficiency_range_id)
);


ALTER SEQUENCE public.proficiencies_ranges_proviciency_range_id_seq OWNED BY public.proficiencies_ranges.proficiency_range_id;

CREATE UNIQUE INDEX proficiencies_ranges_idx
 ON public.proficiencies_ranges
 ( proficiency_value_id, proficiency_id );

CREATE SEQUENCE public.evaluation_types_evaluation_type_id_seq;

CREATE TABLE public.evaluation_types (
                evaluation_type_id INTEGER NOT NULL DEFAULT nextval('public.evaluation_types_evaluation_type_id_seq'),
                name VARCHAR(256) NOT NULL,
                description VARCHAR,
                create_at TIMESTAMP NOT NULL,
                update_at TIMESTAMP NOT NULL,
                CONSTRAINT evaluation_types_pk PRIMARY KEY (evaluation_type_id)
);


ALTER SEQUENCE public.evaluation_types_evaluation_type_id_seq OWNED BY public.evaluation_types.evaluation_type_id;

CREATE UNIQUE INDEX evaluation_type_idx
 ON public.evaluation_types
 ( name );

CREATE SEQUENCE public.profile_types_profile_type_id_seq;

CREATE TABLE public.profile_types (
                profile_type_id INTEGER NOT NULL DEFAULT nextval('public.profile_types_profile_type_id_seq'),
                name VARCHAR(256) NOT NULL,
                description NVARCHAR,
                update_at TIMESTAMP NOT NULL,
                activate BOOLEAN DEFAULT true NOT NULL,
                create_at TIMESTAMP NOT NULL,
                CONSTRAINT profile_types_pk PRIMARY KEY (profile_type_id)
);
COMMENT ON TABLE public.profile_types IS 'name of the profiles in funtion of the attributes';


ALTER SEQUENCE public.profile_types_profile_type_id_seq OWNED BY public.profile_types.profile_type_id;

CREATE UNIQUE INDEX profile_types_idx
 ON public.profile_types
 ( name );

CREATE TABLE public.system_auditable_process (
                system_auditable_process_id INTEGER NOT NULL,
                name VARCHAR(256) NOT NULL,
                description NVARCHAR,
                create_at TIMESTAMP NOT NULL,
                update_at TIMESTAMP NOT NULL,
                CONSTRAINT system_auditable_process_pk PRIMARY KEY (system_auditable_process_id)
);


CREATE UNIQUE INDEX system_auditable_process_idx
 ON public.system_auditable_process
 ( name );

CREATE TABLE public.data_source (
                data_source_id INTEGER NOT NULL,
                name_data_source VARCHAR NOT NULL,
                description VARCHAR,
                create_at TIMESTAMP NOT NULL,
                update_at TIMESTAMP NOT NULL,
                url VARCHAR NOT NULL,
                activate BOOLEAN DEFAULT true NOT NULL,
                CONSTRAINT data_source_pk PRIMARY KEY (data_source_id)
);


CREATE SEQUENCE public.global_settings_global_setting_id_seq;

CREATE TABLE public.global_settings (
                global_setting_id INTEGER NOT NULL DEFAULT nextval('public.global_settings_global_setting_id_seq'),
                name VARCHAR(100) NOT NULL,
                CONSTRAINT global_settings_pk PRIMARY KEY (global_setting_id)
);


ALTER SEQUENCE public.global_settings_global_setting_id_seq OWNED BY public.global_settings.global_setting_id;

CREATE TABLE public.meeting_platforms (
                platform_id INTEGER NOT NULL,
                name VARCHAR(256) NOT NULL,
                description NVARCHAR,
                create_at TIMESTAMP NOT NULL,
                update_at TIMESTAMP NOT NULL,
                CONSTRAINT meeting_platforms_pk PRIMARY KEY (platform_id)
);


CREATE UNIQUE INDEX meeting_platforms_idx
 ON public.meeting_platforms
 ( name );

CREATE TABLE public.attribute_values (
                value_id INTEGER NOT NULL,
                name VARCHAR(256) NOT NULL,
                numeric_value INTEGER NOT NULL,
                description NVARCHAR,
                color VARCHAR(10),
                create_at TIMESTAMP NOT NULL,
                update_at TIMESTAMP NOT NULL,
                CONSTRAINT attribute_values_pk PRIMARY KEY (value_id)
);


CREATE UNIQUE INDEX attribute_values_idx
 ON public.attribute_values
 ( name );

CREATE SEQUENCE public.attribute_type_attribute_type_id_seq;

CREATE TABLE public.attribute_type (
                attribute_type_id INTEGER NOT NULL DEFAULT nextval('public.attribute_type_attribute_type_id_seq'),
                name VARCHAR(256) NOT NULL,
                description VARCHAR,
                create_at TIMESTAMP NOT NULL,
                update_at TIMESTAMP NOT NULL,
                CONSTRAINT attribute_type_pk PRIMARY KEY (attribute_type_id)
);


ALTER SEQUENCE public.attribute_type_attribute_type_id_seq OWNED BY public.attribute_type.attribute_type_id;

CREATE UNIQUE INDEX attribute_type_idx
 ON public.attribute_type
 ( name );

CREATE SEQUENCE public.attribute_attribute_id_seq;

CREATE TABLE public.attribute (
                attribute_id VARCHAR NOT NULL DEFAULT nextval('public.attribute_attribute_id_seq'),
                attribute_type_id INTEGER NOT NULL,
                name VARCHAR(256) NOT NULL,
                description NVARCHAR,
                activate BOOLEAN DEFAULT true NOT NULL,
                create_at TIMESTAMP NOT NULL,
                update_at TIMESTAMP NOT NULL,
                CONSTRAINT attribute_pk PRIMARY KEY (attribute_id)
);


ALTER SEQUENCE public.attribute_attribute_id_seq OWNED BY public.attribute.attribute_id;

CREATE INDEX attribute_idx
 ON public.attribute
 ( attribute_type_id, name );

CREATE TABLE public.attribute_profiles (
                attribute_profile_id INTEGER NOT NULL,
                profile_type_id INTEGER NOT NULL,
                attribute_id VARCHAR NOT NULL,
                create_at TIMESTAMP NOT NULL,
                update_at TIMESTAMP NOT NULL,
                CONSTRAINT attribute_profiles_pk PRIMARY KEY (attribute_profile_id)
);


CREATE UNIQUE INDEX attribute_profiles_idx
 ON public.attribute_profiles
 ( profile_type_id, attribute_id );

CREATE SEQUENCE public.attribute_ranges_range_id_seq;

CREATE TABLE public.attribute_ranges (
                range_id INTEGER NOT NULL DEFAULT nextval('public.attribute_ranges_range_id_seq'),
                attribute_id VARCHAR NOT NULL,
                value_id INTEGER NOT NULL,
                description NVARCHAR,
                update_at TIMESTAMP NOT NULL,
                create_at TIMESTAMP NOT NULL,
                CONSTRAINT attribute_ranges_pk PRIMARY KEY (range_id)
);


ALTER SEQUENCE public.attribute_ranges_range_id_seq OWNED BY public.attribute_ranges.range_id;

CREATE UNIQUE INDEX attribute_ranges_idx
 ON public.attribute_ranges
 ( attribute_id, value_id );

CREATE TABLE public.system_options (
                system_option_id INTEGER NOT NULL,
                name VARCHAR(256) NOT NULL,
                description NVARCHAR,
                activate BOOLEAN DEFAULT true NOT NULL,
                create_at TIMESTAMP NOT NULL,
                update_at TIMESTAMP NOT NULL,
                CONSTRAINT system_options_pk PRIMARY KEY (system_option_id)
);


CREATE UNIQUE INDEX system_options_idx
 ON public.system_options
 ( name );

CREATE TABLE public.level_access (
                level_access_id INTEGER NOT NULL,
                name VARCHAR(256) NOT NULL,
                description NVARCHAR,
                activate BOOLEAN DEFAULT true NOT NULL,
                create_at TIMESTAMP NOT NULL,
                update_at TIMESTAMP NOT NULL,
                CONSTRAINT level_access_pk PRIMARY KEY (level_access_id)
);


CREATE UNIQUE INDEX level_access_idx
 ON public.level_access
 ( name );

CREATE SEQUENCE public.permissions_by_level_access_permission_by_role_id_seq;

CREATE TABLE public.permissions_by_level_access (
                permission_by_level_access_id INTEGER NOT NULL DEFAULT nextval('public.permissions_by_level_access_permission_by_role_id_seq'),
                level_access_id INTEGER NOT NULL,
                system_option_id INTEGER NOT NULL,
                allow_permission BOOLEAN NOT NULL,
                update_at TIMESTAMP NOT NULL,
                create_at TIMESTAMP NOT NULL,
                CONSTRAINT permissions_by_level_access_pk PRIMARY KEY (permission_by_level_access_id)
);


ALTER SEQUENCE public.permissions_by_level_access_permission_by_role_id_seq OWNED BY public.permissions_by_level_access.permission_by_level_access_id;

CREATE UNIQUE INDEX permissions_by_level_access_idx
 ON public.permissions_by_level_access
 ( level_access_id, system_option_id );

CREATE SEQUENCE public.users_user_id_seq;

CREATE TABLE public.users (
                user_id INTEGER NOT NULL DEFAULT nextval('public.users_user_id_seq'),
                email VARCHAR(256) NOT NULL,
                level_access_id INTEGER NOT NULL,
                activate BOOLEAN DEFAULT true NOT NULL,
                create_at TIMESTAMP NOT NULL,
                update_at TIMESTAMP NOT NULL,
                CONSTRAINT user_id PRIMARY KEY (user_id)
);


ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;

CREATE UNIQUE INDEX users_idx
 ON public.users
 ( email );

CREATE SEQUENCE public.audit_users_audit_user_id_seq;

CREATE TABLE public.audit_users (
                audit_user_id INTEGER NOT NULL DEFAULT nextval('public.audit_users_audit_user_id_seq'),
                system_auditable_process_id INTEGER NOT NULL,
                user_id INTEGER NOT NULL,
                at_table VARCHAR(100),
                at_column VARCHAR(100),
                old_value VARCHAR(100),
                new_value VARCHAR(100),
                data_type VARCHAR(100),
                create_at TIMESTAMP NOT NULL,
                update_at TIMESTAMP NOT NULL,
                CONSTRAINT audit_users_pk PRIMARY KEY (audit_user_id)
);


ALTER SEQUENCE public.audit_users_audit_user_id_seq OWNED BY public.audit_users.audit_user_id;

CREATE SEQUENCE public.persons_person_id_seq;

CREATE TABLE public.persons (
                person_id INTEGER NOT NULL DEFAULT nextval('public.persons_person_id_seq'),
                user_id INTEGER,
                name VARCHAR(256) NOT NULL,
                create_at TIMESTAMP NOT NULL,
                update_at TIMESTAMP NOT NULL,
                data_source_id INTEGER NOT NULL,
                CONSTRAINT persons_pk PRIMARY KEY (person_id)
);


ALTER SEQUENCE public.persons_person_id_seq OWNED BY public.persons.person_id;

CREATE UNIQUE INDEX persons_idx
 ON public.persons
 ( user_id );

CREATE SEQUENCE public.person_proficiency_person_proficiency_id_seq;

CREATE TABLE public.person_proficiency (
                person_proficiency_id INTEGER NOT NULL DEFAULT nextval('public.person_proficiency_person_proficiency_id_seq'),
                person_id INTEGER NOT NULL,
                proficiency_range_id INTEGER NOT NULL,
                update_at TIMESTAMP NOT NULL,
                create_at TIMESTAMP NOT NULL,
                CONSTRAINT person_proficiency_pk PRIMARY KEY (person_proficiency_id)
);


ALTER SEQUENCE public.person_proficiency_person_proficiency_id_seq OWNED BY public.person_proficiency.person_proficiency_id;

CREATE SEQUENCE public.evaluation_comments_evaluation_comment_id_seq;

CREATE TABLE public.evaluation_comments (
                evaluation_comment_id INTEGER NOT NULL DEFAULT nextval('public.evaluation_comments_evaluation_comment_id_seq'),
                person_to_evaluate_id INTEGER NOT NULL,
                evaluator_user_id INTEGER NOT NULL,
                create_at TIMESTAMP NOT NULL,
                update_at TIMESTAMP NOT NULL,
                CONSTRAINT evaluation_comments_pk PRIMARY KEY (evaluation_comment_id)
);


ALTER SEQUENCE public.evaluation_comments_evaluation_comment_id_seq OWNED BY public.evaluation_comments.evaluation_comment_id;

CREATE SEQUENCE public.person_extra_evaluations_participant_evaluation_period_id_seq;

CREATE TABLE public.person_extra_evaluations (
                person_extra_evaluation_id INTEGER NOT NULL DEFAULT nextval('public.person_extra_evaluations_participant_evaluation_period_id_seq'),
                committee_audio_url VARCHAR,
                update_at TIMESTAMP NOT NULL,
                create_at TIMESTAMP NOT NULL,
                person_to_evaluate_id INTEGER NOT NULL,
                evaluator_user_id INTEGER NOT NULL,
                CONSTRAINT person_extra_evaluations_pk PRIMARY KEY (person_extra_evaluation_id)
);


ALTER SEQUENCE public.person_extra_evaluations_participant_evaluation_period_id_seq OWNED BY public.person_extra_evaluations.person_extra_evaluation_id;

CREATE SEQUENCE public.meetings_meeting_id_seq;

CREATE TABLE public.meetings (
                meeting_id INTEGER NOT NULL DEFAULT nextval('public.meetings_meeting_id_seq'),
                created_by_user_id INTEGER NOT NULL,
                platform_id INTEGER NOT NULL,
                start_date TIMESTAMP NOT NULL,
                subject VARCHAR(2048) NOT NULL,
                meet_url VARCHAR,
                previus_meeting INTEGER,
                delete BOOLEAN DEFAULT false NOT NULL,
                create_at TIMESTAMP NOT NULL,
                update_at TIMESTAMP NOT NULL,
                CONSTRAINT meetings_pk PRIMARY KEY (meeting_id)
);


ALTER SEQUENCE public.meetings_meeting_id_seq OWNED BY public.meetings.meeting_id;

CREATE SEQUENCE public.person_values_header_participant_value_header_id_seq;

CREATE TABLE public.person_value_headers (
                person_value_header_id INTEGER NOT NULL DEFAULT nextval('public.person_values_header_participant_value_header_id_seq'),
                general_feedback VARCHAR,
                evaluator_user_id INTEGER NOT NULL,
                person_to_evaluate_id INTEGER NOT NULL,
                evaluation_type_id INTEGER NOT NULL,
                meeting_id INTEGER,
                create_at TIMESTAMP NOT NULL,
                update_at TIMESTAMP NOT NULL,
                CONSTRAINT person_value_headers_pk PRIMARY KEY (person_value_header_id)
);


ALTER SEQUENCE public.person_values_header_participant_value_header_id_seq OWNED BY public.person_value_headers.person_value_header_id;

CREATE SEQUENCE public.person_values_details_participant_value_detail_id_seq;

CREATE TABLE public.person_values_details (
                person_value_detail_id INTEGER NOT NULL DEFAULT nextval('public.person_values_details_participant_value_detail_id_seq'),
                person_value_header_id INTEGER NOT NULL,
                value_range_id INTEGER NOT NULL,
                attribute_feedbak VARCHAR,
                create_at TIMESTAMP NOT NULL,
                update_at TIMESTAMP NOT NULL,
                CONSTRAINT person_values_details_pk PRIMARY KEY (person_value_detail_id)
);


ALTER SEQUENCE public.person_values_details_participant_value_detail_id_seq OWNED BY public.person_values_details.person_value_detail_id;

CREATE SEQUENCE public.participants_participant_id_seq;

CREATE TABLE public.participants (
                participant_id INTEGER NOT NULL DEFAULT nextval('public.participants_participant_id_seq'),
                meeting_id INTEGER NOT NULL,
                person_id INTEGER NOT NULL,
                deleted BOOLEAN DEFAULT false NOT NULL,
                create_at TIMESTAMP NOT NULL,
                update_at TIMESTAMP NOT NULL,
                CONSTRAINT participants_pk PRIMARY KEY (participant_id)
);


ALTER SEQUENCE public.participants_participant_id_seq OWNED BY public.participants.participant_id;

CREATE SEQUENCE public.meeting_value_headers_meeting_value_header_id_seq;

CREATE TABLE public.meeting_value_headers (
                meeting_value_header_id INTEGER NOT NULL DEFAULT nextval('public.meeting_value_headers_meeting_value_header_id_seq'),
                participant_evaluator_id INTEGER NOT NULL,
                general_feedback VARCHAR,
                create_at TIMESTAMP NOT NULL,
                update_at TIMESTAMP NOT NULL,
                CONSTRAINT meeting_value_headers_pk PRIMARY KEY (meeting_value_header_id)
);


ALTER SEQUENCE public.meeting_value_headers_meeting_value_header_id_seq OWNED BY public.meeting_value_headers.meeting_value_header_id;

CREATE TABLE public.meeting_value_details (
                meeting_value_detail_id INTEGER NOT NULL,
                meeting_value_header_id INTEGER NOT NULL,
                value_range_id INTEGER NOT NULL,
                attribute_feedbak NVARCHAR,
                update_at TIMESTAMP NOT NULL,
                create_at TIMESTAMP NOT NULL,
                CONSTRAINT meeting_value_details_pk PRIMARY KEY (meeting_value_detail_id)
);


CREATE TABLE public.permissions_by_user (
                permission_by_user_id VARCHAR NOT NULL,
                user_id INTEGER NOT NULL,
                system_option_id INTEGER NOT NULL,
                allow_permission BOOLEAN NOT NULL,
                create_at TIMESTAMP NOT NULL,
                update_at TIMESTAMP NOT NULL,
                CONSTRAINT permissions_by_user_pk PRIMARY KEY (permission_by_user_id)
);


CREATE UNIQUE INDEX permissions_by_user_idx
 ON public.permissions_by_user
 ( user_id, system_option_id );

ALTER TABLE public.proficiencies_ranges ADD CONSTRAINT profiencies_values_proficiencies_ranges_fk
FOREIGN KEY (proficiency_value_id)
REFERENCES public.profiencies_values (proficiency_value_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.proficiencies_ranges ADD CONSTRAINT proficiencies_proficiencies_ranges_fk
FOREIGN KEY (proficiency_id)
REFERENCES public.proficiencies (proficiency_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.person_proficiency ADD CONSTRAINT proficiencies_ranges_person_proficiency_fk
FOREIGN KEY (proficiency_range_id)
REFERENCES public.proficiencies_ranges (proficiency_range_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.person_value_headers ADD CONSTRAINT evaluation_type_person_values_header_fk
FOREIGN KEY (evaluation_type_id)
REFERENCES public.evaluation_types (evaluation_type_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.attribute_profiles ADD CONSTRAINT profile_types_attribute_profiles_fk
FOREIGN KEY (profile_type_id)
REFERENCES public.profile_types (profile_type_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.audit_users ADD CONSTRAINT system_operations_audit_users_fk
FOREIGN KEY (system_auditable_process_id)
REFERENCES public.system_auditable_process (system_auditable_process_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.persons ADD CONSTRAINT data_source_persons_fk
FOREIGN KEY (data_source_id)
REFERENCES public.data_source (data_source_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.meetings ADD CONSTRAINT meeting_platforms_meetings_fk
FOREIGN KEY (platform_id)
REFERENCES public.meeting_platforms (platform_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.attribute_ranges ADD CONSTRAINT attribute_values_attribute_ranges_fk
FOREIGN KEY (value_id)
REFERENCES public.attribute_values (value_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.attribute ADD CONSTRAINT attribute_type_attribute_fk
FOREIGN KEY (attribute_type_id)
REFERENCES public.attribute_type (attribute_type_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.attribute_ranges ADD CONSTRAINT attribute_attribute_ranges_fk
FOREIGN KEY (attribute_id)
REFERENCES public.attribute (attribute_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.attribute_profiles ADD CONSTRAINT attribute_attribute_profiles_fk
FOREIGN KEY (attribute_id)
REFERENCES public.attribute (attribute_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.meeting_value_details ADD CONSTRAINT attribute_ranges_meeting_value_details_fk
FOREIGN KEY (value_range_id)
REFERENCES public.attribute_ranges (range_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.person_values_details ADD CONSTRAINT attribute_ranges_participant_values_atrribute_details_fk
FOREIGN KEY (value_range_id)
REFERENCES public.attribute_ranges (range_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.permissions_by_level_access ADD CONSTRAINT modules_permissions_by_role_fk
FOREIGN KEY (system_option_id)
REFERENCES public.system_options (system_option_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.permissions_by_user ADD CONSTRAINT modules_permissions_by_user_fk
FOREIGN KEY (system_option_id)
REFERENCES public.system_options (system_option_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.users ADD CONSTRAINT rol_id_users_fk
FOREIGN KEY (level_access_id)
REFERENCES public.level_access (level_access_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.permissions_by_level_access ADD CONSTRAINT rol_id_permissions_by_role_fk
FOREIGN KEY (level_access_id)
REFERENCES public.level_access (level_access_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.permissions_by_user ADD CONSTRAINT users_permissions_by_user_fk
FOREIGN KEY (user_id)
REFERENCES public.users (user_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.meetings ADD CONSTRAINT users_meetings_fk
FOREIGN KEY (created_by_user_id)
REFERENCES public.users (user_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.persons ADD CONSTRAINT users_persons_fk
FOREIGN KEY (user_id)
REFERENCES public.users (user_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.audit_users ADD CONSTRAINT users_audit_users_fk
FOREIGN KEY (user_id)
REFERENCES public.users (user_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.person_value_headers ADD CONSTRAINT users_person_values_header_fk
FOREIGN KEY (evaluator_user_id)
REFERENCES public.users (user_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.evaluation_comments ADD CONSTRAINT users_evaluation_comments_fk
FOREIGN KEY (evaluator_user_id)
REFERENCES public.users (user_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.person_extra_evaluations ADD CONSTRAINT users_participant_evaluation_peariod_headers_fk
FOREIGN KEY (evaluator_user_id)
REFERENCES public.users (user_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.participants ADD CONSTRAINT persons_participants_fk
FOREIGN KEY (person_id)
REFERENCES public.persons (person_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.person_extra_evaluations ADD CONSTRAINT persons_audit_participants_header_fk
FOREIGN KEY (person_to_evaluate_id)
REFERENCES public.persons (person_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.person_value_headers ADD CONSTRAINT persons_person_values_header_fk
FOREIGN KEY (person_to_evaluate_id)
REFERENCES public.persons (person_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.evaluation_comments ADD CONSTRAINT persons_evaluation_comments_fk
FOREIGN KEY (person_to_evaluate_id)
REFERENCES public.persons (person_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.person_proficiency ADD CONSTRAINT persons_person_proficiency_fk
FOREIGN KEY (person_id)
REFERENCES public.persons (person_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.participants ADD CONSTRAINT meetings_participants_fk
FOREIGN KEY (meeting_id)
REFERENCES public.meetings (meeting_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.meetings ADD CONSTRAINT meetings_meetings_fk
FOREIGN KEY (previus_meeting)
REFERENCES public.meetings (meeting_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.person_value_headers ADD CONSTRAINT meetings_person_values_header_fk
FOREIGN KEY (meeting_id)
REFERENCES public.meetings (meeting_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.person_values_details ADD CONSTRAINT participant_values_header_participant_values_atrribute_detai199
FOREIGN KEY (person_value_header_id)
REFERENCES public.person_value_headers (person_value_header_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.meeting_value_headers ADD CONSTRAINT participants_meeting_value_header_fk
FOREIGN KEY (participant_evaluator_id)
REFERENCES public.participants (participant_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.meeting_value_details ADD CONSTRAINT meeting_value_header_meeting_value_details_fk
FOREIGN KEY (meeting_value_header_id)
REFERENCES public.meeting_value_headers (meeting_value_header_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;