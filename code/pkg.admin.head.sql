
set define off

create or replace package admin as
	procedure add_cr_right (
		a_table_name				in cr_right.table_name%type						default null,		
		a_column_name 			in cr_right.column_name%type					default null,
		a_row_id 						in cr_right.row_id%type 							default null,
		a_code 							in cr_right.code%type									default null,
		a_cr_privilege_id		in cr_right.cr_privilege_id%type			default null,
		a_privilege_code		in cr_privilege.code%type							default null,
		a_cr_role_id				in cr_right.cr_role_id%type					default null,
		a_cr_role_code			in cr_role.code%type									default null,
		a_cr_user_id				in cr_right.cr_user_id%type					default null,
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
		v_parent_code 		cr_menu.code%type		
		,v_code 					cr_menu.code%type
		,v_name 					cr_menu.name%type
		,v_name_short			cr_menu.name_short%type
		,v_order_num			cr_menu.order_num%type
		,v_type_menu_code cr_menu.code%type		
		,v_privilege_code	cr_menu.code%type		
		,v_target 				cr_menu.name%type		
		,v_is_archived		cr_menu.is_archived%type default null
		,v_module_code 		cr_menu.code%type default null
		,v_attribute1 		cr_menu.attribute1%type default null
		,v_attribute2 		cr_menu.attribute2%type default null
		,v_attribute3 		cr_menu.attribute3%type default null
		,v_attribute4 		cr_menu.attribute4%type default null
		,v_attribute5 		cr_menu.attribute5%type default null
	);	
end admin;
/
show err
