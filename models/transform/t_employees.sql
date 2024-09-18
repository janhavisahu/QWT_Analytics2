with emp as 
(
    select 
    em.empid,
    em.first_name as emp_name,
    em.title as emp_role,
    em.hire_date as doj,
    em.extension,
    em.year_salary as salary,
    iff(mg.first_name is null, em.first_name, mg.first_name) as manager_name,
    iff(mg.title is null, em.title, mg.title) as manager_role

    from {{ ref("stg_employees") }} as em

    left join {{ ref("stg_employees") }} mg on em.reports_to = mg.empid
    order by 1
),

ofc as (select * from {{ ref("stg_office")}})

select emp.*,
ofc.address,
ofc.city,
ofc.postalcode,
ofc.phone,
ofc.country
 from emp
left join ofc on emp.empid=ofc.officeid
order by emp.empid