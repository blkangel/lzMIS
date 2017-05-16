
set define off



DROP TABLE CR_menu CASCADE CONSTRAINTS PURGE;



DROP TABLE CR_module CASCADE CONSTRAINTS PURGE;



DROP TABLE CR_gloss CASCADE CONSTRAINTS PURGE;



DROP TABLE CR_person_address CASCADE CONSTRAINTS PURGE;



DROP TABLE CR_person_phone CASCADE CONSTRAINTS PURGE;



DROP TABLE CR_subuser CASCADE CONSTRAINTS PURGE;



DROP TABLE CR_user_setting CASCADE CONSTRAINTS PURGE;



DROP TABLE CR_print CASCADE CONSTRAINTS PURGE;



DROP TABLE MED_file CASCADE CONSTRAINTS PURGE;



DROP TABLE MED_event CASCADE CONSTRAINTS PURGE;



DROP TABLE MED_event_type CASCADE CONSTRAINTS PURGE;



DROP TABLE MED_diag CASCADE CONSTRAINTS PURGE;



DROP TABLE MED_icd10 CASCADE CONSTRAINTS PURGE;



DROP TABLE MED_title CASCADE CONSTRAINTS PURGE;



DROP TABLE MED_sheet CASCADE CONSTRAINTS PURGE;



DROP TABLE MED_rec CASCADE CONSTRAINTS PURGE;



DROP TABLE MED_patient CASCADE CONSTRAINTS PURGE;



DROP TABLE CR_country CASCADE CONSTRAINTS PURGE;



DROP TABLE CR_language CASCADE CONSTRAINTS PURGE;



DROP TABLE MED_type CASCADE CONSTRAINTS PURGE;



DROP TABLE CR_cache_privilege CASCADE CONSTRAINTS PURGE;



DROP TABLE CR_extdata CASCADE CONSTRAINTS PURGE;



DROP TABLE CR_extsystem CASCADE CONSTRAINTS PURGE;



DROP TABLE CR_user_spec CASCADE CONSTRAINTS PURGE;



DROP TABLE CR_spec CASCADE CONSTRAINTS PURGE;



DROP TABLE CR_user_role CASCADE CONSTRAINTS PURGE;



DROP TABLE CR_device_link CASCADE CONSTRAINTS PURGE;



DROP TABLE CR_device CASCADE CONSTRAINTS PURGE;



DROP TABLE CR_room CASCADE CONSTRAINTS PURGE;



DROP TABLE CR_dept CASCADE CONSTRAINTS PURGE;



DROP TABLE CR_place CASCADE CONSTRAINTS PURGE;



DROP TABLE CR_org CASCADE CONSTRAINTS PURGE;



DROP TABLE CR_right CASCADE CONSTRAINTS PURGE;



DROP TABLE CR_role CASCADE CONSTRAINTS PURGE;



DROP TABLE CR_list_value CASCADE CONSTRAINTS PURGE;



DROP TABLE CR_list CASCADE CONSTRAINTS PURGE;



DROP TABLE CR_user CASCADE CONSTRAINTS PURGE;



DROP TABLE CR_position CASCADE CONSTRAINTS PURGE;



DROP TABLE CR_person CASCADE CONSTRAINTS PURGE;



DROP TABLE CR_privilege CASCADE CONSTRAINTS PURGE;



CREATE TABLE CR_cache_privilege
(
	table_name            VARCHAR2(512)  NULL ,
	column_name           VARCHAR2(512)  NULL ,
	row_id                INTEGER  NULL ,
	code                  VARCHAR2(512)  NULL ,
	date_from             DATE  NULL ,
	date_to               DATE  NULL ,
	months_from           INTEGER  NULL ,
	months_to             INTEGER  NULL ,
	days_from             INTEGER  NULL ,
	days_to               INTEGER  NULL ,
	CR_user_id            INTEGER  NOT NULL ,
	CR_privilege_id       INTEGER  NOT NULL ,
	user_login            VARCHAR2(512)  NULL ,
	CR_role_id            INTEGER  NULL
);



CREATE INDEX IE1CR_cache_privilege ON CR_cache_privilege
(table_name  ASC);



CREATE INDEX IE2CR_cache_privilege ON CR_cache_privilege
(column_name  ASC);



CREATE INDEX IE3CR_cache_privilege ON CR_cache_privilege
(row_id  ASC);



CREATE INDEX IE4CR_cache_privilege ON CR_cache_privilege
(code  ASC);



CREATE INDEX IE5CR_cache_privilege ON CR_cache_privilege
(date_from  ASC,date_to  ASC);



CREATE INDEX IE6CR_cache_privilege ON CR_cache_privilege
(months_from  ASC,months_to  ASC);



CREATE INDEX IE7CR_cache_privilege ON CR_cache_privilege
(days_from  ASC,days_to  ASC);



CREATE INDEX IE8CR_cache_privilege ON CR_cache_privilege
(user_login  ASC);



CREATE INDEX IF1CR_cache_privilege ON CR_cache_privilege
(CR_user_id  ASC);



CREATE INDEX IF2CR_cache_privilege ON CR_cache_privilege
(CR_privilege_id  ASC);



CREATE INDEX IF3CR_cache_privilege ON CR_cache_privilege
(CR_role_id  ASC);



CREATE TABLE CR_country
(
	CR_country_id         INTEGER  NOT NULL ,
	create_date           DATE  NOT NULL ,
	create_user_id        INTEGER  NOT NULL ,
	modify_date           DATE  NULL ,
	modify_user_id        INTEGER  NULL ,
	code                  VARCHAR2(512)  NOT NULL  CONSTRAINT  uppercase_and_trimm_1201587632 CHECK (code=upper(trim(code)) or code is null),
	name                  VARCHAR2(512)  NOT NULL ,
	name_intl             VARCHAR2(512)  NULL ,
CONSTRAINT  PKCR_country PRIMARY KEY (CR_country_id)
);



CREATE UNIQUE INDEX AK1CR_country ON CR_country
(code  ASC);



CREATE TABLE CR_dept
(
	CR_dept_id            INTEGER  NOT NULL ,
	create_date           DATE  NOT NULL ,
	create_user_id        INTEGER  NOT NULL ,
	modify_date           DATE  NULL ,
	modify_user_id        INTEGER  NULL ,
	code                  VARCHAR2(512)  NOT NULL  CONSTRAINT  uppercase_and_trimme_406607943 CHECK (code=upper(trim(code)) or code is null),
	name                  VARCHAR2(512)  NOT NULL ,
	CR_org_id             INTEGER  NOT NULL ,
	CR_place_id           INTEGER  NOT NULL ,
	dept_type_id          INTEGER  NOT NULL ,
CONSTRAINT  PKCR_dept PRIMARY KEY (CR_dept_id)
);



CREATE UNIQUE INDEX AK1CR_dept ON CR_dept
(code  ASC);



CREATE INDEX IF1CR_dept ON CR_dept
(CR_org_id  ASC);



CREATE INDEX IF2CR_dept ON CR_dept
(CR_place_id  ASC);



CREATE INDEX IF3CR_dept ON CR_dept
(dept_type_id  ASC);



CREATE TABLE CR_device
(
	CR_device_id          INTEGER  NOT NULL ,
	create_date           DATE  NOT NULL ,
	create_user_id        INTEGER  NOT NULL ,
	modify_date           DATE  NULL ,
	modify_user_id        INTEGER  NULL ,
	code                  VARCHAR2(512)  NOT NULL  CONSTRAINT  uppercase_and_trimme_943821483 CHECK (code=upper(trim(code)) or code is null),
	name                  VARCHAR2(512)  NOT NULL ,
	is_archived           NUMBER(1)  NULL  CONSTRAINT  bool_998929504 CHECK (is_archived IN (1)),
	device_type_id        INTEGER  NOT NULL ,
	modality_type_id      INTEGER  NULL ,
	ip_address            VARCHAR2(512)  NULL ,
	ip_port               INTEGER  NULL ,
	AETitle               VARCHAR2(512)  NULL ,
	CR_room_id            INTEGER  NOT NULL ,
CONSTRAINT  PKCR_device PRIMARY KEY (CR_device_id)
);



CREATE INDEX IF1CR_device ON CR_device
(device_type_id  ASC);



CREATE INDEX IF2CR_device ON CR_device
(modality_type_id  ASC);



CREATE INDEX IF3CR_device ON CR_device
(CR_room_id  ASC);



CREATE TABLE CR_device_link
(
	CR_device_link_id     INTEGER  NOT NULL ,
	create_date           DATE  NOT NULL ,
	create_user_id        INTEGER  NOT NULL ,
	modify_date           DATE  NULL ,
	modify_user_id        INTEGER  NULL ,
	device1_id            INTEGER  NOT NULL ,
	device2_id            INTEGER  NOT NULL ,
CONSTRAINT  PKCR_device_link PRIMARY KEY (CR_device_link_id)
);



CREATE INDEX IF1CR_device_link ON CR_device_link
(device1_id  ASC);



CREATE INDEX IF2CR_device_link ON CR_device_link
(device2_id  ASC);



CREATE TABLE CR_extdata
(
	CR_extdata_id         INTEGER  NOT NULL ,
	create_date           DATE  NOT NULL ,
	create_user_id        INTEGER  NOT NULL ,
	modify_date           DATE  NULL ,
	modify_user_id        INTEGER  NULL ,
	tablename             VARCHAR2(512)  NULL  CONSTRAINT  uppercase_and_trimme_199810539 CHECK (tablename=upper(trim(tablename)) or tablename is null),
	row_id                INTEGER  NOT NULL ,
	external_id           VARCHAR2(512)  NULL ,
	is_transferred        NUMBER(1)  NULL  CONSTRAINT  bool_755901743 CHECK (is_transferred IN (1)),
	CR_extsystem_id       INTEGER  NOT NULL ,
CONSTRAINT  PKCR_extdata PRIMARY KEY (CR_extdata_id)
);



CREATE UNIQUE INDEX AK1CR_extdata ON CR_extdata
(tablename  ASC,row_id  ASC);



CREATE INDEX IE1CR_extdata ON CR_extdata
(tablename  ASC,row_id  ASC,is_transferred  ASC);



CREATE INDEX IF1CR_extdata ON CR_extdata
(CR_extsystem_id  ASC);



CREATE TABLE CR_extsystem
(
	CR_extsystem_id       INTEGER  NOT NULL ,
	create_date           DATE  NOT NULL ,
	create_user_id        INTEGER  NOT NULL ,
	modify_date           DATE  NULL ,
	modify_user_id        INTEGER  NULL ,
	code                  VARCHAR2(512)  NOT NULL  CONSTRAINT  uppercase_and_trimm_1431187183 CHECK (code=upper(trim(code)) or code is null),
	name                  VARCHAR2(512)  NOT NULL ,
	CR_org_id             INTEGER  NOT NULL ,
CONSTRAINT  PKCR_extsystem PRIMARY KEY (CR_extsystem_id)
);



CREATE UNIQUE INDEX AK1CR_extsystem ON CR_extsystem
(code  ASC);



CREATE INDEX IF1CR_extsystem ON CR_extsystem
(CR_org_id  ASC);



CREATE TABLE CR_gloss
(
	CR_gloss_id           INTEGER  NOT NULL ,
	parent_id             INTEGER  NULL ,
	create_date           DATE  NOT NULL ,
	create_user_id        INTEGER  NOT NULL ,
	modify_date           DATE  NULL ,
	modify_user_id        INTEGER  NULL ,
	code                  VARCHAR2(512)  NOT NULL  CONSTRAINT  uppercase_and_trimme_827088786 CHECK (code=upper(trim(code)) or code is null),
	name                  VARCHAR2(512)  NOT NULL ,
	order_num             INTEGER  NULL ,
	text                  CLOB  NULL ,
	CR_user_id            INTEGER  NULL ,
CONSTRAINT  PKCR_gloss PRIMARY KEY (CR_gloss_id)
);



CREATE INDEX IF1CR_gloss ON CR_gloss
(parent_id  ASC);



CREATE INDEX IF2CR_gloss ON CR_gloss
(CR_user_id  ASC);



CREATE TABLE CR_language
(
	CR_language_id        INTEGER  NOT NULL ,
	create_date           DATE  NOT NULL ,
	create_user_id        INTEGER  NOT NULL ,
	modify_date           DATE  NULL ,
	modify_user_id        INTEGER  NULL ,
	code                  VARCHAR2(512)  NOT NULL  CONSTRAINT  uppercase_and_trimm_1973530820 CHECK (code=upper(trim(code)) or code is null),
	name                  VARCHAR2(512)  NOT NULL ,
	name_intl             VARCHAR2(512)  NULL ,
CONSTRAINT  PKCR_language PRIMARY KEY (CR_language_id)
);



CREATE UNIQUE INDEX AK1CR_language ON CR_language
(code  ASC);



CREATE TABLE CR_list
(
	CR_list_id            INTEGER  NOT NULL ,
	create_date           DATE  NOT NULL ,
	create_user_id        INTEGER  NOT NULL ,
	modify_date           DATE  NULL ,
	modify_user_id        INTEGER  NULL ,
	code                  VARCHAR2(512)  NOT NULL  CONSTRAINT  uppercase_and_trimme_473913423 CHECK (code=upper(trim(code)) or code is null),
	name                  VARCHAR2(512)  NOT NULL ,
CONSTRAINT  PKCR_list PRIMARY KEY (CR_list_id)
);



CREATE UNIQUE INDEX AK1CR_list ON CR_list
(code  ASC);



CREATE TABLE CR_list_value
(
	CR_list_value_id      INTEGER  NOT NULL ,
	parent_id             INTEGER  NULL ,
	create_date           DATE  NOT NULL ,
	create_user_id        INTEGER  NOT NULL ,
	modify_date           DATE  NULL ,
	modify_user_id        INTEGER  NULL ,
	order_num             INTEGER  NULL ,
	code                  VARCHAR2(512)  NOT NULL  CONSTRAINT  uppercase_and_trimm_1346695927 CHECK (code=upper(trim(code)) or code is null),
	name                  VARCHAR2(512)  NOT NULL ,
	name_short            VARCHAR2(512)  NULL ,
	is_archived           NUMBER(1)  NULL  CONSTRAINT  bool_1243026471 CHECK (is_archived IN (1)),
	CR_list_id            INTEGER  NOT NULL ,
CONSTRAINT  PKCR_list_value PRIMARY KEY (CR_list_value_id)
);



CREATE UNIQUE INDEX AK1CR_list_value ON CR_list_value
(code  ASC);



CREATE INDEX IF2CR_list_value ON CR_list_value
(parent_id  ASC);



CREATE INDEX IF3CR_list_value ON CR_list_value
(CR_list_id  ASC);



CREATE TABLE CR_menu
(
	CR_menu_id            INTEGER  NOT NULL ,
	create_date           DATE  NOT NULL ,
	create_user_id        INTEGER  NOT NULL ,
	modify_date           DATE  NULL ,
	modify_user_id        INTEGER  NULL ,
	parent_id             INTEGER  NULL ,
	code                  VARCHAR2(512)  NULL  CONSTRAINT  uppercase_336129251 CHECK ((code=upper(code) or code is null)),
	name                  VARCHAR2(512)  NOT NULL ,
	name_short            VARCHAR2(512)  NULL ,
	order_num             INTEGER  NULL ,
	target                VARCHAR2(512)  NULL ,
	is_archived           NUMBER(1)  NULL  CONSTRAINT  bool_36656217 CHECK (is_archived IN (1)),
	attribute1            VARCHAR2(512)  NULL ,
	attribute2            VARCHAR2(512)  NULL ,
	attribute3            VARCHAR2(512)  NULL ,
	attribute4            VARCHAR2(512)  NULL ,
	attribute5            VARCHAR2(512)  NULL ,
	CR_privilege_id       INTEGER  NOT NULL ,
	CR_module_id          INTEGER  NULL ,
	is_current_list_entry  VARCHAR2(512)  NULL ,
CONSTRAINT  PKCR_menu PRIMARY KEY (CR_menu_id)
);



CREATE INDEX IF1CR_menu ON CR_menu
(parent_id  ASC);



CREATE INDEX IF2CR_menu ON CR_menu
(CR_privilege_id  ASC);



CREATE INDEX IF4CR_menu ON CR_menu
(CR_module_id  ASC);



CREATE TABLE CR_module
(
	CR_module_id          INTEGER  NOT NULL ,
	create_date           DATE  NOT NULL ,
	create_user_id        INTEGER  NOT NULL ,
	modify_date           DATE  NULL ,
	modify_user_id        INTEGER  NULL ,
	code                  VARCHAR2(512)  NOT NULL  CONSTRAINT  uppercase_403723879 CHECK ((code=upper(code) or code is null)),
	name                  VARCHAR2(512)  NOT NULL ,
	date_from             DATE  NOT NULL ,
	date_to               DATE  NULL ,
	qty                   INTEGER  NULL ,
CONSTRAINT  PKCR_module PRIMARY KEY (CR_module_id)
);



CREATE UNIQUE INDEX AK1CR_module ON CR_module
(code  ASC);



CREATE UNIQUE INDEX AK2CR_module ON CR_module
(name  ASC);



CREATE INDEX IE1CR_module ON CR_module
(date_from  ASC,date_to  ASC);



CREATE TABLE CR_org
(
	CR_org_id             INTEGER  NOT NULL ,
	create_date           DATE  NOT NULL ,
	create_user_id        INTEGER  NOT NULL ,
	modify_date           DATE  NULL ,
	modify_user_id        INTEGER  NULL ,
	is_archived           NUMBER(1)  NULL  CONSTRAINT  bool_417260723 CHECK (is_archived IN (1)),
	code                  VARCHAR2(512)  NOT NULL ,
	name                  VARCHAR2(512)  NOT NULL ,
	address_reg           VARCHAR2(512)  NULL ,
	address_act           VARCHAR2(512)  NULL ,
	phone                 VARCHAR2(512)  NULL ,
	email                 VARCHAR2(512)  NULL ,
	TIN                   VARCHAR2(512)  NULL ,
	TRRC                  VARCHAR2(512)  NULL ,
	URL                   VARCHAR2(512)  NULL ,
	RCBIC                 VARCHAR2(512)  NULL ,
	acc_corr              VARCHAR2(512)  NULL ,
	acc_sett              VARCHAR2(512)  NULL ,
	fax                   VARCHAR2(512)  NULL ,
	license               VARCHAR2(4000)  NULL ,
	name_intl             VARCHAR2(512)  NULL ,
	name_full             VARCHAR2(512)  NULL ,
	name_full_intl        VARCHAR2(512)  NULL ,
	bank_name             VARCHAR2(512)  NULL ,
	org_type_id           INTEGER  NOT NULL ,
CONSTRAINT  PKCR_org PRIMARY KEY (CR_org_id)
);



CREATE UNIQUE INDEX AK1CR_org ON CR_org
(code  ASC);



CREATE INDEX IF1CR_org ON CR_org
(org_type_id  ASC);



CREATE TABLE CR_person
(
	CR_person_id          INTEGER  NOT NULL ,
	create_date           DATE  NOT NULL ,
	create_user_id        INTEGER  NOT NULL ,
	modify_date           DATE  NULL ,
	modify_user_id        INTEGER  NULL ,
	lastname              VARCHAR2(512)  NOT NULL  CONSTRAINT  uppercase_1771227628 CHECK ((lastname=upper(lastname) or lastname is null)),
	firstname             VARCHAR2(512)  NOT NULL ,
	patronymic            VARCHAR2(512)  NULL ,
	fullname              VARCHAR2(512)  NULL ,
	shortname             VARCHAR2(512)  NULL ,
	sex                   CHAR(1)  NULL  CONSTRAINT  sex_1485479344 CHECK (sex IN ('M', 'F')),
	dob                   DATE  NULL ,
	lastname_intl         VARCHAR2(512)  NULL ,
	firstname_intl        VARCHAR2(512)  NULL ,
	patronymic_intl       VARCHAR2(512)  NULL ,
	shortname_intl        VARCHAR2(512)  NULL ,
	fullname_intl         VARCHAR2(512)  NULL ,
CONSTRAINT  PKCR_person PRIMARY KEY (CR_person_id)
);



COMMENT ON COLUMN CR_person.lastname IS 'Фамилия';



COMMENT ON COLUMN CR_person.firstname IS 'Имя';



COMMENT ON COLUMN CR_person.patronymic IS 'Отчество';



COMMENT ON COLUMN CR_person.fullname IS 'Полное имя';



COMMENT ON COLUMN CR_person.shortname IS 'ФИО';



COMMENT ON COLUMN CR_person.sex IS 'Пол';



COMMENT ON COLUMN CR_person.dob IS 'Дата рождения';



COMMENT ON COLUMN CR_person.lastname_intl IS 'Фамилия альт';



COMMENT ON COLUMN CR_person.firstname_intl IS 'Имя альт';



COMMENT ON COLUMN CR_person.patronymic_intl IS 'Отчество альт';



COMMENT ON COLUMN CR_person.shortname_intl IS 'ФИО алт';



COMMENT ON COLUMN CR_person.fullname_intl IS 'Полное имя альт';



CREATE TABLE CR_person_address
(
	CR_person_address_id  INTEGER  NOT NULL ,
	create_date           DATE  NOT NULL ,
	create_user_id        INTEGER  NOT NULL ,
	modify_date           DATE  NULL ,
	modify_user_id        INTEGER  NULL ,
	address               VARCHAR2(512)  NULL ,
	address_intl          VARCHAR2(512)  NULL ,
	commentary            VARCHAR2(4000)  NULL ,
	is_archived           NUMBER(1)  NULL  CONSTRAINT  bool_475546960 CHECK (is_archived IN (1)),
	address_kind_id       INTEGER  NOT NULL ,
	CR_person_id          INTEGER  NULL ,
	CR_user_id            INTEGER  NULL ,
CONSTRAINT  PKCR_person_address PRIMARY KEY (CR_person_address_id)
);



CREATE INDEX IF1CR_person_address ON CR_person_address
(address_kind_id  ASC);



CREATE INDEX IF2CR_person_address ON CR_person_address
(CR_person_id  ASC);



CREATE INDEX IF3CR_person_address ON CR_person_address
(CR_user_id  ASC);



CREATE TABLE CR_person_phone
(
	CR_person_phone_id    INTEGER  NOT NULL ,
	create_date           DATE  NOT NULL ,
	create_user_id        INTEGER  NOT NULL ,
	modify_date           DATE  NULL ,
	modify_user_id        INTEGER  NULL ,
	phone_num             VARCHAR2(512)  NULL ,
	commentary            VARCHAR2(4000)  NULL ,
	is_archived           NUMBER(1)  NULL  CONSTRAINT  bool_703974870 CHECK (is_archived IN (1)),
	is_notification       NUMBER(1)  NULL  CONSTRAINT  bool_1415819415 CHECK (is_notification IN (1)),
	CR_person_id          INTEGER  NULL ,
	CR_user_id            INTEGER  NULL ,
	phone_kind_id         INTEGER  NOT NULL ,
CONSTRAINT  PKCR_person_phone PRIMARY KEY (CR_person_phone_id)
);



CREATE INDEX IF1CR_person_phone ON CR_person_phone
(CR_person_id  ASC);



CREATE INDEX IF2CR_person_phone ON CR_person_phone
(CR_user_id  ASC);



CREATE INDEX IF3CR_person_phone ON CR_person_phone
(phone_kind_id  ASC);



CREATE TABLE CR_place
(
	CR_place_id           INTEGER  NOT NULL ,
	create_date           DATE  NOT NULL ,
	create_user_id        INTEGER  NOT NULL ,
	modify_date           DATE  NULL ,
	modify_user_id        INTEGER  NULL ,
	is_archived           NUMBER(1)  NULL  CONSTRAINT  bool_57761627 CHECK (is_archived IN (1)),
	code                  VARCHAR2(512)  NOT NULL  CONSTRAINT  uppercase_and_trimme_591157906 CHECK (code=upper(trim(code)) or code is null),
	name                  VARCHAR2(512)  NOT NULL ,
	address_act           VARCHAR2(512)  NULL ,
	address_act_intl      VARCHAR2(512)  NULL ,
	commentary            VARCHAR2(4000)  NULL ,
	floors                INTEGER  NULL ,
CONSTRAINT  PKCR_place PRIMARY KEY (CR_place_id)
);



CREATE UNIQUE INDEX AK1CR_place ON CR_place
(code  ASC);



CREATE TABLE CR_position
(
	CR_position_id        INTEGER  NOT NULL ,
	create_date           DATE  NOT NULL ,
	create_user_id        INTEGER  NOT NULL ,
	modify_date           DATE  NULL ,
	modify_user_id        INTEGER  NULL ,
	is_archived           NUMBER(1)  NULL  CONSTRAINT  bool_1688651725 CHECK (is_archived IN (1)),
	code                  VARCHAR2(512)  NOT NULL  CONSTRAINT  uppercase_and_trimm_1951482937 CHECK (code=upper(trim(code)) or code is null),
	name                  VARCHAR2(512)  NOT NULL ,
CONSTRAINT  PKCR_position PRIMARY KEY (CR_position_id)
);



CREATE UNIQUE INDEX AK1CR_position ON CR_position
(code  ASC);



CREATE TABLE CR_print
(
	CR_print_id           INTEGER  NOT NULL ,
	create_date           DATE  NOT NULL ,
	create_user_id        INTEGER  NOT NULL ,
	modify_date           DATE  NULL ,
	modify_user_id        INTEGER  NULL ,
	group_id              INTEGER  NOT NULL ,
	filedate              DATE  NULL ,
	data_value            BLOB  NULL ,
	mimetype              VARCHAR2(512)  NULL ,
	filename              VARCHAR2(512)  NULL ,
	charset               VARCHAR2(512)  NULL ,
	code                  VARCHAR2(512)  NOT NULL  CONSTRAINT  uppercase_and_trimme_726100376 CHECK (code=upper(trim(code)) or code is null),
	name                  VARCHAR2(512)  NOT NULL ,
	description           CLOB  NULL ,
	process_code          CLOB  NULL ,
CONSTRAINT  PKCR_print PRIMARY KEY (CR_print_id)
);



CREATE INDEX IF1CR_print ON CR_print
(group_id  ASC);



CREATE TABLE CR_privilege
(
	CR_privilege_id       INTEGER  NOT NULL ,
	create_date           DATE  NOT NULL ,
	create_user_id        INTEGER  NOT NULL ,
	modify_date           DATE  NULL ,
	modify_user_id        INTEGER  NULL ,
	code                  VARCHAR2(512)  NOT NULL  CONSTRAINT  uppercase_and_trimm_1867070460 CHECK (code=upper(trim(code)) or code is null),
	name                  VARCHAR2(512)  NOT NULL ,
CONSTRAINT  PKCR_privilege PRIMARY KEY (CR_privilege_id)
);



CREATE UNIQUE INDEX AK1CR_privilege ON CR_privilege
(code  ASC);



CREATE TABLE CR_right
(
	CR_right_id           INTEGER  NOT NULL ,
	create_date           DATE  NOT NULL ,
	create_user_id        INTEGER  NOT NULL ,
	modify_date           DATE  NULL ,
	modify_user_id        INTEGER  NULL ,
	table_name            VARCHAR2(512)  NULL ,
	column_name           VARCHAR2(512)  NULL ,
	row_id                INTEGER  NULL ,
	code                  VARCHAR2(512)  NULL ,
	date_from             DATE  NULL ,
	date_to               DATE  NULL ,
	months_from           INTEGER  NULL ,
	months_to             INTEGER  NULL ,
	days_from             INTEGER  NULL ,
	days_to               INTEGER  NULL ,
	CR_privilege_id       INTEGER  NOT NULL ,
	CR_user_id            INTEGER  NULL ,
	access_type_id        INTEGER  NULL ,
	CR_role_id            INTEGER  NULL ,
CONSTRAINT  PKCR_right PRIMARY KEY (CR_right_id)
);



CREATE INDEX IF1CR_right ON CR_right
(CR_privilege_id  ASC);



CREATE INDEX IF2CR_right ON CR_right
(CR_user_id  ASC);



CREATE INDEX IF4CR_right ON CR_right
(access_type_id  ASC);



CREATE INDEX IF5CR_right ON CR_right
(CR_role_id  ASC);



CREATE TABLE CR_role
(
	CR_role_id            INTEGER  NOT NULL ,
	parent_id             INTEGER  NULL ,
	create_date           DATE  NOT NULL ,
	create_user_id        INTEGER  NOT NULL ,
	modify_date           DATE  NULL ,
	modify_user_id        INTEGER  NULL ,
	code                  VARCHAR2(512)  NOT NULL  CONSTRAINT  uppercase_and_trimme_574114133 CHECK (code=upper(trim(code)) or code is null),
	name                  VARCHAR2(512)  NOT NULL ,
	commentary            VARCHAR2(4000)  NULL ,
	is_archived           NUMBER(1)  NULL  CONSTRAINT  bool_231449002 CHECK (is_archived IN (1)),
CONSTRAINT  PKCR_role PRIMARY KEY (CR_role_id)
);



CREATE UNIQUE INDEX AK1CR_role ON CR_role
(code  ASC);



CREATE INDEX IF1CR_role ON CR_role
(parent_id  ASC);



CREATE TABLE CR_room
(
	CR_room_id            INTEGER  NOT NULL ,
	create_date           DATE  NOT NULL ,
	create_user_id        INTEGER  NOT NULL ,
	modify_date           DATE  NULL ,
	modify_user_id        INTEGER  NULL ,
	code                  VARCHAR2(512)  NOT NULL  CONSTRAINT  uppercase_and_trimme_574312789 CHECK (code=upper(trim(code)) or code is null),
	name                  VARCHAR2(512)  NOT NULL ,
	is_archived           NUMBER(1)  NULL  CONSTRAINT  bool_97231271 CHECK (is_archived IN (1)),
	room_type_id          INTEGER  NOT NULL ,
	commentary            VARCHAR2(4000)  NULL ,
	CR_dept_id            INTEGER  NOT NULL ,
CONSTRAINT  PKCR_room PRIMARY KEY (CR_room_id)
);



CREATE INDEX IF1CR_room ON CR_room
(room_type_id  ASC);



CREATE INDEX IF2CR_room ON CR_room
(CR_dept_id  ASC);



CREATE TABLE CR_spec
(
	CR_spec_id            INTEGER  NOT NULL ,
	create_date           DATE  NOT NULL ,
	create_user_id        INTEGER  NOT NULL ,
	modify_date           DATE  NULL ,
	modify_user_id        INTEGER  NULL ,
	is_archived           NUMBER(1)  NULL  CONSTRAINT  bool_264937649 CHECK (is_archived IN (1)),
	code                  VARCHAR2(512)  NOT NULL  CONSTRAINT  uppercase_and_trimme_590432086 CHECK (code=upper(trim(code)) or code is null),
	name                  VARCHAR2(512)  NOT NULL ,
CONSTRAINT  PKCR_spec PRIMARY KEY (CR_spec_id)
);



CREATE UNIQUE INDEX AK1CR_spec ON CR_spec
(code  ASC);



CREATE TABLE CR_subuser
(
	CR_subuser_id         INTEGER  NOT NULL ,
	create_date           DATE  NULL ,
	create_user_id        INTEGER  NOT NULL ,
	modify_date           DATE  NULL ,
	modify_user_id        INTEGER  NULL ,
	main_user_id          INTEGER  NOT NULL ,
	subuser_user_id       INTEGER  NOT NULL ,
CONSTRAINT  PKCR_subuser PRIMARY KEY (CR_subuser_id)
);



CREATE INDEX IF1CR_subuser ON CR_subuser
(main_user_id  ASC);



CREATE INDEX IF2CR_subuser ON CR_subuser
(subuser_user_id  ASC);



CREATE TABLE CR_user
(
	CR_user_id            INTEGER  NOT NULL ,
	create_date           DATE  NOT NULL ,
	create_user_id        INTEGER  NOT NULL ,
	modify_date           DATE  NULL ,
	modify_user_id        INTEGER  NULL ,
	login                 VARCHAR2(512)  NULL  CONSTRAINT  uppercase_and_trimme_525365157 CHECK (login=upper(trim(login)) or login is null),
	password              VARCHAR2(512)  NULL ,
	CR_person_id          INTEGER  NOT NULL ,
	is_archived           NUMBER(1)  NULL  CONSTRAINT  bool_13147569 CHECK (is_archived IN (1)),
	commentary            VARCHAR2(4000)  NULL ,
	CR_position_id        INTEGER  NULL ,
CONSTRAINT  PKCR_user PRIMARY KEY (CR_user_id)
);



CREATE INDEX IF1CR_user ON CR_user
(CR_person_id  ASC);



CREATE INDEX IF2CR_user ON CR_user
(CR_position_id  ASC);



CREATE TABLE CR_user_role
(
	CR_user_role_id       INTEGER  NOT NULL ,
	create_date           DATE  NULL ,
	create_user_id        INTEGER  NOT NULL ,
	modify_date           DATE  NULL ,
	modify_user_id        INTEGER  NULL ,
	CR_role_id            INTEGER  NOT NULL ,
	CR_user_id            INTEGER  NOT NULL ,
CONSTRAINT  PKCR_user_role PRIMARY KEY (CR_user_role_id)
);



CREATE INDEX IF1CR_user_role ON CR_user_role
(CR_role_id  ASC);



CREATE INDEX IF2CR_user_role ON CR_user_role
(CR_user_id  ASC);



CREATE TABLE CR_user_setting
(
	CR_user_setting_id    INTEGER  NOT NULL ,
	create_date           DATE  NOT NULL ,
	create_user_id        INTEGER  NOT NULL ,
	modify_date           DATE  NULL ,
	modify_user_id        INTEGER  NULL ,
	code                  VARCHAR2(512)  NOT NULL  CONSTRAINT  uppercase_and_trimmed_50672172 CHECK (code=upper(trim(code)) or code is null),
	value                 VARCHAR2(512)  NOT NULL ,
	CR_user_id            INTEGER  NOT NULL ,
CONSTRAINT  PKCR_user_setting PRIMARY KEY (CR_user_setting_id)
);



CREATE INDEX IF1CR_user_setting ON CR_user_setting
(CR_user_id  ASC);



CREATE TABLE CR_user_spec
(
	CR_user_spec_id       INTEGER  NOT NULL ,
	create_date           DATE  NOT NULL ,
	create_user_id        INTEGER  NOT NULL ,
	modify_date           DATE  NULL ,
	modify_user_id        INTEGER  NULL ,
	days_from             INTEGER  NOT NULL ,
	days_to               INTEGER  NULL ,
	CR_user_id            INTEGER  NOT NULL ,
	CR_spec_id            INTEGER  NOT NULL ,
	CR_dept_id            INTEGER  NOT NULL ,
CONSTRAINT  PKCR_user_spec PRIMARY KEY (CR_user_spec_id)
);



CREATE INDEX IF1CR_user_spec ON CR_user_spec
(CR_user_id  ASC);



CREATE INDEX IF2CR_user_spec ON CR_user_spec
(CR_spec_id  ASC);



CREATE INDEX IF3CR_user_spec ON CR_user_spec
(CR_dept_id  ASC);



CREATE TABLE MED_diag
(
	MED_diag_id           INTEGER  NOT NULL ,
	create_date           DATE  NOT NULL ,
	create_user_id        INTEGER  NOT NULL ,
	modify_date           DATE  NULL ,
	modify_user_id        INTEGER  NULL ,
	MED_icd10_id          INTEGER  NOT NULL ,
	diag_type_id          INTEGER  NULL ,
	disease_type_id       INTEGER  NULL ,
	disease_kind_id       INTEGER  NULL ,
	is_first_revealed     NUMBER(1)  NULL  CONSTRAINT  bool_893784807 CHECK (is_first_revealed IN (1)),
	MED_rec_id            INTEGER  NOT NULL ,
CONSTRAINT  PKMED_diag PRIMARY KEY (MED_diag_id)
);



CREATE INDEX IF1MED_diag ON MED_diag
(MED_icd10_id  ASC);



CREATE INDEX IF2MED_diag ON MED_diag
(diag_type_id  ASC);



CREATE INDEX IF3MED_diag ON MED_diag
(disease_type_id  ASC);



CREATE INDEX IF4MED_diag ON MED_diag
(disease_kind_id  ASC);



CREATE INDEX IF5MED_diag ON MED_diag
(MED_rec_id  ASC);



CREATE TABLE MED_event
(
	MED_event_id          INTEGER  NOT NULL ,
	create_date           DATE  NOT NULL ,
	create_user_id        INTEGER  NOT NULL ,
	modify_date           DATE  NULL ,
	modify_user_id        INTEGER  NULL ,
	code                  VARCHAR2(512)  NOT NULL  CONSTRAINT  uppercase_and_trimme_424127390 CHECK (code=upper(trim(code)) or code is null),
	name                  VARCHAR2(512)  NOT NULL ,
	MED_event_type_id     INTEGER  NOT NULL ,
	MED_rec_open_id       INTEGER  NOT NULL ,
	MED_rec_close_id      INTEGER  NULL ,
	is_open               NUMBER(1)  NULL  CONSTRAINT  bool_117116409 CHECK (is_open IN (1)),
	is_closed             NUMBER(1)  NULL  CONSTRAINT  bool_284139679 CHECK (is_closed IN (1)),
CONSTRAINT  PKMED_event PRIMARY KEY (MED_event_id)
);



CREATE INDEX IF1MED_event ON MED_event
(MED_event_type_id  ASC);



CREATE INDEX IF2MED_event ON MED_event
(MED_rec_open_id  ASC);



CREATE INDEX IF3MED_event ON MED_event
(MED_rec_close_id  ASC);



CREATE TABLE MED_event_type
(
	MED_event_type_id     INTEGER  NOT NULL ,
	create_date           DATE  NOT NULL ,
	create_user_id        INTEGER  NOT NULL ,
	modify_date           DATE  NULL ,
	modify_user_id        INTEGER  NULL ,
	code                  VARCHAR2(512)  NOT NULL  CONSTRAINT  uppercase_and_trimm_1223621376 CHECK (code=upper(trim(code)) or code is null),
	name                  VARCHAR2(512)  NOT NULL ,
	is_hospital           NUMBER(1)  NULL  CONSTRAINT  bool_1260716225 CHECK (is_hospital IN (1)),
	is_archived           NUMBER(1)  NULL  CONSTRAINT  bool_1377832145 CHECK (is_archived IN (1)),
CONSTRAINT  PKMED_event_type PRIMARY KEY (MED_event_type_id)
);



CREATE TABLE MED_file
(
	MED_file_id           INTEGER  NOT NULL ,
	create_date           DATE  NOT NULL ,
	create_user_id        INTEGER  NOT NULL ,
	modify_date           DATE  NULL ,
	modify_user_id        INTEGER  NULL ,
	filedate              DATE  NULL ,
	mimetype              VARCHAR2(512)  NULL ,
	filename              VARCHAR2(512)  NULL ,
	charset               VARCHAR2(512)  NULL ,
	description           VARCHAR2(512)  NULL ,
	MED_patient_id        INTEGER  NOT NULL ,
	MED_rec_id            INTEGER  NULL ,
	rubric_id             INTEGER  NOT NULL ,
CONSTRAINT  PKMED_file PRIMARY KEY (MED_file_id)
);



CREATE INDEX IF1MED_file ON MED_file
(MED_patient_id  ASC);



CREATE INDEX IF2MED_file ON MED_file
(MED_rec_id  ASC);



CREATE INDEX IF3MED_file ON MED_file
(rubric_id  ASC);



CREATE TABLE MED_icd10
(
	MED_icd10_id          INTEGER  NOT NULL ,
	create_date           DATE  NOT NULL ,
	create_user_id        INTEGER  NOT NULL ,
	modify_date           DATE  NULL ,
	modify_user_id        INTEGER  NULL ,
	code                  VARCHAR2(512)  NOT NULL  CONSTRAINT  uppercase_and_trimme_403336075 CHECK (code=upper(trim(code)) or code is null),
	name                  VARCHAR2(512)  NOT NULL ,
	name_intl             VARCHAR2(512)  NULL ,
CONSTRAINT  PKMED_icd10 PRIMARY KEY (MED_icd10_id)
);



CREATE TABLE MED_patient
(
	MED_patient_id        INTEGER  NOT NULL ,
	create_date           DATE  NOT NULL ,
	create_user_id        INTEGER  NOT NULL ,
	modify_date           DATE  NULL ,
	modify_user_id        INTEGER  NULL ,
	code                  VARCHAR2(512)  NOT NULL  CONSTRAINT  uppercase_and_trimm_1836142165 CHECK (code=upper(trim(code)) or code is null),
	CR_person_id          INTEGER  NOT NULL ,
	doc_type_id           INTEGER  NULL ,
	doc_serial            VARCHAR2(512)  NULL ,
	doc_num               VARCHAR2(512)  NULL ,
	doc_date              DATE  NULL ,
	doc_org               VARCHAR2(512)  NULL ,
	is_archived           NUMBER(1)  NULL  CONSTRAINT  bool_1519046317 CHECK (is_archived IN (1)),
	email                 VARCHAR2(512)  NULL ,
	CR_language_id        INTEGER  NULL ,
	CR_country_id         INTEGER  NULL ,
	code_snils            VARCHAR2(512)  NULL ,
	code_foms             VARCHAR2(512)  NULL ,
	commentary            VARCHAR2(4000)  NULL ,
CONSTRAINT  PKMED_patient PRIMARY KEY (MED_patient_id)
);



CREATE UNIQUE INDEX AK1MED_patient ON MED_patient
(code  ASC);



CREATE INDEX IF1MED_patient ON MED_patient
(CR_person_id  ASC);



CREATE INDEX IF2MED_patient ON MED_patient
(doc_type_id  ASC);



CREATE INDEX IF3MED_patient ON MED_patient
(CR_language_id  ASC);



CREATE INDEX IF4MED_patient ON MED_patient
(CR_country_id  ASC);



CREATE TABLE MED_rec
(
	MED_rec_id            INTEGER  NOT NULL ,
	create_date           DATE  NOT NULL ,
	create_user_id        INTEGER  NOT NULL ,
	modify_date           DATE  NULL ,
	modify_user_id        INTEGER  NULL ,
	date_of               DATE  NOT NULL ,
	MED_type_id           INTEGER  NOT NULL ,
	MED_patient_id        INTEGER  NOT NULL ,
CONSTRAINT  PKMED_rec PRIMARY KEY (MED_rec_id)
);



CREATE INDEX IF1MED_rec ON MED_rec
(MED_type_id  ASC);



CREATE INDEX IF2MED_rec ON MED_rec
(MED_patient_id  ASC);



CREATE TABLE MED_sheet
(
	MED_sheet_id          INTEGER  NOT NULL ,
	create_date           DATE  NOT NULL ,
	create_user_id        INTEGER  NOT NULL ,
	modify_date           DATE  NULL ,
	modify_user_id        INTEGER  NULL ,
	MED_rec_id            INTEGER  NOT NULL ,
	complaints            CLOB  NULL ,
	illness_history       CLOB  NULL ,
	physical_exam         CLOB  NULL ,
	diff_diag             CLOB  NULL ,
	exam_plan             CLOB  NULL ,
	pharmacotherapy       CLOB  NULL ,
	regime                CLOB  NULL ,
CONSTRAINT  PKMED_sheet PRIMARY KEY (MED_sheet_id)
);



CREATE UNIQUE INDEX IF1MED_sheet ON MED_sheet
(MED_rec_id  ASC);



CREATE TABLE MED_title
(
	MED_title_id          INTEGER  NOT NULL ,
	MED_patient_id        INTEGER  NOT NULL ,
	create_date           DATE  NOT NULL ,
	create_user_id        INTEGER  NOT NULL ,
	modify_date           DATE  NULL ,
	modify_user_id        INTEGER  NULL ,
	blood_grp_id          INTEGER  NULL ,
	rh_id                 INTEGER  NULL ,
	is_hepatitis          NUMBER(1)  NULL  CONSTRAINT  bool_1233151459 CHECK (is_hepatitis IN (1)),
	is_diabetes           NUMBER(1)  NULL  CONSTRAINT  bool_1399153261 CHECK (is_diabetes IN (1)),
	is_HIV                NUMBER(1)  NULL  CONSTRAINT  bool_1914777362 CHECK (is_HIV IN (1)),
	is_TB                 NUMBER(1)  NULL  CONSTRAINT  bool_1902449978 CHECK (is_TB IN (1)),
	kell_id               INTEGER  NULL ,
	rh_c1                 NUMBER(1)  NULL  CONSTRAINT  bool_2086995522 CHECK (rh_c1 IN (1)),
	rh_c2                 NUMBER(1)  NULL  CONSTRAINT  bool_2086995521 CHECK (rh_c2 IN (1)),
	rh_d1                 NUMBER(1)  NULL  CONSTRAINT  bool_2086995266 CHECK (rh_d1 IN (1)),
	rh_e1                 NUMBER(1)  NULL  CONSTRAINT  bool_2086995010 CHECK (rh_e1 IN (1)),
	rh_e2                 NUMBER(1)  NULL  CONSTRAINT  bool_2086995009 CHECK (rh_e2 IN (1)),
	blood_special         VARCHAR2(512)  NULL ,
	commentary            VARCHAR2(4000)  NULL ,
CONSTRAINT  PKMED_title PRIMARY KEY (MED_title_id)
);



CREATE UNIQUE INDEX IF1MED_title ON MED_title
(MED_patient_id  ASC);



CREATE INDEX IF2MED_title ON MED_title
(blood_grp_id  ASC);



CREATE INDEX IF3MED_title ON MED_title
(rh_id  ASC);



CREATE INDEX IF4MED_title ON MED_title
(kell_id  ASC);



CREATE TABLE MED_type
(
	MED_type_id           INTEGER  NOT NULL ,
	create_date           DATE  NOT NULL ,
	create_user_id        INTEGER  NOT NULL ,
	modify_date           DATE  NULL ,
	modify_user_id        INTEGER  NULL ,
	code                  VARCHAR2(512)  NOT NULL  CONSTRAINT  uppercase_and_trimme_774785444 CHECK (code=upper(trim(code)) or code is null),
	name                  VARCHAR2(512)  NOT NULL ,
CONSTRAINT  PKMED_type PRIMARY KEY (MED_type_id)
);



CREATE OR REPLACE  VIEW V_user
	 AS  SELECT cu.CR_user_id,cu.CR_person_id,cu.CR_position_id,cu.login,cu.password,cu.commentary,cu.is_archived,cp.lastname,cp.firstname,cp.patronymic
		FROM CR_person cp,CR_user cu
		WHERE cp.cr_person_id=cp.cr_person_id;



ALTER TABLE CR_cache_privilege
	ADD (CONSTRAINT  CR_user_of_CR_cache_privilege FOREIGN KEY (CR_user_id) REFERENCES CR_user(CR_user_id));



ALTER TABLE CR_cache_privilege
	ADD (CONSTRAINT  CR_privilege_of_CR_cache_privi FOREIGN KEY (CR_privilege_id) REFERENCES CR_privilege(CR_privilege_id));



ALTER TABLE CR_cache_privilege
	ADD (CONSTRAINT  CR_role_of_CR_cache_privilege FOREIGN KEY (CR_role_id) REFERENCES CR_role(CR_role_id));



ALTER TABLE CR_dept
	ADD (CONSTRAINT  CR_org_of_CR_dept FOREIGN KEY (CR_org_id) REFERENCES CR_org(CR_org_id));



ALTER TABLE CR_dept
	ADD (CONSTRAINT  CR_place_of_CR_dept FOREIGN KEY (CR_place_id) REFERENCES CR_place(CR_place_id));



ALTER TABLE CR_dept
	ADD (CONSTRAINT  dept_type_of_KRN_dept FOREIGN KEY (dept_type_id) REFERENCES CR_list_value(CR_list_value_id));



ALTER TABLE CR_device
	ADD (CONSTRAINT  device_type_of_KRN_device FOREIGN KEY (device_type_id) REFERENCES CR_list_value(CR_list_value_id));



ALTER TABLE CR_device
	ADD (CONSTRAINT  modality_type_of_KRN_device FOREIGN KEY (modality_type_id) REFERENCES CR_list_value(CR_list_value_id));



ALTER TABLE CR_device
	ADD (CONSTRAINT  CR_room_of_CR_device FOREIGN KEY (CR_room_id) REFERENCES CR_room(CR_room_id));



ALTER TABLE CR_device_link
	ADD (CONSTRAINT  device1_of_CR_device_link FOREIGN KEY (device1_id) REFERENCES CR_device(CR_device_id));



ALTER TABLE CR_device_link
	ADD (CONSTRAINT  device2_of_CR_device_link FOREIGN KEY (device2_id) REFERENCES CR_device(CR_device_id));



ALTER TABLE CR_extdata
	ADD (CONSTRAINT  CR_extsystem_of_CR_extdata FOREIGN KEY (CR_extsystem_id) REFERENCES CR_extsystem(CR_extsystem_id));



ALTER TABLE CR_extsystem
	ADD (CONSTRAINT  CR_org_of_CR_extsystem FOREIGN KEY (CR_org_id) REFERENCES CR_org(CR_org_id));



ALTER TABLE CR_gloss
	ADD (CONSTRAINT  CR_parent_of_gloss FOREIGN KEY (parent_id) REFERENCES CR_gloss(CR_gloss_id));



ALTER TABLE CR_gloss
	ADD (CONSTRAINT  CR_user_of_CR_gloss FOREIGN KEY (CR_user_id) REFERENCES CR_user(CR_user_id));



ALTER TABLE CR_list_value
	ADD (CONSTRAINT  KRN_parent_of_list_value FOREIGN KEY (parent_id) REFERENCES CR_list_value(CR_list_value_id));



ALTER TABLE CR_list_value
	ADD (CONSTRAINT  CR_list_of_CR_list_value FOREIGN KEY (CR_list_id) REFERENCES CR_list(CR_list_id));



ALTER TABLE CR_menu
	ADD (CONSTRAINT  KRN_parent_of_menu FOREIGN KEY (parent_id) REFERENCES CR_menu(CR_menu_id));



ALTER TABLE CR_menu
	ADD (CONSTRAINT  CR_privilege_of_CR_menu FOREIGN KEY (CR_privilege_id) REFERENCES CR_privilege(CR_privilege_id));



ALTER TABLE CR_menu
	ADD (CONSTRAINT  CR_module_of_CR_menu FOREIGN KEY (CR_module_id) REFERENCES CR_module(CR_module_id));



ALTER TABLE CR_org
	ADD (CONSTRAINT  org_type_of_KRN_org FOREIGN KEY (org_type_id) REFERENCES CR_list_value(CR_list_value_id));



ALTER TABLE CR_person_address
	ADD (CONSTRAINT  CR_list_value_of_CR_person_add FOREIGN KEY (address_kind_id) REFERENCES CR_list_value(CR_list_value_id));



ALTER TABLE CR_person_address
	ADD (CONSTRAINT  CR_person_of_CR_person_address FOREIGN KEY (CR_person_id) REFERENCES CR_person(CR_person_id));



ALTER TABLE CR_person_address
	ADD (CONSTRAINT  CR_user_of_CR_person_address FOREIGN KEY (CR_user_id) REFERENCES CR_user(CR_user_id));



ALTER TABLE CR_person_phone
	ADD (CONSTRAINT  CR_person_of_CR_person_phone FOREIGN KEY (CR_person_id) REFERENCES CR_person(CR_person_id));



ALTER TABLE CR_person_phone
	ADD (CONSTRAINT  CR_user_of_CR_person_phone FOREIGN KEY (CR_user_id) REFERENCES CR_user(CR_user_id));



ALTER TABLE CR_person_phone
	ADD (CONSTRAINT  phone_kind_of_CR_person_pho FOREIGN KEY (phone_kind_id) REFERENCES CR_list_value(CR_list_value_id));



ALTER TABLE CR_print
	ADD (CONSTRAINT  CR_list_value_of_CR_print FOREIGN KEY (group_id) REFERENCES CR_list_value(CR_list_value_id));



ALTER TABLE CR_right
	ADD (CONSTRAINT  CR_privilege_of_CR_right FOREIGN KEY (CR_privilege_id) REFERENCES CR_privilege(CR_privilege_id));



ALTER TABLE CR_right
	ADD (CONSTRAINT  CR_user_of_CR_right FOREIGN KEY (CR_user_id) REFERENCES CR_user(CR_user_id));



ALTER TABLE CR_right
	ADD (CONSTRAINT  access_type_of_KRN_right FOREIGN KEY (access_type_id) REFERENCES CR_list_value(CR_list_value_id));



ALTER TABLE CR_right
	ADD (CONSTRAINT  CR_role_of_CR_right FOREIGN KEY (CR_role_id) REFERENCES CR_role(CR_role_id));



ALTER TABLE CR_role
	ADD (CONSTRAINT  KRN_parent_of_role FOREIGN KEY (parent_id) REFERENCES CR_role(CR_role_id));



ALTER TABLE CR_room
	ADD (CONSTRAINT  CR_list_value_of_CR_room FOREIGN KEY (room_type_id) REFERENCES CR_list_value(CR_list_value_id));



ALTER TABLE CR_room
	ADD (CONSTRAINT  CR_dept_of_CR_room FOREIGN KEY (CR_dept_id) REFERENCES CR_dept(CR_dept_id));



ALTER TABLE CR_subuser
	ADD (CONSTRAINT  main_user_of_CR_subuser FOREIGN KEY (main_user_id) REFERENCES CR_user(CR_user_id));



ALTER TABLE CR_subuser
	ADD (CONSTRAINT  subuser_user_of_CR_subuser FOREIGN KEY (subuser_user_id) REFERENCES CR_user(CR_user_id));



ALTER TABLE CR_user
	ADD (CONSTRAINT  CR_person_of_CR_user FOREIGN KEY (CR_person_id) REFERENCES CR_person(CR_person_id));



ALTER TABLE CR_user
	ADD (CONSTRAINT  CR_position_of_CR_user FOREIGN KEY (CR_position_id) REFERENCES CR_position(CR_position_id));



ALTER TABLE CR_user_role
	ADD (CONSTRAINT  CR_role_of_CR_user_role FOREIGN KEY (CR_role_id) REFERENCES CR_role(CR_role_id));



ALTER TABLE CR_user_role
	ADD (CONSTRAINT  CR_user_of_CR_user_role FOREIGN KEY (CR_user_id) REFERENCES CR_user(CR_user_id));



ALTER TABLE CR_user_setting
	ADD (CONSTRAINT  CR_user_of_CR_user_setting FOREIGN KEY (CR_user_id) REFERENCES CR_user(CR_user_id));



ALTER TABLE CR_user_spec
	ADD (CONSTRAINT  CR_user_of_CR_user_spec FOREIGN KEY (CR_user_id) REFERENCES CR_user(CR_user_id));



ALTER TABLE CR_user_spec
	ADD (CONSTRAINT  CR_spec_of_CR_user_spec FOREIGN KEY (CR_spec_id) REFERENCES CR_spec(CR_spec_id));



ALTER TABLE CR_user_spec
	ADD (CONSTRAINT  CR_dept_of_CR_user_spec FOREIGN KEY (CR_dept_id) REFERENCES CR_dept(CR_dept_id));



ALTER TABLE MED_diag
	ADD (CONSTRAINT  MED_icd10_of_MED_diag FOREIGN KEY (MED_icd10_id) REFERENCES MED_icd10(MED_icd10_id));



ALTER TABLE MED_diag
	ADD (CONSTRAINT  diag_type_of_MED_diag FOREIGN KEY (diag_type_id) REFERENCES CR_list_value(CR_list_value_id));



ALTER TABLE MED_diag
	ADD (CONSTRAINT  disease_type_of_MED_diag FOREIGN KEY (disease_type_id) REFERENCES CR_list_value(CR_list_value_id));



ALTER TABLE MED_diag
	ADD (CONSTRAINT  disease_kind_of_MED_diag FOREIGN KEY (disease_kind_id) REFERENCES CR_list_value(CR_list_value_id));



ALTER TABLE MED_diag
	ADD (CONSTRAINT  MED_rec_of_MED_diag FOREIGN KEY (MED_rec_id) REFERENCES MED_rec(MED_rec_id));



ALTER TABLE MED_event
	ADD (CONSTRAINT  MED_event_type_of_MED_event FOREIGN KEY (MED_event_type_id) REFERENCES MED_event_type(MED_event_type_id));



ALTER TABLE MED_event
	ADD (CONSTRAINT  rec_open_of_MED_event FOREIGN KEY (MED_rec_open_id) REFERENCES MED_rec(MED_rec_id));



ALTER TABLE MED_event
	ADD (CONSTRAINT  rec_close_of_MED_event FOREIGN KEY (MED_rec_close_id) REFERENCES MED_rec(MED_rec_id));



ALTER TABLE MED_file
	ADD (CONSTRAINT  MED_patient_of_MED_file FOREIGN KEY (MED_patient_id) REFERENCES MED_patient(MED_patient_id));



ALTER TABLE MED_file
	ADD (CONSTRAINT  MED_rec_of_MED_file FOREIGN KEY (MED_rec_id) REFERENCES MED_rec(MED_rec_id));



ALTER TABLE MED_file
	ADD (CONSTRAINT  rubric_of_MED_file FOREIGN KEY (rubric_id) REFERENCES CR_list_value(CR_list_value_id));



ALTER TABLE MED_patient
	ADD (CONSTRAINT  CR_person_of_MED_patient FOREIGN KEY (CR_person_id) REFERENCES CR_person(CR_person_id));



ALTER TABLE MED_patient
	ADD (CONSTRAINT  doc_type_of_MED_patient FOREIGN KEY (doc_type_id) REFERENCES CR_list_value(CR_list_value_id));



ALTER TABLE MED_patient
	ADD (CONSTRAINT  CR_language_of_MED_patient FOREIGN KEY (CR_language_id) REFERENCES CR_language(CR_language_id));



ALTER TABLE MED_patient
	ADD (CONSTRAINT  CR_country_of_MED_patient FOREIGN KEY (CR_country_id) REFERENCES CR_country(CR_country_id));



ALTER TABLE MED_rec
	ADD (CONSTRAINT  MED_type_of_MED_rec FOREIGN KEY (MED_type_id) REFERENCES MED_type(MED_type_id));



ALTER TABLE MED_rec
	ADD (CONSTRAINT  MED_patient_of_MED_rec FOREIGN KEY (MED_patient_id) REFERENCES MED_patient(MED_patient_id));



ALTER TABLE MED_sheet
	ADD (CONSTRAINT  MED_rec_of_MED_sheet FOREIGN KEY (MED_rec_id) REFERENCES MED_rec(MED_rec_id));



ALTER TABLE MED_title
	ADD (CONSTRAINT  MED_patient_of_MED_title FOREIGN KEY (MED_patient_id) REFERENCES MED_patient(MED_patient_id));



ALTER TABLE MED_title
	ADD (CONSTRAINT  blood_grp_of_MED_title FOREIGN KEY (blood_grp_id) REFERENCES CR_list_value(CR_list_value_id));



ALTER TABLE MED_title
	ADD (CONSTRAINT  rh_of_MED_title FOREIGN KEY (rh_id) REFERENCES CR_list_value(CR_list_value_id));



ALTER TABLE MED_title
	ADD (CONSTRAINT  kell_of_MED_title FOREIGN KEY (kell_id) REFERENCES CR_list_value(CR_list_value_id));




-- 1. Sequences

declare
	sqlcommand varchar2(2000);
	maxid integer;

	cursor c1 is
		select table_name
		from user_tab_columns
		where column_name=table_name||'_ID'
		order by table_name;
begin
	for r0 in c1 loop
		sqlcommand:='drop sequence '||r0.table_name||'_SEQ';
		begin
		execute immediate sqlcommand;
		dbms_output.put_line('Sequence '||r0.table_name||'_SEQ dropped.');
		exception when others then
			dbms_output.put_line('Sequence '||r0.table_name||'_SEQ cannot be dropped.');
		end;
		sqlcommand:='select max('||r0.table_name||'_ID) from '||r0.table_name;
		execute immediate sqlcommand into maxid;
		sqlcommand:='create sequence '||r0.table_name||'_SEQ start with '||to_char(nvl(maxid, 0)+1)||' NOMAXVALUE NOMINVALUE NOCYCLE NOCACHE NOORDER';
		execute immediate sqlcommand;
		dbms_output.put_line('Sequence '||r0.table_name||'_SEQ created started with '||to_char(nvl(maxid, 0)+1)||'.');
	end loop;
end;
/
show err




-- 3. Before insert and before update triggers

declare
	triggername varchar2(2000);
	sqlcommand varchar2(2000);
	cursor c1 is
		select utc.table_name
		from user_tab_columns utc
		join user_tables ut on ut.table_name=utc.table_name
		where utc.column_name='CREATE_USER_ID'
		order by utc.table_name;
begin
	for r1 in c1 loop
		triggername:='tBI_'||r1.table_name;
		sqlcommand:='
create or replace trigger '||triggername||'
before insert on '||r1.table_name||' for each row
declare
	v_app_user  varchar2(512);
	v_user_id   number;
begin
	select v(''APP_USER'') into v_app_user from dual;
	if v_app_user is null then
		v_user_id:=-1;
	else
		select cr_user_id into v_user_id from cr_user where upper(login)=upper(v_app_user);
	end if;
	:new.create_user_id:=v_user_id;
	:new.create_date:=sysdate;
end;';
		execute immediate sqlcommand;
		dbms_output.put_line('Trigger '||triggername||' created.');
	end loop;
exception when others then
	dbms_output.put_line('Trigger '||triggername||' has errors:'||SQLERRM);
end;
/
show err

declare
	triggername varchar2(2000);
	sqlcommand varchar2(2000);
	cursor c1 is
		select utc.table_name
		from user_tab_columns utc
		join user_tables ut on ut.table_name=utc.table_name
		where utc.column_name='MODIFY_USER_ID'
		order by utc.table_name;
begin
	for r1 in c1 loop
		triggername:='tBU_'||r1.table_name;
		sqlcommand:='
create or replace trigger '||triggername||'
before update on '||r1.table_name||' for each row
declare
	v_app_user  varchar2(512);
	v_user_id   number;
begin
	select v(''APP_USER'') into v_app_user from dual;
	if v_app_user is null then
		v_user_id:=-1;
	else
		select cr_user_id into v_user_id from cr_user where upper(login)=upper(v_app_user);
	end if;
	:new.modify_user_id:=v_user_id;
	:new.modify_date:=sysdate;
end;';
		execute immediate sqlcommand;
		dbms_output.put_line('Trigger '||triggername||' created.');
	end loop;
exception when others then
	dbms_output.put_line('Trigger '||triggername||' has errors:'||SQLERRM);
end;
/
show err




-- 2. Package headers

@@pkg.all.head.sql




-- 8. Package body


@@pkg.all.body.sql



-- 6. Full and short names triggers

create or replace trigger biu_cr_person
before insert or update on cr_person for each row
begin
	:new.lastname:=upper(:new.lastname);
	:new.firstname:=initcap(:new.firstname);
	:new.patronymic:=initcap(:new.patronymic);
	:new.fullname:=:new.lastname||' '||:new.firstname;
	:new.shortname:=:new.lastname||' '||substr(:new.firstname, 1, 1)||'.';
	if :new.patronymic is not null then
		:new.fullname:=:new.fullname||' '||:new.patronymic;
		:new.shortname:=:new.shortname||substr(:new.patronymic, 1, 1)||'.';
	end if;

	:new.lastname_intl:=upper(:new.lastname_intl);
	:new.firstname_intl:=initcap(:new.firstname_intl);
	:new.patronymic_intl:=initcap(:new.patronymic_intl);
	:new.fullname_intl:=:new.lastname_intl;
	:new.shortname_intl:=:new.lastname_intl;
	if :new.firstname_intl is not null then
		:new.fullname_intl:=:new.fullname_intl||' '||:new.firstname_intl;
		:new.shortname_intl:=:new.shortname_intl||' '||substr(:new.firstname_intl, 1, 1)||'.';
	end if;
	if :new.patronymic_intl is not null then
		:new.fullname_intl:=:new.fullname_intl||' '||:new.patronymic_intl;
		:new.shortname_intl:=:new.shortname_intl||substr(:new.patronymic_intl, 1, 1)||'.';
	end if;
end;
/
show err


