{{ config(materialized="table", schema="transform") }}

select
    get(xmlget(supplier_data, 'SupplierID'), '$')::varchar as id,
    get(xmlget(supplier_data, 'CompanyName'), '$')::varchar as company_name,
    get(xmlget(supplier_data, 'ContactName'), '$')::varchar as contact_name,
    get(xmlget(supplier_data, 'Address'), '$')::varchar as address,
    get(xmlget(supplier_data, 'City'), '$')::varchar as city,
    get(xmlget(supplier_data, 'PostalCode'), '$')::varchar as zip_code,
    get(xmlget(supplier_data, 'Country'), '$')::varchar as country,
    get(xmlget(supplier_data, 'Phone'), '$')::varchar as phone,
    get(xmlget(supplier_data, 'Fax'), '$')::varchar as fax,

from {{ ref("stg_suppliers") }}

