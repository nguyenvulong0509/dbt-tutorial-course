WITH order_details AS (
	SELECT
		order_id,
		COUNT(*) as num_of_items_in_order
	FROM {{ ref('stg_ecommerce__order_items') }}
	GROUP BY 1
)

SELECT
	o.order_id,
	o.num_items_ordered,
	od.num_of_items_in_order
FROM {{ ref('stg_ecommerce__orders') }} o
	FULL OUTER JOIN order_details od
		USING (order_id)
WHERE o.order_id IS NULL
	OR od.order_id IS NULL
	OR o.num_items_ordered <> od.num_of_items_in_order