
set define off

create or replace package body admin as

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

	) is
		v_cr_privilege_id 	cr_right.cr_privilege_id%type;
		v_access_type_id		cr_list_value.cr_list_value_id%type;
		v_cr_role_id				cr_role.cr_role_id%type;
		
	Begin
		if a_cr_privilege_id is null then
			v_cr_privilege_id:=app.get_privilege_id(a_privilege_code);
		end if;
		if a_access_type_id is null then
			v_access_type_id:=app.get_list_value_id('ACCESS_TYPE', a_access_type_code);
		end if;	
		if a_cr_role_id is null then
			Begin 
				select cr_role_id into v_cr_role_id from cr_role where code=a_cr_role_code;
				exception when no_data_found then v_cr_role_id:=null;
			end;
		end if;	
		
		insert into cr_right (
			cr_right_id
			,table_name
			,column_name
			,row_id
			,code
			,cr_privilege_id
			,cr_role_id
			,cr_user_id
			,date_from
			,date_to
			,access_type_id
			,months_from
			,days_from
			,months_to
			,days_to
		) values (
			cr_right_seq.nextval
			,a_table_name	
			,a_column_name
			,a_row_id	
			,a_code			
			,nvl(v_cr_privilege_id, a_cr_privilege_id)
			,nvl(v_cr_role_id, a_cr_role_id)	
			,a_cr_user_id	
			,a_date_from	
			,a_date_to		
			,nvl(v_access_type_id,a_access_type_id)
			,a_months_from
			,a_days_from	
			,a_months_to		
			,a_days_to		
		);
	End add_cr_right;


	procedure add_cr_menu (
		v_parent_code 		cr_menu.code%type		
		,v_code 					cr_menu.code%type
		,v_name 					cr_menu.name%type
		,v_name_short			cr_menu.name_short%type
		,v_order_num			cr_menu.order_num%type
		,v_privilege_code	cr_menu.code%type		
		,v_target 				cr_menu.name%type		
		,v_is_archived		cr_menu.is_archived%type 	default null
		,v_module_code 		cr_menu.code%type 				default null
		,v_attribute1 		cr_menu.attribute1%type 	default null
		,v_attribute2 		cr_menu.attribute2%type 	default null
		,v_attribute3 		cr_menu.attribute3%type 	default null
		,v_attribute4 		cr_menu.attribute4%type 	default null
		,v_attribute5 		cr_menu.attribute5%type 	default null
	) is
		r_cr_menu				cr_menu%rowtype;
	
	Begin
		if v_code is null then 
			return;
		end if;
		r_cr_menu.create_user_id		:=-1;
		r_cr_menu.create_date				:=sysdate;
		r_cr_menu.cr_privilege_id		:=app.get_privilege_id(v_privilege_code);		
		r_cr_menu.code							:=upper(v_code);
		r_cr_menu.name							:=v_name;
		r_cr_menu.name_short				:=v_name_short;
		r_cr_menu.order_num					:=v_order_num;
		r_cr_menu.target						:=v_target;
		r_cr_menu.is_archived				:=v_is_archived;
		r_cr_menu.attribute1				:=v_attribute1;
		r_cr_menu.attribute2				:=v_attribute2;
		r_cr_menu.attribute3				:=v_attribute3;
		r_cr_menu.attribute4				:=v_attribute4;
		r_cr_menu.attribute5				:=v_attribute5;

		Begin
			select cr_menu_id, create_date, create_user_id into r_cr_menu.cr_menu_id, r_cr_menu.create_date, r_cr_menu.create_user_id from cr_menu where code=r_cr_menu.code;
			exception when no_data_found then null;
		End;
		--dbms_output.put_line('r_cr_menu.cr_menu_id='||to_char(r_cr_menu.cr_menu_id));
		Begin
			select cr_menu_id into r_cr_menu.parent_id from cr_menu where code=upper(v_parent_code);
			exception when no_data_found then null;
		End;
		--dbms_output.put_line('r_cr_menu.parent_id='||to_char(r_cr_menu.parent_id));
		Begin
			select CR_module_id into r_cr_menu.CR_module_id from CR_module where code=upper(v_module_code);
			exception when no_data_found then null;
		End;
		--dbms_output.put_line('r_cr_menu.CR_module_id='||to_char(r_cr_menu.CR_module_id));
		if r_cr_menu.cr_menu_id is null then
			r_cr_menu.cr_menu_id:=CR_menu_seq.nextval;
			insert into cr_menu values r_cr_menu;
		else 
			update cr_menu set row=r_cr_menu
			where cr_menu_id= r_cr_menu.cr_menu_id;
		end if;
		
		insert into CR_right (cr_right_id, code, cr_privilege_id, CR_role_id)
		select cr_right_seq.nextval, code, r_cr_menu.cr_privilege_id, (select CR_role_id from CR_role where code='DBA') 
		from cr_menu km where  km.cr_menu_id=r_cr_menu.cr_menu_id
		and not exists (select 1 from CR_right r where r.code=km.code and r.cr_privilege_id=r_cr_menu.cr_privilege_id and r.CR_role_id=(select CR_role_id from CR_role where code='DBA'));
	End add_cr_menu;
	
	function add_cr_list (a_code in cr_list.code%type, a_name in cr_list.name%type) return cr_list.cr_list_id%type is
		v_cr_list_id 	cr_list.cr_list_id%type;
	Begin
		Begin
			select cr_list_id into v_cr_list_id from cr_list where code=upper(a_code);
			exception when no_data_found then v_cr_list_id:=null;
		End;
		if v_cr_list_id is null then
			v_cr_list_id:=cr_list_seq.nextval;
			insert into cr_list (
				cr_list_id
				,code
				,name
			) values (
				v_cr_list_id
				,upper(a_code)
				,a_name
			);
		else 
			update cr_list set
				code=upper(a_code)
				,name=a_name
			where cr_list_id=v_cr_list_id;
		end if;
		return v_cr_list_id;
	End add_cr_list;
	
	procedure add_cr_list (a_code in cr_list.code%type, a_name in cr_list.name%type) is
		v_cr_list_id 	cr_list.cr_list_id%type;
	Begin
		v_cr_list_id:=add_cr_list(a_code, a_name);
	End add_cr_list;
	
	--function add_cr_list_value (
	--
	--) return cr_list_value.cr_list_id%type
end admin;

/
show err


