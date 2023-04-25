-- Testing

select top 100 * from snowflake.information_schema.columns
;

/*
drop database rdg_sandbox;
drop user RDG_LOAD_USER;
drop role rdg_see_all;
*/


---------------------------------------------------------------
-- from accountadmin
USE ROLE ACCOUNTADMIN;
create DATABASE IDENTIFIER('RDG_SANDBOX') COMMENT = '';

---------------------------------------------------------------
-- create role and assign to users
create role rdg_see_all;
--GRANT ROLE rdg_see_all TO ROLE sysadmin;
GRANT ROLE IDENTIFIER('rdg_see_all') TO USER IDENTIFIER('rdg_load_user');
GRANT ROLE IDENTIFIER('rdg_see_all') TO USER IDENTIFIER('papag');
GRANT ROLE IDENTIFIER('rdg_see_all') TO USER IDENTIFIER('kumar');

---------------------------------------------------------------
-- add privileges to role
GRANT ALL PRIVILEGES ON DATABASE RDG_SANDBOX TO ROLE rdg_see_all;
GRANT ALL PRIVILEGES ON FUTURE SCHEMAS IN DATABASE RDG_SANDBOX TO ROLE rdg_see_all;
--GRANT ALL PRIVILEGES ON ALL SCHEMAS IN DATABASE RDG_SANDBOX TO ROLE rdg_see_all;
GRANT ALL PRIVILEGES ON FUTURE TABLES IN DATABASE RDG_SANDBOX TO ROLE rdg_see_all;
--GRANT ALL PRIVILEGES ON ALL TABLES IN DATABASE RDG_SANDBOX TO ROLE rdg_see_all;
GRANT OPERATE ON WAREHOUSE compute_wh TO ROLE rdg_see_all;
--GRANT USAGE ON DATABASE rdg_sandbox TO ROLE rdg_see_all;
--GRANT USAGE ON future SCHEMAS IN DATABASE rdg_sandbox TO ROLE rdg_see_all;
--GRANT SELECT,INSERT,UPDATE,DELETE ON future TABLES IN DATABASE rdg_sandbox TO ROLE rdg_see_all;


GRANT MONITOR ON ACCOUNT TO ROLE IDENTIFIER('"RDG_SEE_ALL"') WITH GRANT OPTION;
GRANT EXECUTE TASK ON ACCOUNT TO ROLE IDENTIFIER('"RDG_SEE_ALL"') WITH GRANT OPTION;



---------------------------------------------------------------
-- create schemas
create SCHEMA IDENTIFIER('RDG_SANDBOX.STAGE_01') COMMENT = '';
create SCHEMA IDENTIFIER('RDG_SANDBOX.T0_SRC_01') COMMENT = '';

--GRANT SELECT,INSERT,UPDATE,DELETE ON ALL TABLES IN DATABASE rdg_sandbox TO ROLE rdg_see_all;
---------------------------------------------------------------

---------------------------------------------------------------
-- create load users
create USER IDENTIFIER('RDG_LOAD_USER') 
    COMMENT = '' PASSWORD = 'applesaregood' 
    MUST_CHANGE_PASSWORD = false 
    LOGIN_NAME = '' FIRST_NAME = 'Service' LAST_NAME = 'Account' DISPLAY_NAME = '' EMAIL = '' 
    DEFAULT_WAREHOUSE = 'COMPUTE_WH' 
    DEFAULT_NAMESPACE = '' 
    DEFAULT_ROLE = 'rdg_see_all'
;


---------------------------------------------------------------
-- create test table and then confirm role above has access
create or replace table rdg_sandbox.stage_01.testb AS
    select
    ROW_NUMBER() OVER(ORDER BY 1 desc) AS gen_id_v1
    ,1000 + ROW_NUMBER() OVER(ORDER BY 1 desc) AS gen_id_v2
    ,'ABC' ||'-'|| TO_CHAR(1000 + ROW_NUMBER() OVER(ORDER BY 1 desc)) AS gen_id_v3
    ,uuid_string() as gen_id_v4
    , dateadd('minutes', uniform(1, 60, random()), current_timestamp()) as gen_rand_timestamp_v1
    ,dateadd('days', uniform(1, 15, random()), gen_rand_timestamp_v1) as gen_rand_timestamp_v2
    FROM TABLE(GENERATOR(rowcount => 250))
;

use warehouse compute_wh;
use role rdg_see_all;
USE ROLE ACCOUNTADMIN;
select * from rdg_sandbox.stage_01.testa;


