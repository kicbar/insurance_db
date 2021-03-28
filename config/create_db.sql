/* connect to db as DBA -> sysdba user */

ALTER SESSION SET "_ORACLE_SCRIPT" = true;  
CREATE USER insurance_db IDENTIFIED BY passwd123;
GRANT ALL PRIVILEGES TO insurance_db;

/*
order during installation:
sequences.sql
tables.sql
synonyms.sql
views.sql
procedures.sql
functions.sql
triggers.sql
insert_data.sql
*/