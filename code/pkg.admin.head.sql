
set define off

create or replace package admin as
	procedure add_cr_right (
		a_table_name				in cr_right.table_name%type						default null,		
		a_column_name 			in cr_right.column_name%type					default null,
		a_row_id 						in cr_right.row_id%type 							default null,
		a_code 							in cr_right.code%type									default null,
		a_cr_privilege_id		in cr_right.cr_privilege_id%type			default null,
		a_privilege_code		in cr_privilege.code%type							default null,
		a_cr_role_id				in cr_right.cr_role_id%type						default null,
		a_cr_role_code			in cr_role.code%type									default null,
		a_cr_user_id				in cr_right.cr_user_id%type						default null,
		a_date_from					in cr_right.date_from%type						default null,
		a_date_to						in cr_right.date_to%type							default null,
		a_access_type_id		in cr_right.access_type_id%type				default null,
		a_access_type_code	in cr_list_value.code%type						default null,
		a_months_from				in cr_right.months_from%type					default null,
		a_days_from					in cr_right.days_from%type						default null,
		a_months_to					in cr_right.months_to%type						default null,
		a_days_to						in cr_right.days_to%type							default null

	);
	procedure add_cr_menu (
		v_parent_code 						cr_menu.code%type
		,v_code 									cr_menu.code%type
		,v_name 									cr_menu.name%type
		,v_name_short							cr_menu.name_short%type
		,v_order_num							cr_menu.order_num%type
		,v_privilege_code					cr_menu.code%type
		,v_target 								cr_menu.name%type
		,v_module_code 						cr_menu.code%type 										default null
		,v_is_current_list_entry	cr_menu.is_current_list_entry%type 		default null
		,v_is_archived						cr_menu.is_archived%type 							default null
		,v_attribute1 						cr_menu.attribute1%type 							default null
		,v_attribute2 						cr_menu.attribute2%type 							default null
		,v_attribute3 						cr_menu.attribute3%type 							default null
		,v_attribute4 						cr_menu.attribute4%type 							default null
		,v_attribute5 						cr_menu.attribute5%type 							default null
	);	
	function add_cr_list (a_code in cr_list.code%type, a_name in cr_list.name%type) return cr_list.cr_list_id%type;
	
	procedure add_cr_list (a_code in cr_list.code%type, a_name in cr_list.name%type);
		function add_cr_list_value (
		a_list_code   			cr_list.code%type
		,a_value_code				cr_list_value.code%type
		,a_value_name				cr_list_value.name%type				
		,a_value_name_short	cr_list_value.name_short%type		default null
		,a_value_order			cr_list_value.order_num%type		default null
	) return cr_list_value.cr_list_value_id%type;
	procedure add_cr_list_value (
		a_list_code   			cr_list.code%type
		,a_value_code				cr_list_value.code%type
		,a_value_name				cr_list_value.name%type				
		,a_value_name_short	cr_list_value.name_short%type		default null
		,a_value_order			cr_list_value.order_num%type		default null
	);	
	function fill_cache_privilege (a_login in cr_user.login%type) return cr_user.cr_user_id%type;
end admin;
/
show err
