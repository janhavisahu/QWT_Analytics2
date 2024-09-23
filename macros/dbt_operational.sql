{% macro grant_privilages(schema, user=test_role) %}

  {% for schema in schemas %}
    grant usage on schema {{ schema }} to "{{ user }}";
    grant select on all tables in schema {{ schema }} to "{{ user }}";
    alter default privileges in schema {{ schema }}
        grant select on tables to "{{ user }}";
  {% endfor %}
{% endmacro %}
