



-- setting and checking the seach path
SHOW PARAMETERS LIKE '%path%';
SELECT current_schemas();
ALTER SESSION SET search_path='$current, $public, rdg_stage.rdg_test_schema';
ALTER SESSION SET search_path='$public, rdg_stage.rdg_test_schema, $current';

