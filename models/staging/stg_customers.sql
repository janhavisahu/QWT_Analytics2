{{ config(materialized='table', sort = 'city') }}

select * from --QWT_ANALYTICS.RAW.CUSTOMERS
{{ source('raw', 'customers')}}