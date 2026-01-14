{% macro create_brand_name_udf() %}

    {% set sql %}
        CREATE OR REPLACE FUNCTION {{ target.schema }}.get_brand_name(web_link STRING)
        RETURNS STRING AS (
            REGEXP_EXTRACT(web_link, r'.+/brand/(.+)')
        );
    {% endset %}

    {% do run_query(sql) %}
    {{ log(">>> EXECUTION CHECK: UDF created in " ~ target.schema, info=True) }}

{% endmacro %}