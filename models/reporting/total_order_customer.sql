{{ config(materialized='view',schema='reporting')}}

with cust as (
    select * 
    from {{ ref('dim_customers')}}
),

orders as(
    select *
    from {{ ref('fact_orders')}}
),

cust_order as (
    select c.customerid,
    c.CompanyName,
    c.ContactName,
    min(o.ORDERDATE) as min_orderdate,
    max(o.ORDERDATE) as max_orderdate,
    count(o.ORDERID) as total_orders

    from orders o join cust c on o.customerid=c.customerid
    group by 1,2,3
    
)

select * from cust_order