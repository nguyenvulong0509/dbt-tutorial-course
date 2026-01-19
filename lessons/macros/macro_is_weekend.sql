{%- macro is_weekend(date_column) -%}
extract(dayofweek from ({{ date_column }})) in (1,7)
{%- endmacro -%}