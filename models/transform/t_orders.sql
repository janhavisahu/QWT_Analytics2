{{ config(materialized="table", schema="transform") }}

select
    orderid,
    customerid,
    employeeid,
    shipperid,
    freight,
    orderdate,
    MONTHNAME(orderdate) as ordermonth,
    year(orderdate) as orderyear
from {{ ref("stg_orders") }}
