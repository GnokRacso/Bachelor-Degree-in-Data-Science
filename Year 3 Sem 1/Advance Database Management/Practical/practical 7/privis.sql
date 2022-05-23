set echo on

desc user_sys_privs;

desc user_tab_privs_made;

desc user_tab_privs_recd;

desc user_col_privs_recd;

desc user_role_privs;

desc role_sys_privs;

desc role_tab_privs;

desc user_tables;

desc user_tab_columns;

desc user_constraints;

desc user_cons_columns;

desc user_sequences;

desc user_indexes;

desc user_ind_columns;

desc user_views;

desc user_source;

set linesize 132
set wrap off
column USERNAME  format a15
column PRIVILEGE format a35
column GRANTEE   format a15
column TABLE_NAME format a15
column GRANTOR    format a15
column OWNER      format a15
column COLUMN_NAME format a15
column GRANTED_ROLE format a10
column DATA_TYPE format a15
column CONSTRAINT_NAME format a20
column SEARCH_CONDITION format a30

column INDEX_NAME format a20
column INDEX_TYPE format a15
column TABLE_OWNER format a15
column TABLE_TYPE  format a10
column CONSTRAINT_TYPE format a15
--Checking user system privileges
Select * from user_sys_privs;

--Checking object privileges made
Select * from user_tab_privs_made;

--Checking object privileges received
Select * from user_tab_privs_recd;
Select * from user_col_privs_recd;

--Checking roles granted to a user
Select * from user_role_privs;

--Checking system privileges granted to a role
Select * from role_sys_privs order by role;

--Checking object privileges granted to a role
--Select * from role_tab_privs order by owner;

--Getting information on tables
Select table_name from user_tables;

--For DBA users
Select owner, table_name, tablespace_name 
from user_tables order by owner;


--Getting information on columns in tables
Select TABLE_NAME,COLUMN_NAME, DATA_TYPE , DATA_LENGTH, DATA_PRECISION, DATA_SCALE 
from user_tab_columns
order by table_name;

--Getting information on constraints
Select OWNER,CONSTRAINT_NAME,CONSTRAINT_TYPE,TABLE_NAME,SEARCH_CONDITION,DELETE_RULE,STATUS
 from user_constraints order by owner, table_name;

--Getting information on the constraints on a column
Select * from user_cons_columns;

--Getting information on sequences
Select * from user_sequences;

--Getting information on indexes
Select INDEX_NAME,INDEX_TYPE,TABLE_OWNER,TABLE_NAME,TABLE_TYPE,UNIQUENESS 
from user_indexes order by table_owner, table_name;


--Getting information on the indexes on a column
Select * from user_ind_columns order by table_name;

--Getting information on view definitions
Select  VIEW_NAME,TEXT_LENGTH,TEXT,READ_ONLY from user_views;

--Getting information of PL/SQL code
Select  * from user_source;

set echo off
clear columns
set wrap on