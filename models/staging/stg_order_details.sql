{{ config(materialized="incremental") }}

select od.*, o.orderdate
from {{ source("raw", "order_details") }} as od
inner join {{ ref("stg_orders") }} as o on od.orderid = o.orderid

{% if is_incremental() %}

    where
        o.orderdate >= (select max(orderdate) from {{ this }})

{% endif %}
