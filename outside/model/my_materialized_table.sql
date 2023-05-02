-- models/my_materialized_table.sql
{{ 
    config(
        materialized='table', 
        schema='my_database_schema', 
        alias='my_materialized_table'
    ) 
}}

-- This model selects data from the external c table and materializes it into my_materialized_table
--
-- The my_materialized_table contains data about customers and orders from external systems a and b.
-- The fields in this table include the customer ID, order ID, order date, and total order amount.
--
-- This table can be used to generate reports or join with other tables in the my_database_schema.
SELECT *
FROM {{ ref('c') }}
