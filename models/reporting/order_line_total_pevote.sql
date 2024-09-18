{{ config(materialized="view", schema="reporting") }}

{% set each_lineno = get_order_lineno() %}

select
    orderid,
    {% for lineno_i in each_lineno %}
        sum(
            case when lineno = {{ lineno_i }} then linesalesamount end
        ) as lineno_{{ lineno_i }}_amount,
    {% endfor %}
    sum(linesalesamount) as total_amount

from {{ ref("t_order_details") }}

group by orderid