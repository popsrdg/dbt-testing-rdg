
create warehouse transforming;
create database raw;
create database analytics;
create schema raw.jaffle_shop;
create schema raw.stripe;



​​create table raw.jaffle_shop.customers 
( idx INTEGER,
  first_name varchar,
  last_name varchar
);
