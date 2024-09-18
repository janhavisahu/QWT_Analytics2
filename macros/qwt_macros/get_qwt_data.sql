{% macro get_order_lineno() -%}

    {% set lineno__query %}
   select Distinct lineno
from {{ ref('stg_order_details')}}
order by lineno
    {% endset %}

    {% set results = run_query(lineno__query) %}

    {% if results %}
        {# Return the first column #}
        {% set results_list = results.columns[0].values() %}
    {% else %} 
    
    {% set results_list = [] %}

    {% endif %}

    {{ return(results_list) }}

{%- endmacro %}

{% macro get_min_orderdate() %}

{% set orderdate_query %}
 
select to_date(min(orderdate))
from {{ ref('stg_orders') }}
 
{% endset %}
 
{% set results = run_query(orderdate_query) %}
 
{% if execute %}
{# Return the first column #}
{% set results_list = results.columns[0][0] %}
{% else %}
{% set results_list = [] %}
{% endif %}
 
{{ return(results_list) }}

{%- endmacro %}

{% macro get_max_orderdate() %}
 
{% set orderdate_query %}
 
select to_date(max(orderdate))
from {{ ref('stg_orders') }}
 
{% endset %}
 
{% set results = run_query(orderdate_query) %}
 
{% if execute %}
{# Return the first column #}
{% set results_list = results.columns[0][0] %}
{% else %}
{% set results_list = [] %}
{% endif %}
 
{{ return(results_list) }}
{%- endmacro %}