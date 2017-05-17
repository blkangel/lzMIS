
insert into cr_module (cr_module_id, code, name, date_from) values(cr_module_seq.nextval, 'CR', 'ядро', sysdate);
insert into cr_module (cr_module_id, code, name, date_from) values(cr_module_seq.nextval, 'MED', 'ћедицинский модуль', sysdate);

insert into cr_role (cr_role_id, code, name) values (cr_role_seq.nextval, 'DBA','—истемный администратор');

declare
	v_id		cr_person.cr_person_id%type;
Begin
	v_id:=cr_person_seq.nextval;
	insert into cr_person (cr_person_id, lastname, firstname) values (v_id, 'LEBEDEV', 'Vladimir');
	insert into cr_user (cr_user_id, cr_person_id, login, password) values (cr_user_seq.nextval, v_id, 'VLEBEDEV','1B1D204D974742E47BD27251FE0C3842');
	
	v_id:=cr_person_seq.nextval;
	insert into cr_person (cr_person_id, lastname, firstname) values (v_id, 'ZELENEVA', 'Evgeniya');
	insert into cr_user (cr_user_id, cr_person_id, login, password) values (cr_user_seq.nextval, v_id, 'EZELENEVA','780934CED076FE3DA7C9B87FAF4644FD');	
	insert into cr_user_role (cr_user_role_id, cr_role_id, cr_user_id) select cr_user_role_seq.nextval, (select cr_role_id from cr_role where code='DBA'), cr_user_id from cr_user;
	
	v_id:=cr_person_seq.nextval;
	insert into cr_person (cr_person_id, lastname, firstname) values (v_id, 'DOCTOR', 'Doctor');
	insert into cr_user (cr_user_id, cr_person_id, login, password) values (cr_user_seq.nextval, v_id, 'DOCTOR',null);	

	v_id:=cr_person_seq.nextval;
	insert into cr_person (cr_person_id, lastname, firstname) values (v_id, 'TEST', 'Person');
	insert into cr_user (cr_user_id, cr_person_id, login, password) values (cr_user_seq.nextval, v_id, 'TEST_USER',null);		
	commit;
End;
/

insert into cr_privilege (cr_privilege_id, code, name) values (cr_privilege_seq.nextval, 'MAIN_MENU', '√лавное меню');

commit;