{{ config(materialized="view", schema="reporting") }}

select e.empid,
e.emp_name,
o.ORDERMONTH,
e.city,
round(sum(o.linesalesamount),2) sales,
round(avg(o.margin),2) margin
    from {{ ref("fact_orders")}} o
join {{ ref("t_employees")}} e on o.employeeid = e.empid
-- where e.city = '{{ var('city')}}'
group by 1,2,3,4
order by sales desc
limit 10