	-- procedure add_cr_menu (
		-- v_parent_code 		cr_menu.code%type		
		-- ,v_code 					cr_menu.code%type
		-- ,v_name 					cr_menu.name%type
		-- ,v_name_short			cr_menu.name_short%type
		-- ,v_order_num			cr_menu.order_num%type
		-- ,v_privilege_code	cr_menu.code%type		
		-- ,v_target 				cr_menu.name%type		
		-- ,v_is_archived		cr_menu.is_archived%type 	default null
		-- ,v_module_code 		cr_menu.code%type 				default null
		-- ,v_attribute1 		cr_menu.attribute1%type 	default null
		-- ,v_attribute2 		cr_menu.attribute2%type 	default null
		-- ,v_attribute3 		cr_menu.attribute3%type 	default null
		-- ,v_attribute4 		cr_menu.attribute4%type 	default null
		-- ,v_attribute5 		cr_menu.attribute5%type 	default null
	-- );

--------------------------------------------------------
--------MAIN_MENU---------------------------------------
--------------------------------------------------------
------------------------
-----Главная------------
------------------------
exec admin.add_cr_menu(null,'HOME', 'Главная','Главная',1000, 'MAIN_MENU','f?p=&APP_ID.:1:&SESSION.::&DEBUG.::::');
------------------------
-----Выход------------
------------------------
exec admin.add_cr_menu(null,'EXIT', 'Выход','Выход',10000, 'MAIN_MENU','apex_authentication.logout?p_app_id=&APP_ID.&amp;p_session_id=&SESSION.');

