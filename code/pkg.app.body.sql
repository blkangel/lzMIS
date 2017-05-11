
set define off

create or replace package body app as

	--================================================================
	function error_subject return varchar2 is
		v_host_name						varchar2(1024):=upper(SYS_CONTEXT('USERENV', 'SERVER_HOST'));
		v_user_name						varchar2(1024):=upper(SYS_CONTEXT('USERENV', 'CURRENT_SCHEMA'));
	Begin
		return 'Сервер = '||upper(v_host_name)||', схема = '||v_user_name;
	End;

	--================================================================
	function error_message return varchar2 is 
	Begin
		return chr(10)||chr(13)||'Сообщение об ошибке: '||SQLERRM;
	end;

	--================================================================
	function recipients return varchar2 is
		v_recipients	varchar2(4000);
	Begin
		v_recipients:='blkangel@mail.ru';
		return v_recipients;
		exception when OTHERS then return null;
	End recipients;

	-- ================================================================
	-- procedure send_error_mail (a_subject in varchar2, a_message in varchar2 default null) is
		-- v_mail_err		varchar2(32767);
	-- Begin
		-- tools.sendEMAIL(
			-- 'blkangel@mail.ru'
			-- ,recipients
			-- ,error_subject||'. '||a_subject
			-- ,a_message||' '||error_message
			-- ,v_mail_err
		-- );
	-- End;
			
	
	function app_auth(p_username in varchar2, p_password in varchar2) return boolean is
		v_exists integer;
	Begin
		if p_password is null then
			return false;
		end if;

		select 1 into v_exists
		from CR_user
		where login=upper(p_username) 
		and password=hashcode(upper(p_username), p_password) 
		and is_archived is null;
		
		return true;
		exception when others then return false;
	end app_auth;

	--================================================================
	function hashcode(p_username in varchar2, p_password in varchar2) return varchar2 is
		l_password 	varchar2(4000);
		l_key 			varchar2(4000) := 'RAFJSDF24GDHFGRMI5WEGUQ8SCPMBDJWSBW5ERHWE';
	Begin
		--This function need wrapped
		l_password := utl_raw.cast_to_raw(
			dbms_obfuscation_toolkit.md5(
				input_string => p_password || substr(l_key, 7, 19) || p_username || substr(l_key, 15, 29)
			)
		);
		return l_password;
	end hashcode;
	
	function get_privilege_id (a_code in cr_privilege.code%type) return cr_privilege.cr_privilege_id%type is
		v_privilege_id cr_privilege.cr_privilege_id%type;
	Begin
		select cr_privilege_id into v_privilege_id from cr_privilege where code=upper(a_code);
		return v_privilege_id;
		exception when no_data_found then return null;
	End get_privilege_id;
	
	function get_list_value_id (a_list_code in cr_list.code%type, a_value_code  in cr_list_value.code%type) return cr_list_value.cr_list_value_id%type is
		v_list_id 	cr_list.cr_list_id%type;
		v_value_id 	cr_list_value.cr_list_value_id%type;
	begin
		begin
			select cr_list_id into v_list_id from cr_list where code=upper(a_list_code);
			exception when no_data_found then return null;
		end;
		select cr_list_value_id into v_value_id from cr_list_value where cr_list_id=v_list_id and code=upper(a_value_code);
		return v_value_id;
		exception when no_data_found then	return null;
	end get_list_value_id;
end app;

/
show err


