WITH source AS (
        SELECT *

        FROM {{ source('thelook_ecommerce', 'order_items') }}
)

SELECT
        id AS order_item_id,
        order_id,
        user_id,
        product_id,
        sale_price as item_sales_price

FROM source