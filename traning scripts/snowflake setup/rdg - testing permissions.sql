

-- switch to database and schema
use DATABASE rdg_stage;

CREATE SCHEMA rdg_test_schema comment = 'this is a test schema to check permissions';

use SCHEMA rdg_test_schema;
SHOW SCHEMAS;

SELECT CURRENT_SCHEMA();

---------------------------------------------------------------
-- create test table and then confirm role above has access
create or replace table testb AS
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

