-- models/c.sql
{{ 
    config(
        materialized='table', 
        schema='my_external_schema', 
        alias='c'
    ) 
}}

-- This model selects data from sources a and b and inserts it into c
--
-- The c table contains data about customers and orders from external systems a and b.
-- The fields in this table include the customer ID, order ID, order date, and total order amount.
--
-- For more information about this table, please contact the owner of the external systems.
SELECT
  a.customer_id,
  b.order_id,
  b.order_date,
  b.total_amount
FROM {{ source('a', 'a') }} a
JOIN {{ source('b', 'b') }} b
  ON a.customer_id = b.customer_id
