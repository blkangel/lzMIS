set define &

-- login as sys

create tablespace lz datafile '/opt/oracle/oradata/lz/lz001.dbf' SIZE 256M AUTOEXTEND ON NEXT 256M MAXSIZE UNLIMITED;
create user lz identified by lZpa$$ default tablespace lz temporary tablespace temp;
grant connect, resource, CREATE DATABASE LINK to lz;
grant create view to lz;
