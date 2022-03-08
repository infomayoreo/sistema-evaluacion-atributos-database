
CREATE TABLE public.system_auditable_process (
                system_auditable_process_id INTEGER NOT NULL,
                name VARCHAR(256) NOT NULL,
                description NVARCHAR,
                activate BOOLEAN DEFAULT true NOT NULL,
                create_at TIMESTAMP NOT NULL,
                update_at TIMESTAMP NOT NULL,
                CONSTRAINT system_auditable_process_pk PRIMARY KEY (system_auditable_process_id)
);


CREATE TABLE public.data_source (
                data_source_id INTEGER NOT NULL,
                name_data_source VARCHAR NOT NULL,
                description VARCHAR NOT NULL,
                create_at TIMESTAMP NOT NULL,
                update_at TIMESTAMP NOT NULL,
                url VARCHAR NOT NULL,
                activate BOOLEAN DEFAULT true NOT NULL,
                CONSTRAINT data_source_pk PRIMARY KEY (data_source_id)
);


CREATE SEQUENCE public.global_settings_global_setting_id_seq;

CREATE TABLE public.global_settings (
                global_setting_id INTEGER NOT NULL DEFAULT nextval('public.global_settings_global_setting_id_seq'),
                name VARCHAR NOT NULL,
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


CREATE TABLE public.attribute_values (
                value_id INTEGER NOT NULL,
                name VARCHAR(256) NOT NULL,
                numeric_value INTEGER NOT NULL,
                description NVARCHAR,
                color VARCHAR,
                create_at TIMESTAMP NOT NULL,
                update_at TIMESTAMP NOT NULL,
                CONSTRAINT attribute_values_pk PRIMARY KEY (value_id)
);


CREATE SEQUENCE public.attribute_type_attribute_type_id_seq;

CREATE TABLE public.attribute_type (
                attribute_type_id INTEGER NOT NULL DEFAULT nextval('public.attribute_type_attribute_type_id_seq'),
                name VARCHAR(256) NOT NULL,
                description VARCHAR NOT NULL,
                create_at TIMESTAMP NOT NULL,
                update_at TIMESTAMP NOT NULL,
                CONSTRAINT attribute_type_pk PRIMARY KEY (attribute_type_id)
);


ALTER SEQUENCE public.attribute_type_attribute_type_id_seq OWNED BY public.attribute_type.attribute_type_id;

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

CREATE SEQUENCE public.attribute_ranges_range_id_seq;

CREATE TABLE public.attribute_ranges (
                range_id INTEGER NOT NULL DEFAULT nextval('public.attribute_ranges_range_id_seq'),
                attribute_id VARCHAR NOT NULL,
                value_id INTEGER NOT NULL,
                description NVARCHAR,
                CONSTRAINT attribute_ranges_pk PRIMARY KEY (range_id)
);


ALTER SEQUENCE public.attribute_ranges_range_id_seq OWNED BY public.attribute_ranges.range_id;

CREATE SEQUENCE public.system_options_system_option_id_seq;

CREATE TABLE public.system_options (
                system_option_id INTEGER NOT NULL DEFAULT nextval('public.system_options_system_option_id_seq'),
                name VARCHAR(256) NOT NULL,
                description NVARCHAR,
                activate BOOLEAN DEFAULT true NOT NULL,
                create_at TIMESTAMP NOT NULL,
                update_at TIMESTAMP NOT NULL,
                CONSTRAINT system_options_pk PRIMARY KEY (system_option_id)
);


ALTER SEQUENCE public.system_options_system_option_id_seq OWNED BY public.system_options.system_option_id;

CREATE TABLE public.roles (
                role_id INTEGER NOT NULL,
                name VARCHAR(256) NOT NULL,
                description NVARCHAR,
                activate BOOLEAN DEFAULT true NOT NULL,
                create_at TIMESTAMP NOT NULL,
                update_at TIMESTAMP NOT NULL,
                CONSTRAINT roles_pk PRIMARY KEY (role_id)
);


CREATE SEQUENCE public.permissions_by_role_permission_by_role_id_seq;

CREATE TABLE public.permissions_by_role (
                permission_by_role_id INTEGER NOT NULL DEFAULT nextval('public.permissions_by_role_permission_by_role_id_seq'),
                role_id INTEGER NOT NULL,
                system_option_id INTEGER NOT NULL,
                allow_permission BOOLEAN NOT NULL,
                update_at TIMESTAMP NOT NULL,
                create_at TIMESTAMP NOT NULL,
                CONSTRAINT permissions_by_role_pk PRIMARY KEY (permission_by_role_id)
);


ALTER SEQUENCE public.permissions_by_role_permission_by_role_id_seq OWNED BY public.permissions_by_role.permission_by_role_id;

CREATE SEQUENCE public.users_user_id_seq;

CREATE TABLE public.users (
                user_id INTEGER NOT NULL DEFAULT nextval('public.users_user_id_seq'),
                email VARCHAR(256) NOT NULL,
                role_id INTEGER NOT NULL,
                activate BOOLEAN DEFAULT true NOT NULL,
                create_at TIMESTAMP NOT NULL,
                update_at TIMESTAMP NOT NULL,
                CONSTRAINT user_id PRIMARY KEY (user_id)
);


ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;

CREATE TABLE public.audit_users (
                audit_user_id INTEGER NOT NULL,
                system_auditable_process_id INTEGER NOT NULL,
                create_at TIMESTAMP NOT NULL,
                update_at TIMESTAMP NOT NULL,
                user_id INTEGER NOT NULL,
                at_table VARCHAR(100) NOT NULL,
                at_column VARCHAR(100) NOT NULL,
                old_value VARCHAR(100) NOT NULL,
                new_value VARCHAR(100) NOT NULL,
                data_type VARCHAR(100) NOT NULL,
                CONSTRAINT audit_users_pk PRIMARY KEY (audit_user_id)
);


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

CREATE SEQUENCE public.participant_evaluation_peariod_headers_participant_audit_id_seq;

CREATE TABLE public.participant_evaluation_peariod_headers (
                participant_audit_id INTEGER NOT NULL DEFAULT nextval('public.participant_evaluation_peariod_headers_participant_audit_id_seq'),
                committee_audio_url VARCHAR,
                update_at TIMESTAMP NOT NULL,
                create_at TIMESTAMP NOT NULL,
                person_id INTEGER NOT NULL,
                CONSTRAINT participant_evaluation_peariod_headers_pk PRIMARY KEY (participant_audit_id)
);


ALTER SEQUENCE public.participant_evaluation_peariod_headers_participant_audit_id_seq OWNED BY public.participant_evaluation_peariod_headers.participant_audit_id;

CREATE SEQUENCE public.participant_evaluation_peariod_headers_details_audit_partici277;

CREATE TABLE public.participant_evaluation_peariod_headers_details (
                audit_participant_detail_id INTEGER NOT NULL DEFAULT nextval('public.participant_evaluation_peariod_headers_details_audit_partici277'),
                participant_audit_id INTEGER NOT NULL,
                attribute_id VARCHAR NOT NULL,
                total_value INTEGER NOT NULL,
                update_at TIMESTAMP NOT NULL,
                create_at TIMESTAMP NOT NULL,
                CONSTRAINT participant_evaluation_peariod_headers_details_pk PRIMARY KEY (audit_participant_detail_id)
);


ALTER SEQUENCE public.participant_evaluation_peariod_headers_details_audit_partici277 OWNED BY public.participant_evaluation_peariod_headers_details.audit_participant_detail_id;

CREATE SEQUENCE public.meetings_meeting_id_seq;

CREATE TABLE public.meetings (
                meeting_id INTEGER NOT NULL DEFAULT nextval('public.meetings_meeting_id_seq'),
                created_by INTEGER NOT NULL,
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

CREATE SEQUENCE public.attribute_to_evaluate_by_meeting_meeting_attribute_to_evalua731;

CREATE TABLE public.attribute_to_evaluate_by_meeting (
                meeting_attribute_to_evaluate_id INTEGER NOT NULL DEFAULT nextval('public.attribute_to_evaluate_by_meeting_meeting_attribute_to_evalua731'),
                meeting_id INTEGER NOT NULL,
                attribute_id VARCHAR NOT NULL,
                activate BOOLEAN DEFAULT true NOT NULL,
                create_at TIMESTAMP NOT NULL,
                update_at TIMESTAMP NOT NULL,
                CONSTRAINT attribute_to_evaluate_by_meeting_pk PRIMARY KEY (meeting_attribute_to_evaluate_id)
);


ALTER SEQUENCE public.attribute_to_evaluate_by_meeting_meeting_attribute_to_evalua731 OWNED BY public.attribute_to_evaluate_by_meeting.meeting_attribute_to_evaluate_id;

CREATE SEQUENCE public.participants_participant_id_seq;

CREATE TABLE public.participants (
                participant_id INTEGER NOT NULL DEFAULT nextval('public.participants_participant_id_seq'),
                meeting_id INTEGER NOT NULL,
                person_id INTEGER NOT NULL,
                can_evalute_meet BOOLEAN DEFAULT true NOT NULL,
                can_evaluate_participants BOOLEAN DEFAULT true NOT NULL,
                can_be_evaluate BOOLEAN DEFAULT true NOT NULL,
                deleted BOOLEAN DEFAULT false NOT NULL,
                create_at TIMESTAMP NOT NULL,
                update_at TIMESTAMP NOT NULL,
                CONSTRAINT participants_pk PRIMARY KEY (participant_id)
);


ALTER SEQUENCE public.participants_participant_id_seq OWNED BY public.participants.participant_id;

CREATE SEQUENCE public.participant_values_header_participant_value_header_id_seq;

CREATE TABLE public.participant_values_header (
                participant_value_header_id INTEGER NOT NULL DEFAULT nextval('public.participant_values_header_participant_value_header_id_seq'),
                evaluate_by_id INTEGER NOT NULL,
                participant_to_evaluate_id INTEGER NOT NULL,
                general_feedback VARCHAR,
                create_at TIMESTAMP NOT NULL,
                update_at TIMESTAMP NOT NULL,
                CONSTRAINT participant_values_header_pk PRIMARY KEY (participant_value_header_id)
);


ALTER SEQUENCE public.participant_values_header_participant_value_header_id_seq OWNED BY public.participant_values_header.participant_value_header_id;

CREATE SEQUENCE public.attributes_to_evaluate_by_participant_attribute_to_evaluate_192;

CREATE TABLE public.attributes_to_evaluate_by_participant (
                attribute_to_evaluate_by_participant_id INTEGER NOT NULL DEFAULT nextval('public.attributes_to_evaluate_by_participant_attribute_to_evaluate_192'),
                attribute_id VARCHAR NOT NULL,
                participant_id INTEGER NOT NULL,
                activate BOOLEAN DEFAULT true NOT NULL,
                create_at TIMESTAMP NOT NULL,
                update_at TIMESTAMP NOT NULL,
                CONSTRAINT attributes_to_evaluate_by_participant_pk PRIMARY KEY (attribute_to_evaluate_by_participant_id)
);


ALTER SEQUENCE public.attributes_to_evaluate_by_participant_attribute_to_evaluate_192 OWNED BY public.attributes_to_evaluate_by_participant.attribute_to_evaluate_by_participant_id;

CREATE SEQUENCE public.permissions_to_evalute_participants_attributes_evaluator_par99;

CREATE TABLE public.permissions_to_evalute_participants_attributes (
                evaluator_participant_by_attribute_id INTEGER NOT NULL DEFAULT nextval('public.permissions_to_evalute_participants_attributes_evaluator_par99'),
                attribute_to_evaluate_by_participant_id INTEGER NOT NULL,
                participant_id INTEGER NOT NULL,
                allow_permission BOOLEAN DEFAULT true NOT NULL,
                update_at TIMESTAMP NOT NULL,
                create_at TIMESTAMP NOT NULL,
                CONSTRAINT permissions_to_evalute_participants_attributes_pk PRIMARY KEY (evaluator_participant_by_attribute_id)
);


ALTER SEQUENCE public.permissions_to_evalute_participants_attributes_evaluator_par99 OWNED BY public.permissions_to_evalute_participants_attributes.evaluator_participant_by_attribute_id;

CREATE SEQUENCE public.participant_atrribute_values_details_participant_value_detai366;

CREATE TABLE public.participant_atrribute_values_details (
                participant_value_detail_id INTEGER NOT NULL DEFAULT nextval('public.participant_atrribute_values_details_participant_value_detai366'),
                participant_value_header_id INTEGER NOT NULL,
                evaluator_participant_by_attribute_id INTEGER NOT NULL,
                value_range_id INTEGER NOT NULL,
                attribute_feedbak VARCHAR,
                participant_audit_id INTEGER,
                create_at TIMESTAMP NOT NULL,
                update_at TIMESTAMP NOT NULL,
                CONSTRAINT participant_atrribute_values_details_pk PRIMARY KEY (participant_value_detail_id)
);


ALTER SEQUENCE public.participant_atrribute_values_details_participant_value_detai366 OWNED BY public.participant_atrribute_values_details.participant_value_detail_id;

CREATE SEQUENCE public.permissions_to_evalute_meeting_attribute_attribute_with_perm947;

CREATE TABLE public.permissions_to_evalute_meeting_attribute (
                attribute_with_permissions_participant_id INTEGER NOT NULL DEFAULT nextval('public.permissions_to_evalute_meeting_attribute_attribute_with_perm947'),
                participant_id INTEGER NOT NULL,
                meeting_attribute_to_evaluate_id INTEGER NOT NULL,
                allow_permission BOOLEAN DEFAULT true NOT NULL,
                create_at TIMESTAMP NOT NULL,
                update_at TIMESTAMP NOT NULL,
                CONSTRAINT permissions_to_evalute_meeting_attribute_pk PRIMARY KEY (attribute_with_permissions_participant_id)
);


ALTER SEQUENCE public.permissions_to_evalute_meeting_attribute_attribute_with_perm947 OWNED BY public.permissions_to_evalute_meeting_attribute.attribute_with_permissions_participant_id;

CREATE SEQUENCE public.meeting_value_headers_meeting_value_header_id_seq;

CREATE TABLE public.meeting_value_headers (
                meeting_value_header_id INTEGER NOT NULL DEFAULT nextval('public.meeting_value_headers_meeting_value_header_id_seq'),
                participant_id INTEGER NOT NULL,
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
                attribute_with_permissions_participant_id INTEGER NOT NULL,
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

ALTER TABLE public.attribute_to_evaluate_by_meeting ADD CONSTRAINT attribute_attribute_to_evalute_by_meeting_fk
FOREIGN KEY (attribute_id)
REFERENCES public.attribute (attribute_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.attributes_to_evaluate_by_participant ADD CONSTRAINT attribute_attributes_to_evaluate_by_participant_fk
FOREIGN KEY (attribute_id)
REFERENCES public.attribute (attribute_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.participant_evaluation_peariod_headers_details ADD CONSTRAINT attribute_audit_participant_details_fk
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

ALTER TABLE public.participant_atrribute_values_details ADD CONSTRAINT attribute_ranges_participant_values_atrribute_details_fk
FOREIGN KEY (value_range_id)
REFERENCES public.attribute_ranges (range_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.permissions_by_role ADD CONSTRAINT modules_permissions_by_role_fk
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
FOREIGN KEY (role_id)
REFERENCES public.roles (role_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.permissions_by_role ADD CONSTRAINT rol_id_permissions_by_role_fk
FOREIGN KEY (role_id)
REFERENCES public.roles (role_id)
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
FOREIGN KEY (created_by)
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

ALTER TABLE public.participants ADD CONSTRAINT persons_participants_fk
FOREIGN KEY (person_id)
REFERENCES public.persons (person_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.participant_evaluation_peariod_headers ADD CONSTRAINT persons_audit_participants_header_fk
FOREIGN KEY (person_id)
REFERENCES public.persons (person_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.participant_evaluation_peariod_headers_details ADD CONSTRAINT audit_participants_header_audit_participant_details_fk
FOREIGN KEY (participant_audit_id)
REFERENCES public.participant_evaluation_peariod_headers (participant_audit_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.participant_atrribute_values_details ADD CONSTRAINT audit_participants_header_participant_values_atrribute_detai521
FOREIGN KEY (participant_audit_id)
REFERENCES public.participant_evaluation_peariod_headers (participant_audit_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.participants ADD CONSTRAINT meetings_participants_fk
FOREIGN KEY (meeting_id)
REFERENCES public.meetings (meeting_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.attribute_to_evaluate_by_meeting ADD CONSTRAINT meetings_attribute_to_evalute_by_meeting_fk
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

ALTER TABLE public.permissions_to_evalute_meeting_attribute ADD CONSTRAINT attribute_to_evalute_by_meeting_permissions_to_evalute_meeti732
FOREIGN KEY (meeting_attribute_to_evaluate_id)
REFERENCES public.attribute_to_evaluate_by_meeting (meeting_attribute_to_evaluate_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.meeting_value_headers ADD CONSTRAINT participants_meeting_value_header_fk
FOREIGN KEY (participant_id)
REFERENCES public.participants (participant_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.permissions_to_evalute_meeting_attribute ADD CONSTRAINT participants_permissions_to_evalute_meeting_attribute_fk
FOREIGN KEY (participant_id)
REFERENCES public.participants (participant_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.attributes_to_evaluate_by_participant ADD CONSTRAINT participants_attributes_to_evaluate_by_participant_fk
FOREIGN KEY (participant_id)
REFERENCES public.participants (participant_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.permissions_to_evalute_participants_attributes ADD CONSTRAINT participants_permissions_to_evalute_participant_attribute_fk
FOREIGN KEY (participant_id)
REFERENCES public.participants (participant_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.participant_values_header ADD CONSTRAINT participants_participant_values_header_fk
FOREIGN KEY (participant_to_evaluate_id)
REFERENCES public.participants (participant_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.participant_values_header ADD CONSTRAINT participants_participant_values_header_fk1
FOREIGN KEY (evaluate_by_id)
REFERENCES public.participants (participant_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.participant_atrribute_values_details ADD CONSTRAINT participant_values_header_participant_values_atrribute_detai199
FOREIGN KEY (participant_value_header_id)
REFERENCES public.participant_values_header (participant_value_header_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.permissions_to_evalute_participants_attributes ADD CONSTRAINT attributes_to_evaluate_by_participant_permissions_to_evalute120
FOREIGN KEY (attribute_to_evaluate_by_participant_id)
REFERENCES public.attributes_to_evaluate_by_participant (attribute_to_evaluate_by_participant_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.participant_atrribute_values_details ADD CONSTRAINT permissions_to_evalute_participant_attribute_participant_val115
FOREIGN KEY (evaluator_participant_by_attribute_id)
REFERENCES public.permissions_to_evalute_participants_attributes (evaluator_participant_by_attribute_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.meeting_value_details ADD CONSTRAINT permissions_to_evalute_meeting_attribute_meeting_value_detai673
FOREIGN KEY (attribute_with_permissions_participant_id)
REFERENCES public.permissions_to_evalute_meeting_attribute (attribute_with_permissions_participant_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.meeting_value_details ADD CONSTRAINT meeting_value_header_meeting_value_details_fk
FOREIGN KEY (meeting_value_header_id)
REFERENCES public.meeting_value_headers (meeting_value_header_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;