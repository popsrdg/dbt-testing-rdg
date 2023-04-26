
-- set up a database with some users and roles and basic assignments
-- database name
--      set v_db_name = 'rdg_stage';
-- warehouse name
--      set v_warehouse_name = 'rdg_warehouse'
-- read/write role name
--      set v_role_rw = 'rdg_rw';
create database rdg_stage;
CREATE warehouse rdg_warehouse with warehouse_size = 'SMALL';
create role rdg_rw;

use rdg_stage;

grant IMPORTED PRIVILEGES on database snowflake_sample_data to role rdg_rw;
grant select on all tables in schema snowflake_sample_data.tpch_sf10 to role rdg_rw;

grant usage on database rdg_stage to role rdg_rw;
grant modify on database rdg_stage to role rdg_rw;
grant monitor on database rdg_stage to role rdg_rw;
grant create schema on database rdg_stage to role rdg_rw;

grant operate on warehouse rdg_warehouse to role rdg_rw;
grant usage on warehouse rdg_warehouse to role rdg_rw;


grant role rdg_rw to user papag; 
grant role rdg_rw to user kumar; 

