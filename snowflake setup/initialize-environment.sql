

-- needed to allow dbt to connect
create NETWORK POLICY IDENTIFIER('"DBT"') ALLOWED_IP_LIST = ( '52.45.144.63' , '54.81.134.249' , '52.22.161.231' ) COMMENT = '';

USE ROLE ACCOUNTADMIN;

/*
drop database rdg_sandbox;
drop user RDG_LOAD_USER;
drop role rdg_see_all;
*/

---------------------------------------------------------------
-- from accountadmin
create DATABASE IDENTIFIER('RDG_SANDBOX') COMMENT = '';

create role rdg_see_all;

GRANT OPERATE ON WAREHOUSE compute_wh TO ROLE rdg_see_all;
GRANT USAGE ON DATABASE rdg_sandbox TO ROLE rdg_see_all;
GRANT USAGE ON future SCHEMAS IN DATABASE rdg_sandbox TO ROLE rdg_see_all;
GRANT SELECT,INSERT,UPDATE,DELETE ON future TABLES IN DATABASE rdg_sandbox TO ROLE rdg_see_all;

--GRANT ROLE rdg_see_all TO ROLE sysadmin;
GRANT ROLE IDENTIFIER('rdg_see_all') TO USER IDENTIFIER('papag');
GRANT ROLE IDENTIFIER('rdg_see_all') TO USER IDENTIFIER('kumar');

create SCHEMA IDENTIFIER('RDG_SANDBOX.STAGE_01') COMMENT = '';
create SCHEMA IDENTIFIER('RDG_SANDBOX.T0_SRC_01') COMMENT = '';


--GRANT SELECT,INSERT,UPDATE,DELETE ON ALL TABLES IN DATABASE rdg_sandbox TO ROLE rdg_see_all;

---------------------------------------------------------------

create USER IDENTIFIER('RDG_LOAD_USER') 
    COMMENT = '' PASSWORD = '☺☺☺☺☺☺☺☺' 
    MUST_CHANGE_PASSWORD = false 
    LOGIN_NAME = '' FIRST_NAME = 'Service' LAST_NAME = 'Account' DISPLAY_NAME = '' EMAIL = '' 
    DEFAULT_WAREHOUSE = 'COMPUTE_WH' 
    DEFAULT_NAMESPACE = '' 
    DEFAULT_ROLE = 'rdg_see_all'
;


---------------------------------------------------------------
use role rdg_see_all;


GRANT OPERATE ON WAREHOUSE compute_wh TO ROLE public;
GRANT USAGE ON DATABASE rdg_sandbox TO ROLE public;
GRANT USAGE ON future SCHEMAS IN DATABASE rdg_sandbox TO ROLE public;
GRANT SELECT,INSERT,UPDATE,DELETE ON future TABLES IN DATABASE rdg_sandbox TO ROLE public;

