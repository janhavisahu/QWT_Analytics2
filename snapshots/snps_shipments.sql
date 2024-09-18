{% snapshot snps_shipments %}

{{ config(
    schema = 'snapshot',
    unique_key="ORDERID||'-'||LINENO",
    strategy='timestamp',
    updated_at='SHIPMENTDATE'
)}}

select * from {{ ref('stg_shipments')}}

{% endsnapshot %}