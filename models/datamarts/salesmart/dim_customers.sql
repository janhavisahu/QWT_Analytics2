{{ config(materialized="table", schema="salesmart") }}

with t_cust as
(
    select * exclude stateprovince
from {{ ref("t_customers") }}
),

lpk_d as
(
    select * from {{ ref("lpk_divisions") }}
),

final as (
    select c.*, d.divisionname
from t_cust c
join lpk_d d on c.divisionid = d.divisionid
)

select * from final
