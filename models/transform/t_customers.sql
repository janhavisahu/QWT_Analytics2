{{ config(materialized="table", schema = 'transform') }}

select
    *,
    case when stateprovince = '' then 'NA' else stateprovince end as state
from {{ ref("stg_customers") }}