
set define off

create or replace package app as
	function app_auth(p_username IN VARCHAR2, p_password IN VARCHAR2) return boolean;
	function hashcode (p_username in varchar2, p_password in varchar2) return varchar2;
	
	function get_privilege_id (a_code in cr_privilege.code%type) return cr_privilege.cr_privilege_id%type;
	function get_list_value_id (a_list_code in cr_list.code%type, a_value_code  in cr_list_value.code%type) return cr_list_value.cr_list_value_id%type;
end app;
/
show err
