WITH products as (
	SELECT
		product_id,
		department as product_department,
		cost as product_cost,
		retail_price as product_retail_price
	FROM {{ ref('stg_ecommerce__products') }}
)

SELECT
	oi.order_item_id,
	oi.order_id,
	oi.user_id,
	oi.product_id,
	oi.item_sales_price,
	p.product_department,
	p.product_cost,
	p.product_retail_price,
	oi.item_sales_price - p.product_cost AS item_profit,
	p.product_retail_price - oi.item_sales_price AS item_discount
FROM {{ ref('stg_ecommerce__order_items')}} oi
	LEFT JOIN products p
		ON oi.product_id = p.product_id