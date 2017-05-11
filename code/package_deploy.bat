@echo off
chcp 1251
set NLS_LANG=AMERICAN_AMERICA.CL8MSWIN1251
@cls

echo %NLS_LANG%

echo ВНИМАНИЕ! Кодирование пакетов
echo Нажмите любую клавишу для продолжения для продолжения или Ctrl-C для выхода.
::pause 
:: -------------------- deploy 

set serverid=lz
set login=lz
set password=lZpa$$



set NLS_LANG=AMERICAN_AMERICA.AL32UTF8
for %%f IN (pkg.*.head.sql) DO (
	
	if NOT %%f==pkg.all.head.sql (
		::echo  %%f
		exit | sqlplus -S %login%/%password%@%serverid% @%%f
	)
)
SETLOCAL ENABLEEXTENSIONS
set ext=plb
for %%f IN (pkg.*.body.sql) DO (
		echo %%f
		set /p sqlfile=<%%f	
		echo %sqlfile%
		pause
	if NOT %%f==pkg.all.body.sql (
		echo %%f
		set sqlfile=%%f	
		::pause
		echo %sqlfile%
		set noext=%sqlfile:~0,-3%
		set plbfile=%noext%%ext%
		echo %plbfile%
		
		wrap iname=%%f oname=wrapped\%plbfile%
		exit | sqlplus -S %login%/%password%@%serverid% @wrapped\%plbfile%
	)
)
pause 