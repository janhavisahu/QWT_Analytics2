{{ config(materialized='view', schema='salesmart',
    pre_hook= [before_begin("{{ grant_privilages('salesmart', 'test_role') }}") ])}}

select c.CompanyName,
c.ContactName,
c.country,
sum(o.freight) as summ_of_order
from
    {{ ref('t_customers') }} c
inner join {{ ref('stg_orders_py') }} o on o.CustomerID = c.CUSTOMERID
group by 1,2,3