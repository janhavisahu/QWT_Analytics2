{% snapshot snps_shipments %}

{{ config(
    schema = 'snapshot',
    unique_key="ORDERID||'-'||LINENO",
    strategy='check',
    check_cols=['SHIPMENTDATE','PRODUCTID']
)}}

select * from {{ ref('stg_shipments')}} 

{% endsnapshot %}