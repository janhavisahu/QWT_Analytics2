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
