{{config(materialized = 'table', schema = 'transform')}}

select *
,iff (("UnitsOnOrder" - "UnitsInStock") > 0 , 'Product is not available','Product is available') as productavailability
from {{ ref("stg_products")}}