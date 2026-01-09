{% test primary_key(model, column_name) %}

WITH validation as (
	SELECT
		{{ column_name }} as pk,
		COUNT(1) as occurrences
 	FROM {{ model }}
	GROUP BY 1
)

SELECT
	*
FROM validation
WHERE pk is null or occurrences > 1

{% endtest %}

