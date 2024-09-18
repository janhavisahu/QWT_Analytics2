{{ config(materialized="table", schema="salesmart") }}

with shipment as (
    select * from {{ ref("snps_shipments")}}
),

shipper as (
    select * from {{ ref("lpk_shippers")}}
)

select sh.*, sp.companyname from 
shipment sh
left join shipper sp on sh.SHIPPERID=sp.SHIPPERID