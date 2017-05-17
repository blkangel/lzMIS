	-- procedure add_cr_menu (
		-- v_parent_code 						cr_menu.code%type
		-- ,v_code 									cr_menu.code%type
		-- ,v_name 									cr_menu.name%type
		-- ,v_name_short							cr_menu.name_short%type
		-- ,v_order_num							cr_menu.order_num%type
		-- ,v_privilege_code					cr_menu.code%type
		-- ,v_target 								cr_menu.name%type
		-- ,v_module_code 						cr_menu.code%type 									default null
		-- ,v_is_current_list_entry	cr_menu.is_current_list_entry%type 	default null
		-- ,v_is_archived						cr_menu.is_archived%type 						default null
		-- ,v_attribute1 						cr_menu.attribute1%type 						default null
		-- ,v_attribute2 						cr_menu.attribute2%type 						default null
		-- ,v_attribute3 						cr_menu.attribute3%type 						default null
		-- ,v_attribute4 						cr_menu.attribute4%type 						default null
		-- ,v_attribute5 						cr_menu.attribute5%type 						default null
	-- );

--------------------------------------------------------
--------MAIN_MENU---------------------------------------
--------------------------------------------------------
------------------------
-----Главная------------
------------------------
exec admin.add_cr_menu(null,'HOME', 'Главная','Главная',1000, 'MAIN_MENU','f?p=&APP_ID.:1:&SESSION.::&DEBUG.::::',null,'1');
------------------------
-----Настройки------------
------------------------
exec admin.add_cr_menu(null,'SETTING', 'Настройки','Настройки',9000, 'MAIN_MENU',null, 'CR');
	exec admin.add_cr_menu('SETTING','SETTING.GENERAL', 'Основные','Основные',9010, 'MAIN_MENU',null, 'CR');
		exec admin.add_cr_menu('SETTING.GENERAL','SETTING.MODULE', 'Модули','Модули',9020, 'MAIN_MENU','f?p=&APP_ID.:102:&SESSION.::&DEBUG.::::', 'CR','102');
		exec admin.add_cr_menu('SETTING.GENERAL','SETTING.PRIVILEGE', 'Привилегии','Привилегии',9030, 'MAIN_MENU','f?p=&APP_ID.:103:&SESSION.::&DEBUG.::::', 'CR','103');
		exec admin.add_cr_menu('SETTING.GENERAL','SETTING.USERS', 'Сотрудники','Сотрудники',9040, 'MAIN_MENU','f?p=&APP_ID.:110:&SESSION.::&DEBUG.::::', 'CR','110');
------------------------
-----Выход------------
------------------------
exec admin.add_cr_menu(null,'EXIT', 'Выход','Выход',10000, 'MAIN_MENU','apex_authentication.logout?p_app_id=&APP_ID.&amp;p_session_id=&SESSION.');

commit;