{{ config(materialized='table') }}

select * from {{ source('raw', 'products')}}


--QWT_ANALYTICS.RAW.products