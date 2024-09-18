{{ config(materialized="table", schema="salesmart") }}

select p."ProductID",
p."ProductName",
c.CategoryName,
p."QuantityPerUnit",
p."UnitPrice",
p."UnitCost",
p."UnitsOnOrder",
p."UnitsInStock",
p."PRODUCTAVAILABILITY",
s.contact_name ,
s.Company_Name,
s.City,
s.Country
from {{ ref("t_products") }} p
join {{ ref("t_suppliers") }} s on p."SupplierID" = s.id

join {{ ref("lpk_categories") }} c on p."CategoryID" = c.categoryid
