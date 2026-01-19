{# This is a comment in Jinja that won't appear in the compiled SQL #}
-- This comment will appear in the compiled SQL

{% set my_long_variable %}
	select 1 as my_col
{% endset %}

{% set my_list = ['user_id', 'created_at'] %}

select
	{%- for item in my_list %}
		{{ item }}{% if not loop.last %}, {% endif %}
	{%- endfor %}