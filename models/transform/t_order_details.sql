{{ config(materialized="table", schema="transform") }}

select
    od.*,
    (od.UnitPrice * od.Quantity) * (1 - od.Discount) as linesalesamount,
    (p."UnitCost"* od.Quantity) as costofgoodssold,
    ((od.UnitPrice * od.Quantity) * (1 - od.Discount))
    - (p."UnitCost" * od.Quantity) as margin
from {{ ref("stg_order_details") }} as od

inner join {{ ref("t_products") }} as p on od.productid = p."ProductID"
