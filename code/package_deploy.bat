@echo off
setlocal EnableDelayedExpansion
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
		echo  %%f
		exit | sqlplus -S %login%/%password%@%serverid% @%%f
	)
)
setlocal EnableDelayedExpansion
set ext=plb
for %%f IN (pkg.*.body.sql) DO (

	if NOT %%f==pkg.all.body.sql (
		::echo %%f
		set sqlfile=%%f	
		set plbfile=!sqlfile:~0,-4!%ext%
		echo !plbfile!
		wrap iname=%%f oname=wrapped\!plbfile!
		exit | sqlplus -S %login%/%password%@%serverid% @wrapped\!plbfile!
	)
)
endlocal
pause 