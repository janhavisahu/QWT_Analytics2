{{ config(
    materialized='view', schema = 'salesmart',
    pre_hook= ['GRANT SELECT ON {{ this }} TO ROLE test_role;']
)}}

select od.*,
o.CUSTOMERID,
o.EMPLOYEEID,
o.SHIPPERID,
o.FREIGHT,
-- o.ORDERDATE
o.ORDERMONTH,
o.ORDERYEAR
 from

{{ref("t_orders")}} o
join {{ ref("t_order_details")}} od
on o.orderid = od.orderid