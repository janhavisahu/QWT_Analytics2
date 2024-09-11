{{ config(materialized='table') }}

select * from --QWT_ANALYTICS.RAW.CUSTOMERS
{{ source('raw', 'customers')}}