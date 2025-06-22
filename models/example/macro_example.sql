select 
    o.order_id,
    c.customer_id,
    c.customer_name,
    p.product_id,
    p.product_name,
    o.quantity,
    {{get_date_parts('Order_Date')}} as date_extract

from raw.orders o

JOIN
    {{ref('stg-customers')}} c on o.customer_id = c.customer_id
JOIN
    raw.products p on p.product_id = o.product_id

