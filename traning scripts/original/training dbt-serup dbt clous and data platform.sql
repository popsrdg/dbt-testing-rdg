

--drop database analytics;

create database analytics;

CREATE warehouse transforming with warehouse_size = 'SMALL';

create role transformer;

grant IMPORTED PRIVILEGES on database snowflake_sample_data to role transformer;
grant usage on schema snowflake_sample_data.tpch_sf10 to role transformer;
-- issue above
grant select on all tables in schema snowflake_sample_data.tpch_sf10 to role transformer;

grant usage on database analytics to role transformer;
grant reference_usage on database analytics to role transformer;
-- issue above
grant modify on database analytics to role transformer;
grant monitor on database analytics to role transformer;
grant create schema on database analytics to role transformer;

grant operate on warehouse transforming to role transformer;
grant usage on warehouse transforming to role transformer;


grant role transformer to user papag; 